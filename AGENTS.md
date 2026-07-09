# Agent instructions (all AI tools)

This repo uses **projectmem** as its mandatory memory layer. Before any work:

1. Read `.projectmem/AI_INSTRUCTIONS.md` (workflow rules), `.projectmem/summary.md` (distilled project state — do NOT re-derive it by rescanning sources), and `.projectmem/PROJECT_MAP.md` (structure).
2. Verify the summary describes THIS repo (JCS2 Android mod workspace); if your memory tooling returns a different project, it is mis-scoped — fall back to the repo-local CLI: `pjm` (or `python -m projectmem.cli`).

During work, log through projectmem instead of ad-hoc notes:

- bug found → `pjm log "<summary>" --at "<file:line>"` (MCP: `log_issue`)
- each fix attempt → `pjm attempt "<summary>" --worked|--partial|--failed` (MCP: `record_attempt`)
- confirmed fix → `pjm fix "<summary>"` (MCP: `record_fix`)
- design choice → `pjm decision "<summary>"`; gotcha/setup detail → `pjm note "<summary>"`

Batch these at natural checkpoints (end of a fix, before commit) rather than interrupting an active build/test loop.

Never edit `.projectmem/summary.md` or `events.jsonl` directly — they are derived/append-only; write via the CLI/MCP tools and the summary regenerates. `PROJECT_MAP.md` may be edited directly. Check `.projectmem/issues/` before re-attempting anything that looks familiar — failed attempts are recorded to stop you from repeating them.

**Memory must never block work.** projectmem calls are best-effort bookkeeping: if a memory read/write fails, is denied, or would interrupt an active build/test/debug loop, continue the task and batch the log entries at the next natural checkpoint (end of fix, before commit) with single-line `pjm` CLI calls (non-interactive, no prompts). Do not retry a rejected memory call inline, and never make the user wait on memory I/O.

## Cursor Cloud specific instructions

Cloud VMs are **Linux/x86_64**, but the build scripts (`build_native.ps1`, `build_modmenu.ps1`, `build_apk.ps1`, everything under `scripts/*.ps1`) are **Windows/PowerShell** (`.exe` paths, `pwsh`) and do not run here. On Linux, invoke the underlying tools directly (all cross-platform). The startup update script only refreshes fast deps (`rustup target add aarch64-linux-android`, `npm install`); the Android/Java tooling below is fetched on demand.

Toolchain present: Rust 1.91.1 (pinned by `rust-toolchain.toml`), JDK 21, Python 3.12, Node (system `node` is v22 at `/exec-daemon/node` and shadows `nvm`; `engines` wants >=24 but the pure-JS scripts run fine on 22 — `nvm use 24` if strict compliance is needed).

Services / components and how to build them on Linux:

- Rust native bridge (`libjcs2mod.so`, the core mod): `cargo fmt --manifest-path native_bridge/Cargo.toml -- --check` (lint) and `cargo build --manifest-path native_bridge/Cargo.toml --release --target aarch64-linux-android` (build; stub libs in `native_bridge/stublibs/` are committed). Gotcha: the Linux-built `.so` is **not** byte-identical to the committed Windows-CI `.so`, so CI's "verify generated outputs" `.so` check will differ if you rebuild on Linux — do not recommit it. It is `#![no_std]` with its own panic handler, so `cargo test` fails (duplicate `panic_impl`); there are no host tests.
- Java mod launcher -> smali: needs `tools/android-34.jar` (SDK platform), `tools/r8.jar`, `tools/baksmali.jar` + `tools/baksmali_lib/*.jar` (URLs/versions in `scripts/ci_install_tools.ps1`; platform via `sdkmanager "platforms;android-34" "build-tools;36.1.0"`). Replicate `build_modmenu.ps1`: javac (`-source 8 -target 8`, classpath android.jar, plus a `Jetcarstunts2Activity` stub) -> `jar` -> `java -cp r8.jar com.android.tools.r8.D8 --min-api 15 --lib android-34.jar --output <output_dir> <input_jar>` -> baksmali `d <classes.dex> -o <output_dir>` -> strip baksmali numeric const value-comments. Result is **byte-identical** to committed `decompiled/smali/com/trueaxis/modmenu`.
- Python anti-cheat audit: `python3 scripts/audit_mod_surface.py [--skip-local-assets | --apk jcs2-mod.apk]`.
- Node PR-gate automation self-tests (no network): `npm run pr:gate-logic:verify`, `npm run pr:gate-exempt-policy:verify`. The other `pr:*`/`github:*` scripts hit the GitHub API.

Full APK build (`build_apk.ps1` flow, replicated on Linux): `apktool b decompiled -o unsigned.apk` -> `zipalign -f 4 unsigned.apk aligned.apk` -> `apksigner sign --ks jcs2.keystore --ks-pass pass:android --ks-key-alias jcs2local --out jcs2-mod.apk aligned.apk`. Requires `decompiled/assets/` (large proprietary base-game media, **gitignored**). Restore it from a release APK (no secret needed, `gh` has read access): `gh release download <latest jcs-mod tag> --pattern '*.apk' --dir _apk_build/base` then extract its `assets/` into `decompiled/assets/` (mirrors `scripts/ci_restore_assets.ps1`; also settable via `JCS2_BASE_APK_URL`). Output `jcs2-mod.apk` = package `modded.ycs2`.

Runtime / Android emulator: a headless emulator is provisioned on Linux via `scripts/linux_android_emulator.sh` (SDK at `$HOME/android-sdk`, AVD `jcs2-emu`, `system-images;android-34;google_apis;x86_64`). Subcommands: `install` (idempotent), `boot`, `status`, `run [apk]`, `shot [png]`, `stop`. Gotchas: (1) Cloud VMs have **no `/dev/kvm` / CPU virtualization**, so it runs in software (TCG) mode (`-accel off -gpu swiftshader_indirect`) — cold boot takes several minutes, APK install ~2-3 min, and heavy 3D gameplay ("Start game") is not expected to be interactive; the mod launcher (Java/UI) and APK install/launch work. (2) This image does **not** reliably set `sys.boot_completed` under TCG — treat "`pm list packages` returns >0 and `init.svc.bootanim=stopped`" as system-ready (see the `status` subcommand). (3) The APK ships **arm64-v8a only**; the x86_64 image runs it through the built-in `libndk_translation.so` ARM bridge (its abilist includes `arm64-v8a`), so no separate arm image is needed. For real gameplay use a physical device or the Windows harness (`docs/LLM_ANDROID_EMULATOR_RUNTIME.md`).
