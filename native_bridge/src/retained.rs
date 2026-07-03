//! Retained always-on patches: checkpoint capacity and offline IAP ownership.

use crate::*;

pub(crate) const CHECKPOINT_LIMIT: c_int = 999;

pub(crate) const DLC_ITEM_COUNT: usize = 0x200;

pub(crate) const DLC_ITEM_SIZE: usize = 0x870;

pub(crate) const DLC_PURCHASED_OFFSET: usize = 0x5c;

pub(crate) const RETAINED_PATCH_POLL_MICROSECONDS: c_uint = 100_000;

pub(crate) static mut CHECKPOINT_LIMIT_ADDRESS: *mut c_int = ptr::null_mut();

pub(crate) static mut DLC_CONNECTIONS: *mut u8 = ptr::null_mut();

pub(crate) static RETAINED_PATCH_WORKER_STARTED: AtomicBool = AtomicBool::new(false);

pub(crate) unsafe fn force_checkpoint_limit() -> bool {
    if CHECKPOINT_LIMIT_ADDRESS.is_null() {
        CHECKPOINT_LIMIT_ADDRESS = resolve(b"g_nMaxNumCheckPointTimes\0") as *mut c_int;
    }
    if CHECKPOINT_LIMIT_ADDRESS.is_null() {
        return false;
    }
    ptr::write_volatile(CHECKPOINT_LIMIT_ADDRESS, CHECKPOINT_LIMIT);
    true
}

pub(crate) unsafe fn force_iap_ownership() -> bool {
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

pub(crate) unsafe extern "C" fn retained_patch_worker(_argument: *mut c_void) -> *mut c_void {
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

pub(crate) unsafe fn install_retained_patch_worker() -> bool {
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
