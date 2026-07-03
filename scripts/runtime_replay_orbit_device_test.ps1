param(
    [string]$ApkPath = "jcs2-mod.apk",
    [string]$Package = "modded.ycs2",
    [string]$Adb = "$env:LOCALAPPDATA\Android\Sdk\platform-tools\adb.exe"
)

$ErrorActionPreference = "Stop"
$Root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
Set-Location $Root

if (-not (Test-Path -LiteralPath $Adb)) {
    throw "adb not found: $Adb"
}
if (-not (Test-Path -LiteralPath $ApkPath)) {
    throw "APK not found: $ApkPath"
}

$devices = & $Adb devices | Select-String -Pattern "`tdevice$"
if ($devices.Count -ne 1) {
    throw "Expected exactly one attached Android device, found $($devices.Count)."
}

$isEmulator = ((& $Adb shell getprop ro.kernel.qemu 2>$null) -join "").Trim()
$model = ((& $Adb shell getprop ro.product.model 2>$null) -join "").Trim()
if ($isEmulator -eq "1" -or $model -match "sdk|emulator|gphone") {
    throw "Refusing emulator target '$model'. Use a real device with the TrueAxis-connected profile and previous replays."
}

Write-Host "Running orbit replay proof on real device: $model"
Write-Host "Installing fresh APK over existing app data so TrueAxis/profile/replays are preserved."

& (Join-Path $Root "scripts\runtime_replay_freecam_gesture_test.ps1") `
    -ApkPath $ApkPath `
    -Package $Package `
    -ClearAppDataBeforeRun:$false `
    -EnableAccelerateWithJet:$false `
    -UsePassiveReplay:$true `
    -Adb $Adb
