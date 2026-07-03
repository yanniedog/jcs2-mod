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
//!   right @ 0..3, up @ 3..6, OUTWARD axis @ 6..9 (the engine's RH view looks
//!   along minus this row -- see write_look_at), position @ 9..12.

use core::sync::atomic::{AtomicI32, Ordering};

/// Camera modes. Values are the contract with the Java side (`setReplayCameraMode`).
/// `MODE_FREE` is the Java-facing value for the legacy free camera; the native
/// side only checks for the managed modes, so it is otherwise unreferenced.
#[allow(dead_code)]
pub const MODE_FREE: i32 = 0;
pub const MODE_ORBIT: i32 = 1;
pub const MODE_HELICOPTER: i32 = 2;
pub const MODE_GOPRO: i32 = 3;
/// F1-style static trackside cameras: the camera sits still on the track and
/// pans to follow the car; when the car travels out of range a new camera is
/// placed ahead of it (alternating sides) and the view cuts there.
pub const MODE_TRACKSIDE: i32 = 4;

// Sizes the per-mode state arrays below. Must be strictly greater than every
// mode value the Java spinner (`ModMenu.REPLAY_CAMERA_MODE_NAMES`) can emit;
// when adding a mode, bump this and add the matching Java name. `mode_index()`
// additionally clamps any out-of-range value to 0, so a mismatch can never
// index out of bounds -- it would only mis-map a mode.
const MODE_COUNT: usize = 5;
// Compile-time guard: the highest implemented mode must own a state slot.
const _: () = assert!((MODE_TRACKSIDE as usize) < MODE_COUNT);

/// Default orbit rate: one full revolution every ~5 s (72 deg/s). Brisk enough
/// that a whole orbit fits inside the open opening section of a typical replay.
/// User-tunable via `configure_orbit` (mod menu slider).
const ORBIT_DEFAULT_RATE_MRAD_PER_S: i32 = 1250;
const MIN_RADIUS: f32 = 2.0;
// Default orbit stand-off distance. The buggy is ~2 units long, so this frames
// it clearly while sitting far enough out that the camera clears the immediate
// track tube walls -- at a very short radius the camera orbits INSIDE the
// half-pipe track and its own surface occludes the car from most angles.
// User-tunable via `configure_orbit` (mod menu slider).
const ORBIT_DEFAULT_RADIUS_1000: i32 = 8000;
/// Hard zoom floor for Orbit regardless of the configured radius.
const ORBIT_MIN_RADIUS: f32 = 3.0;
// The Orbit anchor is already projected from the stock replay camera's visual
// centre ray; do not add a mesh-origin correction on top of that or the car
// drifts off the middle of the captured video.
const ORBIT_TARGET_UP_OFFSET: f32 = 0.0;
const ORBIT_TARGET_FWD_OFFSET: f32 = 0.0;
// Default elevation angle above the car, stored as sin(angle) x1000.
// sin(42 deg) ~= 0.669. Runtime filmstrips at ~27 deg showed the course's slab
// walls occluding the car from most azimuths at the close orbit radius; the
// steeper down-angle looks over the near track lip onto the car without
// climbing into the platforms overhead. User-tunable via `configure_orbit`.
const ORBIT_DEFAULT_ELEV_SIN_1000: i32 = 669;
// Trackside placement defaults (all user-tunable via `configure_trackside`):
// side selection (0 alternate, 1 left, 2 right), lateral offset from the
// car's path, height above the track, placement distance ahead of the car
// (the MINIMUM the car starts from a fresh camera), and the switch threshold
// (the MAXIMUM distance from the camera before cutting to the next one).
const TRACKSIDE_SIDE_ALTERNATE: i32 = 0;
const TRACKSIDE_SIDE_LEFT: i32 = 1;
const TRACKSIDE_DEFAULT_SIDE_DIST_1000: i32 = 11_000;
const TRACKSIDE_DEFAULT_HEIGHT_1000: i32 = 7_000;
const TRACKSIDE_DEFAULT_MIN_DIST_1000: i32 = 35_000;
const TRACKSIDE_DEFAULT_MAX_DIST_1000: i32 = 55_000;
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
// User-configurable Orbit tuning (mod menu sliders), stored x1000 so plain
// atomics carry them across the JNI/UI thread boundary.
static ORBIT_RADIUS_1000: AtomicI32 = AtomicI32::new(ORBIT_DEFAULT_RADIUS_1000);
static ORBIT_RATE_MRAD_PER_S: AtomicI32 = AtomicI32::new(ORBIT_DEFAULT_RATE_MRAD_PER_S);
static ORBIT_ELEV_SIN_1000: AtomicI32 = AtomicI32::new(ORBIT_DEFAULT_ELEV_SIN_1000);
// Trackside static-camera state: current camera world position, whether it is
// live, and which side of the car the next camera is placed on.
static mut TRACKSIDE_CAM: [f32; 3] = [0.0; 3];
static mut TRACKSIDE_VALID: bool = false;
static mut TRACKSIDE_SIDE: f32 = 1.0;
// User-configurable Trackside tuning (mod menu), x1000 atomics.
static TRACKSIDE_SIDE_MODE: AtomicI32 = AtomicI32::new(TRACKSIDE_SIDE_ALTERNATE);
static TRACKSIDE_SIDE_DIST_1000: AtomicI32 = AtomicI32::new(TRACKSIDE_DEFAULT_SIDE_DIST_1000);
static TRACKSIDE_HEIGHT_1000: AtomicI32 = AtomicI32::new(TRACKSIDE_DEFAULT_HEIGHT_1000);
static TRACKSIDE_MIN_DIST_1000: AtomicI32 = AtomicI32::new(TRACKSIDE_DEFAULT_MIN_DIST_1000);
static TRACKSIDE_MAX_DIST_1000: AtomicI32 = AtomicI32::new(TRACKSIDE_DEFAULT_MAX_DIST_1000);
// Mode auto-cycling: dwell milliseconds per mode, elapsed accumulator.
static CYCLE_ENABLED: AtomicI32 = AtomicI32::new(0);
static CYCLE_DWELL_MS: AtomicI32 = AtomicI32::new(10_000);
static mut CYCLE_ACCUM_MS: f32 = 0.0;
/// Cycle order: each dwell period hops to the next managed mode, so one replay
/// shows every camera style using that mode's own configuration.
const CYCLE_ORDER: [i32; 4] = [MODE_ORBIT, MODE_HELICOPTER, MODE_GOPRO, MODE_TRACKSIDE];
static DIAG_SAMPLES: AtomicI32 = AtomicI32::new(0);
static DIAG_RADIUS_1000: AtomicI32 = AtomicI32::new(0);
static DIAG_INWARD_DOT_1000: AtomicI32 = AtomicI32::new(0);
static DIAG_ORBIT_CHORD_1000: AtomicI32 = AtomicI32::new(0);
static DIAG_DIR_X_1000: AtomicI32 = AtomicI32::new(0);
static DIAG_DIR_Y_1000: AtomicI32 = AtomicI32::new(0);
static DIAG_DIR_Z_1000: AtomicI32 = AtomicI32::new(0);
static mut DIAG_LAST_DIR: [f32; 3] = [0.0; 3];
static mut DIAG_LAST_DIR_VALID: bool = false;
// Ground-truth probe state: the exact target position and radius used by the
// most recent pose write (update() or recompute_pose()), so the orbit probe
// can compare what the math produced against what the camera object holds.
static mut LAST_WRITE_TARGET: [f32; 3] = [0.0; 3];
static LAST_WRITE_RADIUS_1000: AtomicI32 = AtomicI32::new(-1);

pub fn last_write_target() -> [f32; 3] {
    unsafe { LAST_WRITE_TARGET }
}

pub fn last_write_radius_1000() -> i32 {
    LAST_WRITE_RADIUS_1000.load(Ordering::Acquire)
}

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
    matches!(
        current_mode(),
        MODE_ORBIT | MODE_HELICOPTER | MODE_GOPRO | MODE_TRACKSIDE
    )
}

/// Modes that must anchor on the exact drawn-car body pose (dead-centre
/// framing); the anchor chooser in free_camera.rs consults this. ALL managed
/// modes need it: the passive viewer exposes no live car/ghost transform, so
/// the chase-ray candidate scoring returns nothing there and Helicopter/GoPro
/// would never track the car (they also need the real car BASIS, which only
/// the body MFrame provides).
pub fn anchors_on_body() -> bool {
    is_managed()
}

/// Cinematic slow-motion is an Orbit-only effect: a full revolution then fits
/// each open section of the route. Trackside wants real-time speed for the
/// F1 fly-by feel, and Helicopter/GoPro read better at real speed too.
pub fn wants_slow_motion() -> bool {
    current_mode() == MODE_ORBIT
}

/// Apply the mod-menu Orbit tuning: stand-off radius (world units), rotation
/// speed (degrees/second) and camera height (elevation angle above the car,
/// degrees). The orbit slot re-seeds on its next frame so new values take
/// effect immediately.
pub fn configure_orbit(radius_units: i32, deg_per_s: i32, elev_deg: i32) {
    let radius = clamp(radius_units as f32, ORBIT_MIN_RADIUS, MAX_RADIUS);
    let rate_mrad = (clamp(deg_per_s as f32, 0.0, 360.0) * 17.453_293) as i32;
    let elev_rad = clamp(elev_deg as f32, 5.0, 83.0) * 0.017_453_3;
    ORBIT_RADIUS_1000.store((radius * 1000.0) as i32, Ordering::Release);
    ORBIT_RATE_MRAD_PER_S.store(rate_mrad, Ordering::Release);
    ORBIT_ELEV_SIN_1000.store((sin_approx(elev_rad) * 1000.0) as i32, Ordering::Release);
    unsafe {
        INITIALISED[MODE_ORBIT as usize] = false;
    }
}

fn orbit_radius() -> f32 {
    ORBIT_RADIUS_1000.load(Ordering::Acquire) as f32 / 1000.0
}

fn orbit_rate_rad_per_s() -> f32 {
    ORBIT_RATE_MRAD_PER_S.load(Ordering::Acquire) as f32 / 1000.0
}

fn orbit_elevation_sin() -> f32 {
    clamp(
        ORBIT_ELEV_SIN_1000.load(Ordering::Acquire) as f32 / 1000.0,
        0.05,
        ELEVATION_SIN_LIMIT,
    )
}

/// Apply the mod-menu Trackside tuning: side selection (0 alternate, 1 left,
/// 2 right), lateral offset and height (world units), placement-ahead (min)
/// distance and switch (max) distance. Max is kept at least 10 units beyond
/// min so a fresh camera can never be instantly out of range.
pub fn configure_trackside(side_mode: i32, side_dist: i32, height: i32, min_d: i32, max_d: i32) {
    let side_mode = clamp(side_mode as f32, 0.0, 2.0) as i32;
    let side = clamp(side_dist as f32, 1.0, 60.0);
    let height = clamp(height as f32, 0.0, 60.0);
    let min_d = clamp(min_d as f32, 5.0, 250.0);
    let max_d = clamp(max_d as f32, min_d + 10.0, 400.0);
    TRACKSIDE_SIDE_MODE.store(side_mode, Ordering::Release);
    TRACKSIDE_SIDE_DIST_1000.store((side * 1000.0) as i32, Ordering::Release);
    TRACKSIDE_HEIGHT_1000.store((height * 1000.0) as i32, Ordering::Release);
    TRACKSIDE_MIN_DIST_1000.store((min_d * 1000.0) as i32, Ordering::Release);
    TRACKSIDE_MAX_DIST_1000.store((max_d * 1000.0) as i32, Ordering::Release);
    unsafe {
        TRACKSIDE_VALID = false;
    }
}

fn ts_param(atom: &AtomicI32) -> f32 {
    atom.load(Ordering::Acquire) as f32 / 1000.0
}

/// Enable/disable camera-mode auto-cycling and set the per-mode dwell seconds.
pub fn configure_cycle(enabled: bool, seconds: i32) {
    CYCLE_ENABLED.store(enabled as i32, Ordering::Release);
    let secs = clamp(seconds as f32, 3.0, 120.0);
    CYCLE_DWELL_MS.store((secs * 1000.0) as i32, Ordering::Release);
    unsafe {
        CYCLE_ACCUM_MS = 0.0;
    }
}

/// Advance the cycle clock; hop to the next managed mode when the dwell
/// elapses. Called once per managed-camera frame.
fn advance_cycle(dt: f32) {
    if CYCLE_ENABLED.load(Ordering::Acquire) == 0 || !(dt > 0.0) {
        return;
    }
    unsafe {
        CYCLE_ACCUM_MS += dt * 1000.0;
        if CYCLE_ACCUM_MS < CYCLE_DWELL_MS.load(Ordering::Acquire) as f32 {
            return;
        }
        CYCLE_ACCUM_MS = 0.0;
        let mode = current_mode();
        let at = CYCLE_ORDER.iter().position(|&m| m == mode).unwrap_or(0);
        set_mode(CYCLE_ORDER[(at + 1) % CYCLE_ORDER.len()]);
    }
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
        TRACKSIDE_VALID = false;
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
            TRACKSIDE_VALID = false;
        }
    }
}

/// Zoom gesture: positive `delta` moves the camera closer to the car.
/// Trackside is configured in the mod menu instead; its cameras have no
/// meaningful zoom radius.
pub fn zoom(delta: f32) {
    unsafe {
        if current_mode() == MODE_TRACKSIDE {
            return;
        }
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
        // Trackside cameras are static by definition; dragging one across the
        // sphere makes no sense, so perspective gestures are ignored there.
        if current_mode() == MODE_TRACKSIDE {
            return;
        }
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
    advance_cycle(dt);
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
                    let step = clamp(orbit_rate_rad_per_s() * dt, -MAX_STEP_RAD, MAX_STEP_RAD);
                    DIR[i] = rotate_azimuth_preserving_elevation(DIR[i], UP_REF[i], step);
                }
                (DIR[i], UP_REF[i])
            }
            MODE_HELICOPTER => (DIR[i], UP_REF[i]),
            // GoPro: DIR[i] is in car-local coords; rebuild world direction and
            // use the car's up so the car keeps a constant pose in frame.
            MODE_GOPRO => (local_to_world(DIR[i], car), car.up),
            // Trackside: keep the camera parked; when the car travels past the
            // configured MAX distance, place a fresh camera MIN distance ahead
            // of it (on the configured side, at the configured lateral offset
            // and height) and cut there.
            MODE_TRACKSIDE => {
                let max_d = ts_param(&TRACKSIDE_MAX_DIST_1000);
                let out_of_range = !TRACKSIDE_VALID || length(sub(TRACKSIDE_CAM, car.pos)) > max_d;
                if out_of_range {
                    let up = UP_REF[i];
                    let fwd_h = horizontal_dir(car.fwd, up)
                        .or_else(|| horizontal_dir(car.right, up))
                        .unwrap_or([1.0, 0.0, 0.0]);
                    let right_h = normalize(cross(up, fwd_h)).unwrap_or([fwd_h[2], 0.0, -fwd_h[0]]);
                    TRACKSIDE_SIDE = match TRACKSIDE_SIDE_MODE.load(Ordering::Acquire) {
                        TRACKSIDE_SIDE_LEFT => 1.0,
                        2 => -1.0,
                        _ => -TRACKSIDE_SIDE,
                    };
                    TRACKSIDE_CAM = add(
                        add(
                            add(car.pos, scale(fwd_h, ts_param(&TRACKSIDE_MIN_DIST_1000))),
                            scale(
                                right_h,
                                ts_param(&TRACKSIDE_SIDE_DIST_1000) * TRACKSIDE_SIDE,
                            ),
                        ),
                        scale(up, ts_param(&TRACKSIDE_HEIGHT_1000)),
                    );
                    TRACKSIDE_VALID = true;
                }
                (sub(TRACKSIDE_CAM, car.pos), UP_REF[i])
            }
            _ => return false,
        };

        let world_dir = match normalize(world_dir) {
            Some(d) => d,
            None => return false,
        };
        RADIUS[i] = clamp(RADIUS[i], min_radius_for_mode(mode), MAX_RADIUS);
        let target = camera_target(mode, car);
        // Trackside sits at its fixed post, whatever the distance to the car
        // currently is; the sphere modes hold their configured radius.
        let cam_radius = if mode == MODE_TRACKSIDE {
            length(sub(TRACKSIDE_CAM, target)).max(1.0)
        } else {
            RADIUS[i]
        };
        let cam_pos = add(target, scale(world_dir, cam_radius));
        LAST_WRITE_TARGET = target;
        LAST_WRITE_RADIUS_1000.store((cam_radius * 1000.0) as i32, Ordering::Release);
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
            MODE_TRACKSIDE => {
                if !TRACKSIDE_VALID {
                    return false;
                }
                (sub(TRACKSIDE_CAM, car.pos), UP_REF[i])
            }
            _ => return false,
        };
        let world_dir = match normalize(world_dir) {
            Some(d) => d,
            None => return false,
        };
        let target = camera_target(mode, car);
        let cam_radius = if mode == MODE_TRACKSIDE {
            length(sub(TRACKSIDE_CAM, target)).max(1.0)
        } else {
            RADIUS[i]
        };
        let cam_pos = add(target, scale(world_dir, cam_radius));
        LAST_WRITE_TARGET = target;
        LAST_WRITE_RADIUS_1000.store((cam_radius * 1000.0) as i32, Ordering::Release);
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
    // and turn side views into diagonal ones. Trackside cameras stand on the
    // track, so they use world up too.
    let up_ref = if mode == MODE_ORBIT || mode == MODE_TRACKSIDE {
        [0.0, 1.0, 0.0]
    } else {
        captured_up
    };
    if mode == MODE_TRACKSIDE {
        TRACKSIDE_VALID = false;
    }
    let world_dir = if mode == MODE_ORBIT {
        orbit_initial_dir(car).unwrap_or(captured_world_dir)
    } else {
        captured_world_dir
    };
    // Orbit always starts at its configured car-framing distance; the other
    // modes keep the captured camera distance so activation is seamless.
    // (Trackside ignores its RADIUS slot entirely.)
    let radius = if mode == MODE_ORBIT {
        orbit_radius()
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

/// Start direction behind the car, mixed with the configured elevation angle:
/// up-component sin(theta), horizontal component cos(theta).
fn orbit_initial_dir(car: &CarFrame) -> Option<[f32; 3]> {
    let s = orbit_elevation_sin();
    let h_sq = 1.0 - s * s;
    let h = if h_sq > 0.0 {
        h_sq * fast_inv_sqrt(h_sq)
    } else {
        0.0
    };
    normalize(add(scale(car.fwd, -h), scale(car.up, s)))
}

/// Project `v` onto the plane perpendicular to `up` and normalise.
fn horizontal_dir(v: [f32; 3], up: [f32; 3]) -> Option<[f32; 3]> {
    normalize(sub(v, scale(up, dot(v, up))))
}

/// Taylor sine, accurate to <0.5% over the 0..1.45 rad range used by the
/// elevation slider (`#![no_std]`, so no libm).
fn sin_approx(x: f32) -> f32 {
    let x2 = x * x;
    x * (1.0 - x2 / 6.0 * (1.0 - x2 / 20.0))
}

fn update_diag(frame: &[f32; 12], world_dir: [f32; 3], target: [f32; 3]) {
    let cam_pos = [frame[9], frame[10], frame[11]];
    let to_car = sub(target, cam_pos);
    let radius = length(to_car);
    // Row 2 stores the OUTWARD axis (see write_look_at); the look direction the
    // render uses is its negation.
    let forward = normalize([-frame[6], -frame[7], -frame[8]]).unwrap_or([0.0, 0.0, 1.0]);
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

/// Build an orthonormal camera basis that LOOKS ALONG `forward` (toward the
/// car), keeping `up_ref` as the up reference.
///
/// Engine convention (verified in libtrueaxis disassembly): the camera MFrame
/// rows go straight into GL modelview columns (MFrame::GetOpenGlMatrix) and
/// the projection is a standard right-handed GL frustum (glFrustumf emulation
/// stores m11 = -1), so the view looks along MINUS row 2. Row 2 must therefore
/// hold the OUTWARD direction (eye minus target), exactly like gluLookAt's
/// third row. Storing the toward-target direction here renders the view facing
/// directly away from the car -- the original "orbit exists only in the
/// diagnostics" bug.
fn write_look_at(frame: &mut [f32; 12], cam_pos: [f32; 3], forward: [f32; 3], up_ref: [f32; 3]) {
    let f = normalize(forward).unwrap_or([0.0, 0.0, 1.0]);
    // gluLookAt: side = f x up, up' = side x f, view basis = (side, up', -f).
    let right = normalize(cross(f, up_ref)).unwrap_or([1.0, 0.0, 0.0]);
    let up = normalize(cross(right, f)).unwrap_or(up_ref);
    let outward = scale(f, -1.0);

    frame[0] = right[0];
    frame[1] = right[1];
    frame[2] = right[2];
    frame[3] = up[0];
    frame[4] = up[1];
    frame[5] = up[2];
    frame[6] = outward[0];
    frame[7] = outward[1];
    frame[8] = outward[2];
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

/// Advance `v`'s azimuth about `up` by small `angle` while keeping its
/// elevation (the `up` component) EXACTLY constant. The plain `rotate_about` +
/// renormalise bleeds the up component a little every step (the first-order
/// tangent grows the vector only horizontally, so normalising shrinks the
/// vertical share); over a long auto-orbit that decayed the camera's ~27 deg
/// down-angle to near-horizontal, dropping it behind track lips. Rebuilding
/// from the stored elevation removes the drift entirely.
fn rotate_azimuth_preserving_elevation(v: [f32; 3], up: [f32; 3], angle: f32) -> [f32; 3] {
    let e = dot(v, up);
    let horizontal = sub(v, scale(up, e));
    let stepped = add(horizontal, scale(cross(up, horizontal), angle));
    let h_unit = match normalize(stepped) {
        Some(h) => h,
        None => return v, // at the pole: nothing to rotate
    };
    let h_len_sq = 1.0 - e * e;
    if h_len_sq <= 0.0 {
        return v;
    }
    let h_len = h_len_sq * fast_inv_sqrt(h_len_sq);
    normalize(add(scale(h_unit, h_len), scale(up, e))).unwrap_or(v)
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
