param(
    [string]$CommitMessage = "",
    [switch]$SkipBuild,
    [switch]$SkipPush,
    [switch]$SkipWorkflow
)

$ErrorActionPreference = "Stop"
$Root = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $Root

Write-Host "Preparing next release version..."
& (Join-Path $Root "scripts\ci_prepare_release.ps1")
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

$versionName = (Select-String -Path (Join-Path $Root "decompiled\apktool.yml") -Pattern 'versionName:\s*(\S+)' |
    ForEach-Object { $_.Matches[0].Groups[1].Value })
if (-not $versionName) {
    throw "Could not read versionName from decompiled/apktool.yml"
}

if (-not $SkipBuild) {
    Write-Host "Building signed release APK..."
    & (Join-Path $Root "build_apk.ps1")
    if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
}

$status = git status --porcelain
if (-not $status) {
    Write-Host "No file changes to commit."
} else {
    if (-not $CommitMessage) {
        $CommitMessage = "Gate replay freecam to post-race replay and fix smoke test ($versionName)"
    }
    git add `
        decompiled/apktool.yml `
        decompiled/lib/arm64-v8a/libjcs2mod.so `
        decompiled/smali/com/trueaxis/modmenu `
        decompiled/res `
        modmenu_src `
        mod_assets `
        native_bridge `
        scripts/audit_mod_surface.py `
        scripts/runtime_smoke_test.ps1 `
        scripts/runtime_replay_freecam_gesture_test.ps1 `
        publish_mod_release.ps1 `
        pull_mod_debug_log.ps1 `
        rebuild_install_mod.ps1
    git commit -m $CommitMessage
    if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
}

if (-not $SkipPush) {
    Write-Host "Pushing to origin/main..."
    git push origin HEAD:main
    if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
}

if (-not $SkipWorkflow) {
    $gh = Get-Command gh -ErrorAction SilentlyContinue
    if (-not $gh) {
        throw "GitHub CLI (gh) not found; cannot trigger release-apk workflow."
    }
    Write-Host "Triggering release-apk workflow..."
    gh workflow run release-apk
    if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
    Write-Host "Release workflow started. Track progress with: gh run list --workflow=release-apk"
}

Write-Host "Prepared $versionName for GitHub release."
