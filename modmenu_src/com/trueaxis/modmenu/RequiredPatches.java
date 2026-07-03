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
        boolean replayFreeCameraEnabled = ModMenu.replayFreeCameraEnabled(activity);
        try {
            boolean installed = installReplayFreeCameraHooks();
            setReplayFreeCameraEnabled(replayFreeCameraEnabled);
            int cameraMode = ModMenu.replayCameraMode(activity);
            setReplayCameraMode(cameraMode);
            setReplayOrbitTuning(ModMenu.orbitRadius(activity),
                    ModMenu.orbitSpeed(activity), ModMenu.orbitHeight(activity));
            ModDebugLog.log("replay free camera hooks installed=" + installed
                    + " enabled=" + replayFreeCameraEnabled + " mode=" + cameraMode
                    + " orbit=" + ModMenu.orbitRadius(activity)
                    + "u/" + ModMenu.orbitSpeed(activity)
                    + "dps/" + ModMenu.orbitHeight(activity) + "deg");
            if (installed && replayFreeCameraEnabled) {
                ReplayFreeCameraOverlay.install(activity);
            }
        } catch (Throwable error) {
            Log.e(TAG, "Could not install replay free camera", error);
            ModDebugLog.log("Could not install replay free camera", error);
        }
        ModDebugLog.log("replay visual marker disabled; replay data is not modified");
        if (ModMenu.replaySwarmEnabled(activity)) {
            try {
                boolean installed = installReplaySwarmHooks();
                setReplaySwarmEnabled(true);
                boolean raceSwarm = ModMenu.raceSwarmEnabled(activity);
                setReplayRaceSwarmEnabled(raceSwarm);
                String[] rememberedPaths = ModMenu.swarmCatalogPaths(activity);
                for (String path : rememberedPaths) {
                    if (path.length() > 0) {
                        addReplaySwarmCatalogPath(
                                path.getBytes(java.nio.charset.StandardCharsets.UTF_8));
                    }
                }
                ModDebugLog.log("replay swarm hooks installed=" + installed
                        + " raceSwarm=" + raceSwarm
                        + " seededCatalog=" + rememberedPaths.length);
                if (installed) {
                    ReplaySwarmOverlay.install(activity);
                }
            } catch (Throwable error) {
                Log.e(TAG, "Could not install replay swarm mode", error);
                ModDebugLog.log("Could not install replay swarm mode", error);
            }
        } else {
            try {
                setReplaySwarmEnabled(false);
            } catch (Throwable ignored) {
            }
        }
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
    private static native boolean installReplayFreeCameraHooks();
    static native void setReplayFreeCameraEnabled(boolean enabled);
    static native void setReplayFreeCameraLocked(boolean locked);
    static native void resetReplayFreeCamera();
    static native void setReplayCameraMode(int mode);
    static native void setReplayOrbitTuning(int radiusUnits, int degPerSec, int elevationDeg);
    static native void nudgeReplayFreeCamera(float right, float up, float forward,
                                             float yaw, float pitch);
    static native void gestureReplayFreeCamera(float right, float up, float forward,
                                               float yaw, float pitch,
                                               float carRight, float carUp);
    static native int readReplayFreeCameraStatus();
    static native int readReplayCameraDiag(int field);
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
    private static native boolean installReplaySwarmHooks();
    static native void setReplaySwarmEnabled(boolean enabled);
    static native void clearReplaySwarm();
    static native int readReplaySwarmActive();
    static native int readReplaySwarmCatalogCount();
    static native int readReplaySwarmPrimaryIndex();
    static native int readReplaySwarmGhostCount();
    static native int readReplaySwarmCatalogPath(int index, byte[] buffer);
    static native void setReplaySwarmSelection(int primaryIndex, int[] secondaryIndices);
    static native void setReplayRaceSwarmEnabled(boolean enabled);
    static native void addReplaySwarmCatalogPath(byte[] pathUtf8);
}
