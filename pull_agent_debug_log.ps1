$ErrorActionPreference = "Stop"
$Root = Split-Path -Parent $MyInvocation.MyCommand.Path
$Adb = "$env:LOCALAPPDATA\Android\Sdk\platform-tools\adb.exe"
$Remote = "/sdcard/YCS2CommunityMod/logs/debug-04e8a3.log"
$Local = Join-Path $Root "debug-04e8a3.log"
if (-not (Test-Path -LiteralPath $Adb)) {
    throw "adb not found: $Adb"
}
& $Adb pull $Remote $Local
if ($LASTEXITCODE -ne 0) {
    throw "adb pull failed for $Remote"
}
Write-Host "Pulled agent debug log to $Local"
