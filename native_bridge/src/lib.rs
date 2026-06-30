#![no_std]

#[cfg(target_arch = "aarch64")]
use core::arch::asm;
use core::ffi::{c_char, c_int, c_long, c_uint, c_void};
use core::mem;
use core::panic::PanicInfo;
use core::ptr;
use core::sync::atomic::{AtomicBool, AtomicU8, Ordering};

const RTLD_DEFAULT: *mut c_void = 0usize as *mut c_void;
const RTLD_NOW: c_int = 2;
const CHECKPOINT_LIMIT: c_int = 999;
const CHECKPOINT_LIMIT_USIZE: usize = 999;
const DLC_ITEM_COUNT: usize = 0x200;
const DLC_ITEM_SIZE: usize = 0x870;
const DLC_PURCHASED_OFFSET: usize = 0x5c;
const RETAINED_PATCH_POLL_MICROSECONDS: c_uint = 100_000;

const GHOST_TRANSFORM_POS_FLOAT: usize = 12;
const REPLAY_HEADER_REPLAY_SIZE_OFFSET: usize = 0x00;
const REPLAY_HEADER_CHECKPOINT_COUNT_OFFSET: usize = 0x08;
const REPLAY_HEADER_FINISH_SECONDS_OFFSET: usize = 0x14;
const USER_TRACK_FLAG_LAPS: u8 = 0x01;
const USER_TRACK_FLAG_BOOST_REGEN: u8 = 0x02;
const USER_TRACK_FLAGS_MAGIC_V1: &[u8] = b"YCS2TRACKFLAGS:1:";
const USER_TRACK_FLAGS_MAGIC_V2: &[u8] = b"YCS2TRACKFLAGS:2:";
const USER_TRACK_FLAGS_MAX_SCAN: usize = 256;
const LEVEL_TYPE_OFFSET: usize = 0x50;
const LEVEL_LAP_COUNT_OFFSET: usize = 0x58;
const LEVEL_TYPE_LAPS: c_int = 3;
const DEFAULT_LAP_COUNT: c_int = 3;
const MIN_LAP_COUNT: u8 = 2;
const MAX_LAP_COUNT: u8 = 9;
const GAME_CURRENT_CAR_OFFSET: usize = 0xb0;
const CAR_FUEL_OFFSET: usize = 0x128;
const INGAME_LEVEL_EDITOR_SAVE_HOOK_BYTES: usize = 16;
const INGAME_LEVEL_EDITOR_LOAD_HOOK_BYTES: usize = 16;
const UIFORM_CREATE_CTOR_HOOK_BYTES: usize = 16;
const UIFORM_PAUSE_CTOR_HOOK_BYTES: usize = 16;
const WORLD_LOAD_HOOK_BYTES: usize = 16;
const GAME_LOAD_LEVEL_HOOK_BYTES: usize = 16;
const GAME_ON_CHECKPOINT_HOOK_BYTES: usize = 16;
const GAME_UPDATE_CAMERA_HOOK_BYTES: usize = 16;
const GAME_START_LEVEL_INTRO_HOOK_BYTES: usize = 16;
const GAME_RENDER_GHOST_HOOK_BYTES: usize = 16;
const GAME_VIEW_REPLAY_HOOK_BYTES: usize = 16;
const REPLAY_UPDATE_HOOK_BYTES: usize = 16;
const HOOK_STUB_BYTES: usize = 16;
const GHOST_NODE_SIZE: usize = 0x14;
const GHOST_NODE_FLAGS_OFFSET: usize = 1;
const GHOST_NODE_ORIENT_HALF_OFFSET: usize = 2;
const GHOST_NODE_VECTOR_OFFSET: usize = 8;
const GHOST_TRANSFORM_BYTES: usize = 0x40;
const SWARM_MAX_GHOSTS: usize = 7;
const SWARM_CATALOG_LIMIT: usize = 32;
const SWARM_CATALOG_PATH_BYTES: usize = 192;
const GAME_REPLAY_OBJECT_OFFSET: usize = 0xc0;
const TRAMPOLINE_BYTES: usize = 32;
const PAGE_SIZE: usize = 4096;
const GAME_LEVEL_INTRO_CAMERA_FLAG_OFFSET: usize = 0x1c5;
const FREE_CAMERA_AXIS_STRIDE_FLOATS: usize = 4;
const FREE_CAMERA_RIGHT_AXIS: usize = 0;
const FREE_CAMERA_UP_AXIS: usize = 3;
const FREE_CAMERA_FORWARD_AXIS: usize = 6;
const FREE_CAMERA_POSITION: usize = 9;
const FREE_CAMERA_FRAME_FLOATS: usize = 12;
const FREE_CAMERA_MIN_LENGTH_SQ: f32 = 0.000001;
const UI_CONTROL_BUTTON_SIZE: usize = 0x130;
const UIFORM_CREATE_CAR_PANEL_X: c_int = 0x0d7;
const UIFORM_CREATE_CAR_PANEL_Y: c_int = 0x07d;
const USER_TRACK_SWITCH_LOCAL_X: c_int = 0x2cc;
const USER_TRACK_LAPS_BUTTON_X: c_int = UIFORM_CREATE_CAR_PANEL_X + USER_TRACK_SWITCH_LOCAL_X;
const USER_TRACK_LAPS_BUTTON_Y: c_int = UIFORM_CREATE_CAR_PANEL_Y + 0x2a;
const USER_TRACK_BOOST_BUTTON_X: c_int = UIFORM_CREATE_CAR_PANEL_X + USER_TRACK_SWITCH_LOCAL_X;
const USER_TRACK_BOOST_BUTTON_Y: c_int = UIFORM_CREATE_CAR_PANEL_Y + 0x7f;
const USER_TRACK_SWITCH_BUTTON_WIDTH: c_int = 0x1b8;
const USER_TRACK_SWITCH_BUTTON_HEIGHT: c_int = 0x48;
const UI_LABEL_FLAG_DEFAULT: c_int = 0x101;

type ThreadStart = unsafe extern "C" fn(*mut c_void) -> *mut c_void;
type InGameLevelEditorSaveFn = unsafe extern "C" fn(*mut c_void, *mut c_char) -> c_int;
type InGameLevelEditorLoadFn = unsafe extern "C" fn(*mut c_void, *const c_char);
type UiFormCreateCtorFn = unsafe extern "C" fn(*mut c_void);
type UiFormPauseCtorFn = unsafe extern "C" fn(*mut c_void);
type WorldLoadFn = unsafe extern "C" fn(*mut c_void, *const c_char, u8, c_uint) -> c_int;
type GameLoadLevelFn = unsafe extern "C" fn(*mut c_void, c_uint, c_int) -> c_int;
type GameOnCheckpointFn = unsafe extern "C" fn(*mut c_void, *const c_void, c_int);
type GameUpdateCameraFn = unsafe extern "C" fn(*mut c_void, f32);
type GameStartLevelIntroFn = unsafe extern "C" fn(*mut c_void, c_int);
type GameRenderGhostFn = unsafe extern "C" fn(*mut c_void);
type GameViewReplayFn = unsafe extern "C" fn(*mut c_void, *mut u8, *const c_char) -> u8;
type ReplayUpdateFn = unsafe extern "C" fn(*mut c_void, *mut c_void, c_int, c_int);
type CarRenderGhostFn = unsafe extern "C" fn(*mut c_void, *const f32);
type ReplayLoadPathFn = unsafe extern "C" fn(*mut c_void, *const c_char) -> c_int;
type ReplayDecompressGhostFn = unsafe extern "C" fn(*mut c_void);
type CarTemplateSetOrientationFn = unsafe extern "C" fn(*mut f32, *const f32, *const f32);
type LevelsGetUserLevelFn = unsafe extern "C" fn(c_uint) -> *mut u8;
type LevelsGetUserLevelFileNameFn = unsafe extern "C" fn(c_uint) -> *const c_char;
type OperatorNewFn = unsafe extern "C" fn(usize) -> *mut c_void;
type WStringCtorCharFn = unsafe extern "C" fn(*mut WString, *const c_char);
type WStringDtorFn = unsafe extern "C" fn(*mut WString);
type UiControlButtonCtorLabelFn = unsafe extern "C" fn(
    *mut c_void,
    *const UiRectangle,
    *const UiControlLabelConstructionProperties,
    unsafe extern "C" fn(*mut c_void),
);
type UiControlButtonSetLabelFn =
    unsafe extern "C" fn(*mut c_void, *const UiControlLabelConstructionProperties);
type UiControlAddControlFn = unsafe extern "C" fn(*mut c_void, *mut c_void);
type UiControlSetRenderBackgroundFn = unsafe extern "C" fn(*mut c_void, *const c_void);

#[repr(C)]
struct UiPoint {
    x: c_int,
    y: c_int,
}

#[repr(C)]
struct UiRectangle {
    x: c_int,
    y: c_int,
    width: c_int,
    height: c_int,
}

#[repr(C)]
struct WString {
    words: [usize; 2],
}

#[repr(C)]
struct UiControlLabelConstructionProperties {
    position: UiPoint,
    text: WString,
    scale_x: f32,
    scale_y: f32,
    font: *mut c_void,
    colour: [f32; 4],
    flags: c_int,
    padding: c_int,
}

extern "C" {
    fn signal(signum: c_int, handler: usize) -> usize;
    fn raise(signum: c_int) -> c_int;
    fn open(pathname: *const c_char, flags: c_int, mode: c_int) -> c_int;
    fn read(fd: c_int, buf: *mut c_void, count: usize) -> isize;
    fn write(fd: c_int, buf: *const c_void, count: usize) -> isize;
    fn lseek(fd: c_int, offset: c_long, whence: c_int) -> c_long;
    fn close(fd: c_int) -> c_int;
    fn dlopen(filename: *const c_char, flags: c_int) -> *mut c_void;
    fn dlsym(handle: *mut c_void, symbol: *const c_char) -> *mut c_void;
    fn mmap(
        address: *mut c_void,
        length: usize,
        protection: c_int,
        flags: c_int,
        fd: c_int,
        offset: c_long,
    ) -> *mut c_void;
    fn mprotect(address: *mut c_void, length: usize, protection: c_int) -> c_int;
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
static mut CAMERA_POINTER: *mut *mut f32 = ptr::null_mut();
static mut LEVELS_GET_USER_LEVEL: *mut c_void = ptr::null_mut();
static mut LEVELS_GET_USER_LEVEL_FILE_NAME: *mut c_void = ptr::null_mut();
static mut OPERATOR_NEW: *mut c_void = ptr::null_mut();
static mut WSTRING_CTOR_CHAR: *mut c_void = ptr::null_mut();
static mut WSTRING_DTOR: *mut c_void = ptr::null_mut();
static mut UI_CONTROL_BUTTON_CTOR_LABEL: *mut c_void = ptr::null_mut();
static mut UI_CONTROL_BUTTON_SET_LABEL: *mut c_void = ptr::null_mut();
static mut UI_CONTROL_ADD_CONTROL: *mut c_void = ptr::null_mut();
static mut UI_CONTROL_SET_RENDER_BACKGROUND: *mut c_void = ptr::null_mut();
static mut UIFORM_CREATE_RENDER_BUTTON_BACKGROUND_STUB: *mut c_void = ptr::null_mut();
static mut UIFORM_CREATE_CTOR_TRAMPOLINE: *mut c_void = ptr::null_mut();
static mut UIFORM_PAUSE_CTOR_TRAMPOLINE: *mut c_void = ptr::null_mut();
static mut INGAME_LEVEL_EDITOR_SAVE_TRAMPOLINE: *mut c_void = ptr::null_mut();
static mut INGAME_LEVEL_EDITOR_LOAD_TRAMPOLINE: *mut c_void = ptr::null_mut();
static mut G_P_INGAME_LEVEL_EDITOR: *mut *mut c_void = ptr::null_mut();
static mut WORLD_LOAD_TRAMPOLINE: *mut c_void = ptr::null_mut();
static mut GAME_LOAD_LEVEL_TRAMPOLINE: *mut c_void = ptr::null_mut();
static mut GAME_ON_CHECKPOINT_TRAMPOLINE: *mut c_void = ptr::null_mut();
static mut GAME_UPDATE_CAMERA_TRAMPOLINE: *mut c_void = ptr::null_mut();
static mut GAME_START_LEVEL_INTRO_TRAMPOLINE: *mut c_void = ptr::null_mut();
static mut GAME_RENDER_GHOST_TRAMPOLINE: *mut c_void = ptr::null_mut();
static mut GAME_VIEW_REPLAY_TRAMPOLINE: *mut c_void = ptr::null_mut();
static mut REPLAY_UPDATE_TRAMPOLINE: *mut c_void = ptr::null_mut();
static mut REPLAY_POS: *mut c_int = ptr::null_mut();
static mut GHOST_POINTER: *mut *mut u8 = ptr::null_mut();
static mut GHOST_TRANSFORM: *mut f32 = ptr::null_mut();
static mut REPLAY_LOAD_PATH: *mut c_void = ptr::null_mut();
static mut REPLAY_DECOMPRESS_GHOST: *mut c_void = ptr::null_mut();
static mut CAR_RENDER_GHOST: *mut c_void = ptr::null_mut();
static mut CAR_TEMPLATE_SET_ORIENTATION: *mut c_void = ptr::null_mut();
static mut ORIENTATION_SCALE: f32 = 1.0;
static mut CURRENT_GAME: *mut c_void = ptr::null_mut();
static mut SWARM_CATALOG_LEN: usize = 0;
static mut SWARM_CATALOG_PATHS: [[u8; SWARM_CATALOG_PATH_BYTES]; SWARM_CATALOG_LIMIT] =
    [[0; SWARM_CATALOG_PATH_BYTES]; SWARM_CATALOG_LIMIT];
static mut SWARM_CATALOG_PATH_LEN: [usize; SWARM_CATALOG_LIMIT] = [0; SWARM_CATALOG_LIMIT];
static mut SWARM_GHOST_NODE_COUNT: [i32; SWARM_MAX_GHOSTS] = [0; SWARM_MAX_GHOSTS];
static mut SWARM_GHOST_NODES: [*mut u8; SWARM_MAX_GHOSTS] = [ptr::null_mut(); SWARM_MAX_GHOSTS];
static mut SWARM_GHOST_COUNT: usize = 0;
static mut SWARM_PRIMARY_CATALOG_INDEX: i32 = -1;
static REPLAY_SWARM_HOOKS_INSTALLED: AtomicBool = AtomicBool::new(false);
static REPLAY_SWARM_ENABLED: AtomicBool = AtomicBool::new(false);
static REPLAY_SWARM_ACTIVE: AtomicBool = AtomicBool::new(false);
static mut USER_TRACK_LAPS_BUTTON: *mut c_void = ptr::null_mut();
static mut USER_TRACK_BOOST_REGEN_BUTTON: *mut c_void = ptr::null_mut();
static mut FREE_CAMERA_FRAME: [f32; FREE_CAMERA_FRAME_FLOATS] = [0.0; FREE_CAMERA_FRAME_FLOATS];
static mut LAST_SPLIT_CHECKPOINT: c_int = 0;
static mut LAST_SPLIT_CURRENT_MS: i32 = -1;
static mut FALLBACK_GHOST_CHECKPOINT_COUNT: c_int = 0;
static mut FALLBACK_GHOST_FINISH_MS: i32 = -1;
static mut FALLBACK_GHOST_CHECKPOINT_MS: [i32; CHECKPOINT_LIMIT_USIZE] =
    [-1; CHECKPOINT_LIMIT_USIZE];
static RETAINED_PATCH_WORKER_STARTED: AtomicBool = AtomicBool::new(false);
static NATIVE_SIGNAL_HANDLER_STARTED: AtomicBool = AtomicBool::new(false);
static USER_TRACK_HOOKS_INSTALLED: AtomicBool = AtomicBool::new(false);
static USER_TRACK_CREATE_FLAGS_ARMED: AtomicBool = AtomicBool::new(false);
static USER_TRACK_FLAGS_TOUCHED: AtomicBool = AtomicBool::new(false);
static USER_TRACK_PENDING_FLAGS: AtomicU8 = AtomicU8::new(0);
static USER_TRACK_PENDING_LAP_COUNT: AtomicU8 = AtomicU8::new(0);
static CURRENT_USER_TRACK_FLAGS: AtomicU8 = AtomicU8::new(0);
static CURRENT_USER_TRACK_LAP_COUNT: AtomicU8 = AtomicU8::new(0);
static FREE_CAMERA_HOOKS_INSTALLED: AtomicBool = AtomicBool::new(false);
static FREE_CAMERA_ENABLED: AtomicBool = AtomicBool::new(false);
static FREE_CAMERA_ACTIVE: AtomicBool = AtomicBool::new(false);
static FREE_CAMERA_IN_LEVEL_INTRO: AtomicBool = AtomicBool::new(false);
static FREE_CAMERA_LEVEL_INTRO_STARTED: AtomicBool = AtomicBool::new(false);
static FREE_CAMERA_CAPTURE_REQUESTED: AtomicBool = AtomicBool::new(false);

const SIGABRT: c_int = 6;
const SIGBUS: c_int = 7;
const SIGFPE: c_int = 8;
const SIGILL: c_int = 4;
const SIGSEGV: c_int = 11;
const O_WRONLY: c_int = 1;
const O_RDONLY: c_int = 0;
const O_CREAT: c_int = 0o100;
const O_APPEND: c_int = 0o2000;
const SEEK_SET: c_int = 0;
const SEEK_END: c_int = 2;
const PROT_READ: c_int = 1;
const PROT_WRITE: c_int = 2;
const PROT_EXEC: c_int = 4;
const MAP_PRIVATE: c_int = 2;
const MAP_ANONYMOUS: c_int = 0x20;
const MAP_FAILED: *mut c_void = usize::MAX as *mut c_void;
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

unsafe fn page_start(address: *mut u8) -> *mut c_void {
    ((address as usize) & !(PAGE_SIZE - 1)) as *mut c_void
}

#[cfg(target_arch = "aarch64")]
unsafe fn clear_instruction_cache(address: *mut u8, length: usize) {
    if address.is_null() || length == 0 {
        return;
    }

    let mut ctr_el0: usize;
    asm!("mrs {0}, ctr_el0", out(reg) ctr_el0, options(nomem, nostack, preserves_flags));
    let cache_line_size = 1usize << (((ctr_el0 >> 16) & 0x0f) + 2);
    let start = (address as usize) & !(cache_line_size - 1);
    let end = (address as usize).saturating_add(length);

    let mut current = start;
    while current < end {
        asm!("dc cvau, {0}", in(reg) current, options(nostack, preserves_flags));
        current = current.saturating_add(cache_line_size);
    }
    asm!("dsb ish", options(nostack, preserves_flags));

    current = start;
    while current < end {
        asm!("ic ivau, {0}", in(reg) current, options(nostack, preserves_flags));
        current = current.saturating_add(cache_line_size);
    }
    asm!("dsb ish", options(nostack, preserves_flags));
    asm!("isb", options(nostack, preserves_flags));
}

#[cfg(not(target_arch = "aarch64"))]
unsafe fn clear_instruction_cache(_address: *mut u8, _length: usize) {
    core::sync::atomic::compiler_fence(Ordering::SeqCst);
}

unsafe fn write_u32(address: *mut u8, value: u32) {
    ptr::write_unaligned(address as *mut u32, value);
}

unsafe fn write_u64(address: *mut u8, value: u64) {
    ptr::write_unaligned(address as *mut u64, value);
}

unsafe fn write_absolute_branch_stub(address: *mut u8, destination: *const c_void) {
    // ldr x16, #8; br x16; .quad destination
    write_u32(address, 0x5800_0050);
    write_u32(address.add(4), 0xd61f_0200);
    write_u64(address.add(8), destination as u64);
}

unsafe fn install_inline_hook(
    target: *mut c_void,
    hook: *const c_void,
    patch_len: usize,
) -> *mut c_void {
    if target.is_null() || hook.is_null() || patch_len < HOOK_STUB_BYTES {
        return ptr::null_mut();
    }

    let trampoline = mmap(
        ptr::null_mut(),
        TRAMPOLINE_BYTES,
        PROT_READ | PROT_WRITE | PROT_EXEC,
        MAP_PRIVATE | MAP_ANONYMOUS,
        -1,
        0,
    ) as *mut u8;
    if trampoline as *mut c_void == MAP_FAILED || trampoline.is_null() {
        return ptr::null_mut();
    }

    let target_u8 = target as *mut u8;
    ptr::copy_nonoverlapping(target_u8, trampoline, patch_len);
    write_absolute_branch_stub(
        trampoline.add(patch_len),
        target_u8.add(patch_len) as *const c_void,
    );
    clear_instruction_cache(trampoline, patch_len + HOOK_STUB_BYTES);

    let page = page_start(target_u8);
    if mprotect(page, PAGE_SIZE, PROT_READ | PROT_WRITE | PROT_EXEC) != 0 {
        return ptr::null_mut();
    }
    write_absolute_branch_stub(target_u8, hook);
    let mut fill = HOOK_STUB_BYTES;
    while fill < patch_len {
        write_u32(target_u8.add(fill), 0xd503_201f);
        fill += 4;
    }
    clear_instruction_cache(target_u8, patch_len);
    let _ = mprotect(page, PAGE_SIZE, PROT_READ | PROT_EXEC);
    trampoline as *mut c_void
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
        write_signal_log(
            fd,
            b" in modded.ycs2; check Android tombstone/logcat for stack\n",
        );
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

unsafe fn ensure_user_track_symbols() {
    if LEVELS_GET_USER_LEVEL.is_null() {
        LEVELS_GET_USER_LEVEL = resolve(b"_Z19Levels_GetUserLevelj\0");
    }
    if LEVELS_GET_USER_LEVEL_FILE_NAME.is_null() {
        LEVELS_GET_USER_LEVEL_FILE_NAME = resolve(b"_Z27Levels_GetUserLevelFileNamej\0");
    }
    if OPERATOR_NEW.is_null() {
        OPERATOR_NEW = resolve(b"_Znwm\0");
    }
    if WSTRING_CTOR_CHAR.is_null() {
        WSTRING_CTOR_CHAR = resolve(b"_ZN7WStringC1EPKc\0");
    }
    if WSTRING_DTOR.is_null() {
        WSTRING_DTOR = resolve(b"_ZN7WStringD1Ev\0");
    }
    if UI_CONTROL_BUTTON_CTOR_LABEL.is_null() {
        UI_CONTROL_BUTTON_CTOR_LABEL =
            resolve(b"_ZN15UiControlButtonC1ERK11UiRectangleRKN14UiControlLabel22ConstructionPropertiesEPFvPS_E\0");
    }
    if UI_CONTROL_BUTTON_SET_LABEL.is_null() {
        UI_CONTROL_BUTTON_SET_LABEL = resolve(
            b"_ZN15UiControlButton8SetLabelERKN14UiControlLabel22ConstructionPropertiesE\0",
        );
    }
    if UI_CONTROL_ADD_CONTROL.is_null() {
        UI_CONTROL_ADD_CONTROL = resolve(b"_ZN9UiControl10AddControlERS_\0");
    }
    if UI_CONTROL_SET_RENDER_BACKGROUND.is_null() {
        UI_CONTROL_SET_RENDER_BACKGROUND =
            resolve(b"_ZN9UiControl27SetRenderBackgroundFunctionEPFvPS_RK11UiRectangleE\0");
    }
    if UIFORM_CREATE_RENDER_BUTTON_BACKGROUND_STUB.is_null() {
        UIFORM_CREATE_RENDER_BUTTON_BACKGROUND_STUB = resolve(
            b"_ZN12UiFormCreate28OnRenderButtonBackgroundStubEP9UiControlRK11UiRectangle\0",
        );
    }
}

unsafe fn create_form_ui_symbols_ready() -> bool {
    ensure_user_track_symbols();
    !(OPERATOR_NEW.is_null()
        || WSTRING_CTOR_CHAR.is_null()
        || WSTRING_DTOR.is_null()
        || UI_CONTROL_BUTTON_CTOR_LABEL.is_null()
        || UI_CONTROL_BUTTON_SET_LABEL.is_null()
        || UI_CONTROL_ADD_CONTROL.is_null()
        || UI_CONTROL_SET_RENDER_BACKGROUND.is_null()
        || UIFORM_CREATE_RENDER_BUTTON_BACKGROUND_STUB.is_null())
}

unsafe fn label_props(text: *const c_char) -> UiControlLabelConstructionProperties {
    let mut props = UiControlLabelConstructionProperties {
        position: UiPoint { x: 0x14, y: 0x26 },
        text: WString { words: [0; 2] },
        scale_x: 0.58,
        scale_y: 0.58,
        font: ptr::null_mut(),
        colour: [1.0, 1.0, 1.0, 1.0],
        flags: UI_LABEL_FLAG_DEFAULT,
        padding: 0,
    };
    let ctor: WStringCtorCharFn = mem::transmute(WSTRING_CTOR_CHAR);
    ctor(&mut props.text, text);
    props
}

unsafe fn destroy_label_props(props: &mut UiControlLabelConstructionProperties) {
    let dtor: WStringDtorFn = mem::transmute(WSTRING_DTOR);
    dtor(&mut props.text);
}

unsafe fn label_for_switch(flag: u8, on: *const c_char, off: *const c_char) -> *const c_char {
    if (USER_TRACK_PENDING_FLAGS.load(Ordering::Acquire) & flag) != 0 {
        on
    } else {
        off
    }
}

unsafe fn set_switch_button_label(button: *mut c_void, text: *const c_char) {
    if button.is_null() || UI_CONTROL_BUTTON_SET_LABEL.is_null() || WSTRING_CTOR_CHAR.is_null() {
        return;
    }
    let mut props = label_props(text);
    let set_label: UiControlButtonSetLabelFn = mem::transmute(UI_CONTROL_BUTTON_SET_LABEL);
    set_label(button, &props);
    destroy_label_props(&mut props);
}

unsafe fn refresh_user_track_create_switch_labels() {
    static mut LAPS_LABEL: [u8; 16] = [0; 16];
    let laps_text =
        if (USER_TRACK_PENDING_FLAGS.load(Ordering::Acquire) & USER_TRACK_FLAG_LAPS) == 0 {
            b"LAPS: OFF\0".as_ptr()
        } else {
            let count = USER_TRACK_PENDING_LAP_COUNT.load(Ordering::Acquire);
            LAPS_LABEL[0] = b'L';
            LAPS_LABEL[1] = b'A';
            LAPS_LABEL[2] = b'P';
            LAPS_LABEL[3] = b'S';
            LAPS_LABEL[4] = b':';
            LAPS_LABEL[5] = b' ';
            LAPS_LABEL[6] = b'0' + count;
            LAPS_LABEL[7] = 0;
            ptr::addr_of!(LAPS_LABEL).cast::<c_char>()
        };
    set_switch_button_label(USER_TRACK_LAPS_BUTTON, laps_text as *const c_char);
    set_switch_button_label(
        USER_TRACK_BOOST_REGEN_BUTTON,
        label_for_switch(
            USER_TRACK_FLAG_BOOST_REGEN,
            b"BOOST REGEN: ON\0".as_ptr() as *const c_char,
            b"BOOST REGEN: OFF\0".as_ptr() as *const c_char,
        ),
    );
}

unsafe fn cycle_user_track_lap_count() {
    let flags = USER_TRACK_PENDING_FLAGS.load(Ordering::Acquire);
    if (flags & USER_TRACK_FLAG_LAPS) == 0 {
        USER_TRACK_PENDING_FLAGS.store(flags | USER_TRACK_FLAG_LAPS, Ordering::Release);
        USER_TRACK_PENDING_LAP_COUNT.store(MIN_LAP_COUNT, Ordering::Release);
    } else {
        let count = USER_TRACK_PENDING_LAP_COUNT.load(Ordering::Acquire);
        if count < MAX_LAP_COUNT {
            USER_TRACK_PENDING_LAP_COUNT.store(count + 1, Ordering::Release);
        } else {
            USER_TRACK_PENDING_FLAGS.store(flags & !USER_TRACK_FLAG_LAPS, Ordering::Release);
            USER_TRACK_PENDING_LAP_COUNT.store(0, Ordering::Release);
        }
    }
    USER_TRACK_CREATE_FLAGS_ARMED.store(true, Ordering::Release);
    USER_TRACK_FLAGS_TOUCHED.store(true, Ordering::Release);
    refresh_user_track_create_switch_labels();
}

unsafe fn toggle_user_track_create_flag(flag: u8) {
    let current = USER_TRACK_PENDING_FLAGS.load(Ordering::Acquire);
    USER_TRACK_PENDING_FLAGS.store(current ^ flag, Ordering::Release);
    USER_TRACK_CREATE_FLAGS_ARMED.store(true, Ordering::Release);
    USER_TRACK_FLAGS_TOUCHED.store(true, Ordering::Release);
    refresh_user_track_create_switch_labels();
}

unsafe extern "C" fn on_laps_create_switch_clicked(_button: *mut c_void) {
    cycle_user_track_lap_count();
}

unsafe extern "C" fn on_boost_regen_create_switch_clicked(_button: *mut c_void) {
    toggle_user_track_create_flag(USER_TRACK_FLAG_BOOST_REGEN);
}

unsafe fn add_create_switch_button(
    panel: *mut c_void,
    x: c_int,
    y: c_int,
    text: *const c_char,
    callback: unsafe extern "C" fn(*mut c_void),
) -> *mut c_void {
    if panel.is_null() || !create_form_ui_symbols_ready() {
        return ptr::null_mut();
    }

    let new_object: OperatorNewFn = mem::transmute(OPERATOR_NEW);
    let button = new_object(UI_CONTROL_BUTTON_SIZE);
    if button.is_null() {
        return ptr::null_mut();
    }

    let rect = UiRectangle {
        x,
        y,
        width: USER_TRACK_SWITCH_BUTTON_WIDTH,
        height: USER_TRACK_SWITCH_BUTTON_HEIGHT,
    };
    let mut props = label_props(text);
    let ctor: UiControlButtonCtorLabelFn = mem::transmute(UI_CONTROL_BUTTON_CTOR_LABEL);
    ctor(button, &rect, &props, callback);
    destroy_label_props(&mut props);

    let set_background: UiControlSetRenderBackgroundFn =
        mem::transmute(UI_CONTROL_SET_RENDER_BACKGROUND);
    set_background(button, UIFORM_CREATE_RENDER_BUTTON_BACKGROUND_STUB);

    let add_control: UiControlAddControlFn = mem::transmute(UI_CONTROL_ADD_CONTROL);
    add_control(panel, button);
    button
}

unsafe fn add_user_track_switches(form: *mut c_void, reset_flags: bool) {
    if form.is_null() {
        return;
    }
    if reset_flags {
        begin_user_track_create_flags();
    } else {
        USER_TRACK_CREATE_FLAGS_ARMED.store(true, Ordering::Release);
        USER_TRACK_FLAGS_TOUCHED.store(false, Ordering::Release);
    }
    // These must be root children. A later stock sibling covers the car panel in hit-testing.
    USER_TRACK_LAPS_BUTTON = add_create_switch_button(
        form,
        USER_TRACK_LAPS_BUTTON_X,
        USER_TRACK_LAPS_BUTTON_Y,
        b"LAPS: OFF\0".as_ptr() as *const c_char,
        on_laps_create_switch_clicked,
    );
    USER_TRACK_BOOST_REGEN_BUTTON = add_create_switch_button(
        form,
        USER_TRACK_BOOST_BUTTON_X,
        USER_TRACK_BOOST_BUTTON_Y,
        b"BOOST REGEN: OFF\0".as_ptr() as *const c_char,
        on_boost_regen_create_switch_clicked,
    );
    if !reset_flags {
        refresh_user_track_create_switch_labels();
    }
}

unsafe fn add_user_track_create_switches(form: *mut c_void) {
    add_user_track_switches(form, true);
}

unsafe fn ingame_level_editor_active() -> bool {
    if G_P_INGAME_LEVEL_EDITOR.is_null() {
        G_P_INGAME_LEVEL_EDITOR = resolve(b"g_pInGameLevelEditor\0") as *mut *mut c_void;
    }
    !G_P_INGAME_LEVEL_EDITOR.is_null() && !ptr::read_volatile(G_P_INGAME_LEVEL_EDITOR).is_null()
}

unsafe fn begin_user_track_create_flags() {
    USER_TRACK_PENDING_FLAGS.store(0, Ordering::Release);
    USER_TRACK_PENDING_LAP_COUNT.store(0, Ordering::Release);
    USER_TRACK_CREATE_FLAGS_ARMED.store(true, Ordering::Release);
    USER_TRACK_FLAGS_TOUCHED.store(false, Ordering::Release);
}

unsafe fn cancel_user_track_create_flags() {
    USER_TRACK_PENDING_FLAGS.store(0, Ordering::Release);
    USER_TRACK_PENDING_LAP_COUNT.store(0, Ordering::Release);
    USER_TRACK_CREATE_FLAGS_ARMED.store(false, Ordering::Release);
    USER_TRACK_FLAGS_TOUCHED.store(false, Ordering::Release);
}

unsafe fn store_user_track_settings(flags: u8, lap_count: u8) {
    CURRENT_USER_TRACK_FLAGS.store(flags, Ordering::Release);
    CURRENT_USER_TRACK_LAP_COUNT.store(lap_count, Ordering::Release);
}

fn normalized_lap_count(lap_count: u8) -> u8 {
    if lap_count >= MIN_LAP_COUNT && lap_count <= MAX_LAP_COUNT {
        lap_count
    } else {
        DEFAULT_LAP_COUNT as u8
    }
}

fn effective_lap_count(lap_count: u8) -> c_int {
    normalized_lap_count(lap_count) as c_int
}

fn marker_flags_byte(flags: u8) -> u8 {
    b'0' + (flags & (USER_TRACK_FLAG_LAPS | USER_TRACK_FLAG_BOOST_REGEN))
}

fn marker_lap_count_byte(flags: u8, lap_count: u8) -> u8 {
    if (flags & USER_TRACK_FLAG_LAPS) == 0 {
        b'0'
    } else {
        b'0' + normalized_lap_count(lap_count)
    }
}

fn parse_marker_flags(value: u8) -> u8 {
    if value >= b'0' && value <= b'3' {
        value - b'0'
    } else {
        0
    }
}

fn parse_marker_lap_count(value: u8) -> u8 {
    if value >= b'2' && value <= b'9' {
        value - b'0'
    } else {
        0
    }
}

fn parse_user_track_marker(buffer: &[u8], len: usize) -> (u8, u8) {
    if len <= USER_TRACK_FLAGS_MAGIC_V1.len() {
        return (0, 0);
    }
    let mut index = len - USER_TRACK_FLAGS_MAGIC_V1.len();
    loop {
        if buffer[index..].starts_with(USER_TRACK_FLAGS_MAGIC_V2) {
            let value_index = index + USER_TRACK_FLAGS_MAGIC_V2.len();
            if value_index + 1 < len {
                let flags = parse_marker_flags(buffer[value_index]);
                let lap_count = parse_marker_lap_count(buffer[value_index + 1]);
                return (flags, lap_count);
            }
        } else if buffer[index..].starts_with(USER_TRACK_FLAGS_MAGIC_V1) {
            let value_index = index + USER_TRACK_FLAGS_MAGIC_V1.len();
            if value_index < len {
                let flags = parse_marker_flags(buffer[value_index]);
                return (flags, 0);
            }
        }
        if index == 0 {
            break;
        }
        index -= 1;
    }
    (0, 0)
}

unsafe fn append_user_track_flags_marker(path: *const c_char, flags: u8, lap_count: u8) -> bool {
    if path.is_null() {
        return false;
    }
    let fd = open(path, O_WRONLY | O_APPEND, 0o600);
    if fd < 0 {
        return false;
    }
    let prefix = b"\n";
    let suffix = b"\n";
    let value = [
        marker_flags_byte(flags),
        marker_lap_count_byte(flags, lap_count),
    ];
    let mut ok = write(fd, prefix.as_ptr() as *const c_void, prefix.len()) == prefix.len() as isize;
    ok = write(
        fd,
        USER_TRACK_FLAGS_MAGIC_V2.as_ptr() as *const c_void,
        USER_TRACK_FLAGS_MAGIC_V2.len(),
    ) == USER_TRACK_FLAGS_MAGIC_V2.len() as isize
        && ok;
    ok = write(fd, value.as_ptr() as *const c_void, value.len()) == value.len() as isize && ok;
    ok = write(fd, suffix.as_ptr() as *const c_void, suffix.len()) == suffix.len() as isize && ok;
    let _ = close(fd);
    ok
}

unsafe fn read_user_track_flags_marker(path: *const c_char) -> (u8, u8) {
    if path.is_null() {
        return (0, 0);
    }
    let fd = open(path, O_RDONLY, 0);
    if fd < 0 {
        return (0, 0);
    }
    let end = lseek(fd, 0, SEEK_END);
    if end <= 0 {
        let _ = close(fd);
        return (0, 0);
    }
    let read_len = if end as usize > USER_TRACK_FLAGS_MAX_SCAN {
        USER_TRACK_FLAGS_MAX_SCAN
    } else {
        end as usize
    };
    let start = end - read_len as c_long;
    if lseek(fd, start, SEEK_SET) < 0 {
        let _ = close(fd);
        return (0, 0);
    }
    let mut buffer = [0u8; USER_TRACK_FLAGS_MAX_SCAN];
    let count = read(fd, buffer.as_mut_ptr() as *mut c_void, read_len);
    let _ = close(fd);
    if count <= 0 {
        return (0, 0);
    }
    parse_user_track_marker(&buffer, count as usize)
}

unsafe fn level_for_id(level_id: c_uint) -> *mut u8 {
    ensure_user_track_symbols();
    if LEVELS_GET_USER_LEVEL.is_null() {
        return ptr::null_mut();
    }
    let get_level: LevelsGetUserLevelFn = mem::transmute(LEVELS_GET_USER_LEVEL);
    get_level(level_id)
}

unsafe fn file_name_for_level_id(level_id: c_uint) -> *const c_char {
    ensure_user_track_symbols();
    if LEVELS_GET_USER_LEVEL_FILE_NAME.is_null() {
        return ptr::null();
    }
    let get_name: LevelsGetUserLevelFileNameFn = mem::transmute(LEVELS_GET_USER_LEVEL_FILE_NAME);
    get_name(level_id)
}

unsafe fn settings_for_level_id(level_id: c_uint) -> (u8, u8) {
    if (level_id & 0x8000_0000) == 0 {
        return (0, 0);
    }
    read_user_track_flags_marker(file_name_for_level_id(level_id))
}

unsafe fn apply_user_track_level_settings(level_id: c_uint, flags: u8, lap_count: u8) {
    if (flags & USER_TRACK_FLAG_LAPS) == 0 {
        return;
    }
    let level = level_for_id(level_id);
    if level.is_null() {
        return;
    }
    ptr::write_volatile(level.add(LEVEL_TYPE_OFFSET) as *mut c_int, LEVEL_TYPE_LAPS);
    let lap_total = effective_lap_count(lap_count);
    ptr::write_volatile(level.add(LEVEL_LAP_COUNT_OFFSET) as *mut c_int, lap_total);
}

unsafe fn refill_current_car_boost(game: *mut c_void) {
    if game.is_null()
        || (CURRENT_USER_TRACK_FLAGS.load(Ordering::Acquire) & USER_TRACK_FLAG_BOOST_REGEN) == 0
    {
        return;
    }
    let car = ptr::read_volatile((game as *mut u8).add(GAME_CURRENT_CAR_OFFSET) as *mut *mut u8);
    if car.is_null() {
        return;
    }
    ptr::write_volatile(car.add(CAR_FUEL_OFFSET) as *mut f32, 1.0f32);
}

unsafe fn ensure_free_camera_symbols() -> bool {
    if CAMERA_POINTER.is_null() {
        CAMERA_POINTER = resolve(b"g_pCamera\0") as *mut *mut f32;
    }
    if LAST_GHOST_TRANSFORM.is_null() {
        LAST_GHOST_TRANSFORM = resolve(b"g_ghostTransformLast\0") as *mut f32;
    }
    !CAMERA_POINTER.is_null()
}

unsafe fn current_camera() -> *mut f32 {
    if !ensure_free_camera_symbols() {
        return ptr::null_mut();
    }
    ptr::read_volatile(CAMERA_POINTER)
}

unsafe fn game_is_level_intro(game: *mut c_void) -> bool {
    !game.is_null()
        && ptr::read_volatile((game as *mut u8).add(GAME_LEVEL_INTRO_CAMERA_FLAG_OFFSET)) != 0
}

unsafe fn game_show_replay_active() -> bool {
    ensure_split_symbols() && !SHOW_REPLAY.is_null() && ptr::read_volatile(SHOW_REPLAY) != 0
}

unsafe fn capture_free_camera_frame(camera: *mut f32) {
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
    FREE_CAMERA_ACTIVE.store(true, Ordering::Release);
}

unsafe fn write_free_camera_frame(camera: *mut f32) {
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

fn fast_inverse_sqrt(value: f32) -> f32 {
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

fn finite_camera_value(value: f32) -> bool {
    value == value && value > -1_000_000.0 && value < 1_000_000.0
}

fn clamp_camera_delta(value: f32, max_abs: f32) -> f32 {
    if value > max_abs {
        max_abs
    } else if value < -max_abs {
        -max_abs
    } else {
        value
    }
}

fn normalize_values(x: f32, y: f32, z: f32) -> (f32, f32, f32, bool) {
    let length_sq = x * x + y * y + z * z;
    if length_sq <= FREE_CAMERA_MIN_LENGTH_SQ {
        return (x, y, z, false);
    }
    let scale = fast_inverse_sqrt(length_sq);
    (x * scale, y * scale, z * scale, true)
}

fn cross_values(ax: f32, ay: f32, az: f32, bx: f32, by: f32, bz: f32) -> (f32, f32, f32) {
    (ay * bz - az * by, az * bx - ax * bz, ax * by - ay * bx)
}

unsafe fn axis_dot_values(axis: usize, x: f32, y: f32, z: f32) -> f32 {
    FREE_CAMERA_FRAME[axis] * x + FREE_CAMERA_FRAME[axis + 1] * y + FREE_CAMERA_FRAME[axis + 2] * z
}

unsafe fn write_free_camera_axis(axis: usize, x: f32, y: f32, z: f32) {
    FREE_CAMERA_FRAME[axis] = x;
    FREE_CAMERA_FRAME[axis + 1] = y;
    FREE_CAMERA_FRAME[axis + 2] = z;
}

unsafe fn normalize_free_camera_axis(axis: usize) {
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

unsafe fn stabilize_free_camera_frame() {
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

unsafe fn nudge_free_camera_position(axis: usize, amount: f32) {
    FREE_CAMERA_FRAME[FREE_CAMERA_POSITION] += FREE_CAMERA_FRAME[axis] * amount;
    FREE_CAMERA_FRAME[FREE_CAMERA_POSITION + 1] += FREE_CAMERA_FRAME[axis + 1] * amount;
    FREE_CAMERA_FRAME[FREE_CAMERA_POSITION + 2] += FREE_CAMERA_FRAME[axis + 2] * amount;
}

unsafe fn yaw_free_camera(amount: f32) {
    for index in 0..3 {
        let right = FREE_CAMERA_FRAME[FREE_CAMERA_RIGHT_AXIS + index];
        let forward = FREE_CAMERA_FRAME[FREE_CAMERA_FORWARD_AXIS + index];
        FREE_CAMERA_FRAME[FREE_CAMERA_RIGHT_AXIS + index] = right + forward * amount;
        FREE_CAMERA_FRAME[FREE_CAMERA_FORWARD_AXIS + index] = forward - right * amount;
    }
    normalize_free_camera_axis(FREE_CAMERA_RIGHT_AXIS);
    normalize_free_camera_axis(FREE_CAMERA_FORWARD_AXIS);
}

unsafe fn pitch_free_camera(amount: f32) {
    for index in 0..3 {
        let up = FREE_CAMERA_FRAME[FREE_CAMERA_UP_AXIS + index];
        let forward = FREE_CAMERA_FRAME[FREE_CAMERA_FORWARD_AXIS + index];
        FREE_CAMERA_FRAME[FREE_CAMERA_UP_AXIS + index] = up - forward * amount;
        FREE_CAMERA_FRAME[FREE_CAMERA_FORWARD_AXIS + index] = forward + up * amount;
    }
    normalize_free_camera_axis(FREE_CAMERA_UP_AXIS);
    normalize_free_camera_axis(FREE_CAMERA_FORWARD_AXIS);
}

unsafe fn free_camera_anchor_position(anchor: &mut [f32; 3]) -> bool {
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

unsafe fn aim_free_camera_at(anchor: &[f32; 3]) {
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

unsafe fn drag_free_camera_around_car(right: f32, up: f32) {
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

unsafe fn apply_free_camera_gesture(
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
    FREE_CAMERA_ACTIVE.store(true, Ordering::Release);
    write_free_camera_frame(camera);
}

unsafe fn nudge_free_camera(right: f32, up: f32, forward: f32, yaw: f32, pitch: f32) {
    apply_free_camera_gesture(right, up, forward, yaw, pitch, 0.0, 0.0);
}

unsafe extern "C" fn hooked_game_update_camera(game: *mut c_void, delta_seconds: f32) {
    let original: GameUpdateCameraFn = mem::transmute(GAME_UPDATE_CAMERA_TRAMPOLINE);
    original(game, delta_seconds);

    let intro_camera_flag = game_is_level_intro(game);
    if !intro_camera_flag {
        FREE_CAMERA_LEVEL_INTRO_STARTED.store(false, Ordering::Release);
    }
    let in_replay = game_show_replay_active();
    let in_level_intro = in_replay;
    FREE_CAMERA_IN_LEVEL_INTRO.store(in_level_intro, Ordering::Release);
    if !in_level_intro {
        FREE_CAMERA_ACTIVE.store(false, Ordering::Release);
        FREE_CAMERA_CAPTURE_REQUESTED.store(false, Ordering::Release);
        return;
    }
    if !FREE_CAMERA_ENABLED.load(Ordering::Acquire) {
        FREE_CAMERA_ACTIVE.store(false, Ordering::Release);
        return;
    }

    let camera = current_camera();
    if camera.is_null() {
        return;
    }
    if FREE_CAMERA_CAPTURE_REQUESTED.swap(false, Ordering::AcqRel) {
        capture_free_camera_frame(camera);
    }
    if FREE_CAMERA_ACTIVE.load(Ordering::Acquire) {
        write_free_camera_frame(camera);
    }
}

unsafe extern "C" fn hooked_game_start_level_intro(game: *mut c_void, intro_type: c_int) {
    let original: GameStartLevelIntroFn = mem::transmute(GAME_START_LEVEL_INTRO_TRAMPOLINE);
    original(game, intro_type);
    FREE_CAMERA_LEVEL_INTRO_STARTED.store(true, Ordering::Release);
    FREE_CAMERA_ACTIVE.store(false, Ordering::Release);
    FREE_CAMERA_CAPTURE_REQUESTED.store(false, Ordering::Release);
}

unsafe fn install_free_camera_hooks() -> bool {
    if FREE_CAMERA_HOOKS_INSTALLED.load(Ordering::Acquire) {
        return true;
    }
    if FREE_CAMERA_HOOKS_INSTALLED.swap(true, Ordering::AcqRel) {
        return true;
    }

    let update_camera = resolve(b"_ZN4Game12UpdateCameraEf\0");
    let start_level_intro = resolve(b"_ZN4Game15StartLevelIntroEi\0");
    if update_camera.is_null() || start_level_intro.is_null() || !ensure_free_camera_symbols() {
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
    let ok =
        !GAME_UPDATE_CAMERA_TRAMPOLINE.is_null() && !GAME_START_LEVEL_INTRO_TRAMPOLINE.is_null();
    if !ok {
        FREE_CAMERA_HOOKS_INSTALLED.store(false, Ordering::Release);
    }
    ok
}

unsafe extern "C" fn hooked_ingame_level_editor_save(
    editor: *mut c_void,
    path: *mut c_char,
) -> c_int {
    let original: InGameLevelEditorSaveFn = mem::transmute(INGAME_LEVEL_EDITOR_SAVE_TRAMPOLINE);
    let result = original(editor, path);
    if USER_TRACK_CREATE_FLAGS_ARMED.load(Ordering::Acquire) {
        let flags = USER_TRACK_PENDING_FLAGS.load(Ordering::Acquire);
        if USER_TRACK_FLAGS_TOUCHED.load(Ordering::Acquire) || flags != 0 {
            append_user_track_flags_marker(
                path,
                flags,
                USER_TRACK_PENDING_LAP_COUNT.load(Ordering::Acquire),
            );
        }
        cancel_user_track_create_flags();
    }
    result
}

unsafe extern "C" fn hooked_ingame_level_editor_load(editor: *mut c_void, path: *const c_char) {
    let (flags, lap_count) = read_user_track_flags_marker(path);
    USER_TRACK_PENDING_FLAGS.store(flags, Ordering::Release);
    USER_TRACK_PENDING_LAP_COUNT.store(lap_count, Ordering::Release);
    store_user_track_settings(flags, lap_count);
    USER_TRACK_FLAGS_TOUCHED.store(false, Ordering::Release);
    let original: InGameLevelEditorLoadFn = mem::transmute(INGAME_LEVEL_EDITOR_LOAD_TRAMPOLINE);
    original(editor, path);
}

unsafe extern "C" fn hooked_uiform_create_ctor(form: *mut c_void) {
    let original: UiFormCreateCtorFn = mem::transmute(UIFORM_CREATE_CTOR_TRAMPOLINE);
    original(form);
    add_user_track_create_switches(form);
}

unsafe extern "C" fn hooked_uiform_pause_ctor(form: *mut c_void) {
    let original: UiFormPauseCtorFn = mem::transmute(UIFORM_PAUSE_CTOR_TRAMPOLINE);
    original(form);
    if ingame_level_editor_active() {
        add_user_track_switches(form, false);
    }
}

unsafe extern "C" fn hooked_world_load(
    world: *mut c_void,
    path: *const c_char,
    flag: u8,
    value: c_uint,
) -> c_int {
    let (flags, lap_count) = read_user_track_flags_marker(path);
    store_user_track_settings(flags, lap_count);
    let original: WorldLoadFn = mem::transmute(WORLD_LOAD_TRAMPOLINE);
    let result = original(world, path, flag, value);
    store_user_track_settings(flags, lap_count);
    result
}

unsafe extern "C" fn hooked_game_load_level(
    game: *mut c_void,
    level_id: c_uint,
    difficulty: c_int,
) -> c_int {
    let (flags, lap_count) = settings_for_level_id(level_id);
    store_user_track_settings(flags, lap_count);
    apply_user_track_level_settings(level_id, flags, lap_count);
    let original: GameLoadLevelFn = mem::transmute(GAME_LOAD_LEVEL_TRAMPOLINE);
    let result = original(game, level_id, difficulty);
    apply_user_track_level_settings(
        level_id,
        CURRENT_USER_TRACK_FLAGS.load(Ordering::Acquire),
        CURRENT_USER_TRACK_LAP_COUNT.load(Ordering::Acquire),
    );
    result
}

unsafe extern "C" fn hooked_game_on_checkpoint(
    game: *mut c_void,
    position: *const c_void,
    checkpoint: c_int,
) {
    let original: GameOnCheckpointFn = mem::transmute(GAME_ON_CHECKPOINT_TRAMPOLINE);
    original(game, position, checkpoint);
    refill_current_car_boost(game);
}

unsafe fn install_user_track_hooks() -> bool {
    if USER_TRACK_HOOKS_INSTALLED.load(Ordering::Acquire) {
        return true;
    }
    if USER_TRACK_HOOKS_INSTALLED.swap(true, Ordering::AcqRel) {
        return true;
    }

    let save = resolve(b"_ZN17InGameLevelEditor4SaveEPc\0");
    let load = resolve(b"_ZN17InGameLevelEditor4LoadEPKc\0");
    let create_ctor = resolve(b"_ZN12UiFormCreateC1Ev\0");
    let pause_ctor = resolve(b"_ZN11UiFormPauseC1Ev\0");
    let world_load = resolve(b"_ZN5World4LoadEPKcbj\0");
    let game_load_level = resolve(b"_ZN4Game9LoadLevelEjNS_10DifficultyE\0");
    let game_on_checkpoint = resolve(b"_ZN4Game12OnCheckPointERKN2TA4Vec3Ei\0");
    if save.is_null()
        || load.is_null()
        || create_ctor.is_null()
        || pause_ctor.is_null()
        || world_load.is_null()
        || game_load_level.is_null()
        || game_on_checkpoint.is_null()
        || !create_form_ui_symbols_ready()
    {
        USER_TRACK_HOOKS_INSTALLED.store(false, Ordering::Release);
        return false;
    }

    INGAME_LEVEL_EDITOR_SAVE_TRAMPOLINE = install_inline_hook(
        save,
        hooked_ingame_level_editor_save as *const c_void,
        INGAME_LEVEL_EDITOR_SAVE_HOOK_BYTES,
    );
    INGAME_LEVEL_EDITOR_LOAD_TRAMPOLINE = install_inline_hook(
        load,
        hooked_ingame_level_editor_load as *const c_void,
        INGAME_LEVEL_EDITOR_LOAD_HOOK_BYTES,
    );
    UIFORM_CREATE_CTOR_TRAMPOLINE = install_inline_hook(
        create_ctor,
        hooked_uiform_create_ctor as *const c_void,
        UIFORM_CREATE_CTOR_HOOK_BYTES,
    );
    UIFORM_PAUSE_CTOR_TRAMPOLINE = install_inline_hook(
        pause_ctor,
        hooked_uiform_pause_ctor as *const c_void,
        UIFORM_PAUSE_CTOR_HOOK_BYTES,
    );
    WORLD_LOAD_TRAMPOLINE = install_inline_hook(
        world_load,
        hooked_world_load as *const c_void,
        WORLD_LOAD_HOOK_BYTES,
    );
    GAME_LOAD_LEVEL_TRAMPOLINE = install_inline_hook(
        game_load_level,
        hooked_game_load_level as *const c_void,
        GAME_LOAD_LEVEL_HOOK_BYTES,
    );
    GAME_ON_CHECKPOINT_TRAMPOLINE = install_inline_hook(
        game_on_checkpoint,
        hooked_game_on_checkpoint as *const c_void,
        GAME_ON_CHECKPOINT_HOOK_BYTES,
    );

    let ok = !(INGAME_LEVEL_EDITOR_SAVE_TRAMPOLINE.is_null()
        || INGAME_LEVEL_EDITOR_LOAD_TRAMPOLINE.is_null()
        || UIFORM_CREATE_CTOR_TRAMPOLINE.is_null()
        || UIFORM_PAUSE_CTOR_TRAMPOLINE.is_null()
        || WORLD_LOAD_TRAMPOLINE.is_null()
        || GAME_LOAD_LEVEL_TRAMPOLINE.is_null()
        || GAME_ON_CHECKPOINT_TRAMPOLINE.is_null());
    if !ok {
        USER_TRACK_HOOKS_INSTALLED.store(false, Ordering::Release);
    }
    ok
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

unsafe fn engine_checkpoint_has_state_flag() -> bool {
    let raw = live_checkpoint_index();
    raw >= 0 && (raw & !0x00ff_ffff) != 0
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

unsafe fn replay_visual_ms() -> i32 {
    replay_nodes_to_ms(read_i32_pointer(LAST_REPLAY_SIZE))
}

unsafe fn engine_checkpoint_candidate(ghost_count: c_int) -> c_int {
    let decoded = decoded_live_checkpoint_index();
    if decoded < 1 || decoded > ghost_count {
        return -1;
    }
    if !engine_checkpoint_has_state_flag() || replay_visual_ms() <= 0 {
        return -1;
    }
    decoded
}

unsafe fn appended_live_checkpoint_ms(checkpoint: c_int, ghost_count: c_int) -> i32 {
    if checkpoint < 1 || ghost_count < 1 {
        return -1;
    }
    let count = live_checkpoint_count();
    if count < ghost_count + checkpoint {
        return -1;
    }
    let millis = checkpoint_time_ms(ghost_count + checkpoint - 1);
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
    let scanned = scan_live_checkpoint_from_last_time();
    if last_ms > 0 && scanned == checkpoint {
        return last_ms;
    }
    let ghost_count = effective_ghost_checkpoint_count();
    let appended_ms = appended_live_checkpoint_ms(checkpoint, ghost_count);
    if appended_ms > 0 {
        return appended_ms;
    }
    if engine_checkpoint_candidate(ghost_count) == checkpoint {
        let visual_ms = replay_visual_ms();
        if visual_ms > 0 {
            return visual_ms;
        }
    }
    if last_ms > 0 && scanned < 1 && decoded_live_checkpoint_index() == checkpoint {
        return last_ms;
    }
    -1
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
    let engine = engine_checkpoint_candidate(ghost_count);
    let appended = if count > ghost_count {
        count - ghost_count
    } else {
        -1
    };
    let candidate = if appended >= 1 {
        appended
    } else if engine >= 1 {
        if scanned > engine {
            scanned
        } else {
            engine
        }
    } else if scanned >= 1 {
        scanned
    } else if last_checkpoint_ms() > 0 && decoded >= 1 {
        decoded
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
    FREE_CAMERA_ACTIVE.store(false, Ordering::Release);
    FREE_CAMERA_CAPTURE_REQUESTED.store(false, Ordering::Release);
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
    if game_show_replay_active() {
        status |= 8;
    }
    status
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

// --- Replay swarm mode (multi-replay passive overlay) ---------------------------

extern "C" {
    fn malloc(size: usize) -> *mut c_void;
    fn free(ptr: *mut c_void);
}

unsafe fn c_strlen(text: *const u8) -> usize {
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

unsafe fn swarm_catalog_find(path: *const u8, len: usize) -> i32 {
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

unsafe fn swarm_catalog_note_path(path: *const c_char) {
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

unsafe fn swarm_reset_ghosts() {
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

unsafe fn swarm_reset_catalog() {
    swarm_reset_ghosts();
    SWARM_CATALOG_LEN = 0;
}

unsafe fn ensure_swarm_symbols() -> bool {
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
        let ghost_size_addr = resolve(b"g_nGhostSize\0") as *mut c_int;
        if !ghost_size_addr.is_null() {
            let loaded = ptr::read_volatile(ghost_size_addr) as usize;
            let module_base = loaded.wrapping_sub(0x5a0514);
            if module_base > 0x1000 {
                let scale_ptr = (module_base + 0x2abde0) as *const f32;
                let scale = ptr::read_volatile(scale_ptr);
                if scale > 0.0 && scale < 1000.0 {
                    ORIENTATION_SCALE = scale;
                }
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

unsafe fn swarm_replay_object(game: *mut c_void) -> *mut c_void {
    if game.is_null() {
        return ptr::null_mut();
    }
    ptr::read_volatile((game as *mut u8).add(GAME_REPLAY_OBJECT_OFFSET) as *mut *mut c_void)
}

unsafe fn swarm_snapshot_ghost_globals(
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

unsafe fn swarm_restore_ghost_globals(
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

unsafe fn swarm_load_ghost_nodes_from_path(path: *const c_char) -> (*mut u8, i32) {
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
    if load(replay, path) == 0 {
        swarm_restore_ghost_globals(&mut saved_ptr, saved_size, saved_pos);
        return (ptr::null_mut(), 0);
    }
    decompress(replay);

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

unsafe fn swarm_apply_orientation(transform: *mut f32, node: *const u8) {
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

unsafe fn swarm_integrate_transform(
    nodes: *const u8,
    node_count: i32,
    target_index: i32,
    transform: *mut f32,
) -> bool {
    if nodes.is_null() || transform.is_null() || node_count < 1 || target_index < 0 {
        return false;
    }
    ptr::write_bytes(transform, 0, GHOST_TRANSFORM_BYTES);
    ptr::write(transform.add(GHOST_TRANSFORM_POS_FLOAT + 2), 1.0f32);
    let limit = target_index.min(node_count - 1);
    let mut velocity = [0.0f32; 3];
    let mut index = 0i32;
    while index <= limit {
        let node = nodes.add((index as usize) * GHOST_NODE_SIZE);
        let flags = ptr::read_volatile(node.add(GHOST_NODE_FLAGS_OFFSET));
        if (flags & 0x08) != 0 {
            velocity[0] = 0.0;
            velocity[1] = 0.0;
            velocity[2] = 0.0;
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
            velocity[0] += ptr::read_volatile(node.add(GHOST_NODE_VECTOR_OFFSET) as *const f32);
            velocity[1] += ptr::read_volatile(node.add(GHOST_NODE_VECTOR_OFFSET + 4) as *const f32);
            velocity[2] += ptr::read_volatile(node.add(GHOST_NODE_VECTOR_OFFSET + 8) as *const f32);
            ptr::write(
                transform.add(GHOST_TRANSFORM_POS_FLOAT),
                ptr::read(transform.add(GHOST_TRANSFORM_POS_FLOAT)) + velocity[0],
            );
            ptr::write(
                transform.add(GHOST_TRANSFORM_POS_FLOAT + 1),
                ptr::read(transform.add(GHOST_TRANSFORM_POS_FLOAT + 1)) + velocity[1],
            );
            ptr::write(
                transform.add(GHOST_TRANSFORM_POS_FLOAT + 2),
                ptr::read(transform.add(GHOST_TRANSFORM_POS_FLOAT + 2)) + velocity[2],
            );
        }
        swarm_apply_orientation(transform, node);
        index += 1;
    }
    true
}

unsafe fn swarm_master_node_index() -> i32 {
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

unsafe fn swarm_render_extra_ghosts(game: *mut c_void) {
    if !REPLAY_SWARM_ACTIVE.load(Ordering::Acquire) || SWARM_GHOST_COUNT == 0 {
        return;
    }
    if SHOW_REPLAY.is_null() || ptr::read_volatile(SHOW_REPLAY) == 0 {
        return;
    }
    let master = swarm_master_node_index();
    if master < 1 {
        return;
    }
    let car =
        ptr::read_volatile((game as *mut u8).add(GAME_CURRENT_CAR_OFFSET) as *mut *mut c_void);
    if car.is_null() {
        return;
    }
    let render: CarRenderGhostFn = mem::transmute(CAR_RENDER_GHOST);
    let mut transform = [0.0f32; GHOST_TRANSFORM_BYTES / 4];
    if !GHOST_TRANSFORM.is_null() {
        ptr::copy_nonoverlapping(GHOST_TRANSFORM, transform.as_mut_ptr(), transform.len());
    }
    let mut index = 0usize;
    while index < SWARM_GHOST_COUNT {
        let nodes = SWARM_GHOST_NODES[index];
        let count = SWARM_GHOST_NODE_COUNT[index];
        if !nodes.is_null() && count > 1 {
            if swarm_integrate_transform(nodes, count, master, transform.as_mut_ptr()) {
                render(car, transform.as_ptr());
            }
        }
        index += 1;
    }
}

unsafe extern "C" fn hooked_replay_update(
    replay: *mut c_void,
    car: *mut c_void,
    a: c_int,
    b: c_int,
) {
    let original: ReplayUpdateFn = mem::transmute(REPLAY_UPDATE_TRAMPOLINE);
    original(replay, car, a, b);
    if !CURRENT_GAME.is_null() {
        swarm_render_extra_ghosts(CURRENT_GAME);
    }
}

unsafe extern "C" fn hooked_game_render_ghost(game: *mut c_void) {
    let original: GameRenderGhostFn = mem::transmute(GAME_RENDER_GHOST_TRAMPOLINE);
    original(game);
}

unsafe extern "C" fn hooked_game_view_replay(
    game: *mut c_void,
    saved: *mut u8,
    path: *const c_char,
) -> u8 {
    CURRENT_GAME = game;
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

unsafe fn install_replay_swarm_hooks() -> bool {
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
    let view_replay = resolve(b"_ZN4Game10ViewReplayEPhPc\0");
    let replay_update = resolve(b"_ZN6Replay6UpdateEP3Carfi\0");
    if render_ghost.is_null() || view_replay.is_null() || replay_update.is_null() {
        REPLAY_SWARM_HOOKS_INSTALLED.store(false, Ordering::Release);
        return false;
    }
    GAME_RENDER_GHOST_TRAMPOLINE = install_inline_hook(
        render_ghost,
        hooked_game_render_ghost as *const c_void,
        GAME_RENDER_GHOST_HOOK_BYTES,
    );
    GAME_VIEW_REPLAY_TRAMPOLINE = install_inline_hook(
        view_replay,
        hooked_game_view_replay as *const c_void,
        GAME_VIEW_REPLAY_HOOK_BYTES,
    );
    REPLAY_UPDATE_TRAMPOLINE = install_inline_hook(
        replay_update,
        hooked_replay_update as *const c_void,
        REPLAY_UPDATE_HOOK_BYTES,
    );
    let ok = !GAME_RENDER_GHOST_TRAMPOLINE.is_null()
        && !GAME_VIEW_REPLAY_TRAMPOLINE.is_null()
        && !REPLAY_UPDATE_TRAMPOLINE.is_null();
    if !ok {
        REPLAY_SWARM_HOOKS_INSTALLED.store(false, Ordering::Release);
    }
    ok
}

unsafe fn jni_copy_bytes_to_array(
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
    let get_length: unsafe extern "C" fn(*mut c_void, *mut c_void) -> i32 =
        mem::transmute(*functions.add(171));
    let get_elements: unsafe extern "C" fn(*mut c_void, *mut c_void, *mut u8) -> *mut i8 =
        mem::transmute(*functions.add(184));
    let release_elements: unsafe extern "C" fn(*mut c_void, *mut c_void, *mut i8, i32) =
        mem::transmute(*functions.add(185));
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

unsafe fn jni_read_int_array(
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
    let get_length: unsafe extern "C" fn(*mut c_void, *mut c_void) -> i32 =
        mem::transmute(*functions.add(171));
    let get_elements: unsafe extern "C" fn(*mut c_void, *mut c_void, *mut u8) -> *mut i32 =
        mem::transmute(*functions.add(184));
    let release_elements: unsafe extern "C" fn(*mut c_void, *mut c_void, *mut i32, i32) =
        mem::transmute(*functions.add(185));
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
    if !ensure_swarm_symbols() || SHOW_REPLAY.is_null() || ptr::read_volatile(SHOW_REPLAY) == 0 {
        return 0;
    }
    1
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
    swarm_reset_ghosts();
    if primary_index < 0 || primary_index as usize >= SWARM_CATALOG_LEN {
        return;
    }
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
    REPLAY_SWARM_ACTIVE.store(SWARM_GHOST_COUNT > 0, Ordering::Release);
}
