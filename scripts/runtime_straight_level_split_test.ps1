param(
    [string]$ApkPath = "jcs2-mod.apk",
    [string]$Package = "modded.ycs2",
    [string]$LauncherActivity = "com.trueaxis.modmenu.ModLauncherActivity",
    [ValidateSet("LandscapeRight", "LandscapeLeft")]
    [string]$LandscapeSide = "LandscapeLeft",
    [string]$StraightAcceleration = "9.80665:0:0",
    [string]$StraightOrientation = "0:0:90",
    [ValidateSet("RegularStraightOn", "UserLevelSearch")]
    [string]$LevelMode = "RegularStraightOn",
    [string]$RegularLevelName = "Straight On",
    [string]$LevelSearch = "Straight level for testing",
    [int]$DriveHoldMs = 70000,
    [int]$AcceleratorX = 444,
    [int]$AcceleratorY = 204,
    [int]$BoostX = 36,
    [int]$BoostY = 204,
    [bool]$EnableAccelerateWithJet = $true,
    [switch]$UseAcceleratorHold,
    [switch]$UseSeparateBoostTouch,
    [int]$GameStartupWaitSeconds = 60,
    [bool]$ClearAppDataBeforeRun = $true,
    [bool]$ForceLoginDismissTap = $true,
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

function DismissUpdatePromptIfPresent {
    $xml = Dump-WindowXml
    if ($xml -like "*Update available*" -and $xml -like "*Later*") {
        $xml | Set-Content -LiteralPath (Join-Path $RunDir "update-prompt.xml") -Encoding UTF8
        Tap-WindowTextFromXml "Later" $xml
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
    # Positive X gravity is the verified straight/neutral posture for the
    # emulator JCS2 runtime: acceleration = 9.80665:0:0.
    Invoke-Adb emu sensor set acceleration $StraightAcceleration
    Invoke-Adb emu sensor set gyroscope "0:0:0"
    Invoke-Adb emu sensor set orientation $StraightOrientation
    "landscape_side=$LandscapeSide acceleration=$StraightAcceleration gyroscope=0:0:0 orientation=$StraightOrientation" |
        Set-Content -LiteralPath (Join-Path $RunDir "sensor-posture.txt") -Encoding UTF8
}

function Start-TouchHold {
    param(
        [string]$Name,
        [int]$X,
        [int]$Y,
        [int]$DurationMs
    )
    Start-Job -Name $Name -ScriptBlock {
        param([string]$AdbPath, [int]$TouchX, [int]$TouchY, [int]$HoldMs)
        & $AdbPath shell input swipe $TouchX $TouchY $TouchX $TouchY $HoldMs
    } -ArgumentList $Adb, $X, $Y, $DurationMs
}

function Wait-TouchHold {
    param([object[]]$Jobs)
    foreach ($job in $Jobs) {
        if ($null -eq $job) { continue }
        Wait-Job -Job $job | Out-Null
        Receive-Job -Job $job | Out-Null
        Remove-Job -Job $job
    }
}

function Enable-LauncherOptions {
    $initialXml = ""
    for ($i = 0; $i -lt 40; $i++) {
        if (DismissPermissionDialogIfPresent) {
            Start-Sleep -Milliseconds 800
            continue
        }
        if (DismissUpdatePromptIfPresent) {
            Start-Sleep -Milliseconds 800
            continue
        }
        $xml = Dump-WindowXml
        if ($xml -like "*Start game*") {
            $initialXml = $xml
            break
        }
        Start-Sleep -Milliseconds 500
    }
    if ($initialXml -notlike "*Start game*") {
        $initialXml = Dump-WindowXml
        $initialXml | Set-Content -LiteralPath (Join-Path $RunDir "launcher-start-missing.xml") -Encoding UTF8
        throw "Timed out waiting for window text: Start game"
    }
    $initialXml | Set-Content -LiteralPath (Join-Path $RunDir "launcher-initial.xml") -Encoding UTF8
    DismissPermissionDialogIfPresent | Out-Null
    foreach ($text in @(
        "Enable checkpoint/sector deltas vs saved replay ghost",
        "Show consecutive splits as an on-screen list"
    )) {
        $xml = Dump-WindowXml
        if ($xml -notlike "*$text*") { continue }
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
    Start-Sleep -Milliseconds 500
    $xml = Wait-ForWindowText "Start game" 10
    $xml | Set-Content -LiteralPath (Join-Path $RunDir "launcher-before-start.xml") -Encoding UTF8
    Tap 240 282
}

function Enable-AccelerateWithJetOption {
    if (-not $EnableAccelerateWithJet) { return }

    if ($ClearAppDataBeforeRun) {
        Write-Host "Enabling stock Accelerate with jet from clean OFF default"
    } else {
        Write-Host "Enabling stock Accelerate with jet; persisted state is assumed OFF for this proof run"
    }

    # Native GL menu path from the main menu: Help and Options -> Settings.
    Tap 270 195
    Start-Sleep -Seconds 2
    Save-Screenshot "01c-help-and-options.png"
    Tap 220 135
    Start-Sleep -Seconds 2
    Save-Screenshot "01d-settings-top.png"

    # Clean app data starts with ACCELERATE WITH JET: OFF in the stock menu.
    # Tap that exact row once so a single held afterburner/boost button also
    # drives the accelerator while preserving the user's straight sensor posture.
    Save-Screenshot "01e-accelerate-with-jet-before.png"
    Tap 235 145
    Start-Sleep -Seconds 1
    Save-Screenshot "01f-accelerate-with-jet-after.png"

    Tap 88 292
    Start-Sleep -Seconds 1
    Save-Screenshot "01g-help-and-options-after-accelerate-with-jet.png"
    Tap 88 267
    Start-Sleep -Seconds 2
    Save-Screenshot "01h-main-menu-after-accelerate-with-jet.png"
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
        return $true
    }
    return $false
}

function Dismiss-StartupLoginOverlay {
    if (Dismiss-LoginOverlayIfPresent) { return }
    if (-not $ForceLoginDismissTap) { return }
    Dump-WindowXml | Set-Content -LiteralPath (Join-Path $RunDir "login-overlay-fallback-window.xml") -Encoding UTF8
    # On fresh installs the stock login overlay is drawn inside the GL surface,
    # so uiautomator often cannot see its text. The PLAY control is at the
    # bottom-right of the 480x320 landscape surface.
    Tap 414 299
    Start-Sleep -Seconds 3
}

function Open-UserLevelReplayRace {
    Write-Host "Opening user level search: $LevelSearch"
    Tap 260 230
    Start-Sleep -Seconds 2
    Dismiss-LoginOverlayIfPresent | Out-Null
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
}

function Open-RegularStraightOnReplayRace {
    Write-Host "Opening regular level: $RegularLevelName"
    Tap 190 96
    Start-Sleep -Seconds 4
    Dismiss-LoginOverlayIfPresent | Out-Null
    Close-ExternalBrowserIfPresent | Out-Null
    Save-Screenshot "02-regular-play-open.png"

    # Straight On is the first stock platforming track. If PLAY opened the level
    # list instead of the detail page, this selects it; on the detail page this
    # top-left tap is harmless.
    Tap 115 84
    Start-Sleep -Seconds 4
    Dismiss-LoginOverlayIfPresent | Out-Null
    Close-ExternalBrowserIfPresent | Out-Null
    Save-Screenshot "03-regular-straight-on-detail.png"

    Write-Host "Opening regular-level passive replay"
    Tap 217 298
    Start-Sleep -Seconds 10
    Save-Screenshot "05-passive-replay.png"
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
if ($ClearAppDataBeforeRun) {
    Write-Host "Clearing app data for deterministic regular-level startup"
    Invoke-Adb shell pm clear $Package | Out-Host
}
Invoke-Adb shell am force-stop $Package
Invoke-Adb shell am force-stop com.android.chrome
Invoke-Adb shell rm -f /sdcard/YCS2CommunityMod/logs/ycs2_mod_debug.log /sdcard/YCS2CommunityMod/logs/ycs2_mod_native_crash.log
Invoke-Adb logcat -c
Set-LandscapeNeutralSensors

Write-Host "Launching YCS2 and enabling split timing diagnostics"
Invoke-Adb shell am start -n "${Package}/${LauncherActivity}" | Out-Null
Enable-LauncherOptions
Start-Sleep -Seconds $GameStartupWaitSeconds
Set-LandscapeNeutralSensors
Save-Screenshot "01-main-menu.png"
Dismiss-StartupLoginOverlay
Close-ExternalBrowserIfPresent | Out-Null
Start-Sleep -Seconds 2
Save-Screenshot "01b-main-menu-after-login-dismiss.png"
Enable-AccelerateWithJetOption

if ($LevelMode -eq "RegularStraightOn") {
    Open-RegularStraightOnReplayRace
} else {
    Open-UserLevelReplayRace
}
Collect-Evidence
$passiveDebug = Get-Content -LiteralPath (Join-Path $RunDir "public_ycs2_mod_debug.log") -Raw
$passiveSplitCount = ([regex]::Matches($passiveDebug, "split checkpoint=")).Count

Write-Host "Starting race against replay ghost"
Tap 414 302
Start-Sleep -Seconds 4
Set-LandscapeNeutralSensors
Close-ExternalBrowserIfPresent | Out-Null
Save-Screenshot "06-race-start.png"

if ($UseSeparateBoostTouch) {
    $driveMode = "accelerator + boost"
    $holdJobs = @(
        (Start-TouchHold "accelerator-hold" $AcceleratorX $AcceleratorY $DriveHoldMs),
        (Start-TouchHold "boost-hold" $BoostX $BoostY $DriveHoldMs)
    )
} elseif ($UseAcceleratorHold) {
    $driveMode = "accelerator only"
    $holdJobs = @(
        (Start-TouchHold "accelerator-hold" $AcceleratorX $AcceleratorY $DriveHoldMs)
    )
} else {
    $driveMode = "boost only with Accelerate with jet"
    $holdJobs = @(
        (Start-TouchHold "boost-hold" $BoostX $BoostY $DriveHoldMs)
    )
}
Write-Host "Holding $driveMode for ${DriveHoldMs}ms"
$driveStart = Get-Date
$nextCapture = 15
try {
    while (((Get-Date) - $driveStart).TotalMilliseconds -lt $DriveHoldMs) {
        Set-LandscapeNeutralSensors
        Close-ExternalBrowserIfPresent | Out-Null
        $elapsed = [int](((Get-Date) - $driveStart).TotalSeconds)
        if ($elapsed -ge $nextCapture) {
            Save-Screenshot ("07-race-hold-{0:D2}.png" -f $elapsed)
            Collect-Evidence
            $nextCapture += 15
        }
        Start-Sleep -Milliseconds 500
    }
} finally {
    Wait-TouchHold $holdJobs
}

Save-Screenshot "08-race-final.png"
Collect-Evidence
Assert-NoCrashEvidence

$debug = Get-Content -LiteralPath (Join-Path $RunDir "public_ycs2_mod_debug.log") -Raw
$splitLines = ($debug -split "`n") | Where-Object { $_ -match "split checkpoint=" }
$ghostCheckpointLines = ($debug -split "`n") | Where-Object { $_ -match "ghost checkpoint=" }
$redPositive = $splitLines | Where-Object { $_ -match "delta_ms=[1-9]\d*" -and $_ -match "color=red" }
$postRaceSplitCount = $splitLines.Count
$splitLines | Set-Content -LiteralPath (Join-Path $RunDir "split_timing_lines.txt") -Encoding UTF8
$ghostCheckpointLines | Set-Content -LiteralPath (Join-Path $RunDir "ghost_checkpoint_lines.txt") -Encoding UTF8

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

$armedRows = foreach ($line in ($debug -split "`n")) {
    $match = [regex]::Match(
        $line,
        "split armed reason=(?<reason>\w+) live_count=(?<live_count>-?\d+) ghost_count=(?<ghost_count>-?\d+) ghost_size=(?<ghost_size>-?\d+)"
    )
    if ($match.Success) {
        [pscustomobject]@{
            reason = $match.Groups["reason"].Value
            live_count = [int]$match.Groups["live_count"].Value
            ghost_count = [int]$match.Groups["ghost_count"].Value
            ghost_size = [int]$match.Groups["ghost_size"].Value
        }
    }
}

$ghostRows = foreach ($line in $ghostCheckpointLines) {
    $match = [regex]::Match($line, "ghost checkpoint=(?<checkpoint>\d+) ghost_ms=(?<ghost_ms>-?\d+)")
    if ($match.Success) {
        [pscustomobject]@{
            checkpoint = [int]$match.Groups["checkpoint"].Value
            ghost_ms = [int]$match.Groups["ghost_ms"].Value
        }
    }
}
if ($ghostRows) {
    $ghostRows | Export-Csv -NoTypeInformation -LiteralPath (Join-Path $RunDir "ghost_checkpoint_analysis.csv")
}

$proofLines = New-Object System.Collections.Generic.List[string]
$proofLines.Add("runtime_route=RegularStraightOn stock_level=$RegularLevelName")
$proofLines.Add("input_posture=acceleration:$StraightAcceleration orientation:$StraightOrientation drive_mode:$driveMode")
$proofLines.Add("passive_split_checkpoint_lines=$passiveSplitCount")
$proofLines.Add("post_race_split_checkpoint_lines=$postRaceSplitCount")

$maxArmedGhostCount = 0
if ($armedRows) {
    $maxArmedGhostCount = [int](($armedRows | Measure-Object -Property ghost_count -Maximum).Maximum)
}
if ($maxArmedGhostCount -gt 0) {
    $proofLines.Add("armed_ghost_checkpoint_count=$maxArmedGhostCount")
}
if ($ghostRows) {
    $ghostGroups = $ghostRows | Group-Object -Property checkpoint | Sort-Object { [int]$_.Name }
    $uniqueGhostCheckpoints = @($ghostGroups | ForEach-Object { [int]$_.Name })
    $expectedGhostCheckpointCount = [int][Math]::Max($maxArmedGhostCount, ($uniqueGhostCheckpoints | Measure-Object -Maximum).Maximum)
    $proofLines.Add("ghost_checkpoint_rows=$($ghostRows.Count)")
    $proofLines.Add("unique_ghost_checkpoints=$($uniqueGhostCheckpoints -join ',')")

    $missingGhost = New-Object System.Collections.Generic.List[int]
    for ($checkpoint = 1; $checkpoint -le $expectedGhostCheckpointCount; $checkpoint++) {
        if ($uniqueGhostCheckpoints -notcontains $checkpoint) {
            [void]$missingGhost.Add($checkpoint)
        }
    }

    $badGhostRows = New-Object System.Collections.Generic.List[string]
    foreach ($group in $ghostGroups) {
        $row = $group.Group | Select-Object -First 1
        if ($row.ghost_ms -le 0) {
            [void]$badGhostRows.Add("checkpoint $($row.checkpoint) has non-positive ghost_ms=$($row.ghost_ms)")
        }
        $proofLines.Add(("ghost_checkpoint={0} ghost_ms={1} samples={2}" -f $row.checkpoint, $row.ghost_ms, $group.Count))
    }

    if ($missingGhost.Count -gt 0) {
        $proofLines.Add("missing_ghost_checkpoints=$($missingGhost -join ',')")
        $proofLines | Set-Content -LiteralPath (Join-Path $RunDir "straight_on_split_proof.txt") -Encoding UTF8
        throw "Straight On did not record every stock ghost checkpoint time. Missing: $($missingGhost -join ','). See $RunDir"
    }
    if ($badGhostRows.Count -gt 0) {
        $badGhostRows | Set-Content -LiteralPath (Join-Path $RunDir "ghost_checkpoint_bad_rows.txt") -Encoding UTF8
        $proofLines | Set-Content -LiteralPath (Join-Path $RunDir "straight_on_split_proof.txt") -Encoding UTF8
        throw "Straight On ghost checkpoint timing rows failed consistency checks. See $RunDir\ghost_checkpoint_bad_rows.txt"
    }
} elseif ($maxArmedGhostCount -gt 0) {
    $proofLines | Set-Content -LiteralPath (Join-Path $RunDir "straight_on_split_proof.txt") -Encoding UTF8
    throw "Straight On armed $maxArmedGhostCount ghost checkpoints but logged none. See $RunDir"
}

if ($timingRows) {
    $maxGhostCount = ($timingRows | Measure-Object -Property effective_ghost_count -Maximum).Maximum
    $maxHeaderCheckpoints = ($timingRows | Measure-Object -Property replay_header_checkpoints -Maximum).Maximum
    $expectedCheckpointCount = [int][Math]::Max($maxGhostCount, $maxHeaderCheckpoints)
    $checkpointGroups = $timingRows | Group-Object -Property checkpoint | Sort-Object { [int]$_.Name }
    $uniqueCheckpoints = @($checkpointGroups | ForEach-Object { [int]$_.Name })
    $proofLines.Add("expected_checkpoint_count=$expectedCheckpointCount")
    $proofLines.Add("unique_recorded_checkpoints=$($uniqueCheckpoints -join ',')")

    if ($expectedCheckpointCount -lt 1) {
        throw "Could not determine Straight On ghost checkpoint count. See $RunDir"
    }

    $missing = New-Object System.Collections.Generic.List[int]
    for ($checkpoint = 1; $checkpoint -le $expectedCheckpointCount; $checkpoint++) {
        if ($uniqueCheckpoints -notcontains $checkpoint) {
            [void]$missing.Add($checkpoint)
        }
    }
    if ($missing.Count -gt 0) {
        $proofLines.Add("missing_checkpoints=$($missing -join ',')")
        $proofLines | Set-Content -LiteralPath (Join-Path $RunDir "straight_on_split_proof.txt") -Encoding UTF8
        throw "Straight On did not record every checkpoint split. Missing: $($missing -join ','). See $RunDir"
    }

    $badRows = New-Object System.Collections.Generic.List[string]
    foreach ($row in $timingRows) {
        if ($row.checkpoint -lt 1 -or $row.checkpoint -gt $expectedCheckpointCount) {
            [void]$badRows.Add("checkpoint $($row.checkpoint) outside 1..$expectedCheckpointCount")
        }
        if ($row.current_ms -le 0 -or $row.ghost_ms -le 0) {
            [void]$badRows.Add("checkpoint $($row.checkpoint) has non-positive current/ghost time current=$($row.current_ms) ghost=$($row.ghost_ms)")
        }
        if ($row.delta_ms -ne ($row.current_ms - $row.ghost_ms)) {
            [void]$badRows.Add("checkpoint $($row.checkpoint) delta mismatch delta=$($row.delta_ms) current-minus-ghost=$($row.current_ms - $row.ghost_ms)")
        }
        if ($row.live_appended_ms -gt 0 -and $row.current_ms -ne $row.live_appended_ms) {
            [void]$badRows.Add("checkpoint $($row.checkpoint) current_ms=$($row.current_ms) did not use appended live checkpoint time $($row.live_appended_ms)")
        }
        if ($row.live_appended_ms -gt 0 -and $row.live_cp_ms -gt 0 -and $row.live_cp_ms -eq $row.ghost_ms -and $row.current_ms -eq $row.live_cp_ms) {
            [void]$badRows.Add("checkpoint $($row.checkpoint) reused ghost baseline time as live checkpoint time")
        }
    }
    if ($badRows.Count -gt 0) {
        $badRows | Set-Content -LiteralPath (Join-Path $RunDir "split_timing_bad_rows.txt") -Encoding UTF8
        $proofLines | Set-Content -LiteralPath (Join-Path $RunDir "straight_on_split_proof.txt") -Encoding UTF8
        throw "Straight On split timing rows failed consistency checks. See $RunDir\split_timing_bad_rows.txt"
    }

    foreach ($group in $checkpointGroups) {
        $row = $group.Group | Select-Object -Last 1
        $proofLines.Add(("checkpoint={0} current_ms={1} ghost_ms={2} delta_ms={3} live_appended_ms={4} samples={5}" -f `
            $row.checkpoint, $row.current_ms, $row.ghost_ms, $row.delta_ms, $row.live_appended_ms, $group.Count))
    }
}
$proofLines | Set-Content -LiteralPath (Join-Path $RunDir "straight_on_split_proof.txt") -Encoding UTF8

$summary = @(
    "apk=$ApkPath",
    "package=$Package",
    "level_mode=$LevelMode",
    "regular_level=$RegularLevelName",
    "level_search=$LevelSearch",
    "landscape_side=$LandscapeSide",
    "straight_acceleration=$StraightAcceleration straight_orientation=$StraightOrientation",
    "drive_hold_ms=$DriveHoldMs drive_mode=$driveMode accelerate_with_jet=$EnableAccelerateWithJet accelerator=${AcceleratorX},${AcceleratorY} use_accelerator_hold=$UseAcceleratorHold separate_boost_touch=$UseSeparateBoostTouch boost=${BoostX},${BoostY}",
    "game_startup_wait_seconds=$GameStartupWaitSeconds",
    "clear_app_data_before_run=$ClearAppDataBeforeRun",
    "force_login_dismiss_tap=$ForceLoginDismissTap",
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
    if (-not $ghostRows -or $maxArmedGhostCount -lt 1) {
        throw "No checkpoint splits or stock ghost checkpoint timings registered while racing the ghost. See $RunDir"
    }
}

Write-Host "Straight-level split/runtime test passed. Artifacts: $RunDir"
