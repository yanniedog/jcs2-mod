#!/usr/bin/env node
/**
 * Cross-platform launcher for cursor-global-workflow scripts.
 * Usage: node scripts/run-workflow.mjs <scriptName> [...args]
 * Requires CURSOR_WORKFLOW_SCRIPTS to point at the workflow scripts directory.
 */
import { spawnSync } from 'node:child_process';
import { join } from 'node:path';

const [scriptName, ...args] = process.argv.slice(2);
if (!scriptName) {
  console.error('Usage: node scripts/run-workflow.mjs <scriptName> [...args]');
  process.exit(1);
}

const baseDir = process.env.CURSOR_WORKFLOW_SCRIPTS;
if (!baseDir) {
  console.error('Error: CURSOR_WORKFLOW_SCRIPTS environment variable is not set.');
  process.exit(1);
}

const res = spawnSync(process.execPath, [join(baseDir, scriptName), ...args], {
  stdio: 'inherit',
  env: process.env,
});
process.exit(res.status ?? 1);
