package com.trueaxis.modmenu;

import android.app.Activity;
import android.util.Log;

/**
 * Non-configurable compatibility patches retained by the community build.
 */
public final class RequiredPatches {
    private static final String TAG = "YCS2Mod";
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
        ModDebugLog.install(activity);
        ModIdentity.configure(activity);
        ModDebugLog.module("patches", "apply start nativeAvailable=" + NATIVE_AVAILABLE);
        if (!NATIVE_AVAILABLE) {
            ModDebugLog.log("native patch library unavailable");
            return;
        }
        try {
            boolean installed = installNativeCrashLogger();
            ModDebugLog.module("patches", "native fatal-signal logger installed=" + installed
                    + " path=" + ModDebugLog.nativeCrashFile());
        } catch (Throwable error) {
            Log.e(TAG, "Could not install native fatal-signal logger", error);
            ModDebugLog.module("patches", "Could not install native fatal-signal logger", error);
        }
        try {
            boolean applied = applyUnlimitedCheckpoints();
            ModDebugLog.log("applied retained native patches result=" + applied);
        } catch (Throwable error) {
            Log.e(TAG, "Could not apply unlimited checkpoints", error);
            ModDebugLog.log("Could not apply unlimited checkpoints", error);
        }
        try {
            boolean installed = installUserTrackFeatureHooks();
            ModDebugLog.log("user track creation feature hooks installed=" + installed);
        } catch (Throwable error) {
            Log.e(TAG, "Could not install user track feature hooks", error);
            ModDebugLog.log("Could not install user track feature hooks", error);
        }
        ModDebugLog.log("replay visual marker disabled; replay data is not modified");
        if (ModMenu.checkpointSplitsEnabled(activity)) {
            ModDebugLog.log("checkpoint split HUD enabled");
            try {
                SplitTimeHud.install(activity);
            } catch (Throwable error) {
                Log.e(TAG, "Could not install checkpoint split HUD", error);
                ModDebugLog.log("Could not install checkpoint split HUD", error);
            }
        } else {
            ModDebugLog.log("checkpoint split HUD disabled");
        }
        ModDebugLog.logRuntime("after RequiredPatches.apply");
    }

    private static native boolean installNativeCrashLogger();
    private static native boolean applyUnlimitedCheckpoints();
    private static native boolean installUserTrackFeatureHooks();
    static native long readLatestCheckpointSplit();
    static native int readLatestCheckpointCurrentMillis();
    static native int readLatestCheckpointGhostMillis();
    static native int readGhostCheckpointMillis(int checkpoint);
    static native int readSplitLastCheckpointMillis();
    static native int readSplitScannedCheckpointIndex();
    static native int readSplitEngineLastCheckpointIndex();
    static native int readSplitDecodedEngineCheckpointIndex();
    static native int readSplitLiveCheckpointCount();
    static native int readSplitGhostCheckpointCount();
    static native int readSplitOfficialGhostCheckpointCount();
    static native int readSplitResolvedCheckpoint();
    static native int readSplitLiveArrayMillis(int index);
    static native int readSplitOfficialGhostArrayMillis(int index);
    static native int readSplitReplayHeaderSize();
    static native int readSplitReplayHeaderCheckpointCount();
    static native int readSplitReplayHeaderFinishMillis();
    static native int readSplitGhostPos();
    static native int readSplitLastGhostPos();
    static native int readSplitLastReplaySize();
    static native int readSplitGhostVisualMillis();
    static native int readSplitReplayVisualMillis();
    static native int readSplitVisualDeltaMillis();
    static native int readSplitGhostCheckpointDistanceSq1000();
    static native int readSplitGhostRetrySkipIndex();
    static native int readSplitLastGhostRetrySkipIndex();
    static native int readSplitGhostRetryPauseTime();
    static native int readSplitLastGhostRetryPauseTime();
    static native int readSplitGhostRetrySkipCount();
    static native int readSplitGhostSize();
    static native int readSplitShowReplayFlag();
}
