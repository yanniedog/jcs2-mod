//! Stock leaderboard rows (`g_leaderboard`) for the replay-swarm picker.

use crate::*;

/// `g_leaderboard` object size from libtrueaxis.so RE.
pub(crate) const LEADERBOARD_OBJECT_SIZE: usize = 0x2a8;

/// Entry count: `*(g_leaderboard + 0x160)`.
pub(crate) const LEADERBOARD_COUNT_OFFSET: usize = 0x160;

/// Level / difficulty id used in `d=%d&scoreId=%d` replay download keys.
pub(crate) const LEADERBOARD_LEVEL_ID_OFFSET: usize = 0x10;

/// Parallel player-name pointer table: `char*` at `0x38 + index * 0x20`.
pub(crate) const LEADERBOARD_NAMES_OFFSET: usize = 0x38;

pub(crate) const LEADERBOARD_NAME_STRIDE: usize = 0x20;

/// Row array base: `g_leaderboard + 0x16c`, `0x20` bytes per entry.
pub(crate) const LEADERBOARD_ROWS_OFFSET: usize = 0x16c;

pub(crate) const LEADERBOARD_ROW_STRIDE: usize = 0x20;

/// Finish / display time in milliseconds (`PopulateLeaderboard` reads `[row + 0xc]`).
pub(crate) const LEADERBOARD_ROW_TIME_OFFSET: usize = 0xc;

/// Server score id passed to `UiControlButton` and `d=%d&scoreId=%d` downloads.
pub(crate) const LEADERBOARD_ROW_SCORE_ID_OFFSET: usize = 0x4;

/// UTF-8 player name pointer on the row (`ldur x1, [row + 0x14]`).
pub(crate) const LEADERBOARD_ROW_NAME_PTR_OFFSET: usize = 0x14;

pub(crate) const LEADERBOARD_NAME_BYTES: usize = 64;

pub(crate) static mut G_LEADERBOARD: *mut u8 = ptr::null_mut();

pub(crate) unsafe fn ensure_leaderboard_symbols() -> bool {
    if G_LEADERBOARD.is_null() {
        G_LEADERBOARD = resolve(b"g_leaderboard\0") as *mut u8;
    }
    !G_LEADERBOARD.is_null()
}

pub(crate) unsafe fn leaderboard_base() -> *mut u8 {
    if !ensure_leaderboard_symbols() {
        return ptr::null_mut();
    }
    G_LEADERBOARD
}

pub(crate) unsafe fn leaderboard_entry_count() -> i32 {
    let base = leaderboard_base();
    if base.is_null() {
        return 0;
    }
    let count = ptr::read_volatile((base.add(LEADERBOARD_COUNT_OFFSET)) as *const i32);
    if count < 0 {
        0
    } else if count > 256 {
        256
    } else {
        count
    }
}

pub(crate) unsafe fn leaderboard_level_id() -> i32 {
    let base = leaderboard_base();
    if base.is_null() {
        return 0;
    }
    ptr::read_volatile((base.add(LEADERBOARD_LEVEL_ID_OFFSET)) as *const i32)
}

pub(crate) unsafe fn leaderboard_row_ptr(index: i32) -> *const u8 {
    let base = leaderboard_base();
    if base.is_null() || index < 0 {
        return ptr::null();
    }
    base.add(LEADERBOARD_ROWS_OFFSET)
        .add((index as usize) * LEADERBOARD_ROW_STRIDE)
}

pub(crate) unsafe fn leaderboard_read_entry(
    index: i32,
    out_time_ms: *mut i32,
    out_score_id: *mut i32,
    out_name: *mut u8,
    out_name_cap: usize,
) -> bool {
    if out_time_ms.is_null() || out_score_id.is_null() || out_name.is_null() || out_name_cap == 0 {
        return false;
    }
    if index < 0 || index >= leaderboard_entry_count() {
        return false;
    }
    let row = leaderboard_row_ptr(index);
    if row.is_null() {
        return false;
    }
    ptr::write(
        out_time_ms,
        ptr::read_volatile(row.add(LEADERBOARD_ROW_TIME_OFFSET) as *const i32),
    );
    ptr::write(
        out_score_id,
        ptr::read_volatile(row.add(LEADERBOARD_ROW_SCORE_ID_OFFSET) as *const i32),
    );

    let mut name_ptr = ptr::read_volatile(row.add(LEADERBOARD_ROW_NAME_PTR_OFFSET) as *const u8);
    if name_ptr.is_null() {
        let base = leaderboard_base();
        if !base.is_null() {
            name_ptr = ptr::read_volatile(
                (base.add(LEADERBOARD_NAMES_OFFSET)
                    .add((index as usize) * LEADERBOARD_NAME_STRIDE)) as *const *const u8,
            );
        }
    }
    let mut written = 0usize;
    if !name_ptr.is_null() {
        while written + 1 < out_name_cap {
            let byte = ptr::read_volatile(name_ptr.add(written));
            ptr::write(out_name.add(written), byte);
            written += 1;
            if byte == 0 {
                break;
            }
        }
    }
    if written == 0 {
        ptr::write(out_name, 0);
    } else if written >= out_name_cap {
        ptr::write(out_name.add(out_name_cap - 1), 0);
    }
    true
}

/// Leaderboard rows are populated on the level-detail screen (not during passive replay).
pub(crate) unsafe fn leaderboard_ready() -> bool {
    if !REPLAY_SWARM_ENABLED.load(Ordering::Acquire) {
        return false;
    }
    leaderboard_entry_count() > 0
}

pub(crate) unsafe fn leaderboard_format_time_ms(time_ms: i32, out: *mut u8, out_cap: usize) -> i32 {
    if out.is_null() || out_cap < 8 {
        return 0;
    }
    let mut ms = time_ms.max(0);
    let minutes = ms / 60000;
    ms %= 60000;
    let seconds = ms / 1000;
    let millis = ms % 1000;

    let mut buf = [0u8; 16];
    let mut len = 0usize;
    let mut append_digit =
        |buf: &mut [u8; 16], len: &mut usize, tens: i32, ones: i32| {
            if *len < buf.len() {
                buf[*len] = b'0' + tens as u8;
                *len += 1;
            }
            if *len < buf.len() {
                buf[*len] = b'0' + ones as u8;
                *len += 1;
            }
        };
    let minute_tens = (minutes / 10) as i32;
    let minute_ones = (minutes % 10) as i32;
    append_digit(&mut buf, &mut len, minute_tens, minute_ones);
    if len < buf.len() {
        buf[len] = b':';
        len += 1;
    }
    append_digit(&mut buf, &mut len, (seconds / 10) as i32, (seconds % 10) as i32);
    if len < buf.len() {
        buf[len] = b'.';
        len += 1;
    }
    if len < buf.len() {
        buf[len] = b'0' + ((millis / 100) % 10) as u8;
        len += 1;
    }
    if len < buf.len() {
        buf[len] = b'0' + ((millis / 10) % 10) as u8;
        len += 1;
    }
    if len < buf.len() {
        buf[len] = b'0' + (millis % 10) as u8;
        len += 1;
    }
    let write_len = if len > out_cap - 1 { out_cap - 1 } else { len };
    ptr::copy_nonoverlapping(buf.as_ptr(), out, write_len);
    ptr::write(out.add(write_len), 0);
    write_len as i32
}
