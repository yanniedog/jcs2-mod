#![no_std]

use core::ffi::{c_char, c_int, c_void};
use core::panic::PanicInfo;
use core::ptr;

const RTLD_DEFAULT: *mut c_void = 0usize as *mut c_void;
const RTLD_NOW: c_int = 2;
const CHECKPOINT_LIMIT: c_int = 999;

extern "C" {
    fn dlopen(filename: *const c_char, flags: c_int) -> *mut c_void;
    fn dlsym(handle: *mut c_void, symbol: *const c_char) -> *mut c_void;
}

#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
    loop {}
}

unsafe fn resolve_checkpoint_limit() -> *mut c_int {
    let handle = dlopen(b"libtrueaxis.so\0".as_ptr() as *const c_char, RTLD_NOW);
    let mut address = if handle.is_null() {
        ptr::null_mut()
    } else {
        dlsym(
            handle,
            b"g_nMaxNumCheckPointTimes\0".as_ptr() as *const c_char,
        )
    };
    if address.is_null() {
        address = dlsym(
            RTLD_DEFAULT,
            b"g_nMaxNumCheckPointTimes\0".as_ptr() as *const c_char,
        );
    }
    address as *mut c_int
}

#[no_mangle]
pub unsafe extern "C" fn Java_com_trueaxis_modmenu_RequiredPatches_applyUnlimitedCheckpoints(
    _env: *mut c_void,
    _class: *mut c_void,
) -> u8 {
    let address = resolve_checkpoint_limit();
    if address.is_null() {
        return 0;
    }
    ptr::write_volatile(address, CHECKPOINT_LIMIT);
    1
}
