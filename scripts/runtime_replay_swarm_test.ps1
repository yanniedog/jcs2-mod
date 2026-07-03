param(
    [string]$ApkPath = "jcs2-mod.apk",
    [string]$Package = "modded.ycs2",
    [string]$LauncherActivity = "com.trueaxis.modmenu.ModLauncherActivity",
    [ValidateSet("LandscapeRight", "LandscapeLeft")]
    [string]$LandscapeSide = "LandscapeLeft",
    [string]$StraightAcceleration = "9.80665:0:0",
    [string]$StraightOrientation = "0:0:90",
    [string]$LevelSearch = "Straight level for testing",
    [int]$GameStartupWaitSeconds = 60,
    [int]$PassiveReplayWaitSeconds = 15,
    [int]$MinCatalogEntries = 2,
    [int]$MinGhostCount = 1,
    [bool]$ClearAppDataBeforeRun = $true,
    [bool]$ForceLoginDismissTap = $true,
    [bool]$SkipUserLevelWhenOffline = $true,
    [string]$Adb = "$env:LOCALAPPDATA\Android\Sdk\platform-tools\adb.exe",
    [string]$OutDir = "_apk_build\runtime-replay-swarm"
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
$script:NextTrackingId = 900

function Convert-LandscapeTouchToAbs {
    param([double]$X, [double]$Y)
    $clampedX = [Math]::Max(0.0, [Math]::Min(479.0, $X))
    $clampedY = [Math]::Max(0.0, [Math]::Min(319.0, $Y))
    return [pscustomobject]@{
        X = [int]($clampedY * 32767.0 / 320.0)
        Y = [int]((480.0 - $clampedX) * 32767.0 / 480.0)
    }
}

function Send-EmuTouchFrame {
    param([object[]]$Points, [bool]$Down, [bool]$Up)
    $events = New-Object System.Collections.Generic.List[string]
    for ($slot = 0; $slot -lt $Points.Count; $slot++) {
        $point = $Points[$slot]
        $abs = Convert-LandscapeTouchToAbs $point.X $point.Y
        [void]$events.Add("EV_ABS:ABS_MT_SLOT:$slot")
        if ($Down) {
            [void]$events.Add("EV_ABS:ABS_MT_TRACKING_ID:$($script:NextTrackingId + $slot)")
        }
        [void]$events.Add("EV_ABS:ABS_MT_POSITION_X:$($abs.X)")
        [void]$events.Add("EV_ABS:ABS_MT_POSITION_Y:$($abs.Y)")
        [void]$events.Add("EV_ABS:ABS_MT_PRESSURE:900")
    }
    if ($Down) { [void]$events.Add("EV_KEY:BTN_TOUCH:1") }
    if ($Up) {
        for ($slot = 0; $slot -lt $Points.Count; $slot++) {
            [void]$events.Add("EV_ABS:ABS_MT_SLOT:$slot")
            [void]$events.Add("EV_ABS:ABS_MT_TRACKING_ID:-1")
            [void]$events.Add("EV_ABS:ABS_MT_PRESSURE:0")
        }
        [void]$events.Add("EV_KEY:BTN_TOUCH:0")
    }
    [void]$events.Add("EV_SYN:0:0")
    & $Adb emu event send @($events.ToArray()) | Out-Null
}

function New-TouchPoint {
    param([double]$X, [double]$Y)
    return [pscustomobject]@{ X = $X; Y = $Y }
}

function Send-EmuTapLandscape {
    param([double]$X, [double]$Y)
    $point = New-TouchPoint $X $Y
    Send-EmuTouchFrame -Points @($point) -Down $true -Up $false
    Start-Sleep -Milliseconds 140
    Send-EmuTouchFrame -Points @($point) -Down $false -Up $true
    $script:NextTrackingId += 10
}

function Send-EmuTapDevice {
    param([double]$X, [double]$Y)
    $absX = [int]([Math]::Max(0.0, [Math]::Min(479.0, $X)) * 32767.0 / 480.0)
    $absY = [int]([Math]::Max(0.0, [Math]::Min(319.0, $Y)) * 32767.0 / 320.0)
    $id = $script:NextTrackingId
    & $Adb emu event send `
        EV_ABS:ABS_MT_SLOT:0 `
        EV_ABS:ABS_MT_TRACKING_ID:$id `
        EV_ABS:ABS_MT_POSITION_X:$absX `
        EV_ABS:ABS_MT_POSITION_Y:$absY `
        EV_ABS:ABS_MT_PRESSURE:900 `
        EV_KEY:BTN_TOUCH:1 `
        EV_SYN:0:0 | Out-Null
    Start-Sleep -Milliseconds 140
    & $Adb emu event send `
        EV_ABS:ABS_MT_SLOT:0 `
        EV_ABS:ABS_MT_TRACKING_ID:-1 `
        EV_ABS:ABS_MT_PRESSURE:0 `
        EV_KEY:BTN_TOUCH:0 `
        EV_SYN:0:0 | Out-Null
    $script:NextTrackingId += 10
}

function Tap-Launcher {
    param([int]$X, [int]$Y)
    Invoke-Adb shell input tap $X $Y
}

function Tap-Game {
    param([int]$X, [int]$Y)
    Send-EmuTapLandscape $X $Y
}

function Tap-Menu {
    param([int]$X, [int]$Y)
    Send-EmuTapLandscape $X $Y
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
        Dismiss-PermissionDialogIfPresent | Out-Null
        $xml = Dump-WindowXml
        if ($xml -like "*$Text*") { return $xml }
        Start-Sleep -Milliseconds 500
    } while ((Get-Date) -lt $deadline)
    throw "Timed out waiting for window text: $Text"
}

function Wait-ForDebugPattern {
    param([string]$Pattern, [int]$Seconds = 30)
    $deadline = (Get-Date).AddSeconds($Seconds)
    do {
        Dismiss-PermissionDialogIfPresent | Out-Null
        Dismiss-UpdatePromptIfPresent | Out-Null
        $debug = Read-AdbText shell cat /sdcard/YCS2CommunityMod/logs/ycs2_mod_debug.log
        if ($debug -match $Pattern) { return $debug }
        Start-Sleep -Milliseconds 500
    } while ((Get-Date) -lt $deadline)
    throw "Timed out waiting for debug log pattern: $Pattern"
}

function Tap {
    param([int]$X, [int]$Y)
    Invoke-Adb shell input tap $X $Y
}

function Tap-EmuDevice {
    param([int]$X, [int]$Y)
    Send-EmuTapDevice $X $Y
}

function Get-WindowTextBounds {
    param([string]$Text, [string]$Xml, [switch]$RequireButton)
    $escaped = [regex]::Escape($Text)
    $pattern = if ($RequireButton) {
        "text=`"$escaped`"[^>]*class=`"android\.widget\.Button`"[^>]*bounds=`"\[(\d+),(\d+)\]\[(\d+),(\d+)\]`""
    } else {
        "text=`"$escaped`"[^>]*bounds=`"\[(\d+),(\d+)\]\[(\d+),(\d+)\]`""
    }
    $match = [regex]::Match($Xml, $pattern, [System.Text.RegularExpressions.RegexOptions]::Singleline)
    if (-not $match.Success -and $RequireButton) {
        $match = [regex]::Match(
            $Xml,
            "text=`"$escaped`"[^>]*bounds=`"\[(\d+),(\d+)\]\[(\d+),(\d+)\]`"",
            [System.Text.RegularExpressions.RegexOptions]::Singleline
        )
    }
    if (-not $match.Success) { return $null }
    return [pscustomobject]@{
        X = [int](([int]$match.Groups[1].Value + [int]$match.Groups[3].Value) / 2)
        Y = [int](([int]$match.Groups[2].Value + [int]$match.Groups[4].Value) / 2)
    }
}

function Tap-WindowTextFromXml {
    param([string]$Text, [string]$Xml, [switch]$RequireButton, [switch]$UseGameTap)
    $center = Get-WindowTextBounds $Text $Xml -RequireButton:$RequireButton
    if ($null -eq $center) {
        throw "Could not find tappable bounds for window text: $Text"
    }
    if ($UseGameTap) {
        Tap-Game $center.X $center.Y
    } else {
        Tap $center.X $center.Y
    }
}

function Tap-WindowText {
    param([string]$Text, [int]$Seconds = 20, [switch]$RequireButton)
    $xml = Wait-ForWindowText $Text $Seconds
    Tap-WindowTextFromXml $Text $xml -RequireButton:$RequireButton
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

function Dismiss-PermissionDialogIfPresent {
    $xml = Dump-WindowXml
    if ($xml -like "*permissioncontroller*" -and ($xml -like "*Allow*" -or $xml -like "*permission_allow_button*")) {
        $xml | Set-Content -LiteralPath (Join-Path $RunDir "permission-dialog.xml") -Encoding UTF8
        $allow = [regex]::Match(
            $xml,
            'resource-id="com\.android\.permissioncontroller:id/permission_allow_button"[^>]*bounds="\[(\d+),(\d+)\]\[(\d+),(\d+)\]"',
            [System.Text.RegularExpressions.RegexOptions]::Singleline
        )
        if ($allow.Success) {
            Tap ([int](([int]$allow.Groups[1].Value + [int]$allow.Groups[3].Value) / 2)) `
                ([int](([int]$allow.Groups[2].Value + [int]$allow.Groups[4].Value) / 2))
        } else {
            Tap-WindowTextFromXml "Allow" $xml
        }
        Start-Sleep -Seconds 1
        return $true
    }
    return $false
}

function Dismiss-UpdatePromptIfPresent {
    $xml = Dump-WindowXml
    if ($xml -like "*Update available*" -and $xml -like "*Later*") {
        $xml | Set-Content -LiteralPath (Join-Path $RunDir "update-prompt.xml") -Encoding UTF8
        Tap-WindowTextFromXml "Later" $xml
        Start-Sleep -Seconds 1
        return $true
    }
    return $false
}

function Get-DisplayViewportOrientation {
    $display = Read-AdbText shell dumpsys display
    $match = [regex]::Match($display, "DisplayViewport\{type=INTERNAL,[^}]*orientation=(\d)")
    if ($match.Success) { return [int]$match.Groups[1].Value }
    return -1
}

function Prepare-EmulatorDisplay {
    Invoke-Adb shell wm size reset
    Invoke-Adb shell settings put system accelerometer_rotation 1
}

function Set-EmulatorLandscape {
    Invoke-Adb shell wm size reset
    Invoke-Adb shell settings put system accelerometer_rotation 0
    $rotation = if ($LandscapeSide -eq "LandscapeLeft") { 1 } else { 3 }
    Invoke-Adb shell settings put system user_rotation $rotation
    for ($attempt = 0; $attempt -lt 4; $attempt++) {
        if ((Get-DisplayViewportOrientation) -eq 1) { return }
        & $Adb emu rotate | Out-Null
        Start-Sleep -Seconds 1
    }
    if ((Get-DisplayViewportOrientation) -ne 1) {
        Write-Host "Emulator viewport still portrait; continuing with user_rotation=$rotation"
    }
}

function Set-LandscapeNeutralSensors {
    Invoke-Adb shell wm size 480x320
    Invoke-Adb shell settings put system accelerometer_rotation 0
    $rotation = if ($LandscapeSide -eq "LandscapeLeft") { 1 } else { 3 }
    Invoke-Adb shell settings put system user_rotation $rotation
    Invoke-Adb emu sensor set acceleration $StraightAcceleration
    Invoke-Adb emu sensor set gyroscope "0:0:0"
    Invoke-Adb emu sensor set orientation $StraightOrientation
}

function Type-SearchText {
    param([string]$Text)
    if ([string]::IsNullOrEmpty($Text)) { return }
    $escaped = $Text.ToLowerInvariant().Replace(" ", "%s")
    Invoke-Adb shell input text $escaped
}

function Dismiss-ExitGameDialogIfPresent {
    $xml = Dump-WindowXml
    if ($xml -like "*Are you sure you want to exit the game*") {
        $xml | Set-Content -LiteralPath (Join-Path $RunDir "exit-game-dialog.xml") -Encoding UTF8
        if ($xml -like '*text="No"*') {
            Tap-WindowTextFromXml "No" $xml
        } else {
            Tap-Game 360 160
        }
        Start-Sleep -Seconds 1
        return $true
    }
    return $false
}

function Dismiss-LoginOverlayIfPresent {
    $xml = Dump-WindowXml
    if ($xml -like "*Facebook Connect*" -or ($xml -like "*True Axis*" -and $xml -like "*PLAY*")) {
        $xml | Set-Content -LiteralPath (Join-Path $RunDir "login-overlay.xml") -Encoding UTF8
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
    Tap 414 299
    Start-Sleep -Seconds 3
}

function Close-ExternalBrowserIfPresent {
    $state = Read-AdbText shell dumpsys activity activities
    if ($state -match "com.android.chrome" -and $state -match "ResumedActivity: ActivityRecord\{[^\n]+com.android.chrome") {
        Invoke-Adb shell am force-stop com.android.chrome
        Start-Sleep -Seconds 1
        Invoke-Adb shell am start -n "${Package}/com.trueaxis.jetcarstunts2.Jetcarstunts2Activity" | Out-Null
        Start-Sleep -Seconds 2
        Set-LandscapeNeutralSensors
        return $true
    }
    return $false
}

function Test-EmulatorNetworkReady {
    $pingHost = Read-AdbText shell ping -c 1 10.0.2.2
    return ($pingHost -match "1 received|1 packets received")
}

function Ensure-EmulatorNetwork {
    try { Invoke-Adb shell settings put global airplane_mode_on 0 } catch {}
    try { & $Adb shell svc wifi enable 1>$null 2>$null } catch {}
    try { & $Adb shell svc data enable 1>$null 2>$null } catch {}
    try { & $Adb shell cmd connectivity airplane-mode disable 2>$null | Out-Null } catch {}
    try { & $Adb shell cmd wifi connect-network "AndroidWifi" open 2>$null | Out-Null } catch {}
    Start-Sleep -Seconds 5
    if (Test-EmulatorNetworkReady) {
        Write-Host "Emulator network ready"
        return $true
    }
    Write-Host "Emulator network unavailable; offline stock-level path will be used"
    return $false
}

function Send-Back {
    param([int]$Count = 1)
    for ($i = 0; $i -lt $Count; $i++) {
        Invoke-Adb shell input keyevent KEYCODE_BACK
        Start-Sleep -Milliseconds 700
        Dismiss-ExitGameDialogIfPresent | Out-Null
    }
}

function Scroll-LauncherScrollDown {
    Invoke-Adb shell input swipe 240 220 240 165 250
    Start-Sleep -Milliseconds 350
}

function Scroll-LauncherScrollUp {
    Invoke-Adb shell input swipe 240 165 240 220 250
    Start-Sleep -Milliseconds 350
}

function Scroll-LauncherUntilCheckBox {
    param(
        [string]$Text,
        [int]$MaxSteps = 30,
        [int]$ScrollTop = 146,
        [int]$ScrollBottom = 249,
        [int]$MinHeight = 36
    )
    Tap 240 190
    Start-Sleep -Milliseconds 300
    for ($i = 0; $i -lt 10; $i++) { Scroll-LauncherScrollUp }
    $xml = Dump-WindowXml
    for ($i = 0; $i -lt $MaxSteps; $i++) {
        while (Dismiss-PermissionDialogIfPresent) {
            Start-Sleep -Milliseconds 400
        }
        $xml = Dump-WindowXml
        if ($xml -like "*$Text*") { break }
        Scroll-LauncherScrollDown
    }
    if ($xml -notlike "*$Text*") {
        for ($i = 0; $i -lt 12; $i++) {
            while (Dismiss-PermissionDialogIfPresent) {
                Start-Sleep -Milliseconds 400
            }
            Scroll-LauncherScrollUp
            $xml = Dump-WindowXml
            if ($xml -like "*$Text*") { break }
        }
    }
    for ($j = 0; $j -lt 8; $j++) {
        while (Dismiss-PermissionDialogIfPresent) {
            Start-Sleep -Milliseconds 400
        }
        $cbMatch = [regex]::Match(
            $xml,
            "text=`"$([regex]::Escape($Text))`"[^>]*bounds=`"\[(\d+),(\d+)\]\[(\d+),(\d+)\]`"",
            [System.Text.RegularExpressions.RegexOptions]::Singleline
        )
        if (-not $cbMatch.Success) { break }
        $y1 = [int]$cbMatch.Groups[2].Value
        $y2 = [int]$cbMatch.Groups[4].Value
        $height = $y2 - $y1
        if ($height -ge $MinHeight -and $y1 -ge $ScrollTop -and $y2 -le $ScrollBottom) {
            return $xml
        }
        if ($height -lt $MinHeight -or $y2 -gt $ScrollBottom) {
            Scroll-LauncherScrollDown
        } else {
            Scroll-LauncherScrollUp
        }
        $xml = Dump-WindowXml
    }
    return $xml
}

function Tap-CheckBoxFromXml {
    param([string]$Text, [string]$Xml)
    $cbMatch = [regex]::Match(
        $Xml,
        "text=`"$([regex]::Escape($Text))`"[^>]*class=`"android\.widget\.CheckBox`"[^>]*bounds=`"\[(\d+),(\d+)\]\[(\d+),(\d+)\]`"",
        [System.Text.RegularExpressions.RegexOptions]::Singleline
    )
    if (-not $cbMatch.Success) {
        $cbMatch = [regex]::Match(
            $Xml,
            "text=`"$([regex]::Escape($Text))`"[^>]*bounds=`"\[(\d+),(\d+)\]\[(\d+),(\d+)\]`"",
            [System.Text.RegularExpressions.RegexOptions]::Singleline
        )
    }
    if (-not $cbMatch.Success) {
        Write-Host "Checkbox bounds missing for '$Text'; using fallback tap"
        Tap 240 225
        return
    }
    $x1 = [int]$cbMatch.Groups[1].Value
    $y1 = [int]$cbMatch.Groups[2].Value
    $x2 = [int]$cbMatch.Groups[3].Value
    $y2 = [int]$cbMatch.Groups[4].Value
    Tap ([int](($x1 + $x2) / 2)) ([int](($y1 + $y2) / 2))
}

function Read-CheckBoxChecked {
    param([string]$Text, [string]$Xml)
    $node = [regex]::Match(
        $Xml,
        "text=`"$([regex]::Escape($Text))`"[^>]*checked=`"(true|false)`"",
        [System.Text.RegularExpressions.RegexOptions]::Singleline
    )
    if (-not $node.Success) { return $false }
    return $node.Groups[1].Value -eq "true"
}

function Enable-LauncherOptions {
    $initialXml = ""
    for ($i = 0; $i -lt 40; $i++) {
        if (Dismiss-PermissionDialogIfPresent) {
            Start-Sleep -Milliseconds 800
            continue
        }
        if (Dismiss-UpdatePromptIfPresent) {
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
    Dismiss-PermissionDialogIfPresent | Out-Null

    $swarmToggle = "Enable replay swarm picker during passive replays"
    if ($initialXml -notlike "*$swarmToggle*") {
        Write-Host "Swarm toggle not visible without scroll; enabled via automation intent extra"
    }

    $initialXml | Set-Content -LiteralPath (Join-Path $RunDir "launcher-before-start.xml") -Encoding UTF8
    Start-Sleep -Milliseconds 500
    Dismiss-PermissionDialogIfPresent | Out-Null
    Dismiss-UpdatePromptIfPresent | Out-Null
    try {
        Tap-WindowTextFromXml "Start game" $initialXml
    } catch {
        Write-Host "Start game bounds tap failed; using launcher fallback"
        Tap 240 282
    }
    Start-Sleep -Seconds 3
}

function Start-GameActivity {
    Invoke-Adb shell am start -n "${Package}/com.trueaxis.jetcarstunts2.Jetcarstunts2Activity" | Out-Null
}

function Wait-ForGameActivity {
    param([int]$Seconds = 30)
    $deadline = (Get-Date).AddSeconds($Seconds)
    do {
        $debug = Read-AdbText shell cat /sdcard/YCS2CommunityMod/logs/ycs2_mod_debug.log
        if ($debug -match "Jetcarstunts2Activity created") { return }
        $state = Read-AdbText shell dumpsys activity activities
        if ($state -match "Jetcarstunts2Activity" -and $state -match "ResumedActivity") { return }
        Start-Sleep -Milliseconds 500
    } while ((Get-Date) -lt $deadline)
    throw "Timed out waiting for Jetcarstunts2Activity"
}

function Assert-ProcessAlive {
    $appPid = Read-AdbText shell pidof $Package
    if ([string]::IsNullOrWhiteSpace($appPid)) {
        throw "Package process is not alive: $Package"
    }
    return $appPid.Trim()
}

function Ensure-GameActivityResumed {
    $state = Read-AdbText shell dumpsys activity activities
    if ($state -match "topResumedActivity=ActivityRecord\{[^\n]+Jetcarstunts2Activity") {
        return
    }
    Write-Host "Game activity not resumed; relaunching Jetcarstunts2Activity"
    Start-GameActivity
    Wait-ForGameActivity 30
    Set-LandscapeNeutralSensors
    Start-Sleep -Seconds 3
}

function Open-UserLevelPassiveReplay {
    Write-Host "Opening user level passive replay: $LevelSearch"
    Set-LandscapeNeutralSensors
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
    Save-Screenshot "03-user-search-results.png"
    Tap 165 88
    Start-Sleep -Seconds 20
    Save-Screenshot "04-user-level-detail.png"
    Write-Host "Starting user-level passive replay fly-through"
    Tap 217 298
    Start-Sleep -Seconds $PassiveReplayWaitSeconds
    Save-Screenshot "05-user-passive-replay.png"
    try {
        Wait-ForDebugPattern '\[swarm\] (overlay state=1 catalog=[1-9]\d*|catalog updated count=[1-9]\d*)' 45 | Out-Null
    } catch {
        Write-Host "User passive replay swarm state not logged yet; continuing"
    }
}

function Open-RegularLevelPassiveReplay {
    param(
        [string]$Name,
        [int]$RegularPlayTapX = 190,
        [int]$RegularPlayTapY = 96,
        [int]$LevelTapX = 115,
        [int]$LevelTapY = 84,
        [string]$ScreenshotPrefix
    )
    Write-Host "Opening regular level passive replay: $Name"
    Ensure-GameActivityResumed
    Set-LandscapeNeutralSensors
    Start-Sleep -Seconds 3
    Tap $RegularPlayTapX $RegularPlayTapY
    Start-Sleep -Seconds 4
    Dismiss-LoginOverlayIfPresent | Out-Null
    Close-ExternalBrowserIfPresent | Out-Null
    Save-Screenshot "$ScreenshotPrefix-regular-play-open.png"
    Tap $LevelTapX $LevelTapY
    Start-Sleep -Seconds 8
    Dismiss-LoginOverlayIfPresent | Out-Null
    Close-ExternalBrowserIfPresent | Out-Null
    Save-Screenshot "$ScreenshotPrefix-level-detail.png"
    Write-Host "Starting passive replay fly-through for $Name"
    Tap 217 298
    Start-Sleep -Seconds $PassiveReplayWaitSeconds
    Save-Screenshot "$ScreenshotPrefix-passive-replay.png"
    try {
        Wait-ForDebugPattern '\[swarm\] (overlay state=1|catalog updated)' 45 | Out-Null
    } catch {
        Write-Host "Passive replay swarm evidence not logged yet; continuing"
    }
}

function Get-SwarmOverlayState {
    $debug = Read-AdbText shell cat /sdcard/YCS2CommunityMod/logs/ycs2_mod_debug.log
    $matches = [regex]::Matches($debug, "\[swarm\] overlay state=(?<state>\d+) catalog=(?<catalog>\d+) ghosts=(?<ghosts>\d+)")
    $catalogFromUpdate = 0
    $catalogUpdates = [regex]::Matches($debug, "\[swarm\] catalog updated count=(?<catalog>\d+)")
    if ($catalogUpdates.Count -gt 0) {
        $catalogFromUpdate = [int]$catalogUpdates[$catalogUpdates.Count - 1].Groups["catalog"].Value
    }
    if ($matches.Count -lt 1) {
        if ($catalogFromUpdate -gt 0) {
            return [pscustomobject]@{
                State = 0
                Catalog = $catalogFromUpdate
                Ghosts = 0
                Debug = $debug
            }
        }
        return $null
    }
    $match = $matches[$matches.Count - 1]
    $catalog = [Math]::Max([int]$match.Groups["catalog"].Value, $catalogFromUpdate)
    return [pscustomobject]@{
        State = [int]$match.Groups["state"].Value
        Catalog = $catalog
        Ghosts = [int]$match.Groups["ghosts"].Value
        Debug = $debug
    }
}

function Wait-ForSwarmOverlayReady {
    param([int]$MinCatalog = 2, [int]$Seconds = 60)
    $deadline = (Get-Date).AddSeconds($Seconds)
    do {
        $info = Get-SwarmOverlayState
        if ($null -ne $info -and $info.State -ge 1 -and $info.Catalog -ge $MinCatalog) {
            return $info
        }
        $xml = Dump-WindowXml
        if ($xml -like '*text="Swarm"*' -and $null -ne $info -and $info.Catalog -ge $MinCatalog) {
            return $info
        }
        Start-Sleep -Milliseconds 500
    } while ((Get-Date) -lt $deadline)
    throw "Timed out waiting for swarm overlay ready (state>=1 catalog>=$MinCatalog). See $RunDir"
}

function Open-SwarmPicker {
    $deadline = (Get-Date).AddSeconds(30)
    $xml = ""
    do {
        $xml = Dump-WindowXml
        if ($xml -like '*text="Swarm"*') { break }
        Start-Sleep -Milliseconds 500
    } while ((Get-Date) -lt $deadline)
    $xml | Set-Content -LiteralPath (Join-Path $RunDir "swarm-button-visible.xml") -Encoding UTF8
    $center = Get-WindowTextBounds "Swarm" $xml
    if ($null -ne $center) {
        Tap $center.X $center.Y
    } else {
        Write-Host "Swarm button not in accessibility tree; using top-right fallback tap"
        Tap-Launcher 450 20
    }
    Start-Sleep -Seconds 1
    $dialogXml = Wait-ForWindowText "Replay swarm" 15
    $dialogXml | Set-Content -LiteralPath (Join-Path $RunDir "swarm-dialog.xml") -Encoding UTF8
    return $dialogXml
}

function Tap-MatchBounds {
    param([System.Text.RegularExpressions.Match]$Match, [string]$Label)
    if (-not $Match.Success) {
        throw "Could not find tappable bounds for: $Label"
    }
    $x1 = [int]$Match.Groups[1].Value
    $y1 = [int]$Match.Groups[2].Value
    $x2 = [int]$Match.Groups[3].Value
    $y2 = [int]$Match.Groups[4].Value
    Tap ([int](($x1 + $x2) / 2)) ([int](($y1 + $y2) / 2))
}

function Select-SwarmPrimaryAndGhost {
    param([string]$DialogXml)
    $primaryMatches = [regex]::Matches(
        $DialogXml,
        "text=`"Primary:[^`"]*`"[^>]*class=`"android\.widget\.RadioButton`"[^>]*bounds=`"\[(\d+),(\d+)\]\[(\d+),(\d+)\]`"",
        [System.Text.RegularExpressions.RegexOptions]::Singleline
    )
    if ($primaryMatches.Count -lt 1) {
        throw "Swarm dialog has no primary radio buttons. See $RunDir\swarm-dialog.xml"
    }
    Tap-MatchBounds $primaryMatches[0] "primary radio 0"

    $ghostMatches = [regex]::Matches(
        $DialogXml,
        "text=`"Ghost overlay for[^`"]*`"[^>]*class=`"android\.widget\.CheckBox`"[^>]*bounds=`"\[(\d+),(\d+)\]\[(\d+),(\d+)\]`"",
        [System.Text.RegularExpressions.RegexOptions]::Singleline
    )
    if ($ghostMatches.Count -lt 1) {
        throw "Swarm dialog has no ghost checkboxes. See $RunDir\swarm-dialog.xml"
    }
    $ghostIndex = if ($ghostMatches.Count -gt 1) { 1 } else { 0 }
    Tap-MatchBounds $ghostMatches[$ghostIndex] "ghost checkbox $ghostIndex"
    Start-Sleep -Milliseconds 400
    Tap-WindowText "Apply" 10 -RequireButton
    Start-Sleep -Seconds 2
}

function Collect-Evidence {
    Save-AdbText (Join-Path $RunDir "public_ycs2_mod_debug.log") shell cat /sdcard/YCS2CommunityMod/logs/ycs2_mod_debug.log | Out-Null
    Save-AdbText (Join-Path $RunDir "public_ycs2_mod_native_crash.log") shell cat /sdcard/YCS2CommunityMod/logs/ycs2_mod_native_crash.log | Out-Null
    Save-AdbText (Join-Path $RunDir "logcat.txt") logcat -d -t 5000 | Out-Null
    Dump-WindowXml | Set-Content -LiteralPath (Join-Path $RunDir "window.xml") -Encoding UTF8
}

function Assert-SwarmEvidence {
    param(
        [int]$ExpectedCatalog,
        [int]$ExpectedGhosts
    )
    $debug = Get-Content -LiteralPath (Join-Path $RunDir "public_ycs2_mod_debug.log") -Raw -ErrorAction SilentlyContinue
    $window = Get-Content -LiteralPath (Join-Path $RunDir "window.xml") -Raw -ErrorAction SilentlyContinue
    $native = Get-Content -LiteralPath (Join-Path $RunDir "public_ycs2_mod_native_crash.log") -Raw -ErrorAction SilentlyContinue
    $logcat = Get-Content -LiteralPath (Join-Path $RunDir "logcat.txt") -Raw -ErrorAction SilentlyContinue

    foreach ($required in @(
        "replay swarm overlay installed",
        "replay swarm hooks installed=true"
    )) {
        if ($debug -notmatch [regex]::Escape($required)) {
            throw "Missing swarm runtime evidence '$required'. See $RunDir\public_ycs2_mod_debug.log"
        }
    }
    if ($debug -notmatch "\[swarm\] overlay state=2 catalog=$ExpectedCatalog ghosts=$ExpectedGhosts") {
        if ($debug -notmatch "\[swarm\] overlay state=2 catalog=\d+ ghosts=$ExpectedGhosts") {
            throw "Swarm did not reach active state with $ExpectedGhosts ghosts. See $RunDir\public_ycs2_mod_debug.log"
        }
    }
    if ($window -notmatch "Swarm:\s*$ExpectedGhosts ghost replays") {
        throw "Window hierarchy missing swarm status text 'Swarm: $ExpectedGhosts ghost replays'. See $RunDir\window.xml"
    }
    if ($debug -match "overlay poll failed|Could not install replay swarm|UNCAUGHT") {
        throw "Debug log contains swarm failure evidence. See $RunDir\public_ycs2_mod_debug.log"
    }
    if ($native -match "native fatal signal") {
        throw "Native crash log contains fatal signal evidence. See $RunDir\public_ycs2_mod_native_crash.log"
    }
    $crashLines = $logcat -split "`n" | Where-Object {
        ($_ -match "FATAL EXCEPTION|Abort message|signal 11|ANR in|Application Not Responding|Input dispatching timed out") -and
        ($_ -match [regex]::Escape($Package) -or $_ -match "YCS2Mod|libjcs2mod|libtrueaxis")
    }
    if ($crashLines.Count -gt 0) {
        $crashLines | Set-Content -LiteralPath (Join-Path $RunDir "crash-lines.txt") -Encoding UTF8
        throw "logcat contains package crash/ANR evidence. See $RunDir\crash-lines.txt"
    }
    Assert-ProcessAlive | Out-Null
}

function Wait-ForEmulatorBoot {
    param([int]$Seconds = 300)
    & $Adb wait-for-device
    if ($LASTEXITCODE -ne 0) {
        throw "adb wait-for-device failed with exit code $LASTEXITCODE"
    }
    $deadline = (Get-Date).AddSeconds($Seconds)
    do {
        $boot = (Read-AdbText shell getprop sys.boot_completed).Trim()
        if ($boot -eq "1") { return }
        $packageReady = Read-AdbText shell pm path android
        if ($packageReady -match "package:") { return }
        Start-Sleep -Seconds 5
    } while ((Get-Date) -lt $deadline)
    throw "Timed out waiting for emulator boot completion"
}

function Install-ApkWithRetry {
    param([string]$Path, [int]$Seconds = 300)
    $deadline = (Get-Date).AddSeconds($Seconds)
    do {
        & $Adb install --no-incremental -r $Path 2>&1 | Out-Host
        if ($LASTEXITCODE -eq 0) { return }
        Start-Sleep -Seconds 10
    } while ((Get-Date) -lt $deadline)
    throw "adb install --no-incremental -r $Path failed after waiting ${Seconds}s"
}

Write-Host "Installing $ApkPath"
Wait-ForEmulatorBoot 300
Install-ApkWithRetry $ApkPath 300
Grant-AppPermissions
if ($ClearAppDataBeforeRun) {
    Invoke-Adb shell pm clear $Package | Out-Host
}
Grant-AppPermissions
Invoke-Adb shell am force-stop $Package
Invoke-Adb shell am force-stop com.android.chrome
Start-Sleep -Seconds 2
Invoke-Adb shell rm -f /sdcard/YCS2CommunityMod/logs/ycs2_mod_debug.log /sdcard/YCS2CommunityMod/logs/ycs2_mod_native_crash.log
Invoke-Adb logcat -c
Set-LandscapeNeutralSensors
$script:NetworkReady = Ensure-EmulatorNetwork

$script:FinalCatalog = 0
$script:FinalGhosts = 0
$script:FinalState = 0
$script:NavigationPath = "unknown"
try {
Write-Host "Launching YCS2 with replay swarm enabled"
Invoke-Adb shell am start -n "${Package}/${LauncherActivity}" --ez automation_enable_replay_swarm true | Out-Null
Start-Sleep -Seconds 2
for ($i = 0; $i -lt 20; $i++) {
    if (Dismiss-PermissionDialogIfPresent) { Start-Sleep -Seconds 1 }
}
Wait-ForDebugPattern 'automation replay_swarm=true' 45 | Out-Null
Enable-LauncherOptions
Start-GameActivity
Wait-ForGameActivity 60
Wait-ForDebugPattern "replay swarm hooks installed=true" 60 | Out-Null
Wait-ForDebugPattern "replay swarm overlay installed" 30 | Out-Null
Start-Sleep -Seconds $GameStartupWaitSeconds
Set-LandscapeNeutralSensors
Save-Screenshot "01-main-menu.png"
Dismiss-StartupLoginOverlay
Close-ExternalBrowserIfPresent | Out-Null
Start-Sleep -Seconds 2

$script:NavigationPath = "regular_stock_levels"
if ($script:NetworkReady -or -not $SkipUserLevelWhenOffline) {
    $script:NavigationPath = "user_level_then_regular"
    Open-UserLevelPassiveReplay
    Collect-Evidence
    $afterUser = Get-SwarmOverlayState
    Write-Host "After user passive replay: state=$($afterUser.State) catalog=$($afterUser.Catalog) ghosts=$($afterUser.Ghosts)"

    Send-Back 1
    Start-Sleep -Seconds 2
    Dismiss-ExitGameDialogIfPresent | Out-Null
    Set-LandscapeNeutralSensors
    Ensure-GameActivityResumed
    Save-Screenshot "05b-after-user-replay-back.png"
} else {
    Write-Host "Skipping user-level search (offline); using bundled stock level passive replays only"
}

Open-RegularLevelPassiveReplay -Name "Straight On" -ScreenshotPrefix "06-regular-straight-on"
Collect-Evidence
$afterFirst = Get-SwarmOverlayState
Write-Host "After Straight On passive replay: state=$($afterFirst.State) catalog=$($afterFirst.Catalog) ghosts=$($afterFirst.Ghosts)"
if ($null -eq $afterFirst -or $afterFirst.Catalog -lt $MinCatalogEntries) {
    throw "Straight On passive replay did not populate swarm catalog (need >= $MinCatalogEntries). See $RunDir\public_ycs2_mod_debug.log"
}

Send-Back 1
Start-Sleep -Seconds 2
Dismiss-ExitGameDialogIfPresent | Out-Null
Set-LandscapeNeutralSensors
Ensure-GameActivityResumed
Save-Screenshot "03-after-straight-on-back.png"

Open-RegularLevelPassiveReplay -Name "Twist and Turn" -LevelTapX 115 -LevelTapY 130 -ScreenshotPrefix "04-twist-and-turn"
$ready = Wait-ForSwarmOverlayReady -MinCatalog $MinCatalogEntries -Seconds 45
Write-Host "Swarm overlay ready: state=$($ready.State) catalog=$($ready.Catalog) ghosts=$($ready.Ghosts)"
Save-Screenshot "09-before-swarm-picker.png"

$dialogXml = Open-SwarmPicker
Save-Screenshot "10-swarm-dialog.png"
Select-SwarmPrimaryAndGhost -DialogXml $dialogXml
Save-Screenshot "11-after-swarm-apply.png"
Start-Sleep -Seconds 3
Collect-Evidence
Assert-SwarmEvidence -ExpectedCatalog $ready.Catalog -ExpectedGhosts $MinGhostCount

$final = Get-SwarmOverlayState
$script:FinalCatalog = $final.Catalog
$script:FinalGhosts = $final.Ghosts
$script:FinalState = $final.State
$summary = @(
    "runtime_replay_swarm=passed",
    "apk=$ApkPath",
    "package=$Package",
    "catalog_entries=$($final.Catalog)",
    "ghost_count=$($final.Ghosts)",
    "overlay_state=$($final.State)",
    "navigation_path=$script:NavigationPath",
    "network_ready=$script:NetworkReady",
    "artifacts=$RunDir"
)
$summary | Set-Content -LiteralPath (Join-Path $RunDir "summary.txt") -Encoding UTF8
Write-Host "Replay swarm runtime test passed. Artifacts: $RunDir"
} catch {
    Collect-Evidence
    $info = Get-SwarmOverlayState
    if ($null -ne $info) {
        $script:FinalCatalog = $info.Catalog
        $script:FinalGhosts = $info.Ghosts
        $script:FinalState = $info.State
    }
    @(
        "runtime_replay_swarm=failed",
        "error=$($_.Exception.Message)",
        "apk=$ApkPath",
        "package=$Package",
        "catalog_entries=$script:FinalCatalog",
        "ghost_count=$script:FinalGhosts",
        "overlay_state=$script:FinalState",
        "navigation_path=$script:NavigationPath",
        "network_ready=$script:NetworkReady",
        "artifacts=$RunDir"
    ) | Set-Content -LiteralPath (Join-Path $RunDir "summary.txt") -Encoding UTF8
    throw
}
