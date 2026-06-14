#![no_std]

use core::arch::asm;
use core::ffi::{c_char, c_int, c_void};
use core::panic::PanicInfo;
use core::ptr;

const RTLD_DEFAULT: *mut c_void = 0usize as *mut c_void;
const RTLD_NOW: c_int = 2;
const CHECKPOINT_LIMIT: c_int = 999;
const PROT_READ: c_int = 1;
const PROT_WRITE: c_int = 2;
const PROT_EXEC: c_int = 4;
const MAP_PRIVATE: c_int = 2;
const MAP_ANONYMOUS: c_int = 0x20;
const MAP_FAILED: *mut c_void = usize::MAX as *mut c_void;

const REPLAY_NODE_SIZE: usize = 0x14;
const VISUAL_FLAGS_OFFSET: usize = 1;
const MARKER_FRAMES: c_int = 6;
const MARKER_EXTREME_FLAPS: u8 = 0xf0;

const ADD_NODE_PROLOGUE: [u32; 4] = [0xd10243ff, 0xf90033f5, 0xa9074ff4, 0xa9087bfd];
const ABSOLUTE_JUMP_LDR_X16: u32 = 0x58000050;
const ABSOLUTE_JUMP_BR_X16: u32 = 0xd61f0200;

type AddNode = unsafe extern "C" fn(*mut c_void, *mut c_void);

extern "C" {
    fn dlopen(filename: *const c_char, flags: c_int) -> *mut c_void;
    fn dlsym(handle: *mut c_void, symbol: *const c_char) -> *mut c_void;
    fn mmap(
        address: *mut c_void,
        length: usize,
        prot: c_int,
        flags: c_int,
        fd: c_int,
        offset: isize,
    ) -> *mut c_void;
    fn mprotect(address: *mut c_void, length: usize, prot: c_int) -> c_int;
    fn sysconf(name: c_int) -> isize;
}

static mut TRUEAXIS_HANDLE: *mut c_void = ptr::null_mut();
static mut ORIGINAL_ADD_NODE: Option<AddNode> = None;
static mut REPLAY_NODES: *mut *mut u8 = ptr::null_mut();
static mut REPLAY_SIZE: *mut c_int = ptr::null_mut();
static mut MARKER_INSTALLED: bool = false;

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

unsafe fn page_protect(address: *mut c_void, length: usize, prot: c_int) -> bool {
    let page_size = sysconf(30);
    if page_size <= 0 {
        return false;
    }
    let page_size = page_size as usize;
    let start = address as usize & !(page_size - 1);
    let end = (address as usize + length + page_size - 1) & !(page_size - 1);
    mprotect(start as *mut c_void, end - start, prot) == 0
}

unsafe fn clear_instruction_cache(address: *mut c_void, length: usize) {
    let mut cursor = address as usize & !63usize;
    let end = address as usize + length;
    while cursor < end {
        asm!("dc cvau, {0}", in(reg) cursor, options(nostack));
        cursor += 64;
    }
    asm!("dsb ish", options(nostack));
    cursor = address as usize & !63usize;
    while cursor < end {
        asm!("ic ivau, {0}", in(reg) cursor, options(nostack));
        cursor += 64;
    }
    asm!("dsb ish", options(nostack));
    asm!("isb", options(nostack));
}

unsafe fn write_absolute_jump(destination: *mut u8, target: *const c_void) {
    ptr::write_unaligned(destination as *mut u32, ABSOLUTE_JUMP_LDR_X16);
    ptr::write_unaligned(destination.add(4) as *mut u32, ABSOLUTE_JUMP_BR_X16);
    ptr::write_unaligned(destination.add(8) as *mut usize, target as usize);
}

unsafe extern "C" fn marked_add_node(replay: *mut c_void, car: *mut c_void) {
    if let Some(original) = ORIGINAL_ADD_NODE {
        original(replay, car);
    } else {
        return;
    }

    if REPLAY_SIZE.is_null() || REPLAY_NODES.is_null() {
        return;
    }
    let size = ptr::read_volatile(REPLAY_SIZE);
    let nodes = ptr::read_volatile(REPLAY_NODES);
    if size < 1 || nodes.is_null() {
        return;
    }

    let node_index = size - 1;
    let flags = nodes.add(node_index as usize * REPLAY_NODE_SIZE + VISUAL_FLAGS_OFFSET);
    let original_flags = ptr::read_volatile(flags);
    let pulse_on = (node_index / MARKER_FRAMES) & 1 == 0;
    let marker = if pulse_on { MARKER_EXTREME_FLAPS } else { 0 };
    ptr::write_volatile(flags, (original_flags & 0x0f) | marker);
}

unsafe fn install_replay_marker() -> bool {
    if MARKER_INSTALLED {
        return true;
    }

    let add_node = resolve(b"_ZN6Replay7AddNodeEP3Car\0") as *mut u8;
    REPLAY_NODES = resolve(b"g_pReplay\0") as *mut *mut u8;
    REPLAY_SIZE = resolve(b"g_nReplaySize\0") as *mut c_int;
    if add_node.is_null() || REPLAY_NODES.is_null() || REPLAY_SIZE.is_null() {
        return false;
    }
    for (index, expected) in ADD_NODE_PROLOGUE.iter().enumerate() {
        if ptr::read_unaligned(add_node.add(index * 4) as *const u32) != *expected {
            return false;
        }
    }

    let trampoline = mmap(
        ptr::null_mut(),
        32,
        PROT_READ | PROT_WRITE | PROT_EXEC,
        MAP_PRIVATE | MAP_ANONYMOUS,
        -1,
        0,
    ) as *mut u8;
    if trampoline as *mut c_void == MAP_FAILED || trampoline.is_null() {
        return false;
    }
    ptr::copy_nonoverlapping(add_node, trampoline, 16);
    write_absolute_jump(trampoline.add(16), add_node.add(16) as *const c_void);
    clear_instruction_cache(trampoline as *mut c_void, 32);
    ORIGINAL_ADD_NODE = Some(core::mem::transmute::<*mut u8, AddNode>(trampoline));

    if !page_protect(
        add_node as *mut c_void,
        16,
        PROT_READ | PROT_WRITE | PROT_EXEC,
    ) {
        ORIGINAL_ADD_NODE = None;
        return false;
    }
    write_absolute_jump(add_node, marked_add_node as *const c_void);
    clear_instruction_cache(add_node as *mut c_void, 16);
    if !page_protect(add_node as *mut c_void, 16, PROT_READ | PROT_EXEC) {
        return false;
    }
    MARKER_INSTALLED = true;
    true
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_applyUnlimitedCheckpoints(
    _env: *mut c_void,
    _class: *mut c_void,
) -> u8 {
    let address = resolve(b"g_nMaxNumCheckPointTimes\0") as *mut c_int;
    if address.is_null() {
        return 0;
    }
    ptr::write_volatile(address, CHECKPOINT_LIMIT);
    1
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_installReplayVisualMarker(
    _env: *mut c_void,
    _class: *mut c_void,
) -> u8 {
    install_replay_marker() as u8
}
