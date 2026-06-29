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
const USER_TRACK_FLAGS_MAGIC: &[u8] = b"YCS2TRACKFLAGS:1:";
const USER_TRACK_FLAGS_MAX_SCAN: usize = 256;
const LEVEL_TYPE_OFFSET: usize = 0x50;
const LEVEL_TYPE_LAPS: c_int = 3;
const GAME_CURRENT_CAR_OFFSET: usize = 0xb0;
const CAR_FUEL_OFFSET: usize = 0x128;
const INGAME_LEVEL_EDITOR_SAVE_HOOK_BYTES: usize = 16;
const UIFORM_CREATE_CTOR_HOOK_BYTES: usize = 16;
const WORLD_LOAD_HOOK_BYTES: usize = 16;
const GAME_LOAD_LEVEL_HOOK_BYTES: usize = 16;
const GAME_ON_CHECKPOINT_HOOK_BYTES: usize = 16;
const GAME_UPDATE_CAMERA_HOOK_BYTES: usize = 16;
const GAME_START_LEVEL_INTRO_HOOK_BYTES: usize = 16;
const HOOK_STUB_BYTES: usize = 16;
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
type UiFormCreateCtorFn = unsafe extern "C" fn(*mut c_void);
type WorldLoadFn = unsafe extern "C" fn(*mut c_void, *const c_char, u8, c_uint) -> c_int;
type GameLoadLevelFn = unsafe extern "C" fn(*mut c_void, c_uint, c_int) -> c_int;
type GameOnCheckpointFn = unsafe extern "C" fn(*mut c_void, *const c_void, c_int);
type GameUpdateCameraFn = unsafe extern "C" fn(*mut c_void, f32);
type GameStartLevelIntroFn = unsafe extern "C" fn(*mut c_void, c_int);
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
static mut INGAME_LEVEL_EDITOR_SAVE_TRAMPOLINE: *mut c_void = ptr::null_mut();
static mut WORLD_LOAD_TRAMPOLINE: *mut c_void = ptr::null_mut();
static mut GAME_LOAD_LEVEL_TRAMPOLINE: *mut c_void = ptr::null_mut();
static mut GAME_ON_CHECKPOINT_TRAMPOLINE: *mut c_void = ptr::null_mut();
static mut GAME_UPDATE_CAMERA_TRAMPOLINE: *mut c_void = ptr::null_mut();
static mut GAME_START_LEVEL_INTRO_TRAMPOLINE: *mut c_void = ptr::null_mut();
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
static USER_TRACK_PENDING_FLAGS: AtomicU8 = AtomicU8::new(0);
static CURRENT_USER_TRACK_FLAGS: AtomicU8 = AtomicU8::new(0);
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
    set_switch_button_label(
        USER_TRACK_LAPS_BUTTON,
        label_for_switch(
            USER_TRACK_FLAG_LAPS,
            b"LAPS: ON\0".as_ptr() as *const c_char,
            b"LAPS: OFF\0".as_ptr() as *const c_char,
        ),
    );
    set_switch_button_label(
        USER_TRACK_BOOST_REGEN_BUTTON,
        label_for_switch(
            USER_TRACK_FLAG_BOOST_REGEN,
            b"BOOST REGEN: ON\0".as_ptr() as *const c_char,
            b"BOOST REGEN: OFF\0".as_ptr() as *const c_char,
        ),
    );
}

unsafe fn toggle_user_track_create_flag(flag: u8) {
    let current = USER_TRACK_PENDING_FLAGS.load(Ordering::Acquire);
    USER_TRACK_PENDING_FLAGS.store(current ^ flag, Ordering::Release);
    USER_TRACK_CREATE_FLAGS_ARMED.store(true, Ordering::Release);
    refresh_user_track_create_switch_labels();
}

unsafe extern "C" fn on_laps_create_switch_clicked(_button: *mut c_void) {
    toggle_user_track_create_flag(USER_TRACK_FLAG_LAPS);
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

unsafe fn add_user_track_create_switches(form: *mut c_void) {
    if form.is_null() {
        return;
    }
    begin_user_track_create_flags();
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
}

unsafe fn begin_user_track_create_flags() {
    USER_TRACK_PENDING_FLAGS.store(0, Ordering::Release);
    USER_TRACK_CREATE_FLAGS_ARMED.store(true, Ordering::Release);
}

unsafe fn cancel_user_track_create_flags() {
    USER_TRACK_PENDING_FLAGS.store(0, Ordering::Release);
    USER_TRACK_CREATE_FLAGS_ARMED.store(false, Ordering::Release);
}

unsafe fn marker_flags_byte(flags: u8) -> u8 {
    b'0' + (flags & (USER_TRACK_FLAG_LAPS | USER_TRACK_FLAG_BOOST_REGEN))
}

unsafe fn append_user_track_flags_marker(path: *const c_char, flags: u8) -> bool {
    if path.is_null() || flags == 0 {
        return false;
    }
    let fd = open(path, O_WRONLY | O_APPEND, 0o600);
    if fd < 0 {
        return false;
    }
    let prefix = b"\n";
    let suffix = b"\n";
    let value = [marker_flags_byte(flags)];
    let mut ok = write(fd, prefix.as_ptr() as *const c_void, prefix.len()) == prefix.len() as isize;
    ok = write(
        fd,
        USER_TRACK_FLAGS_MAGIC.as_ptr() as *const c_void,
        USER_TRACK_FLAGS_MAGIC.len(),
    ) == USER_TRACK_FLAGS_MAGIC.len() as isize
        && ok;
    ok = write(fd, value.as_ptr() as *const c_void, value.len()) == value.len() as isize && ok;
    ok = write(fd, suffix.as_ptr() as *const c_void, suffix.len()) == suffix.len() as isize && ok;
    let _ = close(fd);
    ok
}

unsafe fn parse_user_track_flags(buffer: &[u8], len: usize) -> u8 {
    if len <= USER_TRACK_FLAGS_MAGIC.len() {
        return 0;
    }
    let mut index = len - USER_TRACK_FLAGS_MAGIC.len();
    loop {
        let mut matched = true;
        let mut marker_index = 0usize;
        while marker_index < USER_TRACK_FLAGS_MAGIC.len() {
            if buffer[index + marker_index] != USER_TRACK_FLAGS_MAGIC[marker_index] {
                matched = false;
                break;
            }
            marker_index += 1;
        }
        if matched {
            let value_index = index + USER_TRACK_FLAGS_MAGIC.len();
            if value_index < len {
                let value = buffer[value_index];
                if value >= b'0' && value <= b'3' {
                    return value - b'0';
                }
            }
        }
        if index == 0 {
            break;
        }
        index -= 1;
    }
    0
}

unsafe fn read_user_track_flags_marker(path: *const c_char) -> u8 {
    if path.is_null() {
        return 0;
    }
    let fd = open(path, O_RDONLY, 0);
    if fd < 0 {
        return 0;
    }
    let end = lseek(fd, 0, SEEK_END);
    if end <= 0 {
        let _ = close(fd);
        return 0;
    }
    let read_len = if end as usize > USER_TRACK_FLAGS_MAX_SCAN {
        USER_TRACK_FLAGS_MAX_SCAN
    } else {
        end as usize
    };
    let start = end - read_len as c_long;
    if lseek(fd, start, SEEK_SET) < 0 {
        let _ = close(fd);
        return 0;
    }
    let mut buffer = [0u8; USER_TRACK_FLAGS_MAX_SCAN];
    let count = read(fd, buffer.as_mut_ptr() as *mut c_void, read_len);
    let _ = close(fd);
    if count <= 0 {
        return 0;
    }
    parse_user_track_flags(&buffer, count as usize)
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

unsafe fn flags_for_level_id(level_id: c_uint) -> u8 {
    if (level_id & 0x8000_0000) == 0 {
        return 0;
    }
    read_user_track_flags_marker(file_name_for_level_id(level_id))
}

unsafe fn apply_lap_type_for_level(level_id: c_uint, flags: u8) {
    if (flags & USER_TRACK_FLAG_LAPS) == 0 {
        return;
    }
    let level = level_for_id(level_id);
    if level.is_null() {
        return;
    }
    ptr::write_volatile(level.add(LEVEL_TYPE_OFFSET) as *mut c_int, LEVEL_TYPE_LAPS);
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

unsafe fn nudge_free_camera(right: f32, up: f32, forward: f32, yaw: f32, pitch: f32) {
    let camera = current_camera();
    if camera.is_null() {
        return;
    }
    if !FREE_CAMERA_ACTIVE.load(Ordering::Acquire) {
        capture_free_camera_frame(camera);
    }
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
    FREE_CAMERA_ACTIVE.store(true, Ordering::Release);
    write_free_camera_frame(camera);
}

unsafe extern "C" fn hooked_game_update_camera(game: *mut c_void, delta_seconds: f32) {
    let original: GameUpdateCameraFn = mem::transmute(GAME_UPDATE_CAMERA_TRAMPOLINE);
    original(game, delta_seconds);

    let intro_camera_flag = game_is_level_intro(game);
    if !intro_camera_flag {
        FREE_CAMERA_LEVEL_INTRO_STARTED.store(false, Ordering::Release);
    }
    let in_level_intro =
        intro_camera_flag && FREE_CAMERA_LEVEL_INTRO_STARTED.load(Ordering::Acquire);
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
        if flags != 0 {
            append_user_track_flags_marker(path, flags);
        }
        cancel_user_track_create_flags();
    }
    result
}

unsafe extern "C" fn hooked_uiform_create_ctor(form: *mut c_void) {
    let original: UiFormCreateCtorFn = mem::transmute(UIFORM_CREATE_CTOR_TRAMPOLINE);
    original(form);
    add_user_track_create_switches(form);
}

unsafe extern "C" fn hooked_world_load(
    world: *mut c_void,
    path: *const c_char,
    flag: u8,
    value: c_uint,
) -> c_int {
    let flags = read_user_track_flags_marker(path);
    CURRENT_USER_TRACK_FLAGS.store(flags, Ordering::Release);
    let original: WorldLoadFn = mem::transmute(WORLD_LOAD_TRAMPOLINE);
    let result = original(world, path, flag, value);
    CURRENT_USER_TRACK_FLAGS.store(flags, Ordering::Release);
    result
}

unsafe extern "C" fn hooked_game_load_level(
    game: *mut c_void,
    level_id: c_uint,
    difficulty: c_int,
) -> c_int {
    let flags = flags_for_level_id(level_id);
    CURRENT_USER_TRACK_FLAGS.store(flags, Ordering::Release);
    apply_lap_type_for_level(level_id, flags);
    let original: GameLoadLevelFn = mem::transmute(GAME_LOAD_LEVEL_TRAMPOLINE);
    let result = original(game, level_id, difficulty);
    apply_lap_type_for_level(level_id, CURRENT_USER_TRACK_FLAGS.load(Ordering::Acquire));
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
    let create_ctor = resolve(b"_ZN12UiFormCreateC1Ev\0");
    let world_load = resolve(b"_ZN5World4LoadEPKcbj\0");
    let game_load_level = resolve(b"_ZN4Game9LoadLevelEjNS_10DifficultyE\0");
    let game_on_checkpoint = resolve(b"_ZN4Game12OnCheckPointERKN2TA4Vec3Ei\0");
    if save.is_null()
        || create_ctor.is_null()
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
    UIFORM_CREATE_CTOR_TRAMPOLINE = install_inline_hook(
        create_ctor,
        hooked_uiform_create_ctor as *const c_void,
        UIFORM_CREATE_CTOR_HOOK_BYTES,
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
        || UIFORM_CREATE_CTOR_TRAMPOLINE.is_null()
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
    if !FREE_CAMERA_ENABLED.load(Ordering::Acquire) {
        return;
    }
    nudge_free_camera(right, up, forward, yaw, pitch);
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
