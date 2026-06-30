# GitHub APK Release Automation

The repository has GitHub Actions workflows:

- `pr-ci`: runs on pull requests — Rust/native/smali build + mod surface audit (required check: **`pr-ci`**).
- `pr-bot-presence-gate` / `pr-bot-feedback-check`: bot QA gates (required checks: **`bot-presence-gate`**, **`bot-feedback-gate`**). See [`WORKFLOW.md`](../WORKFLOW.md).
- `release-apk`: runs after a pull request is **squash-merged** into `main` and creates a signed APK plus a GitHub Release.

## Large APK hosting and app updates

Do not commit APK binaries to git. The APK is roughly 160 MB, which is too large
for normal repository files. Instead, `release-apk` uploads the APK as a GitHub
Release asset, where large binary artifacts are expected.

Every release also uploads a tiny `jcs2-update.json` asset. The app checks this
stable URL:

`https://github.com/yanniedog/jcs2-mod/releases/latest/download/jcs2-update.json`

That manifest points at the release APK asset and includes the package name,
version name/code, APK size, and SHA-256. The app can automatically check,
download, verify, and open the Android installer. Android still requires the
user to approve sideload installation; silent self-install is not available to a
normal APK.

## Required repository setup

Add these under GitHub repository settings:

- `JCS2_KEYSTORE_BASE64` secret: base64 text for `jcs2.keystore`.
- `JCS2_KEYSTORE_PASS` secret: keystore/key password.
- `JCS2_BASE_APK_URL` repository variable or secret: URL to a base APK that
  contains the stock `assets/` directory. This is needed for the first automated
  release because large game assets are intentionally ignored by git.

After the first successful automated release, the workflow can usually restore
assets from the latest release APK if `JCS2_BASE_APK_URL` is not set.

## Versioning

The release workflow calculates the next number from existing
`jcs-mod-v0.0.N` / `jsc-mod-v0.0.N` tags, GitHub Releases, and the current
`decompiled/apktool.yml` mod suffix. It then builds:

- APK `versionName`: `1.0.24-modN`
- APK `versionCode`: `28 + N`
- Release APK asset: `jcs2-mod.apk`
- Release tag: `jcs-mod-v0.0.N`
