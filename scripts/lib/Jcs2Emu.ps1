$ErrorActionPreference = "Stop"

function Get-Jcs2RepoRoot {
    if ($script:Jcs2RepoRoot) { return $script:Jcs2RepoRoot }
    $here = $PSScriptRoot
    if (-not $here) {
        $here = Split-Path -Parent $MyInvocation.MyCommand.Path
    }
    $script:Jcs2RepoRoot = Split-Path -Parent (Split-Path -Parent $here)
    return $script:Jcs2RepoRoot
}

function Get-Jcs2SdkRoot {
    if ($env:ANDROID_HOME) { return $env:ANDROID_HOME }
    if ($env:ANDROID_SDK_ROOT) { return $env:ANDROID_SDK_ROOT }
    return (Join-Path $env:LOCALAPPDATA "Android\Sdk")
}

function Get-Jcs2Adb {
    param([string]$Adb)
    if ($Adb) { return $Adb }
    return (Join-Path (Get-Jcs2SdkRoot) "platform-tools\adb.exe")
}

function Get-Jcs2Emulator {
    param([string]$Emulator)
    if ($Emulator) { return $Emulator }
    return (Join-Path (Get-Jcs2SdkRoot) "emulator\emulator.exe")
}

function Get-Jcs2AvdHome {
    return (Join-Path $env:USERPROFILE ".android\avd")
}

function Get-Jcs2AvdDir {
    param([string]$AvdName)
    return (Join-Path (Get-Jcs2AvdHome) "$AvdName.avd")
}

function Get-Jcs2AvdIni {
    param([string]$AvdName)
    return (Join-Path (Get-Jcs2AvdHome) "$AvdName.ini")
}

function Resolve-Jcs2Tesseract {
    param([string]$TesseractExe)
    $candidates = New-Object System.Collections.Generic.List[string]
    if ($TesseractExe) { [void]$candidates.Add($TesseractExe) }
    if ($env:TESSERACT_EXE) { [void]$candidates.Add($env:TESSERACT_EXE) }
    $pathCommand = Get-Command tesseract.exe -ErrorAction SilentlyContinue
    if ($pathCommand) { [void]$candidates.Add($pathCommand.Source) }
    [void]$candidates.Add("C:\Program Files\Tesseract-OCR\tesseract.exe")

    foreach ($candidate in $candidates) {
        if ($candidate -and (Test-Path -LiteralPath $candidate)) {
            return (Resolve-Path -LiteralPath $candidate).Path
        }
    }
    throw "Tesseract OCR was not found. Pass -TesseractExe, set TESSERACT_EXE, add tesseract.exe to PATH, or install it at C:\Program Files\Tesseract-OCR\tesseract.exe."
}

function Invoke-Jcs2Process {
    param(
        [Parameter(Mandatory = $true)][string]$FilePath,
        [string[]]$ArgumentList = @(),
        [int]$TimeoutSeconds = 30,
        [string]$WorkingDirectory = (Get-Jcs2RepoRoot)
    )
    if (-not (Test-Path -LiteralPath $FilePath)) {
        throw "Executable not found: $FilePath"
    }

    $tmpBase = Join-Path ([System.IO.Path]::GetTempPath()) ("jcs2-proc-{0}" -f ([guid]::NewGuid().ToString("N")))
    $stdout = "$tmpBase.out"
    $stderr = "$tmpBase.err"
    $psi = [System.Diagnostics.ProcessStartInfo]::new()
    $psi.FileName = $FilePath
    $psi.WorkingDirectory = $WorkingDirectory
    $psi.UseShellExecute = $false
    $psi.RedirectStandardOutput = $true
    $psi.RedirectStandardError = $true
    $quotedArgs = foreach ($arg in $ArgumentList) {
        if ($arg -match '[\s"]') {
            '"' + ($arg -replace '"', '\"') + '"'
        } else {
            $arg
        }
    }
    $psi.Arguments = ($quotedArgs -join " ")

    $proc = [System.Diagnostics.Process]::new()
    $proc.StartInfo = $psi
    [void]$proc.Start()
    $stdoutTask = $proc.StandardOutput.ReadToEndAsync()
    $stderrTask = $proc.StandardError.ReadToEndAsync()
    if (-not $proc.WaitForExit($TimeoutSeconds * 1000)) {
        try { $proc.Kill($true) } catch {}
        throw "$FilePath timed out after ${TimeoutSeconds}s"
    }
    $stdoutText = $stdoutTask.GetAwaiter().GetResult()
    $stderrText = $stderrTask.GetAwaiter().GetResult()
    Set-Content -LiteralPath $stdout -Value $stdoutText -Encoding UTF8
    Set-Content -LiteralPath $stderr -Value $stderrText -Encoding UTF8
    return [pscustomobject]@{
        ExitCode = $proc.ExitCode
        Stdout = $stdoutText
        Stderr = $stderrText
        StdoutPath = $stdout
        StderrPath = $stderr
    }
}

function Test-Jcs2Tesseract {
    param([string]$TesseractExe)
    $resolved = Resolve-Jcs2Tesseract $TesseractExe
    $result = Invoke-Jcs2Process -FilePath $resolved -ArgumentList @("--version") -TimeoutSeconds 15
    if ($result.ExitCode -ne 0) {
        throw "Tesseract health check failed: $($result.Stderr)"
    }
    return [pscustomobject]@{
        Path = $resolved
        Version = (($result.Stdout -split "`r?`n") | Select-Object -First 1)
    }
}

function Test-Jcs2RuntimePreflight {
    param(
        [string]$Adb,
        [string]$Emulator,
        [string]$TesseractExe
    )
    $sdkRoot = Get-Jcs2SdkRoot
    $adbPath = Get-Jcs2Adb $Adb
    $emulatorPath = Get-Jcs2Emulator $Emulator
    $systemImage = Join-Path $sdkRoot "system-images\android-36.1\google_apis_playstore\x86_64"
    $android34 = Join-Path $sdkRoot "platforms\android-34\android.jar"
    $android34Ui = Join-Path $sdkRoot "platforms\android-34\uiautomator.jar"
    $android36 = Join-Path $sdkRoot "platforms\android-36\android.jar"
    $jdkHomeFile = Join-Path (Get-Jcs2RepoRoot) "tools\jdk21_home.txt"
    $r8 = Join-Path (Get-Jcs2RepoRoot) "tools\r8.jar"

    foreach ($path in @($sdkRoot, $adbPath, $emulatorPath, $systemImage, $android34, $android34Ui, $android36, $jdkHomeFile, $r8)) {
        if (-not (Test-Path -LiteralPath $path)) { throw "Required runtime dependency missing: $path" }
    }
    $jdkHome = (Get-Content -LiteralPath $jdkHomeFile -Raw).Trim()
    foreach ($path in @((Join-Path $jdkHome "bin\java.exe"), (Join-Path $jdkHome "bin\javac.exe"), (Join-Path $jdkHome "bin\jar.exe"))) {
        if (-not (Test-Path -LiteralPath $path)) { throw "Required JDK executable missing: $path" }
    }

    $accel = Invoke-Jcs2Process -FilePath $emulatorPath -ArgumentList @("-accel-check") -TimeoutSeconds 30
    if ($accel.ExitCode -ne 0 -or (($accel.Stdout + $accel.Stderr) -notmatch "usable|installed")) {
        throw "Emulator acceleration check failed: $($accel.Stdout) $($accel.Stderr)"
    }

    $tesseract = Test-Jcs2Tesseract $TesseractExe
    return [pscustomobject]@{
        SdkRoot = $sdkRoot
        Adb = $adbPath
        Emulator = $emulatorPath
        SystemImage = $systemImage
        JdkHome = $jdkHome
        R8 = $r8
        Tesseract = $tesseract.Path
        TesseractVersion = $tesseract.Version
        Acceleration = (($accel.Stdout + $accel.Stderr).Trim())
    }
}

function New-Jcs2AvdConfig {
    param(
        [string]$AvdName = "jcs2-llm-runtime",
        [switch]$Recreate
    )
    $sdkRoot = Get-Jcs2SdkRoot
    $systemImage = Join-Path $sdkRoot "system-images\android-36.1\google_apis_playstore\x86_64"
    if (-not (Test-Path -LiteralPath $systemImage)) {
        throw "Android API 36.1 google_apis_playstore x86_64 system image is missing: $systemImage"
    }

    $avdHome = Get-Jcs2AvdHome
    $avdDir = Get-Jcs2AvdDir $AvdName
    $avdIni = Get-Jcs2AvdIni $AvdName
    if ($Recreate) {
        if ($AvdName -ne "jcs2-llm-runtime") {
            throw "-Recreate is only allowed for the dedicated jcs2-llm-runtime AVD."
        }
        if (Test-Path -LiteralPath $avdDir) { Remove-Item -LiteralPath $avdDir -Recurse -Force }
        if (Test-Path -LiteralPath $avdIni) { Remove-Item -LiteralPath $avdIni -Force }
    }
    New-Item -ItemType Directory -Force -Path $avdHome, $avdDir | Out-Null

    $ini = @(
        "avd.ini.encoding=UTF-8",
        "path=$avdDir",
        "path.rel=avd\$AvdName.avd",
        "target=android-36.1"
    )
    $ini | Set-Content -LiteralPath $avdIni -Encoding ASCII

    $config = @(
        "AvdId=$AvdName",
        "PlayStore.enabled=true",
        "abi.type=x86_64",
        "avd.ini.displayname=JCS2 LLM Runtime",
        "avd.ini.encoding=UTF-8",
        "disk.dataPartition.size=8G",
        "fastboot.forceColdBoot=yes",
        "fastboot.forceFastBoot=no",
        "hw.accelerometer=yes",
        "hw.audioInput=no",
        "hw.battery=yes",
        "hw.camera.back=none",
        "hw.camera.front=none",
        "hw.cpu.arch=x86_64",
        "hw.cpu.ncore=4",
        "hw.device.hash2=MD5:2016577e1656e8e7c2adb0fac972beea",
        "hw.device.manufacturer=Generic",
        "hw.device.name=medium_phone",
        "hw.gpu.enabled=yes",
        "hw.gpu.mode=swiftshader_indirect",
        "hw.gyroscope=yes",
        "hw.initialOrientation=portrait",
        "hw.keyboard=yes",
        "hw.lcd.density=420",
        "hw.lcd.height=2400",
        "hw.lcd.width=1080",
        "hw.mainKeys=no",
        "hw.ramSize=4096",
        "hw.sdCard=yes",
        "hw.sensors.orientation=yes",
        "image.sysdir.1=system-images\android-36.1\google_apis_playstore\x86_64\",
        "runtime.network.latency=none",
        "runtime.network.speed=full",
        "sdcard.size=512M",
        "showDeviceFrame=no",
        "skin.dynamic=yes",
        "skin.name=1080x2400",
        "skin.path=1080x2400",
        "tag.display=Google Play",
        "tag.id=google_apis_playstore",
        "target=android-36.1",
        "vm.heapSize=512"
    )
    $config | Set-Content -LiteralPath (Join-Path $avdDir "config.ini") -Encoding ASCII
    return [pscustomobject]@{
        AvdName = $AvdName
        AvdDir = $avdDir
        AvdIni = $avdIni
    }
}

function Invoke-Jcs2Adb {
    param(
        [Parameter(Mandatory = $true)][string]$Adb,
        [string]$Serial,
        [Parameter(ValueFromRemainingArguments = $true)][string[]]$Args
    )
    $fullArgs = New-Object System.Collections.Generic.List[string]
    if ($Serial) {
        [void]$fullArgs.Add("-s")
        [void]$fullArgs.Add($Serial)
    }
    foreach ($arg in $Args) { [void]$fullArgs.Add($arg) }
    $output = & $Adb @($fullArgs.ToArray()) 2>&1
    if ($LASTEXITCODE -ne 0) {
        throw "adb $($fullArgs -join ' ') failed with exit code $LASTEXITCODE`n$output"
    }
    return ($output -join "`n")
}

function Read-Jcs2AdbText {
    param(
        [Parameter(Mandatory = $true)][string]$Adb,
        [string]$Serial,
        [Parameter(ValueFromRemainingArguments = $true)][string[]]$Args
    )
    try {
        return Invoke-Jcs2Adb -Adb $Adb -Serial $Serial @Args
    } catch {
        return ""
    }
}

function Invoke-Jcs2AdbBounded {
    param(
        [Parameter(Mandatory = $true)][string]$Adb,
        [string]$Serial,
        [int]$TimeoutSeconds = 30,
        [Parameter(ValueFromRemainingArguments = $true)][string[]]$Args
    )
    $fullArgs = New-Object System.Collections.Generic.List[string]
    if ($Serial) {
        [void]$fullArgs.Add("-s")
        [void]$fullArgs.Add($Serial)
    }
    foreach ($arg in $Args) { [void]$fullArgs.Add($arg) }
    $result = Invoke-Jcs2Process -FilePath $Adb -ArgumentList $fullArgs.ToArray() -TimeoutSeconds $TimeoutSeconds
    $output = @($result.Stdout, $result.Stderr) | Where-Object { $_ }
    if ($result.ExitCode -ne 0) {
        throw "adb $($fullArgs -join ' ') failed with exit code $($result.ExitCode)`n$($output -join "`n")"
    }
    return ($output -join "`n")
}

function Stop-Jcs2Package {
    param(
        [Parameter(Mandatory = $true)][string]$Adb,
        [Parameter(Mandatory = $true)][string]$Serial,
        [Parameter(Mandatory = $true)][string]$Package,
        [int]$Seconds = 15
    )
    try {
        Invoke-Jcs2AdbBounded -Adb $Adb -Serial $Serial -TimeoutSeconds $Seconds shell am force-stop $Package | Out-Null
        return $true
    } catch {
        return $false
    }
}

function Start-Jcs2Emulator {
    param(
        [string]$AvdName = "jcs2-llm-runtime",
        [string]$Emulator,
        [int]$ConsolePort = 5562,
        [int]$AdbPort = 5563,
        [string]$Gpu = "swiftshader_indirect",
        [switch]$Headless
    )
    $emulatorPath = Get-Jcs2Emulator $Emulator
    # Android Emulator device serials use the console port, not the adb port.
    $serial = "emulator-$ConsolePort"
    $args = @(
        "-avd", $AvdName,
        "-ports", "$ConsolePort,$AdbPort",
        "-no-snapshot-load",
        "-no-snapshot-save",
        "-no-boot-anim",
        "-no-audio",
        "-gpu", $Gpu,
        "-camera-back", "none",
        "-camera-front", "none"
    )
    if ($Headless) { $args += "-no-window" }
    Start-Process -FilePath $emulatorPath -ArgumentList $args -WindowStyle Hidden | Out-Null
    return $serial
}

function Wait-Jcs2DeviceBoot {
    param(
        [Parameter(Mandatory = $true)][string]$Adb,
        [Parameter(Mandatory = $true)][string]$Serial,
        [int]$Seconds = 300
    )
    & $Adb -s $Serial wait-for-device
    if ($LASTEXITCODE -ne 0) { throw "adb wait-for-device failed for $Serial" }
    $start = Get-Date
    $deadline = $start.AddSeconds($Seconds)
    do {
        $boot = (Read-Jcs2AdbText -Adb $Adb -Serial $Serial shell getprop sys.boot_completed).Trim()
        $pm = Read-Jcs2AdbText -Adb $Adb -Serial $Serial shell pm path android
        $wm = Read-Jcs2AdbText -Adb $Adb -Serial $Serial shell wm size
        if ($pm -match "package:" -and $wm -match "Physical size:" -and ($boot -eq "1" -or ((Get-Date) - $start).TotalSeconds -ge 15)) { return }
        Start-Sleep -Seconds 3
    } while ((Get-Date) -lt $deadline)
    throw "Timed out waiting for $Serial to finish booting."
}

function Set-Jcs2RuntimeDisplay {
    param(
        [Parameter(Mandatory = $true)][string]$Adb,
        [Parameter(Mandatory = $true)][string]$Serial,
        [int]$Width = 480,
        [int]$Height = 320,
        [int]$Density = 160
    )
    Invoke-Jcs2Adb -Adb $Adb -Serial $Serial shell wm size "${Width}x${Height}" | Out-Null
    Invoke-Jcs2Adb -Adb $Adb -Serial $Serial shell wm density "$Density" | Out-Null
    Invoke-Jcs2Adb -Adb $Adb -Serial $Serial shell settings put system accelerometer_rotation 0 | Out-Null
    Invoke-Jcs2Adb -Adb $Adb -Serial $Serial shell settings put system user_rotation 1 | Out-Null
    Invoke-Jcs2Adb -Adb $Adb -Serial $Serial shell settings put secure immersive_mode_confirmations confirmed | Out-Null
}

function Set-Jcs2StraightSensors {
    param(
        [Parameter(Mandatory = $true)][string]$Adb,
        [Parameter(Mandatory = $true)][string]$Serial,
        [string]$StraightAcceleration = "9.80665:0:0",
        [string]$StraightOrientation = "0:0:90"
    )
    Invoke-Jcs2Adb -Adb $Adb -Serial $Serial emu sensor set acceleration $StraightAcceleration | Out-Null
    Invoke-Jcs2Adb -Adb $Adb -Serial $Serial emu sensor set gyroscope "0:0:0" | Out-Null
    Invoke-Jcs2Adb -Adb $Adb -Serial $Serial emu sensor set orientation $StraightOrientation | Out-Null
}

function Grant-Jcs2StoragePermissions {
    param(
        [Parameter(Mandatory = $true)][string]$Adb,
        [Parameter(Mandatory = $true)][string]$Serial,
        [string]$Package = "modded.ycs2"
    )
    foreach ($permission in @(
        "android.permission.READ_EXTERNAL_STORAGE",
        "android.permission.WRITE_EXTERNAL_STORAGE",
        "android.permission.READ_MEDIA_IMAGES",
        "android.permission.READ_MEDIA_VIDEO",
        "android.permission.READ_MEDIA_AUDIO",
        "android.permission.READ_MEDIA_VISUAL_USER_SELECTED",
        "android.permission.ACCESS_MEDIA_LOCATION"
    )) {
        try { & $Adb -s $Serial shell pm grant $Package $permission 1>$null 2>$null } catch {}
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
        try { & $Adb -s $Serial shell appops set $Package $operation allow 1>$null 2>$null } catch {}
    }
}

function Install-Jcs2Apk {
    param(
        [Parameter(Mandatory = $true)][string]$Adb,
        [Parameter(Mandatory = $true)][string]$Serial,
        [Parameter(Mandatory = $true)][string]$ApkPath,
        [string]$Package = "modded.ycs2",
        [int]$Seconds = 900
    )
    if (-not (Test-Path -LiteralPath $ApkPath)) { throw "APK not found: $ApkPath" }
    Stop-Jcs2Package -Adb $Adb -Serial $Serial -Package $Package -Seconds 15 | Out-Null
    $deadline = (Get-Date).AddSeconds($Seconds)
    $allOutput = New-Object System.Collections.Generic.List[string]
    do {
        $remaining = [int][Math]::Max(60, ($deadline - (Get-Date)).TotalSeconds)
        $timeout = [int][Math]::Min(840, $remaining)
        try {
            $result = Invoke-Jcs2Process -FilePath $Adb -ArgumentList @("-s", $Serial, "install", "--no-incremental", "-r", $ApkPath) -TimeoutSeconds $timeout
            $installOutput = @($result.Stdout, $result.Stderr) | Where-Object { $_ }
            $exitCode = $result.ExitCode
        } catch {
            [void]$allOutput.Add("install attempt timed out or failed to execute: $($_.Exception.Message)")
            Stop-Jcs2Package -Adb $Adb -Serial $Serial -Package $Package -Seconds 15 | Out-Null
            if ((Get-Date) -lt $deadline) {
                Start-Sleep -Seconds 8
                continue
            }
            throw "adb install --no-incremental timed out or failed to execute for $ApkPath after ${Seconds}s. $($allOutput -join "`n")"
        }
        foreach ($line in $installOutput) { [void]$allOutput.Add($line.ToString()) }
        if ($exitCode -eq 0) { return ($allOutput -join "`n") }
        $joined = $installOutput -join "`n"
        if ($joined -match "device is still booting|Could not access the Package Manager") {
            Start-Sleep -Seconds 8
            continue
        }
        if ($joined -match "INSTALL_FAILED_UPDATE_INCOMPATIBLE|INSTALL_FAILED_VERSION_DOWNGRADE|signatures do not match") {
            & $Adb -s $Serial uninstall $Package 2>&1 | Out-Null
            Start-Sleep -Seconds 2
            continue
        }
        throw "adb install failed for $ApkPath`n$joined"
    } while ((Get-Date) -lt $deadline)
    throw "adb install --no-incremental -r $ApkPath failed after waiting ${Seconds}s`n$($allOutput -join "`n")"
}

function Reset-Jcs2RuntimeApp {
    param(
        [Parameter(Mandatory = $true)][string]$Adb,
        [Parameter(Mandatory = $true)][string]$Serial,
        [string]$Package = "modded.ycs2",
        [string[]]$ExtraPackagesToStop = @("com.trueaxis.jetcarstunts2", "com.android.chrome")
    )
    foreach ($pkg in @($Package) + $ExtraPackagesToStop) {
        Stop-Jcs2Package -Adb $Adb -Serial $Serial -Package $pkg -Seconds 15 | Out-Null
    }
    Invoke-Jcs2AdbBounded -Adb $Adb -Serial $Serial -TimeoutSeconds 60 shell pm clear $Package | Out-Null
    Grant-Jcs2StoragePermissions -Adb $Adb -Serial $Serial -Package $Package
    Invoke-Jcs2AdbBounded -Adb $Adb -Serial $Serial -TimeoutSeconds 30 shell rm -f /sdcard/YCS2CommunityMod/logs/ycs2_mod_debug.log /sdcard/YCS2CommunityMod/logs/ycs2_mod_native_crash.log /sdcard/YCS2CommunityMod/logs/debug-04e8a3.log | Out-Null
    Invoke-Jcs2AdbBounded -Adb $Adb -Serial $Serial -TimeoutSeconds 30 logcat -c | Out-Null
}

function Save-Jcs2Screenshot {
    param(
        [Parameter(Mandatory = $true)][string]$Adb,
        [Parameter(Mandatory = $true)][string]$Serial,
        [Parameter(Mandatory = $true)][string]$Path
    )
    New-Item -ItemType Directory -Force -Path (Split-Path -Parent $Path) | Out-Null
    cmd /c "`"$Adb`" -s $Serial exec-out screencap -p > `"$Path`""
    if ($LASTEXITCODE -ne 0 -or -not (Test-Path -LiteralPath $Path)) {
        throw "screencap failed for $Path"
    }
    return $Path
}

function Save-Jcs2WindowXml {
    param(
        [Parameter(Mandatory = $true)][string]$Adb,
        [Parameter(Mandatory = $true)][string]$Serial,
        [Parameter(Mandatory = $true)][string]$Path
    )
    try { & $Adb -s $Serial shell uiautomator dump /sdcard/window.xml 1>$null 2>$null } catch {}
    $xml = Read-Jcs2AdbText -Adb $Adb -Serial $Serial shell cat /sdcard/window.xml
    Set-Content -LiteralPath $Path -Value $xml -Encoding UTF8
    return $Path
}

function Save-Jcs2AdbText {
    param(
        [Parameter(Mandatory = $true)][string]$Adb,
        [Parameter(Mandatory = $true)][string]$Serial,
        [Parameter(Mandatory = $true)][string]$Path,
        [Parameter(ValueFromRemainingArguments = $true)][string[]]$Args
    )
    $text = Read-Jcs2AdbText -Adb $Adb -Serial $Serial @Args
    Set-Content -LiteralPath $Path -Value $text -Encoding UTF8
    return $text
}

function Wait-Jcs2WindowText {
    param(
        [Parameter(Mandatory = $true)][string]$Adb,
        [Parameter(Mandatory = $true)][string]$Serial,
        [Parameter(Mandatory = $true)][string]$Text,
        [int]$Seconds = 30
    )
    $deadline = (Get-Date).AddSeconds($Seconds)
    do {
        try { & $Adb -s $Serial shell uiautomator dump /sdcard/window.xml 1>$null 2>$null } catch {}
        $xml = Read-Jcs2AdbText -Adb $Adb -Serial $Serial shell cat /sdcard/window.xml
        if ($xml -like "*$Text*") { return $xml }
        Start-Sleep -Milliseconds 500
    } while ((Get-Date) -lt $deadline)
    throw "Timed out waiting for window text: $Text"
}

function Wait-Jcs2FocusedActivity {
    param(
        [Parameter(Mandatory = $true)][string]$Adb,
        [Parameter(Mandatory = $true)][string]$Serial,
        [Parameter(Mandatory = $true)][string]$ActivityFragment,
        [int]$Seconds = 30
    )
    $deadline = (Get-Date).AddSeconds($Seconds)
    do {
        $window = Read-Jcs2AdbText -Adb $Adb -Serial $Serial shell dumpsys window
        if ($window -like "*$ActivityFragment*") { return $window }
        Start-Sleep -Milliseconds 500
    } while ((Get-Date) -lt $deadline)
    throw "Timed out waiting for focused activity: $ActivityFragment"
}

function Invoke-Jcs2TapWindowText {
    param(
        [Parameter(Mandatory = $true)][string]$Adb,
        [Parameter(Mandatory = $true)][string]$Serial,
        [Parameter(Mandatory = $true)][string]$Text,
        [string]$Xml
    )
    if (-not $Xml) {
        $Xml = Wait-Jcs2WindowText -Adb $Adb -Serial $Serial -Text $Text -Seconds 10
    }
    $escaped = [regex]::Escape($Text)
    $match = [regex]::Match($Xml, "text=`"$escaped`"[^>]*bounds=`"\[(\d+),(\d+)\]\[(\d+),(\d+)\]`"", [System.Text.RegularExpressions.RegexOptions]::Singleline)
    if (-not $match.Success) { throw "Could not find tappable bounds for window text: $Text" }
    $x = [int](([int]$match.Groups[1].Value + [int]$match.Groups[3].Value) / 2)
    $y = [int](([int]$match.Groups[2].Value + [int]$match.Groups[4].Value) / 2)
    Invoke-Jcs2Adb -Adb $Adb -Serial $Serial shell input tap $x $y | Out-Null
}

function Invoke-Jcs2TapWindowTextIfPresent {
    param(
        [Parameter(Mandatory = $true)][string]$Adb,
        [Parameter(Mandatory = $true)][string]$Serial,
        [Parameter(Mandatory = $true)][string]$Text,
        [string]$Xml
    )
    if (-not $Xml) {
        try { & $Adb -s $Serial shell uiautomator dump /sdcard/window.xml 1>$null 2>$null } catch {}
        $Xml = Read-Jcs2AdbText -Adb $Adb -Serial $Serial shell cat /sdcard/window.xml
    }
    if ($Xml -notlike "*$Text*") { return $false }
    try {
        Invoke-Jcs2TapWindowText -Adb $Adb -Serial $Serial -Text $Text -Xml $Xml
        return $true
    } catch {
        return $false
    }
}

function Dismiss-Jcs2SystemDialogs {
    param(
        [Parameter(Mandatory = $true)][string]$Adb,
        [Parameter(Mandatory = $true)][string]$Serial,
        [int]$Passes = 3
    )
    $dismissed = $false
    for ($i = 0; $i -lt $Passes; $i++) {
        try { & $Adb -s $Serial shell uiautomator dump /sdcard/window.xml 1>$null 2>$null } catch {}
        $xml = Read-Jcs2AdbText -Adb $Adb -Serial $Serial shell cat /sdcard/window.xml
        if ($xml -match "isn'?t responding" -and (Invoke-Jcs2TapWindowTextIfPresent -Adb $Adb -Serial $Serial -Text "Wait" -Xml $xml)) {
            $dismissed = $true
            Start-Sleep -Seconds 2
            continue
        }
        if ($xml -like "*permissioncontroller*" -and (Invoke-Jcs2TapWindowTextIfPresent -Adb $Adb -Serial $Serial -Text "Allow" -Xml $xml)) {
            $dismissed = $true
            Start-Sleep -Seconds 1
            continue
        }
        if ($xml -like "*Update available*" -and (Invoke-Jcs2TapWindowTextIfPresent -Adb $Adb -Serial $Serial -Text "Later" -Xml $xml)) {
            $dismissed = $true
            Start-Sleep -Seconds 1
            continue
        }
        if (Invoke-Jcs2TapWindowTextIfPresent -Adb $Adb -Serial $Serial -Text "Got it" -Xml $xml) {
            $dismissed = $true
            Start-Sleep -Seconds 1
            continue
        }
        if (Invoke-Jcs2TapWindowTextIfPresent -Adb $Adb -Serial $Serial -Text "OK" -Xml $xml) {
            $dismissed = $true
            Start-Sleep -Seconds 1
            continue
        }
        Start-Sleep -Milliseconds 500
    }
    return $dismissed
}

function Save-Jcs2RuntimeLogs {
    param(
        [Parameter(Mandatory = $true)][string]$Adb,
        [Parameter(Mandatory = $true)][string]$Serial,
        [Parameter(Mandatory = $true)][string]$OutDir
    )
    New-Item -ItemType Directory -Force -Path $OutDir | Out-Null
    Save-Jcs2AdbText -Adb $Adb -Serial $Serial -Path (Join-Path $OutDir "logcat.txt") logcat -d -t 6000 | Out-Null
    Save-Jcs2AdbText -Adb $Adb -Serial $Serial -Path (Join-Path $OutDir "public_ycs2_mod_debug.log") shell cat /sdcard/YCS2CommunityMod/logs/ycs2_mod_debug.log | Out-Null
    Save-Jcs2AdbText -Adb $Adb -Serial $Serial -Path (Join-Path $OutDir "public_ycs2_mod_native_crash.log") shell cat /sdcard/YCS2CommunityMod/logs/ycs2_mod_native_crash.log | Out-Null
    Save-Jcs2AdbText -Adb $Adb -Serial $Serial -Path (Join-Path $OutDir "debug-04e8a3.log") shell cat /sdcard/YCS2CommunityMod/logs/debug-04e8a3.log | Out-Null
}

function Assert-Jcs2NoCrashEvidence {
    param(
        [Parameter(Mandatory = $true)][string]$RunDir,
        [string]$Package = "modded.ycs2"
    )
    $logcatPath = Join-Path $RunDir "logcat.txt"
    $nativePath = Join-Path $RunDir "public_ycs2_mod_native_crash.log"
    $debugPath = Join-Path $RunDir "public_ycs2_mod_debug.log"
    $logcat = Get-Content -LiteralPath $logcatPath -Raw -ErrorAction SilentlyContinue
    $native = Get-Content -LiteralPath $nativePath -Raw -ErrorAction SilentlyContinue
    $debug = Get-Content -LiteralPath $debugPath -Raw -ErrorAction SilentlyContinue
    $crashLines = $logcat -split "`n" | Where-Object {
        ($_ -match "FATAL EXCEPTION|Abort message|signal 11|ANR in|Application Not Responding|Input dispatching timed out|EGL_BAD_SURFACE") -and
        ($_ -match [regex]::Escape($Package) -or $_ -match "YCS2Mod|libjcs2mod|libtrueaxis|System UI")
    }
    if ($crashLines.Count -gt 0) {
        $crashLines | Set-Content -LiteralPath (Join-Path $RunDir "crash-lines.txt") -Encoding UTF8
        throw "Runtime crash/ANR/EGL evidence found. See $RunDir\crash-lines.txt"
    }
    if ($native -match "native fatal signal") { throw "Native crash evidence found. See $nativePath" }
    if ($debug -match "UNCAUGHT|Could not install|poll failed|Start game failed") { throw "App debug failure evidence found. See $debugPath" }
}

function Get-Jcs2ApkMetadata {
    param([Parameter(Mandatory = $true)][string]$ApkPath)
    $hash = (Get-FileHash -Algorithm SHA256 -LiteralPath $ApkPath).Hash.ToLowerInvariant()
    $size = (Get-Item -LiteralPath $ApkPath).Length
    return [pscustomobject]@{
        Path = (Resolve-Path -LiteralPath $ApkPath).Path
        Sha256 = $hash
        Size = $size
    }
}
