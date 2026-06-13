#![no_std]

use core::arch::asm;
use core::ffi::{c_char, c_int, c_void};
use core::panic::PanicInfo;
use core::ptr;

const RTLD_DEFAULT: *mut c_void = 0usize as *mut c_void;
const RTLD_NOW: c_int = 2;
const PROT_READ: c_int = 1;
const PROT_WRITE: c_int = 2;
const PROT_EXEC: c_int = 4;

const PATCH_TRUE: [u32; 2] = [0x52800020, 0xd65f03c0];
const PATCH_FALSE: [u32; 2] = [0x52800000, 0xd65f03c0];

extern "C" {
    fn dlopen(filename: *const c_char, flags: c_int) -> *mut c_void;
    fn dlsym(handle: *mut c_void, symbol: *const c_char) -> *mut c_void;
    fn mprotect(addr: *mut c_void, len: usize, prot: c_int) -> c_int;
    fn sysconf(name: c_int) -> isize;
}

static mut TRUEAXIS_HANDLE: *mut c_void = RTLD_DEFAULT;

#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
    loop {}
}

struct Symbol {
    name: &'static [u8],
    kind: u8,
    original: u64,
    captured: bool,
}

struct IntCall {
    setter: &'static [u8],
    getter: &'static [u8],
    original: c_int,
    captured: bool,
}

const BOOL: u8 = 1;
const INT: u8 = 2;
const FLOAT: u8 = 3;
const FUNC: u8 = 4;

const SYMBOL_COUNT: usize = 49;

static mut SYMBOLS: [Symbol; SYMBOL_COUNT] = [
    Symbol { name: b"g_bUnLockAll\0", kind: BOOL, original: 0, captured: false },
    Symbol { name: b"g_bHyperBallistic\0", kind: BOOL, original: 0, captured: false },
    Symbol { name: b"g_bAiOnPlayerCar\0", kind: BOOL, original: 0, captured: false },
    Symbol { name: b"g_bAiEnabled\0", kind: BOOL, original: 0, captured: false },
    Symbol { name: b"g_bFastForward\0", kind: BOOL, original: 0, captured: false },
    Symbol { name: b"g_bShowReplay\0", kind: BOOL, original: 0, captured: false },
    Symbol { name: b"g_bScreenShotMode\0", kind: BOOL, original: 0, captured: false },
    Symbol { name: b"g_bInGameLevelEditor\0", kind: BOOL, original: 0, captured: false },
    Symbol { name: b"g_bDisableDynamicCubeMapping\0", kind: BOOL, original: 0, captured: false },
    Symbol { name: b"g_bSoundLoopsOff\0", kind: BOOL, original: 0, captured: false },
    Symbol { name: b"g_bFlipScreen\0", kind: BOOL, original: 0, captured: false },
    Symbol { name: b"g_bRotateScreen\0", kind: BOOL, original: 0, captured: false },
    Symbol { name: b"m_bNo30fpsSwitch\0", kind: BOOL, original: 0, captured: false },
    Symbol { name: b"m_bDynamicReflections\0", kind: BOOL, original: 0, captured: false },
    Symbol { name: b"g_bRocketFuelEmptyMessage\0", kind: BOOL, original: 0, captured: false },
    Symbol { name: b"m_bKeepReplayHack\0", kind: BOOL, original: 0, captured: false },
    Symbol { name: b"m_bFrameRate\0", kind: BOOL, original: 0, captured: false },
    Symbol { name: b"m_bFrameRateDefault\0", kind: BOOL, original: 0, captured: false },
    Symbol { name: b"m_bDynamicReflectionsDefault\0", kind: BOOL, original: 0, captured: false },
    Symbol { name: b"g_nMaxNumCheckPointTimes\0", kind: INT, original: 0, captured: false },
    Symbol { name: b"_ZN20UiFormPopupTextInput20s_nMaxTextBufferSizeE\0", kind: INT, original: 0, captured: false },
    Symbol { name: b"m_nFrameDelay\0", kind: INT, original: 0, captured: false },
    Symbol { name: b"m_nRequestedSampleCount\0", kind: INT, original: 0, captured: false },
    Symbol { name: b"g_nReplaySize\0", kind: INT, original: 0, captured: false },
    Symbol { name: b"g_nGhostSize\0", kind: INT, original: 0, captured: false },
    Symbol { name: b"g_nLastReplaySize\0", kind: INT, original: 0, captured: false },
    Symbol { name: b"m_nRequestedRedSize\0", kind: INT, original: 0, captured: false },
    Symbol { name: b"m_nRequestedGreenSize\0", kind: INT, original: 0, captured: false },
    Symbol { name: b"m_nRequestedBlueSize\0", kind: INT, original: 0, captured: false },
    Symbol { name: b"m_nRequestedAlphaSize\0", kind: INT, original: 0, captured: false },
    Symbol { name: b"m_nRequestedDepthSize\0", kind: INT, original: 0, captured: false },
    Symbol { name: b"m_nRequestedStencilSize\0", kind: INT, original: 0, captured: false },
    Symbol { name: b"g_nFreeStyleBestTrickScore\0", kind: INT, original: 0, captured: false },
    Symbol { name: b"g_nInAirStuntCounter\0", kind: INT, original: 0, captured: false },
    Symbol { name: b"g_fReadySetGoTime\0", kind: FLOAT, original: 0, captured: false },
    Symbol { name: b"g_fGSensorResponsivness\0", kind: FLOAT, original: 0, captured: false },
    Symbol { name: b"g_fScreenTilt\0", kind: FLOAT, original: 0, captured: false },
    Symbol { name: b"g_fSensorDiff\0", kind: FLOAT, original: 0, captured: false },
    Symbol { name: b"m_fTimerWaitValue30fps\0", kind: FLOAT, original: 0, captured: false },
    Symbol { name: b"m_fTimerWaitValue60fps\0", kind: FLOAT, original: 0, captured: false },
    Symbol { name: b"g_fNear\0", kind: FLOAT, original: 0, captured: false },
    Symbol { name: b"g_fFar\0", kind: FLOAT, original: 0, captured: false },
    Symbol { name: b"_Z18Levels_IsPurchasedi\0", kind: FUNC, original: 0, captured: false },
    Symbol { name: b"_Z21Store_IsItemPurchasedPKc\0", kind: FUNC, original: 0, captured: false },
    Symbol { name: b"_Z15IsItemPurchasedPc\0", kind: FUNC, original: 0, captured: false },
    Symbol { name: b"_Z32StoreItems_IsLevelEditorUnlockedv\0", kind: FUNC, original: 0, captured: false },
    Symbol { name: b"_ZN16UiFormUserLevels20MaxUserLevelsReachedEN27UiFormPopupOnceAlwaysCancel6ResultEPv\0", kind: FUNC, original: 0, captured: false },
    Symbol { name: b"g_bIAPCrack\0", kind: BOOL, original: 0, captured: false },
    Symbol { name: b"g_bIAPCrackDisableStore\0", kind: BOOL, original: 0, captured: false },
];

const CALL_COUNT: usize = 3;
static mut INT_CALLS: [IntCall; CALL_COUNT] = [
    IntCall {
        setter: b"_ZN2TA7Physics19SetMaxNumCollisionsEi\0",
        getter: b"_ZN2TA7Physics19GetMaxNumCollisionsEv\0",
        original: 0,
        captured: false,
    },
    IntCall {
        setter: b"_ZN2TA7Physics20SetMaxNumObjectPairsEi\0",
        getter: b"_ZN2TA7Physics20GetMaxNumObjectPairsEv\0",
        original: 0,
        captured: false,
    },
    IntCall {
        setter: b"_ZN2TA7Physics22SetMaxNumMovingObjectsEi\0",
        getter: b"_ZN2TA7Physics22GetMaxNumMovingObjectsEv\0",
        original: 0,
        captured: false,
    },
];

unsafe fn symbol(id: c_int) -> Option<(&'static mut Symbol, *mut c_void)> {
    if id < 0 || id as usize >= SYMBOL_COUNT {
        return None;
    }
    let entry = &mut SYMBOLS[id as usize];
    let address = resolve(entry.name);
    if address.is_null() {
        None
    } else {
        Some((entry, address))
    }
}

unsafe fn resolve(name: &'static [u8]) -> *mut c_void {
    if TRUEAXIS_HANDLE.is_null() {
        TRUEAXIS_HANDLE = dlopen(b"libtrueaxis.so\0".as_ptr() as *const c_char, RTLD_NOW);
    }
    let mut address = if TRUEAXIS_HANDLE.is_null() {
        ptr::null_mut()
    } else {
        dlsym(TRUEAXIS_HANDLE, name.as_ptr() as *const c_char)
    };
    if address.is_null() {
        address = dlsym(RTLD_DEFAULT, name.as_ptr() as *const c_char);
    }
    address
}

unsafe fn capture(entry: &mut Symbol, address: *mut c_void) {
    if entry.captured {
        return;
    }
    entry.original = match entry.kind {
        BOOL => ptr::read_volatile(address as *const u8) as u64,
        INT | FLOAT => ptr::read_volatile(address as *const u32) as u64,
        FUNC => ptr::read_unaligned(address as *const u64),
        _ => 0,
    };
    entry.captured = true;
}

unsafe fn protect(address: *mut c_void, len: usize, permissions: c_int) -> bool {
    let page_size = sysconf(30);
    if page_size <= 0 {
        return false;
    }
    let page_size = page_size as usize;
    let start = address as usize & !(page_size - 1);
    let end = (address as usize + len + page_size - 1) & !(page_size - 1);
    mprotect(start as *mut c_void, end - start, permissions) == 0
}

unsafe fn patch_function(address: *mut c_void, value: bool) -> bool {
    if !protect(address, 8, PROT_READ | PROT_WRITE | PROT_EXEC) {
        return false;
    }
    let patch = if value { PATCH_TRUE } else { PATCH_FALSE };
    ptr::copy_nonoverlapping(patch.as_ptr() as *const u8, address as *mut u8, 8);
    clear_cache(address);
    protect(address, 8, PROT_READ | PROT_EXEC)
}

unsafe fn clear_cache(address: *mut c_void) {
    asm!("dc cvau, {0}", in(reg) address, options(nostack));
    asm!("dsb ish", options(nostack));
    asm!("ic ivau, {0}", in(reg) address, options(nostack));
    asm!("dsb ish", options(nostack));
    asm!("isb", options(nostack));
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_NativeMods_available(
    _env: *mut c_void,
    _class: *mut c_void,
    id: c_int,
) -> u8 {
    symbol(id).is_some() as u8
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_NativeMods_setBool(
    _env: *mut c_void,
    _class: *mut c_void,
    id: c_int,
    value: u8,
) -> u8 {
    if let Some((entry, address)) = symbol(id) {
        capture(entry, address);
        if entry.kind == FUNC {
            return patch_function(address, value != 0) as u8;
        }
        if entry.kind == BOOL {
            ptr::write_volatile(address as *mut u8, (value != 0) as u8);
            return 1;
        }
    }
    0
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_NativeMods_setInt(
    _env: *mut c_void,
    _class: *mut c_void,
    id: c_int,
    value: c_int,
) -> u8 {
    if let Some((entry, address)) = symbol(id) {
        capture(entry, address);
        if entry.kind == INT {
            ptr::write_volatile(address as *mut c_int, value);
            return 1;
        }
    }
    0
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_NativeMods_setFloat(
    _env: *mut c_void,
    _class: *mut c_void,
    id: c_int,
    value: f32,
) -> u8 {
    if let Some((entry, address)) = symbol(id) {
        capture(entry, address);
        if entry.kind == FLOAT {
            ptr::write_volatile(address as *mut f32, value);
            return 1;
        }
    }
    0
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_NativeMods_reset(
    _env: *mut c_void,
    _class: *mut c_void,
    id: c_int,
) -> u8 {
    if let Some((entry, address)) = symbol(id) {
        if !entry.captured {
            return 1;
        }
        match entry.kind {
            BOOL => ptr::write_volatile(address as *mut u8, entry.original as u8),
            INT | FLOAT => ptr::write_volatile(address as *mut u32, entry.original as u32),
            FUNC => {
                if !protect(address, 8, PROT_READ | PROT_WRITE | PROT_EXEC) {
                    return 0;
                }
                ptr::write_unaligned(address as *mut u64, entry.original);
                clear_cache(address);
                if !protect(address, 8, PROT_READ | PROT_EXEC) {
                    return 0;
                }
            }
            _ => return 0,
        }
        return 1;
    }
    0
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_NativeMods_resetAll(
    env: *mut c_void,
    class: *mut c_void,
) {
    let mut id = 0;
    while id < SYMBOL_COUNT as c_int {
        Java_com_trueaxis_modmenu_NativeMods_reset(env, class, id);
        id += 1;
    }
    id = 0;
    while id < CALL_COUNT as c_int {
        Java_com_trueaxis_modmenu_NativeMods_resetCall(env, class, id);
        id += 1;
    }
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_NativeMods_callInt(
    _env: *mut c_void,
    _class: *mut c_void,
    id: c_int,
    value: c_int,
) -> u8 {
    if id < 0 || id as usize >= CALL_COUNT {
        return 0;
    }
    let entry = &mut INT_CALLS[id as usize];
    let setter = resolve(entry.setter);
    let getter = resolve(entry.getter);
    if setter.is_null() || getter.is_null() {
        return 0;
    }
    let get: extern "C" fn() -> c_int = core::mem::transmute(getter);
    let set: extern "C" fn(c_int) = core::mem::transmute(setter);
    if !entry.captured {
        entry.original = get();
        entry.captured = true;
    }
    set(value);
    1
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_NativeMods_resetCall(
    _env: *mut c_void,
    _class: *mut c_void,
    id: c_int,
) -> u8 {
    if id < 0 || id as usize >= CALL_COUNT {
        return 0;
    }
    let entry = &mut INT_CALLS[id as usize];
    if !entry.captured {
        return 1;
    }
    let setter = resolve(entry.setter);
    if setter.is_null() {
        return 0;
    }
    let set: extern "C" fn(c_int) = core::mem::transmute(setter);
    set(entry.original);
    1
}
