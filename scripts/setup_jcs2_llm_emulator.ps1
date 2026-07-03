param(
    [string]$AvdName = "jcs2-llm-runtime",
    [int]$ConsolePort = 5562,
    [int]$AdbPort = 5563,
    [ValidateSet("swiftshader_indirect", "host", "auto")]
    [string]$Gpu = "swiftshader_indirect",
    [int]$Width = 480,
    [int]$Height = 320,
    [int]$Density = 160,
    [string]$Adb = "",
    [string]$Emulator = "",
    [string]$TesseractExe = "",
    [switch]$Recreate,
    [switch]$Start,
    [switch]$Headless,
    [switch]$PreflightOnly
)

$ErrorActionPreference = "Stop"
$Root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
Set-Location $Root
. (Join-Path $Root "scripts\lib\Jcs2Emu.ps1")

Write-Host "Preflighting JCS2 LLM emulator dependencies"
$preflight = Test-Jcs2RuntimePreflight -Adb $Adb -Emulator $Emulator -TesseractExe $TesseractExe
$adbPath = Get-Jcs2Adb $Adb
$emulatorPath = Get-Jcs2Emulator $Emulator

$pythonSelfTest = & python (Join-Path $Root "scripts\extract_jcs2_runtime_text.py") self-test --tesseract $preflight.Tesseract 2>&1
if ($LASTEXITCODE -ne 0) {
    throw "OCR self-test failed. Output:`n$($pythonSelfTest -join "`n")"
}

if (-not $PreflightOnly) {
    Write-Host "Creating/verifying AVD $AvdName"
    $avd = New-Jcs2AvdConfig -AvdName $AvdName -Recreate:$Recreate
} else {
    $avd = [pscustomobject]@{
        AvdName = $AvdName
        AvdDir = Get-Jcs2AvdDir $AvdName
        AvdIni = Get-Jcs2AvdIni $AvdName
    }
}

$serial = "emulator-$ConsolePort"
if ($Start) {
    if (-not (Test-Path -LiteralPath $avd.AvdIni)) {
        throw "AVD is not configured yet: $($avd.AvdIni). Run without -PreflightOnly first."
    }
    $devices = & $adbPath devices 2>$null
    if (($devices -join "`n") -notmatch [regex]::Escape($serial)) {
        Write-Host "Starting $AvdName on $serial"
        Start-Jcs2Emulator -AvdName $AvdName -Emulator $emulatorPath -ConsolePort $ConsolePort -AdbPort $AdbPort -Gpu $Gpu -Headless:$Headless | Out-Null
    } else {
        Write-Host "$serial is already visible to adb"
    }
    Wait-Jcs2DeviceBoot -Adb $adbPath -Serial $serial -Seconds 300
    Set-Jcs2RuntimeDisplay -Adb $adbPath -Serial $serial -Width $Width -Height $Height -Density $Density
    Set-Jcs2StraightSensors -Adb $adbPath -Serial $serial
}

$summary = [pscustomobject]@{
    avd_name = $AvdName
    avd_dir = $avd.AvdDir
    avd_ini = $avd.AvdIni
    serial = $serial
    adb = $adbPath
    emulator = $emulatorPath
    sdk_root = $preflight.SdkRoot
    system_image = $preflight.SystemImage
    gpu = $Gpu
    width = $Width
    height = $Height
    density = $Density
    tesseract = $preflight.Tesseract
    tesseract_version = $preflight.TesseractVersion
    acceleration = $preflight.Acceleration
    started = [bool]$Start
}

$summary | ConvertTo-Json -Depth 5
