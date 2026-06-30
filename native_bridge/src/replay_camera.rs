//! Replay camera-mode state machine (Orbit / Helicopter / GoPro / Trackside).
//!
//! This module is intentionally self-contained: it owns all camera-mode state
//! and operates only on plain data passed in from `lib.rs` (the car world
//! position and the packed 12-float camera frame). It deliberately does not
//! reach into `lib.rs` internals, so it stays clear of the swarm-replay code
//! that lives in the same crate.
//!
//! The crate is `#![no_std]`, so no trig / `sqrt` from `std` is available. The
//! orbit is therefore represented as a *direction vector* on the camera sphere
//! and advanced by small-angle incremental rotation (re-normalised every frame),
//! which needs no transcendental functions.
//!
//! Frame layout (packed, matches `FREE_CAMERA_FRAME` in lib.rs):
//!   right @ 0..3, up @ 3..6, forward @ 6..9, position @ 9..12.

use core::sync::atomic::{AtomicI32, Ordering};

/// Camera modes. Values are the contract with the Java side (`setReplayCameraMode`).
pub const MODE_FREE: i32 = 0;
pub const MODE_ORBIT: i32 = 1;
// Reserved for later passes: Helicopter = 2, GoPro = 3, Trackside = 4.

/// One full revolution every 10 s => 36 deg/s = TAU / 10 rad/s.
const ORBIT_RATE_RAD_PER_S: f32 = 0.628_318_55;
const MIN_RADIUS: f32 = 2.0;
const MAX_RADIUS: f32 = 600.0;
/// Keep elevation just short of the poles so the look-at basis never degenerates.
/// sin(83 deg) ~= 0.993.
const ELEVATION_SIN_LIMIT: f32 = 0.993;
/// Per-gesture-step rotation cap; keeps the small-angle approximation accurate.
const MAX_STEP_RAD: f32 = 0.15;

/// Default managed mode is Orbit so the feature is live the moment the replay
/// free-camera is enabled, with no extra menu wiring required yet.
static MODE: AtomicI32 = AtomicI32::new(MODE_ORBIT);

// Persisted per-session state. Single-writer-per-field in practice (gesture
// thread writes dir/radius, render thread advances dir); matches the static-mut
// convention already used for the camera frame in lib.rs.
static mut INITIALISED: bool = false;
static mut RADIUS: f32 = 0.0;
static mut DIR: [f32; 3] = [0.0, 0.0, 1.0]; // unit vector car -> camera
static mut UP_REF: [f32; 3] = [0.0, 1.0, 0.0]; // world-fixed orbit axis, captured once

// Captured defaults, restored by reset().
static mut DEFAULT_RADIUS: f32 = 0.0;
static mut DEFAULT_DIR: [f32; 3] = [0.0, 0.0, 1.0];

pub fn current_mode() -> i32 {
    MODE.load(Ordering::Acquire)
}

/// True when a mode other than Free is selected, i.e. the per-frame update owns
/// the camera.
pub fn is_managed() -> bool {
    current_mode() != MODE_FREE
}

pub fn set_mode(mode: i32) {
    MODE.store(mode, Ordering::Release);
    invalidate();
}

/// Force re-initialisation from the next captured frame (call on (re)capture or
/// when leaving the replay).
pub fn invalidate() {
    unsafe {
        INITIALISED = false;
    }
}

/// Double-tap / "Reset camera": restore the captured default zoom and perspective.
pub fn reset() {
    unsafe {
        if INITIALISED {
            DIR = DEFAULT_DIR;
            RADIUS = DEFAULT_RADIUS;
        }
    }
}

/// Zoom gesture: positive `delta` moves the camera closer to the car.
pub fn zoom(delta: f32) {
    unsafe {
        RADIUS = clamp(RADIUS - delta, MIN_RADIUS, MAX_RADIUS);
    }
}

/// Perspective gesture: move the camera across the sphere surface. `dx` rotates
/// around the vertical axis (azimuth phase), `dy` changes elevation. Both are in
/// radians and capped per call to keep the small-angle rotation accurate.
pub fn perspective(dx: f32, dy: f32) {
    unsafe {
        let dx = clamp(dx, -MAX_STEP_RAD, MAX_STEP_RAD);
        let dy = clamp(dy, -MAX_STEP_RAD, MAX_STEP_RAD);
        if dx != 0.0 {
            DIR = rotate_about(DIR, UP_REF, dx);
        }
        if dy != 0.0 {
            if let Some(right) = normalize(cross(UP_REF, DIR)) {
                let candidate = rotate_about(DIR, right, dy);
                // Clamp elevation so the camera never tips over the pole.
                if abs(dot(candidate, UP_REF)) <= ELEVATION_SIN_LIMIT {
                    DIR = candidate;
                }
            }
        }
    }
}

/// Advance and write the managed camera for this frame.
///
/// `frame` holds the freshly captured game-camera pose on the first call after
/// activation; afterwards this function fully owns it. Returns `true` if it
/// wrote a valid frame.
pub fn update(dt: f32, car_pos: [f32; 3], frame: &mut [f32; 12]) -> bool {
    unsafe {
        if !INITIALISED {
            if !init_from_frame(car_pos, frame) {
                return false;
            }
            INITIALISED = true;
        }

        // Only Orbit auto-advances; Helicopter/GoPro (later) hold the phase.
        if current_mode() == MODE_ORBIT && dt > 0.0 {
            let step = clamp(ORBIT_RATE_RAD_PER_S * dt, -MAX_STEP_RAD, MAX_STEP_RAD);
            DIR = rotate_about(DIR, UP_REF, step);
        }

        let cam_pos = add(car_pos, scale(DIR, RADIUS));
        // Camera looks straight at the car centre => car is pinned to frame centre.
        let forward = scale(DIR, -1.0);
        write_look_at(frame, cam_pos, forward);
        true
    }
}

/// Seed radius / direction / up reference from the captured camera pose so the
/// managed camera starts exactly where the game camera was (no visible jump).
unsafe fn init_from_frame(car_pos: [f32; 3], frame: &[f32; 12]) -> bool {
    let cam_pos = [frame[9], frame[10], frame[11]];
    let frame_up = [frame[3], frame[4], frame[5]];

    let up = match normalize(frame_up) {
        Some(u) => u,
        None => return false,
    };
    let offset = sub(cam_pos, car_pos);
    let radius = length(offset);
    let dir = match normalize(offset) {
        Some(d) => d,
        None => return false,
    };

    UP_REF = up;
    DIR = dir;
    RADIUS = clamp(radius, MIN_RADIUS, MAX_RADIUS);
    DEFAULT_DIR = dir;
    DEFAULT_RADIUS = RADIUS;
    true
}

/// Build an orthonormal camera basis that looks along `forward`, keeping the
/// captured world up. Engine handedness: right = up x forward, up = forward x right.
unsafe fn write_look_at(frame: &mut [f32; 12], cam_pos: [f32; 3], forward: [f32; 3]) {
    let forward = normalize(forward).unwrap_or([0.0, 0.0, 1.0]);
    let cam_up = sub(UP_REF, scale(forward, dot(UP_REF, forward)));
    let cam_up = normalize(cam_up).unwrap_or(UP_REF);
    let right = normalize(cross(cam_up, forward)).unwrap_or([1.0, 0.0, 0.0]);
    let up = normalize(cross(forward, right)).unwrap_or(cam_up);

    frame[0] = right[0];
    frame[1] = right[1];
    frame[2] = right[2];
    frame[3] = up[0];
    frame[4] = up[1];
    frame[5] = up[2];
    frame[6] = forward[0];
    frame[7] = forward[1];
    frame[8] = forward[2];
    frame[9] = cam_pos[0];
    frame[10] = cam_pos[1];
    frame[11] = cam_pos[2];
}

/// Rotate unit vector `v` about unit `axis` by small `angle` (radians), first
/// order, then re-normalise. Accurate for the small per-frame / per-gesture
/// steps used here; needs no trig.
fn rotate_about(v: [f32; 3], axis: [f32; 3], angle: f32) -> [f32; 3] {
    let tangent = cross(axis, v);
    let stepped = add(v, scale(tangent, angle));
    normalize(stepped).unwrap_or(v)
}

// --- small vector helpers (kept local so this module has no lib.rs deps) ---

fn add(a: [f32; 3], b: [f32; 3]) -> [f32; 3] {
    [a[0] + b[0], a[1] + b[1], a[2] + b[2]]
}

fn sub(a: [f32; 3], b: [f32; 3]) -> [f32; 3] {
    [a[0] - b[0], a[1] - b[1], a[2] - b[2]]
}

fn scale(a: [f32; 3], s: f32) -> [f32; 3] {
    [a[0] * s, a[1] * s, a[2] * s]
}

fn dot(a: [f32; 3], b: [f32; 3]) -> f32 {
    a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
}

fn cross(a: [f32; 3], b: [f32; 3]) -> [f32; 3] {
    [
        a[1] * b[2] - a[2] * b[1],
        a[2] * b[0] - a[0] * b[2],
        a[0] * b[1] - a[1] * b[0],
    ]
}

fn length(a: [f32; 3]) -> f32 {
    let len_sq = dot(a, a);
    if len_sq <= 1.0e-12 || !len_sq.is_finite() {
        return 0.0;
    }
    len_sq * fast_inv_sqrt(len_sq)
}

fn normalize(a: [f32; 3]) -> Option<[f32; 3]> {
    let len_sq = dot(a, a);
    if !(len_sq > 1.0e-12) || !len_sq.is_finite() {
        return None;
    }
    let inv = fast_inv_sqrt(len_sq);
    Some([a[0] * inv, a[1] * inv, a[2] * inv])
}

/// Fast inverse square root with two Newton iterations (mirrors the approach
/// already used in lib.rs to avoid the std `sqrt`).
fn fast_inv_sqrt(value: f32) -> f32 {
    let x2 = value * 0.5;
    let mut bits = value.to_bits();
    bits = 0x5f37_59df - (bits >> 1);
    let mut estimate = f32::from_bits(bits);
    estimate *= 1.5 - x2 * estimate * estimate;
    estimate *= 1.5 - x2 * estimate * estimate;
    estimate
}

fn abs(value: f32) -> f32 {
    if value < 0.0 {
        -value
    } else {
        value
    }
}

fn clamp(value: f32, lo: f32, hi: f32) -> f32 {
    if value < lo {
        lo
    } else if value > hi {
        hi
    } else {
        value
    }
}
