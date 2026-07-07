//! User-track Create/Pause switches (laps, boost regen), the on-disk track
//! flag marker, and the level-load hooks that apply the stored settings.

use crate::*;

pub(crate) const USER_TRACK_FLAG_LAPS: u8 = 0x01;

pub(crate) const USER_TRACK_FLAG_BOOST_REGEN: u8 = 0x02;

/// Waypoint/checkpoint-marker gameplay (the stock Time Trial level type).
/// Only settable in the YCS2 Create menu; stored in the same on-disk marker
/// as laps/boost-regen, so existing user levels and stock levels can never
/// acquire it.
pub(crate) const USER_TRACK_FLAG_WAYPOINTS: u8 = 0x04;

pub(crate) const USER_TRACK_FLAGS_MAGIC_V1: &[u8] = b"YCS2TRACKFLAGS:1:";

pub(crate) const USER_TRACK_FLAGS_MAGIC_V2: &[u8] = b"YCS2TRACKFLAGS:2:";

pub(crate) const USER_TRACK_FLAGS_MAX_SCAN: usize = 256;

pub(crate) const LEVEL_TYPE_OFFSET: usize = 0x50;

pub(crate) const LEVEL_LAP_COUNT_OFFSET: usize = 0x58;

pub(crate) const LEVEL_TYPE_LAPS: c_int = 3;

pub(crate) const DEFAULT_LAP_COUNT: c_int = 3;

pub(crate) const MIN_LAP_COUNT: u8 = 2;

pub(crate) const MAX_LAP_COUNT: u8 = 9;

pub(crate) const CAR_FUEL_OFFSET: usize = 0x128;

pub(crate) const INGAME_LEVEL_EDITOR_SAVE_HOOK_BYTES: usize = 16;

pub(crate) const INGAME_LEVEL_EDITOR_LOAD_HOOK_BYTES: usize = 16;

pub(crate) const UIFORM_CREATE_CTOR_HOOK_BYTES: usize = 16;

pub(crate) const UIFORM_PAUSE_CTOR_HOOK_BYTES: usize = 16;

pub(crate) const WORLD_LOAD_HOOK_BYTES: usize = 16;

pub(crate) const GAME_LOAD_LEVEL_HOOK_BYTES: usize = 16;

pub(crate) const GAME_ON_CHECKPOINT_HOOK_BYTES: usize = 16;

pub(crate) const UI_CONTROL_BUTTON_SIZE: usize = 0x130;

pub(crate) const UIFORM_CREATE_CAR_PANEL_X: c_int = 0x0d7;

pub(crate) const UIFORM_CREATE_CAR_PANEL_Y: c_int = 0x07d;

pub(crate) const USER_TRACK_SWITCH_LOCAL_X: c_int = 0x2cc;

pub(crate) const USER_TRACK_LAPS_BUTTON_X: c_int =
    UIFORM_CREATE_CAR_PANEL_X + USER_TRACK_SWITCH_LOCAL_X;

pub(crate) const USER_TRACK_LAPS_BUTTON_Y: c_int = UIFORM_CREATE_CAR_PANEL_Y + 0x2a;

pub(crate) const USER_TRACK_BOOST_BUTTON_X: c_int =
    UIFORM_CREATE_CAR_PANEL_X + USER_TRACK_SWITCH_LOCAL_X;

pub(crate) const USER_TRACK_BOOST_BUTTON_Y: c_int = UIFORM_CREATE_CAR_PANEL_Y + 0x7f;

pub(crate) const USER_TRACK_WAYPOINTS_BUTTON_X: c_int =
    UIFORM_CREATE_CAR_PANEL_X + USER_TRACK_SWITCH_LOCAL_X;

/// Same vertical spacing below the boost switch as boost sits below laps.
pub(crate) const USER_TRACK_WAYPOINTS_BUTTON_Y: c_int = UIFORM_CREATE_CAR_PANEL_Y + 0xd4;

pub(crate) const USER_TRACK_SWITCH_BUTTON_WIDTH: c_int = 0x1b8;

pub(crate) const USER_TRACK_SWITCH_BUTTON_HEIGHT: c_int = 0x48;

pub(crate) const UI_LABEL_FLAG_DEFAULT: c_int = 0x101;

pub(crate) type InGameLevelEditorSaveFn = unsafe extern "C" fn(*mut c_void, *mut c_char) -> c_int;

pub(crate) type InGameLevelEditorLoadFn = unsafe extern "C" fn(*mut c_void, *const c_char);

pub(crate) type UiFormCreateCtorFn = unsafe extern "C" fn(*mut c_void);

pub(crate) type UiFormPauseCtorFn = unsafe extern "C" fn(*mut c_void);

pub(crate) type WorldLoadFn = unsafe extern "C" fn(*mut c_void, *const c_char, u8, c_uint) -> c_int;

pub(crate) type GameLoadLevelFn = unsafe extern "C" fn(*mut c_void, c_uint, c_int) -> c_int;

pub(crate) type GameOnCheckpointFn = unsafe extern "C" fn(*mut c_void, *const c_void, c_int);

pub(crate) type LevelsGetUserLevelFn = unsafe extern "C" fn(c_uint) -> *mut u8;

pub(crate) type LevelsGetUserLevelFileNameFn = unsafe extern "C" fn(c_uint) -> *const c_char;

pub(crate) type OperatorNewFn = unsafe extern "C" fn(usize) -> *mut c_void;

pub(crate) type WStringCtorCharFn = unsafe extern "C" fn(*mut WString, *const c_char);

pub(crate) type WStringDtorFn = unsafe extern "C" fn(*mut WString);

pub(crate) type UiControlButtonCtorLabelFn = unsafe extern "C" fn(
    *mut c_void,
    *const UiRectangle,
    *const UiControlLabelConstructionProperties,
    unsafe extern "C" fn(*mut c_void),
);

pub(crate) type UiControlButtonSetLabelFn =
    unsafe extern "C" fn(*mut c_void, *const UiControlLabelConstructionProperties);

pub(crate) type UiControlAddControlFn = unsafe extern "C" fn(*mut c_void, *mut c_void);

pub(crate) type UiControlSetRenderBackgroundFn = unsafe extern "C" fn(*mut c_void, *const c_void);

#[repr(C)]
pub(crate) struct UiPoint {
    pub(crate) x: c_int,
    pub(crate) y: c_int,
}

#[repr(C)]
pub(crate) struct UiRectangle {
    pub(crate) x: c_int,
    pub(crate) y: c_int,
    pub(crate) width: c_int,
    pub(crate) height: c_int,
}

#[repr(C)]
pub(crate) struct WString {
    pub(crate) words: [usize; 2],
}

#[repr(C)]
pub(crate) struct UiControlLabelConstructionProperties {
    pub(crate) position: UiPoint,
    pub(crate) text: WString,
    pub(crate) scale_x: f32,
    pub(crate) scale_y: f32,
    pub(crate) font: *mut c_void,
    pub(crate) colour: [f32; 4],
    pub(crate) flags: c_int,
    pub(crate) padding: c_int,
}

pub(crate) static mut LEVELS_GET_USER_LEVEL: *mut c_void = ptr::null_mut();

pub(crate) static mut LEVELS_GET_USER_LEVEL_FILE_NAME: *mut c_void = ptr::null_mut();

pub(crate) static mut OPERATOR_NEW: *mut c_void = ptr::null_mut();

pub(crate) static mut WSTRING_CTOR_CHAR: *mut c_void = ptr::null_mut();

pub(crate) static mut WSTRING_DTOR: *mut c_void = ptr::null_mut();

pub(crate) static mut UI_CONTROL_BUTTON_CTOR_LABEL: *mut c_void = ptr::null_mut();

pub(crate) static mut UI_CONTROL_BUTTON_SET_LABEL: *mut c_void = ptr::null_mut();

pub(crate) static mut UI_CONTROL_ADD_CONTROL: *mut c_void = ptr::null_mut();

pub(crate) static mut UI_CONTROL_SET_RENDER_BACKGROUND: *mut c_void = ptr::null_mut();

pub(crate) static mut UIFORM_CREATE_RENDER_BUTTON_BACKGROUND_STUB: *mut c_void = ptr::null_mut();

pub(crate) static mut UIFORM_CREATE_CTOR_TRAMPOLINE: *mut c_void = ptr::null_mut();

pub(crate) static mut UIFORM_PAUSE_CTOR_TRAMPOLINE: *mut c_void = ptr::null_mut();

pub(crate) static mut INGAME_LEVEL_EDITOR_SAVE_TRAMPOLINE: *mut c_void = ptr::null_mut();

pub(crate) static mut INGAME_LEVEL_EDITOR_LOAD_TRAMPOLINE: *mut c_void = ptr::null_mut();

pub(crate) static mut G_P_INGAME_LEVEL_EDITOR: *mut *mut c_void = ptr::null_mut();

pub(crate) static mut WORLD_LOAD_TRAMPOLINE: *mut c_void = ptr::null_mut();

pub(crate) static mut GAME_LOAD_LEVEL_TRAMPOLINE: *mut c_void = ptr::null_mut();

pub(crate) static mut GAME_ON_CHECKPOINT_TRAMPOLINE: *mut c_void = ptr::null_mut();

pub(crate) static mut USER_TRACK_LAPS_BUTTON: *mut c_void = ptr::null_mut();

pub(crate) static mut USER_TRACK_BOOST_REGEN_BUTTON: *mut c_void = ptr::null_mut();

pub(crate) static mut USER_TRACK_WAYPOINTS_BUTTON: *mut c_void = ptr::null_mut();

pub(crate) static USER_TRACK_HOOKS_INSTALLED: AtomicBool = AtomicBool::new(false);

pub(crate) static USER_TRACK_CREATE_FLAGS_ARMED: AtomicBool = AtomicBool::new(false);

pub(crate) static USER_TRACK_FLAGS_TOUCHED: AtomicBool = AtomicBool::new(false);

pub(crate) static USER_TRACK_PENDING_FLAGS: AtomicU8 = AtomicU8::new(0);

pub(crate) static USER_TRACK_PENDING_LAP_COUNT: AtomicU8 = AtomicU8::new(0);

pub(crate) static CURRENT_USER_TRACK_FLAGS: AtomicU8 = AtomicU8::new(0);

pub(crate) static CURRENT_USER_TRACK_LAP_COUNT: AtomicU8 = AtomicU8::new(0);

pub(crate) unsafe fn ensure_user_track_symbols() {
    if LEVELS_GET_USER_LEVEL.is_null() {
        LEVELS_GET_USER_LEVEL = resolve(b"_Z19Levels_GetUserLevelj\0");
    }
    if LEVELS_GET_USER_LEVEL_FILE_NAME.is_null() {
        LEVELS_GET_USER_LEVEL_FILE_NAME = resolve(b"_Z27Levels_GetUserLevelFileNamej\0");
    }
    if OPERATOR_NEW.is_null() {
        OPERATOR_NEW = resolve(b"_Znwm\0");
    }
    if WSTRING_CTOR_CHAR.is_null() {
        WSTRING_CTOR_CHAR = resolve(b"_ZN7WStringC1EPKc\0");
    }
    if WSTRING_DTOR.is_null() {
        WSTRING_DTOR = resolve(b"_ZN7WStringD1Ev\0");
    }
    if UI_CONTROL_BUTTON_CTOR_LABEL.is_null() {
        UI_CONTROL_BUTTON_CTOR_LABEL =
            resolve(b"_ZN15UiControlButtonC1ERK11UiRectangleRKN14UiControlLabel22ConstructionPropertiesEPFvPS_E\0");
    }
    if UI_CONTROL_BUTTON_SET_LABEL.is_null() {
        UI_CONTROL_BUTTON_SET_LABEL = resolve(
            b"_ZN15UiControlButton8SetLabelERKN14UiControlLabel22ConstructionPropertiesE\0",
        );
    }
    if UI_CONTROL_ADD_CONTROL.is_null() {
        UI_CONTROL_ADD_CONTROL = resolve(b"_ZN9UiControl10AddControlERS_\0");
    }
    if UI_CONTROL_SET_RENDER_BACKGROUND.is_null() {
        UI_CONTROL_SET_RENDER_BACKGROUND =
            resolve(b"_ZN9UiControl27SetRenderBackgroundFunctionEPFvPS_RK11UiRectangleE\0");
    }
    if UIFORM_CREATE_RENDER_BUTTON_BACKGROUND_STUB.is_null() {
        UIFORM_CREATE_RENDER_BUTTON_BACKGROUND_STUB = resolve(
            b"_ZN12UiFormCreate28OnRenderButtonBackgroundStubEP9UiControlRK11UiRectangle\0",
        );
    }
}

pub(crate) unsafe fn create_form_ui_symbols_ready() -> bool {
    ensure_user_track_symbols();
    !(OPERATOR_NEW.is_null()
        || WSTRING_CTOR_CHAR.is_null()
        || WSTRING_DTOR.is_null()
        || UI_CONTROL_BUTTON_CTOR_LABEL.is_null()
        || UI_CONTROL_BUTTON_SET_LABEL.is_null()
        || UI_CONTROL_ADD_CONTROL.is_null()
        || UI_CONTROL_SET_RENDER_BACKGROUND.is_null()
        || UIFORM_CREATE_RENDER_BUTTON_BACKGROUND_STUB.is_null())
}

pub(crate) unsafe fn label_props(text: *const c_char) -> UiControlLabelConstructionProperties {
    let mut props = UiControlLabelConstructionProperties {
        position: UiPoint { x: 0x14, y: 0x26 },
        text: WString { words: [0; 2] },
        scale_x: 0.58,
        scale_y: 0.58,
        font: ptr::null_mut(),
        colour: [1.0, 1.0, 1.0, 1.0],
        flags: UI_LABEL_FLAG_DEFAULT,
        padding: 0,
    };
    let ctor: WStringCtorCharFn = mem::transmute(WSTRING_CTOR_CHAR);
    ctor(&mut props.text, text);
    props
}

pub(crate) unsafe fn destroy_label_props(props: &mut UiControlLabelConstructionProperties) {
    let dtor: WStringDtorFn = mem::transmute(WSTRING_DTOR);
    dtor(&mut props.text);
}

pub(crate) unsafe fn label_for_switch(
    flag: u8,
    on: *const c_char,
    off: *const c_char,
) -> *const c_char {
    if (USER_TRACK_PENDING_FLAGS.load(Ordering::Acquire) & flag) != 0 {
        on
    } else {
        off
    }
}

pub(crate) unsafe fn set_switch_button_label(button: *mut c_void, text: *const c_char) {
    if button.is_null() || UI_CONTROL_BUTTON_SET_LABEL.is_null() || WSTRING_CTOR_CHAR.is_null() {
        return;
    }
    let mut props = label_props(text);
    let set_label: UiControlButtonSetLabelFn = mem::transmute(UI_CONTROL_BUTTON_SET_LABEL);
    set_label(button, &props);
    destroy_label_props(&mut props);
}

pub(crate) unsafe fn refresh_user_track_create_switch_labels() {
    static mut LAPS_LABEL: [u8; 16] = [0; 16];
    let laps_text =
        if (USER_TRACK_PENDING_FLAGS.load(Ordering::Acquire) & USER_TRACK_FLAG_LAPS) == 0 {
            b"LAPS: OFF\0".as_ptr()
        } else {
            let count = USER_TRACK_PENDING_LAP_COUNT.load(Ordering::Acquire);
            LAPS_LABEL[0] = b'L';
            LAPS_LABEL[1] = b'A';
            LAPS_LABEL[2] = b'P';
            LAPS_LABEL[3] = b'S';
            LAPS_LABEL[4] = b':';
            LAPS_LABEL[5] = b' ';
            LAPS_LABEL[6] = b'0' + count;
            LAPS_LABEL[7] = 0;
            LAPS_LABEL.as_ptr()
        };
    set_switch_button_label(USER_TRACK_LAPS_BUTTON, laps_text as *const c_char);
    set_switch_button_label(
        USER_TRACK_BOOST_REGEN_BUTTON,
        label_for_switch(
            USER_TRACK_FLAG_BOOST_REGEN,
            b"BOOST REGEN: ON\0".as_ptr() as *const c_char,
            b"BOOST REGEN: OFF\0".as_ptr() as *const c_char,
        ),
    );
    set_switch_button_label(
        USER_TRACK_WAYPOINTS_BUTTON,
        label_for_switch(
            USER_TRACK_FLAG_WAYPOINTS,
            b"WAYPOINTS: ON\0".as_ptr() as *const c_char,
            b"WAYPOINTS: OFF\0".as_ptr() as *const c_char,
        ),
    );
}

pub(crate) unsafe fn cycle_user_track_lap_count() {
    let flags = USER_TRACK_PENDING_FLAGS.load(Ordering::Acquire);
    if (flags & USER_TRACK_FLAG_LAPS) == 0 {
        USER_TRACK_PENDING_FLAGS.store(flags | USER_TRACK_FLAG_LAPS, Ordering::Release);
        USER_TRACK_PENDING_LAP_COUNT.store(MIN_LAP_COUNT, Ordering::Release);
    } else {
        let count = USER_TRACK_PENDING_LAP_COUNT.load(Ordering::Acquire);
        if count < MAX_LAP_COUNT {
            USER_TRACK_PENDING_LAP_COUNT.store(count + 1, Ordering::Release);
        } else {
            USER_TRACK_PENDING_FLAGS.store(flags & !USER_TRACK_FLAG_LAPS, Ordering::Release);
            USER_TRACK_PENDING_LAP_COUNT.store(0, Ordering::Release);
        }
    }
    USER_TRACK_CREATE_FLAGS_ARMED.store(true, Ordering::Release);
    USER_TRACK_FLAGS_TOUCHED.store(true, Ordering::Release);
    refresh_user_track_create_switch_labels();
}

pub(crate) unsafe fn toggle_user_track_create_flag(flag: u8) {
    let current = USER_TRACK_PENDING_FLAGS.load(Ordering::Acquire);
    USER_TRACK_PENDING_FLAGS.store(current ^ flag, Ordering::Release);
    USER_TRACK_CREATE_FLAGS_ARMED.store(true, Ordering::Release);
    USER_TRACK_FLAGS_TOUCHED.store(true, Ordering::Release);
    refresh_user_track_create_switch_labels();
}

pub(crate) unsafe extern "C" fn on_laps_create_switch_clicked(_button: *mut c_void) {
    cycle_user_track_lap_count();
}

pub(crate) unsafe extern "C" fn on_boost_regen_create_switch_clicked(_button: *mut c_void) {
    toggle_user_track_create_flag(USER_TRACK_FLAG_BOOST_REGEN);
}

pub(crate) unsafe extern "C" fn on_waypoints_create_switch_clicked(_button: *mut c_void) {
    toggle_user_track_create_flag(USER_TRACK_FLAG_WAYPOINTS);
}

pub(crate) unsafe fn add_create_switch_button(
    panel: *mut c_void,
    x: c_int,
    y: c_int,
    text: *const c_char,
    callback: unsafe extern "C" fn(*mut c_void),
) -> *mut c_void {
    if panel.is_null() || !create_form_ui_symbols_ready() {
        return ptr::null_mut();
    }

    let new_object: OperatorNewFn = mem::transmute(OPERATOR_NEW);
    let button = new_object(UI_CONTROL_BUTTON_SIZE);
    if button.is_null() {
        return ptr::null_mut();
    }

    let rect = UiRectangle {
        x,
        y,
        width: USER_TRACK_SWITCH_BUTTON_WIDTH,
        height: USER_TRACK_SWITCH_BUTTON_HEIGHT,
    };
    let mut props = label_props(text);
    let ctor: UiControlButtonCtorLabelFn = mem::transmute(UI_CONTROL_BUTTON_CTOR_LABEL);
    ctor(button, &rect, &props, callback);
    destroy_label_props(&mut props);

    let set_background: UiControlSetRenderBackgroundFn =
        mem::transmute(UI_CONTROL_SET_RENDER_BACKGROUND);
    set_background(button, UIFORM_CREATE_RENDER_BUTTON_BACKGROUND_STUB);

    let add_control: UiControlAddControlFn = mem::transmute(UI_CONTROL_ADD_CONTROL);
    add_control(panel, button);
    button
}

pub(crate) unsafe fn add_user_track_switches(form: *mut c_void, reset_flags: bool) {
    if form.is_null() {
        return;
    }
    if reset_flags {
        begin_user_track_create_flags();
    } else {
        USER_TRACK_CREATE_FLAGS_ARMED.store(true, Ordering::Release);
        USER_TRACK_FLAGS_TOUCHED.store(false, Ordering::Release);
    }
    // These must be root children. A later stock sibling covers the car panel in hit-testing.
    USER_TRACK_LAPS_BUTTON = add_create_switch_button(
        form,
        USER_TRACK_LAPS_BUTTON_X,
        USER_TRACK_LAPS_BUTTON_Y,
        b"LAPS: OFF\0".as_ptr() as *const c_char,
        on_laps_create_switch_clicked,
    );
    USER_TRACK_BOOST_REGEN_BUTTON = add_create_switch_button(
        form,
        USER_TRACK_BOOST_BUTTON_X,
        USER_TRACK_BOOST_BUTTON_Y,
        b"BOOST REGEN: OFF\0".as_ptr() as *const c_char,
        on_boost_regen_create_switch_clicked,
    );
    USER_TRACK_WAYPOINTS_BUTTON = add_create_switch_button(
        form,
        USER_TRACK_WAYPOINTS_BUTTON_X,
        USER_TRACK_WAYPOINTS_BUTTON_Y,
        b"WAYPOINTS: OFF\0".as_ptr() as *const c_char,
        on_waypoints_create_switch_clicked,
    );
    if !reset_flags {
        refresh_user_track_create_switch_labels();
    }
}

pub(crate) unsafe fn add_user_track_create_switches(form: *mut c_void) {
    add_user_track_switches(form, true);
}

pub(crate) unsafe fn ingame_level_editor_active() -> bool {
    if G_P_INGAME_LEVEL_EDITOR.is_null() {
        G_P_INGAME_LEVEL_EDITOR = resolve(b"g_pInGameLevelEditor\0") as *mut *mut c_void;
    }
    !G_P_INGAME_LEVEL_EDITOR.is_null() && !ptr::read_volatile(G_P_INGAME_LEVEL_EDITOR).is_null()
}

pub(crate) unsafe fn begin_user_track_create_flags() {
    USER_TRACK_PENDING_FLAGS.store(0, Ordering::Release);
    USER_TRACK_PENDING_LAP_COUNT.store(0, Ordering::Release);
    USER_TRACK_CREATE_FLAGS_ARMED.store(true, Ordering::Release);
    USER_TRACK_FLAGS_TOUCHED.store(false, Ordering::Release);
}

pub(crate) unsafe fn cancel_user_track_create_flags() {
    USER_TRACK_PENDING_FLAGS.store(0, Ordering::Release);
    USER_TRACK_PENDING_LAP_COUNT.store(0, Ordering::Release);
    USER_TRACK_CREATE_FLAGS_ARMED.store(false, Ordering::Release);
    USER_TRACK_FLAGS_TOUCHED.store(false, Ordering::Release);
}

pub(crate) unsafe fn store_user_track_settings(flags: u8, lap_count: u8) {
    CURRENT_USER_TRACK_FLAGS.store(flags, Ordering::Release);
    CURRENT_USER_TRACK_LAP_COUNT.store(lap_count, Ordering::Release);
}

pub(crate) fn normalized_lap_count(lap_count: u8) -> u8 {
    if lap_count >= MIN_LAP_COUNT && lap_count <= MAX_LAP_COUNT {
        lap_count
    } else {
        DEFAULT_LAP_COUNT as u8
    }
}

pub(crate) fn effective_lap_count(lap_count: u8) -> c_int {
    normalized_lap_count(lap_count) as c_int
}

pub(crate) fn marker_flags_byte(flags: u8) -> u8 {
    b'0' + (flags
        & (USER_TRACK_FLAG_LAPS | USER_TRACK_FLAG_BOOST_REGEN | USER_TRACK_FLAG_WAYPOINTS))
}

pub(crate) fn marker_lap_count_byte(flags: u8, lap_count: u8) -> u8 {
    if (flags & USER_TRACK_FLAG_LAPS) == 0 {
        b'0'
    } else {
        b'0' + normalized_lap_count(lap_count)
    }
}

pub(crate) fn parse_marker_flags(value: u8) -> u8 {
    // '0'..'7': laps 0x01 | boost-regen 0x02 | waypoints 0x04. Older mod
    // builds parsed only '0'..'3' and treat a waypoint-flagged marker as no
    // flags, which degrades safely (standard level behavior).
    if value >= b'0' && value <= b'7' {
        value - b'0'
    } else {
        0
    }
}

pub(crate) fn parse_marker_lap_count(value: u8) -> u8 {
    if value >= b'2' && value <= b'9' {
        value - b'0'
    } else {
        0
    }
}

pub(crate) fn parse_user_track_marker(buffer: &[u8], len: usize) -> (u8, u8) {
    if len <= USER_TRACK_FLAGS_MAGIC_V1.len() {
        return (0, 0);
    }
    let mut index = len - USER_TRACK_FLAGS_MAGIC_V1.len();
    loop {
        if buffer[index..].starts_with(USER_TRACK_FLAGS_MAGIC_V2) {
            let value_index = index + USER_TRACK_FLAGS_MAGIC_V2.len();
            if value_index + 1 < len {
                let flags = parse_marker_flags(buffer[value_index]);
                let lap_count = parse_marker_lap_count(buffer[value_index + 1]);
                return (flags, lap_count);
            }
        } else if buffer[index..].starts_with(USER_TRACK_FLAGS_MAGIC_V1) {
            let value_index = index + USER_TRACK_FLAGS_MAGIC_V1.len();
            if value_index < len {
                let flags = parse_marker_flags(buffer[value_index]);
                return (flags, 0);
            }
        }
        if index == 0 {
            break;
        }
        index -= 1;
    }
    (0, 0)
}

pub(crate) unsafe fn append_user_track_flags_marker(
    path: *const c_char,
    flags: u8,
    lap_count: u8,
) -> bool {
    if path.is_null() {
        return false;
    }
    let fd = open(path, O_WRONLY | O_APPEND, 0o600);
    if fd < 0 {
        return false;
    }
    let prefix = b"\n";
    let suffix = b"\n";
    let value = [
        marker_flags_byte(flags),
        marker_lap_count_byte(flags, lap_count),
    ];
    let mut ok = write(fd, prefix.as_ptr() as *const c_void, prefix.len()) == prefix.len() as isize;
    ok = write(
        fd,
        USER_TRACK_FLAGS_MAGIC_V2.as_ptr() as *const c_void,
        USER_TRACK_FLAGS_MAGIC_V2.len(),
    ) == USER_TRACK_FLAGS_MAGIC_V2.len() as isize
        && ok;
    ok = write(fd, value.as_ptr() as *const c_void, value.len()) == value.len() as isize && ok;
    ok = write(fd, suffix.as_ptr() as *const c_void, suffix.len()) == suffix.len() as isize && ok;
    let _ = close(fd);
    ok
}

pub(crate) unsafe fn read_user_track_flags_marker(path: *const c_char) -> (u8, u8) {
    if path.is_null() {
        return (0, 0);
    }
    let fd = open(path, O_RDONLY, 0);
    if fd < 0 {
        return (0, 0);
    }
    let end = lseek(fd, 0, SEEK_END);
    if end <= 0 {
        let _ = close(fd);
        return (0, 0);
    }
    let read_len = if end as usize > USER_TRACK_FLAGS_MAX_SCAN {
        USER_TRACK_FLAGS_MAX_SCAN
    } else {
        end as usize
    };
    let start = end - read_len as c_long;
    if lseek(fd, start, SEEK_SET) < 0 {
        let _ = close(fd);
        return (0, 0);
    }
    let mut buffer = [0u8; USER_TRACK_FLAGS_MAX_SCAN];
    let count = read(fd, buffer.as_mut_ptr() as *mut c_void, read_len);
    let _ = close(fd);
    if count <= 0 {
        return (0, 0);
    }
    parse_user_track_marker(&buffer, count as usize)
}

pub(crate) unsafe fn level_for_id(level_id: c_uint) -> *mut u8 {
    ensure_user_track_symbols();
    if LEVELS_GET_USER_LEVEL.is_null() {
        return ptr::null_mut();
    }
    let get_level: LevelsGetUserLevelFn = mem::transmute(LEVELS_GET_USER_LEVEL);
    get_level(level_id)
}

pub(crate) unsafe fn file_name_for_level_id(level_id: c_uint) -> *const c_char {
    ensure_user_track_symbols();
    if LEVELS_GET_USER_LEVEL_FILE_NAME.is_null() {
        return ptr::null();
    }
    let get_name: LevelsGetUserLevelFileNameFn = mem::transmute(LEVELS_GET_USER_LEVEL_FILE_NAME);
    get_name(level_id)
}

pub(crate) unsafe fn settings_for_level_id(level_id: c_uint) -> (u8, u8) {
    if (level_id & 0x8000_0000) == 0 {
        return (0, 0);
    }
    read_user_track_flags_marker(file_name_for_level_id(level_id))
}

pub(crate) unsafe fn apply_user_track_level_settings(level_id: c_uint, flags: u8, lap_count: u8) {
    // Laps and Waypoints both run the level as the stock Time Trial type
    // (checkpoint waypoint markers); laps additionally sets the lap total,
    // waypoints alone stays a single lap.
    if (flags & (USER_TRACK_FLAG_LAPS | USER_TRACK_FLAG_WAYPOINTS)) == 0 {
        return;
    }
    let level = level_for_id(level_id);
    if level.is_null() {
        return;
    }
    ptr::write_volatile(level.add(LEVEL_TYPE_OFFSET) as *mut c_int, LEVEL_TYPE_LAPS);
    let lap_total = if (flags & USER_TRACK_FLAG_LAPS) != 0 {
        effective_lap_count(lap_count)
    } else {
        1
    };
    ptr::write_volatile(level.add(LEVEL_LAP_COUNT_OFFSET) as *mut c_int, lap_total);
}

pub(crate) unsafe fn refill_current_car_boost(game: *mut c_void) {
    if game.is_null()
        || (CURRENT_USER_TRACK_FLAGS.load(Ordering::Acquire) & USER_TRACK_FLAG_BOOST_REGEN) == 0
    {
        return;
    }
    let car = ptr::read_volatile((game as *mut u8).add(GAME_CURRENT_CAR_OFFSET) as *mut *mut u8);
    if car.is_null() {
        return;
    }
    ptr::write_volatile(car.add(CAR_FUEL_OFFSET) as *mut f32, 1.0f32);
}

pub(crate) unsafe extern "C" fn hooked_ingame_level_editor_save(
    editor: *mut c_void,
    path: *mut c_char,
) -> c_int {
    let original: InGameLevelEditorSaveFn = mem::transmute(INGAME_LEVEL_EDITOR_SAVE_TRAMPOLINE);
    let result = original(editor, path);
    if USER_TRACK_CREATE_FLAGS_ARMED.load(Ordering::Acquire) {
        let flags = USER_TRACK_PENDING_FLAGS.load(Ordering::Acquire);
        if USER_TRACK_FLAGS_TOUCHED.load(Ordering::Acquire) || flags != 0 {
            append_user_track_flags_marker(
                path,
                flags,
                USER_TRACK_PENDING_LAP_COUNT.load(Ordering::Acquire),
            );
        }
        cancel_user_track_create_flags();
    }
    result
}

pub(crate) unsafe extern "C" fn hooked_ingame_level_editor_load(
    editor: *mut c_void,
    path: *const c_char,
) {
    let (flags, lap_count) = read_user_track_flags_marker(path);
    USER_TRACK_PENDING_FLAGS.store(flags, Ordering::Release);
    USER_TRACK_PENDING_LAP_COUNT.store(lap_count, Ordering::Release);
    store_user_track_settings(flags, lap_count);
    USER_TRACK_FLAGS_TOUCHED.store(false, Ordering::Release);
    let original: InGameLevelEditorLoadFn = mem::transmute(INGAME_LEVEL_EDITOR_LOAD_TRAMPOLINE);
    original(editor, path);
}

pub(crate) unsafe extern "C" fn hooked_uiform_create_ctor(form: *mut c_void) {
    let original: UiFormCreateCtorFn = mem::transmute(UIFORM_CREATE_CTOR_TRAMPOLINE);
    original(form);
    add_user_track_create_switches(form);
}

pub(crate) unsafe extern "C" fn hooked_uiform_pause_ctor(form: *mut c_void) {
    let original: UiFormPauseCtorFn = mem::transmute(UIFORM_PAUSE_CTOR_TRAMPOLINE);
    original(form);
    if ingame_level_editor_active() {
        add_user_track_switches(form, false);
    }
}

pub(crate) unsafe extern "C" fn hooked_world_load(
    world: *mut c_void,
    path: *const c_char,
    flag: u8,
    value: c_uint,
) -> c_int {
    let (flags, lap_count) = read_user_track_flags_marker(path);
    store_user_track_settings(flags, lap_count);
    let original: WorldLoadFn = mem::transmute(WORLD_LOAD_TRAMPOLINE);
    let result = original(world, path, flag, value);
    store_user_track_settings(flags, lap_count);
    result
}

pub(crate) unsafe extern "C" fn hooked_game_load_level(
    game: *mut c_void,
    level_id: c_uint,
    difficulty: c_int,
) -> c_int {
    let (flags, lap_count) = settings_for_level_id(level_id);
    store_user_track_settings(flags, lap_count);
    apply_user_track_level_settings(level_id, flags, lap_count);
    let original: GameLoadLevelFn = mem::transmute(GAME_LOAD_LEVEL_TRAMPOLINE);
    let result = original(game, level_id, difficulty);
    apply_user_track_level_settings(
        level_id,
        CURRENT_USER_TRACK_FLAGS.load(Ordering::Acquire),
        CURRENT_USER_TRACK_LAP_COUNT.load(Ordering::Acquire),
    );
    result
}

pub(crate) unsafe extern "C" fn hooked_game_on_checkpoint(
    game: *mut c_void,
    position: *const c_void,
    checkpoint: c_int,
) {
    let original: GameOnCheckpointFn = mem::transmute(GAME_ON_CHECKPOINT_TRAMPOLINE);
    original(game, position, checkpoint);
    refill_current_car_boost(game);
}

pub(crate) unsafe fn install_user_track_hooks() -> bool {
    if USER_TRACK_HOOKS_INSTALLED.load(Ordering::Acquire) {
        return true;
    }
    if USER_TRACK_HOOKS_INSTALLED.swap(true, Ordering::AcqRel) {
        return true;
    }

    let save = resolve(b"_ZN17InGameLevelEditor4SaveEPc\0");
    let load = resolve(b"_ZN17InGameLevelEditor4LoadEPKc\0");
    let create_ctor = resolve(b"_ZN12UiFormCreateC1Ev\0");
    let pause_ctor = resolve(b"_ZN11UiFormPauseC1Ev\0");
    let world_load = resolve(b"_ZN5World4LoadEPKcbj\0");
    let game_load_level = resolve(b"_ZN4Game9LoadLevelEjNS_10DifficultyE\0");
    let game_on_checkpoint = resolve(b"_ZN4Game12OnCheckPointERKN2TA4Vec3Ei\0");
    if save.is_null()
        || load.is_null()
        || create_ctor.is_null()
        || pause_ctor.is_null()
        || world_load.is_null()
        || game_load_level.is_null()
        || game_on_checkpoint.is_null()
        || !create_form_ui_symbols_ready()
    {
        USER_TRACK_HOOKS_INSTALLED.store(false, Ordering::Release);
        return false;
    }

    INGAME_LEVEL_EDITOR_SAVE_TRAMPOLINE = install_inline_hook(
        save,
        hooked_ingame_level_editor_save as *const c_void,
        INGAME_LEVEL_EDITOR_SAVE_HOOK_BYTES,
    );
    INGAME_LEVEL_EDITOR_LOAD_TRAMPOLINE = install_inline_hook(
        load,
        hooked_ingame_level_editor_load as *const c_void,
        INGAME_LEVEL_EDITOR_LOAD_HOOK_BYTES,
    );
    UIFORM_CREATE_CTOR_TRAMPOLINE = install_inline_hook(
        create_ctor,
        hooked_uiform_create_ctor as *const c_void,
        UIFORM_CREATE_CTOR_HOOK_BYTES,
    );
    UIFORM_PAUSE_CTOR_TRAMPOLINE = install_inline_hook(
        pause_ctor,
        hooked_uiform_pause_ctor as *const c_void,
        UIFORM_PAUSE_CTOR_HOOK_BYTES,
    );
    WORLD_LOAD_TRAMPOLINE = install_inline_hook(
        world_load,
        hooked_world_load as *const c_void,
        WORLD_LOAD_HOOK_BYTES,
    );
    GAME_LOAD_LEVEL_TRAMPOLINE = install_inline_hook(
        game_load_level,
        hooked_game_load_level as *const c_void,
        GAME_LOAD_LEVEL_HOOK_BYTES,
    );
    GAME_ON_CHECKPOINT_TRAMPOLINE = install_inline_hook(
        game_on_checkpoint,
        hooked_game_on_checkpoint as *const c_void,
        GAME_ON_CHECKPOINT_HOOK_BYTES,
    );

    let ok = !(INGAME_LEVEL_EDITOR_SAVE_TRAMPOLINE.is_null()
        || INGAME_LEVEL_EDITOR_LOAD_TRAMPOLINE.is_null()
        || UIFORM_CREATE_CTOR_TRAMPOLINE.is_null()
        || UIFORM_PAUSE_CTOR_TRAMPOLINE.is_null()
        || WORLD_LOAD_TRAMPOLINE.is_null()
        || GAME_LOAD_LEVEL_TRAMPOLINE.is_null()
        || GAME_ON_CHECKPOINT_TRAMPOLINE.is_null());
    if !ok {
        USER_TRACK_HOOKS_INSTALLED.store(false, Ordering::Release);
    }
    ok
}
