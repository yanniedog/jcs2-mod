$ErrorActionPreference = "Stop"

$Root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
Set-Location $Root

$Assets = Join-Path $Root "decompiled\assets"
if (Test-Path (Join-Path $Assets "cars\original\rocketcar1.png")) {
    Write-Host "decompiled/assets already present"
    exit 0
}

$BuildDir = Join-Path $Root "_apk_build"
$BaseDir = Join-Path $BuildDir "base"
$BaseApk = Join-Path $BuildDir "base.apk"
New-Item -ItemType Directory -Path $BuildDir, $BaseDir -Force | Out-Null

if ($env:JCS2_BASE_APK_URL) {
    Write-Host "Downloading base APK from JCS2_BASE_APK_URL"
    Invoke-WebRequest -Uri $env:JCS2_BASE_APK_URL -OutFile $BaseApk
} else {
    Write-Host "No JCS2_BASE_APK_URL set; trying latest GitHub release APK asset"
    if (-not $env:GH_TOKEN) {
        throw "Set JCS2_BASE_APK_URL or GH_TOKEN so CI can download a base APK asset."
    }
    gh release download --pattern "*.apk" --dir $BaseDir --clobber
    $candidate = Get-ChildItem -LiteralPath $BaseDir -Filter *.apk -File |
        Sort-Object Length -Descending |
        Select-Object -First 1
    if (-not $candidate) {
        throw "No APK asset found in the latest GitHub release. Seed JCS2_BASE_APK_URL for the first automated release."
    }
    Copy-Item -LiteralPath $candidate.FullName -Destination $BaseApk -Force
}

if (-not (Test-Path $BaseApk)) {
    throw "Base APK was not downloaded."
}

Write-Host "Restoring decompiled/assets from $BaseApk"
Add-Type -AssemblyName System.IO.Compression.FileSystem
$zip = [System.IO.Compression.ZipFile]::OpenRead($BaseApk)
try {
    foreach ($entry in $zip.Entries) {
        if (-not $entry.FullName.StartsWith("assets/")) {
            continue
        }
        if ($entry.FullName.EndsWith("/")) {
            continue
        }
        $relative = $entry.FullName.Substring("assets/".Length)
        $destination = Join-Path $Assets ($relative -replace '/', '\')
        $directory = Split-Path -Parent $destination
        New-Item -ItemType Directory -Path $directory -Force | Out-Null
        [System.IO.Compression.ZipFileExtensions]::ExtractToFile($entry, $destination, $true)
    }
} finally {
    $zip.Dispose()
}

if (-not (Test-Path (Join-Path $Assets "cars\original\rocketcar1.png"))) {
    throw "Base APK did not contain assets/cars/original/rocketcar1.png"
}

Write-Host "Restored decompiled/assets"
