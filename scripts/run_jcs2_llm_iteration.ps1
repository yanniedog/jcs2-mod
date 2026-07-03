param(
    [string]$ApkPath = "jcs2-mod.apk",
    [ValidateSet("Smoke", "StraightOn", "FreecamGestures", "ReplaySwarm")]
    [string]$Mode = "Smoke",
    [ValidateSet("EveryStep")]
    [string]$Screenshots = "EveryStep",
    [ValidateSet("Required", "Optional")]
    [string]$TextValidation = "Required",
    [string]$Package = "modded.ycs2",
    [string]$LauncherActivity = "com.trueaxis.modmenu.ModLauncherActivity",
    [ValidateSet("DirectGame", "LauncherThenGame")]
    [string]$SmokeLaunchStrategy = "DirectGame",
    [string]$AvdName = "jcs2-llm-runtime",
    [int]$ConsolePort = 5562,
    [int]$AdbPort = 5563,
    [ValidateSet("swiftshader_indirect", "host", "auto")]
    [string]$Gpu = "swiftshader_indirect",
    [string]$Adb = "",
    [string]$Emulator = "",
    [string]$TesseractExe = "",
    [string]$OutDir = "_apk_build\llm-runtime",
    [int]$SmokeCycles = 1,
    [int]$SmokeGameHoldSeconds = 20,
    [int]$ChildTimeoutSeconds = 600,
    [ValidateRange(1, 2)]
    [int]$MaxAttempts = 2,
    [switch]$SkipDelegatedHarness,
    [switch]$Headless
)

$ErrorActionPreference = "Stop"
$Root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
Set-Location $Root
. (Join-Path $Root "scripts\lib\Jcs2Emu.ps1")

if (-not (Test-Path -LiteralPath $ApkPath)) { throw "APK not found: $ApkPath" }

$RunDir = Join-Path $OutDir (Get-Date -Format "yyyyMMdd-HHmmss")
$StepsDir = Join-Path $RunDir "steps"
$ChildDir = Join-Path $RunDir "child"
New-Item -ItemType Directory -Force -Path $RunDir, $StepsDir, $ChildDir | Out-Null

$EventsPath = Join-Path $RunDir "run.jsonl"
$StepResults = New-Object System.Collections.Generic.List[object]
$AllTextJson = New-Object System.Collections.Generic.List[string]

function Write-RunEvent {
    param([string]$Type, [hashtable]$Data = @{})
    $event = [ordered]@{
        ts = (Get-Date).ToString("o")
        type = $Type
    }
    foreach ($key in $Data.Keys) { $event[$key] = $Data[$key] }
    ($event | ConvertTo-Json -Compress -Depth 8) | Add-Content -LiteralPath $EventsPath -Encoding UTF8
}

function ConvertTo-SafeLabel {
    param([string]$Value)
    $safe = $Value -replace "[^A-Za-z0-9._-]+", "-"
    return $safe.Trim("-")
}

function Invoke-TextExtract {
    param(
        [Parameter(Mandatory = $true)][string]$Screenshot,
        [string]$Xml = "",
        [Parameter(Mandatory = $true)][string]$OutJson,
        [Parameter(Mandatory = $true)][string]$OutOcr,
        [Parameter(Mandatory = $true)][string]$OutOverlay,
        [string[]]$RequireText = @(),
        [switch]$Required
    )
    $args = @(
        (Join-Path $Root "scripts\extract_jcs2_runtime_text.py"),
        "extract",
        "--screenshot", $Screenshot,
        "--out-json", $OutJson,
        "--out-ocr", $OutOcr,
        "--out-overlay", $OutOverlay,
        "--tesseract", $script:TesseractPath,
        "--expect-width", "480",
        "--expect-height", "320"
    )
    if ($Xml -and (Test-Path -LiteralPath $Xml)) { $args += @("--xml", $Xml) }
    if ($Required) { $args += "--required" }
    foreach ($text in $RequireText) { $args += @("--require-text", $text) }
    $output = & python @args 2>&1
    $exit = $LASTEXITCODE
    if ($exit -ne 0 -and $exit -ne 2) {
        throw "Text extraction failed for $Screenshot`n$($output -join "`n")"
    }
    [void]$AllTextJson.Add($OutJson)
    return Get-Content -LiteralPath $OutJson -Raw | ConvertFrom-Json
}

function Capture-Step {
    param(
        [int]$Index,
        [string]$Label,
        [string[]]$RequireText = @(),
        [switch]$RequiredText
    )
    $safe = "{0:D2}-{1}" -f $Index, (ConvertTo-SafeLabel $Label)
    $png = Join-Path $StepsDir "$safe.png"
    $xml = Join-Path $StepsDir "$safe.window.xml"
    $json = Join-Path $StepsDir "$safe.text.json"
    $ocr = Join-Path $StepsDir "$safe.ocr.txt"
    $overlay = Join-Path $StepsDir "$safe.overlay.png"
    Save-Jcs2Screenshot -Adb $script:AdbPath -Serial $script:Serial -Path $png | Out-Null
    Save-Jcs2WindowXml -Adb $script:AdbPath -Serial $script:Serial -Path $xml | Out-Null
    $strict = ($TextValidation -eq "Required") -or $RequiredText
    $result = Invoke-TextExtract -Screenshot $png -Xml $xml -OutJson $json -OutOcr $ocr -OutOverlay $overlay -RequireText $RequireText -Required:$strict
    $step = [pscustomobject]@{
        index = $Index
        label = $Label
        screenshot = $png
        xml = $xml
        text_json = $json
        ocr = $ocr
        overlay = $overlay
        text_status = $result.text_status
        issues = $result.issues
    }
    [void]$StepResults.Add($step)
    Write-RunEvent "capture" @{ label = $Label; text_status = $result.text_status; screenshot = $png }
    return $step
}

function Restart-DedicatedEmulator {
    Write-RunEvent "emulator_restart" @{ serial = $script:Serial }
    try { & $script:AdbPath -s $script:Serial emu kill 1>$null 2>$null } catch {}
    Start-Sleep -Seconds 8
    Start-Jcs2Emulator -AvdName $AvdName -Emulator $script:EmulatorPath -ConsolePort $ConsolePort -AdbPort $AdbPort -Gpu $Gpu -Headless:$Headless | Out-Null
    Wait-Jcs2DeviceBoot -Adb $script:AdbPath -Serial $script:Serial -Seconds 300
    Set-Jcs2RuntimeDisplay -Adb $script:AdbPath -Serial $script:Serial
    Set-Jcs2StraightSensors -Adb $script:AdbPath -Serial $script:Serial
}

function Ensure-DedicatedEmulator {
    New-Jcs2AvdConfig -AvdName $AvdName | Out-Null
    $devices = & $script:AdbPath devices 2>$null
    if (($devices -join "`n") -notmatch [regex]::Escape($script:Serial)) {
        Start-Jcs2Emulator -AvdName $AvdName -Emulator $script:EmulatorPath -ConsolePort $ConsolePort -AdbPort $AdbPort -Gpu $Gpu -Headless:$Headless | Out-Null
    }
    Wait-Jcs2DeviceBoot -Adb $script:AdbPath -Serial $script:Serial -Seconds 300
    Set-Jcs2RuntimeDisplay -Adb $script:AdbPath -Serial $script:Serial
    Set-Jcs2StraightSensors -Adb $script:AdbPath -Serial $script:Serial
}

function Invoke-ChildHarness {
    param([string]$ScriptPath, [object[]]$Arguments)
    $oldSerial = $env:ANDROID_SERIAL
    $env:ANDROID_SERIAL = $script:Serial
    try {
        Write-RunEvent "child_start" @{ script = $ScriptPath; args = ($Arguments -join " ") }
        $childName = [System.IO.Path]::GetFileNameWithoutExtension($ScriptPath)
        $stdoutPath = Join-Path $RunDir "$childName.stdout.txt"
        $stderrPath = Join-Path $RunDir "$childName.stderr.txt"
        $powershellExe = (Get-Command powershell.exe).Source
        $argumentList = @("-NoProfile", "-ExecutionPolicy", "Bypass", "-File", $ScriptPath) + $Arguments
        $result = Invoke-Jcs2Process -FilePath $powershellExe -ArgumentList $argumentList -TimeoutSeconds $ChildTimeoutSeconds -WorkingDirectory $Root
        Set-Content -LiteralPath $stdoutPath -Value $result.Stdout -Encoding UTF8
        Set-Content -LiteralPath $stderrPath -Value $result.Stderr -Encoding UTF8
        if ($result.ExitCode -ne 0) {
            throw "$ScriptPath failed with exit code $($result.ExitCode). See $stdoutPath and $stderrPath"
        }
        Write-RunEvent "child_done" @{ script = $ScriptPath }
    } finally {
        $env:ANDROID_SERIAL = $oldSerial
    }
}

function Invoke-SmokeMode {
    if (-not $script:ApkInstalled) {
        Install-Jcs2Apk -Adb $script:AdbPath -Serial $script:Serial -ApkPath $ApkPath -Package $Package | Set-Content -LiteralPath (Join-Path $RunDir "install.txt") -Encoding UTF8
        $script:ApkInstalled = $true
    }
    Reset-Jcs2RuntimeApp -Adb $script:AdbPath -Serial $script:Serial -Package $Package
    Dismiss-Jcs2SystemDialogs -Adb $script:AdbPath -Serial $script:Serial -Passes 5 | Out-Null
    Capture-Step -Index 0 -Label "after-clean-reset" | Out-Null
    if ($SmokeLaunchStrategy -eq "LauncherThenGame") {
        Invoke-Jcs2Adb -Adb $script:AdbPath -Serial $script:Serial shell am start -n "${Package}/${LauncherActivity}" | Out-Null
        $xml = Wait-ForLauncherStartGame
        Capture-Step -Index 1 -Label "launcher-start-game" -RequireText @("Start game") -RequiredText | Out-Null
        Invoke-Jcs2TapWindowText -Adb $script:AdbPath -Serial $script:Serial -Text "Start game" -Xml $xml
        Start-Sleep -Seconds 4
        $focus = Read-Jcs2AdbText -Adb $script:AdbPath -Serial $script:Serial shell dumpsys window
        if ($focus -notlike "*Jetcarstunts2Activity*") {
            Write-RunEvent "start_game_fallback" @{ reason = "tap did not focus game activity" }
            Start-Jcs2SmokeGameActivity
        }
    } else {
        Start-Jcs2SmokeGameActivity
    }
    Dismiss-Jcs2SystemDialogs -Adb $script:AdbPath -Serial $script:Serial -Passes 6 | Out-Null
    Capture-Step -Index 2 -Label "game-activity-started" | Out-Null
    Start-Sleep -Seconds $SmokeGameHoldSeconds
    Save-Jcs2RuntimeLogs -Adb $script:AdbPath -Serial $script:Serial -OutDir $RunDir
    Capture-Step -Index 3 -Label "after-game-hold" | Out-Null
    Assert-Jcs2NoCrashEvidence -RunDir $RunDir -Package $Package

    if (-not $SkipDelegatedHarness) {
        $childOut = Join-Path $ChildDir "runtime-smoke"
        Invoke-ChildHarness -ScriptPath (Join-Path $Root "scripts\runtime_smoke_test.ps1") -Arguments @(
            "-ApkPath", $ApkPath,
            "-Package", $Package,
            "-LauncherActivity", $LauncherActivity,
            "-Cycles", "$SmokeCycles",
            "-GameHoldSeconds", "$SmokeGameHoldSeconds",
            "-Adb", $script:AdbPath,
            "-OutDir", $childOut
        )
    }
}

function Start-Jcs2SmokeGameActivity {
    Write-RunEvent "game_direct_start" @{ activity = "com.trueaxis.jetcarstunts2.Jetcarstunts2Activity" }
    Invoke-Jcs2AdbBounded -Adb $script:AdbPath -Serial $script:Serial -TimeoutSeconds 30 logcat -c | Out-Null
    Invoke-Jcs2AdbBounded -Adb $script:AdbPath -Serial $script:Serial -TimeoutSeconds 45 shell am start -n "${Package}/com.trueaxis.jetcarstunts2.Jetcarstunts2Activity" | Out-Null
    $focus = Wait-Jcs2FocusedActivity -Adb $script:AdbPath -Serial $script:Serial -ActivityFragment "Jetcarstunts2Activity" -Seconds 45
    $focus | Set-Content -LiteralPath (Join-Path $RunDir "game-focus.txt") -Encoding UTF8
    Dismiss-Jcs2SystemDialogs -Adb $script:AdbPath -Serial $script:Serial -Passes 8 | Out-Null
}

function Wait-ForLauncherStartGame {
    $deadline = (Get-Date).AddSeconds(60)
    do {
        Dismiss-Jcs2SystemDialogs -Adb $script:AdbPath -Serial $script:Serial -Passes 2 | Out-Null
        try { & $script:AdbPath -s $script:Serial shell uiautomator dump /sdcard/window.xml 1>$null 2>$null } catch {}
        $xml = Read-Jcs2AdbText -Adb $script:AdbPath -Serial $script:Serial shell cat /sdcard/window.xml
        if ($xml -like "*Start game*") { return $xml }
        Start-Sleep -Seconds 1
    } while ((Get-Date) -lt $deadline)
    throw "Timed out waiting for window text: Start game"
}

function Invoke-DelegatedMode {
    if ($Mode -eq "StraightOn") {
        $childOut = Join-Path $ChildDir "runtime-straight-splits"
        Invoke-ChildHarness -ScriptPath (Join-Path $Root "scripts\runtime_straight_level_split_test.ps1") -Arguments @(
            "-ApkPath", $ApkPath,
            "-Package", $Package,
            "-LauncherActivity", $LauncherActivity,
            "-ClearAppDataBeforeRun", "true",
            "-EnableAccelerateWithJet", "false",
            "-Adb", $script:AdbPath,
            "-OutDir", $childOut
        )
    } elseif ($Mode -eq "FreecamGestures") {
        $childOut = Join-Path $ChildDir "runtime-freecam-gestures"
        Invoke-ChildHarness -ScriptPath (Join-Path $Root "scripts\runtime_replay_freecam_gesture_test.ps1") -Arguments @(
            "-ApkPath", $ApkPath,
            "-Package", $Package,
            "-LauncherActivity", $LauncherActivity,
            "-ClearAppDataBeforeRun", "true",
            "-EnableAccelerateWithJet", "false",
            "-Adb", $script:AdbPath,
            "-OutDir", $childOut
        )
    } elseif ($Mode -eq "ReplaySwarm") {
        $childOut = Join-Path $ChildDir "runtime-replay-swarm"
        Invoke-ChildHarness -ScriptPath (Join-Path $Root "scripts\runtime_replay_swarm_test.ps1") -Arguments @(
            "-ApkPath", $ApkPath,
            "-Package", $Package,
            "-LauncherActivity", $LauncherActivity,
            "-ClearAppDataBeforeRun", "true",
            "-Adb", $script:AdbPath,
            "-OutDir", $childOut
        )
    } else {
        throw "Unsupported delegated mode: $Mode"
    }
}

function Process-ExistingArtifacts {
    $pngs = Get-ChildItem -LiteralPath $RunDir -Recurse -Filter *.png |
        Where-Object { $_.Name -notmatch "\.overlay\.png$|contact-sheet\.png$" } |
        Sort-Object FullName
    $counter = 1000
    foreach ($png in $pngs) {
        $json = [System.IO.Path]::ChangeExtension($png.FullName, ".text.json")
        if (Test-Path -LiteralPath $json) { continue }
        $base = [System.IO.Path]::GetFileNameWithoutExtension($png.Name)
        $xml = Join-Path $png.DirectoryName "$base.window.xml"
        if (-not (Test-Path -LiteralPath $xml)) { $xml = "" }
        $ocr = Join-Path $png.DirectoryName "$base.ocr.txt"
        $overlay = Join-Path $png.DirectoryName "$base.overlay.png"
        try {
            $result = Invoke-TextExtract -Screenshot $png.FullName -Xml $xml -OutJson $json -OutOcr $ocr -OutOverlay $overlay -Required:($TextValidation -eq "Required" -and $xml)
            [void]$StepResults.Add([pscustomobject]@{
                index = $counter
                label = $png.BaseName
                screenshot = $png.FullName
                xml = $xml
                text_json = $json
                ocr = $ocr
                overlay = $overlay
                text_status = $result.text_status
                issues = $result.issues
            })
            $counter += 1
        } catch {
            Write-RunEvent "artifact_extract_failed" @{ screenshot = $png.FullName; error = $_.Exception.Message }
        }
    }
}

function Write-ContactSheet {
    $screenshots = Get-ChildItem -LiteralPath $RunDir -Recurse -Filter *.png |
        Where-Object { $_.Name -notmatch "\.overlay\.png$|contact-sheet\.png$" } |
        Sort-Object FullName |
        Select-Object -ExpandProperty FullName
    if ($screenshots.Count -gt 0) {
        $listPath = Join-Path $RunDir "contact-sheet-inputs.txt"
        $screenshots | Set-Content -LiteralPath $listPath -Encoding UTF8
        & python (Join-Path $Root "scripts\extract_jcs2_runtime_text.py") contact-sheet --output (Join-Path $RunDir "contact-sheet.png") --list-file $listPath | Out-Null
    }
}

function Write-AuditHtml {
    $jsons = Get-ChildItem -LiteralPath $RunDir -Recurse -Filter *.text.json |
        Sort-Object FullName |
        Select-Object -ExpandProperty FullName
    if ($jsons.Count -gt 0) {
        $listPath = Join-Path $RunDir "audit-json-inputs.txt"
        $jsons | Set-Content -LiteralPath $listPath -Encoding UTF8
        & python (Join-Path $Root "scripts\extract_jcs2_runtime_text.py") audit-html --output (Join-Path $RunDir "text-visual-audit.html") --base-dir $RunDir --list-file $listPath | Out-Null
    }
}

function Write-TranscriptAndSummary {
    $jsons = Get-ChildItem -LiteralPath $RunDir -Recurse -Filter *.text.json | Sort-Object FullName
    $lines = New-Object System.Collections.Generic.List[string]
    [void]$lines.Add("# JCS2 LLM Runtime Transcript")
    [void]$lines.Add("")
    [void]$lines.Add("Mode: $Mode")
    [void]$lines.Add("Run: $RunDir")
    [void]$lines.Add("")
    $failed = New-Object System.Collections.Generic.List[object]
    foreach ($jsonFile in $jsons) {
        $data = Get-Content -LiteralPath $jsonFile.FullName -Raw | ConvertFrom-Json
        [void]$lines.Add("## $($jsonFile.BaseName)")
        [void]$lines.Add("")
        [void]$lines.Add("Status: $($data.text_status)")
        if ($data.verified_text.Count -gt 0) {
            [void]$lines.Add("")
            [void]$lines.Add("Verified text:")
            foreach ($text in $data.verified_text) { [void]$lines.Add("- $text") }
        }
        if ($data.partial_text.Count -gt 0) {
            [void]$lines.Add("")
            [void]$lines.Add("Partial/unverified text:")
            foreach ($text in $data.partial_text) { [void]$lines.Add("- [partial] $text") }
        }
        if ($data.ocr_text.Count -gt 0) {
            [void]$lines.Add("")
            [void]$lines.Add("OCR-only text:")
            foreach ($text in $data.ocr_text) { [void]$lines.Add("- [ocr] $text") }
        }
        if ($data.issues.Count -gt 0) {
            [void]$lines.Add("")
            [void]$lines.Add("Issues:")
            foreach ($issue in $data.issues) { [void]$lines.Add("- $issue") }
        }
        [void]$lines.Add("")
        if ($data.text_status -eq "failed") { [void]$failed.Add($data) }
    }
    $lines | Set-Content -LiteralPath (Join-Path $RunDir "transcript.md") -Encoding UTF8

    $apk = Get-Jcs2ApkMetadata -ApkPath $ApkPath
    $summary = [pscustomobject]@{
        mode = $Mode
        run_dir = (Resolve-Path -LiteralPath $RunDir).Path
        apk = $apk
        serial = $script:Serial
        avd = $AvdName
        smoke_launch_strategy = if ($Mode -eq "Smoke") { $SmokeLaunchStrategy } else { $null }
        text_validation = $TextValidation
        text_json_count = $jsons.Count
        failed_text_steps = $failed.Count
        runtime_error = $script:RuntimeErrorMessage
        status = if ($failed.Count -eq 0 -and -not $script:RuntimeErrorMessage) { "passed" } else { "failed" }
        contact_sheet = (Join-Path $RunDir "contact-sheet.png")
        audit_html = (Join-Path $RunDir "text-visual-audit.html")
        transcript = (Join-Path $RunDir "transcript.md")
    }
    $summary | ConvertTo-Json -Depth 8 | Set-Content -LiteralPath (Join-Path $RunDir "summary.json") -Encoding UTF8
    $summary | ConvertTo-Json -Depth 8
    if ($script:RuntimeErrorMessage) {
        throw $script:RuntimeErrorMessage
    }
    if ($TextValidation -eq "Required" -and $failed.Count -gt 0) {
        throw "Text/visual validation failed for $($failed.Count) step(s). See $RunDir\text-visual-audit.html"
    }
}

$script:AdbPath = Get-Jcs2Adb $Adb
$script:EmulatorPath = Get-Jcs2Emulator $Emulator
$script:Serial = "emulator-$ConsolePort"
$script:ApkInstalled = $false
$script:RuntimeErrorMessage = $null

Write-RunEvent "preflight_start" @{ mode = $Mode; apk = $ApkPath }
$preflight = Test-Jcs2RuntimePreflight -Adb $script:AdbPath -Emulator $script:EmulatorPath -TesseractExe $TesseractExe
$script:TesseractPath = $preflight.Tesseract
$selfTest = & python (Join-Path $Root "scripts\extract_jcs2_runtime_text.py") self-test --tesseract $script:TesseractPath 2>&1
if ($LASTEXITCODE -ne 0) { throw "OCR self-test failed:`n$($selfTest -join "`n")" }
Write-RunEvent "preflight_done" @{ tesseract = $script:TesseractPath; serial = $script:Serial }

$attempt = 0
$maxAttempts = $MaxAttempts
$lastError = $null
while ($attempt -lt $maxAttempts) {
    $attempt += 1
    try {
        Write-RunEvent "attempt_start" @{ attempt = $attempt }
        Ensure-DedicatedEmulator
        if ($Mode -eq "Smoke") {
            Invoke-SmokeMode
        } else {
            Set-Jcs2StraightSensors -Adb $script:AdbPath -Serial $script:Serial
            Invoke-DelegatedMode
        }
        Write-RunEvent "attempt_done" @{ attempt = $attempt }
        $lastError = $null
        break
    } catch {
        $lastError = $_
        Write-RunEvent "attempt_failed" @{ attempt = $attempt; error = $_.Exception.Message }
        try {
            Save-Jcs2RuntimeLogs -Adb $script:AdbPath -Serial $script:Serial -OutDir (Join-Path $RunDir "failure-attempt-$attempt")
            Save-Jcs2Screenshot -Adb $script:AdbPath -Serial $script:Serial -Path (Join-Path $RunDir ("failure-attempt-{0}.png" -f $attempt)) | Out-Null
        } catch {}
        if ($attempt -lt $maxAttempts) { Restart-DedicatedEmulator }
    }
}
if ($lastError) { $script:RuntimeErrorMessage = $lastError.Exception.Message }

Process-ExistingArtifacts
Write-ContactSheet
Write-AuditHtml
Write-TranscriptAndSummary
