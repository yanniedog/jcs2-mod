//! All JNI entry points exported to `com.trueaxis.modmenu.RequiredPatches`.

use crate::replay_camera;
use crate::*;

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_installNativeCrashLogger(
    _env: *mut c_void,
    _class: *mut c_void,
) -> u8 {
    install_native_signal_handlers() as u8
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_applyUnlimitedCheckpoints(
    _env: *mut c_void,
    _class: *mut c_void,
) -> u8 {
    let checkpoints = force_checkpoint_limit();
    let iap = force_iap_ownership();
    let worker = install_retained_patch_worker();
    (checkpoints && iap && worker) as u8
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_installUserTrackFeatureHooks(
    _env: *mut c_void,
    _class: *mut c_void,
) -> u8 {
    install_user_track_hooks() as u8
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_installReplayFreeCameraHooks(
    _env: *mut c_void,
    _class: *mut c_void,
) -> u8 {
    let installed = install_free_camera_hooks();
    if installed {
        FREE_CAMERA_ENABLED.store(true, Ordering::Release);
    }
    installed as u8
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_setReplayFreeCameraEnabled(
    _env: *mut c_void,
    _class: *mut c_void,
    enabled: u8,
) {
    let enabled = enabled != 0;
    FREE_CAMERA_ENABLED.store(enabled, Ordering::Release);
    if !enabled {
        FREE_CAMERA_ACTIVE.store(false, Ordering::Release);
        FREE_CAMERA_CAPTURE_REQUESTED.store(false, Ordering::Release);
    }
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_setReplayFreeCameraLocked(
    _env: *mut c_void,
    _class: *mut c_void,
    locked: u8,
) {
    if locked == 0 {
        FREE_CAMERA_ACTIVE.store(false, Ordering::Release);
        FREE_CAMERA_CAPTURE_REQUESTED.store(false, Ordering::Release);
        return;
    }
    FREE_CAMERA_ENABLED.store(true, Ordering::Release);
    FREE_CAMERA_CAPTURE_REQUESTED.store(true, Ordering::Release);
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_resetReplayFreeCamera(
    _env: *mut c_void,
    _class: *mut c_void,
) {
    if replay_camera::is_managed() {
        // Managed modes stay active; restore the captured default framing.
        replay_camera::reset();
        return;
    }
    FREE_CAMERA_ACTIVE.store(false, Ordering::Release);
    FREE_CAMERA_CAPTURE_REQUESTED.store(false, Ordering::Release);
}

/// Select the active replay camera mode (see `replay_camera::MODE_*`).
#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_setReplayCameraMode(
    _env: *mut c_void,
    _class: *mut c_void,
    mode: c_int,
) {
    replay_camera::set_mode(mode as i32);
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_nudgeReplayFreeCamera(
    _env: *mut c_void,
    _class: *mut c_void,
    right: f32,
    up: f32,
    forward: f32,
    yaw: f32,
    pitch: f32,
) {
    if !FREE_CAMERA_ENABLED.load(Ordering::Acquire)
        || !FREE_CAMERA_IN_LEVEL_INTRO.load(Ordering::Acquire)
    {
        return;
    }
    nudge_free_camera(right, up, forward, yaw, pitch);
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_gestureReplayFreeCamera(
    _env: *mut c_void,
    _class: *mut c_void,
    right: f32,
    up: f32,
    forward: f32,
    yaw: f32,
    pitch: f32,
    car_right: f32,
    car_up: f32,
) {
    if !FREE_CAMERA_ENABLED.load(Ordering::Acquire)
        || !FREE_CAMERA_IN_LEVEL_INTRO.load(Ordering::Acquire)
        || !game_show_replay_active()
    {
        return;
    }
    if replay_camera::is_managed() {
        // Constrained sphere model: gestures may only zoom (distance) or change
        // perspective (which side of the car faces the camera). Pan/tilt/yaw are
        // intentionally dropped so the car can never be dragged off-centre.
        if forward != 0.0 {
            replay_camera::zoom(forward);
        }
        let dx = (right + car_right) * REPLAY_CAMERA_PERSPECTIVE_SCALE;
        let dy = (up + car_up) * REPLAY_CAMERA_PERSPECTIVE_SCALE;
        if dx != 0.0 || dy != 0.0 {
            replay_camera::perspective(dx, dy);
        }
        return;
    }
    apply_free_camera_gesture(right, up, forward, yaw, pitch, car_right, car_up);
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_readReplayFreeCameraStatus(
    _env: *mut c_void,
    _class: *mut c_void,
) -> c_int {
    let mut status = 0;
    if FREE_CAMERA_ENABLED.load(Ordering::Acquire) {
        status |= 1;
    }
    if FREE_CAMERA_IN_LEVEL_INTRO.load(Ordering::Acquire) {
        status |= 2;
    }
    if FREE_CAMERA_ACTIVE.load(Ordering::Acquire) {
        status |= 4;
    }
    // Require active playback motion so the gesture overlay drops on static
    // replay/selection menus (where it otherwise blocks the centre lists) while
    // staying present during playback (the car, hence the chase camera, moves).
    if game_show_replay_active() && FREE_CAMERA_PLAYBACK_MOVING.load(Ordering::Acquire) {
        status |= 8;
    }
    status
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_readReplayCameraDiag(
    _env: *mut c_void,
    _class: *mut c_void,
    field: c_int,
) -> c_int {
    if field == 7 {
        return ORBIT_ANCHOR_ERROR_1000.load(Ordering::Acquire);
    }
    if field == 8 {
        return ORBIT_ANCHOR_SOURCE.load(Ordering::Acquire);
    }
    replay_camera::read_diag(field)
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_readLatestCheckpointSplit(
    _env: *mut c_void,
    _class: *mut c_void,
) -> i64 {
    if !ensure_split_symbols() {
        reset_split_tracking();
        reset_ghost_checkpoint_fallback();
        return 0;
    }

    capture_ghost_replay_baseline();

    let ghost_count = effective_ghost_checkpoint_count();
    let ghost_size = ptr::read_volatile(GHOST_SIZE).max(0);
    if ghost_size < 1 || ghost_count < 1 {
        reset_split_tracking();
        if ghost_size < 1 {
            reset_ghost_checkpoint_fallback();
        }
        return 0;
    }

    let finish = final_finish_split(ghost_count);
    if finish != 0 {
        return finish;
    }

    if ptr::read_volatile(SHOW_REPLAY) != 0 {
        reset_split_tracking();
        return 0;
    }

    let mut checkpoint = latest_live_checkpoint();
    if checkpoint < 1 {
        reset_split_tracking();
        return 1i64 << 32;
    }

    let current_ms = live_checkpoint_ms(checkpoint);
    let ghost_ms = ghost_checkpoint_ms(checkpoint);
    if current_ms <= 0 || ghost_ms < 0 {
        // Live timer has reset or the ghost lookup is unavailable: arm, no split.
        reset_split_tracking();
        return 1i64 << 32;
    }

    if LAST_SPLIT_CHECKPOINT >= 1
        && checkpoint > LAST_SPLIT_CHECKPOINT
        && current_ms <= LAST_SPLIT_CURRENT_MS + 250
    {
        checkpoint = LAST_SPLIT_CHECKPOINT;
    }

    let ghost_ms = ghost_checkpoint_ms(checkpoint);
    if ghost_ms < 0 {
        reset_split_tracking();
        return 1i64 << 32;
    }

    // Restart / rewind guard: if the checkpoint number went backwards or the live
    // time jumped back, the race restarted - re-arm rather than show a stale split.
    if checkpoint < LAST_SPLIT_CHECKPOINT
        || (LAST_SPLIT_CURRENT_MS >= 0 && current_ms + 500 < LAST_SPLIT_CURRENT_MS)
    {
        reset_split_tracking();
        return 1i64 << 32;
    }

    LAST_SPLIT_CHECKPOINT = checkpoint;
    LAST_SPLIT_CURRENT_MS = current_ms;
    packed_split(checkpoint, current_ms, ghost_ms)
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_readLatestCheckpointCurrentMillis(
    _env: *mut c_void,
    _class: *mut c_void,
) -> i32 {
    let ghost_count = effective_ghost_checkpoint_count();
    if LAST_SPLIT_CHECKPOINT > ghost_count && replay_header_is_current_finish() {
        return replay_header_finish_ms();
    }
    let checkpoint = latest_live_checkpoint();
    if checkpoint < 1 {
        return -1;
    }
    live_checkpoint_ms(checkpoint)
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_readLatestCheckpointGhostMillis(
    _env: *mut c_void,
    _class: *mut c_void,
) -> i32 {
    let ghost_count = effective_ghost_checkpoint_count();
    if LAST_SPLIT_CHECKPOINT > ghost_count {
        return FALLBACK_GHOST_FINISH_MS;
    }
    let checkpoint = latest_live_checkpoint();
    if checkpoint < 1 {
        return -1;
    }
    ghost_checkpoint_ms(checkpoint)
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_readGhostCheckpointMillis(
    _env: *mut c_void,
    _class: *mut c_void,
    checkpoint: c_int,
) -> i32 {
    if !ensure_split_symbols() || checkpoint < 1 {
        return -1;
    }
    ghost_checkpoint_ms(checkpoint)
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_readSplitLastCheckpointMillis(
    _env: *mut c_void,
    _class: *mut c_void,
) -> i32 {
    if !ensure_split_symbols() {
        return -1;
    }
    last_checkpoint_ms()
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_readSplitScannedCheckpointIndex(
    _env: *mut c_void,
    _class: *mut c_void,
) -> i32 {
    if !ensure_split_symbols() {
        return -1;
    }
    scan_live_checkpoint_from_last_time()
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_readSplitEngineLastCheckpointIndex(
    _env: *mut c_void,
    _class: *mut c_void,
) -> i32 {
    if !ensure_split_symbols() || LAST_CHECKPOINT_INDEX.is_null() {
        return -1;
    }
    ptr::read_volatile(LAST_CHECKPOINT_INDEX)
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_readSplitDecodedEngineCheckpointIndex(
    _env: *mut c_void,
    _class: *mut c_void,
) -> i32 {
    if !ensure_split_symbols() || LAST_CHECKPOINT_INDEX.is_null() {
        return -1;
    }
    decoded_live_checkpoint_index()
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_readSplitLiveCheckpointCount(
    _env: *mut c_void,
    _class: *mut c_void,
) -> i32 {
    if !ensure_split_symbols() {
        return -1;
    }
    live_checkpoint_count()
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_readSplitGhostCheckpointCount(
    _env: *mut c_void,
    _class: *mut c_void,
) -> i32 {
    if !ensure_split_symbols() {
        return -1;
    }
    effective_ghost_checkpoint_count()
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_readSplitOfficialGhostCheckpointCount(
    _env: *mut c_void,
    _class: *mut c_void,
) -> i32 {
    if !ensure_split_symbols() {
        return -1;
    }
    official_ghost_checkpoint_count()
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_readSplitResolvedCheckpoint(
    _env: *mut c_void,
    _class: *mut c_void,
) -> i32 {
    if !ensure_split_symbols() {
        return -1;
    }
    latest_live_checkpoint()
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_readSplitLiveArrayMillis(
    _env: *mut c_void,
    _class: *mut c_void,
    index: c_int,
) -> i32 {
    if !ensure_split_symbols() {
        return -1;
    }
    checkpoint_time_ms(index)
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_readSplitOfficialGhostArrayMillis(
    _env: *mut c_void,
    _class: *mut c_void,
    index: c_int,
) -> i32 {
    if !ensure_split_symbols() {
        return -1;
    }
    official_ghost_checkpoint_time_ms(index)
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_readSplitReplayHeaderSize(
    _env: *mut c_void,
    _class: *mut c_void,
) -> i32 {
    if !ensure_split_symbols() {
        return -1;
    }
    replay_header_i32(REPLAY_HEADER_REPLAY_SIZE_OFFSET)
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_readSplitReplayHeaderCheckpointCount(
    _env: *mut c_void,
    _class: *mut c_void,
) -> i32 {
    if !ensure_split_symbols() {
        return -1;
    }
    replay_header_checkpoint_count()
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_readSplitReplayHeaderFinishMillis(
    _env: *mut c_void,
    _class: *mut c_void,
) -> i32 {
    if !ensure_split_symbols() {
        return -1;
    }
    replay_header_finish_ms()
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_readSplitGhostPos(
    _env: *mut c_void,
    _class: *mut c_void,
) -> i32 {
    if !ensure_split_symbols() {
        return -1;
    }
    read_i32_pointer(GHOST_POS)
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_readSplitLastGhostPos(
    _env: *mut c_void,
    _class: *mut c_void,
) -> i32 {
    if !ensure_split_symbols() {
        return -1;
    }
    read_i32_pointer(LAST_GHOST_POS)
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_readSplitLastReplaySize(
    _env: *mut c_void,
    _class: *mut c_void,
) -> i32 {
    if !ensure_split_symbols() {
        return -1;
    }
    read_i32_pointer(LAST_REPLAY_SIZE)
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_readSplitGhostVisualMillis(
    _env: *mut c_void,
    _class: *mut c_void,
) -> i32 {
    if !ensure_split_symbols() {
        return -1;
    }
    replay_nodes_to_ms(read_i32_pointer(LAST_GHOST_POS))
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_readSplitReplayVisualMillis(
    _env: *mut c_void,
    _class: *mut c_void,
) -> i32 {
    if !ensure_split_symbols() {
        return -1;
    }
    replay_nodes_to_ms(read_i32_pointer(LAST_REPLAY_SIZE))
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_readSplitVisualDeltaMillis(
    _env: *mut c_void,
    _class: *mut c_void,
) -> i32 {
    if !ensure_split_symbols() {
        return -1;
    }
    let replay = read_i32_pointer(LAST_REPLAY_SIZE);
    let ghost = read_i32_pointer(LAST_GHOST_POS);
    if replay < 0 || ghost < 0 {
        -1
    } else {
        replay_nodes_to_ms(replay - ghost)
    }
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_readSplitGhostCheckpointDistanceSq1000(
    _env: *mut c_void,
    _class: *mut c_void,
) -> i32 {
    if !ensure_split_symbols() {
        return -1;
    }
    ghost_checkpoint_distance_sq1000()
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_readSplitGhostRetrySkipIndex(
    _env: *mut c_void,
    _class: *mut c_void,
) -> i32 {
    if !ensure_split_symbols() {
        return -1;
    }
    read_i32_pointer(GHOST_RETRY_SKIP_INDEX)
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_readSplitLastGhostRetrySkipIndex(
    _env: *mut c_void,
    _class: *mut c_void,
) -> i32 {
    if !ensure_split_symbols() {
        return -1;
    }
    read_i32_pointer(LAST_GHOST_RETRY_SKIP_INDEX)
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_readSplitGhostRetryPauseTime(
    _env: *mut c_void,
    _class: *mut c_void,
) -> i32 {
    if !ensure_split_symbols() {
        return -1;
    }
    read_i32_pointer(GHOST_RETRY_PAUSE_TIME)
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_readSplitLastGhostRetryPauseTime(
    _env: *mut c_void,
    _class: *mut c_void,
) -> i32 {
    if !ensure_split_symbols() {
        return -1;
    }
    read_i32_pointer(LAST_GHOST_RETRY_PAUSE_TIME)
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_readSplitGhostRetrySkipCount(
    _env: *mut c_void,
    _class: *mut c_void,
) -> i32 {
    if !ensure_split_symbols() {
        return -1;
    }
    read_i32_pointer(NUM_GHOST_RETRY_SKIP_TIMES)
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_readSplitGhostSize(
    _env: *mut c_void,
    _class: *mut c_void,
) -> i32 {
    if !ensure_split_symbols() {
        return -1;
    }
    ptr::read_volatile(GHOST_SIZE).max(0)
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_readSplitShowReplayFlag(
    _env: *mut c_void,
    _class: *mut c_void,
) -> i32 {
    if !ensure_split_symbols() || SHOW_REPLAY.is_null() {
        return -1;
    }
    ptr::read_volatile(SHOW_REPLAY) as i32
}

pub(crate) unsafe fn jni_copy_bytes_to_array(
    env: *mut c_void,
    array: *mut c_void,
    data: *const u8,
    len: usize,
) -> i32 {
    if env.is_null() || array.is_null() || data.is_null() || len == 0 {
        return 0;
    }
    let env_table = env as *mut *const *const c_void;
    let functions = *env_table;
    if functions.is_null() {
        return 0;
    }
    // JNIEnv function table: GetArrayLength=171, GetByteArrayElements=184,
    // ReleaseByteArrayElements=192.
    let get_length: unsafe extern "C" fn(*mut c_void, *mut c_void) -> i32 =
        mem::transmute(*functions.add(171));
    let get_elements: unsafe extern "C" fn(*mut c_void, *mut c_void, *mut u8) -> *mut i8 =
        mem::transmute(*functions.add(184));
    let release_elements: unsafe extern "C" fn(*mut c_void, *mut c_void, *mut i8, i32) =
        mem::transmute(*functions.add(192));
    let capacity = get_length(env, array);
    if capacity <= 0 {
        return 0;
    }
    let write_len = if len > capacity as usize {
        capacity as usize
    } else {
        len
    };
    let elements = get_elements(env, array, ptr::null_mut());
    if elements.is_null() {
        return 0;
    }
    ptr::copy_nonoverlapping(data, elements as *mut u8, write_len);
    release_elements(env, array, elements, 0);
    write_len as i32
}

pub(crate) unsafe fn jni_read_int_array(
    env: *mut c_void,
    array: *mut c_void,
    out: *mut i32,
    max: usize,
) -> i32 {
    if env.is_null() || array.is_null() || out.is_null() || max == 0 {
        return 0;
    }
    let env_table = env as *mut *const *const c_void;
    let functions = *env_table;
    if functions.is_null() {
        return 0;
    }
    // JNIEnv function table: GetArrayLength=171, GetIntArrayElements=187,
    // ReleaseIntArrayElements=195. (The byte-array getters previously used
    // here type-mismatch an int[] and paired the wrong release slot.)
    let get_length: unsafe extern "C" fn(*mut c_void, *mut c_void) -> i32 =
        mem::transmute(*functions.add(171));
    let get_elements: unsafe extern "C" fn(*mut c_void, *mut c_void, *mut u8) -> *mut i32 =
        mem::transmute(*functions.add(187));
    let release_elements: unsafe extern "C" fn(*mut c_void, *mut c_void, *mut i32, i32) =
        mem::transmute(*functions.add(195));
    let length = get_length(env, array).max(0) as usize;
    if length == 0 {
        return 0;
    }
    let read_len = if length > max { max } else { length };
    let elements = get_elements(env, array, ptr::null_mut());
    if elements.is_null() {
        return 0;
    }
    ptr::copy_nonoverlapping(elements, out, read_len);
    release_elements(env, array, elements, 0);
    read_len as i32
}

/// Read up to `max` bytes from a Java byte[] into `out`; returns bytes read.
pub(crate) unsafe fn jni_read_byte_array(
    env: *mut c_void,
    array: *mut c_void,
    out: *mut u8,
    max: usize,
) -> i32 {
    if env.is_null() || array.is_null() || out.is_null() || max == 0 {
        return 0;
    }
    let env_table = env as *mut *const *const c_void;
    let functions = *env_table;
    if functions.is_null() {
        return 0;
    }
    // GetArrayLength=171, GetByteArrayElements=184, ReleaseByteArrayElements=192.
    let get_length: unsafe extern "C" fn(*mut c_void, *mut c_void) -> i32 =
        mem::transmute(*functions.add(171));
    let get_elements: unsafe extern "C" fn(*mut c_void, *mut c_void, *mut u8) -> *mut u8 =
        mem::transmute(*functions.add(184));
    let release_elements: unsafe extern "C" fn(*mut c_void, *mut c_void, *mut u8, i32) =
        mem::transmute(*functions.add(192));
    let length = get_length(env, array).max(0) as usize;
    if length == 0 {
        return 0;
    }
    let read_len = if length > max { max } else { length };
    let elements = get_elements(env, array, ptr::null_mut());
    if elements.is_null() {
        return 0;
    }
    ptr::copy_nonoverlapping(elements, out, read_len);
    release_elements(env, array, elements, 0);
    read_len as i32
}

/// Mod-menu Orbit tuning: stand-off radius (world units), rotation speed
/// (deg/s) and camera height (elevation angle, degrees).
#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_setReplayOrbitTuning(
    _env: *mut c_void,
    _class: *mut c_void,
    radius_units: c_int,
    deg_per_s: c_int,
    elev_deg: c_int,
) {
    replay_camera::configure_orbit(radius_units, deg_per_s, elev_deg);
}

/// Mod-menu Trackside tuning: side selection (0 alternate / 1 left / 2 right),
/// lateral offset, height, placement-ahead (min) and switch (max) distances.
#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_setReplayTracksideTuning(
    _env: *mut c_void,
    _class: *mut c_void,
    side_mode: c_int,
    side_dist: c_int,
    height: c_int,
    min_dist: c_int,
    max_dist: c_int,
) {
    replay_camera::configure_trackside(side_mode, side_dist, height, min_dist, max_dist);
}

/// Enable camera-mode auto-cycling with the given per-mode dwell seconds.
#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_setReplayCameraCycle(
    _env: *mut c_void,
    _class: *mut c_void,
    enabled: u8,
    seconds: c_int,
) {
    replay_camera::configure_cycle(enabled != 0, seconds);
}

/// Enable rendering the selected swarm ghosts during live races too.
#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_setReplayRaceSwarmEnabled(
    _env: *mut c_void,
    _class: *mut c_void,
    enabled: u8,
) {
    RACE_SWARM_ENABLED.store(enabled != 0, Ordering::Release);
}

/// Seed a replay path (UTF-8 bytes) into the swarm catalog. The Java side
/// persists paths seen by the ViewReplay hook and replays them here on the
/// next launch, so the picker offers every known replay without the user
/// having to re-open each one first.
#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_addReplaySwarmCatalogPath(
    env: *mut c_void,
    _class: *mut c_void,
    path: *mut c_void,
) {
    let mut buf = [0u8; SWARM_CATALOG_PATH_BYTES + 1];
    let len = jni_read_byte_array(env, path, buf.as_mut_ptr(), SWARM_CATALOG_PATH_BYTES);
    if len > 0 {
        swarm_catalog_note_path(buf.as_ptr() as *const c_char);
    }
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_installReplaySwarmHooks(
    _env: *mut c_void,
    _class: *mut c_void,
) -> u8 {
    install_replay_swarm_hooks() as u8
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_setReplaySwarmEnabled(
    _env: *mut c_void,
    _class: *mut c_void,
    enabled: u8,
) {
    let on = enabled != 0;
    REPLAY_SWARM_ENABLED.store(on, Ordering::Release);
    if !on {
        swarm_reset_catalog();
    }
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_clearReplaySwarm(
    _env: *mut c_void,
    _class: *mut c_void,
) {
    swarm_reset_ghosts();
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_readReplaySwarmActive(
    _env: *mut c_void,
    _class: *mut c_void,
) -> i32 {
    if !REPLAY_SWARM_ENABLED.load(Ordering::Acquire) {
        return 0;
    }
    if REPLAY_SWARM_ACTIVE.load(Ordering::Acquire) {
        return 2;
    }
    if leaderboard_ready() {
        return 1;
    }
    0
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_readReplaySwarmCatalogCount(
    _env: *mut c_void,
    _class: *mut c_void,
) -> i32 {
    SWARM_CATALOG_LEN as i32
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_readReplaySwarmPrimaryIndex(
    _env: *mut c_void,
    _class: *mut c_void,
) -> i32 {
    SWARM_PRIMARY_CATALOG_INDEX
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_readReplaySwarmGhostCount(
    _env: *mut c_void,
    _class: *mut c_void,
) -> i32 {
    SWARM_GHOST_COUNT as i32
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_readReplaySwarmCatalogPath(
    env: *mut c_void,
    _class: *mut c_void,
    index: i32,
    out: *mut c_void,
) -> i32 {
    if index < 0 || index as usize >= SWARM_CATALOG_LEN {
        return 0;
    }
    let slot = index as usize;
    jni_copy_bytes_to_array(
        env,
        out,
        SWARM_CATALOG_PATHS[slot].as_ptr(),
        SWARM_CATALOG_PATH_LEN[slot],
    )
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_setReplaySwarmSelection(
    env: *mut c_void,
    _class: *mut c_void,
    primary_index: i32,
    secondary_indices: *mut c_void,
) {
    if !REPLAY_SWARM_ENABLED.load(Ordering::Acquire) || !ensure_swarm_symbols() {
        return;
    }
    if primary_index < 0 || primary_index as usize >= SWARM_CATALOG_LEN {
        return;
    }
    swarm_reset_ghosts();
    SWARM_PRIMARY_CATALOG_INDEX = primary_index;

    let mut indices = [0i32; SWARM_MAX_GHOSTS];
    let count = jni_read_int_array(
        env,
        secondary_indices,
        indices.as_mut_ptr(),
        SWARM_MAX_GHOSTS,
    );
    if count <= 0 {
        return;
    }

    let mut ghost_slot = 0usize;
    let mut read = 0i32;
    while read < count && ghost_slot < SWARM_MAX_GHOSTS {
        let catalog_index = indices[read as usize];
        read += 1;
        if catalog_index < 0 || catalog_index as usize >= SWARM_CATALOG_LEN {
            continue;
        }
        if catalog_index == primary_index {
            continue;
        }
        let path_bytes = SWARM_CATALOG_PATHS[catalog_index as usize].as_ptr();
        let mut path = [0u8; SWARM_CATALOG_PATH_BYTES + 1];
        let path_len = SWARM_CATALOG_PATH_LEN[catalog_index as usize];
        if path_len == 0 || path_len > SWARM_CATALOG_PATH_BYTES {
            continue;
        }
        ptr::copy_nonoverlapping(path_bytes, path.as_mut_ptr(), path_len);
        let (nodes, node_count) = swarm_load_ghost_nodes_from_path(path.as_ptr() as *const c_char);
        if nodes.is_null() || node_count < 2 {
            continue;
        }
        SWARM_GHOST_NODES[ghost_slot] = nodes;
        SWARM_GHOST_NODE_COUNT[ghost_slot] = node_count;
        ghost_slot += 1;
    }
    SWARM_GHOST_COUNT = ghost_slot;
    // Put the watched replay back into the Replay object (the ghost loads
    // replaced its data) so playback keeps looping the right file.
    swarm_restore_primary_replay(primary_index);
    REPLAY_SWARM_ACTIVE.store(SWARM_GHOST_COUNT > 0, Ordering::Release);
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_readLeaderboardEntryCount(
    _env: *mut c_void,
    _class: *mut c_void,
) -> i32 {
    leaderboard_entry_count()
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_readLeaderboardReady(
    _env: *mut c_void,
    _class: *mut c_void,
) -> i32 {
    leaderboard_ready() as i32
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_readLeaderboardEntryTimeMs(
    _env: *mut c_void,
    _class: *mut c_void,
    index: i32,
) -> i32 {
    let mut time_ms = 0i32;
    let mut score_id = 0i32;
    let mut scratch = [0u8; 4];
    if leaderboard_read_entry(
        index,
        &mut time_ms,
        &mut score_id,
        scratch.as_mut_ptr(),
        scratch.len(),
    ) {
        time_ms
    } else {
        -1
    }
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_readLeaderboardEntryScoreId(
    _env: *mut c_void,
    _class: *mut c_void,
    index: i32,
) -> i32 {
    let mut time_ms = 0i32;
    let mut score_id = 0i32;
    let mut scratch = [0u8; 4];
    if leaderboard_read_entry(
        index,
        &mut time_ms,
        &mut score_id,
        scratch.as_mut_ptr(),
        scratch.len(),
    ) {
        score_id
    } else {
        -1
    }
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_readLeaderboardEntryName(
    env: *mut c_void,
    _class: *mut c_void,
    index: i32,
    out: *mut c_void,
) -> i32 {
    let mut time_ms = 0i32;
    let mut score_id = 0i32;
    let mut name = [0u8; LEADERBOARD_NAME_BYTES];
    if !leaderboard_read_entry(
        index,
        &mut time_ms,
        &mut score_id,
        name.as_mut_ptr(),
        name.len(),
    ) {
        return 0;
    }
    let len = c_strlen(name.as_ptr());
    jni_copy_bytes_to_array(env, out, name.as_ptr(), len)
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_fetchLeaderboardReplay(
    _env: *mut c_void,
    _class: *mut c_void,
    index: i32,
) -> i32 {
    leaderboard_fetch_begin(index)
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_readLeaderboardReplayFetchStatus(
    _env: *mut c_void,
    _class: *mut c_void,
    index: i32,
) -> i32 {
    leaderboard_fetch_status_for_index(index)
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_readLeaderboardReplayPath(
    env: *mut c_void,
    _class: *mut c_void,
    index: i32,
    out: *mut c_void,
) -> i32 {
    let mut path = [0u8; LEADERBOARD_REPLAY_PATH_BYTES];
    let len = leaderboard_fetch_path_for_index(index, path.as_mut_ptr(), path.len());
    if len <= 0 {
        return 0;
    }
    jni_copy_bytes_to_array(env, out, path.as_ptr(), len as usize)
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_startSwarmWatch(
    env: *mut c_void,
    _class: *mut c_void,
    primary: *mut c_void,
    ghost_paths: *mut c_void,
) -> i32 {
    let mut primary_buf = [0u8; SWARM_CATALOG_PATH_BYTES + 1];
    let primary_len =
        jni_read_byte_array(env, primary, primary_buf.as_mut_ptr(), SWARM_CATALOG_PATH_BYTES);
    if primary_len <= 0 {
        return 0;
    }
    let mut ghost_ptrs = [ptr::null(); SWARM_MAX_GHOSTS];
    let mut ghost_bufs = [[0u8; SWARM_CATALOG_PATH_BYTES + 1]; SWARM_MAX_GHOSTS];
    let ghost_count = jni_read_swarm_path_array(
        env,
        ghost_paths,
        ghost_bufs.as_mut_ptr(),
        ghost_ptrs.as_mut_ptr(),
        SWARM_MAX_GHOSTS,
    );
    swarm_start_watch(
        primary_buf.as_ptr() as *const c_char,
        ghost_ptrs.as_ptr(),
        ghost_count,
    ) as i32
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_startSwarmRace(
    env: *mut c_void,
    _class: *mut c_void,
    primary: *mut c_void,
    ghost_paths: *mut c_void,
) -> i32 {
    let mut primary_buf = [0u8; SWARM_CATALOG_PATH_BYTES + 1];
    let primary_len =
        jni_read_byte_array(env, primary, primary_buf.as_mut_ptr(), SWARM_CATALOG_PATH_BYTES);
    if primary_len <= 0 {
        return 0;
    }
    let mut ghost_ptrs = [ptr::null(); SWARM_MAX_GHOSTS];
    let mut ghost_bufs = [[0u8; SWARM_CATALOG_PATH_BYTES + 1]; SWARM_MAX_GHOSTS];
    let ghost_count = jni_read_swarm_path_array(
        env,
        ghost_paths,
        ghost_bufs.as_mut_ptr(),
        ghost_ptrs.as_mut_ptr(),
        SWARM_MAX_GHOSTS,
    );
    swarm_start_race(
        primary_buf.as_ptr() as *const c_char,
        ghost_ptrs.as_ptr(),
        ghost_count,
    ) as i32
}

pub(crate) unsafe fn jni_read_swarm_path_array(
    env: *mut c_void,
    array: *mut c_void,
    storage: *mut [u8; SWARM_CATALOG_PATH_BYTES + 1],
    out_ptrs: *mut *const c_char,
    max: usize,
) -> usize {
    if env.is_null() || array.is_null() || storage.is_null() || out_ptrs.is_null() || max == 0 {
        return 0;
    }
    let env_table = env as *mut *const *const c_void;
    let functions = *env_table;
    if functions.is_null() {
        return 0;
    }
    let get_length: unsafe extern "C" fn(*mut c_void, *mut c_void) -> i32 =
        mem::transmute(*functions.add(171));
    let get_object: unsafe extern "C" fn(*mut c_void, *mut c_void, i32) -> *mut c_void =
        mem::transmute(*functions.add(173));
    let length = get_length(env, array).max(0) as usize;
    if length == 0 {
        return 0;
    }
    let read_len = if length > max { max } else { length };
    let mut count = 0usize;
    let mut index = 0usize;
    while index < read_len {
        let element = get_object(env, array, index as i32);
        if !element.is_null() {
            let slot = storage.add(count);
            let len = jni_read_byte_array(env, element, (*slot).as_mut_ptr(), SWARM_CATALOG_PATH_BYTES);
            if len > 0 {
                ptr::write(
                    out_ptrs.add(count),
                    (*slot).as_ptr() as *const c_char,
                );
                count += 1;
            }
        }
        index += 1;
    }
    count
}
