# Replay Identification Findings

## Stock APK capability

The original APK does not contain a replay-origin flag, modified-client flag, or
blue-flame replay path. A replay cannot make the original APK render the mod's
blue shader because that shader and its color override do not exist in the
original APK.

The original replay player does render ordinary recorded visual/control state.
Static reverse mapping shows `Replay::Update` driving paths that include:

- `Car::UpdateRocket`
- `Car::UpdateFlaps`
- brake and skid-mark state
- car pose and recorded controls

This means a mod-origin replay could be visibly identifiable in the original
APK only by encoding an unmistakable cadence in stock-supported replay fields,
such as a repeated rocket/flap pulse. It cannot be identified by a new color or
new graphic in an unmodified original APK.

## Mod 10 implementation

The modified recorder runs a single-purpose native replay-buffer worker. It
marks only small incremental buffer growth produced by live recording and skips
the large jumps produced by replay loading/decompression. The game increments
the replay size before it finishes writing a node, so the worker re-marks a
small recent live-recording window to ensure the final captured node data keeps
the marker.

The marker changes byte `+1` of newly recorded 20-byte replay nodes. Its high
nibble is consumed by `Car::UpdateFlaps` during replay playback. Its low
flap-driver bits `0x03` are forced to neutral so the recorded flap surfaces do
not respond to actual rocket/air-brake/steering mechanics. The structural
replay flags in bits `0x0c`, including brake/resting and respawn handling, are
preserved.

The marker alternates six frames of reserved value `15` with six frames of
value `0`. This makes every flap surface move together between its two visible
extremes for the full replay.
Stock recording quantizes the high-nibble field from a value multiplied by `7`,
so value `15` is outside the normal recorded range and creates an unmistakable
repeated extreme-flap pulse in both the original and modified APK. The flap
cadence no longer preserves rocket/air-brake flap-driver bits, because those
bits can make `Car::UpdateFlaps` blend the marker with recorded driving inputs.
Static reverse-engineering confirmed
`Replay::ReplayCompress` carries the high nibble into compressed nodes and
`Replay::ReplayDecompress` restores and interpolates that high-nibble field.

The hook preserves pose/velocity deltas, rotation, checkpoint data, timing, and
the replay structural flags needed for brake/resting and respawn behavior. It
does not write score, timing, transforms, velocity, checkpoints, physics, or live
car controls.
The marker worker is best-effort. If it cannot be started, game
startup continues so the experimental replay marker cannot make the APK
unusable. Native patches are applied once from the game activity, after leaving
the community launcher. Runtime testing is required to confirm whether a replay
was marked.

Changing recorded control fields is not acceptable for release until testing
proves all of the following:

1. Submitted leaderboard time and score bytes are unchanged.
2. Recorded transforms, velocity, checkpoints, physics, and live controls are unchanged.
3. The server accepts marked replay uploads.
4. Both stock and marked replays remain downloadable and viewable.
5. The four stock/mod recorder/viewer combinations produce the intended visuals.

Conditional replay flames remain deferred. The retained blue shader therefore
continues to identify all gameplay and replay rendering inside the modified APK,
while the original APK continues to use its normal red/orange flame.
