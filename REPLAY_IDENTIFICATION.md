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

## Mod 9 implementation

The modified recorder hooks `Replay::AddNode` with a version-checked,
single-purpose native hook. It calls the stock recorder first and then changes
only the high nibble of byte `+1` in the just-recorded 20-byte replay node.
That nibble is consumed by `Car::UpdateFlaps` during replay playback.

The marker alternates six frames of reserved value `15` with six frames of
value `0`. Stock recording quantizes this field from a value multiplied by
`7`, so value `15` is outside the normal recorded range and creates an
unmistakable repeated extreme-flap pulse in both the original and modified APK.

The hook preserves the lower nibble containing rocket, brake, respawn, and
other recorded flags. It does not write score, timing, transforms, velocity,
checkpoints, physics, or live car controls.

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
