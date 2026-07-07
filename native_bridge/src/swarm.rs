//! Replay swarm mode (multi-replay passive overlay) plus the Replay::Update and
//! Game::ViewReplay hooks shared with the managed replay camera.

use crate::replay_camera;
use crate::*;

pub(crate) const GAME_RENDER_GHOST_HOOK_BYTES: usize = 16;

pub(crate) const GAME_VIEW_REPLAY_HOOK_BYTES: usize = 16;

pub(crate) const REPLAY_UPDATE_HOOK_BYTES: usize = 16;

pub(crate) const REPLAY_LOAD_HOOK_BYTES: usize = 16;

pub(crate) const GHOST_NODE_SIZE: usize = 0x14;

pub(crate) const GHOST_NODE_FLAGS_OFFSET: usize = 1;

pub(crate) const GHOST_NODE_ORIENT_HALF_OFFSET: usize = 2;

pub(crate) const GHOST_NODE_VECTOR_OFFSET: usize = 8;

pub(crate) const GHOST_TRANSFORM_BYTES: usize = 0x40;

pub(crate) const SWARM_MAX_GHOSTS: usize = 7;

pub(crate) const SWARM_CATALOG_LIMIT: usize = 32;

pub(crate) const SWARM_CATALOG_PATH_BYTES: usize = 192;

pub(crate) const GAME_REPLAY_OBJECT_OFFSET: usize = 0xc0;

pub(crate) type GameRenderGhostFn = unsafe extern "C" fn(*mut c_void);

pub(crate) type GameViewReplayFn = unsafe extern "C" fn(*mut c_void, *mut u8, *const c_char) -> u8;

// Replay::Update(this, Car* [x1], float dt [s0], int [w2])
pub(crate) type ReplayUpdateFn = unsafe extern "C" fn(*mut c_void, *mut c_void, f32, c_int);

pub(crate) type CarRenderGhostFn = unsafe extern "C" fn(*mut c_void, *const f32);

pub(crate) type ReplayLoadPathFn = unsafe extern "C" fn(*mut c_void, *const c_char) -> c_int;

pub(crate) type ReplayDecompressGhostFn = unsafe extern "C" fn(*mut c_void);

pub(crate) type CarTemplateSetOrientationFn =
    unsafe extern "C" fn(*mut f32, *const f32, *const f32);

pub(crate) static mut GAME_RENDER_GHOST_TRAMPOLINE: *mut c_void = ptr::null_mut();

pub(crate) static mut GAME_VIEW_REPLAY_TRAMPOLINE: *mut c_void = ptr::null_mut();

pub(crate) static mut REPLAY_UPDATE_TRAMPOLINE: *mut c_void = ptr::null_mut();

pub(crate) static REPLAY_UPDATE_HOOK_INSTALLED: AtomicBool = AtomicBool::new(false);

pub(crate) static mut REPLAY_LOAD_TRAMPOLINE: *mut c_void = ptr::null_mut();

pub(crate) static REPLAY_LOAD_HOOK_INSTALLED: AtomicBool = AtomicBool::new(false);

/// True between Game::ViewReplay (entering the passive replay viewer) and the
/// next leave-replay reset. The passive viewer animates an invisible proxy
/// body for its camera and never draws the car at the playback position, so
/// the managed replay camera ghost-renders the car at its anchor itself.
pub(crate) static mut VIEW_REPLAY_SESSION: bool = false;

/// Set alongside VIEW_REPLAY_SESSION in Game::ViewReplay and held until
/// SHOW_REPLAY is first observed active: camera frames can run between the
/// ViewReplay call and the viewer actually starting, and the per-frame
/// not-in-replay reset must not clear the session during that entry window.
pub(crate) static mut VIEW_REPLAY_PENDING: bool = false;

pub(crate) static VIEW_REPLAY_HOOK_INSTALLED: AtomicBool = AtomicBool::new(false);

pub(crate) static mut REPLAY_POS: *mut c_int = ptr::null_mut();

pub(crate) static mut GHOST_POINTER: *mut *mut u8 = ptr::null_mut();

pub(crate) static mut GHOST_TRANSFORM: *mut f32 = ptr::null_mut();

pub(crate) static mut REPLAY_LOAD_PATH: *mut c_void = ptr::null_mut();

pub(crate) static mut REPLAY_DECOMPRESS_GHOST: *mut c_void = ptr::null_mut();

pub(crate) static mut CAR_RENDER_GHOST: *mut c_void = ptr::null_mut();

pub(crate) static mut CAR_TEMPLATE_SET_ORIENTATION: *mut c_void = ptr::null_mut();

pub(crate) static mut ORIENTATION_SCALE: f32 = 1.0;

pub(crate) static mut CURRENT_GAME: *mut c_void = ptr::null_mut();

pub(crate) static mut SWARM_CATALOG_LEN: usize = 0;

pub(crate) static mut SWARM_CATALOG_PATHS: [[u8; SWARM_CATALOG_PATH_BYTES]; SWARM_CATALOG_LIMIT] =
    [[0; SWARM_CATALOG_PATH_BYTES]; SWARM_CATALOG_LIMIT];

pub(crate) static mut SWARM_CATALOG_PATH_LEN: [usize; SWARM_CATALOG_LIMIT] =
    [0; SWARM_CATALOG_LIMIT];

pub(crate) static mut SWARM_GHOST_NODE_COUNT: [i32; SWARM_MAX_GHOSTS] = [0; SWARM_MAX_GHOSTS];

pub(crate) static mut SWARM_GHOST_NODES: [*mut u8; SWARM_MAX_GHOSTS] =
    [ptr::null_mut(); SWARM_MAX_GHOSTS];

pub(crate) static mut SWARM_GHOST_COUNT: usize = 0;

pub(crate) static mut SWARM_PRIMARY_CATALOG_INDEX: i32 = -1;

pub(crate) static REPLAY_SWARM_HOOKS_INSTALLED: AtomicBool = AtomicBool::new(false);

pub(crate) static REPLAY_SWARM_ENABLED: AtomicBool = AtomicBool::new(false);

pub(crate) static REPLAY_SWARM_ACTIVE: AtomicBool = AtomicBool::new(false);

/// Race-swarm option: also render the selected swarm ghosts DURING races,
/// synced to the stock ghost's playback clock, so the player races the whole
/// pack at once.
pub(crate) static RACE_SWARM_ENABLED: AtomicBool = AtomicBool::new(false);

/// Per-slot light tints so each swarm car is identifiable at a glance.
/// Channel order is irrelevant for distinguishability.
pub(crate) const SWARM_LIGHT_TINTS: [u32; SWARM_MAX_GHOSTS] = [
    0xffff_6060,
    0xff60_ff60,
    0xff60_60ff,
    0xffff_ff60,
    0xffff_60ff,
    0xff60_ffff,
    0xffff_a060,
];

pub(crate) unsafe fn c_strlen(text: *const u8) -> usize {
    if text.is_null() {
        return 0;
    }
    let mut index = 0usize;
    while *text.add(index) != 0 {
        index += 1;
        if index >= SWARM_CATALOG_PATH_BYTES {
            break;
        }
    }
    index
}

pub(crate) unsafe fn swarm_catalog_find(path: *const u8, len: usize) -> i32 {
    let mut index = 0usize;
    while index < SWARM_CATALOG_LEN {
        let existing_len = SWARM_CATALOG_PATH_LEN[index];
        if existing_len == len && len > 0 {
            let mut same = true;
            let mut byte = 0usize;
            while byte < len {
                if SWARM_CATALOG_PATHS[index][byte] != *path.add(byte) {
                    same = false;
                    break;
                }
                byte += 1;
            }
            if same {
                return index as i32;
            }
        }
        index += 1;
    }
    -1
}

pub(crate) unsafe fn swarm_catalog_note_path(path: *const c_char) {
    if path.is_null() {
        return;
    }
    let bytes = path as *const u8;
    let len = c_strlen(bytes);
    if len == 0 || SWARM_CATALOG_LEN >= SWARM_CATALOG_LIMIT {
        return;
    }
    if swarm_catalog_find(bytes, len) >= 0 {
        return;
    }
    let slot = SWARM_CATALOG_LEN;
    ptr::copy_nonoverlapping(bytes, SWARM_CATALOG_PATHS[slot].as_mut_ptr(), len);
    SWARM_CATALOG_PATH_LEN[slot] = len;
    SWARM_CATALOG_LEN += 1;
}

pub(crate) unsafe fn swarm_reset_ghosts() {
    let mut index = 0usize;
    while index < SWARM_GHOST_COUNT {
        if !SWARM_GHOST_NODES[index].is_null() {
            free(SWARM_GHOST_NODES[index] as *mut c_void);
            SWARM_GHOST_NODES[index] = ptr::null_mut();
        }
        SWARM_GHOST_NODE_COUNT[index] = 0;
        index += 1;
    }
    SWARM_GHOST_COUNT = 0;
    SWARM_PRIMARY_CATALOG_INDEX = -1;
    REPLAY_SWARM_ACTIVE.store(false, Ordering::Release);
}

pub(crate) unsafe fn swarm_reset_catalog() {
    swarm_reset_ghosts();
    SWARM_CATALOG_LEN = 0;
}

pub(crate) unsafe fn ensure_swarm_symbols() -> bool {
    if GHOST_SIZE.is_null() {
        GHOST_SIZE = resolve(b"g_nGhostSize\0") as *mut c_int;
    }
    if SHOW_REPLAY.is_null() {
        SHOW_REPLAY = resolve(b"g_bShowReplay\0") as *mut u8;
    }
    if GHOST_POS.is_null() {
        GHOST_POS = resolve(b"g_nGhostPos\0") as *mut c_int;
    }
    if REPLAY_POS.is_null() {
        REPLAY_POS = resolve(b"g_nReplayPos\0") as *mut c_int;
    }
    if GHOST_POINTER.is_null() {
        GHOST_POINTER = resolve(b"g_pGhost\0") as *mut *mut u8;
    }
    if GHOST_TRANSFORM.is_null() {
        GHOST_TRANSFORM = resolve(b"g_ghostTransform\0") as *mut f32;
    }
    if REPLAY_LOAD_PATH.is_null() {
        REPLAY_LOAD_PATH = resolve(b"_ZN6Replay4LoadEPKc\0");
    }
    if REPLAY_DECOMPRESS_GHOST.is_null() {
        REPLAY_DECOMPRESS_GHOST = resolve(b"_ZN6Replay29ReplayDecompressAndSetUpGhostEv\0");
    }
    if CAR_RENDER_GHOST.is_null() {
        CAR_RENDER_GHOST = resolve(b"_ZN3Car11RenderGhostERKN2TA6MFrameE\0");
    }
    if CAR_TEMPLATE_SET_ORIENTATION.is_null() {
        CAR_TEMPLATE_SET_ORIENTATION =
            resolve(b"_ZN2TA11CarTemplate14SetOrientationERKNS_4Vec3ES3_\0");
    }
    if ORIENTATION_SCALE == 1.0 && !GHOST_SIZE.is_null() {
        let ghost_size_addr = GHOST_SIZE as usize;
        let module_base = ghost_size_addr.wrapping_sub(0x5a0514);
        if module_base > 0x1000 {
            let scale_ptr = (module_base + 0x2abde0) as *const f32;
            let scale = ptr::read_volatile(scale_ptr);
            if scale > 0.0 && scale < 1000.0 {
                ORIENTATION_SCALE = scale;
            }
        }
    }
    !(REPLAY_POS.is_null()
        || GHOST_POINTER.is_null()
        || GHOST_TRANSFORM.is_null()
        || GHOST_SIZE.is_null()
        || SHOW_REPLAY.is_null()
        || REPLAY_LOAD_PATH.is_null()
        || REPLAY_DECOMPRESS_GHOST.is_null()
        || CAR_RENDER_GHOST.is_null()
        || CAR_TEMPLATE_SET_ORIENTATION.is_null())
}

pub(crate) unsafe fn swarm_replay_object(game: *mut c_void) -> *mut c_void {
    if game.is_null() {
        return ptr::null_mut();
    }
    ptr::read_volatile((game as *mut u8).add(GAME_REPLAY_OBJECT_OFFSET) as *mut *mut c_void)
}

pub(crate) unsafe fn swarm_snapshot_ghost_globals(
    ghost_ptr: *mut *mut u8,
    ghost_size: *mut c_int,
    ghost_pos: *mut c_int,
) {
    if !GHOST_POINTER.is_null() {
        *ghost_ptr = ptr::read_volatile(GHOST_POINTER);
    }
    if !GHOST_SIZE.is_null() {
        *ghost_size = ptr::read_volatile(GHOST_SIZE);
    }
    if !GHOST_POS.is_null() {
        *ghost_pos = ptr::read_volatile(GHOST_POS);
    }
}

pub(crate) unsafe fn swarm_restore_ghost_globals(
    ghost_ptr: *mut *mut u8,
    ghost_size: c_int,
    ghost_pos: c_int,
) {
    if !GHOST_POINTER.is_null() {
        ptr::write(GHOST_POINTER, *ghost_ptr);
    }
    if !GHOST_SIZE.is_null() {
        ptr::write(GHOST_SIZE, ghost_size);
    }
    if !GHOST_POS.is_null() {
        ptr::write(GHOST_POS, ghost_pos);
    }
}

/// True while the swarm code itself drives Replay::Load, so the load hook can
/// tell player-initiated replay loads (which set the primary/current replay)
/// from our own ghost loads.
pub(crate) static mut IN_SWARM_LOAD: bool = false;

pub(crate) unsafe fn swarm_load_ghost_nodes_from_path(path: *const c_char) -> (*mut u8, i32) {
    let game = CURRENT_GAME;
    let replay = swarm_replay_object(game);
    if replay.is_null() {
        return (ptr::null_mut(), 0);
    }

    let mut saved_ptr: *mut u8 = ptr::null_mut();
    let mut saved_size: c_int = 0;
    let mut saved_pos: c_int = 0;
    swarm_snapshot_ghost_globals(&mut saved_ptr, &mut saved_size, &mut saved_pos);

    let load: ReplayLoadPathFn = mem::transmute(REPLAY_LOAD_PATH);
    let decompress: ReplayDecompressGhostFn = mem::transmute(REPLAY_DECOMPRESS_GHOST);
    IN_SWARM_LOAD = true;
    let loaded = load(replay, path);
    if loaded == 0 {
        IN_SWARM_LOAD = false;
        swarm_restore_ghost_globals(&mut saved_ptr, saved_size, saved_pos);
        return (ptr::null_mut(), 0);
    }
    decompress(replay);
    IN_SWARM_LOAD = false;

    let node_count = if GHOST_SIZE.is_null() {
        0
    } else {
        ptr::read_volatile(GHOST_SIZE).max(0)
    };
    let source = if GHOST_POINTER.is_null() {
        ptr::null_mut()
    } else {
        ptr::read_volatile(GHOST_POINTER)
    };
    if node_count < 2 || source.is_null() {
        swarm_restore_ghost_globals(&mut saved_ptr, saved_size, saved_pos);
        return (ptr::null_mut(), 0);
    }

    let byte_len = (node_count as usize) * GHOST_NODE_SIZE;
    let copy = malloc(byte_len) as *mut u8;
    if copy.is_null() {
        swarm_restore_ghost_globals(&mut saved_ptr, saved_size, saved_pos);
        return (ptr::null_mut(), 0);
    }
    ptr::copy_nonoverlapping(source, copy, byte_len);
    swarm_restore_ghost_globals(&mut saved_ptr, saved_size, saved_pos);
    (copy, node_count)
}

pub(crate) unsafe fn swarm_apply_orientation(transform: *mut f32, node: *const u8) {
    if transform.is_null() || node.is_null() {
        return;
    }
    let half0 = ptr::read_volatile(node.add(GHOST_NODE_ORIENT_HALF_OFFSET) as *const u16);
    let half1 = ptr::read_volatile(node.add(GHOST_NODE_ORIENT_HALF_OFFSET + 2) as *const u16);
    let half2 = ptr::read_volatile(node.add(GHOST_NODE_ORIENT_HALF_OFFSET + 4) as *const u16);
    let mut angles = [0.0f32; 3];
    angles[0] = half0 as f32 * ORIENTATION_SCALE;
    angles[1] = half1 as f32 * ORIENTATION_SCALE;
    angles[2] = half2 as f32 * ORIENTATION_SCALE;
    let set_orientation: CarTemplateSetOrientationFn = mem::transmute(CAR_TEMPLATE_SET_ORIENTATION);
    set_orientation(transform, angles.as_ptr(), angles.as_ptr());
}

pub(crate) unsafe fn swarm_integrate_node_step(
    transform: *mut f32,
    velocity: *mut f32,
    node: *const u8,
    apply_orientation: bool,
) {
    let flags = ptr::read_volatile(node.add(GHOST_NODE_FLAGS_OFFSET));
    if (flags & 0x08) != 0 {
        ptr::write(velocity, 0.0);
        ptr::write(velocity.add(1), 0.0);
        ptr::write(velocity.add(2), 0.0);
        ptr::write(
            transform.add(GHOST_TRANSFORM_POS_FLOAT),
            ptr::read_volatile(node.add(GHOST_NODE_VECTOR_OFFSET) as *const f32),
        );
        ptr::write(
            transform.add(GHOST_TRANSFORM_POS_FLOAT + 1),
            ptr::read_volatile(node.add(GHOST_NODE_VECTOR_OFFSET + 4) as *const f32),
        );
        ptr::write(
            transform.add(GHOST_TRANSFORM_POS_FLOAT + 2),
            ptr::read_volatile(node.add(GHOST_NODE_VECTOR_OFFSET + 8) as *const f32),
        );
    } else {
        ptr::write(
            velocity,
            ptr::read(velocity)
                + ptr::read_volatile(node.add(GHOST_NODE_VECTOR_OFFSET) as *const f32),
        );
        ptr::write(
            velocity.add(1),
            ptr::read(velocity.add(1))
                + ptr::read_volatile(node.add(GHOST_NODE_VECTOR_OFFSET + 4) as *const f32),
        );
        ptr::write(
            velocity.add(2),
            ptr::read(velocity.add(2))
                + ptr::read_volatile(node.add(GHOST_NODE_VECTOR_OFFSET + 8) as *const f32),
        );
        ptr::write(
            transform.add(GHOST_TRANSFORM_POS_FLOAT),
            ptr::read(transform.add(GHOST_TRANSFORM_POS_FLOAT)) + ptr::read(velocity),
        );
        ptr::write(
            transform.add(GHOST_TRANSFORM_POS_FLOAT + 1),
            ptr::read(transform.add(GHOST_TRANSFORM_POS_FLOAT + 1)) + ptr::read(velocity.add(1)),
        );
        ptr::write(
            transform.add(GHOST_TRANSFORM_POS_FLOAT + 2),
            ptr::read(transform.add(GHOST_TRANSFORM_POS_FLOAT + 2)) + ptr::read(velocity.add(2)),
        );
    }
    if apply_orientation {
        swarm_apply_orientation(transform, node);
    }
}

pub(crate) unsafe fn swarm_integrate_transform(
    nodes: *const u8,
    node_count: i32,
    target_index: i32,
    transform: *mut f32,
) -> bool {
    if nodes.is_null() || transform.is_null() || node_count < 1 || target_index < 0 {
        return false;
    }
    // write_bytes counts ELEMENTS of the pointee type: GHOST_TRANSFORM_BYTES
    // f32 elements would zero 4x past the 16-float transform (stack smash), so
    // zero through a byte pointer.
    ptr::write_bytes(transform as *mut u8, 0, GHOST_TRANSFORM_BYTES);
    ptr::write(transform.add(GHOST_TRANSFORM_POS_FLOAT + 2), 1.0f32);
    let limit = target_index.min(node_count - 1);
    let mut velocity = [0.0f32; 3];
    let mut index = 0i32;
    while index <= limit {
        let node = nodes.add((index as usize) * GHOST_NODE_SIZE);
        // Positions integrate over every node; the orientation is absolute per
        // node, so only the final pose needs the (comparatively expensive)
        // engine SetOrientation call.
        swarm_integrate_node_step(transform, velocity.as_mut_ptr(), node, index == limit);
        index += 1;
    }
    true
}

pub(crate) unsafe fn swarm_master_node_index() -> i32 {
    if REPLAY_POS.is_null() {
        return -1;
    }
    let pos = ptr::read_volatile(REPLAY_POS);
    if pos < 0 {
        read_i32_pointer(LAST_REPLAY_SIZE)
    } else {
        pos
    }
}

/// Frames of an unchanged race ghost clock before swarm cars stop drawing
/// (menus / pause screens hold a stale g_nGhostPos; without this the pack
/// would freeze mid-track behind the UI).
pub(crate) const RACE_MASTER_STALL_LIMIT: i32 = 45;

pub(crate) static mut RACE_MASTER_LAST: i32 = -1;

pub(crate) static mut RACE_MASTER_STALL: i32 = 0;

/// Node index every swarm ghost is synced to this frame, or -1 when swarm
/// ghosts should not draw. In replay playback that is the replay clock
/// (g_nReplayPos); during a live race (race-swarm option) it is the stock
/// ghost's playback clock (g_nGhostPos), which shares the same fixed node
/// rate, starts with the race, and resets on retry.
pub(crate) unsafe fn swarm_render_master_index() -> i32 {
    if SHOW_REPLAY.is_null() {
        return -1;
    }
    if ptr::read_volatile(SHOW_REPLAY) != 0 {
        return swarm_master_node_index();
    }
    if !RACE_SWARM_ENABLED.load(Ordering::Acquire)
        || GHOST_POS.is_null()
        || GHOST_POINTER.is_null()
        || GHOST_SIZE.is_null()
        || ptr::read_volatile(GHOST_POINTER).is_null()
        || ptr::read_volatile(GHOST_SIZE) < 2
    {
        return -1;
    }
    let pos = ptr::read_volatile(GHOST_POS);
    if pos == RACE_MASTER_LAST {
        if RACE_MASTER_STALL < RACE_MASTER_STALL_LIMIT {
            RACE_MASTER_STALL += 1;
        }
    } else {
        RACE_MASTER_LAST = pos;
        RACE_MASTER_STALL = 0;
    }
    if RACE_MASTER_STALL >= RACE_MASTER_STALL_LIMIT {
        return -1;
    }
    pos
}

/// Draw the swarm ghost cars. MUST be called from inside the 3D render pass
/// (the World::Render hook): draws issued from the update phase have no valid
/// GL state and render nothing.
///
/// Each ghost is drawn OPAQUE with a per-slot light tint by temporarily
/// swapping the ghost pose into the current Car's body MFrame and calling
/// Car::Render(false) (which draws at body+0x1c0); Car::RenderGhost's
/// translucent black silhouette is nearly invisible. The body MFrame is
/// restored immediately after the draws, before any game code runs.
pub(crate) unsafe fn swarm_render_extra_ghosts(game: *mut c_void) {
    if !REPLAY_SWARM_ACTIVE.load(Ordering::Acquire) || SWARM_GHOST_COUNT == 0 || game.is_null() {
        return;
    }
    if !ensure_swarm_symbols() {
        return;
    }
    let master = swarm_render_master_index();
    if master < 1 {
        return;
    }
    // The passive View Replay viewer keeps game+0xb0 null; the Car* captured
    // from Replay::Update is the animated viewer car there.
    let mut car =
        ptr::read_volatile((game as *mut u8).add(GAME_CURRENT_CAR_OFFSET) as *mut *mut u8);
    if car.is_null() {
        car = REPLAY_UPDATE_CAR;
    }
    if car.is_null() {
        return;
    }
    let body = ptr::read_volatile(car.add(CAR_BODY_PTR_OFFSET) as *mut *mut f32);
    if body.is_null() {
        return;
    }
    if CAR_RENDER.is_null() {
        CAR_RENDER = resolve(b"_ZN3Car6RenderEb\0");
    }
    if CAR_SET_LIGHT_COLOUR.is_null() {
        CAR_SET_LIGHT_COLOUR = resolve(b"_ZN3Car14SetLightColourEjf\0");
    }
    if CAR_RENDER.is_null() {
        return;
    }
    let render: CarRenderFn = mem::transmute(CAR_RENDER);
    let mframe = body.add(CAR_BODY_RIGHT_FLOAT);
    let mut saved = [0.0f32; GHOST_TRANSFORM_BYTES / 4];
    ptr::copy_nonoverlapping(mframe as *const f32, saved.as_mut_ptr(), saved.len());
    let mut transform = [0.0f32; GHOST_TRANSFORM_BYTES / 4];
    // Any nested Car::RenderGhost must not disturb the replay-camera capture.
    IN_SWARM_RENDER = true;
    let mut index = 0usize;
    while index < SWARM_GHOST_COUNT {
        let nodes = SWARM_GHOST_NODES[index];
        let count = SWARM_GHOST_NODE_COUNT[index];
        if !nodes.is_null() && count > 1 {
            if swarm_integrate_transform(nodes, count, master, transform.as_mut_ptr()) {
                ptr::copy_nonoverlapping(transform.as_ptr(), mframe, transform.len());
                if !CAR_SET_LIGHT_COLOUR.is_null() {
                    let set_light: CarSetLightColourFn = mem::transmute(CAR_SET_LIGHT_COLOUR);
                    set_light(car as *mut c_void, SWARM_LIGHT_TINTS[index], 1.0);
                }
                render(car as *mut c_void, 0);
            }
        }
        index += 1;
    }
    ptr::copy_nonoverlapping(saved.as_ptr(), mframe, saved.len());
    if !CAR_SET_LIGHT_COLOUR.is_null() {
        let set_light: CarSetLightColourFn = mem::transmute(CAR_SET_LIGHT_COLOUR);
        set_light(car as *mut c_void, 0xffff_ffff, 1.0);
    }
    IN_SWARM_RENDER = false;
}

pub(crate) unsafe extern "C" fn hooked_replay_update(
    replay: *mut c_void,
    car: *mut c_void,
    dt: f32,
    flags: c_int,
) {
    // Cinematic slow-motion while the managed ORBIT camera owns the passive
    // viewer: the car crosses the scenery more slowly, so a full orbit fits
    // into each open section of the route. Trackside/Helicopter/GoPro play at
    // real speed.
    let dt = if VIEW_REPLAY_SESSION
        && replay_camera::wants_slow_motion()
        && FREE_CAMERA_ENABLED.load(Ordering::Acquire)
        && FREE_CAMERA_ACTIVE.load(Ordering::Acquire)
        && dt.is_finite()
    {
        dt * 0.35
    } else {
        dt
    };
    let original: ReplayUpdateFn = mem::transmute(REPLAY_UPDATE_TRAMPOLINE);
    original(replay, car, dt, flags);
    if !car.is_null() {
        REPLAY_UPDATE_CAR = car as *mut u8;
    }
    // Swarm ghosts are rendered from the World::Render hook (3D pass); a draw
    // issued here, in the update phase, has no GL state and shows nothing.
}

/// Every path-based replay file load feeds the swarm catalog. Game::ViewReplay
/// only fires for the passive viewer entry (and its path can be absent), so
/// hooking the loader itself is what actually populates the picker as the
/// player opens replays. Our own swarm ghost loads also land here; the
/// catalog dedups, so that is harmless.
pub(crate) unsafe extern "C" fn hooked_replay_load_path(
    replay: *mut c_void,
    path: *const c_char,
) -> c_int {
    if !IN_SWARM_LOAD {
        swarm_catalog_note_path(path);
        // The last player-initiated load is the replay now being watched --
        // record it as the primary so the picker knows the camera replay and
        // the post-apply restore can reload it.
        let index = swarm_catalog_find(path as *const u8, c_strlen(path as *const u8));
        if index >= 0 {
            SWARM_PRIMARY_CATALOG_INDEX = index;
        }
    }
    let original: ReplayLoadPathFn = mem::transmute(REPLAY_LOAD_TRAMPOLINE);
    original(replay, path)
}

/// After ghost loads clobbered the live Replay object, reload the replay the
/// player is actually watching and restore the playback clocks, so the viewer
/// keeps playing (and looping) the right file.
pub(crate) unsafe fn swarm_restore_primary_replay(primary_index: i32) {
    if primary_index < 0 || primary_index as usize >= SWARM_CATALOG_LEN {
        return;
    }
    let replay = swarm_replay_object(CURRENT_GAME);
    if replay.is_null() || REPLAY_LOAD_PATH.is_null() || REPLAY_DECOMPRESS_GHOST.is_null() {
        return;
    }
    let mut path = [0u8; SWARM_CATALOG_PATH_BYTES + 1];
    let len = SWARM_CATALOG_PATH_LEN[primary_index as usize];
    if len == 0 || len > SWARM_CATALOG_PATH_BYTES {
        return;
    }
    ptr::copy_nonoverlapping(
        SWARM_CATALOG_PATHS[primary_index as usize].as_ptr(),
        path.as_mut_ptr(),
        len,
    );
    let saved_replay_pos = if REPLAY_POS.is_null() {
        -1
    } else {
        ptr::read_volatile(REPLAY_POS)
    };
    let saved_ghost_pos = if GHOST_POS.is_null() {
        -1
    } else {
        ptr::read_volatile(GHOST_POS)
    };
    let load: ReplayLoadPathFn = mem::transmute(REPLAY_LOAD_PATH);
    let decompress: ReplayDecompressGhostFn = mem::transmute(REPLAY_DECOMPRESS_GHOST);
    IN_SWARM_LOAD = true;
    if load(replay, path.as_ptr() as *const c_char) != 0 {
        decompress(replay);
    }
    IN_SWARM_LOAD = false;
    if !REPLAY_POS.is_null() && saved_replay_pos >= 0 {
        ptr::write_volatile(REPLAY_POS, saved_replay_pos);
    }
    if !GHOST_POS.is_null() && saved_ghost_pos >= 0 {
        ptr::write_volatile(GHOST_POS, saved_ghost_pos);
    }
}

/// Install the Replay::Load(const char*) hook once.
pub(crate) unsafe fn ensure_replay_load_hook() -> bool {
    if REPLAY_LOAD_HOOK_INSTALLED.load(Ordering::Acquire) {
        return !REPLAY_LOAD_TRAMPOLINE.is_null();
    }
    if REPLAY_LOAD_HOOK_INSTALLED.swap(true, Ordering::AcqRel) {
        return !REPLAY_LOAD_TRAMPOLINE.is_null();
    }
    let load = resolve(b"_ZN6Replay4LoadEPKc\0");
    if load.is_null() {
        return false;
    }
    REPLAY_LOAD_TRAMPOLINE = install_inline_hook(
        load,
        hooked_replay_load_path as *const c_void,
        REPLAY_LOAD_HOOK_BYTES,
    );
    !REPLAY_LOAD_TRAMPOLINE.is_null()
}

/// Install the Game::ViewReplay hook once; shared by the free-camera and swarm
/// installers (an inline hook must never be applied to the same target twice).
pub(crate) unsafe fn ensure_view_replay_hook() -> bool {
    if VIEW_REPLAY_HOOK_INSTALLED.load(Ordering::Acquire) {
        return !GAME_VIEW_REPLAY_TRAMPOLINE.is_null();
    }
    if VIEW_REPLAY_HOOK_INSTALLED.swap(true, Ordering::AcqRel) {
        return !GAME_VIEW_REPLAY_TRAMPOLINE.is_null();
    }
    let view_replay = resolve(b"_ZN4Game10ViewReplayEPhPc\0");
    if view_replay.is_null() {
        return false;
    }
    GAME_VIEW_REPLAY_TRAMPOLINE = install_inline_hook(
        view_replay,
        hooked_game_view_replay as *const c_void,
        GAME_VIEW_REPLAY_HOOK_BYTES,
    );
    !GAME_VIEW_REPLAY_TRAMPOLINE.is_null()
}

/// Install the Replay::Update hook once; shared by the free-camera and swarm
/// installers (an inline hook must never be applied to the same target twice).
pub(crate) unsafe fn ensure_replay_update_hook() -> bool {
    if REPLAY_UPDATE_HOOK_INSTALLED.load(Ordering::Acquire) {
        return !REPLAY_UPDATE_TRAMPOLINE.is_null();
    }
    if REPLAY_UPDATE_HOOK_INSTALLED.swap(true, Ordering::AcqRel) {
        return !REPLAY_UPDATE_TRAMPOLINE.is_null();
    }
    let replay_update = resolve(b"_ZN6Replay6UpdateEP3Carfi\0");
    if replay_update.is_null() {
        return false;
    }
    REPLAY_UPDATE_TRAMPOLINE = install_inline_hook(
        replay_update,
        hooked_replay_update as *const c_void,
        REPLAY_UPDATE_HOOK_BYTES,
    );
    !REPLAY_UPDATE_TRAMPOLINE.is_null()
}

pub(crate) unsafe extern "C" fn hooked_game_render_ghost(game: *mut c_void) {
    let original: GameRenderGhostFn = mem::transmute(GAME_RENDER_GHOST_TRAMPOLINE);
    original(game);
}

pub(crate) unsafe extern "C" fn hooked_game_view_replay(
    game: *mut c_void,
    saved: *mut u8,
    path: *const c_char,
) -> u8 {
    CURRENT_GAME = game;
    VIEW_REPLAY_SESSION = true;
    VIEW_REPLAY_PENDING = true;
    swarm_catalog_note_path(path);
    if REPLAY_SWARM_ENABLED.load(Ordering::Acquire) && !path.is_null() {
        let index = swarm_catalog_find(path as *const u8, c_strlen(path as *const u8));
        if index >= 0 {
            SWARM_PRIMARY_CATALOG_INDEX = index;
        }
    }
    let original: GameViewReplayFn = mem::transmute(GAME_VIEW_REPLAY_TRAMPOLINE);
    original(game, saved, path)
}

pub(crate) type TaServerGetRawFileFn = unsafe extern "C" fn(
    *const c_char,
    Option<unsafe extern "C" fn(*mut c_char, bool, *mut c_void)>,
    *mut c_void,
    *mut c_void,
    *mut c_char,
);

pub(crate) type GetUserPathFn = unsafe extern "C" fn(*const c_char, *mut c_char);

pub(crate) type GameLoadLevelFn =
    unsafe extern "C" fn(*mut c_void, c_uint, c_int) -> u8;

pub(crate) const LEADERBOARD_FETCH_IDLE: i32 = 0;

pub(crate) const LEADERBOARD_FETCH_PENDING: i32 = 1;

pub(crate) const LEADERBOARD_FETCH_READY: i32 = 2;

pub(crate) const LEADERBOARD_FETCH_FAILED: i32 = 3;

pub(crate) const LEADERBOARD_FETCH_QUEUE_MAX: usize = 8;

pub(crate) const LEADERBOARD_REPLAY_PATH_BYTES: usize = 96;

pub(crate) static mut TA_SERVER_GET_RAW_FILE: *mut c_void = ptr::null_mut();

pub(crate) static mut GET_USER_PATH: *mut c_void = ptr::null_mut();

pub(crate) static mut GAME_LOAD_LEVEL: *mut c_void = ptr::null_mut();

pub(crate) static mut G_P_GAME_BASE: *mut *mut c_void = ptr::null_mut();

pub(crate) static mut SWARM_VIEW_REPLAY_SAVED: [u8; 256] = [0; 256];

pub(crate) static mut LEADERBOARD_FETCH_INDEX: i32 = -1;

pub(crate) static mut LEADERBOARD_FETCH_STATUS: i32 = LEADERBOARD_FETCH_IDLE;

pub(crate) static mut LEADERBOARD_FETCH_QUEUE: [i32; LEADERBOARD_FETCH_QUEUE_MAX] = [-1; LEADERBOARD_FETCH_QUEUE_MAX];

pub(crate) static mut LEADERBOARD_FETCH_QUEUE_LEN: usize = 0;

pub(crate) static mut LEADERBOARD_FETCH_PATHS: [[u8; LEADERBOARD_REPLAY_PATH_BYTES]; LEADERBOARD_FETCH_QUEUE_MAX] =
    [[0; LEADERBOARD_REPLAY_PATH_BYTES]; LEADERBOARD_FETCH_QUEUE_MAX];

pub(crate) static mut LEADERBOARD_FETCH_PATH_LEN: [usize; LEADERBOARD_FETCH_QUEUE_MAX] =
    [0; LEADERBOARD_FETCH_QUEUE_MAX];

pub(crate) unsafe fn ensure_leaderboard_fetch_symbols() -> bool {
    if TA_SERVER_GET_RAW_FILE.is_null() {
        TA_SERVER_GET_RAW_FILE = resolve(b"_Z19TaServer_GetRawFilePKcPFvS0_bPvES1_S0_\0");
    }
    if GET_USER_PATH.is_null() {
        GET_USER_PATH = resolve(b"_Z11GetUserPathPKcPc\0");
    }
    if GAME_LOAD_LEVEL.is_null() {
        GAME_LOAD_LEVEL = resolve(b"_ZN4Game9LoadLevelEjNS_10DifficultyE\0");
    }
  if G_P_GAME_BASE.is_null() {
        G_P_GAME_BASE = resolve(b"g_pGameBase\0") as *mut *mut c_void;
    }
    !(TA_SERVER_GET_RAW_FILE.is_null() || GET_USER_PATH.is_null())
}

pub(crate) unsafe fn ensure_current_game() -> *mut c_void {
    if CURRENT_GAME.is_null() {
        if G_P_GAME_BASE.is_null() {
            G_P_GAME_BASE = resolve(b"g_pGameBase\0") as *mut *mut c_void;
        }
        if !G_P_GAME_BASE.is_null() {
            CURRENT_GAME = ptr::read_volatile(G_P_GAME_BASE);
        }
    }
    CURRENT_GAME
}

pub(crate) unsafe fn swarm_append_decimal(buf: *mut u8, offset: usize, cap: usize, value: u32) -> usize {
    if buf.is_null() || offset >= cap {
        return offset;
    }
    let mut digits = [0u8; 10];
    let mut count = 0usize;
    let mut n = value;
    if n == 0 {
        digits[0] = b'0';
        count = 1;
    } else {
        while n > 0 && count < digits.len() {
            digits[count] = b'0' + (n % 10) as u8;
            n /= 10;
            count += 1;
        }
    }
    let mut written = offset;
    while count > 0 {
        count -= 1;
        if written + 1 >= cap {
            break;
        }
        ptr::write(buf.add(written), digits[count]);
        written += 1;
    }
    written
}

pub(crate) unsafe fn swarm_build_leaderboard_fetch_key(
    level_id: i32,
    score_id: i32,
    out: *mut u8,
    cap: usize,
) -> usize {
    if out.is_null() || cap < 12 {
        return 0;
    }
    ptr::write_bytes(out, 0, cap);
    ptr::copy_nonoverlapping(b"d=".as_ptr(), out, 2);
    let mut len = swarm_append_decimal(out, 2, cap, level_id.max(0) as u32);
    if len + 10 >= cap {
        return 0;
    }
    ptr::copy_nonoverlapping(b"&scoreId=".as_ptr(), out.add(len), 9);
    len += 9;
    len = swarm_append_decimal(out, len, cap, score_id.max(0) as u32);
    ptr::write(out.add(len), 0);
    len
}

pub(crate) unsafe fn swarm_build_leaderboard_replay_rel_path(
    score_id: i32,
    out: *mut u8,
    cap: usize,
) -> usize {
    if out.is_null() || cap < 8 {
        return 0;
    }
    ptr::write_bytes(out, 0, cap);
    ptr::copy_nonoverlapping(b"sw".as_ptr(), out, 2);
    let mut len = swarm_append_decimal(out, 2, cap, score_id.max(0) as u32);
    if len + 5 >= cap {
        return 0;
    }
    ptr::copy_nonoverlapping(b".bin".as_ptr(), out.add(len), 4);
    len += 4;
    ptr::write(out.add(len), 0);
    len
}

pub(crate) unsafe extern "C" fn leaderboard_raw_file_callback(
    path: *mut c_char,
    success: bool,
    _ctx: *mut c_void,
) {
    if LEADERBOARD_FETCH_INDEX < 0 {
        return;
    }
    let slot = LEADERBOARD_FETCH_INDEX as usize;
    if slot >= LEADERBOARD_FETCH_QUEUE_MAX {
        LEADERBOARD_FETCH_STATUS = LEADERBOARD_FETCH_FAILED;
        return;
    }
    if !success || path.is_null() {
        LEADERBOARD_FETCH_STATUS = LEADERBOARD_FETCH_FAILED;
        return;
    }
    let mut len = 0usize;
    while len + 1 < LEADERBOARD_REPLAY_PATH_BYTES {
        let byte = ptr::read_volatile(path.add(len) as *const u8);
        LEADERBOARD_FETCH_PATHS[slot][len] = byte;
        len += 1;
        if byte == 0 {
            break;
        }
    }
    if len == 0 {
        LEADERBOARD_FETCH_STATUS = LEADERBOARD_FETCH_FAILED;
        return;
    }
    LEADERBOARD_FETCH_PATH_LEN[slot] = len - 1;
    LEADERBOARD_FETCH_STATUS = LEADERBOARD_FETCH_READY;
}

pub(crate) unsafe fn leaderboard_fetch_slot_for_index(index: i32) -> i32 {
    let mut slot = 0usize;
    while slot < LEADERBOARD_FETCH_QUEUE_LEN {
        if LEADERBOARD_FETCH_QUEUE[slot] == index {
            return slot as i32;
        }
        slot += 1;
    }
    -1
}

pub(crate) unsafe fn leaderboard_fetch_reset_queue() {
    LEADERBOARD_FETCH_INDEX = -1;
    LEADERBOARD_FETCH_STATUS = LEADERBOARD_FETCH_IDLE;
    LEADERBOARD_FETCH_QUEUE_LEN = 0;
    let mut slot = 0usize;
    while slot < LEADERBOARD_FETCH_QUEUE_MAX {
        LEADERBOARD_FETCH_QUEUE[slot] = -1;
        LEADERBOARD_FETCH_PATH_LEN[slot] = 0;
        slot += 1;
    }
}

pub(crate) unsafe fn leaderboard_fetch_queue_contains(index: i32) -> bool {
    leaderboard_fetch_slot_for_index(index) >= 0
}

pub(crate) unsafe fn leaderboard_fetch_begin(index: i32) -> i32 {
    if !ensure_leaderboard_fetch_symbols() || !ensure_leaderboard_symbols() {
        return LEADERBOARD_FETCH_FAILED;
    }
    if index < 0 || index >= leaderboard_entry_count() {
        return LEADERBOARD_FETCH_FAILED;
    }
    let existing = leaderboard_fetch_slot_for_index(index);
    if existing >= 0 {
        let slot = existing as usize;
        return if LEADERBOARD_FETCH_PATH_LEN[slot] > 0 {
            LEADERBOARD_FETCH_READY
        } else if LEADERBOARD_FETCH_INDEX == index
            && LEADERBOARD_FETCH_STATUS == LEADERBOARD_FETCH_PENDING
        {
            LEADERBOARD_FETCH_PENDING
        } else {
            LEADERBOARD_FETCH_IDLE
        };
    }
    if LEADERBOARD_FETCH_QUEUE_LEN >= LEADERBOARD_FETCH_QUEUE_MAX {
        return LEADERBOARD_FETCH_FAILED;
    }
    if LEADERBOARD_FETCH_STATUS == LEADERBOARD_FETCH_PENDING {
        return LEADERBOARD_FETCH_PENDING;
    }

    let mut time_ms = 0i32;
    let mut score_id = 0i32;
    let mut name = [0u8; 4];
    if !leaderboard_read_entry(index, &mut time_ms, &mut score_id, name.as_mut_ptr(), name.len()) {
        return LEADERBOARD_FETCH_FAILED;
    }
    let level_id = leaderboard_level_id();
    if level_id <= 0 || score_id <= 0 {
        return LEADERBOARD_FETCH_FAILED;
    }

    let slot = LEADERBOARD_FETCH_QUEUE_LEN;
    LEADERBOARD_FETCH_QUEUE[slot] = index;
    LEADERBOARD_FETCH_QUEUE_LEN += 1;
    LEADERBOARD_FETCH_INDEX = index;
    LEADERBOARD_FETCH_STATUS = LEADERBOARD_FETCH_PENDING;

    let mut key = [0u8; 64];
    let key_len = swarm_build_leaderboard_fetch_key(level_id, score_id, key.as_mut_ptr(), key.len());
    if key_len == 0 {
        LEADERBOARD_FETCH_STATUS = LEADERBOARD_FETCH_FAILED;
        return LEADERBOARD_FETCH_FAILED;
    }
    let mut rel = [0u8; LEADERBOARD_REPLAY_PATH_BYTES];
    let rel_len =
        swarm_build_leaderboard_replay_rel_path(score_id, rel.as_mut_ptr(), rel.len());
    if rel_len == 0 {
        LEADERBOARD_FETCH_STATUS = LEADERBOARD_FETCH_FAILED;
        return LEADERBOARD_FETCH_FAILED;
    }
    ptr::copy_nonoverlapping(rel.as_ptr(), LEADERBOARD_FETCH_PATHS[slot].as_mut_ptr(), rel_len);
    LEADERBOARD_FETCH_PATH_LEN[slot] = rel_len;

    let get_raw: TaServerGetRawFileFn = mem::transmute(TA_SERVER_GET_RAW_FILE);
    get_raw(
        key.as_ptr() as *const c_char,
        Some(leaderboard_raw_file_callback),
        ptr::null_mut(),
        ptr::null_mut(),
        LEADERBOARD_FETCH_PATHS[slot].as_mut_ptr() as *mut c_char,
    );
    LEADERBOARD_FETCH_PENDING
}

pub(crate) unsafe fn leaderboard_fetch_status_for_index(index: i32) -> i32 {
    let slot = leaderboard_fetch_slot_for_index(index);
    if slot < 0 {
        return LEADERBOARD_FETCH_IDLE;
    }
    let slot = slot as usize;
    if LEADERBOARD_FETCH_PATH_LEN[slot] > 0
        && (LEADERBOARD_FETCH_STATUS == LEADERBOARD_FETCH_READY
            || LEADERBOARD_FETCH_INDEX != index)
    {
        return LEADERBOARD_FETCH_READY;
    }
    if LEADERBOARD_FETCH_INDEX == index {
        return LEADERBOARD_FETCH_STATUS;
    }
    LEADERBOARD_FETCH_IDLE
}

pub(crate) unsafe fn leaderboard_fetch_path_for_index(
    index: i32,
    out: *mut u8,
    cap: usize,
) -> i32 {
    let slot = leaderboard_fetch_slot_for_index(index);
    if slot < 0 || out.is_null() || cap == 0 {
        return 0;
    }
    let slot = slot as usize;
    let len = LEADERBOARD_FETCH_PATH_LEN[slot];
    if len == 0 || len >= cap {
        return 0;
    }
    ptr::copy_nonoverlapping(LEADERBOARD_FETCH_PATHS[slot].as_ptr(), out, len);
    ptr::write(out.add(len), 0);
    len as i32
}

pub(crate) unsafe fn swarm_load_selection_from_paths(
    primary_path: *const c_char,
    ghost_paths: *const *const c_char,
    ghost_count: usize,
) -> usize {
    swarm_reset_ghosts();
    if primary_path.is_null() {
        return 0;
    }
    let mut ghost_slot = 0usize;
    let mut read = 0usize;
    while read < ghost_count && ghost_slot < SWARM_MAX_GHOSTS {
        let path = ptr::read(ghost_paths.add(read));
        read += 1;
        if path.is_null() {
            continue;
        }
        let (nodes, node_count) = swarm_load_ghost_nodes_from_path(path);
        if nodes.is_null() || node_count < 2 {
            continue;
        }
        SWARM_GHOST_NODES[ghost_slot] = nodes;
        SWARM_GHOST_NODE_COUNT[ghost_slot] = node_count;
        ghost_slot += 1;
    }
    SWARM_GHOST_COUNT = ghost_slot;
    ghost_slot
}

pub(crate) unsafe fn swarm_start_watch(primary_path: *const c_char, ghost_paths: *const *const c_char, ghost_count: usize) -> bool {
    if !REPLAY_SWARM_ENABLED.load(Ordering::Acquire) || !ensure_swarm_symbols() {
        return false;
    }
    if primary_path.is_null() {
        return false;
    }
    let _game = ensure_current_game();
    if CURRENT_GAME.is_null() {
        return false;
    }
    if !install_replay_swarm_hooks() || !ensure_view_replay_hook() {
        return false;
    }
    let loaded = swarm_load_selection_from_paths(primary_path, ghost_paths, ghost_count);
    if loaded == 0 && ghost_count > 0 {
        return false;
    }
    let view: GameViewReplayFn = mem::transmute(GAME_VIEW_REPLAY_TRAMPOLINE);
    if GAME_VIEW_REPLAY_TRAMPOLINE.is_null() {
        return false;
    }
    let result = view(
        CURRENT_GAME,
        SWARM_VIEW_REPLAY_SAVED.as_mut_ptr(),
        primary_path,
    );
    REPLAY_SWARM_ACTIVE.store(SWARM_GHOST_COUNT > 0, Ordering::Release);
    result != 0 || SWARM_GHOST_COUNT > 0
}

pub(crate) unsafe fn swarm_start_race(primary_path: *const c_char, ghost_paths: *const *const c_char, ghost_count: usize) -> bool {
    if !REPLAY_SWARM_ENABLED.load(Ordering::Acquire) || !ensure_swarm_symbols() {
        return false;
    }
    if primary_path.is_null() {
        return false;
    }
    let game = ensure_current_game();
    if game.is_null() {
        return false;
    }
  if !install_replay_swarm_hooks() {
        return false;
    }
    let loaded = swarm_load_selection_from_paths(primary_path, ghost_paths, ghost_count);
    if loaded == 0 && ghost_count > 0 {
        return false;
    }

    let replay = swarm_replay_object(game);
    if !replay.is_null() && !REPLAY_LOAD_PATH.is_null() && !REPLAY_DECOMPRESS_GHOST.is_null() {
        let load: ReplayLoadPathFn = mem::transmute(REPLAY_LOAD_PATH);
        let decompress: ReplayDecompressGhostFn = mem::transmute(REPLAY_DECOMPRESS_GHOST);
        IN_SWARM_LOAD = true;
        if load(replay, primary_path) != 0 {
            decompress(replay);
        }
        IN_SWARM_LOAD = false;
    }

    let level_id = leaderboard_level_id();
    if level_id > 0 && !GAME_LOAD_LEVEL.is_null() {
        let load_level: GameLoadLevelFn = mem::transmute(GAME_LOAD_LEVEL);
        load_level(game, level_id as c_uint, 0);
    }

    REPLAY_SWARM_ACTIVE.store(SWARM_GHOST_COUNT > 0, Ordering::Release);
    SWARM_GHOST_COUNT > 0 || !primary_path.is_null()
}

pub(crate) unsafe fn install_replay_swarm_hooks() -> bool {
    if REPLAY_SWARM_HOOKS_INSTALLED.load(Ordering::Acquire) {
        return true;
    }
    if REPLAY_SWARM_HOOKS_INSTALLED.swap(true, Ordering::AcqRel) {
        return true;
    }
    if !ensure_swarm_symbols() {
        REPLAY_SWARM_HOOKS_INSTALLED.store(false, Ordering::Release);
        return false;
    }
    let render_ghost = resolve(b"_ZN4Game11RenderGhostEv\0");
    if render_ghost.is_null() {
        REPLAY_SWARM_HOOKS_INSTALLED.store(false, Ordering::Release);
        return false;
    }
    GAME_RENDER_GHOST_TRAMPOLINE = install_inline_hook(
        render_ghost,
        hooked_game_render_ghost as *const c_void,
        GAME_RENDER_GHOST_HOOK_BYTES,
    );
    let ok = !GAME_RENDER_GHOST_TRAMPOLINE.is_null()
        && ensure_view_replay_hook()
        && ensure_replay_update_hook()
        && ensure_replay_load_hook()
        // Swarm cars draw from the shared World::Render hook (3D pass).
        && ensure_world_render_hook();
    if !ok {
        REPLAY_SWARM_HOOKS_INSTALLED.store(false, Ordering::Release);
    }
    ok
}
