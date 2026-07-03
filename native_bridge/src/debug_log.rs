//! Structured debug/agent log lines appended to the public log directory.

use crate::*;

pub(crate) const DEBUG_AGENT_LOG_PATH: &[u8] =
    b"/storage/emulated/0/YCS2CommunityMod/logs/debug-cf277a.log\0";

pub(crate) fn probe_push(buf: &mut [u8; 512], len: &mut usize, bytes: &[u8]) {
    for &b in bytes {
        if *len < buf.len() {
            buf[*len] = b;
            *len += 1;
        }
    }
}

pub(crate) fn probe_push_i32(buf: &mut [u8; 512], len: &mut usize, value: i32) {
    let mut digits = [0u8; 12];
    let mut n = value;
    let mut count = 0usize;
    if n < 0 {
        probe_push(buf, len, b"-");
    }
    loop {
        let digit = (n % 10).unsigned_abs() as u8;
        digits[count] = b'0' + digit;
        count += 1;
        n /= 10;
        if n == 0 {
            break;
        }
    }
    while count > 0 {
        count -= 1;
        probe_push(buf, len, &digits[count..count + 1]);
    }
}

/// #region agent log
pub(crate) fn debug_agent_log(
    hypothesis_id: &str,
    location: &str,
    message: &str,
    data: &[(&str, i32)],
) {
    let mut buf = [0u8; 512];
    let mut len = 0usize;
    probe_push(
        &mut buf,
        &mut len,
        b"{\"sessionId\":\"cf277a\",\"hypothesisId\":\"",
    );
    probe_push(&mut buf, &mut len, hypothesis_id.as_bytes());
    probe_push(&mut buf, &mut len, b"\",\"location\":\"");
    probe_push(&mut buf, &mut len, location.as_bytes());
    probe_push(&mut buf, &mut len, b"\",\"message\":\"");
    probe_push(&mut buf, &mut len, message.as_bytes());
    probe_push(&mut buf, &mut len, b"\",\"data\":{");
    for (index, (key, value)) in data.iter().enumerate() {
        if index > 0 {
            probe_push(&mut buf, &mut len, b",");
        }
        probe_push(&mut buf, &mut len, b"\"");
        probe_push(&mut buf, &mut len, key.as_bytes());
        probe_push(&mut buf, &mut len, b"\":");
        probe_push_i32(&mut buf, &mut len, *value);
    }
    probe_push(&mut buf, &mut len, b"}}\n");
    unsafe {
        let fd = open(
            DEBUG_AGENT_LOG_PATH.as_ptr() as *const c_char,
            O_WRONLY | O_CREAT | O_APPEND,
            0o644,
        );
        if fd >= 0 {
            write(fd, buf.as_ptr() as *const c_void, len);
            close(fd);
        }
    }
}

/// #endregion
pub(crate) fn probe_push_vec(
    buf: &mut [u8; 512],
    len: &mut usize,
    tag: &[u8],
    v: Option<[f32; 3]>,
) {
    probe_push(buf, len, tag);
    match v {
        Some(v) => {
            for (i, value) in v.iter().enumerate() {
                if i > 0 {
                    probe_push(buf, len, b",");
                }
                probe_push_i32(buf, len, (*value * 10.0) as i32);
            }
        }
        None => probe_push(buf, len, b"none"),
    }
}
