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
        Uri = "https://repo.maven.apache.org/maven2/org/smali/baksmali/2.5.2/baksmali-2.5.2.jar"
    }
)

foreach ($download in $downloads) {
    if (Test-Path $download.Path) {
        continue
    }
    Write-Host "Downloading $($download.Uri)"
    Invoke-WebRequest -Uri $download.Uri -OutFile $download.Path
}

$BaksmaliLib = Join-Path $Tools "baksmali_lib"
New-Item -ItemType Directory -Path $BaksmaliLib -Force | Out-Null
$baksmaliDependencies = @(
    @{
        Path = Join-Path $BaksmaliLib "dexlib2-2.5.2.jar"
        Uri = "https://repo.maven.apache.org/maven2/org/smali/dexlib2/2.5.2/dexlib2-2.5.2.jar"
    },
    @{
        Path = Join-Path $BaksmaliLib "util-2.5.2.jar"
        Uri = "https://repo.maven.apache.org/maven2/org/smali/util/2.5.2/util-2.5.2.jar"
    },
    @{
        Path = Join-Path $BaksmaliLib "guava-27.1-android.jar"
        Uri = "https://repo.maven.apache.org/maven2/com/google/guava/guava/27.1-android/guava-27.1-android.jar"
    },
    @{
        Path = Join-Path $BaksmaliLib "jcommander-1.64.jar"
        Uri = "https://repo.maven.apache.org/maven2/com/beust/jcommander/1.64/jcommander-1.64.jar"
    },
    @{
        Path = Join-Path $BaksmaliLib "failureaccess-1.0.1.jar"
        Uri = "https://repo.maven.apache.org/maven2/com/google/guava/failureaccess/1.0.1/failureaccess-1.0.1.jar"
    },
    @{
        Path = Join-Path $BaksmaliLib "listenablefuture-9999.0-empty-to-avoid-conflict-with-guava.jar"
        Uri = "https://repo.maven.apache.org/maven2/com/google/guava/listenablefuture/9999.0-empty-to-avoid-conflict-with-guava/listenablefuture-9999.0-empty-to-avoid-conflict-with-guava.jar"
    },
    @{
        Path = Join-Path $BaksmaliLib "jsr305-3.0.2.jar"
        Uri = "https://repo.maven.apache.org/maven2/com/google/code/findbugs/jsr305/3.0.2/jsr305-3.0.2.jar"
    },
    @{
        Path = Join-Path $BaksmaliLib "checker-compat-qual-2.5.5.jar"
        Uri = "https://repo.maven.apache.org/maven2/org/checkerframework/checker-compat-qual/2.5.5/checker-compat-qual-2.5.5.jar"
    },
    @{
        Path = Join-Path $BaksmaliLib "error_prone_annotations-2.2.0.jar"
        Uri = "https://repo.maven.apache.org/maven2/com/google/errorprone/error_prone_annotations/2.2.0/error_prone_annotations-2.2.0.jar"
    },
    @{
        Path = Join-Path $BaksmaliLib "j2objc-annotations-1.1.jar"
        Uri = "https://repo.maven.apache.org/maven2/com/google/j2objc/j2objc-annotations/1.1/j2objc-annotations-1.1.jar"
    },
    @{
        Path = Join-Path $BaksmaliLib "animal-sniffer-annotations-1.17.jar"
        Uri = "https://repo.maven.apache.org/maven2/org/codehaus/mojo/animal-sniffer-annotations/1.17/animal-sniffer-annotations-1.17.jar"
    }
)

foreach ($download in $baksmaliDependencies) {
    if (Test-Path $download.Path) {
        continue
    }
    Write-Host "Downloading $($download.Uri)"
    Invoke-WebRequest -Uri $download.Uri -OutFile $download.Path
}

Write-Host "CI tools installed in $Tools"
