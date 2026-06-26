#![no_std]

use core::ffi::{c_char, c_int, c_uint, c_void};
use core::panic::PanicInfo;
use core::ptr;
use core::sync::atomic::{AtomicBool, Ordering};

const RTLD_DEFAULT: *mut c_void = 0usize as *mut c_void;
const RTLD_NOW: c_int = 2;
const CHECKPOINT_LIMIT: c_int = 999;
const CHECKPOINT_LIMIT_USIZE: usize = 999;
const DLC_ITEM_COUNT: usize = 0x200;
const DLC_ITEM_SIZE: usize = 0x870;
const DLC_PURCHASED_OFFSET: usize = 0x5c;
const RETAINED_PATCH_POLL_MICROSECONDS: c_uint = 100_000;

// --- Read-only ghost route reconstruction constants ---------------------------
// The ghost replay is decompressed by the stock engine into `g_pGhost`, an array
// of `g_nGhostSize` fixed 20-byte nodes. `Replay::UpdateGhost` integrates each
// node exactly as below: when flag bit 3 is set the three float32s at +8/+0xC/+0x10
// are velocity deltas (integrated into a running velocity, which is integrated into
// the world position); otherwise the node is an absolute position keyframe. The
// route reconstruction here reproduces that position math purely to read out the
// full world-space path so it can be drawn. It never writes game memory.
const GHOST_NODE_SIZE: usize = 0x14;
const GHOST_NODE_FLAGS: usize = 1;
const GHOST_NODE_DX: usize = 8;
const GHOST_FLAG_DELTA: u8 = 0x08;
const GHOST_FLAG_BOOST: u8 = 0x01;
const GHOST_FLAG_AIR_BRAKE: u8 = 0x02;
const GHOST_FLAG_BRAKE: u8 = 0x04;
const ROUTE_STRIDE: usize = 4;
const ROUTE_CLASS_ACCEL: f32 = 0.0;
const ROUTE_CLASS_BOOST: f32 = 1.0;
const ROUTE_CLASS_COAST: f32 = 2.0;
const ROUTE_CLASS_BRAKE: f32 = 3.0;
const MAX_ROUTE_POINTS: usize = 3_000;
const MAX_GHOST_NODES: c_int = 2_000_000;

// Anonymous OpenGL matrix-stack globals live in the engine's writable .bss. They
// are not exported symbols, so their runtime addresses are derived from the load
// slide of an exported neighbour (`g_nGhostSize`) plus their fixed link vaddrs,
// recovered by disassembling OpenGl2EsSupportFunctions_GetModelViewProjectionMatrix.
const GHOST_SIZE_VADDR: usize = 0x5a0514;
const MV_MATRIX0_VADDR: usize = 0x33fffc;
const PROJ_MATRIX0_VADDR: usize = 0x33fffc + 0x1000;
const GHOST_TRANSFORM_POS_FLOAT: usize = 12;
const GHOST_VIEW_MATRICES_FLOATS: c_int = 35;
const REPLAY_HEADER_REPLAY_SIZE_OFFSET: usize = 0x00;
const REPLAY_HEADER_CHECKPOINT_COUNT_OFFSET: usize = 0x08;
const REPLAY_HEADER_FINISH_SECONDS_OFFSET: usize = 0x14;

// Standard JNI function-table indices (JNINativeInterface order).
const JNI_GET_ARRAY_LENGTH: usize = 171;
const JNI_SET_FLOAT_ARRAY_REGION: usize = 213;

type ThreadStart = unsafe extern "C" fn(*mut c_void) -> *mut c_void;

extern "C" {
    fn signal(signum: c_int, handler: usize) -> usize;
    fn raise(signum: c_int) -> c_int;
    fn open(pathname: *const c_char, flags: c_int, mode: c_int) -> c_int;
    fn write(fd: c_int, buf: *const c_void, count: usize) -> isize;
    fn close(fd: c_int) -> c_int;
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
static mut CHECKPOINT_TIMES: *mut *mut f32 = ptr::null_mut();
static mut GHOST_CHECKPOINT_TIMES: *mut *mut f32 = ptr::null_mut();
static mut CHECKPOINT_COUNT: *mut c_int = ptr::null_mut();
static mut GHOST_CHECKPOINT_COUNT: *mut c_int = ptr::null_mut();
static mut GHOST_SIZE: *mut c_int = ptr::null_mut();
static mut REPLAY_COMPRESSED_HEADER: *mut *const u8 = ptr::null_mut();
static mut SHOW_REPLAY: *mut u8 = ptr::null_mut();
static mut LAST_CHECKPOINT_TIME: *mut f32 = ptr::null_mut();
static mut LAST_CHECKPOINT_INDEX: *mut c_int = ptr::null_mut();
static mut GHOST_POS: *mut c_int = ptr::null_mut();
static mut LAST_GHOST_POS: *mut c_int = ptr::null_mut();
static mut LAST_REPLAY_SIZE: *mut c_int = ptr::null_mut();
static mut GHOST_RETRY_SKIP_INDEX: *mut c_int = ptr::null_mut();
static mut LAST_GHOST_RETRY_SKIP_INDEX: *mut c_int = ptr::null_mut();
static mut GHOST_RETRY_PAUSE_TIME: *mut c_int = ptr::null_mut();
static mut LAST_GHOST_RETRY_PAUSE_TIME: *mut c_int = ptr::null_mut();
static mut NUM_GHOST_RETRY_SKIP_TIMES: *mut c_int = ptr::null_mut();
static mut CHECKPOINT_TRANSFORM: *mut f32 = ptr::null_mut();
static mut LAST_GHOST_TRANSFORM: *mut f32 = ptr::null_mut();
static mut LAST_SPLIT_CHECKPOINT: c_int = 0;
static mut LAST_SPLIT_CURRENT_MS: i32 = -1;
static mut FALLBACK_GHOST_CHECKPOINT_COUNT: c_int = 0;
static mut FALLBACK_GHOST_FINISH_MS: i32 = -1;
static mut FALLBACK_GHOST_CHECKPOINT_MS: [i32; CHECKPOINT_LIMIT_USIZE] =
    [-1; CHECKPOINT_LIMIT_USIZE];
static mut GHOST_BUFFER: *mut *const u8 = ptr::null_mut();
static mut GHOST_TRANSFORM: *mut f32 = ptr::null_mut();
static mut GHOST_ROUTE: [f32; MAX_ROUTE_POINTS * ROUTE_STRIDE] =
    [0.0; MAX_ROUTE_POINTS * ROUTE_STRIDE];
static RETAINED_PATCH_WORKER_STARTED: AtomicBool = AtomicBool::new(false);
static NATIVE_SIGNAL_HANDLER_STARTED: AtomicBool = AtomicBool::new(false);

const SIGABRT: c_int = 6;
const SIGBUS: c_int = 7;
const SIGFPE: c_int = 8;
const SIGILL: c_int = 4;
const SIGSEGV: c_int = 11;
const O_WRONLY: c_int = 1;
const O_CREAT: c_int = 0o100;
const O_APPEND: c_int = 0o2000;
const NATIVE_CRASH_LOG_PUBLIC: &[u8] =
    b"/storage/emulated/0/YCS2CommunityMod/logs/ycs2_mod_native_crash.log\0";
const NATIVE_CRASH_LOG_APP_EXTERNAL: &[u8] =
    b"/storage/emulated/0/Android/data/modded.ycs2/files/ycs2_mod_native_crash.log\0";

static mut PREVIOUS_SIGABRT: usize = 0;
static mut PREVIOUS_SIGBUS: usize = 0;
static mut PREVIOUS_SIGFPE: usize = 0;
static mut PREVIOUS_SIGILL: usize = 0;
static mut PREVIOUS_SIGSEGV: usize = 0;

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

unsafe fn write_signal_log(fd: c_int, bytes: &'static [u8]) {
    let _ = write(fd, bytes.as_ptr() as *const c_void, bytes.len());
}

unsafe fn signal_label(signum: c_int) -> &'static [u8] {
    match signum {
        SIGABRT => b"SIGABRT(6)",
        SIGBUS => b"SIGBUS(7)",
        SIGFPE => b"SIGFPE(8)",
        SIGILL => b"SIGILL(4)",
        SIGSEGV => b"SIGSEGV(11)",
        _ => b"UNKNOWN",
    }
}

unsafe fn previous_signal_handler(signum: c_int) -> usize {
    match signum {
        SIGABRT => PREVIOUS_SIGABRT,
        SIGBUS => PREVIOUS_SIGBUS,
        SIGFPE => PREVIOUS_SIGFPE,
        SIGILL => PREVIOUS_SIGILL,
        SIGSEGV => PREVIOUS_SIGSEGV,
        _ => 0,
    }
}

unsafe extern "C" fn native_signal_handler(signum: c_int) {
    write_native_signal_log(NATIVE_CRASH_LOG_PUBLIC, signum);
    write_native_signal_log(NATIVE_CRASH_LOG_APP_EXTERNAL, signum);
    let previous = previous_signal_handler(signum);
    let _ = signal(signum, previous);
    let _ = raise(signum);
    loop {}
}

unsafe fn write_native_signal_log(path: &'static [u8], signum: c_int) {
    let fd = open(
        path.as_ptr() as *const c_char,
        O_WRONLY | O_CREAT | O_APPEND,
        0o600,
    );
    if fd >= 0 {
        write_signal_log(fd, b"native fatal signal ");
        write_signal_log(fd, signal_label(signum));
        write_signal_log(fd, b" in modded.ycs2; check Android tombstone/logcat for stack\n");
        let _ = close(fd);
    }
}

unsafe fn install_native_signal_handlers() -> bool {
    if NATIVE_SIGNAL_HANDLER_STARTED.swap(true, Ordering::AcqRel) {
        return true;
    }
    let handler = native_signal_handler as usize;
    PREVIOUS_SIGABRT = signal(SIGABRT, handler);
    PREVIOUS_SIGBUS = signal(SIGBUS, handler);
    PREVIOUS_SIGFPE = signal(SIGFPE, handler);
    PREVIOUS_SIGILL = signal(SIGILL, handler);
    PREVIOUS_SIGSEGV = signal(SIGSEGV, handler);
    true
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

unsafe extern "C" fn retained_patch_worker(_argument: *mut c_void) -> *mut c_void {
    let mut slow_patch_tick = 0u8;
    loop {
        usleep(RETAINED_PATCH_POLL_MICROSECONDS);
        force_checkpoint_limit();
        slow_patch_tick = slow_patch_tick.wrapping_add(1);
        if slow_patch_tick == 0 {
            force_iap_ownership();
        }
    }
}

unsafe fn install_retained_patch_worker() -> bool {
    if RETAINED_PATCH_WORKER_STARTED.load(Ordering::Acquire) {
        return true;
    }

    if RETAINED_PATCH_WORKER_STARTED.swap(true, Ordering::AcqRel) {
        return true;
    }
    let mut thread = 0usize;
    if pthread_create(
        &mut thread,
        ptr::null(),
        retained_patch_worker,
        ptr::null_mut(),
    ) != 0
    {
        RETAINED_PATCH_WORKER_STARTED.store(false, Ordering::Release);
        return false;
    }
    pthread_detach(thread);
    true
}

unsafe fn ensure_split_symbols() -> bool {
    if CHECKPOINT_TIMES.is_null() {
        CHECKPOINT_TIMES = resolve(b"g_pfCheckPointTimes\0") as *mut *mut f32;
        GHOST_CHECKPOINT_TIMES = resolve(b"g_pfGhostCheckPointTimes\0") as *mut *mut f32;
        CHECKPOINT_COUNT = resolve(b"g_nNumCheckPointTimes\0") as *mut c_int;
        GHOST_CHECKPOINT_COUNT = resolve(b"g_nNumGhostCheckPointTimes\0") as *mut c_int;
        GHOST_SIZE = resolve(b"g_nGhostSize\0") as *mut c_int;
        REPLAY_COMPRESSED_HEADER = resolve(b"g_pReplayCompressedHeader\0") as *mut *const u8;
        SHOW_REPLAY = resolve(b"g_bShowReplay\0") as *mut u8;
        LAST_CHECKPOINT_TIME = resolve(b"g_fLastCheckPointTime\0") as *mut f32;
        LAST_CHECKPOINT_INDEX = resolve(b"g_nLastCheckPoint\0") as *mut c_int;
        GHOST_POS = resolve(b"g_nGhostPos\0") as *mut c_int;
        LAST_GHOST_POS = resolve(b"g_nLastGhostPos\0") as *mut c_int;
        LAST_REPLAY_SIZE = resolve(b"g_nLastReplaySize\0") as *mut c_int;
        GHOST_RETRY_SKIP_INDEX = resolve(b"g_nGhostRetrySkipTimeIndex\0") as *mut c_int;
        LAST_GHOST_RETRY_SKIP_INDEX = resolve(b"g_nLastGhostRetrySkipTimeIndex\0") as *mut c_int;
        GHOST_RETRY_PAUSE_TIME = resolve(b"g_nGhostRetryPauseTime\0") as *mut c_int;
        LAST_GHOST_RETRY_PAUSE_TIME = resolve(b"g_nLastGhostRetryPauseTime\0") as *mut c_int;
        NUM_GHOST_RETRY_SKIP_TIMES = resolve(b"g_nNumGhostRetrySkipTimes\0") as *mut c_int;
        CHECKPOINT_TRANSFORM = resolve(b"g_checkPointTransfrom\0") as *mut f32;
        LAST_GHOST_TRANSFORM = resolve(b"g_ghostTransformLast\0") as *mut f32;
    }
    !(CHECKPOINT_TIMES.is_null()
        || GHOST_CHECKPOINT_TIMES.is_null()
        || CHECKPOINT_COUNT.is_null()
        || GHOST_CHECKPOINT_COUNT.is_null()
        || GHOST_SIZE.is_null()
        || REPLAY_COMPRESSED_HEADER.is_null()
        || SHOW_REPLAY.is_null())
}

unsafe fn read_i32_pointer(pointer: *mut c_int) -> i32 {
    if pointer.is_null() {
        -1
    } else {
        ptr::read_volatile(pointer)
    }
}

unsafe fn replay_nodes_to_ms(nodes: i32) -> i32 {
    if nodes < 0 {
        -1
    } else {
        ((nodes as i64) * 1000 / 60) as i32
    }
}

unsafe fn abs_i32(value: i32) -> i32 {
    if value < 0 {
        -value
    } else {
        value
    }
}

unsafe fn visually_aligned_ghost_ms(raw_ghost_ms: i32) -> i32 {
    if raw_ghost_ms <= 0 || GHOST_SIZE.is_null() {
        return raw_ghost_ms;
    }
    let current_ms = last_checkpoint_ms();
    let last_ghost_pos = read_i32_pointer(LAST_GHOST_POS);
    let ghost_size = ptr::read_volatile(GHOST_SIZE).max(0);
    if current_ms <= 0 || last_ghost_pos < 1 || ghost_size < 2 {
        return raw_ghost_ms;
    }
    // Once the replay ghost has reached the end, its node clock is clamped and
    // no longer identifies the checkpoint it passed earlier.
    if last_ghost_pos >= ghost_size - 2 {
        return raw_ghost_ms;
    }
    let visual_ms = replay_nodes_to_ms(last_ghost_pos);
    if visual_ms <= 0 {
        return raw_ghost_ms;
    }
    let raw_delta = abs_i32(current_ms - raw_ghost_ms);
    let visual_delta = abs_i32(current_ms - visual_ms);
    if raw_delta > 3000 && visual_delta + 1000 < raw_delta {
        visual_ms
    } else {
        raw_ghost_ms
    }
}

unsafe fn ghost_checkpoint_distance_sq1000() -> i32 {
    if LAST_GHOST_TRANSFORM.is_null() || CHECKPOINT_TRANSFORM.is_null() {
        return -1;
    }
    let ghost_x = ptr::read_volatile(LAST_GHOST_TRANSFORM.add(GHOST_TRANSFORM_POS_FLOAT));
    let ghost_y = ptr::read_volatile(LAST_GHOST_TRANSFORM.add(GHOST_TRANSFORM_POS_FLOAT + 1));
    let ghost_z = ptr::read_volatile(LAST_GHOST_TRANSFORM.add(GHOST_TRANSFORM_POS_FLOAT + 2));
    let checkpoint_x = ptr::read_volatile(CHECKPOINT_TRANSFORM.add(GHOST_TRANSFORM_POS_FLOAT));
    let checkpoint_y = ptr::read_volatile(CHECKPOINT_TRANSFORM.add(GHOST_TRANSFORM_POS_FLOAT + 1));
    let checkpoint_z = ptr::read_volatile(CHECKPOINT_TRANSFORM.add(GHOST_TRANSFORM_POS_FLOAT + 2));
    let dx = ghost_x - checkpoint_x;
    let dy = ghost_y - checkpoint_y;
    let dz = ghost_z - checkpoint_z;
    let distance_sq = dx * dx + dy * dy + dz * dz;
    if distance_sq >= 0.0 && distance_sq < 2_147_000.0 {
        (distance_sq * 1000.0) as i32
    } else {
        -1
    }
}

unsafe fn reset_split_tracking() {
    LAST_SPLIT_CHECKPOINT = 0;
    LAST_SPLIT_CURRENT_MS = -1;
}

unsafe fn reset_ghost_checkpoint_fallback() {
    FALLBACK_GHOST_CHECKPOINT_COUNT = 0;
    FALLBACK_GHOST_FINISH_MS = -1;
    let mut index = 0usize;
    while index < CHECKPOINT_LIMIT_USIZE {
        FALLBACK_GHOST_CHECKPOINT_MS[index] = -1;
        index += 1;
    }
}

unsafe fn last_checkpoint_ms() -> i32 {
    if LAST_CHECKPOINT_TIME.is_null() {
        return -1;
    }
    (ptr::read_volatile(LAST_CHECKPOINT_TIME) * 1000.0) as i32
}

unsafe fn live_checkpoint_index() -> c_int {
    if LAST_CHECKPOINT_INDEX.is_null() {
        return -1;
    }
    ptr::read_volatile(LAST_CHECKPOINT_INDEX)
}

unsafe fn decoded_live_checkpoint_index() -> c_int {
    let raw = live_checkpoint_index();
    if raw < 0 {
        return -1;
    }
    // In the replay-race path the low bits are zero-based checkpoint index and
    // high bits carry engine state flags (for example 0x08000000 at CP1).
    (raw & 0x00ff_ffff) + 1
}

/// The stock engine stores live checkpoint split times in `g_pfCheckPointTimes`
/// and raced-ghost checkpoint times in `g_pfGhostCheckPointTimes`. Use those two
/// arrays as the authoritative comparison source. `g_nLastCheckPoint` is useful
/// for diagnostics, but on the ghost-race path it may stay zero/lagging and left
/// the HUD permanently armed at "SPLIT --".
unsafe fn live_checkpoint_count() -> c_int {
    if CHECKPOINT_COUNT.is_null() {
        return -1;
    }
    ptr::read_volatile(CHECKPOINT_COUNT).max(0)
}

unsafe fn official_ghost_checkpoint_count() -> c_int {
    if GHOST_CHECKPOINT_COUNT.is_null() {
        return 0;
    }
    ptr::read_volatile(GHOST_CHECKPOINT_COUNT).max(0)
}

unsafe fn replay_header() -> *const u8 {
    if REPLAY_COMPRESSED_HEADER.is_null() {
        return ptr::null();
    }
    ptr::read_volatile(REPLAY_COMPRESSED_HEADER)
}

unsafe fn replay_header_i32(offset: usize) -> i32 {
    let header = replay_header();
    if header.is_null() {
        return -1;
    }
    ptr::read_volatile(header.add(offset) as *const i32)
}

unsafe fn replay_header_finish_ms() -> i32 {
    let header = replay_header();
    if header.is_null() {
        return -1;
    }
    let seconds = ptr::read_volatile(header.add(REPLAY_HEADER_FINISH_SECONDS_OFFSET) as *const f32);
    if seconds > 0.0 && seconds < 86_400.0 {
        (seconds * 1000.0) as i32
    } else {
        -1
    }
}

unsafe fn replay_header_checkpoint_count() -> c_int {
    replay_header_i32(REPLAY_HEADER_CHECKPOINT_COUNT_OFFSET).max(0)
}

unsafe fn replay_header_is_current_finish() -> bool {
    replay_header_i32(REPLAY_HEADER_REPLAY_SIZE_OFFSET) < 0
}

unsafe fn capture_ghost_replay_baseline() {
    if GHOST_SIZE.is_null() || ptr::read_volatile(GHOST_SIZE).max(0) < 1 {
        return;
    }
    if replay_header_i32(REPLAY_HEADER_REPLAY_SIZE_OFFSET) <= 0 {
        return;
    }
    let finish = replay_header_finish_ms();
    if finish > 0 {
        FALLBACK_GHOST_FINISH_MS = finish;
    }
    let header_checkpoints = replay_header_checkpoint_count();
    if official_ghost_checkpoint_count() == 0
        && header_checkpoints > 0
        && last_checkpoint_ms() <= 0
        && live_checkpoint_count() <= header_checkpoints
    {
        FALLBACK_GHOST_CHECKPOINT_COUNT = header_checkpoints;
        let limit = if header_checkpoints as usize > CHECKPOINT_LIMIT_USIZE {
            CHECKPOINT_LIMIT_USIZE
        } else {
            header_checkpoints as usize
        };
        let mut index = 0usize;
        while index < limit {
            let millis = checkpoint_time_ms(index as c_int);
            if millis > 0 {
                FALLBACK_GHOST_CHECKPOINT_MS[index] = millis;
            }
            index += 1;
        }
    }
}

unsafe fn effective_ghost_checkpoint_count() -> c_int {
    let official = official_ghost_checkpoint_count();
    if official > 0 {
        FALLBACK_GHOST_CHECKPOINT_COUNT = official;
        return official;
    }

    if GHOST_SIZE.is_null() || ptr::read_volatile(GHOST_SIZE).max(0) < 1 {
        reset_ghost_checkpoint_fallback();
        return 0;
    }

    capture_ghost_replay_baseline();
    if FALLBACK_GHOST_CHECKPOINT_COUNT > 0 {
        return FALLBACK_GHOST_CHECKPOINT_COUNT;
    }

    let count = live_checkpoint_count();
    if count > 0 && last_checkpoint_ms() <= 0 {
        // Some stock/normal-level replay races preload ghost checkpoint times in
        // the live checkpoint array but leave g_nNumGhostCheckPointTimes empty.
        // Capture that pre-race baseline so later appended live entries can be
        // compared against it.
        FALLBACK_GHOST_CHECKPOINT_COUNT = count;
    }

    FALLBACK_GHOST_CHECKPOINT_COUNT.max(0)
}

unsafe fn checkpoint_time_ms(index: c_int) -> i32 {
    if index < 0 || CHECKPOINT_TIMES.is_null() {
        return -1;
    }
    let count = live_checkpoint_count();
    if count < 1 || index >= count {
        return -1;
    }
    let current = ptr::read_volatile(CHECKPOINT_TIMES);
    if current.is_null() {
        return -1;
    }
    let millis = (ptr::read_volatile(current.add(index as usize)) * 1000.0) as i32;
    if millis > 0 {
        millis
    } else {
        -1
    }
}

unsafe fn official_ghost_checkpoint_time_ms(index: c_int) -> i32 {
    if index < 0 || GHOST_CHECKPOINT_TIMES.is_null() {
        return -1;
    }
    let count = official_ghost_checkpoint_count();
    if count < 1 || index >= count {
        return -1;
    }
    let ghost = ptr::read_volatile(GHOST_CHECKPOINT_TIMES);
    if ghost.is_null() {
        return -1;
    }
    let millis = (ptr::read_volatile(ghost.add(index as usize)) * 1000.0) as i32;
    if millis > 0 {
        millis
    } else {
        -1
    }
}

unsafe fn live_checkpoint_ms(checkpoint: c_int) -> i32 {
    if checkpoint < 1 {
        return -1;
    }
    let last_ms = last_checkpoint_ms();
    if last_ms > 0
        && (decoded_live_checkpoint_index() == checkpoint
            || scan_live_checkpoint_from_last_time() == checkpoint)
    {
        return last_ms;
    }
    let count = live_checkpoint_count();
    let ghost_count = effective_ghost_checkpoint_count();
    if ghost_count > 0 && count >= ghost_count + checkpoint {
        let millis = checkpoint_time_ms(ghost_count + checkpoint - 1);
        if millis > 0 {
            return millis;
        }
    }
    let millis = checkpoint_time_ms(checkpoint - 1);
    if millis > 0 {
        return millis;
    }
    last_checkpoint_ms()
}

unsafe fn scan_live_checkpoint_from_last_time() -> c_int {
    let count = live_checkpoint_count();
    if count < 1 {
        return -1;
    }
    let target = last_checkpoint_ms();
    if target <= 0 {
        return -1;
    }
    let ghost_count = effective_ghost_checkpoint_count();
    let start_index = if ghost_count > 0 && count > ghost_count {
        ghost_count
    } else {
        0
    };
    let mut best_index = -1;
    let mut best_delta = 251i32;
    let mut index = start_index;
    while index < count {
        let millis = checkpoint_time_ms(index);
        let delta = if millis >= target {
            millis - target
        } else {
            target - millis
        };
        if millis > 0 && delta < best_delta {
            best_delta = delta;
            best_index = index;
        }
        index += 1;
    }
    if best_index < 0 {
        return -1;
    }
    if ghost_count > 0 && count > ghost_count && best_index >= ghost_count {
        best_index - ghost_count + 1
    } else {
        best_index + 1
    }
}

/// The raced ghost's cumulative time at a 1-based checkpoint, in milliseconds,
/// read from the clean `g_pfGhostCheckPointTimes` snapshot. Returns -1 when the
/// checkpoint is out of range or the snapshot is unavailable.
unsafe fn ghost_checkpoint_ms(checkpoint: c_int) -> i32 {
    if checkpoint < 1 {
        return -1;
    }
    let ghost_count = official_ghost_checkpoint_count();
    let ghost = ptr::read_volatile(GHOST_CHECKPOINT_TIMES);
    if checkpoint <= ghost_count && !ghost.is_null() {
        let millis = (ptr::read_volatile(ghost.add((checkpoint - 1) as usize)) * 1000.0) as i32;
        if millis > 0 {
            return visually_aligned_ghost_ms(millis);
        }
    }

    if checkpoint <= effective_ghost_checkpoint_count() {
        let fallback_index = (checkpoint - 1) as usize;
        if fallback_index < CHECKPOINT_LIMIT_USIZE {
            let millis = FALLBACK_GHOST_CHECKPOINT_MS[fallback_index];
            if millis > 0 {
                return visually_aligned_ghost_ms(millis);
            }
        }
        visually_aligned_ghost_ms(checkpoint_time_ms(checkpoint - 1))
    } else if checkpoint == effective_ghost_checkpoint_count() + 1 {
        FALLBACK_GHOST_FINISH_MS
    } else {
        -1
    }
}

/// Resolves the latest comparable live checkpoint (1-based) for the raced ghost.
unsafe fn latest_live_checkpoint() -> c_int {
    if !ensure_split_symbols() {
        return -1;
    }
    let ghost_count = effective_ghost_checkpoint_count();
    let ghost_size = ptr::read_volatile(GHOST_SIZE).max(0);
    if ghost_size < 1 || ghost_count < 1 {
        return -1;
    }
    let count = live_checkpoint_count();
    let decoded = decoded_live_checkpoint_index();
    let scanned = scan_live_checkpoint_from_last_time();
    let candidate = if last_checkpoint_ms() > 0 && decoded >= 1 {
        decoded
    } else if scanned >= 1 {
        scanned
    } else if count > ghost_count {
        count - ghost_count
    } else {
        -1
    };
    if candidate < 1 {
        -1
    } else if candidate > ghost_count {
        ghost_count
    } else {
        candidate
    }
}

unsafe fn packed_split(checkpoint: c_int, current_ms: i32, ghost_ms: i32) -> i64 {
    (((checkpoint + 1) as i64) << 32) | ((current_ms - ghost_ms) as u32 as i64)
}

unsafe fn final_finish_split(ghost_count: c_int) -> i64 {
    if ghost_count < 1 || FALLBACK_GHOST_FINISH_MS <= 0 || !replay_header_is_current_finish() {
        return 0;
    }

    let current_ms = replay_header_finish_ms();
    if current_ms <= 0 {
        return 0;
    }

    if LAST_SPLIT_CHECKPOINT > ghost_count
        && live_checkpoint_count() <= ghost_count
        && last_checkpoint_ms() <= 0
    {
        reset_split_tracking();
        return 1i64 << 32;
    }

    if LAST_SPLIT_CHECKPOINT > ghost_count {
        LAST_SPLIT_CURRENT_MS = current_ms;
        return packed_split(ghost_count + 1, current_ms, FALLBACK_GHOST_FINISH_MS);
    }

    if LAST_SPLIT_CHECKPOINT >= ghost_count
        && (LAST_SPLIT_CURRENT_MS < 0 || current_ms + 500 >= LAST_SPLIT_CURRENT_MS)
    {
        LAST_SPLIT_CHECKPOINT = ghost_count + 1;
        LAST_SPLIT_CURRENT_MS = current_ms;
        return packed_split(ghost_count + 1, current_ms, FALLBACK_GHOST_FINISH_MS);
    }

    0
}

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

    if ptr::read_volatile(SHOW_REPLAY) != 0 {
        reset_split_tracking();
        return 0;
    }

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

// --- Read-only ghost route line support --------------------------------------

unsafe fn ensure_route_symbols() -> bool {
    if GHOST_SIZE.is_null() {
        GHOST_SIZE = resolve(b"g_nGhostSize\0") as *mut c_int;
    }
    if GHOST_BUFFER.is_null() {
        GHOST_BUFFER = resolve(b"g_pGhost\0") as *mut *const u8;
    }
    if GHOST_TRANSFORM.is_null() {
        GHOST_TRANSFORM = resolve(b"g_ghostTransform\0") as *mut f32;
    }
    !(GHOST_SIZE.is_null() || GHOST_BUFFER.is_null())
}

/// Number of ghost nodes the engine has currently decompressed, clamped to the
/// reconstruction buffer capacity. Zero when no ghost replay is loaded.
unsafe fn ghost_node_count() -> c_int {
    if !ensure_route_symbols() {
        return 0;
    }
    let n = ptr::read_volatile(GHOST_SIZE);
    if n < 2 || n > MAX_GHOST_NODES {
        return 0;
    }
    n
}

unsafe fn route_class(flags: u8, speed: f32, previous_speed: f32) -> f32 {
    if flags & GHOST_FLAG_BOOST != 0 {
        ROUTE_CLASS_BOOST
    } else if flags & (GHOST_FLAG_AIR_BRAKE | GHOST_FLAG_BRAKE) != 0 {
        ROUTE_CLASS_BRAKE
    } else if speed > previous_speed + 1.0e-4 {
        ROUTE_CLASS_ACCEL
    } else {
        ROUTE_CLASS_COAST
    }
}

/// Reconstructs the entire ghost world-space path into `GHOST_ROUTE` by replaying
/// the engine's own per-node position integration (read-only). Each stored point
/// is x/y/z/class, where class is used by the Java overlay to colour the line.
/// Returns the number of points written (<= MAX_ROUTE_POINTS); longer replays are
/// evenly subsampled so the whole route is still represented.
unsafe fn reconstruct_ghost_route() -> usize {
    let n = ghost_node_count();
    if n < 2 {
        return 0;
    }
    let base = ptr::read_volatile(GHOST_BUFFER);
    if base.is_null() {
        return 0;
    }
    let total = n as usize;
    let store_stride = (total + MAX_ROUTE_POINTS - 1) / MAX_ROUTE_POINTS;
    let route = core::ptr::addr_of_mut!(GHOST_ROUTE) as *mut f32;
    let mut pos = [0.0f32; 3];
    let mut previous_pos = [0.0f32; 3];
    let mut vel = [0.0f32; 3];
    let mut previous_speed = 0.0f32;
    let mut out = 0usize;
    let mut i = 0usize;
    while i < total {
        let node = base.add(i * GHOST_NODE_SIZE);
        let flags = ptr::read_volatile(node.add(GHOST_NODE_FLAGS));
        let fx = ptr::read_volatile(node.add(GHOST_NODE_DX) as *const f32);
        let fy = ptr::read_volatile(node.add(GHOST_NODE_DX + 4) as *const f32);
        let fz = ptr::read_volatile(node.add(GHOST_NODE_DX + 8) as *const f32);
        if flags & GHOST_FLAG_DELTA != 0 {
            vel[0] += fx;
            vel[1] += fy;
            vel[2] += fz;
            pos[0] += vel[0];
            pos[1] += vel[1];
            pos[2] += vel[2];
        } else {
            vel = [0.0, 0.0, 0.0];
            pos = [fx, fy, fz];
        }
        let dx = pos[0] - previous_pos[0];
        let dy = pos[1] - previous_pos[1];
        let dz = pos[2] - previous_pos[2];
        let speed = dx * dx + dy * dy + dz * dz;
        let class = route_class(flags, speed, previous_speed);
        let last = i + 1 == total;
        if (i % store_stride == 0 || last) && out < MAX_ROUTE_POINTS {
            ptr::write(route.add(out * ROUTE_STRIDE), pos[0]);
            ptr::write(route.add(out * ROUTE_STRIDE + 1), pos[1]);
            ptr::write(route.add(out * ROUTE_STRIDE + 2), pos[2]);
            ptr::write(route.add(out * ROUTE_STRIDE + 3), class);
            out += 1;
        }
        previous_pos = pos;
        previous_speed = speed;
        i += 1;
    }
    out
}

unsafe fn env_fn(env: *mut c_void, index: usize) -> usize {
    if env.is_null() {
        return 0;
    }
    let table = *(env as *const *const usize);
    if table.is_null() {
        return 0;
    }
    *table.add(index)
}

unsafe fn jni_array_length(env: *mut c_void, array: *mut c_void) -> c_int {
    let raw = env_fn(env, JNI_GET_ARRAY_LENGTH);
    if raw == 0 || array.is_null() {
        return 0;
    }
    let func: unsafe extern "C" fn(*mut c_void, *mut c_void) -> c_int =
        core::mem::transmute(raw);
    func(env, array)
}

unsafe fn jni_set_float_region(
    env: *mut c_void,
    array: *mut c_void,
    start: c_int,
    len: c_int,
    src: *const f32,
) {
    let raw = env_fn(env, JNI_SET_FLOAT_ARRAY_REGION);
    if raw == 0 || array.is_null() || len <= 0 {
        return;
    }
    let func: unsafe extern "C" fn(*mut c_void, *mut c_void, c_int, c_int, *const f32) =
        core::mem::transmute(raw);
    func(env, array, start, len, src);
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_readGhostRoutePointCount(
    _env: *mut c_void,
    _class: *mut c_void,
) -> i32 {
    let n = ghost_node_count();
    if n < 2 {
        return 0;
    }
    let total = n as usize;
    if total > MAX_ROUTE_POINTS {
        MAX_ROUTE_POINTS as i32
    } else {
        total as i32
    }
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_readGhostRoute(
    env: *mut c_void,
    _class: *mut c_void,
    out: *mut c_void,
) -> i32 {
    let count = reconstruct_ghost_route();
    if count == 0 {
        return 0;
    }
    let capacity = (jni_array_length(env, out) / ROUTE_STRIDE as c_int) as usize;
    let points = if count > capacity { capacity } else { count };
    if points == 0 {
        return 0;
    }
    let route = core::ptr::addr_of!(GHOST_ROUTE) as *const f32;
    jni_set_float_region(env, out, 0, (points * ROUTE_STRIDE) as c_int, route);
    points as i32
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_readGhostViewMatrices(
    env: *mut c_void,
    _class: *mut c_void,
    out: *mut c_void,
) -> i32 {
    if !ensure_route_symbols() || GHOST_SIZE.is_null() {
        return 0;
    }
    if jni_array_length(env, out) < GHOST_VIEW_MATRICES_FLOATS {
        return 0;
    }
    let slide = (GHOST_SIZE as usize).wrapping_sub(GHOST_SIZE_VADDR);
    let modelview = (slide + MV_MATRIX0_VADDR) as *const f32;
    let projection = (slide + PROJ_MATRIX0_VADDR) as *const f32;
    let mut buffer = [0.0f32; GHOST_VIEW_MATRICES_FLOATS as usize];
    let mut projection_nonzero = false;
    let mut element = 0usize;
    while element < 16 {
        buffer[element] = ptr::read_volatile(modelview.add(element));
        let proj = ptr::read_volatile(projection.add(element));
        buffer[16 + element] = proj;
        if proj != 0.0 {
            projection_nonzero = true;
        }
        element += 1;
    }
    if !GHOST_TRANSFORM.is_null() {
        buffer[32] = ptr::read_volatile(GHOST_TRANSFORM.add(GHOST_TRANSFORM_POS_FLOAT));
        buffer[33] = ptr::read_volatile(GHOST_TRANSFORM.add(GHOST_TRANSFORM_POS_FLOAT + 1));
        buffer[34] = ptr::read_volatile(GHOST_TRANSFORM.add(GHOST_TRANSFORM_POS_FLOAT + 2));
    }
    jni_set_float_region(env, out, 0, GHOST_VIEW_MATRICES_FLOATS, buffer.as_ptr());
    if projection_nonzero {
        1
    } else {
        0
    }
}
