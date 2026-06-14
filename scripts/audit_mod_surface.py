#!/usr/bin/env python3
import argparse
import base64
import hashlib
import sys
import zipfile
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
EXPECTED_LIVERY_SHA1 = "718XOktjbUHjlNXZXRC0xgDF0+U="
LIVERY_PATH = Path("decompiled/assets/cars/original/rocketcar1.png")
APK_LIVERY_PATH = "assets/cars/original/rocketcar1.png"

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
    b"g_nReplaySize",
    b"g_nGhostSize",
    b"g_nFreeStyleBestTrickScore",
    b"g_nInAirStuntCounter",
    b"g_bIAPCrack",
    b"mprotect",
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


def check_sources():
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
    if bridge.count("g_nMaxNumCheckPointTimes") != 2:
        ok = fail("native bridge must reference only the checkpoint symbol, exactly twice") and ok
    if "RequiredPatches_applyUnlimitedCheckpoints" not in bridge:
        ok = fail("checkpoint-only JNI entry point is missing") and ok

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
