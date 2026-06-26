param(
    [string]$ApkPath = "jcs2-mod.apk",
    [string]$Package = "modded.ycs2",
    [string]$LauncherActivity = "com.trueaxis.modmenu.ModLauncherActivity",
    [ValidateSet("LandscapeRight", "LandscapeLeft")]
    [string]$LandscapeSide = "LandscapeRight",
    [string]$LevelSearch = "Straight level for testing",
    [int]$BoostPulses = 55,
    [int]$PulseMs = 900,
    [string]$Adb = "$env:LOCALAPPDATA\Android\Sdk\platform-tools\adb.exe",
    [string]$OutDir = "_apk_build\runtime-straight-splits"
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

$RunDir = Join-Path $OutDir (Get-Date -Format "yyyyMMdd-HHmmss")
New-Item -ItemType Directory -Force -Path $RunDir | Out-Null

function Invoke-Adb {
    param([Parameter(ValueFromRemainingArguments = $true)][object[]]$AdbArgs)
    $flat = Expand-AdbArgs $AdbArgs
    & $Adb @flat
    if ($LASTEXITCODE -ne 0) {
        throw "adb $($flat -join ' ') failed with exit code $LASTEXITCODE"
    }
}

function Read-AdbText {
    param([Parameter(ValueFromRemainingArguments = $true)][object[]]$AdbArgs)
    $flat = Expand-AdbArgs $AdbArgs
    try {
        $output = & $Adb @flat 2>$null
    } catch {
        return ""
    }
    if ($LASTEXITCODE -ne 0 -or $null -eq $output) { return "" }
    return ($output -join "`n")
}

function Expand-AdbArgs {
    param([object[]]$AdbArgs)
    $flat = New-Object System.Collections.Generic.List[string]
    foreach ($arg in $AdbArgs) {
        if ($arg -is [System.Array]) {
            foreach ($item in $arg) { [void]$flat.Add([string]$item) }
        } else {
            [void]$flat.Add([string]$arg)
        }
    }
    return $flat.ToArray()
}

function Save-AdbText {
    param(
        [string]$Path,
        [Parameter(ValueFromRemainingArguments = $true)][object[]]$AdbArgs
    )
    $text = Read-AdbText @AdbArgs
    Set-Content -LiteralPath $Path -Value $text -Encoding UTF8
    return $text
}

function Save-Screenshot {
    param([string]$Name)
    $path = Join-Path $RunDir $Name
    cmd /c "`"$Adb`" exec-out screencap -p > `"$path`""
    if ($LASTEXITCODE -ne 0) {
        throw "screencap failed for $path"
    }
}

function Dump-WindowXml {
    try { & $Adb shell uiautomator dump /sdcard/window.xml 1>$null 2>$null } catch {}
    return Read-AdbText shell cat /sdcard/window.xml
}

function Wait-ForWindowText {
    param([string]$Text, [int]$Seconds = 20)
    $deadline = (Get-Date).AddSeconds($Seconds)
    do {
        $xml = Dump-WindowXml
        if ($xml -like "*$Text*") { return $xml }
        Start-Sleep -Milliseconds 500
    } while ((Get-Date) -lt $deadline)
    throw "Timed out waiting for window text: $Text"
}

function Tap {
    param([int]$X, [int]$Y)
    Invoke-Adb shell input tap $X $Y
}

function Tap-WindowTextFromXml {
    param([string]$Text, [string]$Xml)
    $escaped = [regex]::Escape($Text)
    $match = [regex]::Match(
        $Xml,
        "text=`"$escaped`"[^>]*bounds=`"\[(\d+),(\d+)\]\[(\d+),(\d+)\]`"",
        [System.Text.RegularExpressions.RegexOptions]::Singleline
    )
    if (-not $match.Success) {
        throw "Could not find tappable bounds for window text: $Text"
    }
    $x1 = [int]$match.Groups[1].Value
    $y1 = [int]$match.Groups[2].Value
    $x2 = [int]$match.Groups[3].Value
    $y2 = [int]$match.Groups[4].Value
    Tap ([int](($x1 + $x2) / 2)) ([int](($y1 + $y2) / 2))
}

function DismissPermissionDialogIfPresent {
    $xml = Dump-WindowXml
    if ($xml -like "*permissioncontroller*" -and $xml -like "*Allow*") {
        $xml | Set-Content -LiteralPath (Join-Path $RunDir "permission-dialog.xml") -Encoding UTF8
        Tap-WindowTextFromXml "Allow" $xml
        Start-Sleep -Seconds 1
        return $true
    }
    return $false
}

function Tap-WindowText {
    param([string]$Text, [int]$Seconds = 20)
    $xml = Wait-ForWindowText $Text $Seconds
    Tap-WindowTextFromXml $Text $xml
}

function Set-LandscapeNeutralSensors {
    # Android sensor axes are physical device axes, not the rotated app UI axes.
    # A phone held upright in landscape has gravity on the physical X axis and
    # near-zero Y/Z. The sign depends on whether the top of the phone is left or
    # right; expose that as LandscapeSide so runtime evidence records it.
    $x = if ($LandscapeSide -eq "LandscapeRight") { "-9.80665" } else { "9.80665" }
    Invoke-Adb emu sensor set acceleration "${x}:0:0"
    Invoke-Adb emu sensor set gyroscope "0:0:0"
    $roll = if ($LandscapeSide -eq "LandscapeRight") { "-90" } else { "90" }
    Invoke-Adb emu sensor set orientation "0:0:$roll"
    "landscape_side=$LandscapeSide acceleration=${x}:0:0 gyroscope=0:0:0 orientation=0:0:$roll" |
        Set-Content -LiteralPath (Join-Path $RunDir "sensor-posture.txt") -Encoding UTF8
}

function Enable-LauncherOptions {
    for ($i = 0; $i -lt 8; $i++) {
        if (DismissPermissionDialogIfPresent) { break }
        $xml = Dump-WindowXml
        if ($xml -like "*Start game*") { break }
        Start-Sleep -Milliseconds 500
    }
    Wait-ForWindowText "Start game" 25 | Set-Content -LiteralPath (Join-Path $RunDir "launcher-initial.xml") -Encoding UTF8
    DismissPermissionDialogIfPresent | Out-Null
    foreach ($text in @(
        "Enable checkpoint/sector deltas vs saved replay ghost",
        "Show consecutive splits as an on-screen list"
    )) {
        $xml = ""
        for ($i = 0; $i -lt 10; $i++) {
            if (DismissPermissionDialogIfPresent) {
                Start-Sleep -Milliseconds 400
                continue
            }
            $xml = Dump-WindowXml
            if ($xml -like "*$text*") { break }
            Invoke-Adb shell input swipe 240 240 240 135 450
            Start-Sleep -Milliseconds 400
        }
        if ($xml -notlike "*$text*") {
            $xml | Set-Content -LiteralPath (Join-Path $RunDir "launcher-option-missing.xml") -Encoding UTF8
            throw "Timed out waiting for window text: $text"
        }
        $node = [regex]::Match(
            $xml,
            "text=`"$([regex]::Escape($text))`"[^>]*checked=`"(true|false)`"",
            [System.Text.RegularExpressions.RegexOptions]::Singleline
        )
        if (-not $node.Success -or $node.Groups[1].Value -ne "true") {
            Tap-WindowTextFromXml $text $xml
            DismissPermissionDialogIfPresent | Out-Null
            Start-Sleep -Milliseconds 400
        }
    }
    for ($i = 0; $i -lt 8; $i++) {
        Invoke-Adb shell input swipe 240 135 240 240 450
        Start-Sleep -Milliseconds 300
        $xml = Dump-WindowXml
        if ($xml -like "*Start game*") { break }
    }
    Start-Sleep -Milliseconds 500
    Tap-WindowText "Start game" 10
}

function Type-SearchText {
    param([string]$Text)
    if ([string]::IsNullOrEmpty($Text)) { return }
    $escaped = $Text.ToLowerInvariant().Replace(" ", "%s")
    Invoke-Adb shell input text $escaped
}

function Dismiss-LoginOverlayIfPresent {
    $xml = Dump-WindowXml
    if ($xml -like "*Facebook Connect*" -or $xml -like "*True Axis*" -and $xml -like "*PLAY*") {
        $xml | Set-Content -LiteralPath (Join-Path $RunDir "login-overlay.xml") -Encoding UTF8
        # The stock login card uses custom-drawn controls in the game surface;
        # uiautomator sees the prompt text but not always a tappable PLAY node.
        Tap 414 299
        Start-Sleep -Seconds 2
    }
}

function Close-ExternalBrowserIfPresent {
    $state = Read-AdbText shell dumpsys activity activities
    if ($state -match "com.android.chrome" -and $state -match "ResumedActivity: ActivityRecord\\{[^\\n]+com.android.chrome") {
        Invoke-Adb shell am force-stop com.android.chrome
        Start-Sleep -Seconds 1
        Invoke-Adb shell am start -n "${Package}/com.trueaxis.jetcarstunts2.Jetcarstunts2Activity" | Out-Null
        Start-Sleep -Seconds 2
        Set-LandscapeNeutralSensors
        return $true
    }
    return $false
}

function Collect-Evidence {
    Save-AdbText (Join-Path $RunDir "public_ycs2_mod_debug.log") shell cat /sdcard/YCS2CommunityMod/logs/ycs2_mod_debug.log | Out-Null
    Save-AdbText (Join-Path $RunDir "public_ycs2_mod_native_crash.log") shell cat /sdcard/YCS2CommunityMod/logs/ycs2_mod_native_crash.log | Out-Null
    Save-AdbText (Join-Path $RunDir "logcat.txt") logcat -d -t 4000 | Out-Null
    Dump-WindowXml | Set-Content -LiteralPath (Join-Path $RunDir "window.xml") -Encoding UTF8
}

function Assert-NoCrashEvidence {
    $debug = Get-Content -LiteralPath (Join-Path $RunDir "public_ycs2_mod_debug.log") -Raw -ErrorAction SilentlyContinue
    $native = Get-Content -LiteralPath (Join-Path $RunDir "public_ycs2_mod_native_crash.log") -Raw -ErrorAction SilentlyContinue
    $logcat = Get-Content -LiteralPath (Join-Path $RunDir "logcat.txt") -Raw -ErrorAction SilentlyContinue
    if ($debug -match "UNCAUGHT|split HUD poll failed|Could not install") {
        throw "Debug log contains mod failure evidence. See $RunDir"
    }
    if ($native -match "native fatal signal") {
        throw "Native crash log contains fatal signal evidence. See $RunDir"
    }
    $crashLines = $logcat -split "`n" | Where-Object {
        ($_ -match "FATAL EXCEPTION|Abort message|signal 11|ANR in|Application Not Responding|Input dispatching timed out") -and
        ($_ -match [regex]::Escape($Package) -or $_ -match "YCS2Mod|libjcs2mod|libtrueaxis")
    }
    if ($crashLines.Count -gt 0) {
        $crashLines | Set-Content -LiteralPath (Join-Path $RunDir "crash-lines.txt") -Encoding UTF8
        throw "logcat contains package crash/ANR evidence. See $RunDir\crash-lines.txt"
    }
}

Write-Host "Installing $ApkPath"
Invoke-Adb install -r $ApkPath | Out-Host
Invoke-Adb shell am force-stop $Package
Invoke-Adb shell am force-stop com.android.chrome
Invoke-Adb shell rm -f /sdcard/YCS2CommunityMod/logs/ycs2_mod_debug.log /sdcard/YCS2CommunityMod/logs/ycs2_mod_native_crash.log
Invoke-Adb logcat -c
Set-LandscapeNeutralSensors

Write-Host "Launching YCS2 and enabling split timing diagnostics"
Invoke-Adb shell am start -n "${Package}/${LauncherActivity}" | Out-Null
Enable-LauncherOptions
Start-Sleep -Seconds 35
Set-LandscapeNeutralSensors
Save-Screenshot "01-main-menu.png"
Dismiss-LoginOverlayIfPresent
Close-ExternalBrowserIfPresent | Out-Null
Start-Sleep -Seconds 2
Save-Screenshot "01b-main-menu-after-login-dismiss.png"

Write-Host "Opening user level search: $LevelSearch"
Tap 260 230
Start-Sleep -Seconds 2
Dismiss-LoginOverlayIfPresent
Close-ExternalBrowserIfPresent | Out-Null
Save-Screenshot "02-user-levels.png"
Tap 240 68
Start-Sleep -Seconds 2
Save-Screenshot "02b-search-focused.png"
for ($i = 0; $i -lt 35; $i++) { Invoke-Adb shell input keyevent KEYCODE_DEL }
Type-SearchText $LevelSearch
Start-Sleep -Seconds 1
Save-Screenshot "02c-search-typed.png"
Tap 444 302
Start-Sleep -Milliseconds 800
Start-Sleep -Seconds 8
Save-Screenshot "03-search-results.png"

Write-Host "Opening first search result and passive replay"
Tap 165 88
Start-Sleep -Seconds 20
Save-Screenshot "04-level-detail.png"
Tap 217 298
Start-Sleep -Seconds 10
Save-Screenshot "05-passive-replay.png"
Collect-Evidence
$passiveDebug = Get-Content -LiteralPath (Join-Path $RunDir "public_ycs2_mod_debug.log") -Raw
$passiveSplitCount = ([regex]::Matches($passiveDebug, "split checkpoint=")).Count

Write-Host "Starting race against replay ghost"
Tap 414 302
Start-Sleep -Seconds 4
Set-LandscapeNeutralSensors
Close-ExternalBrowserIfPresent | Out-Null
Save-Screenshot "06-race-start.png"

for ($i = 1; $i -le $BoostPulses; $i++) {
    if (($i % 10) -eq 1) {
        Close-ExternalBrowserIfPresent | Out-Null
    }
    Invoke-Adb shell input swipe 442 223 442 223 $PulseMs
    if (($i % 15) -eq 0) {
        Set-LandscapeNeutralSensors
        Save-Screenshot ("07-race-pulse-{0:D2}.png" -f $i)
        Collect-Evidence
    }
}

Save-Screenshot "08-race-final.png"
Collect-Evidence
Assert-NoCrashEvidence

$debug = Get-Content -LiteralPath (Join-Path $RunDir "public_ycs2_mod_debug.log") -Raw
$splitLines = ($debug -split "`n") | Where-Object { $_ -match "split checkpoint=" }
$redPositive = $splitLines | Where-Object { $_ -match "delta_ms=[1-9]\d*" -and $_ -match "color=red" }
$postRaceSplitCount = $splitLines.Count
$splitLines | Set-Content -LiteralPath (Join-Path $RunDir "split_timing_lines.txt") -Encoding UTF8

$timingRows = foreach ($line in $splitLines) {
    $match = [regex]::Match(
        $line,
        "split checkpoint=(?<checkpoint>-?\d+) current_ms=(?<current>-?\d+) ghost_ms=(?<ghost>-?\d+) delta_ms=(?<delta>-?\d+) cumulative_delta_ms=(?<cumulative>-?\d+) mode=(?<mode>\w+) last_checkpoint_ms=(?<last>-?\d+) scanned_checkpoint=(?<scanned>-?\d+) decoded_engine_checkpoint=(?<decoded>-?\d+) engine_checkpoint=(?<engine>-?\d+) selected_checkpoint=(?<selected>-?\d+) live_count=(?<live_count>-?\d+) effective_ghost_count=(?<effective_ghost_count>-?\d+) official_ghost_count=(?<official_ghost_count>-?\d+) live_cp_ms=(?<live_cp>-?\d+) live_appended_ms=(?<live_appended>-?\d+) official_ghost_cp_ms=(?<official_ghost_cp>-?\d+) replay_header_size=(?<header_size>-?\d+) replay_header_checkpoints=(?<header_checkpoints>-?\d+) replay_header_finish_ms=(?<header_finish>-?\d+)"
    )
    if ($match.Success) {
        [pscustomobject]@{
            checkpoint = [int]$match.Groups["checkpoint"].Value
            current_ms = [int]$match.Groups["current"].Value
            ghost_ms = [int]$match.Groups["ghost"].Value
            delta_ms = [int]$match.Groups["delta"].Value
            cumulative_delta_ms = [int]$match.Groups["cumulative"].Value
            mode = $match.Groups["mode"].Value
            last_checkpoint_ms = [int]$match.Groups["last"].Value
            scanned_checkpoint = [int]$match.Groups["scanned"].Value
            decoded_engine_checkpoint = [int]$match.Groups["decoded"].Value
            engine_checkpoint = [int]$match.Groups["engine"].Value
            selected_checkpoint = [int]$match.Groups["selected"].Value
            live_count = [int]$match.Groups["live_count"].Value
            effective_ghost_count = [int]$match.Groups["effective_ghost_count"].Value
            official_ghost_count = [int]$match.Groups["official_ghost_count"].Value
            live_cp_ms = [int]$match.Groups["live_cp"].Value
            live_appended_ms = [int]$match.Groups["live_appended"].Value
            official_ghost_cp_ms = [int]$match.Groups["official_ghost_cp"].Value
            replay_header_size = [int]$match.Groups["header_size"].Value
            replay_header_checkpoints = [int]$match.Groups["header_checkpoints"].Value
            replay_header_finish_ms = [int]$match.Groups["header_finish"].Value
        }
    }
}
if ($timingRows) {
    $timingRows | Export-Csv -NoTypeInformation -LiteralPath (Join-Path $RunDir "split_timing_analysis.csv")
}

$summary = @(
    "apk=$ApkPath",
    "package=$Package",
    "level_search=$LevelSearch",
    "landscape_side=$LandscapeSide",
    "boost_pulses=$BoostPulses pulse_ms=$PulseMs",
    "passive_split_checkpoint_lines=$passiveSplitCount",
    "post_race_split_checkpoint_lines=$postRaceSplitCount",
    "red_positive_split_lines=$($redPositive.Count)",
    "run_dir=$RunDir"
)
$summary | Set-Content -LiteralPath (Join-Path $RunDir "summary.txt") -Encoding UTF8

if ($passiveSplitCount -ne 0) {
    throw "Passive replay produced split checkpoint lines before Race. See $RunDir"
}
if ($postRaceSplitCount -eq 0) {
    throw "No checkpoint splits registered while racing the ghost. See $RunDir"
}

Write-Host "Straight-level split/runtime test passed. Artifacts: $RunDir"
