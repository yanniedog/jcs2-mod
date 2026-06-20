$ErrorActionPreference = "Stop"

$Root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
Set-Location $Root

$Tools = Join-Path $Root "tools"
New-Item -ItemType Directory -Path $Tools -Force | Out-Null

$JdkHomeFile = Join-Path $Tools "jdk21_home.txt"
$JdkHome = $env:JAVA_HOME
if (-not $JdkHome -and (Test-Path $JdkHomeFile)) {
    $JdkHome = (Get-Content $JdkHomeFile -Raw).Trim()
}
if (-not $JdkHome) {
    throw "JAVA_HOME is not set and tools/jdk21_home.txt does not exist."
}
Set-Content -LiteralPath $JdkHomeFile -Value $JdkHome -NoNewline -Encoding ASCII

$downloads = @(
    @{
        Path = Join-Path $Tools "apktool.jar"
        Uri = "https://github.com/iBotPeaches/Apktool/releases/download/v2.10.0/apktool_2.10.0.jar"
    },
    @{
        Path = Join-Path $Tools "baksmali.jar"
        Uri = "https://github.com/baksmali/smali/releases/download/v3.0.9/baksmali-3.0.9-fat-release.jar"
    }
)

foreach ($download in $downloads) {
    if (Test-Path $download.Path) {
        continue
    }
    Write-Host "Downloading $($download.Uri)"
    Invoke-WebRequest -Uri $download.Uri -OutFile $download.Path
}

Write-Host "CI tools installed in $Tools"
