# orbit_snap.ps1 - one-command, reproducible orbit-replay snapshot macro.
#
# Drives the emulator to the Straight On "View Replay" playback (an existing
# replay -- no race needed), waits for the managed Orbit camera diagnostics,
# captures the four quadrant screenshots (back/left/front/right, a quarter
# revolution apart), magnifies their centres into *-crop.png, and prints a
# one-line verdict with the artifact directory.
#
# Usage:
#   scripts\orbit_snap.ps1                 # app already installed
#   scripts\orbit_snap.ps1 -InstallApk     # (re)install jcs2-mod.apk first
#   scripts\orbit_snap.ps1 -FreshAppData   # also clear app data (re-shows login/tutorials)
param(
    [switch]$InstallApk,
    [switch]$FreshAppData,
    [string]$Adb = "$env:LOCALAPPDATA\Android\Sdk\platform-tools\adb.exe"
)

$ErrorActionPreference = "Stop"
$Root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
Set-Location $Root

$devices = (& $Adb devices) -join "`n"
if ($devices -notmatch "emulator-\d+\s+device") {
    throw "No emulator online. Start one first (scripts\lib\Jcs2Emu.ps1: Start-Jcs2Emulator -AvdName jcs2-llm-runtime)."
}

& scripts\runtime_replay_freecam_gesture_test.ps1 `
    -UsePassiveReplay $true `
    -SkipInstall (-not $InstallApk) `
    -ClearAppDataBeforeRun ([bool]$FreshAppData) `
    -EnableAccelerateWithJet $false `
    -GameStartupWaitSeconds 30
if ($LASTEXITCODE -ne 0) { throw "orbit snapshot harness run failed" }

$run = Get-ChildItem "_apk_build\runtime-freecam-gestures" -Directory |
    Where-Object { $_.Name -match '^\d{8}-\d{6}$' } |
    Sort-Object Name -Descending | Select-Object -First 1

Add-Type -AssemblyName System.Drawing
$shots = @('06a-orbit-back', '06b-orbit-left-side', '06c-orbit-front', '06d-orbit-right-side')
foreach ($name in $shots) {
    $path = Join-Path $run.FullName "$name.png"
    if (-not (Test-Path -LiteralPath $path)) { continue }
    $src = [System.Drawing.Bitmap]::FromFile($path)
    # Centre 200x140 of the 480x320 frame, 3x nearest-neighbour magnified.
    $crop = $src.Clone((New-Object System.Drawing.Rectangle 140, 90, 200, 140), $src.PixelFormat)
    $big = New-Object System.Drawing.Bitmap 600, 420
    $g = [System.Drawing.Graphics]::FromImage($big)
    $g.InterpolationMode = 'NearestNeighbor'
    $g.DrawImage($crop, 0, 0, 600, 420)
    $big.Save((Join-Path $run.FullName "$name-crop.png"))
    $g.Dispose(); $big.Dispose(); $crop.Dispose(); $src.Dispose()
}

$diag = (Get-Content (Join-Path $run.FullName "public_ycs2_mod_debug.log") -ErrorAction SilentlyContinue) |
    Select-String "orbit_diag" | Select-Object -Last 1
Write-Host "orbit_snap=done artifacts=$($run.FullName)"
if ($diag) { Write-Host ($diag.Line -replace '.*\[freecam\] ', 'diag: ') }
Write-Host "screenshots + centre crops: $($shots -join ', ')"
