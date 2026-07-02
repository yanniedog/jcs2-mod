# JCS2 mod workspace

Follow `AGENTS.md` (projectmem memory layer — mandatory). Prefer the projectmem MCP tools (`get_instructions`/`get_summary`/`get_project_map` at session start; `log_issue`/`record_attempt`/`record_fix`/`add_decision`/`add_note` during work); fall back to the `pjm` CLI when MCP is unavailable. Never edit `.projectmem/summary.md` or `events.jsonl` directly.

Build pipeline: `build_native.ps1` (Rust → libjcs2mod.so) → `build_modmenu.ps1` (Java → smali) → `build_apk.ps1` (apktool+sign, runs `scripts/audit_mod_surface.py`). Runtime proofs live in `scripts/runtime_*.ps1` and write artifacts to `_apk_build/`.
