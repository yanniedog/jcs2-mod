# Compiles modmenu Java sources to smali and copies into decompiled/smali.
$ErrorActionPreference = "Stop"
$Root = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $Root

$JdkHome = (Get-Content "tools\jdk21_home.txt" -Raw).Trim()
$Javac = Join-Path $JdkHome "bin\javac.exe"
$Jar = Join-Path $JdkHome "bin\jar.exe"
$Java = Join-Path $JdkHome "bin\java.exe"

# Compile against a pinned platform android.jar so generated smali is
# byte-identical between local and CI. The API level is fixed (the workflows
# install the same one) and the SDK android.jar ships org.json, which
# UpdateManager imports. The cache filename is version-specific so a stale
# generic android.jar from a different API level can't silently be reused.
$AndroidApi = 34
$AndroidJar = Join-Path $Root "tools\android-$AndroidApi.jar"
if (-not (Test-Path $AndroidJar)) {
    $SdkRoot = $env:ANDROID_HOME
    if (-not $SdkRoot) { $SdkRoot = $env:ANDROID_SDK_ROOT }
    if (-not $SdkRoot) { $SdkRoot = Join-Path $env:LOCALAPPDATA "Android\Sdk" }
    $PlatformJar = Join-Path $SdkRoot "platforms\android-$AndroidApi\android.jar"
    if (-not (Test-Path $PlatformJar)) {
        throw "android-$AndroidApi platform jar not found at $PlatformJar. Install it with: sdkmanager `"platforms;android-$AndroidApi`""
    }
    Write-Host "Using SDK platform android.jar: $PlatformJar"
    New-Item -ItemType Directory -Path (Split-Path $AndroidJar) -Force | Out-Null
    Copy-Item $PlatformJar $AndroidJar -Force
}

$R8Jar = Join-Path $Root "tools\r8.jar"
if (-not (Test-Path $R8Jar)) {
    Write-Host "Downloading r8.jar..."
    Invoke-WebRequest -Uri "https://storage.googleapis.com/r8-releases/raw/8.7.18/r8.jar" -OutFile $R8Jar
}

$BuildDir = Join-Path $Root "_modmenu_build_tmp"
$ClassesDir = Join-Path $BuildDir "classes"
$DexDir = Join-Path $BuildDir "dex"
$SmaliOut = Join-Path $BuildDir "smali"
$ModSrc = Join-Path $Root "modmenu_src"
$GameStub = Join-Path $BuildDir "game_stub"

Remove-Item $ClassesDir, $DexDir, $SmaliOut, $GameStub -Recurse -Force -ErrorAction SilentlyContinue
New-Item -ItemType Directory -Path $ClassesDir, $DexDir, $GameStub -Force | Out-Null

# Minimal stub so ModLauncherActivity can reference Jetcarstunts2Activity at compile time.
$StubFile = Join-Path $GameStub "Jetcarstunts2Activity.java"
[System.IO.File]::WriteAllText($StubFile, @"
package com.trueaxis.jetcarstunts2;
import android.app.Activity;
public class Jetcarstunts2Activity extends Activity {}
"@)

Write-Host "Compiling modmenu sources..."
$Sources = @(Get-ChildItem -Path (Join-Path $ModSrc "com\trueaxis\modmenu") -Filter *.java -Recurse |
    ForEach-Object { $_.FullName })
$Sources += $StubFile
& $Javac -source 8 -target 8 -Xlint:-options -encoding UTF-8 `
    -classpath $AndroidJar `
    -d $ClassesDir `
    $Sources
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

$ModJar = Join-Path $BuildDir "modmenu.jar"
& $Jar cf $ModJar -C $ClassesDir .
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

Write-Host "Dexing modmenu classes..."
& $Java -cp $R8Jar com.android.tools.r8.D8 --min-api 15 --lib $AndroidJar --output $DexDir $ModJar
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

Write-Host "Disassembling to smali..."
$BaksmaliJar = Join-Path $Root "tools\baksmali.jar"
$BaksmaliLib = Join-Path $Root "tools\baksmali_lib"
$BaksmaliDeps = @()
if (Test-Path $BaksmaliLib) {
    $BaksmaliDeps = @(Get-ChildItem -Path $BaksmaliLib -Filter *.jar -File |
        ForEach-Object { $_.FullName })
}
if ($BaksmaliDeps.Count -gt 0) {
    $BaksmaliClasspath = (@($BaksmaliJar) + $BaksmaliDeps) -join [System.IO.Path]::PathSeparator
    & $Java -cp $BaksmaliClasspath org.jf.baksmali.Main d (Join-Path $DexDir "classes.dex") -o $SmaliOut
} else {
    & $Java -jar $BaksmaliJar d (Join-Path $DexDir "classes.dex") -o $SmaliOut
}
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

$Dest = Join-Path $Root "decompiled\smali\com\trueaxis\modmenu"
Remove-Item $Dest -Recurse -Force -ErrorAction SilentlyContinue
New-Item -ItemType Directory -Path $Dest -Force | Out-Null
Copy-Item (Join-Path $SmaliOut "com\trueaxis\modmenu\*") $Dest -Force

# Strip baksmali's numeric value comments (e.g. "const v6, 0x3e75c28f    # 0.24f")
# on const instructions. Whether baksmali emits these depends on how complete its
# register analysis is, which varies between environments (e.g. local vs CI),
# making the output non-reproducible. Removing them keeps the generated smali
# byte-identical everywhere so the CI "verify generated outputs" check is stable.
# Only const* instructions with a numeric (0x...) operand are touched, so
# const-string/const-class operands are never altered. Newlines are preserved.
$ValueComment = [regex]'(?m)^([ \t]+const\S* [vp]\d+, -?0x[0-9a-fA-F]+[Lst]?)[ \t]+#[^\r\n]*'
$Utf8NoBom = [System.Text.UTF8Encoding]::new($false)
Get-ChildItem -Path $Dest -Recurse -Filter *.smali | ForEach-Object {
    $raw = [System.IO.File]::ReadAllText($_.FullName)
    $new = $ValueComment.Replace($raw, '$1')
    if ($new -ne $raw) {
        [System.IO.File]::WriteAllText($_.FullName, $new, $Utf8NoBom)
    }
}
Write-Host "Copied smali to $Dest"
