# Google Play Games integration — feasibility for JCS2 Community Mod

## Executive summary

**Full Play Games integration is not viable today** for this modded APK without a
dedicated Play Console game entry, Play Games SDK dependencies, and OAuth setup.
The stock game never used Play Games; leaderboards and replays go through
**TrueAxis server** (`https://connect.trueaxis.com` via native `TaServer_*`).

What **is** implemented in the mod launcher:

- Honest Play Games status text (sign-in unavailable, why leaderboards/replays differ)
- **Export local stats / replay queue** as a ZIP for manual backup or sharing

What would be needed for real Play Games support is documented below.

---

## What the stock game actually uses

| Feature | Mechanism | Location |
| --- | --- | --- |
| Leaderboard scores | TrueAxis server POST/GET | Native `TaServer_PostHighScore*`, `TaServer_GetLeaderboardScoreData` |
| Replay upload/download | TrueAxis server + local queue | Native `Game::SaveScoreAndReplay`, `PostSavedScoreAndReplay` |
| Local stats persistence | Private files + SharedPreferences | `statHeader`, `statsFile`, `stats.bin`, `stats_%d.bin`, `TAS_0`…`TAS_9` |
| Android backup | `TheBackupAgent` | Backs up prefs + `statHeader` / `statsFile` |
| Social | Facebook SDK | Friend picker, not Play Games |
| Google Play Services | AdMob / billing stubs only | No `play-services-games` in APK |

Server endpoints (from `libtrueaxis.so` strings): `https://connect.trueaxis.com/…`

There is **no** existing Play Games sign-in session to hook into.

---

## Play Games API capabilities (reference)

### Leaderboards

- Submit integer/long scores, read rankings, time spans (daily/weekly/all-time)
- Requires Play Console leaderboard IDs linked to the **same package name + signing cert**
- Works independently of TrueAxis server — would be a **parallel** leaderboard, not a mirror of official JCS2 ranks

### Saved Games (cloud save)

- Unstructured binary blob per save slot, **max 3 MB** per file (800 KB cover image limit)
- Multiple save files per player allowed
- Conflict resolution on open (longest playtime strategy, etc.)
- Replays in this game are often **1–3 KB** for ghost headers during testing, but full user-track replays can grow; still usually well under 3 MB
- Format is **proprietary** — Play Games would store opaque bytes; the game would not load them without custom import code

### Snapshots API

- Legacy name for Saved Games in older SDKs; v2 uses Saved Games client

---

## Blockers for this mod APK

### 1. Package identity

- Mod manifest package: **`modded.ycs2`**
- Stock `BuildConfig.APPLICATION_ID`: `com.trueaxis.jetcarstunts2`
- Play Games OAuth and Play Console link credentials to **one package + SHA-1 signing cert**
- The community mod cannot use TrueAxis’s official Play Console Play Games configuration
- Users on the mod cannot appear on official JCS2 Play leaderboards via Play Games alone

### 2. No Play Games SDK in the rebuild pipeline

- Current build: Java mod sources → smali → apktool → sign
- Adding Play Games v2 requires bundling `play-services-games-v2` (+ transitive deps), manifest meta-data (`com.google.android.gms.games.APP_ID`), and ProGuard/R8 rules
- Significant APK size and maintenance cost for a feature that still would not sync with TrueAxis

### 3. TrueAxis server is authoritative for replays

- In-game replay sharing and leaderboard-attached ghosts use TrueAxis backend
- Uploading the same bytes to Play Games Saved Games would **not** make them visible to other players in the stock leaderboard UI
- Modifying upload paths to dual-post would require native hooks and server acceptance (see `REPLAY_IDENTIFICATION.md`)

### 4. Terms and authenticity

- Repackaged/modded clients may violate game ToS for online features
- Play Console policies require you own the app listing you configure

---

## What partial implementation exists

| Component | Purpose |
| --- | --- |
| `PlayGamesAssessment.java` | Central feasibility strings; `PLAY_GAMES_APP_ID` placeholder for future setup |
| `LocalGameDataCatalog.java` | Finds `statHeader`, `statsFile`, `stats*.bin`, etc. under app private storage |
| `GameDataExporter.java` | ZIP + share intent via `FileProvider` (`modded.ycs2.moddata`) |
| Mod launcher UI | “Cloud sync (Play Games)” section with status + export button |

This gives users **manual backup** of local progress and pending upload queue files without claiming false Play Games sync.

---

## Setup requirements (if pursuing real Play Games later)

1. **Google Play Console** — create a game entry for package `modded.ycs2` (or change package to a new ID you control)
2. **Play Games Services** — enable APIs, create leaderboards (one per level/mode or aggregated)
3. **Google Cloud Console** — OAuth 2.0 Android client with package name + **release keystore SHA-1**
4. **APK changes**
   - Add `play-services-games-v2` (and auth) smali/libs or migrate to Gradle-based merge
   - Manifest: `com.google.android.gms.games.APP_ID`, GamesSignIn activity
   - Java: `PlayGames.getGamesSignInClient()`, `submitScore()`, `SnapshotsClient` / Saved Games for replay blobs
5. **Native bridge (optional)** — JNI callbacks when a level completes to push time/score to Play Games in parallel with `TaServer_PostHighScore`
6. **Testing** — internal test track; Play Games does not work with sideloaded debug builds unless test accounts and linked app are configured

Set `PlayGamesAssessment.PLAY_GAMES_APP_ID` to the numeric app ID from Play Console when ready.

---

## Alternatives

| Approach | Leaderboards | Replays | Notes |
| --- | --- | --- | --- |
| **TrueAxis server (stock)** | Yes | Yes | Already in game; mod uses same native path |
| **Play Games (new mod listing)** | Parallel only | Opaque backup | Requires full SDK + Console; no cross-player sync with stock |
| **Firebase Storage + Auth** | Custom | Yes, larger files | Community-controlled; mod already patterns updates via GitHub |
| **Manual export (implemented)** | N/A | Queue files only | ZIP share from launcher |
| **Android Auto Backup** | N/A | Partial | Already enabled via `TheBackupAgent` for prefs + stats files |

---

## Build / verification

After changing modmenu sources or manifest:

```powershell
.\build_modmenu.ps1
.\build_apk.ps1
python scripts\audit_mod_surface.py
```

Install and verify: launcher → **Cloud sync (Play Games)** → export button after playing a level (files appear under app private storage).

---

## Recommendation

- **Do not** ship fake “Play Games connected” UI without SDK + Console setup.
- **Do** use local export + existing TrueAxis online features for players who want backup.
- If the community wants cloud leaderboards independent of TrueAxis, prefer a **small custom backend** or **Firebase** where package/signing restrictions do not apply, rather than Play Games tied to a non-Play-Store mod APK.
