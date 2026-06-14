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
ADD_NODE_SYMBOL = b"_ZN6Replay7AddNodeEP3Car"
ADD_NODE_PROLOGUE = bytes.fromhex("ff4302d1f53300f9f44f07a9fd7b08a9")

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
    non_flap_flags = 0x0D
    flap_flag = 0x02
    extreme_flaps = 0xF0

    for original in range(256):
        marked = []
        for index in range(marker_frames * 4):
            pulse_on = (index // marker_frames) & 1 == 0
            marker = extreme_flaps | flap_flag if pulse_on else 0
            result = (original & non_flap_flags) | marker
            marked.append(result)
            if result & non_flap_flags != original & non_flap_flags:
                ok = fail(f"marker changed non-flap flags for original byte {original:#04x}") and ok
        for boundary in range(marker_frames, len(marked), marker_frames):
            if ((marked[boundary - 1] ^ marked[boundary]) & 0x0F) == 0:
                ok = fail(f"marker transition at frame {boundary} would not force a compressor keyframe") and ok
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
        "_ZN6Replay7AddNodeEP3Car",
    )
    for line in bridge.splitlines():
        if 'resolve(b"' in line and not any(symbol in line for symbol in allowed_native_symbols):
            ok = fail(f"native bridge resolves an unapproved symbol: {line.strip()}") and ok
    if "RequiredPatches_applyUnlimitedCheckpoints" not in bridge:
        ok = fail("checkpoint-only JNI entry point is missing") and ok
    if "RequiredPatches_installReplayVisualMarker" not in bridge:
        ok = fail("narrow replay visual marker JNI entry point is missing") and ok
    if "original_flags & NON_FLAP_FLAGS" not in bridge or "NON_FLAP_FLAGS: u8 = 0x0d" not in bridge:
        ok = fail("replay marker does not preserve rocket, brake, and respawn replay flags") and ok
    if bridge.count("ptr::write_volatile(") != 2:
        ok = fail("native bridge must have exactly two value writes: checkpoints and replay visual flags") and ok
    if "REPLAY_NODE_SIZE: usize = 0x14" not in bridge or "VISUAL_FLAGS_OFFSET: usize = 1" not in bridge:
        ok = fail("replay marker node size or visual-only field offset changed") and ok
    if "MARKER_EXTREME_FLAPS: u8 = 0xf0" not in bridge:
        ok = fail("replay marker no longer uses the reserved stock flap value") and ok
    if "MARKER_FLAP_FLAG: u8 = 0x02" not in bridge:
        ok = fail("replay marker no longer forces compression-preserved flap transitions") and ok

    required_patches = (ROOT / "modmenu_src/com/trueaxis/modmenu/RequiredPatches.java").read_text(
        encoding="utf-8"
    )
    if 'throw new IllegalStateException("Replay visual marker unavailable")' not in required_patches:
        ok = fail("gameplay does not fail closed when replay marker installation fails") and ok
    try:
        actual_prologue = elf64_symbol_bytes(ROOT / TRUEAXIS_PATH, ADD_NODE_SYMBOL, len(ADD_NODE_PROLOGUE))
        if actual_prologue != ADD_NODE_PROLOGUE:
            ok = fail(
                f"Replay::AddNode prologue changed: {actual_prologue.hex()} expected {ADD_NODE_PROLOGUE.hex()}"
            ) and ok
    except ValueError as error:
        ok = fail(str(error)) and ok

    activity = (ROOT / "decompiled/smali/com/trueaxis/jetcarstunts2/Jetcarstunts2Activity.smali").read_text(
        encoding="utf-8"
    )
    if "RequiredPatches;->apply()V" not in activity:
        ok = fail("game activity does not apply the retained checkpoint patch") and ok

    stub = (ROOT / "decompiled/smali/com/trueaxis/server/Stub.smali").read_text(encoding="utf-8")
    if ".method public static ownAll()V" not in stub:
        ok = fail("retained IAP ownership compatibility stub is missing") and ok

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
