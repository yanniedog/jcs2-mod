# Merge policy (jcs2-mod)

All PRs to `main` use **squash merge** (auto-merge when enabled).

## Merge command

After `npm run pr:gates:check -- --pr <n>` exits **0**:

```sh
gh pr merge <n> --auto --squash --delete-branch
```

Do not merge on CI green alone — complete bot wait and thread resolution per `WORKFLOW.md`.

## Repository settings (squash-only)

Apply via API (admin token):

```sh
npm run repo-merge-settings:apply
```

| Setting | Value |
|---------|-------|
| `allow_squash_merge` | true |
| `allow_merge_commit` | false |
| `allow_rebase_merge` | false |
| `delete_branch_on_merge` | true |
| `allow_auto_merge` | true |

## Branch protection / ruleset

Required checks on `main`:

- `pr-ci` — mod build + surface audit
- `bot-presence-gate` — gemini, codex, sourcery posted
- `bot-feedback-gate` — review threads resolved

Enable via:

```sh
npm run branch-protection:apply
```

Or import [`.github/rulesets/main-bot-gates.json`](rulesets/main-bot-gates.json) — see [`docs/GITHUB_RULESET_IMPORT.md`](../docs/GITHUB_RULESET_IMPORT.md).

## Release after merge

Squash-merging a PR to `main` triggers `release-apk`, which builds a signed APK and publishes a GitHub Release. See [`docs/github-release-automation.md`](../docs/github-release-automation.md).
