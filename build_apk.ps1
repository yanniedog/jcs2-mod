# Rebuild signed jcs2-mod.apk: modmenu smali -> apktool -> zipalign -> apksigner
$ErrorActionPreference = "Stop"
$Root = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $Root

Write-Host "Applying tracked mod asset overlays..."
Copy-Item (Join-Path $Root "mod_assets\shaders\afterburner.vert") `
    (Join-Path $Root "decompiled\assets\shaders\afterburner.vert") -Force
Copy-Item (Join-Path $Root "mod_assets\shaders\afterburner_fix.vert") `
    (Join-Path $Root "decompiled\assets\shaders\afterburner_fix.vert") -Force

$ApktoolYml = Join-Path $Root "decompiled\apktool.yml"
$VersionText = Get-Content $ApktoolYml -Raw
$VersionName = "unknown"
$VersionCode = "0"
if ($VersionText -match 'versionName:\s*(\S+)') { $VersionName = $Matches[1] }
if ($VersionText -match 'versionCode:\s*(\d+)') { $VersionCode = $Matches[1] }
$BuildDateUtc = $env:JCS2_BUILD_DATE_UTC
if (-not $BuildDateUtc) {
    $BuildDateUtc = (Get-Date).ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ssZ")
}
$GitSha = "unknown"
try {
    $GitSha = (& git rev-parse --short=12 HEAD 2>$null).Trim()
    if (-not $GitSha) { $GitSha = "unknown" }
} catch {
    $GitSha = "unknown"
}
$BuildInfo = Join-Path $Root "decompiled\assets\ycs2-build-info.properties"
New-Item -ItemType Directory -Path (Split-Path $BuildInfo) -Force | Out-Null
@(
    "build_date_utc=$BuildDateUtc",
    "version_name=$VersionName",
    "version_code=$VersionCode",
    "git_sha=$GitSha"
) | Set-Content -LiteralPath $BuildInfo -Encoding ASCII
Write-Host "Stamped build metadata: $VersionName build $VersionCode built $BuildDateUtc"

& (Join-Path $Root "build_modmenu.ps1")
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

& python (Join-Path $Root "scripts\audit_mod_surface.py")
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

$JdkHome = (Get-Content "tools\jdk21_home.txt" -Raw).Trim()
$Java = Join-Path $JdkHome "bin\java.exe"

$Unsigned = Join-Path $Root "_apk_build\unsigned.apk"
$Aligned = Join-Path $Root "_apk_build\aligned.apk"
$Output = Join-Path $Root "jcs2-mod.apk"
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

$StorePass = $env:JCS2_KEYSTORE_PASS
if (-not $StorePass -and (Test-Path (Join-Path $Root "keystore.properties"))) {
    Get-Content (Join-Path $Root "keystore.properties") | ForEach-Object {
        if ($_ -match '^\s*storePassword\s*=\s*(.+)\s*$') { $StorePass = $Matches[1] }
    }
}

$Keystore = Join-Path $Root "jcs2.keystore"
$KeyPass = $StorePass
$KeyAlias = $null
if ((Test-Path $Keystore) -and $StorePass) {
    Write-Host "Using release keystore."
} else {
    $Keystore = Join-Path $Root "_apk_build\jcs2-local.keystore"
    $StorePass = "android"
    $KeyPass = "android"
    $KeyAlias = "jcs2local"
    if (-not (Test-Path $Keystore)) {
        $Keytool = Join-Path $JdkHome "bin\keytool.exe"
        if (-not (Test-Path $Keytool)) {
            Write-Error "keytool not found at $Keytool; cannot create local signing key."
        }
        Write-Host "Creating local signing key..."
        & $Keytool -genkeypair -keystore $Keystore -storepass $StorePass -keypass $KeyPass `
            -alias $KeyAlias -keyalg RSA -keysize 2048 -validity 10000 `
            -dname "CN=YCS2 Local,O=YCS2,C=US"
        if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
    }
    Write-Host "Using local signing key."
}

Write-Host "Signing..."
Remove-Item $Output -Force -ErrorAction SilentlyContinue
$SignArgs = @(
    "sign",
    "--ks", $Keystore,
    "--ks-pass", "pass:$StorePass",
    "--key-pass", "pass:$KeyPass",
    "--out", $Output
)
if ($KeyAlias) {
    $SignArgs += @("--ks-key-alias", $KeyAlias)
}
$SignArgs += $Aligned
& $Apksigner @SignArgs
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

& python (Join-Path $Root "scripts\audit_mod_surface.py") --apk $Output
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

Write-Host "Built $Output"
