# Rebuild signed jcs_modded.apk: modmenu smali -> apktool -> zipalign -> apksigner
$ErrorActionPreference = "Stop"
$Root = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $Root

Write-Host "Applying tracked mod asset overlays..."
Copy-Item (Join-Path $Root "mod_assets\shaders\afterburner.vert") `
    (Join-Path $Root "decompiled\assets\shaders\afterburner.vert") -Force
Copy-Item (Join-Path $Root "mod_assets\shaders\afterburner_fix.vert") `
    (Join-Path $Root "decompiled\assets\shaders\afterburner_fix.vert") -Force

& (Join-Path $Root "build_modmenu.ps1")
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

& python (Join-Path $Root "scripts\audit_mod_surface.py")
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

$JdkHome = (Get-Content "tools\jdk21_home.txt" -Raw).Trim()
$Java = Join-Path $JdkHome "bin\java.exe"

$Unsigned = Join-Path $Root "_apk_build\unsigned.apk"
$Aligned = Join-Path $Root "_apk_build\aligned.apk"
$Output = Join-Path $Root "jcs_modded.apk"
New-Item -ItemType Directory -Path (Split-Path $Unsigned) -Force | Out-Null

Write-Host "Building APK with apktool..."
& $Java -jar (Join-Path $Root "tools\apktool.jar") b (Join-Path $Root "decompiled") -o $Unsigned
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

$Zipalign = Get-Command zipalign -ErrorAction SilentlyContinue
$Apksigner = Get-Command apksigner -ErrorAction SilentlyContinue
if (-not $Zipalign -or -not $Apksigner) {
    $SdkRoot = $env:ANDROID_HOME
    if (-not $SdkRoot) { $SdkRoot = $env:ANDROID_SDK_ROOT }
    if (-not $SdkRoot) { $SdkRoot = Join-Path $env:LOCALAPPDATA "Android\Sdk" }
    $BuildTools = Get-ChildItem (Join-Path $SdkRoot "build-tools") -ErrorAction SilentlyContinue |
        Sort-Object Name -Descending | Select-Object -First 1
    if ($BuildTools) {
        if (-not $Zipalign) { $Zipalign = Join-Path $BuildTools.FullName "zipalign.exe" }
        if (-not $Apksigner) { $Apksigner = Join-Path $BuildTools.FullName "apksigner.bat" }
    }
}

if (-not (Test-Path $Zipalign)) {
    Write-Error "zipalign not found. Install Android SDK build-tools or set ANDROID_HOME."
}
if (-not (Test-Path $Apksigner)) {
    Write-Error "apksigner not found. Install Android SDK build-tools or set ANDROID_HOME."
}

Write-Host "Aligning..."
& $Zipalign -f 4 $Unsigned $Aligned
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

$Keystore = Join-Path $Root "jcs2.keystore"
if (-not (Test-Path $Keystore)) {
    Write-Error "Missing jcs2.keystore for signing."
}

$StorePass = $env:JCS2_KEYSTORE_PASS
if (-not $StorePass -and (Test-Path (Join-Path $Root "keystore.properties"))) {
    Get-Content (Join-Path $Root "keystore.properties") | ForEach-Object {
        if ($_ -match '^\s*storePassword\s*=\s*(.+)\s*$') { $StorePass = $Matches[1] }
    }
}
if (-not $StorePass) {
    Write-Error "Set JCS2_KEYSTORE_PASS or create keystore.properties with storePassword=..."
}

Write-Host "Signing..."
& $Apksigner sign --ks $Keystore --ks-pass "pass:$StorePass" --key-pass "pass:$StorePass" --out $Output $Aligned
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

& python (Join-Path $Root "scripts\audit_mod_surface.py") --apk $Output
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

Write-Host "Built $Output"
