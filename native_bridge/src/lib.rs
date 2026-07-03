//! JCS2 community mod native bridge (`libjcs2mod.so`).
//!
//! One crate namespace split into topical modules: every module glob-imports
//! `crate::*` and the root re-exports every module, so items keep the same
//! unqualified names they had when this lived in a single file.
#![no_std]

mod crash;
mod debug_log;
mod ffi;
mod free_camera;
mod hook;
mod jni;
mod replay_camera;
mod retained;
mod splits;
mod swarm;
mod user_track;

pub(crate) use core::ffi::{c_char, c_int, c_long, c_uint, c_void};
pub(crate) use core::sync::atomic::{AtomicBool, AtomicI32, AtomicU8, Ordering};
pub(crate) use core::{mem, ptr};

pub(crate) use crash::*;
pub(crate) use debug_log::*;
pub(crate) use ffi::*;
pub(crate) use free_camera::*;
pub(crate) use hook::*;
pub(crate) use retained::*;
pub(crate) use splits::*;
pub(crate) use swarm::*;
pub(crate) use user_track::*;

use core::panic::PanicInfo;

#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
    loop {}
}
