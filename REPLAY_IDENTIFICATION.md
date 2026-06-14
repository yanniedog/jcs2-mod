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

## Mod 8 decision

No replay marker or replay-byte mutation is included in `1.0.24-mod8`.

Changing recorded control fields is not acceptable for release until testing
proves all of the following:

1. Submitted leaderboard time and score bytes are unchanged.
2. Recorded transforms, velocity, checkpoints, physics, and live controls are unchanged.
3. The server accepts marked replay uploads.
4. Both stock and marked replays remain downloadable and viewable.
5. The four stock/mod recorder/viewer combinations produce the intended visuals.

Conditional replay flames are also deferred. The retained blue shader therefore
continues to identify all gameplay and replay rendering inside the modified APK,
while the original APK continues to use its normal red/orange flame.
