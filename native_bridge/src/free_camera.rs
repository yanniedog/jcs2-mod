//! Replay free camera and the managed camera modes (Orbit/Helicopter/GoPro):
//! camera frame math, anchor selection, and the Game/Camera update hooks.
//! Mode state itself lives in `replay_camera`.

use crate::replay_camera;
use crate::*;

pub(crate) const GAME_CURRENT_CAR_OFFSET: usize = 0xb0;

/// Pointer to the car's physics body inside the Car object (Car::MoveToGround /
/// UpdateShadow both deref `car + 0x158`).
pub(crate) const CAR_BODY_PTR_OFFSET: usize = 0x158;

/// The body's CURRENT world transform (TA::MFrame, written by
/// TA::DynamicObject::SetFrame): basis rows at byte 0x1c0/0x1d0/0x1e0 (stride
/// 0x10), translation at byte 0x1f0.
pub(crate) const CAR_BODY_RIGHT_FLOAT: usize = 0x1c0 / 4;

pub(crate) const CAR_BODY_UP_FLOAT: usize = 0x1d0 / 4;

pub(crate) const CAR_BODY_FWD_FLOAT: usize = 0x1e0 / 4;

pub(crate) const CAR_BODY_POS_FLOAT: usize = 0x1f0 / 4;

/// When non-zero, `Car::Render(false)` early-outs without drawing the mesh
/// (the viewer marks replay cars this way; use `Car::RenderGhost` instead).
pub(crate) const CAR_GHOST_MODE_FLAG_OFFSET: usize = 0x20d;

pub(crate) const GAME_UPDATE_CAMERA_HOOK_BYTES: usize = 16;

pub(crate) const GAME_START_LEVEL_INTRO_HOOK_BYTES: usize = 16;

pub(crate) const CAMERA_PATH_UPDATE_HOOK_BYTES: usize = 16;

pub(crate) const CAR_RENDER_GHOST_HOOK_BYTES: usize = 16;

pub(crate) const CAMERA_UPDATE_HOOK_BYTES: usize = 16;

pub(crate) const GAME_RENDER_HOOK_BYTES: usize = 16;

pub(crate) const GAME_RENDER_ENTRY_HOOK_BYTES: usize = 16;

pub(crate) const SET_VEL_TO_FRAME_HOOK_BYTES: usize = 16;

pub(crate) const GAME_LEVEL_INTRO_CAMERA_FLAG_OFFSET: usize = 0x1c5;

pub(crate) const FREE_CAMERA_AXIS_STRIDE_FLOATS: usize = 4;

pub(crate) const FREE_CAMERA_RIGHT_AXIS: usize = 0;

pub(crate) const FREE_CAMERA_UP_AXIS: usize = 3;

pub(crate) const FREE_CAMERA_FORWARD_AXIS: usize = 6;

pub(crate) const FREE_CAMERA_POSITION: usize = 9;

pub(crate) const FREE_CAMERA_FRAME_FLOATS: usize = 12;

pub(crate) const FREE_CAMERA_MIN_LENGTH_SQ: f32 = 0.000001;

/// Converts a perspective-drag gesture delta (world-ish units) into radians for
/// the managed camera sphere. Tunable feel constant.
pub(crate) const REPLAY_CAMERA_PERSPECTIVE_SCALE: f32 = 0.012;

/// Fallback chase-camera focus distance (world units) used to derive the car
/// anchor from the game's own replay camera when calibration is unavailable.
pub(crate) const FREE_CAMERA_DEFAULT_FOLLOW_DISTANCE: f32 = 12.0;

pub(crate) const FREE_CAMERA_MIN_FOLLOW_DISTANCE: f32 = 1.0;

pub(crate) const FREE_CAMERA_MAX_FOLLOW_DISTANCE: f32 = 250.0;

pub(crate) const FREE_CAMERA_MAX_GROUND_RAY_OFFSET_SQ: f32 = 4.0;

pub(crate) const FREE_CAMERA_STOCK_RAY_MAX_ANCHOR_ERROR_SQ: f32 = 2500.0;

/// Per-frame camera movement (squared world units) above which the replay is
/// considered actively playing rather than sitting on a static menu.
pub(crate) const FREE_CAMERA_MOVE_EPSILON_SQ: f32 = 0.0016;

/// Frames of stillness before the replay is treated as not actively playing
/// (debounce so the gesture overlay does not flicker).
pub(crate) const FREE_CAMERA_STATIONARY_LIMIT: i32 = 12;

pub(crate) type GameUpdateCameraFn = unsafe extern "C" fn(*mut c_void, f32);

pub(crate) type CameraPathUpdateFn = unsafe extern "C" fn(*mut c_void, f32);

// Camera::Update(this, float dt [s0], TA::DynamicObject* [x1], Vec3 const& [x2], bool, bool)
pub(crate) type CameraUpdateFn =
    unsafe extern "C" fn(*mut c_void, f32, *mut c_void, *const f32, u8, u8);

// TA::DynamicObject::SetVelocitiesToMoveToFrame(this, MFrame const& [x1], float [s0])
pub(crate) type SetVelocitiesToMoveToFrameFn = unsafe extern "C" fn(*mut c_void, *const f32, f32);

pub(crate) type GameStartLevelIntroFn = unsafe extern "C" fn(*mut c_void, c_int);

pub(crate) static mut CAMERA_POINTER: *mut *mut f32 = ptr::null_mut();

pub(crate) static mut GAME_UPDATE_CAMERA_TRAMPOLINE: *mut c_void = ptr::null_mut();

pub(crate) static mut GAME_START_LEVEL_INTRO_TRAMPOLINE: *mut c_void = ptr::null_mut();

pub(crate) static mut CAMERA_PATH_UPDATE_TRAMPOLINE: *mut c_void = ptr::null_mut();

/// The Car* the stock `Replay::Update(Car*, float, int)` is animating this
/// playback frame -- the authoritative replay car in BOTH the passive View
/// Replay viewer and post-race replays. Cleared when leaving the replay so a
/// stale pointer is never dereferenced.
pub(crate) static mut REPLAY_UPDATE_CAR: *mut u8 = ptr::null_mut();

pub(crate) static mut CAR_RENDER_GHOST_TRAMPOLINE: *mut c_void = ptr::null_mut();

/// The exact MFrame the renderer last drew a replay/ghost car with, captured
/// in Car::RenderGhost. In the View Replay viewer the car is animated for
/// rendering only (the physics body stays at its spawn pose), so this is the
/// one transform guaranteed to match the car on screen. Swarm extra-ghost
/// renders are excluded via IN_SWARM_RENDER.
pub(crate) static mut REPLAY_RENDER_TRANSFORM: [f32; GHOST_TRANSFORM_BYTES / 4] =
    [0.0; GHOST_TRANSFORM_BYTES / 4];

pub(crate) static mut REPLAY_RENDER_TRANSFORM_VALID: bool = false;

pub(crate) static mut IN_SWARM_RENDER: bool = false;

pub(crate) static mut CAMERA_UPDATE_TRAMPOLINE: *mut c_void = ptr::null_mut();

/// The TA::DynamicObject the stock Camera::Update was last asked to follow.
/// Replay::Update passes the viewer car's body here every playback frame (it
/// also drives that body via DynamicObject::SetFrame), so its MFrame at
/// +0x1c0..0x1f0 is the rendered car pose in every replay mode.
pub(crate) static mut REPLAY_FOLLOW_OBJECT: *mut f32 = ptr::null_mut();

pub(crate) static mut SET_VEL_TO_FRAME_TRAMPOLINE: *mut c_void = ptr::null_mut();

/// The MFrame Replay::Update most recently drove the camera-followed body
/// toward (captured in DynamicObject::SetVelocitiesToMoveToFrame). This is the
/// node pose the viewer animates the car to -- the physics body itself only
/// trails it -- so it is the most accurate on-screen car pose available.
pub(crate) static mut REPLAY_TARGET_MFRAME: [f32; GHOST_TRANSFORM_BYTES / 4] =
    [0.0; GHOST_TRANSFORM_BYTES / 4];

pub(crate) static mut REPLAY_TARGET_MFRAME_VALID: bool = false;

/// The Camera object the stock Camera::Update last operated on. In the View
/// Replay viewer the scene renders through this camera (not g_pCamera), so the
/// managed replay camera writes its frame here as well.
pub(crate) static mut CAMERA_UPDATE_THIS: *mut f32 = ptr::null_mut();

// Orbit-probe instrumentation (diagnostic only): per-hook call counters and a
// once-per-second probe line appended to the public log directory.
pub(crate) static mut GAME_RENDER_TRAMPOLINE: *mut c_void = ptr::null_mut();

/// Game::Render builds the 3D pass view matrix by reading g_pCamera's MFrame
/// directly (Game::Render+0x1d8: load [[g_pCamera]]+0x00..0x38, invert, then
/// glMultMatrixf right before World::Render). Hooking its ENTRY and writing the
/// managed pose there makes us provably the last writer the render samples.
pub(crate) static mut GAME_RENDER_ENTRY_TRAMPOLINE: *mut c_void = ptr::null_mut();

/// Camera position found in g_pCamera at Game::Render entry BEFORE the managed
/// pose is re-asserted (diagnostic: shows whether the update-phase writes
/// survived to the render, or something stock overwrote them in between).
pub(crate) static mut ORBIT_RENDER_ENTRY_CAM: [f32; 3] = [0.0; 3];

pub(crate) static mut ORBIT_RENDER_ENTRY_CAM_VALID: bool = false;

pub(crate) static ORBIT_PROBE_RENDER_ENTRY_WRITES: AtomicI32 = AtomicI32::new(0);

/// Distance (x1000) between the camera position read back from g_pCamera right
/// after the render-entry write and the current REPLAY_TARGET_MFRAME position.
/// This is measured at Game::Render time, i.e. the pose the view matrix is
/// built from; -1 when not yet measured.
pub(crate) static ORBIT_RENDER_WRITE_DIST_1000: AtomicI32 = AtomicI32::new(-1);

/// Same distance measured at World::Render time (inside the 3D pass, after the
/// view matrix was already built from the camera). If this differs from
/// ORBIT_RENDER_WRITE_DIST_1000 something rewrote the camera between
/// Game::Render entry and the matrix build; -1 when not yet measured.
pub(crate) static ORBIT_WORLD_RENDER_DIST_1000: AtomicI32 = AtomicI32::new(-1);

pub(crate) static ORBIT_PROBE_RENDER_GHOST_CALLS: AtomicI32 = AtomicI32::new(0);

pub(crate) static ORBIT_PROBE_CAMERA_UPDATE_CALLS: AtomicI32 = AtomicI32::new(0);

pub(crate) static ORBIT_PROBE_SETVEL_ALL_CALLS: AtomicI32 = AtomicI32::new(0);

pub(crate) static ORBIT_PROBE_SETVEL_CAPTURES: AtomicI32 = AtomicI32::new(0);

pub(crate) static ORBIT_PROBE_VIEWER_CAR_DRAWS: AtomicI32 = AtomicI32::new(0);

// Car::SetLightColour(u32 colour, f32 radiance) -- Game::Render calls this per
// car right before Car::Render; without it the car draws unlit (flat grey).
pub(crate) type CarSetLightColourFn = unsafe extern "C" fn(*mut c_void, u32, f32);

pub(crate) static mut CAR_SET_LIGHT_COLOUR: *mut c_void = ptr::null_mut();

// Car::Render(bool ghost). With ghost=false it draws the OPAQUE car mesh at
// the car body's own current MFrame (it multiplies body+0x1c0 onto the GL
// stack itself). RenderGhost draws only a translucent black silhouette
// (Car::Render(true) after glColor4f(0,0,0,a)), which is nearly invisible at
// 480x320; the opaque draw is the visible viewer car.
pub(crate) type CarRenderFn = unsafe extern "C" fn(*mut c_void, u8);

pub(crate) static mut CAR_RENDER: *mut c_void = ptr::null_mut();

pub(crate) static mut ORBIT_PROBE_FRAME_COUNT: i32 = 0;

pub(crate) const ORBIT_PROBE_LOG_PATH: &[u8] =
    b"/storage/emulated/0/YCS2CommunityMod/logs/orbit_probe.log\0";

// Replay::GetGhostTransform() -- returns the MFrame the viewer's ghost car is
// rendered with (see Game::Render: Car::RenderGhost(car, GetGhostTransform())).
pub(crate) type ReplayGetGhostTransformFn = unsafe extern "C" fn(*mut c_void) -> *const f32;

pub(crate) static mut REPLAY_GET_GHOST_TRANSFORM: *mut c_void = ptr::null_mut();

// Last stock-camera anchor used by the managed Orbit camera, and the camera
// pose we last wrote. If the original `Game::UpdateCamera` did not refresh the
// camera object this frame (we would read back our own written pose), the
// previous anchor is reused instead of deriving one from our own frame.
pub(crate) static mut ORBIT_LAST_ANCHOR: [f32; 3] = [0.0; 3];

pub(crate) static mut ORBIT_LAST_ANCHOR_VALID: bool = false;

/// Distance (x1000) between the Orbit anchor and the nearest real car
/// transform candidate this frame; -1 when no candidate was available.
/// Diagnostic only -- exposed as `readReplayCameraDiag(7)`.
pub(crate) static ORBIT_ANCHOR_ERROR_1000: AtomicI32 = AtomicI32::new(-1);

/// Which source drove the Orbit anchor this frame: 0 live Car, 1 g_ghostTransform,
/// 2 g_ghostTransformLast, 3 chase-ray fallback, 4 stale-frame reuse, 5 the Car*
/// captured from Replay::Update, 6 the Car::RenderGhost MFrame, 7 the
/// Camera::Update follow object, 8 the node-buffer pose at the playback index.
/// Diagnostic only -- `readReplayCameraDiag(8)`.
pub(crate) static ORBIT_ANCHOR_SOURCE: AtomicI32 = AtomicI32::new(-1);

pub(crate) static mut FREE_CAMERA_FRAME: [f32; FREE_CAMERA_FRAME_FLOATS] =
    [0.0; FREE_CAMERA_FRAME_FLOATS];

pub(crate) static mut FREE_CAMERA_CAR_OFFSET: [f32; 3] = [0.0; 3];

pub(crate) static mut FREE_CAMERA_HAVE_CAR_OFFSET: bool = false;

pub(crate) static mut FREE_CAMERA_FOLLOW_DISTANCE: f32 = 0.0;

pub(crate) static mut FREE_CAMERA_FOLLOW_CALIBRATED: bool = false;

/// `g_v3LastOnGroundPos` -- a plain world vec3 of the car's last ground-contact
/// point (no pointer chain). Used to calibrate the chase-camera follow distance.
pub(crate) static mut LAST_ON_GROUND_POS: *mut f32 = ptr::null_mut();

/// Last observed g_nReplayPos for the playback-motion detector.
pub(crate) static mut PLAYBACK_MOTION_LAST_REPLAY_POS: c_int = -1;

pub(crate) static mut FREE_CAMERA_LAST_CAM_POS: [f32; 3] = [0.0; 3];

pub(crate) static mut FREE_CAMERA_LAST_CAM_VALID: bool = false;

pub(crate) static mut FREE_CAMERA_STATIONARY_FRAMES: i32 = 0;

pub(crate) static FREE_CAMERA_PLAYBACK_MOVING: AtomicBool = AtomicBool::new(false);

pub(crate) static FREE_CAMERA_HOOKS_INSTALLED: AtomicBool = AtomicBool::new(false);

pub(crate) static FREE_CAMERA_ENABLED: AtomicBool = AtomicBool::new(false);

pub(crate) static FREE_CAMERA_ACTIVE: AtomicBool = AtomicBool::new(false);

pub(crate) static FREE_CAMERA_IN_LEVEL_INTRO: AtomicBool = AtomicBool::new(false);

pub(crate) static FREE_CAMERA_LEVEL_INTRO_STARTED: AtomicBool = AtomicBool::new(false);

pub(crate) static FREE_CAMERA_CAPTURE_REQUESTED: AtomicBool = AtomicBool::new(false);

pub(crate) unsafe fn ensure_free_camera_symbols() -> bool {
    if CAMERA_POINTER.is_null() {
        CAMERA_POINTER = resolve(b"g_pCamera\0") as *mut *mut f32;
    }
    if LAST_GHOST_TRANSFORM.is_null() {
        LAST_GHOST_TRANSFORM = resolve(b"g_ghostTransformLast\0") as *mut f32;
    }
    if GHOST_TRANSFORM.is_null() {
        // The current-frame ghost transform (vs the static *Last) -- the live car
        // position during ghost playback. Resolving here is idempotent with the
        // swarm code that also uses this symbol.
        GHOST_TRANSFORM = resolve(b"g_ghostTransform\0") as *mut f32;
    }
    if LAST_ON_GROUND_POS.is_null() {
        LAST_ON_GROUND_POS = resolve(b"g_v3LastOnGroundPos\0") as *mut f32;
    }
    // g_v3LastOnGroundPos is optional. When absent or not yet populated, the
    // replay camera falls back to a fixed chase distance instead of failing hooks.
    !CAMERA_POINTER.is_null()
}

pub(crate) unsafe fn current_camera() -> *mut f32 {
    if !ensure_free_camera_symbols() {
        return ptr::null_mut();
    }
    ptr::read_volatile(CAMERA_POINTER)
}

pub(crate) unsafe fn game_is_level_intro(game: *mut c_void) -> bool {
    !game.is_null()
        && ptr::read_volatile((game as *mut u8).add(GAME_LEVEL_INTRO_CAMERA_FLAG_OFFSET)) != 0
}

pub(crate) unsafe fn game_show_replay_active() -> bool {
    ensure_split_symbols() && !SHOW_REPLAY.is_null() && ptr::read_volatile(SHOW_REPLAY) != 0
}

pub(crate) unsafe fn reset_free_camera_car_follow() {
    FREE_CAMERA_HAVE_CAR_OFFSET = false;
    FREE_CAMERA_CAR_OFFSET = [0.0; 3];
    ORBIT_LAST_ANCHOR_VALID = false;
    ORBIT_ANCHOR_ERROR_1000.store(-1, Ordering::Release);
    ORBIT_ANCHOR_SOURCE.store(-1, Ordering::Release);
    // Drop the captured replay car so a freed Car object from a finished
    // replay can never be dereferenced; playback re-captures it every frame.
    REPLAY_UPDATE_CAR = ptr::null_mut();
    REPLAY_RENDER_TRANSFORM_VALID = false;
    REPLAY_FOLLOW_OBJECT = ptr::null_mut();
    REPLAY_TARGET_MFRAME_VALID = false;
    CAMERA_UPDATE_THIS = ptr::null_mut();
    ORBIT_RENDER_ENTRY_CAM_VALID = false;
}

pub(crate) unsafe fn update_free_camera_car_offset() {
    let mut car = [0.0f32; 3];
    if !free_camera_anchor_position(&mut car) {
        return;
    }
    FREE_CAMERA_CAR_OFFSET[0] = FREE_CAMERA_FRAME[FREE_CAMERA_POSITION] - car[0];
    FREE_CAMERA_CAR_OFFSET[1] = FREE_CAMERA_FRAME[FREE_CAMERA_POSITION + 1] - car[1];
    FREE_CAMERA_CAR_OFFSET[2] = FREE_CAMERA_FRAME[FREE_CAMERA_POSITION + 2] - car[2];
    FREE_CAMERA_HAVE_CAR_OFFSET = true;
}

pub(crate) unsafe fn apply_free_camera_car_follow() {
    if !FREE_CAMERA_HAVE_CAR_OFFSET {
        update_free_camera_car_offset();
        return;
    }
    let mut car = [0.0f32; 3];
    if !free_camera_anchor_position(&mut car) {
        return;
    }
    FREE_CAMERA_FRAME[FREE_CAMERA_POSITION] = car[0] + FREE_CAMERA_CAR_OFFSET[0];
    FREE_CAMERA_FRAME[FREE_CAMERA_POSITION + 1] = car[1] + FREE_CAMERA_CAR_OFFSET[1];
    FREE_CAMERA_FRAME[FREE_CAMERA_POSITION + 2] = car[2] + FREE_CAMERA_CAR_OFFSET[2];
}

pub(crate) unsafe fn capture_free_camera_frame(camera: *mut f32) {
    if camera.is_null() {
        return;
    }
    for axis in 0..3 {
        let source = camera.add(axis * FREE_CAMERA_AXIS_STRIDE_FLOATS);
        let target = axis * 3;
        FREE_CAMERA_FRAME[target] = ptr::read_volatile(source);
        FREE_CAMERA_FRAME[target + 1] = ptr::read_volatile(source.add(1));
        FREE_CAMERA_FRAME[target + 2] = ptr::read_volatile(source.add(2));
    }
    let source = camera.add(3 * FREE_CAMERA_AXIS_STRIDE_FLOATS);
    FREE_CAMERA_FRAME[FREE_CAMERA_POSITION] = ptr::read_volatile(source);
    FREE_CAMERA_FRAME[FREE_CAMERA_POSITION + 1] = ptr::read_volatile(source.add(1));
    FREE_CAMERA_FRAME[FREE_CAMERA_POSITION + 2] = ptr::read_volatile(source.add(2));
    update_free_camera_car_offset();
    FREE_CAMERA_ACTIVE.store(true, Ordering::Release);
}

pub(crate) unsafe fn write_free_camera_frame(camera: *mut f32) {
    if camera.is_null() {
        return;
    }
    let frame = ptr::addr_of!(FREE_CAMERA_FRAME) as *const f32;
    for axis in 0..3 {
        let source = frame.add(axis * 3);
        let target = camera.add(axis * FREE_CAMERA_AXIS_STRIDE_FLOATS);
        ptr::copy_nonoverlapping(source, target, 3);
    }
    ptr::copy_nonoverlapping(
        frame.add(FREE_CAMERA_POSITION),
        camera.add(3 * FREE_CAMERA_AXIS_STRIDE_FLOATS),
        3,
    );
}

pub(crate) fn fast_inverse_sqrt(value: f32) -> f32 {
    if value <= FREE_CAMERA_MIN_LENGTH_SQ {
        return 1.0;
    }
    let x2 = value * 0.5;
    let mut bits = value.to_bits();
    bits = 0x5f37_59df - (bits >> 1);
    let mut estimate = f32::from_bits(bits);
    estimate = estimate * (1.5 - x2 * estimate * estimate);
    estimate
}

pub(crate) fn finite_camera_value(value: f32) -> bool {
    value == value && value > -1_000_000.0 && value < 1_000_000.0
}

pub(crate) fn clamp_camera_delta(value: f32, max_abs: f32) -> f32 {
    if value > max_abs {
        max_abs
    } else if value < -max_abs {
        -max_abs
    } else {
        value
    }
}

pub(crate) fn normalize_values(x: f32, y: f32, z: f32) -> (f32, f32, f32, bool) {
    let length_sq = x * x + y * y + z * z;
    if length_sq <= FREE_CAMERA_MIN_LENGTH_SQ {
        return (x, y, z, false);
    }
    let scale = fast_inverse_sqrt(length_sq);
    (x * scale, y * scale, z * scale, true)
}

pub(crate) fn cross_values(
    ax: f32,
    ay: f32,
    az: f32,
    bx: f32,
    by: f32,
    bz: f32,
) -> (f32, f32, f32) {
    (ay * bz - az * by, az * bx - ax * bz, ax * by - ay * bx)
}

pub(crate) unsafe fn axis_dot_values(axis: usize, x: f32, y: f32, z: f32) -> f32 {
    FREE_CAMERA_FRAME[axis] * x + FREE_CAMERA_FRAME[axis + 1] * y + FREE_CAMERA_FRAME[axis + 2] * z
}

pub(crate) unsafe fn write_free_camera_axis(axis: usize, x: f32, y: f32, z: f32) {
    FREE_CAMERA_FRAME[axis] = x;
    FREE_CAMERA_FRAME[axis + 1] = y;
    FREE_CAMERA_FRAME[axis + 2] = z;
}

pub(crate) unsafe fn normalize_free_camera_axis(axis: usize) {
    let x = FREE_CAMERA_FRAME[axis];
    let y = FREE_CAMERA_FRAME[axis + 1];
    let z = FREE_CAMERA_FRAME[axis + 2];
    let length_sq = x * x + y * y + z * z;
    if length_sq <= FREE_CAMERA_MIN_LENGTH_SQ {
        return;
    }
    let scale = fast_inverse_sqrt(length_sq);
    FREE_CAMERA_FRAME[axis] = x * scale;
    FREE_CAMERA_FRAME[axis + 1] = y * scale;
    FREE_CAMERA_FRAME[axis + 2] = z * scale;
}

pub(crate) unsafe fn stabilize_free_camera_frame() {
    normalize_free_camera_axis(FREE_CAMERA_FORWARD_AXIS);
    let dot = axis_dot_values(
        FREE_CAMERA_UP_AXIS,
        FREE_CAMERA_FRAME[FREE_CAMERA_FORWARD_AXIS],
        FREE_CAMERA_FRAME[FREE_CAMERA_FORWARD_AXIS + 1],
        FREE_CAMERA_FRAME[FREE_CAMERA_FORWARD_AXIS + 2],
    );
    FREE_CAMERA_FRAME[FREE_CAMERA_UP_AXIS] -= FREE_CAMERA_FRAME[FREE_CAMERA_FORWARD_AXIS] * dot;
    FREE_CAMERA_FRAME[FREE_CAMERA_UP_AXIS + 1] -=
        FREE_CAMERA_FRAME[FREE_CAMERA_FORWARD_AXIS + 1] * dot;
    FREE_CAMERA_FRAME[FREE_CAMERA_UP_AXIS + 2] -=
        FREE_CAMERA_FRAME[FREE_CAMERA_FORWARD_AXIS + 2] * dot;
    normalize_free_camera_axis(FREE_CAMERA_UP_AXIS);

    let (right_x, right_y, right_z) = cross_values(
        FREE_CAMERA_FRAME[FREE_CAMERA_UP_AXIS],
        FREE_CAMERA_FRAME[FREE_CAMERA_UP_AXIS + 1],
        FREE_CAMERA_FRAME[FREE_CAMERA_UP_AXIS + 2],
        FREE_CAMERA_FRAME[FREE_CAMERA_FORWARD_AXIS],
        FREE_CAMERA_FRAME[FREE_CAMERA_FORWARD_AXIS + 1],
        FREE_CAMERA_FRAME[FREE_CAMERA_FORWARD_AXIS + 2],
    );
    let (mut right_x, mut right_y, mut right_z, ok) = normalize_values(right_x, right_y, right_z);
    if ok {
        if axis_dot_values(FREE_CAMERA_RIGHT_AXIS, right_x, right_y, right_z) < 0.0 {
            right_x = -right_x;
            right_y = -right_y;
            right_z = -right_z;
        }
        write_free_camera_axis(FREE_CAMERA_RIGHT_AXIS, right_x, right_y, right_z);
        let (up_x, up_y, up_z) = cross_values(
            FREE_CAMERA_FRAME[FREE_CAMERA_FORWARD_AXIS],
            FREE_CAMERA_FRAME[FREE_CAMERA_FORWARD_AXIS + 1],
            FREE_CAMERA_FRAME[FREE_CAMERA_FORWARD_AXIS + 2],
            right_x,
            right_y,
            right_z,
        );
        let (up_x, up_y, up_z, up_ok) = normalize_values(up_x, up_y, up_z);
        if up_ok {
            write_free_camera_axis(FREE_CAMERA_UP_AXIS, up_x, up_y, up_z);
        }
    }
}

pub(crate) unsafe fn nudge_free_camera_position(axis: usize, amount: f32) {
    FREE_CAMERA_FRAME[FREE_CAMERA_POSITION] += FREE_CAMERA_FRAME[axis] * amount;
    FREE_CAMERA_FRAME[FREE_CAMERA_POSITION + 1] += FREE_CAMERA_FRAME[axis + 1] * amount;
    FREE_CAMERA_FRAME[FREE_CAMERA_POSITION + 2] += FREE_CAMERA_FRAME[axis + 2] * amount;
}

pub(crate) unsafe fn yaw_free_camera(amount: f32) {
    for index in 0..3 {
        let right = FREE_CAMERA_FRAME[FREE_CAMERA_RIGHT_AXIS + index];
        let forward = FREE_CAMERA_FRAME[FREE_CAMERA_FORWARD_AXIS + index];
        FREE_CAMERA_FRAME[FREE_CAMERA_RIGHT_AXIS + index] = right + forward * amount;
        FREE_CAMERA_FRAME[FREE_CAMERA_FORWARD_AXIS + index] = forward - right * amount;
    }
    normalize_free_camera_axis(FREE_CAMERA_RIGHT_AXIS);
    normalize_free_camera_axis(FREE_CAMERA_FORWARD_AXIS);
}

pub(crate) unsafe fn pitch_free_camera(amount: f32) {
    for index in 0..3 {
        let up = FREE_CAMERA_FRAME[FREE_CAMERA_UP_AXIS + index];
        let forward = FREE_CAMERA_FRAME[FREE_CAMERA_FORWARD_AXIS + index];
        FREE_CAMERA_FRAME[FREE_CAMERA_UP_AXIS + index] = up - forward * amount;
        FREE_CAMERA_FRAME[FREE_CAMERA_FORWARD_AXIS + index] = forward + up * amount;
    }
    normalize_free_camera_axis(FREE_CAMERA_UP_AXIS);
    normalize_free_camera_axis(FREE_CAMERA_FORWARD_AXIS);
}

pub(crate) unsafe fn free_camera_anchor_position(anchor: &mut [f32; 3]) -> bool {
    ensure_free_camera_symbols();
    if LAST_GHOST_TRANSFORM.is_null() {
        return false;
    }
    let x = ptr::read_volatile(LAST_GHOST_TRANSFORM.add(GHOST_TRANSFORM_POS_FLOAT));
    let y = ptr::read_volatile(LAST_GHOST_TRANSFORM.add(GHOST_TRANSFORM_POS_FLOAT + 1));
    let z = ptr::read_volatile(LAST_GHOST_TRANSFORM.add(GHOST_TRANSFORM_POS_FLOAT + 2));
    if !(finite_camera_value(x) && finite_camera_value(y) && finite_camera_value(z)) {
        return false;
    }
    anchor[0] = x;
    anchor[1] = y;
    anchor[2] = z;
    true
}

/// Read the live replay car frame. Managed replay-camera modes use this position
/// as the orbit axle, so the camera revolves around the car itself instead of a
/// chase-camera point behind it.
pub(crate) unsafe fn read_live_car_frame(game: *mut c_void) -> Option<replay_camera::CarFrame> {
    if game.is_null() {
        return None;
    }
    let car = ptr::read_volatile((game as *mut u8).add(GAME_CURRENT_CAR_OFFSET) as *mut *mut u8);
    read_car_body_frame(car)
}

/// Read a Car object's rendered world frame from its physics body MFrame
/// (basis rows at body+0x1c0.. per Car::SetFrame, translation at +0x1f0).
pub(crate) unsafe fn read_car_body_frame(car: *mut u8) -> Option<replay_camera::CarFrame> {
    if car.is_null() {
        return None;
    }
    let body = ptr::read_volatile(car.add(CAR_BODY_PTR_OFFSET) as *mut *mut f32);
    read_body_mframe(body)
}

/// Read the current MFrame of a TA::DynamicObject (the body pointer itself).
pub(crate) unsafe fn read_body_mframe(body: *mut f32) -> Option<replay_camera::CarFrame> {
    if body.is_null() {
        return None;
    }
    let read3 = |offset: usize| -> [f32; 3] {
        [
            ptr::read_volatile(body.add(offset)),
            ptr::read_volatile(body.add(offset + 1)),
            ptr::read_volatile(body.add(offset + 2)),
        ]
    };
    let right = read3(CAR_BODY_RIGHT_FLOAT);
    let up = read3(CAR_BODY_UP_FLOAT);
    let fwd = read3(CAR_BODY_FWD_FLOAT);
    let pos = read3(CAR_BODY_POS_FLOAT);
    if [right, up, fwd, pos]
        .iter()
        .flatten()
        .any(|&v| !finite_camera_value(v))
    {
        return None;
    }
    Some(replay_camera::CarFrame {
        pos,
        right,
        up,
        fwd,
    })
}

pub(crate) unsafe fn read_transform_car_frame(
    transform: *const f32,
) -> Option<replay_camera::CarFrame> {
    if transform.is_null() {
        return None;
    }
    let read3 = |offset: usize| -> [f32; 3] {
        [
            ptr::read_volatile(transform.add(offset)),
            ptr::read_volatile(transform.add(offset + 1)),
            ptr::read_volatile(transform.add(offset + 2)),
        ]
    };
    let right = read3(0);
    let up = read3(FREE_CAMERA_AXIS_STRIDE_FLOATS);
    let fwd = read3(2 * FREE_CAMERA_AXIS_STRIDE_FLOATS);
    let pos = read3(3 * FREE_CAMERA_AXIS_STRIDE_FLOATS);
    if [right, up, fwd, pos]
        .iter()
        .flatten()
        .any(|&v| !finite_camera_value(v))
    {
        return None;
    }
    let right_len_sq = right[0] * right[0] + right[1] * right[1] + right[2] * right[2];
    let up_len_sq = up[0] * up[0] + up[1] * up[1] + up[2] * up[2];
    let fwd_len_sq = fwd[0] * fwd[0] + fwd[1] * fwd[1] + fwd[2] * fwd[2];
    let pos_len_sq = pos[0] * pos[0] + pos[1] * pos[1] + pos[2] * pos[2];
    if right_len_sq <= FREE_CAMERA_MIN_LENGTH_SQ
        || up_len_sq <= FREE_CAMERA_MIN_LENGTH_SQ
        || fwd_len_sq <= FREE_CAMERA_MIN_LENGTH_SQ
        || pos_len_sq <= FREE_CAMERA_MIN_LENGTH_SQ
    {
        return None;
    }
    Some(replay_camera::CarFrame {
        pos,
        right,
        up,
        fwd,
    })
}

pub(crate) fn stock_camera_ray_score(
    car: &replay_camera::CarFrame,
    cam_pos: [f32; 3],
    cam_fwd: [f32; 3],
) -> Option<(f32, f32)> {
    let to_car = [
        car.pos[0] - cam_pos[0],
        car.pos[1] - cam_pos[1],
        car.pos[2] - cam_pos[2],
    ];
    let proj = to_car[0] * cam_fwd[0] + to_car[1] * cam_fwd[1] + to_car[2] * cam_fwd[2];
    if proj <= FREE_CAMERA_MIN_FOLLOW_DISTANCE {
        return None;
    }
    let ray = [
        cam_pos[0] + (cam_fwd[0] * proj),
        cam_pos[1] + (cam_fwd[1] * proj),
        cam_pos[2] + (cam_fwd[2] * proj),
    ];
    let dx = car.pos[0] - ray[0];
    let dy = car.pos[1] - ray[1];
    let dz = car.pos[2] - ray[2];
    let lateral_sq = dx * dx + dy * dy + dz * dz;
    if finite_camera_value(lateral_sq) {
        Some((lateral_sq, proj))
    } else {
        None
    }
}

/// True when the freshly read camera pose is bit-identical to the pose the
/// managed camera wrote last frame, i.e. the original `Game::UpdateCamera` did
/// NOT refresh the camera object. Deriving an anchor from our own written
/// frame would feed the orbit back into itself, so callers reuse the previous
/// anchor instead.
pub(crate) unsafe fn stock_camera_frame_is_stale(cam_pos: [f32; 3], cam_fwd: [f32; 3]) -> bool {
    if !FREE_CAMERA_ACTIVE.load(Ordering::Acquire) {
        return false;
    }
    cam_pos[0] == FREE_CAMERA_FRAME[FREE_CAMERA_POSITION]
        && cam_pos[1] == FREE_CAMERA_FRAME[FREE_CAMERA_POSITION + 1]
        && cam_pos[2] == FREE_CAMERA_FRAME[FREE_CAMERA_POSITION + 2]
        && cam_fwd[0] == FREE_CAMERA_FRAME[FREE_CAMERA_FORWARD_AXIS]
        && cam_fwd[1] == FREE_CAMERA_FRAME[FREE_CAMERA_FORWARD_AXIS + 1]
        && cam_fwd[2] == FREE_CAMERA_FRAME[FREE_CAMERA_FORWARD_AXIS + 2]
}

pub(crate) unsafe fn choose_replay_camera_anchor(
    game: *mut c_void,
    cam_pos: [f32; 3],
    cam_up: [f32; 3],
    cam_fwd: [f32; 3],
) -> Option<replay_camera::CarFrame> {
    if replay_camera::anchors_on_body() {
        // Highest priority: the DynamicObject the stock Camera::Update follows.
        // The VISIBLE car (Car::Render draws the body MFrame directly, both in
        // post-race replays and via render_viewer_replay_car's opaque draw in
        // the passive viewer) sits exactly at these body values, so anchoring
        // here keeps the drawn car dead-centre. The SetVelocitiesToMoveToFrame
        // target (t9) leads the body by a couple of units and is the fallback.
        if let Some(car) = read_body_mframe(REPLAY_FOLLOW_OBJECT) {
            ORBIT_ANCHOR_ERROR_1000.store(0, Ordering::Release);
            ORBIT_ANCHOR_SOURCE.store(7, Ordering::Release);
            ORBIT_LAST_ANCHOR = car.pos;
            ORBIT_LAST_ANCHOR_VALID = true;
            return Some(car);
        }
        if VIEW_REPLAY_SESSION && REPLAY_TARGET_MFRAME_VALID {
            if let Some(car) =
                read_transform_car_frame(ptr::addr_of!(REPLAY_TARGET_MFRAME) as *const f32)
            {
                ORBIT_ANCHOR_ERROR_1000.store(0, Ordering::Release);
                ORBIT_ANCHOR_SOURCE.store(9, Ordering::Release);
                ORBIT_LAST_ANCHOR = car.pos;
                ORBIT_LAST_ANCHOR_VALID = true;
                return Some(car);
            }
        }
        // Next: the exact MFrame the renderer drew a replay/ghost car with
        // (captured in Car::RenderGhost).
        if REPLAY_RENDER_TRANSFORM_VALID {
            if let Some(car) =
                read_transform_car_frame(ptr::addr_of!(REPLAY_RENDER_TRANSFORM) as *const f32)
            {
                ORBIT_ANCHOR_ERROR_1000.store(0, Ordering::Release);
                ORBIT_ANCHOR_SOURCE.store(6, Ordering::Release);
                ORBIT_LAST_ANCHOR = car.pos;
                ORBIT_LAST_ANCHOR_VALID = true;
                return Some(car);
            }
        }
        // Next: the Car* Replay::Update is animating (moves with the car in
        // post-race replays where playback drives the real physics body).
        if let Some(car) = read_car_body_frame(REPLAY_UPDATE_CAR) {
            ORBIT_ANCHOR_ERROR_1000.store(0, Ordering::Release);
            ORBIT_ANCHOR_SOURCE.store(5, Ordering::Release);
            ORBIT_LAST_ANCHOR = car.pos;
            ORBIT_LAST_ANCHOR_VALID = true;
            return Some(car);
        }
    }

    let mut best: Option<replay_camera::CarFrame> = None;
    let mut best_score = f32::MAX;
    let mut best_projection = FREE_CAMERA_FOLLOW_DISTANCE;
    let mut best_source = -1i32;
    let candidates = [
        read_live_car_frame(game),
        read_transform_car_frame(GHOST_TRANSFORM as *const f32),
        read_transform_car_frame(LAST_GHOST_TRANSFORM as *const f32),
    ];
    for (index, candidate) in candidates.into_iter().enumerate() {
        if let Some(candidate) = candidate {
            if let Some((score, projection)) = stock_camera_ray_score(&candidate, cam_pos, cam_fwd)
            {
                if score < best_score {
                    best_score = score;
                    best_projection = projection;
                    best_source = index as i32;
                    best = Some(candidate);
                }
            }
        }
    }

    if !replay_camera::anchors_on_body() {
        return best;
    }

    // When the game exposes a real replay-car transform that the stock camera is
    // actually looking at (small ray-offset score), anchor the orbit DIRECTLY on
    // that world position so the car sits dead-centre every frame. Only when no
    // such transform is readable (e.g. a passive "View Replay" that renders from
    // the node buffer with no live Car object) do we fall back to the stock
    // chase camera's look point, `camPos + camFwd * D` (PR #8 approach).
    if stock_camera_frame_is_stale(cam_pos, cam_fwd) {
        if !ORBIT_LAST_ANCHOR_VALID {
            return None;
        }
        let mut anchored = best.unwrap_or_else(|| camera_basis_frame(cam_pos, cam_up, cam_fwd));
        anchored.pos = ORBIT_LAST_ANCHOR;
        ORBIT_ANCHOR_SOURCE.store(4, Ordering::Release);
        return Some(anchored);
    }

    if let Some(car) = best {
        if best_score <= FREE_CAMERA_STOCK_RAY_MAX_ANCHOR_ERROR_SQ {
            // Keep D calibrated too, so the chase-ray fallback stays sane if the
            // transform later drops out mid-replay.
            let measured = clamp_camera_delta(best_projection, FREE_CAMERA_MAX_FOLLOW_DISTANCE)
                .max(FREE_CAMERA_MIN_FOLLOW_DISTANCE);
            if FREE_CAMERA_FOLLOW_CALIBRATED {
                FREE_CAMERA_FOLLOW_DISTANCE += (measured - FREE_CAMERA_FOLLOW_DISTANCE) * 0.2;
            } else {
                FREE_CAMERA_FOLLOW_DISTANCE = measured;
                FREE_CAMERA_FOLLOW_CALIBRATED = true;
            }
            ORBIT_ANCHOR_ERROR_1000.store(0, Ordering::Release);
            ORBIT_ANCHOR_SOURCE.store(best_source, Ordering::Release);
            ORBIT_LAST_ANCHOR = car.pos;
            ORBIT_LAST_ANCHOR_VALID = true;
            return Some(car);
        }
    }

    // No usable real transform: fall back to the stock chase look point.
    let anchor = [
        cam_pos[0] + (cam_fwd[0] * FREE_CAMERA_FOLLOW_DISTANCE),
        cam_pos[1] + (cam_fwd[1] * FREE_CAMERA_FOLLOW_DISTANCE),
        cam_pos[2] + (cam_fwd[2] * FREE_CAMERA_FOLLOW_DISTANCE),
    ];
    ORBIT_ANCHOR_ERROR_1000.store(-1, Ordering::Release);
    ORBIT_ANCHOR_SOURCE.store(3, Ordering::Release);
    ORBIT_LAST_ANCHOR = anchor;
    ORBIT_LAST_ANCHOR_VALID = true;

    let mut anchored = camera_basis_frame(cam_pos, cam_up, cam_fwd);
    anchored.pos = anchor;
    Some(anchored)
}

/// Fallback car basis when no car transform candidate is readable: reuse the
/// stock camera's own axes (its up is world-up aligned during replay chase).
pub(crate) fn camera_basis_frame(
    cam_pos: [f32; 3],
    cam_up: [f32; 3],
    cam_fwd: [f32; 3],
) -> replay_camera::CarFrame {
    let right = [
        cam_up[1] * cam_fwd[2] - cam_up[2] * cam_fwd[1],
        cam_up[2] * cam_fwd[0] - cam_up[0] * cam_fwd[2],
        cam_up[0] * cam_fwd[1] - cam_up[1] * cam_fwd[0],
    ];
    replay_camera::CarFrame {
        pos: cam_pos,
        right,
        up: cam_up,
        fwd: cam_fwd,
    }
}

/// Build the managed-camera target frame: the replay car stock camera is
/// already framing this frame. Orbit is a wheel around this visual axle: camera
/// position is `car.pos + direction * radius`, and the camera's forward vector
/// points back toward `car.pos` every frame so the car stays centered.
pub(crate) unsafe fn replay_follow_frame(
    game: *mut c_void,
    camera: *const f32,
) -> Option<replay_camera::CarFrame> {
    let read3 = |base: *const f32, offset: usize| -> [f32; 3] {
        [
            ptr::read_volatile(base.add(offset)),
            ptr::read_volatile(base.add(offset + 1)),
            ptr::read_volatile(base.add(offset + 2)),
        ]
    };
    let right = read3(camera, 0);
    let up = read3(camera, FREE_CAMERA_AXIS_STRIDE_FLOATS);
    let fwd = read3(camera, 2 * FREE_CAMERA_AXIS_STRIDE_FLOATS);
    let cam_pos = read3(camera, 3 * FREE_CAMERA_AXIS_STRIDE_FLOATS);
    let finite = [right, up, fwd, cam_pos]
        .iter()
        .flatten()
        .all(|&value| finite_camera_value(value));
    if !finite {
        return None;
    }

    // Seed the follow distance before the anchor is derived: prefer the last
    // ground-contact point projected onto the stock camera's look ray, fall
    // back to a sane default. Per-frame candidate scoring keeps refining it.
    if !FREE_CAMERA_FOLLOW_CALIBRATED {
        FREE_CAMERA_FOLLOW_DISTANCE = FREE_CAMERA_DEFAULT_FOLLOW_DISTANCE;
        if !LAST_ON_GROUND_POS.is_null() {
            let ground = read3(LAST_ON_GROUND_POS, 0);
            if ground.iter().all(|&v| finite_camera_value(v))
                && ground.iter().any(|&v| v.abs() > FREE_CAMERA_MIN_LENGTH_SQ)
            {
                let proj = (ground[0] - cam_pos[0]) * fwd[0]
                    + (ground[1] - cam_pos[1]) * fwd[1]
                    + (ground[2] - cam_pos[2]) * fwd[2];
                let projected = [
                    cam_pos[0] + fwd[0] * proj,
                    cam_pos[1] + fwd[1] * proj,
                    cam_pos[2] + fwd[2] * proj,
                ];
                let ray_dx = ground[0] - projected[0];
                let ray_dy = ground[1] - projected[1];
                let ray_dz = ground[2] - projected[2];
                let ray_offset_sq = ray_dx * ray_dx + ray_dy * ray_dy + ray_dz * ray_dz;
                if proj > FREE_CAMERA_MIN_FOLLOW_DISTANCE
                    && proj < FREE_CAMERA_MAX_FOLLOW_DISTANCE
                    && ray_offset_sq <= FREE_CAMERA_MAX_GROUND_RAY_OFFSET_SQ
                {
                    FREE_CAMERA_FOLLOW_DISTANCE = proj;
                    FREE_CAMERA_FOLLOW_CALIBRATED = true;
                }
            }
        }
    }

    choose_replay_camera_anchor(game, cam_pos, up, fwd)
}

/// Track whether the replay is actively playing by watching the game camera
/// translate. During playback the chase camera moves with the car; on a static
/// replay/selection menu it sits still, so the gesture overlay can be dropped
/// there (it otherwise covers screen-centre and blocks the menu lists).
pub(crate) unsafe fn update_playback_motion(camera: *const f32) {
    // The replay clock (g_nReplayPos) is the authoritative "actually playing"
    // signal: the managed Trackside camera parks between cuts (so camera
    // translation reads as idle mid-replay), while on the post-race/replay
    // menu screens g_bShowReplay stays set and the proxy car body keeps
    // free-falling (so car motion reads as playing and the gesture layer
    // blocks the menu buttons). Only real playback advances the replay clock.
    if REPLAY_POS.is_null() {
        REPLAY_POS = resolve(b"g_nReplayPos\0") as *mut c_int;
    }
    if !REPLAY_POS.is_null() {
        let replay_pos = ptr::read_volatile(REPLAY_POS);
        if replay_pos > 0 {
            if replay_pos != PLAYBACK_MOTION_LAST_REPLAY_POS {
                PLAYBACK_MOTION_LAST_REPLAY_POS = replay_pos;
                FREE_CAMERA_STATIONARY_FRAMES = 0;
            } else if FREE_CAMERA_STATIONARY_FRAMES < FREE_CAMERA_STATIONARY_LIMIT {
                FREE_CAMERA_STATIONARY_FRAMES += 1;
            }
            FREE_CAMERA_PLAYBACK_MOVING.store(
                FREE_CAMERA_STATIONARY_FRAMES < FREE_CAMERA_STATIONARY_LIMIT,
                Ordering::Release,
            );
            return;
        }
    }
    // No live replay clock: fall back to stock-camera translation (covers
    // playback start and non-replay level intros).
    let pos_src = camera.add(3 * FREE_CAMERA_AXIS_STRIDE_FLOATS);
    let pos = [
        ptr::read_volatile(pos_src),
        ptr::read_volatile(pos_src.add(1)),
        ptr::read_volatile(pos_src.add(2)),
    ];
    if !(finite_camera_value(pos[0]) && finite_camera_value(pos[1]) && finite_camera_value(pos[2]))
    {
        return;
    }
    if FREE_CAMERA_LAST_CAM_VALID {
        let dx = pos[0] - FREE_CAMERA_LAST_CAM_POS[0];
        let dy = pos[1] - FREE_CAMERA_LAST_CAM_POS[1];
        let dz = pos[2] - FREE_CAMERA_LAST_CAM_POS[2];
        if dx * dx + dy * dy + dz * dz > FREE_CAMERA_MOVE_EPSILON_SQ {
            FREE_CAMERA_STATIONARY_FRAMES = 0;
        } else if FREE_CAMERA_STATIONARY_FRAMES < FREE_CAMERA_STATIONARY_LIMIT {
            FREE_CAMERA_STATIONARY_FRAMES += 1;
        }
    }
    FREE_CAMERA_LAST_CAM_POS = pos;
    FREE_CAMERA_LAST_CAM_VALID = true;
    FREE_CAMERA_PLAYBACK_MOVING.store(
        FREE_CAMERA_STATIONARY_FRAMES < FREE_CAMERA_STATIONARY_LIMIT,
        Ordering::Release,
    );
}

pub(crate) unsafe fn reset_playback_motion() {
    FREE_CAMERA_LAST_CAM_VALID = false;
    PLAYBACK_MOTION_LAST_REPLAY_POS = -1;
    // Start at the limit so playback reads as "still" until real motion is seen;
    // otherwise the overlay would block the menu for ~12 frames after a reset.
    FREE_CAMERA_STATIONARY_FRAMES = FREE_CAMERA_STATIONARY_LIMIT;
    FREE_CAMERA_PLAYBACK_MOVING.store(false, Ordering::Release);
}

pub(crate) unsafe fn aim_free_camera_at(anchor: &[f32; 3]) {
    let pos_x = FREE_CAMERA_FRAME[FREE_CAMERA_POSITION];
    let pos_y = FREE_CAMERA_FRAME[FREE_CAMERA_POSITION + 1];
    let pos_z = FREE_CAMERA_FRAME[FREE_CAMERA_POSITION + 2];
    let (forward_x, forward_y, forward_z, forward_ok) =
        normalize_values(anchor[0] - pos_x, anchor[1] - pos_y, anchor[2] - pos_z);
    if !forward_ok {
        return;
    }

    let old_up_x = FREE_CAMERA_FRAME[FREE_CAMERA_UP_AXIS];
    let old_up_y = FREE_CAMERA_FRAME[FREE_CAMERA_UP_AXIS + 1];
    let old_up_z = FREE_CAMERA_FRAME[FREE_CAMERA_UP_AXIS + 2];
    let (right_x, right_y, right_z) = cross_values(
        old_up_x, old_up_y, old_up_z, forward_x, forward_y, forward_z,
    );
    let (mut right_x, mut right_y, mut right_z, right_ok) =
        normalize_values(right_x, right_y, right_z);
    if !right_ok {
        return;
    }
    if axis_dot_values(FREE_CAMERA_RIGHT_AXIS, right_x, right_y, right_z) < 0.0 {
        right_x = -right_x;
        right_y = -right_y;
        right_z = -right_z;
    }
    let (up_x, up_y, up_z) =
        cross_values(forward_x, forward_y, forward_z, right_x, right_y, right_z);
    let (up_x, up_y, up_z, up_ok) = normalize_values(up_x, up_y, up_z);
    if !up_ok {
        return;
    }

    write_free_camera_axis(FREE_CAMERA_RIGHT_AXIS, right_x, right_y, right_z);
    write_free_camera_axis(FREE_CAMERA_UP_AXIS, up_x, up_y, up_z);
    write_free_camera_axis(FREE_CAMERA_FORWARD_AXIS, forward_x, forward_y, forward_z);
}

pub(crate) unsafe fn drag_free_camera_around_car(right: f32, up: f32) {
    let mut anchor = [0.0f32; 3];
    if !free_camera_anchor_position(&mut anchor) {
        return;
    }
    if right != 0.0 {
        nudge_free_camera_position(FREE_CAMERA_RIGHT_AXIS, right);
    }
    if up != 0.0 {
        nudge_free_camera_position(FREE_CAMERA_UP_AXIS, up);
    }
    aim_free_camera_at(&anchor);
}

pub(crate) unsafe fn apply_free_camera_gesture(
    right: f32,
    up: f32,
    forward: f32,
    yaw: f32,
    pitch: f32,
    car_right: f32,
    car_up: f32,
) {
    let camera = current_camera();
    if camera.is_null() {
        return;
    }
    if !FREE_CAMERA_ACTIVE.load(Ordering::Acquire) {
        capture_free_camera_frame(camera);
    }
    let right = clamp_camera_delta(right, 200.0);
    let up = clamp_camera_delta(up, 200.0);
    let forward = clamp_camera_delta(forward, 200.0);
    let yaw = clamp_camera_delta(yaw, 0.25);
    let pitch = clamp_camera_delta(pitch, 0.25);
    let car_right = clamp_camera_delta(car_right, 200.0);
    let car_up = clamp_camera_delta(car_up, 200.0);
    if right != 0.0 {
        nudge_free_camera_position(FREE_CAMERA_RIGHT_AXIS, right);
    }
    if up != 0.0 {
        nudge_free_camera_position(FREE_CAMERA_UP_AXIS, up);
    }
    if forward != 0.0 {
        nudge_free_camera_position(FREE_CAMERA_FORWARD_AXIS, forward);
    }
    if yaw != 0.0 {
        yaw_free_camera(yaw);
    }
    if pitch != 0.0 {
        pitch_free_camera(pitch);
    }
    if car_right != 0.0 || car_up != 0.0 {
        drag_free_camera_around_car(car_right, car_up);
    }
    stabilize_free_camera_frame();
    update_free_camera_car_offset();
    FREE_CAMERA_ACTIVE.store(true, Ordering::Release);
    write_free_camera_frame(camera);
}

pub(crate) unsafe fn nudge_free_camera(right: f32, up: f32, forward: f32, yaw: f32, pitch: f32) {
    apply_free_camera_gesture(right, up, forward, yaw, pitch, 0.0, 0.0);
}

pub(crate) unsafe extern "C" fn hooked_game_update_camera(game: *mut c_void, delta_seconds: f32) {
    // Keep the swarm/viewer code supplied with the live Game* every frame
    // (Game::ViewReplay only fires when the passive viewer opens, which never
    // happens on the race path).
    if !game.is_null() {
        CURRENT_GAME = game;
    }
    let original: GameUpdateCameraFn = mem::transmute(GAME_UPDATE_CAMERA_TRAMPOLINE);
    original(game, delta_seconds);

    let intro_camera_flag = game_is_level_intro(game);
    if !intro_camera_flag {
        FREE_CAMERA_LEVEL_INTRO_STARTED.store(false, Ordering::Release);
    }
    let in_replay = game_show_replay_active();
    let in_level_intro = in_replay;
    FREE_CAMERA_IN_LEVEL_INTRO.store(in_level_intro, Ordering::Release);
    if in_replay {
        // The viewer has actually started; the entry grace window is over.
        VIEW_REPLAY_PENDING = false;
    }
    if !in_level_intro {
        FREE_CAMERA_ACTIVE.store(false, Ordering::Release);
        FREE_CAMERA_CAPTURE_REQUESTED.store(false, Ordering::Release);
        reset_free_camera_car_follow();
        reset_playback_motion();
        replay_camera::invalidate();
        // Only an actual exit from the replay ends the viewer session --
        // Game::StartLevelIntro fires DURING viewer entry (after ViewReplay)
        // and must not clear it via the shared reset above. Likewise, camera
        // frames between Game::ViewReplay and SHOW_REPLAY going active are
        // still viewer entry (VIEW_REPLAY_PENDING), not an exit.
        if !VIEW_REPLAY_PENDING {
            VIEW_REPLAY_SESSION = false;
        }
        return;
    }
    if !FREE_CAMERA_ENABLED.load(Ordering::Acquire) {
        FREE_CAMERA_ACTIVE.store(false, Ordering::Release);
        reset_free_camera_car_follow();
        reset_playback_motion();
        replay_camera::invalidate();
        return;
    }

    let camera = current_camera();
    if camera.is_null() {
        return;
    }
    update_playback_motion(camera);
    // Managed camera modes (Orbit / Helicopter / GoPro / Trackside) auto-activate
    // and fully own the camera each frame.
    if replay_camera::is_managed() {
        if !FREE_CAMERA_ACTIVE.load(Ordering::Acquire) {
            capture_free_camera_frame(camera);
            replay_camera::invalidate();
            FREE_CAMERA_FOLLOW_CALIBRATED = false;
            ORBIT_LAST_ANCHOR_VALID = false;
        }
        if FREE_CAMERA_ACTIVE.load(Ordering::Acquire) {
            if let Some(car) = replay_follow_frame(game, camera) {
                if replay_camera::update(
                    delta_seconds,
                    &car,
                    &mut *ptr::addr_of_mut!(FREE_CAMERA_FRAME),
                ) {
                    write_free_camera_frame(camera);
                    // The View Replay viewer renders through its own Camera
                    // (the one Camera::Update maintains), not g_pCamera; write
                    // the managed frame there too so the orbit is what renders.
                    if !CAMERA_UPDATE_THIS.is_null() && CAMERA_UPDATE_THIS != camera {
                        write_free_camera_frame(CAMERA_UPDATE_THIS);
                    }
                    ORBIT_PROBE_FRAME_COUNT += 1;
                    if ORBIT_PROBE_FRAME_COUNT % 30 == 0 {
                        orbit_probe_log(game, camera);
                    }
                }
            }
        }
        return;
    }
    if FREE_CAMERA_CAPTURE_REQUESTED.swap(false, Ordering::AcqRel) {
        capture_free_camera_frame(camera);
    }
    if FREE_CAMERA_ACTIVE.load(Ordering::Acquire) {
        apply_free_camera_car_follow();
        write_free_camera_frame(camera);
    }
}

pub(crate) unsafe extern "C" fn hooked_game_start_level_intro(
    game: *mut c_void,
    intro_type: c_int,
) {
    let original: GameStartLevelIntroFn = mem::transmute(GAME_START_LEVEL_INTRO_TRAMPOLINE);
    original(game, intro_type);
    FREE_CAMERA_LEVEL_INTRO_STARTED.store(true, Ordering::Release);
    FREE_CAMERA_ACTIVE.store(false, Ordering::Release);
    FREE_CAMERA_CAPTURE_REQUESTED.store(false, Ordering::Release);
    reset_free_camera_car_follow();
    replay_camera::invalidate();
}

pub(crate) unsafe fn install_free_camera_hooks() -> bool {
    if FREE_CAMERA_HOOKS_INSTALLED.load(Ordering::Acquire) {
        return true;
    }
    if FREE_CAMERA_HOOKS_INSTALLED.swap(true, Ordering::AcqRel) {
        return true;
    }

    let update_camera = resolve(b"_ZN4Game12UpdateCameraEf\0");
    let start_level_intro = resolve(b"_ZN4Game15StartLevelIntroEi\0");
    let camera_path_update = resolve(b"_ZN10CameraPath6UpdateEf\0");
    let car_render_ghost = resolve(b"_ZN3Car11RenderGhostERKN2TA6MFrameE\0");
    let camera_update = resolve(b"_ZN6Camera6UpdateEfPN2TA13DynamicObjectERKNS0_4Vec3Ebb\0");
    let set_vel_to_frame =
        resolve(b"_ZN2TA13DynamicObject26SetVelocitiesToMoveToFrameERKNS_6MFrameEf\0");
    let game_render = resolve(b"_ZN4Game6RenderEv\0");
    if update_camera.is_null()
        || start_level_intro.is_null()
        || camera_path_update.is_null()
        || car_render_ghost.is_null()
        || camera_update.is_null()
        || set_vel_to_frame.is_null()
        || game_render.is_null()
        || !ensure_free_camera_symbols()
    {
        FREE_CAMERA_HOOKS_INSTALLED.store(false, Ordering::Release);
        return false;
    }
    GAME_UPDATE_CAMERA_TRAMPOLINE = install_inline_hook(
        update_camera,
        hooked_game_update_camera as *const c_void,
        GAME_UPDATE_CAMERA_HOOK_BYTES,
    );
    GAME_START_LEVEL_INTRO_TRAMPOLINE = install_inline_hook(
        start_level_intro,
        hooked_game_start_level_intro as *const c_void,
        GAME_START_LEVEL_INTRO_HOOK_BYTES,
    );
    CAMERA_PATH_UPDATE_TRAMPOLINE = install_inline_hook(
        camera_path_update,
        hooked_camera_path_update as *const c_void,
        CAMERA_PATH_UPDATE_HOOK_BYTES,
    );
    CAR_RENDER_GHOST_TRAMPOLINE = install_inline_hook(
        car_render_ghost,
        hooked_car_render_ghost_capture as *const c_void,
        CAR_RENDER_GHOST_HOOK_BYTES,
    );
    CAMERA_UPDATE_TRAMPOLINE = install_inline_hook(
        camera_update,
        hooked_camera_update as *const c_void,
        CAMERA_UPDATE_HOOK_BYTES,
    );
    SET_VEL_TO_FRAME_TRAMPOLINE = install_inline_hook(
        set_vel_to_frame,
        hooked_set_velocities_to_move_to_frame as *const c_void,
        SET_VEL_TO_FRAME_HOOK_BYTES,
    );
    GAME_RENDER_ENTRY_TRAMPOLINE = install_inline_hook(
        game_render,
        hooked_game_render as *const c_void,
        GAME_RENDER_ENTRY_HOOK_BYTES,
    );
    let ok = !GAME_UPDATE_CAMERA_TRAMPOLINE.is_null()
        && !GAME_START_LEVEL_INTRO_TRAMPOLINE.is_null()
        && !CAMERA_PATH_UPDATE_TRAMPOLINE.is_null()
        && !CAR_RENDER_GHOST_TRAMPOLINE.is_null()
        && !CAMERA_UPDATE_TRAMPOLINE.is_null()
        && !SET_VEL_TO_FRAME_TRAMPOLINE.is_null()
        && !GAME_RENDER_ENTRY_TRAMPOLINE.is_null()
        && ensure_world_render_hook()
        && ensure_replay_update_hook()
        && ensure_view_replay_hook();
    if !ok {
        FREE_CAMERA_HOOKS_INSTALLED.store(false, Ordering::Release);
    }
    ok
}

pub(crate) static WORLD_RENDER_HOOK_INSTALLED: AtomicBool = AtomicBool::new(false);

/// Install the World::Render hook once; shared by the free-camera and swarm
/// installers (an inline hook must never be applied to the same target twice).
/// The hook is the one reliable 3D-pass injection point for extra car draws.
pub(crate) unsafe fn ensure_world_render_hook() -> bool {
    if WORLD_RENDER_HOOK_INSTALLED.load(Ordering::Acquire) {
        return !GAME_RENDER_TRAMPOLINE.is_null();
    }
    if WORLD_RENDER_HOOK_INSTALLED.swap(true, Ordering::AcqRel) {
        return !GAME_RENDER_TRAMPOLINE.is_null();
    }
    let world_render = resolve(b"_ZN5World6RenderEv\0");
    if world_render.is_null() {
        return false;
    }
    GAME_RENDER_TRAMPOLINE = install_inline_hook(
        world_render,
        hooked_world_render as *const c_void,
        GAME_RENDER_HOOK_BYTES,
    );
    !GAME_RENDER_TRAMPOLINE.is_null()
}

/// World::Render hook: draw the viewer replay car right after the track
/// geometry, while the 3D scene matrices are active. Drawing after
/// Game::Render returns lands in HUD/ortho state, and a Car::RenderGhost from
/// the update phase (as from Replay::Update) has no valid GL state at all --
/// both draw nothing. World::Render is the one 3D-pass call the viewer always
/// makes (the track is always visible), so it is the reliable injection point.
pub(crate) unsafe extern "C" fn hooked_world_render(world: *mut c_void) {
    // Measure where the camera actually sits relative to the drawn-car pose
    // now that the 3D pass is running (the view matrix was just built).
    if replay_camera::is_managed()
        && FREE_CAMERA_ACTIVE.load(Ordering::Acquire)
        && REPLAY_TARGET_MFRAME_VALID
    {
        let camera = current_camera();
        if !camera.is_null() {
            if let Some(car) =
                read_transform_car_frame(ptr::addr_of!(REPLAY_TARGET_MFRAME) as *const f32)
            {
                let pos = camera.add(3 * FREE_CAMERA_AXIS_STRIDE_FLOATS);
                let dx = ptr::read_volatile(pos) - car.pos[0];
                let dy = ptr::read_volatile(pos.add(1)) - car.pos[1];
                let dz = ptr::read_volatile(pos.add(2)) - car.pos[2];
                let dist_sq = dx * dx + dy * dy + dz * dz;
                let dist = dist_sq * fast_inverse_sqrt(dist_sq);
                ORBIT_WORLD_RENDER_DIST_1000.store((dist * 1000.0) as i32, Ordering::Release);
            }
        }
    }
    let original: GameRenderGhostFn = mem::transmute(GAME_RENDER_TRAMPOLINE);
    original(world);
    render_viewer_replay_car(CURRENT_GAME);
    // Swarm ghost cars draw here too: inside the 3D pass, right after the
    // track, in both replay playback and (race-swarm) live races. Draw calls
    // issued from the update phase (e.g. Replay::Update) have no GL state and
    // render nothing.
    swarm_render_extra_ghosts(CURRENT_GAME);
}

/// Game::Render entry hook: the 3D pass reads g_pCamera's MFrame to build the
/// view matrix (then glMultMatrixf -> World::Render), AFTER every update-phase
/// hook has run. Re-pin the managed pose to the freshest drawn-car anchor and
/// write it here, so the pose the render samples is always ours. The write
/// happens a handful of instructions before the read, with no stock camera
/// code in between.
pub(crate) unsafe extern "C" fn hooked_game_render(game: *mut c_void) {
    if replay_camera::is_managed()
        && FREE_CAMERA_ENABLED.load(Ordering::Acquire)
        && FREE_CAMERA_ACTIVE.load(Ordering::Acquire)
        && game_show_replay_active()
    {
        let camera = current_camera();
        if !camera.is_null() {
            // Diagnostic: what the stock code left in the camera for this render.
            let pos = camera.add(3 * FREE_CAMERA_AXIS_STRIDE_FLOATS);
            ORBIT_RENDER_ENTRY_CAM = [
                ptr::read_volatile(pos),
                ptr::read_volatile(pos.add(1)),
                ptr::read_volatile(pos.add(2)),
            ];
            ORBIT_RENDER_ENTRY_CAM_VALID = true;
            // Re-pin to the pose the car is drawn at this frame (same priority
            // as hooked_camera_update: follow body first, else target MFrame).
            let target = read_body_mframe(REPLAY_FOLLOW_OBJECT).or_else(|| {
                if VIEW_REPLAY_SESSION && REPLAY_TARGET_MFRAME_VALID {
                    read_transform_car_frame(ptr::addr_of!(REPLAY_TARGET_MFRAME) as *const f32)
                } else {
                    None
                }
            });
            if let Some(car) = target {
                replay_camera::recompute_pose(&car, &mut *ptr::addr_of_mut!(FREE_CAMERA_FRAME));
            }
            write_free_camera_frame(camera);
            if !CAMERA_UPDATE_THIS.is_null() && CAMERA_UPDATE_THIS != camera {
                write_free_camera_frame(CAMERA_UPDATE_THIS);
            }
            ORBIT_PROBE_RENDER_ENTRY_WRITES.fetch_add(1, Ordering::AcqRel);
            // Ground truth: read the camera back and measure its distance to
            // the drawn-car pose AT RENDER TIME (the pose the matrix uses).
            if REPLAY_TARGET_MFRAME_VALID {
                if let Some(car) =
                    read_transform_car_frame(ptr::addr_of!(REPLAY_TARGET_MFRAME) as *const f32)
                {
                    let dx = ptr::read_volatile(pos) - car.pos[0];
                    let dy = ptr::read_volatile(pos.add(1)) - car.pos[1];
                    let dz = ptr::read_volatile(pos.add(2)) - car.pos[2];
                    let dist_sq = dx * dx + dy * dy + dz * dz;
                    let dist = dist_sq * fast_inverse_sqrt(dist_sq);
                    ORBIT_RENDER_WRITE_DIST_1000.store((dist * 1000.0) as i32, Ordering::Release);
                }
            }
        }
    }
    let original: GameRenderGhostFn = mem::transmute(GAME_RENDER_ENTRY_TRAMPOLINE);
    original(game);
}

/// The passive replay viewer animates an invisible proxy body and never draws
/// the car at the playback position, so while the managed replay camera is
/// active there, draw the car ourselves at its anchor pose with the stock
/// ghost renderer (the same call the swarm feature uses in this viewer).
pub(crate) unsafe fn render_viewer_replay_car(game: *mut c_void) {
    if !VIEW_REPLAY_SESSION
        || !REPLAY_TARGET_MFRAME_VALID
        || !replay_camera::is_managed()
        || !FREE_CAMERA_ENABLED.load(Ordering::Acquire)
        || !FREE_CAMERA_ACTIVE.load(Ordering::Acquire)
        || !game_show_replay_active()
        || game.is_null()
        || !ensure_swarm_symbols()
        || CAR_RENDER_GHOST.is_null()
    {
        return;
    }
    let car =
        ptr::read_volatile((game as *mut u8).add(GAME_CURRENT_CAR_OFFSET) as *mut *mut c_void);
    if car.is_null() {
        return;
    }
    let draws = ORBIT_PROBE_VIEWER_CAR_DRAWS.fetch_add(1, Ordering::AcqRel) + 1;
    if CAR_SET_LIGHT_COLOUR.is_null() {
        CAR_SET_LIGHT_COLOUR = resolve(b"_ZN3Car14SetLightColourEjf\0");
    }
    if !CAR_SET_LIGHT_COLOUR.is_null() {
        let set_light: CarSetLightColourFn = mem::transmute(CAR_SET_LIGHT_COLOUR);
        set_light(car, 0xffff_ffff, 1.0);
    }
    // OPAQUE Car::Render(false) draw at the body pose the replay is driving
    // (SetVelocitiesToMoveToFrame keeps it within ~2 units of the playback
    // pose, and the orbit anchors on the same body). A RenderGhost silhouette
    // at the SetVel target was tried too, but it reads as a white "double
    // exposure" leading the real car, so only the opaque draw is kept.
    if CAR_RENDER.is_null() {
        CAR_RENDER = resolve(b"_ZN3Car6RenderEb\0");
    }
    if !CAR_RENDER.is_null() {
        let render: CarRenderFn = mem::transmute(CAR_RENDER);
        render(car, 0);
    }
    // #region agent log
    if draws % 300 == 0 {
        let ghost_flag =
            ptr::read_volatile((car as *mut u8).add(CAR_GHOST_MODE_FLAG_OFFSET)) as i32;
        debug_agent_log(
            "A",
            "lib.rs:render_viewer_replay_car",
            "viewer car draw",
            &[
                ("draws", draws),
                ("ghostFlag", ghost_flag),
                ("renderPath", 1),
                ("targetValid", REPLAY_TARGET_MFRAME_VALID as i32),
            ],
        );
    }
    // #endregion
}

/// The View Replay viewer animates its cinematic camera from CameraPath::Update
/// AFTER Game::UpdateCamera, so it silently overwrites the managed orbit frame
/// (the render then shows the cinematic while the orbit only exists in our
/// diagnostics). Skip the stock path writer while the managed replay camera
/// owns the frame; menu fly-throughs (not show-replay) keep the original path.
pub(crate) unsafe extern "C" fn hooked_car_render_ghost_capture(
    car: *mut c_void,
    frame: *const f32,
) {
    ORBIT_PROBE_RENDER_GHOST_CALLS.fetch_add(1, Ordering::AcqRel);
    if !IN_SWARM_RENDER && !frame.is_null() {
        ptr::copy_nonoverlapping(
            frame,
            ptr::addr_of_mut!(REPLAY_RENDER_TRANSFORM) as *mut f32,
            GHOST_TRANSFORM_BYTES / 4,
        );
        REPLAY_RENDER_TRANSFORM_VALID = true;
    }
    let original: CarRenderGhostFn = mem::transmute(CAR_RENDER_GHOST_TRAMPOLINE);
    original(car, frame);
}

/// Read the MFrame the viewer's ghost car renders with (Game::Render passes
/// Replay::GetGhostTransform() straight to Car::RenderGhost).
pub(crate) unsafe fn read_viewer_ghost_frame(game: *mut c_void) -> Option<replay_camera::CarFrame> {
    if game.is_null() {
        return None;
    }
    if REPLAY_GET_GHOST_TRANSFORM.is_null() {
        REPLAY_GET_GHOST_TRANSFORM = resolve(b"_ZN6Replay17GetGhostTransformEv\0");
        if REPLAY_GET_GHOST_TRANSFORM.is_null() {
            return None;
        }
    }
    let replay =
        ptr::read_volatile((game as *mut u8).add(GAME_REPLAY_OBJECT_OFFSET) as *mut *mut c_void);
    if replay.is_null() {
        return None;
    }
    let getter: ReplayGetGhostTransformFn = mem::transmute(REPLAY_GET_GHOST_TRANSFORM);
    read_transform_car_frame(getter(replay))
}

/// Append one diagnostic line describing every anchor/camera capture source.
pub(crate) unsafe fn orbit_probe_log(game: *mut c_void, camera: *const f32) {
    let mut buf = [0u8; 512];
    let mut len = 0usize;
    probe_push(&mut buf, &mut len, b"probe f=");
    probe_push_i32(&mut buf, &mut len, ORBIT_PROBE_FRAME_COUNT);
    probe_push(&mut buf, &mut len, b" rg=");
    probe_push_i32(
        &mut buf,
        &mut len,
        ORBIT_PROBE_RENDER_GHOST_CALLS.load(Ordering::Acquire),
    );
    probe_push(&mut buf, &mut len, b" cu=");
    probe_push_i32(
        &mut buf,
        &mut len,
        ORBIT_PROBE_CAMERA_UPDATE_CALLS.load(Ordering::Acquire),
    );
    probe_push(&mut buf, &mut len, b" sva=");
    probe_push_i32(
        &mut buf,
        &mut len,
        ORBIT_PROBE_SETVEL_ALL_CALLS.load(Ordering::Acquire),
    );
    probe_push(&mut buf, &mut len, b" svc=");
    probe_push_i32(
        &mut buf,
        &mut len,
        ORBIT_PROBE_SETVEL_CAPTURES.load(Ordering::Acquire),
    );
    probe_push(&mut buf, &mut len, b" wrv=");
    probe_push_i32(
        &mut buf,
        &mut len,
        ORBIT_PROBE_VIEWER_CAR_DRAWS.load(Ordering::Acquire),
    );
    probe_push(&mut buf, &mut len, b" rw=");
    probe_push_i32(
        &mut buf,
        &mut len,
        ORBIT_PROBE_RENDER_ENTRY_WRITES.load(Ordering::Acquire),
    );
    probe_push(&mut buf, &mut len, b" md=");
    probe_push_i32(&mut buf, &mut len, replay_camera::current_mode());
    probe_push(&mut buf, &mut len, b" rad=");
    probe_push_i32(&mut buf, &mut len, replay_camera::read_diag(1));
    probe_push(&mut buf, &mut len, b" rr=");
    probe_push_i32(&mut buf, &mut len, replay_camera::last_write_radius_1000());
    probe_push(&mut buf, &mut len, b" as=");
    probe_push_i32(
        &mut buf,
        &mut len,
        ORBIT_ANCHOR_SOURCE.load(Ordering::Acquire),
    );
    probe_push(&mut buf, &mut len, b" rwd=");
    probe_push_i32(
        &mut buf,
        &mut len,
        ORBIT_RENDER_WRITE_DIST_1000.load(Ordering::Acquire),
    );
    probe_push(&mut buf, &mut len, b" wld=");
    probe_push_i32(
        &mut buf,
        &mut len,
        ORBIT_WORLD_RENDER_DIST_1000.load(Ordering::Acquire),
    );
    probe_push(&mut buf, &mut len, b" eqc=");
    probe_push_i32(
        &mut buf,
        &mut len,
        (CAMERA_UPDATE_THIS == camera as *mut f32) as i32,
    );
    probe_push(&mut buf, &mut len, b" rp=");
    probe_push_i32(
        &mut buf,
        &mut len,
        if REPLAY_POS.is_null() {
            -1
        } else {
            ptr::read_volatile(REPLAY_POS)
        },
    );
    probe_push(&mut buf, &mut len, b" gs=");
    probe_push_i32(
        &mut buf,
        &mut len,
        if GHOST_SIZE.is_null() {
            -1
        } else {
            ptr::read_volatile(GHOST_SIZE)
        },
    );
    let vec_of = |frame: Option<replay_camera::CarFrame>| frame.map(|f| f.pos);
    probe_push_vec(
        &mut buf,
        &mut len,
        b" cam=",
        Some([
            ptr::read_volatile(camera.add(3 * FREE_CAMERA_AXIS_STRIDE_FLOATS)),
            ptr::read_volatile(camera.add(3 * FREE_CAMERA_AXIS_STRIDE_FLOATS + 1)),
            ptr::read_volatile(camera.add(3 * FREE_CAMERA_AXIS_STRIDE_FLOATS + 2)),
        ]),
    );
    probe_push_vec(
        &mut buf,
        &mut len,
        b" fw=",
        Some([
            FREE_CAMERA_FRAME[FREE_CAMERA_POSITION],
            FREE_CAMERA_FRAME[FREE_CAMERA_POSITION + 1],
            FREE_CAMERA_FRAME[FREE_CAMERA_POSITION + 2],
        ]),
    );
    probe_push_vec(
        &mut buf,
        &mut len,
        b" rc=",
        if ORBIT_RENDER_ENTRY_CAM_VALID {
            Some(ORBIT_RENDER_ENTRY_CAM)
        } else {
            None
        },
    );
    probe_push_vec(
        &mut buf,
        &mut len,
        b" tg=",
        Some(replay_camera::last_write_target()),
    );
    probe_push_vec(
        &mut buf,
        &mut len,
        b" t9=",
        if REPLAY_TARGET_MFRAME_VALID {
            vec_of(read_transform_car_frame(
                ptr::addr_of!(REPLAY_TARGET_MFRAME) as *const f32,
            ))
        } else {
            None
        },
    );
    probe_push_vec(
        &mut buf,
        &mut len,
        b" t7=",
        vec_of(read_body_mframe(REPLAY_FOLLOW_OBJECT)),
    );
    probe_push_vec(
        &mut buf,
        &mut len,
        b" t6=",
        if REPLAY_RENDER_TRANSFORM_VALID {
            vec_of(read_transform_car_frame(
                ptr::addr_of!(REPLAY_RENDER_TRANSFORM) as *const f32,
            ))
        } else {
            None
        },
    );
    probe_push_vec(
        &mut buf,
        &mut len,
        b" gt=",
        vec_of(read_transform_car_frame(GHOST_TRANSFORM as *const f32)),
    );
    probe_push_vec(
        &mut buf,
        &mut len,
        b" lc=",
        vec_of(read_live_car_frame(game)),
    );
    probe_push_vec(
        &mut buf,
        &mut len,
        b" gg=",
        vec_of(read_viewer_ghost_frame(game)),
    );
    probe_push(&mut buf, &mut len, b"\n");

    let fd = open(
        ORBIT_PROBE_LOG_PATH.as_ptr() as *const c_char,
        O_WRONLY | O_CREAT | O_APPEND,
        0o644,
    );
    if fd >= 0 {
        write(fd, buf.as_ptr() as *const c_void, len);
        close(fd);
    }
}

pub(crate) unsafe extern "C" fn hooked_set_velocities_to_move_to_frame(
    object: *mut c_void,
    frame: *const f32,
    dt: f32,
) {
    ORBIT_PROBE_SETVEL_ALL_CALLS.fetch_add(1, Ordering::AcqRel);
    if !frame.is_null()
        && !REPLAY_FOLLOW_OBJECT.is_null()
        && object == REPLAY_FOLLOW_OBJECT as *mut c_void
    {
        ORBIT_PROBE_SETVEL_CAPTURES.fetch_add(1, Ordering::AcqRel);
        ptr::copy_nonoverlapping(
            frame,
            ptr::addr_of_mut!(REPLAY_TARGET_MFRAME) as *mut f32,
            GHOST_TRANSFORM_BYTES / 4,
        );
        REPLAY_TARGET_MFRAME_VALID = true;
    }
    let original: SetVelocitiesToMoveToFrameFn = mem::transmute(SET_VEL_TO_FRAME_TRAMPOLINE);
    original(object, frame, dt);
}

pub(crate) unsafe extern "C" fn hooked_camera_update(
    camera: *mut c_void,
    dt: f32,
    object: *mut c_void,
    look_offset: *const f32,
    flag_a: u8,
    flag_b: u8,
) {
    if !object.is_null() {
        REPLAY_FOLLOW_OBJECT = object as *mut f32;
    }
    ORBIT_PROBE_CAMERA_UPDATE_CALLS.fetch_add(1, Ordering::AcqRel);
    if !camera.is_null() {
        CAMERA_UPDATE_THIS = camera as *mut f32;
    }
    let original: CameraUpdateFn = mem::transmute(CAMERA_UPDATE_TRAMPOLINE);
    original(camera, dt, object, look_offset, flag_a, flag_b);
    // While the managed replay camera owns the frame, re-pin the pose to the
    // car body that was JUST driven (this hook runs inside Replay::Update,
    // right after SetFrame/SetVelocitiesToMoveToFrame moved it). This both
    // out-writes the stock chase pose and removes the one-frame skew between
    // the camera (computed in Game::UpdateCamera, possibly before the body
    // update) and the rendered car (drawn from the body afterwards).
    if !camera.is_null()
        && replay_camera::is_managed()
        && FREE_CAMERA_ENABLED.load(Ordering::Acquire)
        && FREE_CAMERA_ACTIVE.load(Ordering::Acquire)
        && game_show_replay_active()
    {
        // Re-pin to the SAME pose the car is drawn at: the body MFrame
        // (Car::Render reads the body directly, in post-race replays and via
        // the viewer's opaque draw). Fall back to the SetVel target pose.
        let target = read_body_mframe(object as *mut f32).or_else(|| {
            if VIEW_REPLAY_SESSION && REPLAY_TARGET_MFRAME_VALID {
                read_transform_car_frame(ptr::addr_of!(REPLAY_TARGET_MFRAME) as *const f32)
            } else {
                None
            }
        });
        if let Some(car) = target {
            replay_camera::recompute_pose(&car, &mut *ptr::addr_of_mut!(FREE_CAMERA_FRAME));
        }
        write_free_camera_frame(camera as *mut f32);
    }
}

pub(crate) unsafe extern "C" fn hooked_camera_path_update(path: *mut c_void, dt: f32) {
    // Always run the stock camera path: skipping it freezes its side state
    // (e.g. the hide-the-car flag used by onboard segments), which leaves the
    // replay car invisible. It runs after Game::UpdateCamera, so while the
    // managed replay camera owns the frame, re-assert our pose right after --
    // last writer wins and the orbit is what actually renders.
    let original: CameraPathUpdateFn = mem::transmute(CAMERA_PATH_UPDATE_TRAMPOLINE);
    original(path, dt);
    if replay_camera::is_managed()
        && FREE_CAMERA_ENABLED.load(Ordering::Acquire)
        && FREE_CAMERA_ACTIVE.load(Ordering::Acquire)
        && game_show_replay_active()
    {
        let camera = current_camera();
        if !camera.is_null() {
            write_free_camera_frame(camera);
        }
        // The viewer renders through its own Camera (the Camera::Update this),
        // which the path playback can also write; re-assert there too.
        if !CAMERA_UPDATE_THIS.is_null() && CAMERA_UPDATE_THIS != camera {
            write_free_camera_frame(CAMERA_UPDATE_THIS);
        }
    }
}
