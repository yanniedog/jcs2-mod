# GitHub APK Release Automation

The repository has two GitHub Actions workflows:

- `pr-ci`: runs on pull requests and checks the mod surface without requiring
  signing secrets or the ignored `decompiled/assets/` tree.
- `release-apk`: runs after a pull request is merged into `main` and creates a
  signed APK plus a GitHub Release.

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
- Release tag: `jcs-mod-v0.0.N`
