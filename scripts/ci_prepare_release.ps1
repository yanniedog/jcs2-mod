$ErrorActionPreference = "Stop"

$Root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
Set-Location $Root

function Get-ModNumberFromTag($tag) {
    if ($tag -match '^jcs-mod-v0\.0\.(\d+)$') { return [int]$Matches[1] }
    if ($tag -match '^jsc-mod-v0\.0\.(\d+)$') { return [int]$Matches[1] }
    return $null
}

function Add-Number([System.Collections.Generic.List[int]]$numbers, $value) {
    if ($null -ne $value) {
        $numbers.Add([int]$value) | Out-Null
    }
}

$numbers = [System.Collections.Generic.List[int]]::new()

git fetch --tags --force | Out-Host
foreach ($tag in @(git tag --list "jcs-mod-v0.0.*") + @(git tag --list "jsc-mod-v0.0.*")) {
    Add-Number $numbers (Get-ModNumberFromTag $tag)
}

if ($env:GH_TOKEN) {
    $releaseTags = gh release list --limit 100 --json tagName --jq '.[].tagName' 2>$null
    foreach ($tag in $releaseTags) {
        Add-Number $numbers (Get-ModNumberFromTag $tag)
    }
}

$apktool = Join-Path $Root "decompiled\apktool.yml"
$versionText = Get-Content $apktool -Raw
if ($versionText -match 'versionName:\s*1\.0\.24-mod(\d+)') {
    Add-Number $numbers ([int]$Matches[1])
}

$nextMod = 1
if ($numbers.Count -gt 0) {
    $nextMod = (($numbers | Measure-Object -Maximum).Maximum + 1)
}

$versionName = "1.0.24-mod$nextMod"
$versionCode = 28 + $nextMod
$tagName = "jcs-mod-v0.0.$nextMod"
$apkName = "jcs2-mod.apk"
$releaseTitle = "JCS2 Community Mod v0.0.$nextMod"

$versionText = $versionText -replace '(?m)^(\s*)versionCode:\s*\d+', "`${1}versionCode: $versionCode"
$versionText = $versionText -replace '(?m)^(\s*)versionName:\s*\S+', "`${1}versionName: $versionName"
Set-Content -LiteralPath $apktool -Value $versionText -Encoding UTF8

if ($env:GITHUB_OUTPUT) {
    Add-Content -LiteralPath $env:GITHUB_OUTPUT -Value "mod_number=$nextMod"
    Add-Content -LiteralPath $env:GITHUB_OUTPUT -Value "version_name=$versionName"
    Add-Content -LiteralPath $env:GITHUB_OUTPUT -Value "version_code=$versionCode"
    Add-Content -LiteralPath $env:GITHUB_OUTPUT -Value "tag_name=$tagName"
    Add-Content -LiteralPath $env:GITHUB_OUTPUT -Value "apk_name=$apkName"
    Add-Content -LiteralPath $env:GITHUB_OUTPUT -Value "release_title=$releaseTitle"
}

Write-Host "Prepared $versionName ($versionCode), release tag $tagName"
