//! `dlsym` symbol resolution and the AArch64 inline-hook/trampoline machinery.

#[cfg(target_arch = "aarch64")]
use core::arch::asm;

use crate::*;

pub(crate) const RTLD_DEFAULT: *mut c_void = 0usize as *mut c_void;

pub(crate) const RTLD_NOW: c_int = 2;

pub(crate) const HOOK_STUB_BYTES: usize = 16;

pub(crate) const TRAMPOLINE_BYTES: usize = 32;

pub(crate) const PAGE_SIZE: usize = 4096;

pub(crate) static mut TRUEAXIS_HANDLE: *mut c_void = ptr::null_mut();

pub(crate) unsafe fn trueaxis_handle() -> *mut c_void {
    if TRUEAXIS_HANDLE.is_null() {
        TRUEAXIS_HANDLE = dlopen(b"libtrueaxis.so\0".as_ptr() as *const c_char, RTLD_NOW);
    }
    TRUEAXIS_HANDLE
}

pub(crate) unsafe fn resolve(name: &'static [u8]) -> *mut c_void {
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

pub(crate) unsafe fn page_start(address: *mut u8) -> *mut c_void {
    ((address as usize) & !(PAGE_SIZE - 1)) as *mut c_void
}

#[cfg(target_arch = "aarch64")]
pub(crate) unsafe fn clear_instruction_cache(address: *mut u8, length: usize) {
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
pub(crate) unsafe fn clear_instruction_cache(_address: *mut u8, _length: usize) {
    core::sync::atomic::compiler_fence(Ordering::SeqCst);
}

pub(crate) unsafe fn write_u32(address: *mut u8, value: u32) {
    ptr::write_unaligned(address as *mut u32, value);
}

pub(crate) unsafe fn write_u64(address: *mut u8, value: u64) {
    ptr::write_unaligned(address as *mut u64, value);
}

pub(crate) unsafe fn write_absolute_branch_stub(address: *mut u8, destination: *const c_void) {
    // ldr x16, #8; br x16; .quad destination
    write_u32(address, 0x5800_0050);
    write_u32(address.add(4), 0xd61f_0200);
    write_u64(address.add(8), destination as u64);
}

pub(crate) unsafe fn install_inline_hook(
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
