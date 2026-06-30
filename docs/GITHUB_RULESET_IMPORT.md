# Import GitHub ruleset for `main` (mod CI + bot gates)

One-time operator setup for **jcs2-mod** branch protection.

**Operator script:**

```sh
npm run github:bot-gates:operator
npm run github:bot-gates:operator -- --verify-pr <n>
```

**Artifact:** [`.github/rulesets/main-bot-gates.json`](../.github/rulesets/main-bot-gates.json)

| Setting | Value |
|---------|-------|
| Required checks | `pr-ci`, `bot-feedback-gate`, `bot-presence-gate` (strict / up-to-date) |
| Conversation resolution | Required |
| Merge method | Squash only |
| GitHub Actions bypass | Always (`actor_id` 15368) — for `release-apk` and future automation |

Bot skip policy (chore + bot-authored PRs) lives in `scripts/lib/pr-gate-exempt.mjs`, not in the ruleset JSON.

## Import steps

1. Open **Settings → Rules → Rulesets → New ruleset → Import a ruleset**.
2. Select [`.github/rulesets/main-bot-gates.json`](../.github/rulesets/main-bot-gates.json).
3. Review:
   - **Target branches:** `refs/heads/main` and `~DEFAULT_BRANCH`
   - **Required checks:** `pr-ci`, `bot-presence-gate`, `bot-feedback-gate`
   - **Bypass list:** GitHub Actions, mode **Always**
4. **Save** and set enforcement to **Active**.
5. If legacy branch protection exists on `main`, delete it (**Settings → Branches**) to avoid duplicate enforcement.

## Alternative: legacy branch protection API

```sh
npm run branch-protection:apply
npm run branch-protection:apply -- --dry-run
```

This merges `pr-ci` + bot gates into existing required checks. No Actions bypass — prefer ruleset import when automation pushes to `main`.

## Verify

```sh
npm run pr:gate-exempt-policy:verify
npm run pr:gate-logic:verify
npm run github:bot-gates:operator
```

After protection is active on a real PR:

```sh
npm run pr:gates:check -- --pr <n>
gh pr checks <n>
```

## Related

- [`WORKFLOW.md`](../WORKFLOW.md) — full PR → merge → release flow
- [`.github/MERGE_POLICY.md`](../.github/MERGE_POLICY.md) — squash merge policy
- [`docs/github-release-automation.md`](github-release-automation.md) — APK release on merge
