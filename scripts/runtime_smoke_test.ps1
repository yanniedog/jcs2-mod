param(
    [string]$ApkPath = "jcs2-mod.apk",
    [string]$Package = "modded.ycs2",
    [string]$LauncherActivity = "com.trueaxis.modmenu.ModLauncherActivity",
    [int]$Cycles = 5,
    [int]$GameHoldSeconds = 30,
    [int]$MonkeyEvents = 0,
    [int]$MonkeyThrottleMs = 100,
    [switch]$MonkeyTouchOnly,
    [switch]$SkipClearData,
    [string[]]$ExtraPackagesToStop = @("com.trueaxis.jetcarstunts2"),
    [string]$Adb = "$env:LOCALAPPDATA\Android\Sdk\platform-tools\adb.exe",
    [string]$OutDir = "_apk_build\runtime-smoke"
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
            foreach ($item in $arg) {
                [void]$flat.Add([string]$item)
            }
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

function Dump-WindowXml {
    try {
        & $Adb shell uiautomator dump /sdcard/window.xml 1>$null 2>$null
    } catch {
    }
    return Read-AdbText shell cat /sdcard/window.xml
}

function Wait-ForWindowText {
    param([string]$Text, [int]$Seconds = 20)
    $deadline = (Get-Date).AddSeconds($Seconds)
    do {
        $xml = Dump-WindowXml
        if (Try-AcceptPermissionDialogFromXml $xml) {
            Start-Sleep -Milliseconds 500
            continue
        }
        if (Try-DismissUpdatePromptFromXml $xml) {
            Start-Sleep -Milliseconds 500
            continue
        }
        if ($xml -like "*$Text*") { return $xml }
        Start-Sleep -Milliseconds 500
    } while ((Get-Date) -lt $deadline)
    throw "Timed out waiting for window text: $Text"
}

function Wait-ForFocus {
    param([string]$Text, [int]$Seconds = 25)
    $deadline = (Get-Date).AddSeconds($Seconds)
    do {
        $focus = Read-AdbText shell dumpsys window
        if ($focus -like "*$Text*") { return $focus }
        Start-Sleep -Milliseconds 500
    } while ((Get-Date) -lt $deadline)
    throw "Timed out waiting for focus containing: $Text"
}

function Tap {
    param([int]$X, [int]$Y)
    Invoke-Adb shell input tap $X $Y
}

function Set-EmulatorLandscape {
    Invoke-Adb shell wm size 480x320 | Out-Null
    Invoke-Adb shell settings put system accelerometer_rotation 0 | Out-Null
    Invoke-Adb shell settings put system user_rotation 1 | Out-Null
}

function Tap-WindowText {
    param([string]$Text, [int]$Seconds = 20, [switch]$RequireButton)
    $xml = Wait-ForWindowText $Text $Seconds
    return Tap-WindowTextFromXml $Text $xml -RequireButton:$RequireButton
}

function Tap-WindowTextFromXml {
    param(
        [string]$Text,
        [string]$Xml,
        [switch]$RequireButton
    )
    $escaped = [regex]::Escape($Text)
    $pattern = if ($RequireButton) {
        "text=`"$escaped`"[^>]*class=`"android\.widget\.Button`"[^>]*bounds=`"\[(\d+),(\d+)\]\[(\d+),(\d+)\]`""
    } else {
        "text=`"$escaped`"[^>]*bounds=`"\[(\d+),(\d+)\]\[(\d+),(\d+)\]`""
    }
    $match = [regex]::Match(
        $Xml,
        $pattern,
        [System.Text.RegularExpressions.RegexOptions]::Singleline
    )
    if (-not $match.Success -and $RequireButton) {
        $match = [regex]::Match(
            $Xml,
            "text=`"$escaped`"[^>]*bounds=`"\[(\d+),(\d+)\]\[(\d+),(\d+)\]`"",
            [System.Text.RegularExpressions.RegexOptions]::Singleline
        )
    }
    if (-not $match.Success) {
        throw "Could not find tappable bounds for window text: $Text"
    }
    $x1 = [int]$match.Groups[1].Value
    $y1 = [int]$match.Groups[2].Value
    $x2 = [int]$match.Groups[3].Value
    $y2 = [int]$match.Groups[4].Value
    Tap ([int](($x1 + $x2) / 2)) ([int](($y1 + $y2) / 2))
}

function Grant-AppPermissions {
    foreach ($permission in @(
        "android.permission.READ_EXTERNAL_STORAGE",
        "android.permission.WRITE_EXTERNAL_STORAGE",
        "android.permission.READ_MEDIA_IMAGES",
        "android.permission.READ_MEDIA_VIDEO",
        "android.permission.READ_MEDIA_AUDIO",
        "android.permission.READ_MEDIA_VISUAL_USER_SELECTED",
        "android.permission.ACCESS_MEDIA_LOCATION"
    )) {
        try { & $Adb shell pm grant $Package $permission 1>$null 2>$null } catch {}
    }
    foreach ($operation in @(
        "LEGACY_STORAGE",
        "READ_MEDIA_IMAGES",
        "READ_MEDIA_VIDEO",
        "READ_MEDIA_AUDIO",
        "READ_MEDIA_VISUAL_USER_SELECTED",
        "ACCESS_MEDIA_LOCATION",
        "MANAGE_EXTERNAL_STORAGE"
    )) {
        try { & $Adb shell appops set $Package $operation allow 1>$null 2>$null } catch {}
    }
}

function Try-DismissUpdatePromptFromXml {
    param([string]$Xml)
    if (-not ($Xml -like "*Update available*" -and $Xml -like "*Later*")) {
        return $false
    }
    Tap-WindowTextFromXml "Later" $Xml
    return $true
}

function Accept-PermissionDialogIfPresent {
    param([int]$Seconds = 8)
    $deadline = (Get-Date).AddSeconds($Seconds)
    do {
        $xml = Dump-WindowXml
        if (Try-AcceptPermissionDialogFromXml $xml) {
            Start-Sleep -Milliseconds 500
            return $true
        }
        Start-Sleep -Milliseconds 500
    } while ((Get-Date) -lt $deadline)
    return $false
}

function Try-AcceptPermissionDialogFromXml {
    param([string]$Xml)
    if (-not ($Xml -like "*com.google.android.permissioncontroller*" -and
        $Xml -like "*permission_allow_button*" -and
        $Xml -like "*Allow*")) {
        return $false
    }
    $match = [regex]::Match(
        $Xml,
        "resource-id=`"com\.android\.permissioncontroller:id/permission_allow_button`"[^>]*bounds=`"\[(\d+),(\d+)\]\[(\d+),(\d+)\]`"",
        [System.Text.RegularExpressions.RegexOptions]::Singleline
    )
    if ($match.Success) {
        $x1 = [int]$match.Groups[1].Value
        $y1 = [int]$match.Groups[2].Value
        $x2 = [int]$match.Groups[3].Value
        $y2 = [int]$match.Groups[4].Value
        Tap ([int](($x1 + $x2) / 2)) ([int](($y1 + $y2) / 2))
    } else {
        Tap-WindowTextFromXml "Allow" $Xml
    }
    return $true
}

function Assert-ProcessAlive {
    $appPid = Read-AdbText shell pidof $Package
    if ([string]::IsNullOrWhiteSpace($appPid)) {
        throw "Package process is not alive: $Package"
    }
    return $appPid.Trim()
}

function Assert-NoCrashEvidence {
    param([string]$CycleDir)
    $publicLogDir = "/sdcard/YCS2CommunityMod/logs"
    $appLogDir = "/sdcard/Android/data/$Package/files"
    $publicDebugLog = Save-AdbText (Join-Path $CycleDir "public_ycs2_mod_debug.log") shell cat "$publicLogDir/ycs2_mod_debug.log"
    $appDebugLog = Save-AdbText (Join-Path $CycleDir "app_ycs2_mod_debug.log") shell cat "$appLogDir/ycs2_mod_debug.log"
    $publicNativeLog = Save-AdbText (Join-Path $CycleDir "public_ycs2_mod_native_crash.log") shell cat "$publicLogDir/ycs2_mod_native_crash.log"
    $appNativeLog = Save-AdbText (Join-Path $CycleDir "app_ycs2_mod_native_crash.log") shell cat "$appLogDir/ycs2_mod_native_crash.log"
    Save-AdbText (Join-Path $CycleDir "public-log-dir-ls.txt") shell ls -la "$publicLogDir" | Out-Null
    Save-AdbText (Join-Path $CycleDir "app-log-dir-ls.txt") shell ls -la "$appLogDir" | Out-Null
    $debugLog = if ($publicDebugLog -match "debug log started") { $publicDebugLog } else { $appDebugLog }
    $nativeLog = "$publicNativeLog`n$appNativeLog"
    $logcat = Save-AdbText (Join-Path $CycleDir "logcat.txt") logcat -d -t 2000
    Dump-WindowXml | Set-Content -LiteralPath (Join-Path $CycleDir "window.xml") -Encoding UTF8

    if ($publicDebugLog -notmatch "debug log started") {
        throw "Public shared-storage debug log was not written. See $CycleDir"
    }
    if ($publicDebugLog -notmatch "YCS2CommunityMod/logs" -or $publicDebugLog -notmatch "public_shared_log_dir=true") {
        throw "Debug log is not using the public shared-storage log folder. See $CycleDir"
    }
    if ($publicDebugLog -notmatch "permission WRITE_EXTERNAL_STORAGE=" -or $publicDebugLog -notmatch "process exit history") {
        throw "Debug log is missing detailed storage/exit-history diagnostics. See $CycleDir"
    }
    if ($debugLog -match "UNCAUGHT|Could not install checkpoint split HUD|split HUD poll failed|Start game failed") {
        throw "App debug log contains failure evidence. See $CycleDir"
    }
    if ($nativeLog -match "native fatal signal") {
        throw "Native fatal-signal log contains crash evidence. See $CycleDir"
    }
    $packageCrashLines = $logcat -split "`n" | Where-Object {
        ($_ -match "FATAL EXCEPTION|Abort message|tombstone|signal 4|signal 6|signal 7|signal 8|signal 9|signal 11|ANR in|Application Not Responding|Input dispatching timed out|Process .* exited due to signal") -and
        ($_ -match [regex]::Escape($Package) -or $_ -match "YCS2Mod|libjcs2mod|libtrueaxis")
    }
    if ($packageCrashLines.Count -gt 0) {
        $packageCrashLines | Set-Content -LiteralPath (Join-Path $CycleDir "crash-lines.txt") -Encoding UTF8
        throw "logcat contains package crash evidence. See $CycleDir\crash-lines.txt"
    }
}

Write-Host "Installing $ApkPath"
Set-EmulatorLandscape
Invoke-Adb @("install", "-r", $ApkPath) | Out-Host

$summary = New-Object System.Collections.Generic.List[string]
for ($cycle = 1; $cycle -le $Cycles; $cycle++) {
    $CycleDir = Join-Path $RunDir ("cycle-{0:D2}" -f $cycle)
    New-Item -ItemType Directory -Force -Path $CycleDir | Out-Null
    $clearMode = if ($SkipClearData) { "keep data/cache" } else { "clear data/cache" }
    $monkeyMode = if ($MonkeyEvents -gt 0) { ", monkey ${MonkeyEvents} events" } else { "" }
    Write-Host "Cycle ${cycle}/${Cycles}: force-stop, $clearMode, launch, verify launcher, start game, hold ${GameHoldSeconds}s${monkeyMode}"

    Invoke-Adb shell am force-stop $Package
    foreach ($extraPackage in $ExtraPackagesToStop) {
        if (-not [string]::IsNullOrWhiteSpace($extraPackage)) {
            Invoke-Adb shell am force-stop $extraPackage
        }
    }
    if (-not $SkipClearData) {
        Invoke-Adb shell pm clear $Package | Out-Null
        Grant-AppPermissions
    }
    Invoke-Adb shell rm -f "/sdcard/YCS2CommunityMod/logs/ycs2_mod_debug.log" "/sdcard/YCS2CommunityMod/logs/ycs2_mod_native_crash.log" "/sdcard/Android/data/$Package/files/ycs2_mod_debug.log" "/sdcard/Android/data/$Package/files/ycs2_mod_native_crash.log"
    Invoke-Adb logcat -c

    Invoke-Adb @("shell", "am", "start", "-n", "${Package}/${LauncherActivity}") | Out-Null
    Accept-PermissionDialogIfPresent 8 | Out-Null
    Wait-ForWindowText "Start game" 25 | Set-Content -LiteralPath (Join-Path $CycleDir "launcher.xml") -Encoding UTF8
    $appPid = Assert-ProcessAlive

    # Livery manager dialog titles are not always exposed to uiautomator on newer
    # Android builds; verify the launcher button exists, then continue.
    if ((Get-Content -LiteralPath (Join-Path $CycleDir "launcher.xml") -Raw) -notlike '*text="Custom liveries"*Button*') {
        throw "Launcher is missing the Custom liveries button. See $CycleDir"
    }

    Tap-WindowText "Start game" 15 -RequireButton
    Start-Sleep -Seconds 3
    $focus = Read-AdbText shell dumpsys window
    if ($focus -notlike "*Jetcarstunts2Activity*") {
        Write-Host "Start game tap did not focus game activity; falling back to explicit activity start"
        Invoke-Adb @("shell", "am", "start", "-n", "${Package}/com.trueaxis.jetcarstunts2.Jetcarstunts2Activity") | Out-Null
    }
    Wait-ForFocus "Jetcarstunts2Activity" 30 | Set-Content -LiteralPath (Join-Path $CycleDir "game-focus.txt") -Encoding UTF8
    if ($MonkeyEvents -gt 0) {
        $monkeyArgs = @("shell", "monkey", "-p", $Package, "--pct-syskeys", "0")
        if ($MonkeyTouchOnly) {
            $monkeyArgs += @(
                "--pct-touch", "100",
                "--pct-motion", "0",
                "--pct-trackball", "0",
                "--pct-nav", "0",
                "--pct-majornav", "0",
                "--pct-appswitch", "0",
                "--pct-flip", "0",
                "--pct-anyevent", "0"
            )
        }
        $monkeyArgs += @("--throttle", "$MonkeyThrottleMs", "-v", "$MonkeyEvents")
        Invoke-Adb $monkeyArgs |
            Set-Content -LiteralPath (Join-Path $CycleDir "monkey.txt") -Encoding UTF8
        Wait-ForFocus "Jetcarstunts2Activity" 30 | Set-Content -LiteralPath (Join-Path $CycleDir "post-monkey-focus.txt") -Encoding UTF8
    }
    Start-Sleep -Seconds $GameHoldSeconds
    $appPid = Assert-ProcessAlive

    Assert-NoCrashEvidence $CycleDir
    $summary.Add("cycle=$cycle pid=$appPid ok")
    Invoke-Adb shell am force-stop $Package
}

$summaryPath = Join-Path $RunDir "summary.txt"
$summary | Set-Content -LiteralPath $summaryPath -Encoding UTF8
Write-Host "Runtime smoke passed. Artifacts: $RunDir"
