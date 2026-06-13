// Link-time stub for libdl.so. Exports dlopen/dlsym only so the real bridge
// records DT_NEEDED=libdl.so; Android's real libdl satisfies them at runtime.
#![no_std]
#![allow(non_snake_case)]
use core::panic::PanicInfo;

#[panic_handler]
fn panic(_: &PanicInfo) -> ! {
    loop {}
}

#[no_mangle]
pub extern "C" fn dlopen() {}
#[no_mangle]
pub extern "C" fn dlsym() {}
