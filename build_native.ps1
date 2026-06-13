# Builds libjcs2mod.so for arm64-v8a and copies it into decompiled/lib.
# Produces local stub libdl.so/libc.so first so the real .so records DT_NEEDED
# for them (otherwise Android's linker refuses to load it).
$ErrorActionPreference = "Stop"
$Root = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $Root

$Target = "aarch64-linux-android"
$StubDir = Join-Path $Root "native_bridge\stublibs"
$StubSrc = Join-Path $Root "native_bridge\stubs"
New-Item -ItemType Directory -Force -Path $StubDir | Out-Null

function Build-Stub($soname, $src) {
    Write-Host "Building stub $soname ..."
    & rustc --edition 2021 --target $Target --crate-type cdylib `
        -C panic=abort -C linker=rust-lld `
        -C link-arg=-shared -C "link-arg=-soname=$soname" `
        -o (Join-Path $StubDir $soname) (Join-Path $StubSrc $src)
    if ($LASTEXITCODE -ne 0) { throw "stub $soname build failed" }
}

Build-Stub "libdl.so" "stub_dl.rs"
Build-Stub "libc.so"  "stub_c.rs"

Write-Host "Building libjcs2mod.so ..."
Set-Location (Join-Path $Root "native_bridge")
& cargo build --release --target $Target
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
Set-Location $Root

$Out = Join-Path $Root "native_bridge\target\$Target\release\libjcs2mod.so"
$Dest = Join-Path $Root "decompiled\lib\arm64-v8a\libjcs2mod.so"
Copy-Item $Out $Dest -Force
Write-Host "Copied $Out -> $Dest"
