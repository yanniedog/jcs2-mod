#![no_std]

use core::ffi::{c_char, c_int, c_uint, c_void};
use core::panic::PanicInfo;
use core::ptr;
use core::sync::atomic::{AtomicBool, Ordering};

const RTLD_DEFAULT: *mut c_void = 0usize as *mut c_void;
const RTLD_NOW: c_int = 2;
const CHECKPOINT_LIMIT: c_int = 999;
const DLC_ITEM_COUNT: usize = 0x200;
const DLC_ITEM_SIZE: usize = 0x870;
const DLC_PURCHASED_OFFSET: usize = 0x5c;

const REPLAY_NODE_SIZE: usize = 0x14;
const VISUAL_FLAGS_OFFSET: usize = 1;
const MARKER_FRAMES: c_int = 6;
const MAX_RECORDING_GROWTH: c_int = 16;
const MARKER_POLL_MICROSECONDS: c_uint = 1000;
const FLAPS_FULL_UP: u8 = 0xf0;
const FLAPS_FULL_DOWN: u8 = 0x00;
const PRESERVED_REPLAY_FLAGS: u8 = 0x0c;
const REMARK_RECENT_NODES: c_int = 120;

type ThreadStart = unsafe extern "C" fn(*mut c_void) -> *mut c_void;

extern "C" {
    fn dlopen(filename: *const c_char, flags: c_int) -> *mut c_void;
    fn dlsym(handle: *mut c_void, symbol: *const c_char) -> *mut c_void;
    fn pthread_create(
        thread: *mut usize,
        attributes: *const c_void,
        start: ThreadStart,
        argument: *mut c_void,
    ) -> c_int;
    fn pthread_detach(thread: usize) -> c_int;
    fn usleep(microseconds: c_uint) -> c_int;
}

static mut TRUEAXIS_HANDLE: *mut c_void = ptr::null_mut();
static mut CHECKPOINT_LIMIT_ADDRESS: *mut c_int = ptr::null_mut();
static mut DLC_CONNECTIONS: *mut u8 = ptr::null_mut();
static mut REPLAY_NODES: *mut *mut u8 = ptr::null_mut();
static mut REPLAY_SIZE: *mut c_int = ptr::null_mut();
static mut CHECKPOINT_TIMES: *mut *mut f32 = ptr::null_mut();
static mut GHOST_CHECKPOINT_TIMES: *mut *mut f32 = ptr::null_mut();
static mut CHECKPOINT_COUNT: *mut c_int = ptr::null_mut();
static mut GHOST_CHECKPOINT_COUNT: *mut c_int = ptr::null_mut();
static MARKER_WORKER_STARTED: AtomicBool = AtomicBool::new(false);

#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
    loop {}
}

unsafe fn trueaxis_handle() -> *mut c_void {
    if TRUEAXIS_HANDLE.is_null() {
        TRUEAXIS_HANDLE = dlopen(b"libtrueaxis.so\0".as_ptr() as *const c_char, RTLD_NOW);
    }
    TRUEAXIS_HANDLE
}

unsafe fn resolve(name: &'static [u8]) -> *mut c_void {
    let handle = trueaxis_handle();
    let mut address = if handle.is_null() {
        ptr::null_mut()
    } else {
        dlsym(handle, name.as_ptr() as *const c_char)
    };
    if address.is_null() {
        address = dlsym(RTLD_DEFAULT, name.as_ptr() as *const c_char);
    }
    address
}

unsafe fn mark_node(nodes: *mut u8, node_index: c_int) {
    let flags = nodes.add(node_index as usize * REPLAY_NODE_SIZE + VISUAL_FLAGS_OFFSET);
    let original_flags = ptr::read_volatile(flags);
    let flaps = if (node_index / MARKER_FRAMES) & 1 == 0 {
        FLAPS_FULL_UP
    } else {
        FLAPS_FULL_DOWN
    };
    ptr::write_volatile(flags, (original_flags & PRESERVED_REPLAY_FLAGS) | flaps);
}

unsafe fn mark_recent_nodes(nodes: *mut u8, size: c_int) {
    let start = (size - REMARK_RECENT_NODES).max(0);
    let mut index = start;
    while index < size {
        mark_node(nodes, index);
        index += 1;
    }
}

unsafe fn force_checkpoint_limit() -> bool {
    if CHECKPOINT_LIMIT_ADDRESS.is_null() {
        CHECKPOINT_LIMIT_ADDRESS = resolve(b"g_nMaxNumCheckPointTimes\0") as *mut c_int;
    }
    if CHECKPOINT_LIMIT_ADDRESS.is_null() {
        return false;
    }
    ptr::write_volatile(CHECKPOINT_LIMIT_ADDRESS, CHECKPOINT_LIMIT);
    true
}

unsafe fn force_iap_ownership() -> bool {
    if DLC_CONNECTIONS.is_null() {
        DLC_CONNECTIONS = resolve(b"g_dlcConnections\0") as *mut u8;
    }
    if DLC_CONNECTIONS.is_null() {
        return false;
    }
    for index in 0..DLC_ITEM_COUNT {
        ptr::write_volatile(
            DLC_CONNECTIONS.add(index * DLC_ITEM_SIZE + DLC_PURCHASED_OFFSET),
            1u8,
        );
    }
    true
}

unsafe extern "C" fn replay_marker_worker(_argument: *mut c_void) -> *mut c_void {
    let mut observed_size = ptr::read_volatile(REPLAY_SIZE).max(0);
    let mut observed_nodes = ptr::read_volatile(REPLAY_NODES);
    let mut recording_active = false;
    let mut slow_patch_tick = 0u8;
    loop {
        usleep(MARKER_POLL_MICROSECONDS);
        force_checkpoint_limit();
        slow_patch_tick = slow_patch_tick.wrapping_add(1);
        if slow_patch_tick == 0 {
            force_iap_ownership();
        }
        let size = ptr::read_volatile(REPLAY_SIZE).max(0);
        let nodes = ptr::read_volatile(REPLAY_NODES);
        if nodes.is_null() {
            observed_nodes = nodes;
            observed_size = size;
            recording_active = false;
            continue;
        }
        if nodes != observed_nodes || size < observed_size {
            observed_nodes = nodes;
            observed_size = size;
            recording_active = false;
            continue;
        }
        if size == observed_size {
            if recording_active {
                mark_recent_nodes(nodes, size);
            }
            observed_size = size;
            continue;
        }

        let growth = size - observed_size;
        if growth <= MAX_RECORDING_GROWTH {
            recording_active = true;
            mark_recent_nodes(nodes, size);
        } else {
            // Replay loading/decompression occurs as a large jump. Never mark viewed replays.
            recording_active = false;
        }
        observed_size = size;
    }
}

unsafe fn install_replay_marker() -> bool {
    if MARKER_WORKER_STARTED.load(Ordering::Acquire) {
        return true;
    }
    REPLAY_NODES = resolve(b"g_pReplay\0") as *mut *mut u8;
    REPLAY_SIZE = resolve(b"g_nReplaySize\0") as *mut c_int;
    if REPLAY_NODES.is_null() || REPLAY_SIZE.is_null() {
        return false;
    }

    if MARKER_WORKER_STARTED.swap(true, Ordering::AcqRel) {
        return true;
    }
    let mut thread = 0usize;
    if pthread_create(
        &mut thread,
        ptr::null(),
        replay_marker_worker,
        ptr::null_mut(),
    ) != 0
    {
        MARKER_WORKER_STARTED.store(false, Ordering::Release);
        return false;
    }
    pthread_detach(thread);
    true
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_applyUnlimitedCheckpoints(
    _env: *mut c_void,
    _class: *mut c_void,
) -> u8 {
    let checkpoints = force_checkpoint_limit();
    let iap = force_iap_ownership();
    (checkpoints && iap) as u8
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_installReplayVisualMarker(
    _env: *mut c_void,
    _class: *mut c_void,
) -> u8 {
    install_replay_marker() as u8
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_readLatestCheckpointSplit(
    _env: *mut c_void,
    _class: *mut c_void,
) -> i64 {
    if CHECKPOINT_TIMES.is_null() {
        CHECKPOINT_TIMES = resolve(b"g_pfCheckPointTimes\0") as *mut *mut f32;
        GHOST_CHECKPOINT_TIMES = resolve(b"g_pfGhostCheckPointTimes\0") as *mut *mut f32;
        CHECKPOINT_COUNT = resolve(b"g_nNumCheckPointTimes\0") as *mut c_int;
        GHOST_CHECKPOINT_COUNT = resolve(b"g_nNumGhostCheckPointTimes\0") as *mut c_int;
    }
    if CHECKPOINT_TIMES.is_null()
        || GHOST_CHECKPOINT_TIMES.is_null()
        || CHECKPOINT_COUNT.is_null()
        || GHOST_CHECKPOINT_COUNT.is_null()
    {
        return 0;
    }

    let count = ptr::read_volatile(CHECKPOINT_COUNT).max(0);
    let ghost_count = ptr::read_volatile(GHOST_CHECKPOINT_COUNT).max(0);
    let current = ptr::read_volatile(CHECKPOINT_TIMES);
    let ghost = ptr::read_volatile(GHOST_CHECKPOINT_TIMES);
    if ghost_count < 1 || count < 1 || count > ghost_count || current.is_null() || ghost.is_null() {
        return 0;
    }

    let index = (count - 1) as usize;
    let difference = ptr::read_volatile(current.add(index)) - ptr::read_volatile(ghost.add(index));
    let milliseconds = (difference * 1000.0) as i32;
    ((count as i64) << 32) | (milliseconds as u32 as i64)
}
