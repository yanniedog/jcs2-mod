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
