# jcs2-mod PR workflow

Human workflows: **PR → CI + bot QA gates → squash merge → automatic APK release**.

## 1. Open a PR

Push a branch and open a PR to `main`. Conventional titles (`fix:`, `feat:`, etc.) are fine.

Chore PRs (`chore:` / `chore(scope):`) and bot-authored PRs skip bot gates automatically.

## 2. PR CI (`pr-ci`)

The `pr-ci` workflow builds the native bridge, mod launcher smali, and runs the mod surface audit. Required once branch protection is enabled.

## 3. Bot presence gate (`bot-presence-gate`)

Waits until **gemini**, **codex**, and **sourcery** have posted on the PR since the wait anchor. Cursor Auto Review posts as `github-actions[bot]` with marker `<!-- cursor-auto-review -->` and is available as optional key **cursor**.

Required bot logins (aliases in `scripts/lib/bot-wait-config.mjs`):

| Key | GitHub logins |
|-----|---------------|
| gemini | `gemini-code-assist[bot]`, `google-github-actions-bot[bot]`, … |
| codex | `chatgpt-codex-connector[bot]` |
| sourcery | `sourcery-ai[bot]` |
| cursor | `github-actions[bot]` with `<!-- cursor-auto-review -->` |

Local pre-merge check:

```sh
npm run wait-for-bots -- --watch --pr <n>
```

Exit **0** = ready. Exit **2** = still waiting. Exit **1** = error or missing bots at cap.

Env: `JCS2_BOT_WAIT_REQUIRED=gemini,codex,sourcery` (fallback: `AR_BOT_WAIT_REQUIRED`, `BOT_WAIT_REQUIRED`). Add `cursor` only after the `cursor-auto-review` workflow is stable.

## 4. Bot feedback gate (`bot-feedback-gate`)

All substantive review threads must be **resolved** on GitHub before merge.

```sh
npm run pr:bot-feedback-check -- --pr <n>
```

## 5. Claude Code (optional)

**Claude is not required** for merge. Unlike Gemini Code Assist / Sourcery marketplace apps, Claude Code reviews only when you install [`anthropics/claude-code-action`](https://github.com/anthropics/claude-code-action) and configure a workflow. When active, it posts as `claude[bot]`.

Aliases are defined in `scripts/lib/bot-wait-config.mjs` under `claude` for optional local checks (`--require-bots gemini,codex,sourcery,claude`), but `DEFAULT_REQUIRED_KEYS` excludes it.

## 6. Aggregate gate check

```sh
npm run pr:gates:check -- --pr <n>
npm run pr:gates:check -- --watch --pr <n>
```

## 7. Merge

When all gates pass:

```sh
gh pr merge <n> --auto --squash --delete-branch
```

See [`.github/MERGE_POLICY.md`](.github/MERGE_POLICY.md).

## 8. APK release (automatic)

`release-apk` runs on `pull_request_target` when a PR is **merged** to `main`. It checks out `main`, builds a signed APK, and publishes a GitHub Release with `jcs2-update.json`. No manual release step needed after merge.

## Enable branch protection (one-time)

```sh
npm run github:bot-gates:operator          # print policy + verify local scripts
npm run repo-merge-settings:apply            # squash-only + auto-merge
npm run branch-protection:apply              # legacy API
# OR import .github/rulesets/main-bot-gates.json via GitHub UI
```

Operator doc: [`docs/GITHUB_RULESET_IMPORT.md`](docs/GITHUB_RULESET_IMPORT.md).

## Secrets

| Name | Required | Purpose |
|------|----------|---------|
| `BOT_GATE_TOKEN` | Optional | PAT with `pull_requests: read` if `GITHUB_TOKEN` quota is tight |
| `JCS2_KEYSTORE_*`, `JCS2_BASE_APK_URL` | Release only | See `docs/github-release-automation.md` |

## npm scripts

| Script | Purpose |
|--------|---------|
| `npm run wait-for-bots` | Poll until required bots posted |
| `npm run pr:bot-feedback-check` | Thread closure gate |
| `npm run pr:gates:check` | All merge gates |
| `npm run branch-protection:apply` | Apply legacy branch protection |
| `npm run repo-merge-settings:apply` | Squash-only repo settings |
| `npm run github:bot-gates:operator` | Setup helper + local verify |
