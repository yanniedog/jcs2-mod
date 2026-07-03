# JCS2 LLM Android Emulator Runtime

This repo has a dedicated Android emulator workflow for APK iteration testing with
both screenshots and machine-readable text evidence. It is local-only and uses
ADB against a Windows Android emulator. Do not SSH to any Pi for this workflow.

## Setup

Run the preflight and create the dedicated AVD:

```powershell
.\scripts\setup_jcs2_llm_emulator.ps1
```

Start it as well:

```powershell
.\scripts\setup_jcs2_llm_emulator.ps1 -Start
```

The dedicated AVD is `jcs2-llm-runtime`, exposed as `emulator-5562` from fixed
ports `5562,5563`. Android Emulator names the device serial after the console
port (`5562`), while ADB uses the paired odd port (`5563`). Existing AVDs such
as `jcs2-test` and `Medium_Phone_API_36.1` are not modified.

The setup preflight verifies:

- Android SDK emulator and adb
- API `36.1` Google Play x86_64 system image
- WHPX emulator acceleration
- repo-local JDK from `tools\jdk21_home.txt`
- `tools\r8.jar`
- Python imaging dependencies
- Tesseract OCR health

OCR lookup order is `-TesseractExe`, `TESSERACT_EXE`, `PATH`, then
`C:\Program Files\Tesseract-OCR\tesseract.exe`.

## Running An APK Iteration

Default smoke run:

```powershell
.\scripts\run_jcs2_llm_iteration.ps1 -ApkPath .\jcs2-mod.apk -Mode Smoke
```

`Smoke` defaults to `-SmokeLaunchStrategy DirectGame`, which launches
`com.trueaxis.jetcarstunts2.Jetcarstunts2Activity` directly after install,
clean-data reset, permission grants, log clearing, and display/sensor posture.
That path is the default for APK iteration because it proves the real game
runtime can focus, render, log, and avoid crash/ANR evidence without depending
on launcher UI responsiveness. To test the launcher route explicitly, use:

```powershell
.\scripts\run_jcs2_llm_iteration.ps1 -ApkPath .\jcs2-mod.apk -Mode Smoke -SmokeLaunchStrategy LauncherThenGame
```

Other modes:

```powershell
.\scripts\run_jcs2_llm_iteration.ps1 -ApkPath .\jcs2-mod.apk -Mode StraightOn
.\scripts\run_jcs2_llm_iteration.ps1 -ApkPath .\jcs2-mod.apk -Mode FreecamGestures
.\scripts\run_jcs2_llm_iteration.ps1 -ApkPath .\jcs2-mod.apk -Mode ReplaySwarm
```

Each run cold-stabilizes the emulator surface, installs the APK, clears app data,
grants storage permissions, clears logs, sets landscape `480x320`, and applies
the proven straight-driving posture:

```powershell
adb emu sensor set acceleration 9.80665:0:0
adb emu sensor set gyroscope 0:0:0
adb emu sensor set orientation 0:0:90
```

For current patched clean-data builds, the runner does not toggle
`Accelerate with jet`; the stock default is expected to remain on. Straight On
runtime driving holds boost only.

## Artifacts

Runs are written under:

```text
_apk_build\llm-runtime\<timestamp>\
```

Important files:

- `summary.json` - compact machine-readable result, APK hash, text status counts,
  and artifact paths.
- `transcript.md` - LLM-friendly verified text transcript. Unverified text is
  marked as partial.
- `run.jsonl` - compact event log for the run.
- `contact-sheet.png` - screenshot overview for quick visual inspection.
- `text-visual-audit.html` - side-by-side text, OCR, screenshot overlays, and
  mismatch reasons.
- `steps\*.png` - screenshots captured by the wrapper.
- `*.window.xml` - UIAutomator hierarchy dumps where available.
- `*.text.json` - merged text evidence from XML, OCR, and visual checks.
- `*.ocr.txt` - full screenshot OCR and crop OCR.
- `*.overlay.png` - screenshot with XML/OCR text regions and match status.
- `logcat.txt`, `public_ycs2_mod_debug.log`,
  `public_ycs2_mod_native_crash.log` - runtime logs.

Delegated runtime harnesses write below the run's `child\` directory and are
post-processed into the same OCR/text/overlay audit format.

## Text Reliability Rules

The runtime does not trust text from one channel alone.

- UIAutomator text must have bounds inside the screenshot.
- Each used UIAutomator text node must map to a non-blank screenshot crop.
- Tesseract OCR is run against the full screenshot and targeted crops.
- Launcher/system UI text is considered verified only when OCR aligns with the
  UIAutomator text above the configured match threshold.
- OpenGL game frames may expose little or no UIAutomator text. Those frames use
  OCR when visible text exists and debug-log state markers for non-text state.
- `summary.json` records each text step as `verified`, `partial`, or `failed`.
- In `-TextValidation Required` mode, failed text/visual validation fails the
  run after artifacts are generated.

## Failure Recovery

The iteration runner captures failure logs and a failure screenshot. On ANR,
emulator disconnect, black frame, crash evidence, or EGL surface failure, it cold
restarts only the dedicated `emulator-5562` instance and retries once.

If the second attempt fails, inspect:

```text
summary.json
transcript.md
text-visual-audit.html
crash-lines.txt
failure-attempt-*.png
```

The runner may uninstall `modded.ycs2` inside `jcs2-llm-runtime` only when adb
reports a signing mismatch during install. It does not modify unrelated AVDs or
delete unrelated repo artifacts.
