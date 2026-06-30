param(
    [string]$Adb = "$env:LOCALAPPDATA\Android\Sdk\platform-tools\adb.exe",
    [string]$Remote = "/sdcard/YCS2CommunityMod/logs/ycs2_mod_debug.log",
    [string]$Local = "",
    [switch]$AgentOnly
)

$ErrorActionPreference = "Stop"
$Root = Split-Path -Parent $MyInvocation.MyCommand.Path
if (-not $Local) {
    $Local = Join-Path $Root "ycs2_mod_debug.log"
}
if (-not (Test-Path -LiteralPath $Adb)) {
    Write-Warning "adb not found. On your phone, open Internal storage/YCS2CommunityMod/logs/ycs2_mod_debug.log manually."
    exit 1
}
$devices = & $Adb devices 2>$null | Where-Object { $_ -match "device$" }
if (-not $devices) {
    Write-Warning "No adb device. Copy ycs2_mod_debug.log from the phone: Internal storage/YCS2CommunityMod/logs/"
    exit 1
}
& $Adb pull $Remote $Local
if ($LASTEXITCODE -ne 0) {
    Write-Warning "adb pull failed. Copy the log from the phone file manager instead."
    exit 1
}
Write-Host "Pulled mod debug log to $Local"
if ($AgentOnly) {
    Select-String -Path $Local -Pattern "\[agentdbg\]" | ForEach-Object { $_.Line }
}
