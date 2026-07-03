//! Raw libc/Bionic FFI declarations and the shared libc constants.

use crate::*;

pub(crate) type ThreadStart = unsafe extern "C" fn(*mut c_void) -> *mut c_void;

extern "C" {
    pub(crate) fn signal(signum: c_int, handler: usize) -> usize;
    pub(crate) fn raise(signum: c_int) -> c_int;
    pub(crate) fn open(pathname: *const c_char, flags: c_int, mode: c_int) -> c_int;
    pub(crate) fn read(fd: c_int, buf: *mut c_void, count: usize) -> isize;
    pub(crate) fn write(fd: c_int, buf: *const c_void, count: usize) -> isize;
    pub(crate) fn lseek(fd: c_int, offset: c_long, whence: c_int) -> c_long;
    pub(crate) fn close(fd: c_int) -> c_int;
    pub(crate) fn dlopen(filename: *const c_char, flags: c_int) -> *mut c_void;
    pub(crate) fn dlsym(handle: *mut c_void, symbol: *const c_char) -> *mut c_void;
    pub(crate) fn mmap(
        address: *mut c_void,
        length: usize,
        protection: c_int,
        flags: c_int,
        fd: c_int,
        offset: c_long,
    ) -> *mut c_void;
    pub(crate) fn mprotect(address: *mut c_void, length: usize, protection: c_int) -> c_int;
    pub(crate) fn pthread_create(
        thread: *mut usize,
        attributes: *const c_void,
        start: ThreadStart,
        argument: *mut c_void,
    ) -> c_int;
    pub(crate) fn pthread_detach(thread: usize) -> c_int;
    pub(crate) fn usleep(microseconds: c_uint) -> c_int;
}

pub(crate) const SIGABRT: c_int = 6;

pub(crate) const SIGBUS: c_int = 7;

pub(crate) const SIGFPE: c_int = 8;

pub(crate) const SIGILL: c_int = 4;

pub(crate) const SIGSEGV: c_int = 11;

pub(crate) const O_WRONLY: c_int = 1;

pub(crate) const O_RDONLY: c_int = 0;

pub(crate) const O_CREAT: c_int = 0o100;

pub(crate) const O_APPEND: c_int = 0o2000;

pub(crate) const SEEK_SET: c_int = 0;

pub(crate) const SEEK_END: c_int = 2;

pub(crate) const PROT_READ: c_int = 1;

pub(crate) const PROT_WRITE: c_int = 2;

pub(crate) const PROT_EXEC: c_int = 4;

pub(crate) const MAP_PRIVATE: c_int = 2;

pub(crate) const MAP_ANONYMOUS: c_int = 0x20;

pub(crate) const MAP_FAILED: *mut c_void = usize::MAX as *mut c_void;

// Heap allocation for the replay-swarm ghost node buffers.
extern "C" {
    pub(crate) fn malloc(size: usize) -> *mut c_void;
    pub(crate) fn free(ptr: *mut c_void);
}
