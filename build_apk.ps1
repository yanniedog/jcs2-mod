# Rebuild signed jcs2-mod.apk: modmenu smali -> apktool -> zipalign -> apksigner
$ErrorActionPreference = "Stop"
$Root = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $Root

function Copy-TextOverlayLf($source, $destination) {
    $text = [System.IO.File]::ReadAllText($source)
    $text = $text -replace "`r`n", "`n"
    $text = $text -replace "`r", "`n"
    [System.IO.File]::WriteAllText(
        $destination,
        $text,
        [System.Text.UTF8Encoding]::new($false)
    )
}

Write-Host "Applying tracked mod asset overlays..."
Copy-TextOverlayLf `
    (Join-Path $Root "mod_assets\shaders\afterburner.vert") `
    (Join-Path $Root "decompiled\assets\shaders\afterburner.vert")
Copy-TextOverlayLf `
    (Join-Path $Root "mod_assets\shaders\afterburner_fix.vert") `
    (Join-Path $Root "decompiled\assets\shaders\afterburner_fix.vert")

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

# Every release is self-signed with the committed stable keystore so that
# in-place updates keep working (a fresh random key per build would change the
# signature each release and block updates). Path/alias/password may be
# overridden via env for local experiments, but default to the committed key.
$Keystore = $env:JCS2_KEYSTORE
if (-not $Keystore) { $Keystore = Join-Path $Root "jcs2.keystore" }
$KeyAlias = $env:JCS2_KEY_ALIAS
if (-not $KeyAlias) { $KeyAlias = "jcs2local" }
$StorePass = "android"
if ($env:JCS2_KEYSTORE_PASS) { $StorePass = $env:JCS2_KEYSTORE_PASS }
$KeyPass = $StorePass

if (-not (Test-Path $Keystore)) {
    # The stable keystore is committed to the repo. A missing keystore in CI
    # means a broken checkout: fail loudly rather than silently minting a new
    # throwaway key that would change the signing certificate and break in-place
    # updates. Local builds may regenerate it for convenience.
    if ($env:GITHUB_ACTIONS -eq "true") {
        Write-Error "Signing keystore '$Keystore' is missing in CI; refusing to generate a throwaway key that would change the release signature."
        exit 1
    }
    $Keytool = Join-Path $JdkHome "bin\keytool.exe"
    if (-not (Test-Path $Keytool)) {
        Write-Error "keytool not found at $Keytool; cannot create self-signed signing key."
        exit 1
    }
    Write-Host "Committed keystore missing; creating self-signed signing key for local build..."
    & $Keytool -genkeypair -keystore $Keystore -storepass $StorePass -keypass $KeyPass `
        -alias $KeyAlias -keyalg RSA -keysize 2048 -validity 36500 `
        -dname "CN=JCS2 Community Mod,O=JCS2 Community Mod,C=US"
    if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
}
Write-Host "Using self-signed signing key (alias $KeyAlias)."

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
