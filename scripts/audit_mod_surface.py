#!/usr/bin/env python3
import argparse
import base64
import hashlib
import struct
import sys
import zipfile
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
EXPECTED_LIVERY_SHA1 = "718XOktjbUHjlNXZXRC0xgDF0+U="
LIVERY_PATH = Path("decompiled/assets/cars/original/rocketcar1.png")
APK_LIVERY_PATH = "assets/cars/original/rocketcar1.png"
TRUEAXIS_PATH = Path("decompiled/lib/arm64-v8a/libtrueaxis.so")
FORBIDDEN = (
    b"NativeMods",
    b"MODS & CHEATS",
    b"Quick cheats",
    b"Unlock everything",
    b"Disable ads",
    b"Hyper-ballistic physics",
    b"Autopilot",
    b"All native options",
    b"g_bUnLockAll",
    b"g_bHyperBallistic",
    b"g_bAiOnPlayerCar",
    b"g_nFreeStyleBestTrickScore",
    b"g_nInAirStuntCounter",
    b"g_bIAPCrack",
    b"Java_com_trueaxis_modmenu_NativeMods_",
)

SOURCE_TARGETS = (
    Path("modmenu_src"),
    Path("native_bridge/src"),
    Path("decompiled/smali/com/trueaxis/modmenu"),
    Path("decompiled/smali/com/trueaxis/admob/AdMob.smali"),
    Path("decompiled/smali/com/trueaxis/server/Stub.smali"),
    Path("decompiled/smali/com/trueaxis/jetcarstunts2/Jetcarstunts2Activity.smali"),
)


def fail(message):
    print(f"FAIL: {message}", file=sys.stderr)
    return False


def sha1_base64(data):
    return base64.b64encode(hashlib.sha1(data).digest()).decode("ascii")


def check_blob(name, data):
    ok = True
    for marker in FORBIDDEN:
        if marker in data:
            ok = fail(f"{name} contains forbidden marker {marker.decode('ascii')}") and ok
    return ok


def elf64_symbol_bytes(path, wanted, length):
    data = path.read_bytes()
    if data[:6] != b"\x7fELF\x02\x01":
        raise ValueError(f"{path} is not a little-endian ELF64 file")
    section_offset = struct.unpack_from("<Q", data, 0x28)[0]
    section_size = struct.unpack_from("<H", data, 0x3A)[0]
    section_count = struct.unpack_from("<H", data, 0x3C)[0]
    sections = [
        struct.unpack_from("<IIQQQQIIQQ", data, section_offset + index * section_size)
        for index in range(section_count)
    ]
    for section in sections:
        _, section_type, _, _, sym_offset, sym_size, string_index, _, _, entry_size = section
        if section_type != 11 or entry_size == 0:
            continue
        strings = sections[string_index]
        string_offset = strings[4]
        for offset in range(sym_offset, sym_offset + sym_size, entry_size):
            name_offset, _, _, _, value, _ = struct.unpack_from("<IBBHQQ", data, offset)
            end = data.find(b"\0", string_offset + name_offset)
            if data[string_offset + name_offset : end] != wanted:
                continue
            for target in sections:
                target_address, target_offset, target_size = target[3], target[4], target[5]
                if target_address <= value < target_address + target_size:
                    file_offset = target_offset + value - target_address
                    return data[file_offset : file_offset + length]
    raise ValueError(f"symbol {wanted.decode('ascii')} not found in {path}")


def check_marker_invariants():
    ok = True
    marker_frames = 6
    preserved_replay_flags = 0x0C
    flaps_full_up = 0xF0
    flaps_full_down = 0x00

    for original in range(256):
        marked = []
        for index in range(marker_frames * 4):
            flaps = flaps_full_up if (index // marker_frames) & 1 == 0 else flaps_full_down
            result = (original & preserved_replay_flags) | flaps
            marked.append(result)
            if result & preserved_replay_flags != original & preserved_replay_flags:
                ok = fail(
                    f"marker changed preserved brake/respawn flags for original byte {original:#04x}"
                ) and ok
            if result & 0x03 != 0:
                ok = fail(f"marker did not neutralize flap-driver bits for original byte {original:#04x}") and ok
            expected_flaps = flaps_full_up if (index // marker_frames) & 1 == 0 else flaps_full_down
            if result & 0xF0 != expected_flaps:
                ok = fail(f"marker did not set synchronized flap extreme at frame {index}") and ok
    return ok


def check_sources(skip_local_assets=False):
    ok = True
    for target in SOURCE_TARGETS:
        path = ROOT / target
        if not path.exists():
            ok = fail(f"missing audit target {target}") and ok
            continue
        files = path.rglob("*") if path.is_dir() else (path,)
        for file_path in files:
            if file_path.is_file():
                ok = check_blob(str(file_path.relative_to(ROOT)), file_path.read_bytes()) and ok

    bridge = (ROOT / "native_bridge/src/lib.rs").read_text(encoding="utf-8")
    allowed_native_symbols = (
        "g_nMaxNumCheckPointTimes",
        "g_dlcConnections",
        "g_pfCheckPointTimes",
        "g_pfGhostCheckPointTimes",
        "g_nNumCheckPointTimes",
        "g_nNumGhostCheckPointTimes",
        "g_nGhostSize",
        "g_pReplayCompressedHeader",
        "g_bShowReplay",
        "g_fLastCheckPointTime",
        "g_nLastCheckPoint",
        "g_nGhostPos",
        "g_nLastGhostPos",
        "g_nLastReplaySize",
        "g_nGhostRetrySkipTimeIndex",
        "g_nLastGhostRetrySkipTimeIndex",
        "g_nGhostRetryPauseTime",
        "g_nLastGhostRetryPauseTime",
        "g_nNumGhostRetrySkipTimes",
        "g_pGhost",
        "g_ghostTransform",
        "g_ghostTransformLast",
        "g_checkPointTransfrom",
    )
    for line in bridge.splitlines():
        if 'resolve(b"' in line and not any(symbol in line for symbol in allowed_native_symbols):
            ok = fail(f"native bridge resolves an unapproved symbol: {line.strip()}") and ok
    if "RequiredPatches_applyUnlimitedCheckpoints" not in bridge:
        ok = fail("checkpoint-only JNI entry point is missing") and ok
    if "force_checkpoint_limit();" not in bridge or "CHECKPOINT_LIMIT_ADDRESS" not in bridge:
        ok = fail("unlimited checkpoint capacity is not continuously hardwired") and ok
    forbidden_replay_writers = (
        "RequiredPatches_installReplayVisualMarker",
        "replay_marker_worker",
        "mark_recent_nodes",
        "mark_node",
        'resolve(b"g_pReplay\\0")',
        "g_nReplaySize",
        "REPLAY_NODE_SIZE",
        "VISUAL_FLAGS_OFFSET",
        "PRESERVED_REPLAY_FLAGS",
        "FLAPS_FULL_UP",
        "FLAPS_FULL_DOWN",
    )
    for marker in forbidden_replay_writers:
        if marker in bridge:
            ok = fail(f"native bridge still contains replay-data mutation marker: {marker}") and ok
    if "RequiredPatches_readLatestCheckpointSplit" not in bridge:
        ok = fail("read-only checkpoint split JNI entry point is missing") and ok
    if (
        "RequiredPatches_readLatestCheckpointCurrentMillis" not in bridge
        or "RequiredPatches_readLatestCheckpointGhostMillis" not in bridge
        or "RequiredPatches_readGhostCheckpointMillis" not in bridge
    ):
        ok = fail("checkpoint split source-time JNI entry points are missing") and ok
    if (
        "RequiredPatches_installNativeCrashLogger" not in bridge
        or "native_signal_handler" not in bridge
        or "ycs2_mod_native_crash.log" not in bridge
    ):
        ok = fail("native fatal-signal crash logging is missing") and ok
    if "/storage/emulated/0/YCS2CommunityMod/logs/ycs2_mod_native_crash.log" not in bridge:
        ok = fail("native fatal-signal crash log is not written to the public shared log folder") and ok
    if 'GHOST_SIZE = resolve(b"g_nGhostSize\\0") as *mut c_int' not in bridge:
        ok = fail("checkpoint split HUD no longer detects raced replay ghosts") and ok
    if 'SHOW_REPLAY = resolve(b"g_bShowReplay\\0") as *mut u8' not in bridge:
        ok = fail("checkpoint split HUD no longer resolves the replay/viewing diagnostic flag") and ok
    if 'REPLAY_COMPRESSED_HEADER = resolve(b"g_pReplayCompressedHeader\\0")' not in bridge:
        ok = fail("checkpoint split HUD no longer reads replay header timing metadata for finish splits") and ok
    if "1i64 << 32" not in bridge or "(((checkpoint + 1) as i64) << 32)" not in bridge:
        ok = fail("checkpoint split reader no longer reports persistent ghost/split states") and ok
    if "fn decoded_live_checkpoint_index()" not in bridge or "0x00ff_ffff" not in bridge:
        ok = fail("checkpoint split reader no longer decodes the engine checkpoint flag/counter") and ok
    if "fn scan_live_checkpoint_from_last_time()" not in bridge or "last_checkpoint_ms()" not in bridge:
        ok = fail("checkpoint split reader no longer keeps stock live checkpoint-time diagnostics") and ok
    if "ghost_checkpoint_ms(checkpoint)" not in bridge or "fn live_checkpoint_ms(checkpoint: c_int)" not in bridge:
        ok = fail("checkpoint split reader no longer compares live checkpoint time against the clean ghost checkpoint snapshot") and ok
    if "effective_ghost_checkpoint_count()" not in bridge or "FALLBACK_GHOST_CHECKPOINT_COUNT" not in bridge:
        ok = fail("checkpoint split reader no longer supports normal-level ghost checkpoint fallback state") and ok
    if "FALLBACK_GHOST_FINISH_MS" not in bridge or "final_finish_split" not in bridge:
        ok = fail("checkpoint split reader no longer emits synthetic final finish splits") and ok
    if "capture_ghost_replay_baseline()" not in bridge or "replay_header_checkpoint_count()" not in bridge:
        ok = fail("checkpoint split reader no longer preserves ghost timing across retry/restart") and ok
    if "LAST_CHECKPOINT_INDEX" not in bridge or 'resolve(b"g_nLastCheckPoint\\0")' not in bridge:
        ok = fail("checkpoint split reader no longer reads g_nLastCheckPoint for diagnostics/fallback") and ok
    if "RequiredPatches_readSplitScannedCheckpointIndex" not in bridge or "RequiredPatches_readSplitDecodedEngineCheckpointIndex" not in bridge:
        ok = fail("checkpoint split diagnostics no longer expose scanned/decoded checkpoint indexes") and ok
    if any(
        marker in bridge
        for marker in (
            "RequiredPatches_readGhostRoute",
            "readGhostViewMatrices",
            "readGhostRoutePointCount",
            "reconstruct_ghost_route",
            "Read-only ghost route line support",
        )
    ):
        ok = fail("ghost route line feature must stay removed") and ok
    split_hud = (ROOT / "modmenu_src/com/trueaxis/modmenu/SplitTimeHud.java").read_text(
        encoding="utf-8"
    )
    mod_menu = (ROOT / "modmenu_src/com/trueaxis/modmenu/ModMenu.java").read_text(
        encoding="utf-8"
    )
    if "checkpointCount > lastCheckpointCount + 1" not in split_hud:
        ok = fail("checkpoint split HUD no longer suppresses replay-load checkpoint jumps") and ok
    if '"split checkpoint jump accepted from="' not in split_hud:
        ok = fail("checkpoint split HUD no longer accepts real checkpoint jumps after racing has started") and ok
    if (
        "SPLIT_READY = Color.rgb(255, 220, 0)" not in split_hud
        or "SPLIT_FAST = Color.rgb(0, 220, 80)" not in split_hud
        or "SPLIT_SLOW = Color.rgb(255, 70, 70)" not in split_hud
        or "splitColor(displayMillis)" not in split_hud
    ):
        ok = fail("checkpoint split HUD is not hardwired to ready/yellow, faster/green, slower/red text") and ok
    if '"SPLIT --"' not in split_hud or '"%s%d %s%.2f"' not in split_hud:
        ok = fail("checkpoint split HUD is not visibly persistent during replay ghost races") and ok
    if "sectorSplitMillis" not in split_hud or "previousCumulativeSplitMillis" not in split_hud:
        ok = fail("checkpoint split HUD no longer supports sector-to-sector delta mode") and ok
    if "cumulative_delta_ms" not in split_hud or 'sectorMode ? "sector" : "checkpoint"' not in split_hud:
        ok = fail("checkpoint split HUD no longer logs whether delta mode is checkpoint or sector") and ok
    if "readLatestCheckpointCurrentMillis()" not in split_hud or "readLatestCheckpointGhostMillis()" not in split_hud:
        ok = fail("checkpoint split HUD no longer logs current and ghost checkpoint source times") and ok
    if "readGhostCheckpointMillis(checkpoint)" not in split_hud or '"ghost checkpoint=%d ghost_ms=%d"' not in split_hud:
        ok = fail("checkpoint split HUD no longer logs replay ghost checkpoint timestamps") and ok
    if '"split HUD poll failed; disabling HUD"' not in split_hud:
        ok = fail("checkpoint split HUD Java failures are not logged and isolated") and ok
    if "ModMenu.splitXdp(activity)" not in split_hud or "ModMenu.splitYdp(activity)" not in split_hud:
        ok = fail("checkpoint split HUD no longer uses configurable on-screen position") and ok
    if "ModMenu.splitAlphaPercent(activity)" not in split_hud:
        ok = fail("checkpoint split HUD no longer uses configurable transparency") and ok
    if "SpannableStringBuilder" not in split_hud or "ForegroundColorSpan" not in split_hud:
        ok = fail("checkpoint split HUD no longer keeps per-line split colours persistent") and ok
    if "split.bringToFront()" not in split_hud or "split.setTranslationZ(1000.0f)" not in split_hud:
        ok = fail("checkpoint split HUD is not forced above the native SurfaceView") and ok
    if "K_EXPERIMENTAL_ACK" in mod_menu or "Show buggy experimental features" in mod_menu:
        ok = fail("mod menu still contains the old noisy experimental acknowledgement flow") and ok
    if 'prefs(c).getBoolean(K_CHECKPOINT_SPLITS, true)' not in mod_menu:
        ok = fail("checkpoint split HUD is no longer enabled by default") and ok
    if 'prefs(c).getBoolean(K_SPLIT_LIST, true)' not in mod_menu:
        ok = fail("split list is no longer enabled by default") and ok
    if "K_SPLIT_REALTIME" in mod_menu or "realtimeSplitsEnabled" in mod_menu:
        ok = fail("continuous split refresh feature must stay removed") and ok
    if "K_GHOST_ROUTE" in mod_menu or "Draw ghost track line" in mod_menu:
        ok = fail("ghost route line controls must stay removed from the mod menu") and ok
    if "Enable checkpoint/sector deltas vs saved replay ghost" not in mod_menu:
        ok = fail("mod menu no longer exposes the requested split HUD label") and ok
    if "K_SPLIT_SECTOR_DELTA" not in mod_menu or "sectorSplitsEnabled" not in mod_menu:
        ok = fail("sector delta mode is missing from the split HUD options") and ok
    if 'prefs(c).getBoolean(K_SPLIT_SECTOR_DELTA, false)' not in mod_menu:
        ok = fail("sector delta mode is no longer disabled by default") and ok
    if any(marker in mod_menu for marker in ('"a) ', '"b) ', '"c) ', '"e) ', '"f) ')):
        ok = fail("mod menu still contains letter-numbered option labels") and ok
    if "validateCustomLiveriesForGame" not in mod_menu or "quarantineLivery" not in mod_menu:
        ok = fail("custom livery validation/quarantine is missing from startup safety checks") and ok
    if bridge.count("ptr::write_volatile(") != 2:
        ok = fail("native bridge must have exactly two value writes: IAP ownership and checkpoint capacity only") and ok
    if "DLC_PURCHASED_OFFSET: usize = 0x5c" not in bridge or "DLC_ITEM_COUNT: usize = 0x200" not in bridge:
        ok = fail("retained IAP ownership patch no longer targets stock DLC purchase flags") and ok
    if "pthread_create(" not in bridge or "retained_patch_worker" not in bridge:
        ok = fail("retained native patch worker is missing") and ok

    required_patches = (ROOT / "modmenu_src/com/trueaxis/modmenu/RequiredPatches.java").read_text(
        encoding="utf-8"
    )
    debug_log = (ROOT / "modmenu_src/com/trueaxis/modmenu/ModDebugLog.java").read_text(
        encoding="utf-8"
    )
    if "ycs2_mod_debug.log" not in debug_log or "setDefaultUncaughtExceptionHandler" not in debug_log:
        ok = fail("local Android debug crash log is missing") and ok
    if "YCS2CommunityMod/logs" not in debug_log or "public_shared_log_dir" not in debug_log:
        ok = fail("local Android debug log is not stored in the public shared log folder") and ok
    if "requestSharedLogPermission" not in debug_log or "onRequestPermissionsResult" not in debug_log:
        ok = fail("local Android debug log does not request/handle shared-folder storage permission") and ok
    if "debug log storage moved" not in debug_log or "copyPreviousLog" not in debug_log:
        ok = fail("local Android debug log does not move/copy startup logs after storage permission is granted") and ok
    if "LOG WRITE FAILURE" not in debug_log or "fallback_path" not in debug_log:
        ok = fail("local Android debug log write failures are not captured with fallback context") and ok
    if "permission WRITE_EXTERNAL_STORAGE" not in debug_log or "external_storage_state" not in debug_log:
        ok = fail("local Android debug log no longer records storage permission/state") and ok
    if "registerActivityLifecycleCallbacks" not in debug_log or "logRuntime(\"startup\")" not in debug_log:
        ok = fail("local Android debug log no longer records lifecycle/runtime context") and ok
    if "getHistoricalProcessExitReasons" not in debug_log or "process exit history" not in debug_log:
        ok = fail("local Android debug log no longer records process-exit history") and ok
    if "onTrimMemory" not in debug_log or "onLowMemory" not in debug_log:
        ok = fail("local Android debug log no longer records memory-pressure callbacks") and ok
    if "onConfigurationChanged" not in debug_log:
        ok = fail("local Android debug log no longer records configuration changes") and ok
    if "ModDebugLog.install(activity)" not in required_patches or "ModDebugLog.log(\"checkpoint split HUD enabled\")" not in required_patches:
        ok = fail("required patches do not initialise the local debug log") and ok
    if "installNativeCrashLogger()" not in required_patches:
        ok = fail("required patches do not install the native fatal-signal logger") and ok
    if "GhostRouteOverlay" in required_patches or "ghostRouteEnabled" in required_patches:
        ok = fail("required patches still reference removed ghost route overlay") and ok
    if (ROOT / "modmenu_src/com/trueaxis/modmenu/GhostRouteOverlay.java").exists():
        ok = fail("removed ghost route overlay source file still exists") and ok
    if "installReplayVisualMarker" in required_patches or "replay visual marker disabled; replay data is not modified" not in required_patches:
        ok = fail("required patches must explicitly avoid replay-data mutation") and ok
    if "catch (Throwable error)" not in required_patches or "NATIVE_AVAILABLE" not in required_patches:
        ok = fail("native patch failures are not isolated from game startup") and ok

    launcher = (ROOT / "modmenu_src/com/trueaxis/modmenu/ModLauncherActivity.java").read_text(
        encoding="utf-8"
    )
    if "RequiredPatches.apply()" in launcher:
        ok = fail("launcher applies native patches before the game activity is ready") and ok
    if "!isTaskRoot()" not in launcher or "non-root launcher entry; finishing to reveal existing game task" not in launcher:
        ok = fail("launcher relaunch while game is active no longer returns to the game task") and ok
    if "requestSharedLogPermission(ModLauncherActivity.this)" not in launcher or "ModDebugLog.onRequestPermissionsResult" not in launcher:
        ok = fail("launcher no longer requests shared-folder debug log access") and ok
    if "ModMenu.validateCustomLiveriesForGame(ModLauncherActivity.this)" not in launcher:
        ok = fail("launcher no longer validates custom liveries before native game startup") and ok
    activity = (ROOT / "decompiled/smali/com/trueaxis/jetcarstunts2/Jetcarstunts2Activity.smali").read_text(
        encoding="utf-8"
    )
    if "RequiredPatches;->apply(Landroid/app/Activity;)V" not in activity:
        ok = fail("game activity does not apply the retained checkpoint patch") and ok

    stub = (ROOT / "decompiled/smali/com/trueaxis/server/Stub.smali").read_text(encoding="utf-8")
    if ".method public static ownAll()V" not in stub:
        ok = fail("retained IAP ownership compatibility stub is missing") and ok
    interface = (ROOT / "decompiled/smali/com/trueaxis/game/Interface.smali").read_text(encoding="utf-8")
    add_sku = interface.split(".method public static addSkuToList", 1)[-1].split(".end method", 1)[0]
    if "TrueaxisLib;->purchaseSuccess" not in add_sku:
        ok = fail("SKU registration no longer hardwires retained IAP ownership compatibility") and ok

    if not skip_local_assets:
        livery = (ROOT / LIVERY_PATH).read_bytes()
        actual_livery_sha1 = sha1_base64(livery)
        if actual_livery_sha1 != EXPECTED_LIVERY_SHA1:
            ok = fail(
                f"stock bundled livery SHA-1 is {actual_livery_sha1}, expected {EXPECTED_LIVERY_SHA1}"
            ) and ok
    return ok


def check_apk(apk_path):
    ok = True
    with zipfile.ZipFile(apk_path) as apk:
        names = set(apk.namelist())
        for required in (
            APK_LIVERY_PATH,
            "assets/shaders/afterburner.vert",
            "assets/shaders/afterburner_fix.vert",
            "lib/arm64-v8a/libjcs2mod.so",
        ):
            if required not in names:
                ok = fail(f"APK is missing {required}") and ok

        if APK_LIVERY_PATH in names:
            actual_livery_sha1 = sha1_base64(apk.read(APK_LIVERY_PATH))
            if actual_livery_sha1 != EXPECTED_LIVERY_SHA1:
                ok = fail(
                    f"APK bundled livery SHA-1 is {actual_livery_sha1}, expected {EXPECTED_LIVERY_SHA1}"
                ) and ok

        for name in names:
            if name.endswith(".dex") or name == "lib/arm64-v8a/libjcs2mod.so":
                ok = check_blob(f"{apk_path.name}:{name}", apk.read(name)) and ok

        for shader in ("afterburner.vert", "afterburner_fix.vert"):
            packaged = apk.read(f"assets/shaders/{shader}")
            tracked = (ROOT / "mod_assets/shaders" / shader).read_bytes()
            if packaged != tracked:
                ok = fail(f"APK shader overlay mismatch: {shader}") and ok
    return ok


def main():
    parser = argparse.ArgumentParser(description="Audit the retained JCS2 mod surface.")
    parser.add_argument("--apk", type=Path, help="also inspect a built signed APK")
    parser.add_argument(
        "--skip-local-assets",
        action="store_true",
        help="skip checks that require the ignored decompiled/assets tree",
    )
    args = parser.parse_args()

    ok = check_sources(skip_local_assets=args.skip_local_assets)
    if args.apk:
        ok = check_apk(args.apk.resolve()) and ok
    if not ok:
        return 1
    print("Anti-cheat cleanup audit passed.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
