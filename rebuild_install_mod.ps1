param(
    [string]$ApkPath = "jcs2-mod.apk",
    [string]$Package = "modded.ycs2",
    [switch]$SkipBuild,
    [switch]$SkipInstall,
    [string]$Adb = "$env:LOCALAPPDATA\Android\Sdk\platform-tools\adb.exe"
)

$ErrorActionPreference = "Stop"
$Root = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $Root

if (-not $SkipBuild) {
    Write-Host "Building signed mod APK..."
    & (Join-Path $Root "build_apk.ps1")
    if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
}

$apk = Join-Path $Root $ApkPath
if (-not (Test-Path -LiteralPath $apk)) {
    throw "APK not found: $apk"
}

if ($SkipInstall) {
    Write-Host "Built $apk (install skipped)."
    exit 0
}

if (-not (Test-Path -LiteralPath $Adb)) {
    throw "adb not found: $Adb"
}

$devices = & $Adb devices
$connected = @($devices | Where-Object { $_ -match "device$" })
if ($connected.Count -lt 1) {
    throw "No adb device connected."
}

Write-Host "Installing $apk on device..."
& $Adb install -r $apk
if ($LASTEXITCODE -ne 0) {
    throw "adb install failed with exit code $LASTEXITCODE"
}

Write-Host "Installed $Package from $apk"
