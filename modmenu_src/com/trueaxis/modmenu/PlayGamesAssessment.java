package com.trueaxis.modmenu;

import android.content.Context;

/**
 * Documents Google Play Games feasibility for the community mod APK.
 * The stock game uses TrueAxis server leaderboards ({@code TaServer_*}) rather
 * than Play Games Services; this class does not call any Play Games APIs.
 */
final class PlayGamesAssessment {
    /** Play Console OAuth client ID — empty until a mod-specific game entry exists. */
    static final String PLAY_GAMES_APP_ID = "";

    /** Saved Games blob limit enforced by Play Games Services. */
    static final int PLAY_GAMES_SAVED_GAME_MAX_BYTES = 3 * 1024 * 1024;

    private PlayGamesAssessment() {
    }

    static boolean isPlayGamesConfigured() {
        return PLAY_GAMES_APP_ID.length() > 0;
    }

    static String packageName(Context context) {
        return context.getPackageName();
    }

    static String leaderboardFeasibility() {
        return "Not integrated. Official JCS2 posts scores to TrueAxis "
                + "(connect.trueaxis.com), not Play Games. A separate Play Console "
                + "entry for package modded.ycs2 with its own leaderboard IDs would "
                + "be required; it cannot merge with stock leaderboards.";
    }

    static String replayFeasibility() {
        return "Not integrated. Replays upload to TrueAxis via TaServer; Play Games "
                + "Saved Games allows up to 3 MB per file but uses a proprietary "
                + "replay format and would not sync with in-game replay sharing.";
    }

    static String signInStatus(Context context) {
        if (isPlayGamesConfigured()) {
            return "Play Games app ID configured for " + packageName(context)
                    + " — SDK wiring still pending.";
        }
        return "Play Games SDK not bundled; sign-in unavailable.";
    }

    static String localBackupStatus(Context context) {
        LocalGameDataCatalog.Summary summary = LocalGameDataCatalog.summarize(context);
        if (summary.fileCount == 0) {
            return "No local stats/replay queue files found yet. Play a level first.";
        }
        return summary.fileCount + " local file(s), "
                + LocalGameDataCatalog.formatBytes(summary.totalBytes)
                + " — export below for manual backup.";
    }

}
