param(
    [string]$ApkPath = "jcs2-mod.apk",
    [string]$Package = "modded.ycs2",
    [string]$LauncherActivity = "com.trueaxis.modmenu.ModLauncherActivity",
    [ValidateSet("LandscapeRight", "LandscapeLeft")]
    [string]$LandscapeSide = "LandscapeLeft",
    [string]$StraightAcceleration = "9.80665:0:0",
    [string]$StraightOrientation = "0:0:90",
    [int]$GameStartupWaitSeconds = 60,
    [int]$DriveHoldMs = 70000,
    [int]$ClearAcceleratorTutorialMs = 2500,
    [int]$AcceleratorX = 444,
    [int]$AcceleratorY = 204,
    [int]$BoostX = 36,
    [int]$BoostY = 204,
    [bool]$EnableAccelerateWithJet = $true,
    [bool]$ClearAppDataBeforeRun = $true,
    [bool]$SkipInstall = $false,
    [bool]$UsePassiveReplay = $false,
    [bool]$ForceLoginDismissTap = $true,
    [string]$Adb = "$env:LOCALAPPDATA\Android\Sdk\platform-tools\adb.exe",
    [string]$OutDir = "_apk_build\runtime-freecam-gestures"
)

$ErrorActionPreference = "Stop"
$Root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
Set-Location $Root

if (-not (Test-Path -LiteralPath $Adb)) {
    throw "adb not found: $Adb"
}
if (-not $SkipInstall -and -not (Test-Path -LiteralPath $ApkPath)) {
    throw "APK not found: $ApkPath"
}

$RunDir = Join-Path $OutDir (Get-Date -Format "yyyyMMdd-HHmmss")
New-Item -ItemType Directory -Force -Path $RunDir | Out-Null
$script:NextTrackingId = 700

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
    $extension = [System.IO.Path]::GetExtension($Name)
    $basename = [System.IO.Path]::GetFileNameWithoutExtension($Name)
    if ([string]::IsNullOrWhiteSpace($extension)) { $extension = ".png" }
    $rawPath = Join-Path $RunDir "$basename.raw$extension"
    cmd /c "`"$Adb`" exec-out screencap -p > `"$rawPath`""
    if ($LASTEXITCODE -ne 0) {
        throw "screencap failed for $rawPath"
    }

    Copy-Item -LiteralPath $rawPath -Destination $path -Force
}

function Dump-WindowXml {
    try { & $Adb shell uiautomator dump /sdcard/window.xml 1>$null 2>$null } catch {}
    return Read-AdbText shell cat /sdcard/window.xml
}

function Wait-ForWindowText {
    param([string]$Text, [int]$Seconds = 20)
    $deadline = (Get-Date).AddSeconds($Seconds)
    do {
        Dismiss-AnrDialogIfPresent | Out-Null
        Dismiss-UpdatePromptIfPresent | Out-Null
        $xml = Dump-WindowXml
        if ($xml -like "*$Text*") { return $xml }
        Start-Sleep -Milliseconds 500
    } while ((Get-Date) -lt $deadline)
    throw "Timed out waiting for window text: $Text"
}

function Wait-ForLog {
    param([string]$Pattern, [int]$Seconds = 20)
    $deadline = (Get-Date).AddSeconds($Seconds)
    do {
        $debug = Read-AdbText shell cat /sdcard/YCS2CommunityMod/logs/ycs2_mod_debug.log
        if ($debug -match $Pattern) { return $debug }
        Start-Sleep -Milliseconds 500
    } while ((Get-Date) -lt $deadline)
    throw "Timed out waiting for debug log pattern: $Pattern"
}

function Tap {
    param([int]$X, [int]$Y)
    Send-EmuTapDevice $X $Y
}

function Tap-Menu {
    param([int]$X, [int]$Y)
    Send-EmuTapLandscape $X $Y
}

function Tap-Input {
    param([int]$X, [int]$Y)
    Invoke-Adb shell input tap $X $Y
}

function Get-DisplayViewportOrientation {
    $display = Read-AdbText shell dumpsys display
    $match = [regex]::Match($display, "DisplayViewport\{type=INTERNAL,[^}]*orientation=(\d)")
    if ($match.Success) { return [int]$match.Groups[1].Value }
    return -1
}

function Set-EmulatorLandscape {
    Invoke-Adb shell settings put system accelerometer_rotation 0
    Invoke-Adb shell settings put system user_rotation 1
    for ($attempt = 0; $attempt -lt 4; $attempt++) {
        if ((Get-DisplayViewportOrientation) -eq 1) { return }
        & $Adb emu rotate | Out-Null
        Start-Sleep -Seconds 1
    }
    $orientation = Get-DisplayViewportOrientation
    if ($orientation -ne 1) {
        throw "Could not rotate emulator viewport to landscape; orientation=$orientation"
    }
}

function Prepare-EmulatorDisplay {
    # Keep the emulator's physical display portrait and rotate the Android
    # viewport into landscape. Setting a physical 480x320 display can leave
    # JCS2 with a 320x320 compatibility SurfaceView inside a 480x320 window,
    # which invalidates camera-framing proof screenshots.
    Invoke-Adb shell wm size 320x480
    Invoke-Adb shell wm density 160
    Invoke-Adb shell settings put system accelerometer_rotation 0
    Invoke-Adb shell settings put system user_rotation 1
    Invoke-Adb shell settings put secure immersive_mode_confirmations confirmed
    Start-Sleep -Seconds 1
}

function Assert-LandscapeGameSurface {
    param([string]$Name)
    # Retry the dump: on a cold emulator the game SurfaceView can appear tens
    # of seconds after the activity resumes, and a single dump races that.
    $match = $null
    $deadline = (Get-Date).AddSeconds(60)
    do {
        $xml = Dump-WindowXml
        $match = [regex]::Match($xml, 'class="android\.view\.SurfaceView"[^>]*bounds="\[(\d+),(\d+)\]\[(\d+),(\d+)\]"')
        if ($match.Success) { break }
        Start-Sleep -Seconds 3
    } while ((Get-Date) -lt $deadline)
    $xml | Set-Content -LiteralPath (Join-Path $RunDir "$Name-window.xml") -Encoding UTF8
    if (-not $match.Success) {
        throw "$Name did not expose the game SurfaceView. See $RunDir\$Name-window.xml"
    }
    $x1 = [int]$match.Groups[1].Value
    $y1 = [int]$match.Groups[2].Value
    $x2 = [int]$match.Groups[3].Value
    $y2 = [int]$match.Groups[4].Value
    $width = $x2 - $x1
    $height = $y2 - $y1
    if ($width -lt 460 -or $height -lt 300 -or $width -le $height) {
        throw "$Name SurfaceView is clipped/square ($width x $height), not full landscape. See $RunDir\$Name-window.xml"
    }
}

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
    if ($Down) {
        [void]$events.Add("EV_KEY:BTN_TOUCH:1")
    }
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

function Send-EmuGesture {
    param([object[]]$Starts, [object[]]$Ends, [int]$Steps = 14)
    if ($Starts.Count -ne $Ends.Count -or $Starts.Count -lt 1) {
        throw "Invalid emulator gesture path"
    }
    Send-EmuTouchFrame -Points $Starts -Down $true -Up $false
    Start-Sleep -Milliseconds 30
    for ($step = 1; $step -le $Steps; $step++) {
        $points = New-Object System.Collections.Generic.List[object]
        $t = [double]$step / [double]$Steps
        for ($i = 0; $i -lt $Starts.Count; $i++) {
            $sx = [double]$Starts[$i].X
            $sy = [double]$Starts[$i].Y
            $ex = [double]$Ends[$i].X
            $ey = [double]$Ends[$i].Y
            [void]$points.Add((New-TouchPoint ($sx + (($ex - $sx) * $t)) ($sy + (($ey - $sy) * $t))))
        }
        Send-EmuTouchFrame -Points @($points.ToArray()) -Down $false -Up $false
        Start-Sleep -Milliseconds 12
    }
    Send-EmuTouchFrame -Points $Ends -Down $false -Up $true
    $script:NextTrackingId += 10
    Start-Sleep -Milliseconds 220
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
    $x = [int](($x1 + $x2) / 2)
    $y = [int](($y1 + $y2) / 2)
    Invoke-Adb shell input tap $x $y
}

function Tap-WindowText {
    param([string]$Text, [int]$Seconds = 20)
    $xml = Wait-ForWindowText $Text $Seconds
    Tap-WindowTextFromXml $Text $xml
}

function Dismiss-PermissionDialogIfPresent {
    $xml = Dump-WindowXml
    if ($xml -like "*permissioncontroller*" -and $xml -like "*Allow*") {
        $xml | Set-Content -LiteralPath (Join-Path $RunDir "permission-dialog.xml") -Encoding UTF8
        Tap-WindowTextFromXml "Allow" $xml
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
    # In-app updater download-progress dialog ("Downloading update" with
    # "Cancel download" / "Hide"): Hide dismisses it and reveals Start game.
    if ($xml -like "*Downloading update*" -or ($xml -like "*Cancel download*" -and $xml -like "*Hide*")) {
        $xml | Set-Content -LiteralPath (Join-Path $RunDir "update-download-dialog.xml") -Encoding UTF8
        if ($xml -like "*Cancel download*") {
            Tap-WindowTextFromXml "Cancel download" $xml
        } else {
            Tap-WindowTextFromXml "Hide" $xml
        }
        Start-Sleep -Seconds 1
        return $true
    }
    return $false
}

function Dismiss-AnrDialogIfPresent {
    $xml = Dump-WindowXml
    if (($xml -like "*isn't responding*" -or $xml -like "*is not responding*") -and $xml -like "*Wait*") {
        $xml | Set-Content -LiteralPath (Join-Path $RunDir "anr-dialog.xml") -Encoding UTF8
        Tap-WindowTextFromXml "Wait" $xml
        Start-Sleep -Seconds 2
        return $true
    }
    return $false
}

function Send-EmuTouchHold {
    param(
        [double]$X,
        [double]$Y,
        [int]$DurationMs
    )
    $point = New-TouchPoint $X $Y
    Send-EmuTouchFrame -Points @($point) -Down $true -Up $false
    Start-Sleep -Milliseconds $DurationMs
    Send-EmuTouchFrame -Points @($point) -Down $false -Up $true
    $script:NextTrackingId += 10
}

function Start-TouchHold {
    param(
        [string]$Name,
        [int]$X,
        [int]$Y,
        [int]$DurationMs
    )
    Start-Job -Name $Name -ScriptBlock {
        param([string]$AdbPath, [double]$TouchX, [double]$TouchY, [int]$HoldMs, [int]$TrackingId)
        function Send-HoldFrame {
            param([object[]]$Points, [bool]$Down, [bool]$Up)
            $events = New-Object System.Collections.Generic.List[string]
            for ($slot = 0; $slot -lt $Points.Count; $slot++) {
                $point = $Points[$slot]
                $absX = [int]([Math]::Max(0.0, [Math]::Min(479.0, [double]$point.X)) * 32767.0 / 480.0)
                $absY = [int]([Math]::Max(0.0, [Math]::Min(319.0, [double]$point.Y)) * 32767.0 / 320.0)
                [void]$events.Add("EV_ABS:ABS_MT_SLOT:$slot")
                if ($Down) {
                    [void]$events.Add("EV_ABS:ABS_MT_TRACKING_ID:$($TrackingId + $slot)")
                }
                [void]$events.Add("EV_ABS:ABS_MT_POSITION_X:$absX")
                [void]$events.Add("EV_ABS:ABS_MT_POSITION_Y:$absY")
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
            & $AdbPath emu event send @($events.ToArray()) | Out-Null
        }
        $point = [pscustomobject]@{ X = $TouchX; Y = $TouchY }
        Send-HoldFrame -Points @($point) -Down $true -Up $false
        Start-Sleep -Milliseconds $HoldMs
        Send-HoldFrame -Points @($point) -Down $false -Up $true
    } -ArgumentList $Adb, $X, $Y, $DurationMs, $script:NextTrackingId
    $script:NextTrackingId += 10
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

function Enable-AccelerateWithJetOption {
    if (-not $EnableAccelerateWithJet) { return }
    Write-Host "Enabling stock Accelerate with jet"
    Tap-Menu 270 195
    Start-Sleep -Seconds 2
    Save-Screenshot "01c-help-and-options.png"
    Tap-Menu 220 135
    Start-Sleep -Seconds 2
    Save-Screenshot "01d-settings-top.png"
    Save-Screenshot "01e-accelerate-with-jet-before.png"
    Tap-Menu 235 145
    Start-Sleep -Seconds 1
    Save-Screenshot "01f-accelerate-with-jet-after.png"
    Invoke-Adb shell input keyevent BACK
    Start-Sleep -Seconds 2
    Save-Screenshot "01h-main-menu-after-accelerate-with-jet.png"
}

function Grant-StoragePermissions {
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

$script:TesseractExe = $null
function Get-TesseractExe {
    if ($script:TesseractExe) { return $script:TesseractExe }
    $cmd = Get-Command tesseract.exe -ErrorAction SilentlyContinue
    if ($cmd) { $script:TesseractExe = $cmd.Source; return $script:TesseractExe }
    foreach ($candidate in @($env:TESSERACT_EXE, "C:\Program Files\Tesseract-OCR\tesseract.exe")) {
        if ($candidate -and (Test-Path -LiteralPath $candidate)) {
            $script:TesseractExe = $candidate
            return $candidate
        }
    }
    return $null
}

# OCR the current framebuffer. The TrueAxis/Facebook LOGIN prompt is drawn
# inside the game's GL SurfaceView, so uiautomator sees no text for it; OCR is
# the only reliable way to detect and clear it.
function Get-ScreenText {
    param([string]$Tag = "ocr")
    $exe = Get-TesseractExe
    if (-not $exe) { return "" }
    $raw = Join-Path $RunDir "_ocr-$Tag.png"
    cmd /c "`"$Adb`" exec-out screencap -p > `"$raw`""
    if ($LASTEXITCODE -ne 0 -or -not (Test-Path -LiteralPath $raw)) { return "" }
    try { $text = & $exe $raw stdout 2>$null } catch { return "" }
    return ($text -join "`n")
}

# Fullscreen OCR routinely misses the stylized italic "VIEW REPLAY" banner
# text. Second chance: crop the button region from the framebuffer, upscale
# and binarize it (white-on-dark banner), and OCR just that strip. The crop
# only spans the VIEW REPLAY button, so matching "REPLAY" alone is safe.
function Test-ViewReplayButtonVisible {
    $exe = Get-TesseractExe
    if (-not $exe) { return $false }
    $raw = Join-Path $RunDir "_ocr-view-replay-probe.png"
    if (-not (Test-Path -LiteralPath $raw)) { return $false }
    try {
        Add-Type -AssemblyName System.Drawing
        $src = [System.Drawing.Bitmap]::FromFile((Resolve-Path -LiteralPath $raw))
        if ($src.Width -lt 360 -or $src.Height -lt 318) { $src.Dispose(); return $false }
        $rect = New-Object System.Drawing.Rectangle(120, 288, 240, 30)
        $crop = $src.Clone($rect, $src.PixelFormat)
        $big = New-Object System.Drawing.Bitmap(($crop.Width * 4), ($crop.Height * 4))
        $g = [System.Drawing.Graphics]::FromImage($big)
        $g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
        $g.DrawImage($crop, 0, 0, $big.Width, $big.Height)
        $g.Dispose()
        for ($y = 0; $y -lt $big.Height; $y++) {
            for ($x = 0; $x -lt $big.Width; $x++) {
                $p = $big.GetPixel($x, $y)
                $lum = (0.3 * $p.R + 0.59 * $p.G + 0.11 * $p.B)
                if ($lum -gt 150) { $big.SetPixel($x, $y, [System.Drawing.Color]::Black) }
                else { $big.SetPixel($x, $y, [System.Drawing.Color]::White) }
            }
        }
        $out = Join-Path $RunDir "_ocr-view-replay-crop.png"
        $big.Save($out, [System.Drawing.Imaging.ImageFormat]::Png)
        $src.Dispose(); $crop.Dispose(); $big.Dispose()
        $text = (& $exe $out stdout --psm 7 2>$null) -join "`n"
        return ($text -imatch "REPLAY")
    } catch {
        return $false
    }
}

function Test-GlLoginPrompt {
    param([string]$Text)
    if (-not $Text) { return $false }
    $markers = 0
    if ($Text -imatch "true\s*ax[il]s") { $markers++ }
    if ($Text -imatch "facebook") { $markers++ }
    if ($Text -imatch "connect") { $markers++ }
    if ($Text -imatch "leaderboard") { $markers++ }
    if ($Text -imatch "privacy\s+statement") { $markers++ }
    # Two independent markers avoids a false positive on incidental HUD text.
    return ($markers -ge 2)
}

# The GL login prompt only responds to adb shell input tap (logical landscape
# coordinates); the emulator raw-event Tap does not land on it. PLAY at the
# bottom-right proceeds and clears the prompt.
function Dismiss-LoginOverlayIfPresent {
    $xml = Dump-WindowXml
    $xmlLogin = ($xml -like "*Facebook Connect*" -or ($xml -like "*True Axis*" -and $xml -like "*PLAY*"))
    $text = Get-ScreenText "login"
    $glLogin = Test-GlLoginPrompt $text
    if (-not $xmlLogin -and -not $glLogin) { return $false }
    $xml | Set-Content -LiteralPath (Join-Path $RunDir "login-overlay.xml") -Encoding UTF8
    for ($attempt = 0; $attempt -lt 8; $attempt++) {
        # Skip declines the login persistently; PLAY proceeds past the screen.
        # The GL name field is not a real EditText, so alternate both.
        Tap-Input 118 268
        Start-Sleep -Milliseconds 900
        Tap-Input 446 307
        Start-Sleep -Seconds 2
        Submit-PlayerNamePromptIfPresent | Out-Null
        if (-not (Test-GlLoginPrompt (Get-ScreenText "login-verify"))) { return $true }
    }
    throw "TrueAxis/Facebook LOGIN prompt did not clear after Skip/PLAY taps; it is blocking runtime navigation."
}

function Submit-PlayerNamePromptIfPresent {
    $xml = Dump-WindowXml
    if ($xml -notlike "*EditText*" -or ($xml -notlike "*Player*" -and $xml -notlike "*Codex*")) {
        return $false
    }
    $xml | Set-Content -LiteralPath (Join-Path $RunDir "player-name-prompt.xml") -Encoding UTF8
    Invoke-Adb shell input text Codex
    Start-Sleep -Milliseconds 300
    Invoke-Adb shell input keyevent ENTER
    Start-Sleep -Milliseconds 300
    Tap 441 296
    Start-Sleep -Milliseconds 300
    Invoke-Adb shell input keyevent BACK
    Start-Sleep -Seconds 2
    for ($i = 0; $i -lt 10; $i++) {
        $after = Dump-WindowXml
        if ($after -notlike "*EditText*") { return $true }
        Tap 441 296
        Invoke-Adb shell input keyevent ENTER
        Invoke-Adb shell input keyevent BACK
        Start-Sleep -Milliseconds 500
    }
    throw "Player-name prompt remained after submit; TrueAxis/player setup is blocking runtime navigation"
}

function Set-LandscapeNeutralSensors {
    $rotation = if ($LandscapeSide -eq "LandscapeLeft") { 1 } else { 3 }
    Invoke-Adb shell wm size 480x320
    Invoke-Adb shell settings put system accelerometer_rotation 0
    Invoke-Adb shell settings put system user_rotation $rotation
    Invoke-Adb emu sensor set acceleration $StraightAcceleration
    Invoke-Adb emu sensor set gyroscope "0:0:0"
    Invoke-Adb emu sensor set orientation $StraightOrientation
}

function Dismiss-StartupLoginOverlay {
    if (Submit-PlayerNamePromptIfPresent) { return }
    if (Dismiss-LoginOverlayIfPresent) { return }
    if (-not $ForceLoginDismissTap) { return }
    Dump-WindowXml | Set-Content -LiteralPath (Join-Path $RunDir "login-overlay-fallback-window.xml") -Encoding UTF8
    Tap 414 299
    Start-Sleep -Seconds 3
    Submit-PlayerNamePromptIfPresent | Out-Null
}

function Enable-LauncherOptions {
    $initialXml = ""
    for ($i = 0; $i -lt 40; $i++) {
        if (Dismiss-AnrDialogIfPresent) {
            Start-Sleep -Milliseconds 800
            continue
        }
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
            Dismiss-PermissionDialogIfPresent | Out-Null
            Start-Sleep -Milliseconds 400
        }
    }
    Start-Sleep -Milliseconds 500
    $xml = Wait-ForWindowText "Start game" 10
    $xml | Set-Content -LiteralPath (Join-Path $RunDir "launcher-before-start.xml") -Encoding UTF8
    Tap-WindowTextFromXml "Start game" $xml
    Start-Sleep -Seconds 2
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

function Open-RegularStraightOnLevelDetail {
    Write-Host "Opening regular Straight On level detail"
    Tap-Input 190 96
    Start-Sleep -Seconds 4
    Submit-PlayerNamePromptIfPresent | Out-Null
    Dismiss-LoginOverlayIfPresent | Out-Null
    Close-ExternalBrowserIfPresent | Out-Null
    Save-Screenshot "02-regular-play-open.png"

    # Straight On is the first stock platforming track. If PLAY opened the
    # detail page directly this top-left tap is harmless; otherwise it selects
    # the first regular level from the list.
    Tap-Input 115 84
    Start-Sleep -Seconds 4
    Submit-PlayerNamePromptIfPresent | Out-Null
    Dismiss-LoginOverlayIfPresent | Out-Null
    Close-ExternalBrowserIfPresent | Out-Null
    Save-Screenshot "03-straight-on-detail.png"
}

function Run-StraightOnRace {
    Write-Host "Starting race against replay ghost"
    Invoke-Adb shell input tap 414 302
    Start-Sleep -Seconds 6
    Set-LandscapeNeutralSensors
    Close-ExternalBrowserIfPresent | Out-Null
    Save-Screenshot "04-race-start.png"
    $debug = Read-AdbText shell cat /sdcard/YCS2CommunityMod/logs/ycs2_mod_debug.log
    if ($debug -notmatch "split armed") {
        Write-Host "Race may not have started yet; retrying PLAY tap on level detail"
        Invoke-Adb shell input tap 430 295
        Start-Sleep -Seconds 6
        Set-LandscapeNeutralSensors
        Save-Screenshot "04a-race-retry.png"
    }

    if ($ClearAcceleratorTutorialMs -gt 0) {
        Write-Host "Clearing first-run accelerator tutorial gate for ${ClearAcceleratorTutorialMs}ms"
        Invoke-Adb shell input swipe $AcceleratorX $AcceleratorY $AcceleratorX $AcceleratorY $ClearAcceleratorTutorialMs
        Start-Sleep -Seconds 1
        Set-LandscapeNeutralSensors
        Save-Screenshot "04b-tutorial-clear.png"
    }

    $driveMode = "accelerator then boost"
    # Hold via adb input swipe (logical landscape coords): the raw emulator
    # touch path does not land on the rotated-viewport display this harness
    # now uses, so a Send-EmuTouchHold press never registers. A short
    # ACCELERATOR hold first satisfies the first-run accelerator tutorial gate
    # if it appears; the long BOOST hold then jet-flies the course (wheels
    # alone cannot clear the Straight On ramps) and satisfies the afterburner
    # gate on the way.
    $holdJobs = @(Start-Job -ScriptBlock {
        param($AdbExe, $Ax, $Ay, $Bx, $By, $HoldMs)
        & $AdbExe shell input swipe $Ax $Ay $Ax $Ay 6000
        & $AdbExe shell input swipe $Bx $By $Bx $By ($HoldMs - 6000)
    } -ArgumentList $Adb, $AcceleratorX, $AcceleratorY, $BoostX, $BoostY, $DriveHoldMs)
    Write-Host "Holding $driveMode for ${DriveHoldMs}ms"
    $driveStart = Get-Date
    try {
        while (((Get-Date) - $driveStart).TotalMilliseconds -lt $DriveHoldMs) {
            Set-LandscapeNeutralSensors
            Close-ExternalBrowserIfPresent | Out-Null
            Start-Sleep -Milliseconds 500
        }
    } finally {
        Wait-TouchHold $holdJobs
    }
    Save-Screenshot "05-race-finished.png"
}

function Open-RegularStraightOnPassiveReplay {
    Open-RegularStraightOnLevelDetail
    Write-Host "Starting Straight On replay fly-through"
    # The VIEW REPLAY button lives inside the GL SurfaceView (invisible to
    # uiautomator) and only appears once the level-detail leaderboard finishes
    # "Connecting to server". Wait for OCR to actually see the button before
    # tapping it, then retry the tap until playback diagnostics appear.
    $points = @(@(240, 302), @(217, 298), @(280, 302))
    $entered = $false
    for ($attempt = 0; $attempt -lt 20 -and -not $entered; $attempt++) {
        Submit-PlayerNamePromptIfPresent | Out-Null
        Dismiss-LoginOverlayIfPresent | Out-Null
        $ocr = Get-ScreenText "view-replay-probe"
        if ($ocr -notmatch "VIEW\s*REPLAY" -and -not (Test-ViewReplayButtonVisible)) {
            # Button not up yet (leaderboard still connecting); keep waiting.
            Start-Sleep -Seconds 3
            continue
        }
        $point = $points[$attempt % $points.Count]
        Tap-Input $point[0] $point[1]
        Start-Sleep -Seconds 4
        Submit-PlayerNamePromptIfPresent | Out-Null
        if (Dismiss-LoginOverlayIfPresent) { continue }
        $debug = Read-AdbText shell cat /sdcard/YCS2CommunityMod/logs/ycs2_mod_debug.log
        if ($debug -match "gesture_layer touchable=true|orbit_diag") { $entered = $true }
    }
    Start-Sleep -Seconds 4
    Save-Screenshot "04-passive-replay-open.png"
    if (-not $entered) {
        throw "View Replay playback did not start (no gesture_layer/orbit_diag evidence) after waiting for and tapping the VIEW REPLAY button. See $RunDir\04-passive-replay-open.png"
    }
}

function Write-UiautomatorGestureSource {
    param([string]$SourcePath)
    $source = @'
package com.trueaxis.modtest;

import android.graphics.Point;
import android.os.SystemClock;
import android.view.InputDevice;
import android.view.InputEvent;
import android.view.MotionEvent;
import com.android.uiautomator.core.UiDevice;
import com.android.uiautomator.core.UiObject;
import com.android.uiautomator.core.UiSelector;
import com.android.uiautomator.testrunner.UiAutomatorTestCase;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

public class FreecamGestureTest extends UiAutomatorTestCase {
    private static final int STEPS = 14;

    public void testFreecamGestures() throws Exception {
        String mode = getParams().getString("mode");
        if ("tap".equals(mode)) {
            tap(intParam("x"), intParam("y"));
            return;
        }

        UiDevice device = getUiDevice();
        device.waitForIdle(1000);
        if (!device.swipe(120, 160, 210, 160, STEPS)) {
            throw new AssertionError("single-finger pan injection failed");
        }
        SystemClock.sleep(350);

        gesture(
                path(new Point(130, 160), new Point(100, 160), STEPS),
                path(new Point(190, 160), new Point(220, 160), STEPS));
        SystemClock.sleep(350);

        gesture(
                path(new Point(125, 125), new Point(110, 180), STEPS),
                path(new Point(195, 195), new Point(240, 140), STEPS));
        SystemClock.sleep(350);

        gesture(
                path(new Point(110, 140), new Point(170, 165), STEPS),
                path(new Point(160, 185), new Point(220, 210), STEPS),
                path(new Point(210, 140), new Point(270, 165), STEPS));
        SystemClock.sleep(350);

        gesture(
                path(new Point(95, 135), new Point(145, 165), STEPS),
                path(new Point(130, 185), new Point(180, 215), STEPS),
                path(new Point(165, 135), new Point(215, 165), STEPS),
                path(new Point(200, 185), new Point(250, 215), STEPS));
        SystemClock.sleep(350);
    }

    private int intParam(String name) {
        String value = getParams().getString(name);
        if (value == null) {
            throw new AssertionError("missing integer parameter " + name);
        }
        return Integer.parseInt(value);
    }

    private void tap(int x, int y) throws Exception {
        UiDevice device = getUiDevice();
        device.waitForIdle(500);
        if (!device.swipe(x, y, x + 1, y + 1, 2)) {
            throw new AssertionError(
                    "device tap-swipe failed at "
                            + x
                            + ","
                            + y
                            + " display="
                            + device.getDisplayWidth()
                            + "x"
                            + device.getDisplayHeight());
        }
    }

    private void single(MotionEvent.PointerCoords[] touch) throws Exception {
        long downTime = SystemClock.uptimeMillis();
        MotionEvent.PointerProperties[] properties = new MotionEvent.PointerProperties[] { property(0) };
        inject(downTime, MotionEvent.ACTION_DOWN, properties, new MotionEvent.PointerCoords[] { touch[0] }, 1);
        for (int step = 1; step < touch.length - 1; step++) {
            inject(downTime, MotionEvent.ACTION_MOVE, properties, new MotionEvent.PointerCoords[] { touch[step] }, 1);
            SystemClock.sleep(5);
        }
        inject(
                downTime,
                MotionEvent.ACTION_UP,
                properties,
                new MotionEvent.PointerCoords[] { touch[touch.length - 1] },
                1);
    }

    private void gesture(MotionEvent.PointerCoords[]... touches) throws Exception {
        if (touches.length < 2) {
            throw new AssertionError("multi-pointer gesture needs at least two pointers");
        }
        UiObject any = new UiObject(new UiSelector());
        boolean injected = any.performMultiPointerGesture(touches);
        if (!injected && touches.length <= 2) {
            throw new AssertionError("multi-pointer gesture injection failed for " + touches.length + " pointers");
        }
    }

    private void injectedGesture(MotionEvent.PointerCoords[]... touches) throws Exception {
        if (touches.length < 2) {
            throw new AssertionError("multi-pointer gesture needs at least two pointers");
        }

        MotionEvent.PointerProperties[] properties = new MotionEvent.PointerProperties[touches.length];
        for (int i = 0; i < touches.length; i++) {
            properties[i] = property(i);
        }

        int maxSteps = 0;
        for (int i = 0; i < touches.length; i++) {
            maxSteps = Math.max(maxSteps, touches[i].length);
        }
        long downTime = SystemClock.uptimeMillis();

        MotionEvent.PointerCoords[] current = coordsForStep(touches, 0);
        inject(downTime, MotionEvent.ACTION_DOWN, properties, current, 1);
        for (int pointer = 1; pointer < touches.length; pointer++) {
            inject(
                    downTime,
                    MotionEvent.ACTION_POINTER_DOWN | (pointer << MotionEvent.ACTION_POINTER_INDEX_SHIFT),
                    properties,
                    current,
                    pointer + 1);
        }

        for (int step = 1; step < maxSteps - 1; step++) {
            current = coordsForStep(touches, step);
            inject(downTime, MotionEvent.ACTION_MOVE, properties, current, touches.length);
            SystemClock.sleep(5);
        }

        current = coordsForStep(touches, maxSteps - 1);
        for (int pointer = touches.length - 1; pointer >= 1; pointer--) {
            inject(
                    downTime,
                    MotionEvent.ACTION_POINTER_UP | (pointer << MotionEvent.ACTION_POINTER_INDEX_SHIFT),
                    properties,
                    current,
                    pointer + 1);
        }
        inject(downTime, MotionEvent.ACTION_UP, properties, current, 1);
    }

    private MotionEvent.PointerCoords[] coordsForStep(MotionEvent.PointerCoords[][] touches, int step) {
        MotionEvent.PointerCoords[] coords = new MotionEvent.PointerCoords[touches.length];
        for (int i = 0; i < touches.length; i++) {
            coords[i] = touches[i][Math.min(step, touches[i].length - 1)];
        }
        return coords;
    }

    private void inject(
            long downTime,
            int action,
            MotionEvent.PointerProperties[] allProperties,
            MotionEvent.PointerCoords[] allCoords,
            int pointerCount)
            throws Exception {
        MotionEvent.PointerProperties[] properties = new MotionEvent.PointerProperties[pointerCount];
        MotionEvent.PointerCoords[] coords = new MotionEvent.PointerCoords[pointerCount];
        System.arraycopy(allProperties, 0, properties, 0, pointerCount);
        System.arraycopy(allCoords, 0, coords, 0, pointerCount);
        MotionEvent event = MotionEvent.obtain(
                downTime,
                SystemClock.uptimeMillis(),
                action,
                pointerCount,
                properties,
                coords,
                0,
                0,
                1.0f,
                1.0f,
                0,
                0,
                InputDevice.SOURCE_TOUCHSCREEN,
                0);
        try {
            if (!injectInputEvent(event)) {
                throw new AssertionError("input injection returned false for action " + action);
            }
        } finally {
            event.recycle();
        }
    }

    private boolean injectInputEvent(InputEvent event) throws Exception {
        Field bridgeField = UiDevice.class.getDeclaredField("mUiAutomationBridge");
        bridgeField.setAccessible(true);
        Object bridge = bridgeField.get(UiDevice.getInstance());
        Method injectMethod = bridge.getClass().getMethod("injectInputEvent", InputEvent.class, boolean.class);
        return ((Boolean) injectMethod.invoke(bridge, event, true)).booleanValue();
    }

    private MotionEvent.PointerProperties property(int id) {
        MotionEvent.PointerProperties property = new MotionEvent.PointerProperties();
        property.id = id;
        property.toolType = MotionEvent.TOOL_TYPE_FINGER;
        return property;
    }

    private MotionEvent.PointerCoords[] path(Point start, Point end, int steps) {
        MotionEvent.PointerCoords[] coords = new MotionEvent.PointerCoords[steps + 1];
        for (int i = 0; i <= steps; i++) {
            float t = (float) i / (float) steps;
            coords[i] = point(start.x + (end.x - start.x) * t, start.y + (end.y - start.y) * t);
        }
        return coords;
    }

    private MotionEvent.PointerCoords point(float x, float y) {
        MotionEvent.PointerCoords point = new MotionEvent.PointerCoords();
        point.x = x;
        point.y = y;
        point.pressure = 1.0f;
        point.size = 1.0f;
        return point;
    }
}
'@
    $utf8NoBom = [System.Text.UTF8Encoding]::new($false)
    [System.IO.File]::WriteAllText($SourcePath, $source, $utf8NoBom)
}

function Build-UiautomatorGestureJar {
    $buildDir = Join-Path $RunDir "uiautomator-build"
    $srcDir = Join-Path $buildDir "src\com\trueaxis\modtest"
    $junitStubDir = Join-Path $buildDir "src\junit\framework"
    $androidTestStubDir = Join-Path $buildDir "src\android\test"
    $classesDir = Join-Path $buildDir "classes"
    $dexDir = Join-Path $buildDir "dex"
    New-Item -ItemType Directory -Force -Path $srcDir, $junitStubDir, $androidTestStubDir, $classesDir, $dexDir | Out-Null
    $sourcePath = Join-Path $srcDir "FreecamGestureTest.java"
    Write-UiautomatorGestureSource $sourcePath
    $junitStubPath = Join-Path $junitStubDir "TestCase.java"
    [System.IO.File]::WriteAllText(
        $junitStubPath,
        "package junit.framework; public class TestCase { public TestCase() {} }",
        [System.Text.UTF8Encoding]::new($false))
    $repetitiveStubPath = Join-Path $androidTestStubDir "RepetitiveTest.java"
    [System.IO.File]::WriteAllText(
        $repetitiveStubPath,
        "package android.test; import java.lang.annotation.Retention; import java.lang.annotation.RetentionPolicy; @Retention(RetentionPolicy.RUNTIME) public @interface RepetitiveTest { int numIterations() default 1; }",
        [System.Text.UTF8Encoding]::new($false))

    $jdkHome = (Get-Content "tools\jdk21_home.txt" -Raw).Trim()
    $javac = Join-Path $jdkHome "bin\javac.exe"
    $jar = Join-Path $jdkHome "bin\jar.exe"
    $java = Join-Path $jdkHome "bin\java.exe"
    $sdkRoot = if ($env:ANDROID_HOME) { $env:ANDROID_HOME } elseif ($env:ANDROID_SDK_ROOT) { $env:ANDROID_SDK_ROOT } else { Join-Path $env:LOCALAPPDATA "Android\Sdk" }
    $androidJar = Join-Path $sdkRoot "platforms\android-34\android.jar"
    $uiautomatorJar = Join-Path $sdkRoot "platforms\android-34\uiautomator.jar"
    if (-not (Test-Path $androidJar)) { throw "android.jar not found: $androidJar" }
    if (-not (Test-Path $uiautomatorJar)) { throw "uiautomator.jar not found: $uiautomatorJar" }

    & $javac -source 8 -target 8 -Xlint:-options -encoding UTF-8 `
        -classpath "$androidJar;$uiautomatorJar" `
        -d $classesDir `
        $sourcePath `
        $junitStubPath `
        $repetitiveStubPath
    if ($LASTEXITCODE -ne 0) { throw "javac failed for UiAutomator gesture helper" }

    $classesJar = Join-Path $buildDir "freecam-classes.jar"
    & $jar cf $classesJar -C $classesDir .
    if ($LASTEXITCODE -ne 0) { throw "jar failed for UiAutomator gesture helper" }

    & $java -cp (Join-Path $Root "tools\r8.jar") com.android.tools.r8.D8 `
        --min-api 23 `
        --lib $androidJar `
        --lib $uiautomatorJar `
        --output $dexDir `
        $classesJar
    if ($LASTEXITCODE -ne 0) { throw "D8 failed for UiAutomator gesture helper" }

    $outJar = Join-Path $buildDir "freecam-gestures.jar"
    & $jar cf $outJar -C $dexDir classes.dex
    if ($LASTEXITCODE -ne 0) { throw "final jar failed for UiAutomator gesture helper" }
    return $outJar
}

function Install-UiautomatorGestures {
    param([string]$JarPath)
    Invoke-Adb push $jarPath /data/local/tmp/freecam-gestures.jar | Out-Host
}

function Run-UiautomatorGestures {
    $output = & $Adb shell uiautomator runtest freecam-gestures.jar -c com.trueaxis.modtest.FreecamGestureTest 2>&1
    $output | Set-Content -LiteralPath (Join-Path $RunDir "uiautomator-freecam-gestures.txt") -Encoding UTF8
    if ($LASTEXITCODE -ne 0 -or (($output -join "`n") -match "FAILURES!!!|INSTRUMENTATION_STATUS_CODE: -1|INSTRUMENTATION_RESULT: shortMsg=Process crashed|Test run aborted|NoClassDefFoundError|Error in")) {
        throw "UiAutomator freecam gestures failed. See $RunDir\uiautomator-freecam-gestures.txt"
    }
}

function Run-UiautomatorTap {
    param([int]$X, [int]$Y, [string]$Name)
    $output = & $Adb shell uiautomator runtest freecam-gestures.jar `
        -c com.trueaxis.modtest.FreecamGestureTest `
        -e mode tap `
        -e x $X `
        -e y $Y 2>&1
    $output | Set-Content -LiteralPath (Join-Path $RunDir "uiautomator-$Name.txt") -Encoding UTF8
    if ($LASTEXITCODE -ne 0 -or (($output -join "`n") -match "FAILURES!!!|INSTRUMENTATION_STATUS_CODE: -1|INSTRUMENTATION_RESULT: shortMsg=Process crashed|Test run aborted|NoClassDefFoundError|Error in")) {
        throw "UiAutomator tap failed for $Name at $X,$Y. See $RunDir\uiautomator-$Name.txt"
    }
}

function Run-EmuFreecamGestures {
    Send-EmuGesture `
        -Starts @((New-TouchPoint 130 160), (New-TouchPoint 190 160)) `
        -Ends @((New-TouchPoint 210 160), (New-TouchPoint 270 160))

    Send-EmuGesture `
        -Starts @((New-TouchPoint 130 160), (New-TouchPoint 190 160)) `
        -Ends @((New-TouchPoint 100 160), (New-TouchPoint 220 160))

    Send-EmuGesture `
        -Starts @((New-TouchPoint 125 125), (New-TouchPoint 195 195)) `
        -Ends @((New-TouchPoint 110 180), (New-TouchPoint 240 140))

    Send-EmuGesture `
        -Starts @((New-TouchPoint 110 140), (New-TouchPoint 160 185), (New-TouchPoint 210 140)) `
        -Ends @((New-TouchPoint 170 165), (New-TouchPoint 220 210), (New-TouchPoint 270 165))

    Send-EmuGesture `
        -Starts @((New-TouchPoint 95 135), (New-TouchPoint 130 185), (New-TouchPoint 165 135), (New-TouchPoint 200 185)) `
        -Ends @((New-TouchPoint 145 165), (New-TouchPoint 180 215), (New-TouchPoint 215 165), (New-TouchPoint 250 215))
}

function Get-OrbitDiagAzimuthDeg {
    $debug = Read-AdbText shell cat /sdcard/YCS2CommunityMod/logs/ycs2_mod_debug.log
    $lines = $debug -split "`n" | Where-Object { $_ -match "orbit_diag" }
    if ($lines.Count -eq 0) { return $null }
    $m = [regex]::Match($lines[-1], "dir1000=(-?\d+),(-?\d+),(-?\d+)")
    if (-not $m.Success) { return $null }
    $x = [double]$m.Groups[1].Value
    $z = [double]$m.Groups[3].Value
    if (($x * $x + $z * $z) -lt 1000) { return $null }
    return [math]::Atan2($x, $z) * 180.0 / [math]::PI
}

# Accumulates signed orbit-camera azimuth rotation (degrees) since the first
# sample, unwrapping the +/-180 seam. The orbit auto-advances slowly relative
# to the diag poll cadence (~1 s), so per-poll steps stay well under 180 deg.
$script:OrbitSweepAccum = 0.0
$script:OrbitSweepPrevAz = $null
function Update-OrbitSweep {
    $az = Get-OrbitDiagAzimuthDeg
    if ($null -eq $az) { return }
    if ($null -ne $script:OrbitSweepPrevAz) {
        $delta = $az - $script:OrbitSweepPrevAz
        while ($delta -gt 180.0) { $delta -= 360.0 }
        while ($delta -le -180.0) { $delta += 360.0 }
        $script:OrbitSweepAccum += $delta
    }
    $script:OrbitSweepPrevAz = $az
}

function Wait-ForOrbitSweep {
    param([double]$TargetDeg, [int]$TimeoutSec = 90)
    $deadline = (Get-Date).AddSeconds($TimeoutSec)
    do {
        Update-OrbitSweep
        if ([math]::Abs($script:OrbitSweepAccum) -ge $TargetDeg) {
            return [math]::Abs($script:OrbitSweepAccum)
        }
        Start-Sleep -Milliseconds 700
    } while ((Get-Date) -lt $deadline)
    throw "Orbit camera swept only $([math]::Round([math]::Abs($script:OrbitSweepAccum), 1)) deg of the required $TargetDeg deg within ${TimeoutSec}s; replay playback may have ended early."
}

function Collect-Evidence {
    Save-AdbText (Join-Path $RunDir "public_ycs2_mod_debug.log") shell cat /sdcard/YCS2CommunityMod/logs/ycs2_mod_debug.log | Out-Null
    Save-AdbText (Join-Path $RunDir "public_ycs2_mod_native_crash.log") shell cat /sdcard/YCS2CommunityMod/logs/ycs2_mod_native_crash.log | Out-Null
    Save-AdbText (Join-Path $RunDir "debug-04e8a3.log") shell cat /sdcard/YCS2CommunityMod/logs/debug-04e8a3.log | Out-Null
    Copy-Item -LiteralPath (Join-Path $RunDir "debug-04e8a3.log") -Destination (Join-Path $Root "debug-04e8a3.log") -Force -ErrorAction SilentlyContinue
    Save-AdbText (Join-Path $RunDir "debug-cf277a.log") shell cat /sdcard/YCS2CommunityMod/logs/debug-cf277a.log | Out-Null
    Copy-Item -LiteralPath (Join-Path $RunDir "debug-cf277a.log") -Destination (Join-Path $Root "debug-cf277a.log") -Force -ErrorAction SilentlyContinue
    Save-AdbText (Join-Path $RunDir "logcat.txt") logcat -d -t 5000 | Out-Null
    Dump-WindowXml | Set-Content -LiteralPath (Join-Path $RunDir "window.xml") -Encoding UTF8
}

function Assert-FreecamEvidence {
    $debug = Get-Content -LiteralPath (Join-Path $RunDir "public_ycs2_mod_debug.log") -Raw -ErrorAction SilentlyContinue
    $window = Get-Content -LiteralPath (Join-Path $RunDir "window.xml") -Raw -ErrorAction SilentlyContinue
    $native = Get-Content -LiteralPath (Join-Path $RunDir "public_ycs2_mod_native_crash.log") -Raw -ErrorAction SilentlyContinue
    $logcat = Get-Content -LiteralPath (Join-Path $RunDir "logcat.txt") -Raw -ErrorAction SilentlyContinue

    $requiredEvidence = @(
        "gesture layer installed",
        "gesture_layer touchable=true",
        "orbit_diag"
    )
    if (-not $UsePassiveReplay) {
        $requiredEvidence += @(
            "gesture=pan",
            "gesture=pinch_rotate",
            "gesture=car_drag"
        )
    }
    foreach ($required in $requiredEvidence) {
        if ($debug -notmatch [regex]::Escape($required)) {
            throw "Missing freecam runtime evidence '$required'. See $RunDir\public_ycs2_mod_debug.log"
        }
    }
    if (-not $UsePassiveReplay) {
        if ($debug -notmatch "gesture=pan[^\n]+r=[1-9]|gesture=pan[^\n]+u=[1-9]") {
            throw "Two-finger drag did not produce the expected pan evidence. See $RunDir\public_ycs2_mod_debug.log"
        }
        if ($debug -notmatch "gesture=pinch_rotate[^\n]+f=[1-9]") {
            throw "Two-finger pinch did not produce positive forward dolly evidence. See $RunDir\public_ycs2_mod_debug.log"
        }
        if ($debug -notmatch "gesture=pinch_rotate[^\n]+y=-|gesture=pinch_rotate[^\n]+y=[1-9]") {
            throw "Two-finger rotate did not produce yaw evidence. See $RunDir\public_ycs2_mod_debug.log"
        }
        if ($debug -notmatch "gesture=car_drag[^\n]+cr=[1-9]" -or $debug -notmatch "gesture=car_drag[^\n]+cu=-") {
            throw "Three-finger car-centric drag did not produce expected car-axis evidence. See $RunDir\public_ycs2_mod_debug.log"
        }
    }
    $orbitLines = $debug -split "`n" | Where-Object { $_ -match "orbit_diag" }
    if ($orbitLines.Count -lt 2) {
        throw "Orbit diagnostics did not produce repeated runtime samples. See $RunDir\public_ycs2_mod_debug.log"
    }
    $lastOrbit = $orbitLines[-1]
    $orbitMatch = [regex]::Match($lastOrbit, "radius1000=(-?\d+).*inwardDot1000=(-?\d+).*orbitChord1000=(-?\d+)")
    if (-not $orbitMatch.Success) {
        throw "Orbit diagnostics are missing radius/inward/chord values. See $RunDir\public_ycs2_mod_debug.log"
    }
    $radius1000 = [int]$orbitMatch.Groups[1].Value
    $inwardDot1000 = [int]$orbitMatch.Groups[2].Value
    $orbitChord1000 = [int]$orbitMatch.Groups[3].Value
    if ($radius1000 -lt 2000) {
        throw "Orbit camera radius is too small; camera may still be rotating in place. radius1000=$radius1000"
    }
    if ($inwardDot1000 -lt 900) {
        throw "Orbit camera is not facing inward at the car. inwardDot1000=$inwardDot1000"
    }
    $minOrbitChord1000 = if ($UsePassiveReplay) { 1500 } else { 5000 }
    if ($orbitChord1000 -lt $minOrbitChord1000) {
        throw "Orbit camera did not accumulate enough motion around the car. orbitChord1000=$orbitChord1000 threshold=$minOrbitChord1000"
    }
    if ($debug -match "gesture layer poll failed|UNCAUGHT|Could not install replay free camera") {
        throw "Debug log contains freecam failure evidence. See $RunDir\public_ycs2_mod_debug.log"
    }
    if ($window -match "FREE CAM|Lock|Reset|FWD|LOOK") {
        throw "Window hierarchy still exposes visible freecam button/dialog controls. See $RunDir\window.xml"
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
}


# ============================================================================
# Combined UI-responsiveness + swarm runtime validation.
# Stages: launcher sweep -> initial native menu probe -> passive replay
# (gesture gating + catalog) -> second replay -> swarm auto-apply proof ->
# full race -> post-race menu responsiveness probe.
# ============================================================================

$Failures = New-Object System.Collections.Generic.List[string]

function Step {
    param([string]$Name, [scriptblock]$Body)
    Write-Host "===== STAGE: $Name"
    try {
        & $Body
        Write-Host "PASS: $Name"
    } catch {
        $Failures.Add("$Name :: $($_.Exception.Message)")
        Write-Host "FAIL: $Name :: $($_.Exception.Message)"
        try {
            Save-Screenshot ("fail-" + ($Name -replace "[^a-zA-Z0-9-]", "_") + ".png")
        } catch {}
    }
}

function Get-DebugLog {
    Read-AdbText shell cat /sdcard/YCS2CommunityMod/logs/ycs2_mod_debug.log
}

function Count-LogMatches {
    param([string]$Pattern)
    return ([regex]::Matches((Get-DebugLog), $Pattern)).Count
}

function Wait-ForLogCountAbove {
    param([string]$Pattern, [int]$Baseline, [int]$Seconds = 30)
    $deadline = (Get-Date).AddSeconds($Seconds)
    do {
        if ((Count-LogMatches $Pattern) -gt $Baseline) { return }
        Start-Sleep -Milliseconds 700
    } while ((Get-Date) -lt $deadline)
    throw "log pattern '$Pattern' did not recur above baseline $Baseline in ${Seconds}s"
}

function Assert-NativeTapResponsive {
    param([int]$X, [int]$Y, [string]$Context, [int]$SettleSeconds = 4)
    $before = Get-ScreenText ("before-" + $Context)
    Tap-Input $X $Y
    Start-Sleep -Seconds $SettleSeconds
    Submit-PlayerNamePromptIfPresent | Out-Null
    Dismiss-LoginOverlayIfPresent | Out-Null
    $after = Get-ScreenText ("after-" + $Context)
    if (($before -eq $after) -and ($before.Trim().Length -gt 0)) {
        throw "screen did not change after tapping ($X,$Y) [$Context] - possible blocked UI"
    }
    Write-Host "responsive: $Context"
}

function Invoke-NavTap {
    # Navigation tap that survives the TrueAxis login screen re-appearing:
    # if the login ate the tap, dismiss it and tap again.
    param([int]$X, [int]$Y, [int]$SettleSeconds = 4)
    for ($i = 0; $i -lt 3; $i++) {
        Tap-Input $X $Y
        Start-Sleep -Seconds $SettleSeconds
        Submit-PlayerNamePromptIfPresent | Out-Null
        if (-not (Dismiss-LoginOverlayIfPresent)) { return }
    }
}

function Exit-ReplayPlayback {
    Invoke-Adb shell input keyevent 4
    Start-Sleep -Seconds 3
    Dismiss-LoginOverlayIfPresent | Out-Null
}

function Ensure-GameResumed {
    $state = Read-AdbText shell dumpsys activity activities
    if ($state -notmatch "Jetcarstunts2Activity") {
        Start-GameActivity
        Start-Sleep -Seconds 5
    }
    Set-LandscapeNeutralSensors
}

function Open-SecondLevelPassiveReplay {
    # Twist and Turn: second stock level in the list (same flow the dedicated
    # swarm harness used).
    Ensure-GameResumed
    Tap-Input 190 96
    Start-Sleep -Seconds 4
    Dismiss-LoginOverlayIfPresent | Out-Null
    Tap-Input 115 130
    Start-Sleep -Seconds 8
    Dismiss-LoginOverlayIfPresent | Out-Null
    Save-Screenshot "20-second-level-detail.png"
    Tap-Input 217 298
    Start-Sleep -Seconds 10
    Save-Screenshot "21-second-level-replay.png"
}

# ---------------------------------------------------------------------------
if (-not $SkipInstall) {
    Write-Host "Installing $ApkPath"
    Invoke-Adb install -r -t --no-incremental $ApkPath | Out-Null
}
if ($ClearAppDataBeforeRun) {
    Invoke-Adb shell pm clear $Package | Out-Null
}
# pm clear resets runtime permissions; grant storage up-front so the public
# debug log (the harness's evidence channel) works from the very first launch.
Grant-StoragePermissions
Invoke-Adb shell am force-stop $Package
Invoke-Adb shell am force-stop com.android.chrome
Invoke-Adb shell rm -f /sdcard/YCS2CommunityMod/logs/ycs2_mod_debug.log /sdcard/YCS2CommunityMod/logs/ycs2_mod_native_crash.log
Invoke-Adb logcat -c
Prepare-EmulatorDisplay

Write-Host "Launching launcher with swarm automation extras"
Invoke-Adb shell am start -n "${Package}/${LauncherActivity}" --ez automation_enable_replay_swarm true --ez automation_swarm_autoapply true --ez automation_enable_race_swarm true | Out-Null

Step "automation extras honoured" {
    Wait-ForLog "automation replay_swarm=true" 45 | Out-Null
    Wait-ForLog "automation swarm_autoapply=true" 15 | Out-Null
}

Step "launcher UI sweep" {
    $xml = Wait-ForWindowText "Start game" 60
    $xml | Set-Content -LiteralPath (Join-Path $RunDir "launcher-initial.xml") -Encoding UTF8
    Dismiss-PermissionDialogIfPresent | Out-Null
    # Toggle every checkbox twice (flip + restore) and verify state actually flips.
    $checkboxTexts = @(
        "Enable gesture free camera during replays",
        "Auto-cycle camera modes during a replay",
        "Enable replay swarm picker during passive replays",
        "Enable checkpoint/sector deltas vs saved replay ghost"
    )
    foreach ($text in $checkboxTexts) {
        $xml = Dump-WindowXml
        if ($xml -notlike "*$text*") { Write-Host "checkbox not visible (conditional): $text"; continue }
        $match = [regex]::Match($xml, "text=`"$([regex]::Escape($text))`"[^>]*checked=`"(true|false)`"")
        if (-not $match.Success) { throw "no checkable state for: $text" }
        $stateBefore = $match.Groups[1].Value
        Tap-WindowTextFromXml $text $xml
        Start-Sleep -Milliseconds 700
        $xml2 = Dump-WindowXml
        $match2 = [regex]::Match($xml2, "text=`"$([regex]::Escape($text))`"[^>]*checked=`"(true|false)`"")
        if (-not $match2.Success -or $match2.Groups[1].Value -eq $stateBefore) {
            throw "checkbox did not respond to tap: $text"
        }
        Tap-WindowTextFromXml $text $xml2
        Start-Sleep -Milliseconds 700
    }
    # Dialog buttons respond.
    $xml = Dump-WindowXml
    Tap-WindowTextFromXml "Custom liveries" $xml
    Start-Sleep -Seconds 2
    $xml = Dump-WindowXml
    if ($xml -notlike "*ivery*") { throw "Custom liveries dialog did not open" }
    Invoke-Adb shell input keyevent 4
    Start-Sleep -Seconds 1
    Wait-ForWindowText "Start game" 15 | Out-Null
    Save-Screenshot "10-launcher-sweep-done.png"
}

Step "re-assert swarm prefs after sweep" {
    Invoke-Adb shell am start -n "${Package}/${LauncherActivity}" --ez automation_enable_replay_swarm true --ez automation_swarm_autoapply true --ez automation_enable_race_swarm true | Out-Null
    Start-Sleep -Seconds 2
    Wait-ForWindowText "Start game" 30 | Out-Null
}

Step "start game" {
    $xml = Wait-ForWindowText "Start game" 15
    Tap-WindowTextFromXml "Start game" $xml
    Start-Sleep -Seconds 2
    Start-GameActivity
    Wait-ForGameActivity 30
    Start-Sleep -Seconds $GameStartupWaitSeconds
    Set-LandscapeNeutralSensors
    Assert-LandscapeGameSurface "11-game-start"
    Dismiss-StartupLoginOverlay
    Close-ExternalBrowserIfPresent | Out-Null
    Save-Screenshot "11-main-menu.png"
}

Step "initial native menu responsiveness" {
    Assert-NativeTapResponsive 190 96 "initial-play-button"
    Save-Screenshot "12-level-list.png"
}

Step "open Straight On passive replay" {
    Dismiss-StartupLoginOverlay
    Invoke-NavTap 115 84 6
    Save-Screenshot "13-straight-on-detail.png"
    $points = @(@(240, 302), @(217, 298), @(280, 302))
    $entered = $false
    for ($attempt = 0; $attempt -lt 20 -and -not $entered; $attempt++) {
        Submit-PlayerNamePromptIfPresent | Out-Null
        Dismiss-LoginOverlayIfPresent | Out-Null
        $ocr = Get-ScreenText "view-replay-probe"
        if ($ocr -notmatch "VIEW\s*REPLAY" -and -not (Test-ViewReplayButtonVisible)) {
            Start-Sleep -Seconds 3
            continue
        }
        $point = $points[$attempt % $points.Count]
        Tap-Input $point[0] $point[1]
        Start-Sleep -Seconds 4
        if (Dismiss-LoginOverlayIfPresent) { continue }
        if ((Get-DebugLog) -match "gesture_layer touchable=true") { $entered = $true }
    }
    if (-not $entered) { throw "View Replay playback did not start" }
    Save-Screenshot "14-straight-on-replay.png"
}

Step "gesture layer drops after leaving playback" {
    Wait-ForLog "gesture_layer touchable=true" 20 | Out-Null
    $baselineFalse = Count-LogMatches "gesture_layer touchable=false"
    Exit-ReplayPlayback
    Wait-ForLogCountAbove "gesture_layer touchable=false" ($baselineFalse - 1) 15
    Save-Screenshot "15-after-replay-exit.png"
}

Step "post-replay menu responsive (reopen View Replay)" {
    $baselineTrue = Count-LogMatches "gesture_layer touchable=true"
    Tap-Input 240 302
    Start-Sleep -Seconds 5
    Wait-ForLogCountAbove "gesture_layer touchable=true" ($baselineTrue - 1) 20
    Save-Screenshot "16-replay-reopened.png"
    Exit-ReplayPlayback
}

# NOTE: stock bundled View Replay content is asset-based and never passes
# through Replay::Load(const char*), so the in-viewer catalog cannot populate
# on a fresh profile. Multi-ghost coverage is validated end-to-end by the
# ghost-pack stage below (race -> auto-archive -> pack loads at level start),
# which is the actual user-facing feature.

Step "race Straight On" {
    Ensure-GameResumed
    Dismiss-StartupLoginOverlay
    Invoke-NavTap 190 96
    Invoke-NavTap 115 84
    Start-Sleep -Seconds 6
    Dismiss-LoginOverlayIfPresent | Out-Null
    Run-StraightOnRace
    # Proof the race actually armed (checkpoint splits log on race start).
    Wait-ForLog "split armed" 15 | Out-Null
    Start-Sleep -Seconds 8
    Save-Screenshot "30-post-race.png"
}

Step "post-race menus responsive" {
    Invoke-Adb shell input keyevent 4
    Start-Sleep -Seconds 3
    Save-Screenshot "31-post-race-back1.png"
    Invoke-Adb shell input keyevent 4
    Start-Sleep -Seconds 3
    Save-Screenshot "32-post-race-back2.png"
    Dismiss-LoginOverlayIfPresent | Out-Null
    $debug = Get-DebugLog
    if ($debug.Contains("gesture_layer touchable=true")) {
        if ($debug.LastIndexOf("gesture_layer touchable=false") -lt $debug.LastIndexOf("gesture_layer touchable=true")) {
            throw "gesture layer still touchable after leaving race/replay screens"
        }
    }
    Assert-NativeTapResponsive 190 96 "post-race-play-button"
    Save-Screenshot "33-post-race-menu-responsive.png"
}

Step "ghost pack loads at level start" {
    # The finished race archived a slot replay; relaunch with the pack-all
    # extra so the library becomes the ghost pack, then verify a viewer
    # session activates pack ghosts via the LoadLevel loader (the same path
    # races use).
    Invoke-Adb shell am force-stop $Package
    Start-Sleep -Seconds 2
    Invoke-Adb shell am start -n "${Package}/${LauncherActivity}" --ez automation_enable_replay_swarm true --ez automation_enable_race_swarm true --ez automation_ghost_pack_all true | Out-Null
    Wait-ForLog "automation ghost_pack entries=[1-9]" 45 | Out-Null
    $xml = Wait-ForWindowText "Start game" 60
    Tap-WindowTextFromXml "Start game" $xml
    Start-Sleep -Seconds 2
    Start-GameActivity
    Wait-ForGameActivity 30
    Start-Sleep -Seconds $GameStartupWaitSeconds
    Set-LandscapeNeutralSensors
    Submit-PlayerNamePromptIfPresent | Out-Null
    Dismiss-LoginOverlayIfPresent | Out-Null
    Wait-ForLog "ghost pack applied entries=[1-9]" 30 | Out-Null
    # The finished race must have produced at least one slot replay on disk.
    Wait-ForLog "slotReplays=[1-9]" 15 | Out-Null
    Dismiss-StartupLoginOverlay
    Invoke-NavTap 190 96
    Invoke-NavTap 115 84
    Start-Sleep -Seconds 8
    Dismiss-LoginOverlayIfPresent | Out-Null
    Tap-Input 240 302
    Start-Sleep -Seconds 8
    Wait-ForLog "overlay state=2 catalog=\d+ ghosts=[1-9]" 45 | Out-Null
    Save-Screenshot "40-ghost-pack-replay.png"
    Exit-ReplayPlayback
}

Step "no crash evidence" {
    $crash = Read-AdbText shell cat /sdcard/YCS2CommunityMod/logs/ycs2_mod_native_crash.log
    if ($crash -and $crash.Trim().Length -gt 0) { throw "native crash log is non-empty" }
    $debug = Get-DebugLog
    if ($debug -match "UNCAUGHT|overlay poll failed") { throw "java crash/overlay failure in debug log" }
}

# ---------------------------------------------------------------------------
Save-AdbText (Join-Path $RunDir "ycs2_mod_debug.log") shell cat /sdcard/YCS2CommunityMod/logs/ycs2_mod_debug.log | Out-Null
Save-AdbText (Join-Path $RunDir "logcat.txt") logcat -d | Out-Null

$summaryPath = Join-Path $RunDir "summary.txt"
if ($Failures.Count -gt 0) {
    ("runtime_ui_swarm=failed`n" + ($Failures -join "`n")) | Set-Content -LiteralPath $summaryPath -Encoding UTF8
    Write-Host "RUN FAILED:"
    $Failures | ForEach-Object { Write-Host "  - $_" }
    exit 1
}
"runtime_ui_swarm=passed" | Set-Content -LiteralPath $summaryPath -Encoding UTF8
Write-Host "Runtime UI + swarm validation passed. Artifacts: $RunDir"
exit 0




