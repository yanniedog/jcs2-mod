// Link-time stub for libc.so. Exports memory APIs so the real bridge
// records DT_NEEDED=libc.so; Android's real libc satisfies them at runtime.
#![no_std]
#![allow(non_snake_case)]
use core::panic::PanicInfo;

#[panic_handler]
fn panic(_: &PanicInfo) -> ! {
    loop {}
}

#[no_mangle]
pub extern "C" fn mprotect() {}
#[no_mangle]
pub extern "C" fn sysconf() {}
#[no_mangle]
pub extern "C" fn mmap() {}
