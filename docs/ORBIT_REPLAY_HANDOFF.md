# Task: Make the Orbit replay camera actually render around the car in JCS2's passive "View Replay" viewer

## Context
Repo: `c:\code\jcs2` — an Android APK mod for Jet Car Stunts 2. Native mod logic is a Rust
`#![no_std]` crate in `native_bridge/src/` compiled to `libjcs2mod.so`. Follow `AGENTS.md` /
projectmem: at session start call `get_instructions`, `get_summary`, `get_project_map` (or the
`pjm` CLI if MCP stalls — do **not** get stuck retrying MCP). Log work with `pjm attempt/note/fix`.
This is projectmem issue **#0032**.

The feature: in the passive **View Replay** viewer (Straight On level → detail page →
`VIEW REPLAY`), the "Orbit" camera mode should keep the replay car **dead-center in frame** while
the camera **revolves around it from all sides**.

## The remaining bug (already root-caused — start here, don't re-diagnose the anchor)
The orbit **math and anchor selection are correct**, but the pose we compute **never drives what
the viewer actually renders**. Proof, from `/sdcard/YCS2CommunityMod/logs/orbit_probe.log` during
live playback:

- Our diagnostics report orbit radius = **14.0** units, `inwardDot = 0.999`, `anchorSrc = 9`
  (correct: anchored on the drawn-car pose `REPLAY_TARGET_MFRAME`).
- But the probe reads the **actual `g_pCamera` position ~140 units from the car anchor** on *every*
  sample (e.g. `cam=139,208,-5648` vs `t9=3,180,-5658`). Changing `ORBIT_MIN_RADIUS` (5→14) did
  **not** change the rendered distance predictably.

Conclusion: the stock camera path rebuilds the view/projection matrix **after** all our write and
re-assert hooks, so our managed pose exists only in our diagnostics. The passive viewer's render is
sampling a camera object (or a camera field/offset) that we are **not** the last writer of. Note:
`capture_free_camera_frame` reads `g_pCamera` at the assumed layout (right@0, up@4, fwd@8, pos@12,
stride-4 floats) correctly for the *start* pose, so the write layout is probably right for
`g_pCamera` — the issue is *which object/matrix the render samples*, or that it's recomputed after
us.

## Your job
Find the camera object + memory offset (or matrix) that the passive View Replay viewer's projection
**actually samples at render time**, and make our managed Orbit pose the **last writer** of it
before the 3D pass (`World::Render`). Equivalently: intercept and override `CameraPath`'s matrix
output rather than writing the camera object after the fact.

## Key files & symbols
- `native_bridge/src/free_camera.rs` — camera hooks & math. Relevant:
  - `hooked_game_update_camera` (writes our frame to `g_pCamera` / `CAMERA_UPDATE_THIS`, then calls
    `orbit_probe_log`).
  - `hooked_camera_update` (Camera::Update hook — currently re-pins to `REPLAY_TARGET_MFRAME`).
  - `hooked_camera_path_update` (CameraPath::Update — currently re-asserts our frame after the stock
    path).
  - `hooked_world_render` (World::Render — currently only draws the viewer car; likely the right
    place to assert the camera LAST, if the view matrix is read from the camera object at/after this
    point).
  - `write_free_camera_frame` / `capture_free_camera_frame` (the stride-4 layout),
    `choose_replay_camera_anchor` (anchor priority; `anchorSrc` meanings are documented in the
    doc-comment on `ORBIT_ANCHOR_SOURCE`), `orbit_probe_log` (probe format).
- `native_bridge/src/replay_camera.rs` — mode math (`update`, `write_look_at`, `ORBIT_MIN_RADIUS`,
  `camera_target`). The math is fine; treat as reference.
- `native_bridge/src/swarm.rs` — `VIEW_REPLAY_SESSION`, `REPLAY_TARGET_MFRAME` capture in
  `hooked_set_velocities_to_move_to_frame`, `hooked_replay_update`.

## Suggested approach
1. Disassemble `libtrueaxis.so` to find how the viewer builds the view/projection matrix during a
   passive replay. Use the rust llvm tools: `rustup component add llvm-tools`, then
   `llvm-objdump`/`llvm-nm` (see the existing RE notes in `pjm show` about `Camera::Update`,
   `CameraPath::Update`, `Game::Render`, `World::Render`, `Car::RenderGhost`). Identify **which
   object and offset** the view matrix is read from at render, and whether it's cached (computed
   inside `CameraPath::Update` / `Camera::Update`) vs read lazily from `g_pCamera` at render.
2. Make our orbit pose win: write it to the correct object/offset as the last step before the render
   samples it (candidate: top of `hooked_world_render` before `original(world)`, or by overriding
   the matrix `CameraPath::Update` produces).
3. Confirm with `orbit_probe.log`: the actual rendered camera position must become
   ~`ORBIT_MIN_RADIUS` from `t9`, not ~140. Then tune `ORBIT_MIN_RADIUS` (currently 8.0) and
   `ORBIT_INITIAL_ELEVATION` (0.5) so the car is centered and reasonably sized, and clears track
   geometry.

## Build & test loop (scripted, repeatable — use it, don't navigate menus by hand)
```
powershell -File .\build_native.ps1        # Rust -> libjcs2mod.so (fast)
powershell -File .\build_apk.ps1           # apktool + sign -> jcs2-mod.apk (~3 min, run backgrounded)
powershell -Command "& .\scripts\runtime_replay_freecam_gesture_test.ps1 -UsePassiveReplay:$true"
```
- Emulator: AVD `jcs2-llm-runtime`, serial `emulator-5562`. If it's gone, start headless via
  `scripts/lib/Jcs2Emu.ps1` (`Start-Jcs2Emulator -Headless`, then `Wait-Jcs2DeviceBoot`, then
  `Set-Jcs2RuntimeDisplay`) and wait for `getprop sys.boot_completed == 1` before installing
  (installs fail with "device is still booting").
- Artifacts land in `_apk_build/runtime-freecam-gestures/<timestamp>/` (filmstrip `07-strip-*.png`,
  quadrant shots `06a..06d`, `public_ycs2_mod_debug.log`).
- Live diagnostics on device: `adb shell tail /sdcard/YCS2CommunityMod/logs/orbit_probe.log` and
  grep `orbit_diag` in `.../ycs2_mod_debug.log`.
- The harness now OCR-gates the `VIEW REPLAY` tap (button is inside the GL SurfaceView, appears only
  after the leaderboard connects) — keep that.

## Definition of done
On the emulator, in passive View Replay with Orbit mode, screenshots across a full revolution show
the replay car **centered in the frame from every azimuth** (back/side/front/side), and
`orbit_probe.log` confirms the **actual** rendered `g_pCamera` sits ~`ORBIT_MIN_RADIUS` from the car
anchor (not the stock ~140u). Log the fix with `pjm fix` and don't commit unless asked.

## Do not regress
The anchor-selection fix is correct — keep `anchorSrc=9` (target `REPLAY_TARGET_MFRAME` in
`VIEW_REPLAY_SESSION`) and the `VIEW_REPLAY_PENDING` entry guard. The problem is purely that our pose
isn't the one that renders.
