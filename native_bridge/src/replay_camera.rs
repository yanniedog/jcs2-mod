//! Replay camera-mode state machine (Orbit / Helicopter / GoPro / Trackside).
//!
//! This module is intentionally self-contained: it owns all camera-mode state
//! and operates only on plain data passed in from `lib.rs` (the car world frame
//! and the packed 12-float camera frame). It deliberately does not reach into
//! `lib.rs` internals, so it stays clear of the swarm-replay code that lives in
//! the same crate.
//!
//! The crate is `#![no_std]`, so no trig / `sqrt` from `std` is available. The
//! camera is therefore represented as a *direction vector* on the camera sphere
//! and advanced by small-angle incremental rotation (re-normalised every frame),
//! which needs no transcendental functions.
//!
//! Each mode keeps its own zoom + perspective (per-mode session persistence, per
//! spec): switching modes loads that mode's stored framing, switching back
//! restores yours. The car-mounted modes differ only in how the camera direction
//! is interpreted/advanced each frame:
//!   * Orbit      - world-fixed `DIR`, auto-advanced about the vertical axis.
//!   * Helicopter - world-fixed `DIR`, held constant (world-locked angle).
//!   * GoPro      - `DIR` stored in *car-local* coordinates, re-projected to
//!                  world via the live car basis each frame (car-locked angle).
//!
//! Frame layout (packed, matches `FREE_CAMERA_FRAME` in lib.rs):
//!   right @ 0..3, up @ 3..6, forward @ 6..9, position @ 9..12.

use core::sync::atomic::{AtomicI32, Ordering};

/// Camera modes. Values are the contract with the Java side (`setReplayCameraMode`).
/// `MODE_FREE` is the Java-facing value for the legacy free camera; the native
/// side only checks for the managed modes, so it is otherwise unreferenced.
#[allow(dead_code)]
pub const MODE_FREE: i32 = 0;
pub const MODE_ORBIT: i32 = 1;
pub const MODE_HELICOPTER: i32 = 2;
pub const MODE_GOPRO: i32 = 3;
// Reserved for a later pass (own implementation): Trackside = 4.

// Sizes the per-mode state arrays below. Must be strictly greater than every
// mode value the Java spinner (`ModMenu.REPLAY_CAMERA_MODE_NAMES`) can emit;
// when adding a mode, bump this and add the matching Java name. `mode_index()`
// additionally clamps any out-of-range value to 0, so a mismatch can never
// index out of bounds -- it would only mis-map a mode.
const MODE_COUNT: usize = 5;
// Compile-time guard: the highest implemented mode must own a state slot.
const _: () = assert!((MODE_GOPRO as usize) < MODE_COUNT);

/// One full revolution every ~5 s (72 deg/s). Brisk enough that a whole orbit
/// fits inside the open opening section of a typical replay.
const ORBIT_RATE_RAD_PER_S: f32 = 1.25;
const MIN_RADIUS: f32 = 2.0;
// Keep Orbit close to the car: the buggy is ~2 units long, so 6 units frames
// it large, and a short camera-to-car gap leaves track furniture little room
// to slide between them and occlude the car.
const ORBIT_MIN_RADIUS: f32 = 5.0;
// The Orbit anchor is already projected from the stock replay camera's visual
// centre ray; do not add a mesh-origin correction on top of that or the car
// drifts off the middle of the captured video.
const ORBIT_TARGET_UP_OFFSET: f32 = 0.0;
const ORBIT_TARGET_FWD_OFFSET: f32 = 0.0;
// Initial elevation as an up-component mixed into the horizontal start
// direction: 0.35 => sin ~= 0.33 (~19 deg above the car). Kept low because the
// stunt tracks hang platforms above the route; a high orbit keeps putting the
// camera inside them, while a near-side-on view stays in open air.
const ORBIT_INITIAL_ELEVATION: f32 = 0.35;
const MAX_RADIUS: f32 = 600.0;
/// Keep elevation just short of the poles so the look-at basis never degenerates.
/// sin(83 deg) ~= 0.993.
const ELEVATION_SIN_LIMIT: f32 = 0.993;
/// Per-gesture-step rotation cap; keeps the small-angle approximation accurate.
const MAX_STEP_RAD: f32 = 0.15;

/// Default managed mode is Orbit so the feature is live the moment the replay
/// free-camera is enabled, with no extra menu wiring required yet.
static MODE: AtomicI32 = AtomicI32::new(MODE_ORBIT);

// Per-mode persisted state, indexed by mode value.
//
// Threading model: the game render thread (the `Game::UpdateCamera` hook) calls
// `update()` every frame and is the only writer of the per-frame camera fields;
// the Android UI thread calls `zoom()` / `perspective()` / `reset()` (via JNI)
// to nudge the same per-mode `DIR` / `RADIUS`. Writes are thus effectively
// single-producer per field and are small f32 stores, where a torn read is
// visually negligible and self-corrects on the next frame. `MODE` is atomic so
// the mode swap itself is always observed coherently. This unsynchronised
// `static mut` style deliberately matches the camera-frame convention in lib.rs.
static mut INITIALISED: [bool; MODE_COUNT] = [false; MODE_COUNT];
static mut RADIUS: [f32; MODE_COUNT] = [0.0; MODE_COUNT];
static mut DIR: [[f32; 3]; MODE_COUNT] = [[0.0, 0.0, 1.0]; MODE_COUNT];
// World-fixed vertical/orbit axis captured at activation (Orbit / Helicopter).
static mut UP_REF: [[f32; 3]; MODE_COUNT] = [[0.0, 1.0, 0.0]; MODE_COUNT];
// Captured defaults, restored by reset().
static mut DEFAULT_RADIUS: [f32; MODE_COUNT] = [0.0; MODE_COUNT];
static mut DEFAULT_DIR: [[f32; 3]; MODE_COUNT] = [[0.0, 0.0, 1.0]; MODE_COUNT];
static DIAG_SAMPLES: AtomicI32 = AtomicI32::new(0);
static DIAG_RADIUS_1000: AtomicI32 = AtomicI32::new(0);
static DIAG_INWARD_DOT_1000: AtomicI32 = AtomicI32::new(0);
static DIAG_ORBIT_CHORD_1000: AtomicI32 = AtomicI32::new(0);
static DIAG_DIR_X_1000: AtomicI32 = AtomicI32::new(0);
static DIAG_DIR_Y_1000: AtomicI32 = AtomicI32::new(0);
static DIAG_DIR_Z_1000: AtomicI32 = AtomicI32::new(0);
static mut DIAG_LAST_DIR: [f32; 3] = [0.0; 3];
static mut DIAG_LAST_DIR_VALID: bool = false;

/// Car world frame, supplied by lib.rs from the ghost transform. The basis
/// vectors are the car's local axes expressed in world space.
pub struct CarFrame {
    pub pos: [f32; 3],
    pub right: [f32; 3],
    pub up: [f32; 3],
    pub fwd: [f32; 3],
}

pub fn current_mode() -> i32 {
    MODE.load(Ordering::Acquire)
}

/// True when a car-mounted mode is selected, i.e. the per-frame update owns the
/// camera. (Free and the not-yet-implemented Trackside fall back to legacy.)
pub fn is_managed() -> bool {
    matches!(current_mode(), MODE_ORBIT | MODE_HELICOPTER | MODE_GOPRO)
}

fn mode_index() -> usize {
    let mode = current_mode();
    if mode >= 0 && (mode as usize) < MODE_COUNT {
        mode as usize
    } else {
        0
    }
}

/// Select the active mode. Per-mode state persists, so this just swaps which
/// slot drives the camera; an uninitialised slot seeds itself on its next frame.
pub fn set_mode(mode: i32) {
    MODE.store(mode, Ordering::Release);
}

/// Force re-initialisation of every mode from the next captured frame (call on
/// (re)capture or when leaving the replay).
pub fn invalidate() {
    unsafe {
        // Direct whole-array store: no reference to the mutable static is taken.
        INITIALISED = [false; MODE_COUNT];
        DIAG_LAST_DIR_VALID = false;
    }
    DIAG_SAMPLES.store(0, Ordering::Release);
    DIAG_RADIUS_1000.store(0, Ordering::Release);
    DIAG_INWARD_DOT_1000.store(0, Ordering::Release);
    DIAG_ORBIT_CHORD_1000.store(0, Ordering::Release);
}

/// Double-tap / "Reset camera": restore the active mode's captured default
/// zoom and perspective.
pub fn reset() {
    unsafe {
        let i = mode_index();
        if INITIALISED[i] {
            DIR[i] = DEFAULT_DIR[i];
            RADIUS[i] = DEFAULT_RADIUS[i];
        }
    }
}

/// Zoom gesture: positive `delta` moves the camera closer to the car.
pub fn zoom(delta: f32) {
    unsafe {
        let i = mode_index();
        RADIUS[i] = clamp(
            RADIUS[i] - delta,
            min_radius_for_mode(current_mode()),
            MAX_RADIUS,
        );
    }
}

/// Perspective gesture: move the camera across the sphere surface. `dx` rotates
/// around the vertical axis (azimuth phase), `dy` changes elevation. Both are in
/// radians and capped per call to keep the small-angle rotation accurate.
pub fn perspective(dx: f32, dy: f32) {
    unsafe {
        let i = mode_index();
        // GoPro rotates the car-local direction about local up; the world-fixed
        // modes rotate about the captured world vertical.
        let up_axis = if current_mode() == MODE_GOPRO {
            [0.0, 1.0, 0.0]
        } else {
            UP_REF[i]
        };
        let dx = clamp(dx, -MAX_STEP_RAD, MAX_STEP_RAD);
        let dy = clamp(dy, -MAX_STEP_RAD, MAX_STEP_RAD);
        if dx != 0.0 {
            DIR[i] = rotate_about(DIR[i], up_axis, dx);
        }
        if dy != 0.0 {
            if let Some(right) = normalize(cross(up_axis, DIR[i])) {
                let candidate = rotate_about(DIR[i], right, dy);
                // Clamp elevation so the camera never tips over the pole.
                if abs(dot(candidate, up_axis)) <= ELEVATION_SIN_LIMIT {
                    DIR[i] = candidate;
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
pub fn update(dt: f32, car: &CarFrame, frame: &mut [f32; 12]) -> bool {
    unsafe {
        let mode = current_mode();
        let i = mode_index();
        if !INITIALISED[i] {
            if !init_mode(mode, i, car, frame) {
                return false;
            }
            INITIALISED[i] = true;
        }

        let (world_dir, look_up) = match mode {
            MODE_ORBIT => {
                if dt > 0.0 {
                    let step = clamp(ORBIT_RATE_RAD_PER_S * dt, -MAX_STEP_RAD, MAX_STEP_RAD);
                    DIR[i] = rotate_about(DIR[i], UP_REF[i], step);
                }
                (DIR[i], UP_REF[i])
            }
            MODE_HELICOPTER => (DIR[i], UP_REF[i]),
            // GoPro: DIR[i] is in car-local coords; rebuild world direction and
            // use the car's up so the car keeps a constant pose in frame.
            MODE_GOPRO => (local_to_world(DIR[i], car), car.up),
            _ => return false,
        };

        let world_dir = match normalize(world_dir) {
            Some(d) => d,
            None => return false,
        };
        RADIUS[i] = clamp(RADIUS[i], min_radius_for_mode(mode), MAX_RADIUS);
        let target = camera_target(mode, car);
        let cam_pos = add(target, scale(world_dir, RADIUS[i]));
        // Camera looks straight at the replay car centre on every frame.
        let forward = scale(world_dir, -1.0);
        write_look_at(frame, cam_pos, forward, look_up);
        update_diag(frame, world_dir, target);
        true
    }
}

/// Rebuild the managed camera pose from the CURRENT car frame without
/// advancing the orbit or touching diagnostics. Used to re-pin the camera to
/// the freshest car pose right after the game moves the car (update() may run
/// earlier in the frame than the car update, which would leave the camera one
/// frame behind the rendered car).
pub fn recompute_pose(car: &CarFrame, frame: &mut [f32; 12]) -> bool {
    unsafe {
        let mode = current_mode();
        let i = mode_index();
        if !INITIALISED[i] {
            return false;
        }
        let (world_dir, look_up) = match mode {
            MODE_ORBIT | MODE_HELICOPTER => (DIR[i], UP_REF[i]),
            MODE_GOPRO => (local_to_world(DIR[i], car), car.up),
            _ => return false,
        };
        let world_dir = match normalize(world_dir) {
            Some(d) => d,
            None => return false,
        };
        let target = camera_target(mode, car);
        let cam_pos = add(target, scale(world_dir, RADIUS[i]));
        let forward = scale(world_dir, -1.0);
        write_look_at(frame, cam_pos, forward, look_up);
        true
    }
}

pub fn read_diag(field: i32) -> i32 {
    match field {
        0 => DIAG_SAMPLES.load(Ordering::Acquire),
        1 => DIAG_RADIUS_1000.load(Ordering::Acquire),
        2 => DIAG_INWARD_DOT_1000.load(Ordering::Acquire),
        3 => DIAG_ORBIT_CHORD_1000.load(Ordering::Acquire),
        4 => DIAG_DIR_X_1000.load(Ordering::Acquire),
        5 => DIAG_DIR_Y_1000.load(Ordering::Acquire),
        6 => DIAG_DIR_Z_1000.load(Ordering::Acquire),
        _ => 0,
    }
}

/// Seed radius / direction / up reference for `mode` from the captured camera
/// pose so the managed camera starts exactly where the game camera was.
unsafe fn init_mode(mode: i32, i: usize, car: &CarFrame, frame: &[f32; 12]) -> bool {
    let cam_pos = [frame[9], frame[10], frame[11]];
    let captured_up = match normalize([frame[3], frame[4], frame[5]]) {
        Some(u) => u,
        None => return false,
    };
    let target = camera_target(mode, car);
    let offset = sub(cam_pos, target);
    let captured_world_dir = match normalize(offset) {
        Some(d) => d,
        None => return false,
    };
    // Orbit revolves about WORLD up: the car's own up at capture can be badly
    // tilted (levels start on ramps), which would tilt the whole orbit plane
    // and turn side views into diagonal ones.
    let up_ref = if mode == MODE_ORBIT {
        [0.0, 1.0, 0.0]
    } else {
        captured_up
    };
    let world_dir = if mode == MODE_ORBIT {
        orbit_initial_dir(car).unwrap_or(captured_world_dir)
    } else {
        captured_world_dir
    };
    // Orbit always starts at its close car-framing distance; the other modes
    // keep the captured camera distance so activation is seamless.
    let radius = if mode == MODE_ORBIT {
        ORBIT_MIN_RADIUS
    } else {
        clamp(length(offset), min_radius_for_mode(mode), MAX_RADIUS)
    };

    // GoPro stores the direction in the car's local frame so it tracks the car's
    // orientation; the world-fixed modes store the world direction directly.
    let dir = if mode == MODE_GOPRO {
        [
            dot(world_dir, car.right),
            dot(world_dir, car.up),
            dot(world_dir, car.fwd),
        ]
    } else {
        world_dir
    };
    let dir = normalize(dir).unwrap_or(world_dir);

    UP_REF[i] = up_ref;
    DIR[i] = dir;
    RADIUS[i] = radius;
    DEFAULT_DIR[i] = dir;
    DEFAULT_RADIUS[i] = radius;
    true
}

/// Re-express a car-local direction in world space using the live car basis.
fn local_to_world(local: [f32; 3], car: &CarFrame) -> [f32; 3] {
    add(
        add(scale(car.right, local[0]), scale(car.up, local[1])),
        scale(car.fwd, local[2]),
    )
}

fn min_radius_for_mode(mode: i32) -> f32 {
    if mode == MODE_ORBIT {
        ORBIT_MIN_RADIUS
    } else {
        MIN_RADIUS
    }
}

fn camera_target(mode: i32, car: &CarFrame) -> [f32; 3] {
    if mode == MODE_ORBIT {
        add(
            add(car.pos, scale(car.up, ORBIT_TARGET_UP_OFFSET)),
            scale(car.fwd, ORBIT_TARGET_FWD_OFFSET),
        )
    } else {
        car.pos
    }
}

fn orbit_initial_dir(car: &CarFrame) -> Option<[f32; 3]> {
    normalize(add(
        scale(car.fwd, -1.0),
        scale(car.up, ORBIT_INITIAL_ELEVATION),
    ))
}

fn update_diag(frame: &[f32; 12], world_dir: [f32; 3], target: [f32; 3]) {
    let cam_pos = [frame[9], frame[10], frame[11]];
    let to_car = sub(target, cam_pos);
    let radius = length(to_car);
    let forward = normalize([frame[6], frame[7], frame[8]]).unwrap_or([0.0, 0.0, 1.0]);
    let inward = normalize(to_car).unwrap_or(forward);
    DIAG_SAMPLES.fetch_add(1, Ordering::AcqRel);
    DIAG_RADIUS_1000.store((radius * 1000.0) as i32, Ordering::Release);
    DIAG_INWARD_DOT_1000.store((dot(forward, inward) * 1000.0) as i32, Ordering::Release);
    DIAG_DIR_X_1000.store((world_dir[0] * 1000.0) as i32, Ordering::Release);
    DIAG_DIR_Y_1000.store((world_dir[1] * 1000.0) as i32, Ordering::Release);
    DIAG_DIR_Z_1000.store((world_dir[2] * 1000.0) as i32, Ordering::Release);
    unsafe {
        if DIAG_LAST_DIR_VALID {
            let chord = length(sub(world_dir, DIAG_LAST_DIR));
            DIAG_ORBIT_CHORD_1000.fetch_add((chord * 1000.0) as i32, Ordering::AcqRel);
        }
        DIAG_LAST_DIR = world_dir;
        DIAG_LAST_DIR_VALID = true;
    }
}

/// Build an orthonormal camera basis that looks along `forward`, keeping `up_ref`
/// as the up reference. Engine handedness: right = up x forward, up = forward x right.
fn write_look_at(frame: &mut [f32; 12], cam_pos: [f32; 3], forward: [f32; 3], up_ref: [f32; 3]) {
    let forward = normalize(forward).unwrap_or([0.0, 0.0, 1.0]);
    let cam_up = sub(up_ref, scale(forward, dot(up_ref, forward)));
    let cam_up = normalize(cam_up).unwrap_or(up_ref);
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
