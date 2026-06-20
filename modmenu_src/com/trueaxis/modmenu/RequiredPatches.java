package com.trueaxis.modmenu;

import android.app.Activity;
import android.util.Log;

/**
 * Non-configurable compatibility patches retained by the community build.
 */
public final class RequiredPatches {
    private static final String TAG = "MCS2Mod";
    private static final boolean NATIVE_AVAILABLE;

    static {
        boolean available = false;
        try {
            System.loadLibrary("jcs2mod");
            available = true;
        } catch (Throwable error) {
            Log.e(TAG, "Could not load required patch library", error);
        }
        NATIVE_AVAILABLE = available;
    }

    private RequiredPatches() {
    }

    public static void apply(Activity activity) {
        if (!NATIVE_AVAILABLE) {
            return;
        }
        try {
            applyUnlimitedCheckpoints();
        } catch (Throwable error) {
            Log.e(TAG, "Could not apply unlimited checkpoints", error);
        }
        try {
            installReplayVisualMarker();
        } catch (Throwable error) {
            Log.e(TAG, "Could not install replay visual marker", error);
        }
        if (ModMenu.checkpointSplitsEnabled(activity)) {
            SplitTimeHud.install(activity);
        }
    }

    private static native boolean applyUnlimitedCheckpoints();
    private static native boolean installReplayVisualMarker();
    static native long readLatestCheckpointSplit();
}
