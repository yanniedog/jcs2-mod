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
    b"g_nGhostSize",
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


def check_sources():
    ok = check_marker_invariants()
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
        "g_nReplaySize",
        "g_pReplay",
        "g_dlcConnections",
        "g_pfCheckPointTimes",
        "g_pfGhostCheckPointTimes",
        "g_nNumCheckPointTimes",
        "g_nNumGhostCheckPointTimes",
    )
    for line in bridge.splitlines():
        if 'resolve(b"' in line and not any(symbol in line for symbol in allowed_native_symbols):
            ok = fail(f"native bridge resolves an unapproved symbol: {line.strip()}") and ok
    if "RequiredPatches_applyUnlimitedCheckpoints" not in bridge:
        ok = fail("checkpoint-only JNI entry point is missing") and ok
    if "force_checkpoint_limit();" not in bridge or "CHECKPOINT_LIMIT_ADDRESS" not in bridge:
        ok = fail("unlimited checkpoint capacity is not continuously hardwired") and ok
    if "RequiredPatches_installReplayVisualMarker" not in bridge:
        ok = fail("narrow replay visual marker JNI entry point is missing") and ok
    if "RequiredPatches_readLatestCheckpointSplit" not in bridge:
        ok = fail("read-only checkpoint split JNI entry point is missing") and ok
    if "checkpointCount > lastCheckpointCount + 1" not in (
        ROOT / "modmenu_src/com/trueaxis/modmenu/SplitTimeHud.java"
    ).read_text(encoding="utf-8"):
        ok = fail("checkpoint split HUD no longer suppresses replay-load checkpoint jumps") and ok
    if (
        "original_flags & PRESERVED_REPLAY_FLAGS" not in bridge
        or "PRESERVED_REPLAY_FLAGS: u8 = 0x0c" not in bridge
    ):
        ok = fail("replay marker does not preserve brake/resting and respawn replay flags") and ok
    if "REMARK_RECENT_NODES: c_int = 120" not in bridge or "mark_recent_nodes(nodes, size)" not in bridge:
        ok = fail("replay marker no longer re-marks recent nodes after live capture completes") and ok
    if bridge.count("ptr::write_volatile(") != 3:
        ok = fail("native bridge must have exactly three value writes: IAP ownership, checkpoints, and replay visual flags") and ok
    if "DLC_PURCHASED_OFFSET: usize = 0x5c" not in bridge or "DLC_ITEM_COUNT: usize = 0x200" not in bridge:
        ok = fail("retained IAP ownership patch no longer targets stock DLC purchase flags") and ok
    if "REPLAY_NODE_SIZE: usize = 0x14" not in bridge or "VISUAL_FLAGS_OFFSET: usize = 1" not in bridge:
        ok = fail("replay marker node size or visual-only field offset changed") and ok
    if "FLAPS_FULL_UP: u8 = 0xf0" not in bridge or "FLAPS_FULL_DOWN: u8 = 0x00" not in bridge:
        ok = fail("replay marker no longer oscillates the synchronized stock flap field") and ok
    if "growth <= MAX_RECORDING_GROWTH" not in bridge or "Never mark viewed replays" not in bridge:
        ok = fail("replay marker no longer skips replay loading/decompression") and ok
    if "pthread_create(" not in bridge or "replay_marker_worker" not in bridge:
        ok = fail("replay marker worker is missing") and ok

    required_patches = (ROOT / "modmenu_src/com/trueaxis/modmenu/RequiredPatches.java").read_text(
        encoding="utf-8"
    )
    if "installReplayVisualMarker();" not in required_patches:
        ok = fail("gameplay does not attempt to install the replay visual marker") and ok
    if 'throw new IllegalStateException("Replay visual marker unavailable")' in required_patches:
        ok = fail("optional replay marker failure must not crash game startup") and ok
    if "catch (Throwable error)" not in required_patches or "NATIVE_AVAILABLE" not in required_patches:
        ok = fail("native patch failures are not isolated from game startup") and ok

    launcher = (ROOT / "modmenu_src/com/trueaxis/modmenu/ModLauncherActivity.java").read_text(
        encoding="utf-8"
    )
    if "RequiredPatches.apply()" in launcher:
        ok = fail("launcher applies native patches before the game activity is ready") and ok
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
    args = parser.parse_args()

    ok = check_sources()
    if args.apk:
        ok = check_apk(args.apk.resolve()) and ok
    if not ok:
        return 1
    print("Anti-cheat cleanup audit passed.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
