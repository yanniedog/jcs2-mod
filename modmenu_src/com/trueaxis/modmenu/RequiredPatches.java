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
            setReplayTracksideTuning(ModMenu.tracksideSideMode(activity),
                    ModMenu.tracksideSideDist(activity), ModMenu.tracksideHeight(activity),
                    ModMenu.tracksideMinDist(activity), ModMenu.tracksideMaxDist(activity));
            setReplayCameraCycle(ModMenu.cameraCycleEnabled(activity),
                    ModMenu.cameraCycleSeconds(activity));
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
                                path.getBytes(java.nio.charset.Charset.forName("UTF-8")));
                    }
                }
                archiveNewSlotReplays(activity);
                int slotReplays = seedSwarmSlotReplays(activity);
                applyGhostPack(activity);
                ModDebugLog.log("replay swarm hooks installed=" + installed
                        + " raceSwarm=" + raceSwarm
                        + " remembered=" + rememberedPaths.length
                        + " slotReplays=" + slotReplays
                        + " catalog=" + readReplaySwarmCatalogCount());
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

    /**
     * Archive every new/updated rNN.bin into swarm_replays/ next to it, so
     * multiple runs per level accumulate as ghost-pack candidates instead of
     * the game overwriting its single slot. Files are named
     * rNN-&lt;mtimeSeconds&gt;.bin (same content = same name = no duplicates);
     * the library is pruned to the newest 24.
     */
    static int archiveNewSlotReplays(android.content.Context context) {
        if (context == null) {
            return 0;
        }
        int archived = 0;
        java.io.File[] dirs = { context.getFilesDir(), context.getExternalFilesDir(null) };
        for (java.io.File dir : dirs) {
            if (dir == null) {
                continue;
            }
            java.io.File[] files = dir.listFiles();
            if (files == null) {
                continue;
            }
            java.io.File library = new java.io.File(dir, "swarm_replays");
            for (java.io.File file : files) {
                String name = file.getName();
                if (!file.isFile() || file.length() <= 64 || !name.matches("r\\d\\d\\.bin")) {
                    continue;
                }
                if (!library.isDirectory() && !library.mkdirs()) {
                    continue;
                }
                String archiveName = name.substring(0, 3) + "-"
                        + (file.lastModified() / 1000L) + ".bin";
                java.io.File target = new java.io.File(library, archiveName);
                if (target.isFile()) {
                    continue;
                }
                if (copyFile(file, target)) {
                    archived++;
                }
            }
            pruneLibrary(library, 24);
        }
        if (archived > 0) {
            ModDebugLog.module("swarm", "archived " + archived + " new slot replays");
        }
        return archived;
    }

    private static boolean copyFile(java.io.File from, java.io.File to) {
        java.io.FileInputStream in = null;
        java.io.FileOutputStream out = null;
        try {
            in = new java.io.FileInputStream(from);
            out = new java.io.FileOutputStream(to);
            byte[] buffer = new byte[65536];
            int read;
            while ((read = in.read(buffer)) > 0) {
                out.write(buffer, 0, read);
            }
            return true;
        } catch (Throwable error) {
            ModDebugLog.module("swarm", "archive copy failed " + from, error);
            to.delete();
            return false;
        } finally {
            try { if (in != null) in.close(); } catch (Throwable ignored) {}
            try { if (out != null) out.close(); } catch (Throwable ignored) {}
        }
    }

    private static void pruneLibrary(java.io.File library, int keep) {
        java.io.File[] entries = library.listFiles();
        if (entries == null || entries.length <= keep) {
            return;
        }
        java.util.Arrays.sort(entries, new java.util.Comparator<java.io.File>() {
            public int compare(java.io.File a, java.io.File b) {
                long diff = b.lastModified() - a.lastModified();
                return diff == 0 ? 0 : (diff > 0 ? 1 : -1);
            }
        });
        for (int i = keep; i < entries.length; i++) {
            entries[i].delete();
        }
    }

    /** Library entries (newest first) across both possible user dirs. */
    static java.util.List<java.io.File> swarmLibraryFiles(android.content.Context context) {
        java.util.ArrayList<java.io.File> all = new java.util.ArrayList<java.io.File>();
        java.io.File[] dirs = { context.getFilesDir(), context.getExternalFilesDir(null) };
        for (java.io.File dir : dirs) {
            if (dir == null) {
                continue;
            }
            java.io.File[] entries = new java.io.File(dir, "swarm_replays").listFiles();
            if (entries == null) {
                continue;
            }
            for (java.io.File entry : entries) {
                if (entry.isFile() && entry.getName().endsWith(".bin")) {
                    all.add(entry);
                }
            }
        }
        java.util.Collections.sort(all, new java.util.Comparator<java.io.File>() {
            public int compare(java.io.File a, java.io.File b) {
                long diff = b.lastModified() - a.lastModified();
                return diff == 0 ? 0 : (diff > 0 ? 1 : -1);
            }
        });
        return all;
    }

    /** Push the saved ghost-pack selection to the native pack loader. */
    static void applyGhostPack(android.content.Context context) {
        String[] paths = ModMenu.ghostPackPaths(context);
        StringBuilder joined = new StringBuilder();
        for (String path : paths) {
            if (path.length() == 0) {
                continue;
            }
            if (joined.length() > 0) {
                joined.append('\0');
            }
            joined.append(path);
        }
        try {
            setReplaySwarmRacePack(
                    joined.toString().getBytes(java.nio.charset.Charset.forName("UTF-8")));
            ModDebugLog.module("swarm", "ghost pack applied entries=" + paths.length);
        } catch (Throwable error) {
            ModDebugLog.module("swarm", "ghost pack apply failed", error);
        }
    }

    /**
     * The game saves finished-race replays as rNN.bin in its user directory
     * (internal or external files dir). Seed every one into the swarm catalog
     * as a RELATIVE name: Replay::Load(const char*) resolves paths through
     * GetUserPath, so absolute paths would break.
     */
    private static int seedSwarmSlotReplays(Activity activity) {
        if (activity == null) {
            return 0;
        }
        int added = 0;
        java.io.File[] dirs = { activity.getFilesDir(), activity.getExternalFilesDir(null) };
        for (java.io.File dir : dirs) {
            if (dir == null) {
                continue;
            }
            java.io.File[] files = dir.listFiles();
            if (files == null) {
                continue;
            }
            for (java.io.File file : files) {
                String name = file.getName();
                if (file.isFile() && file.length() > 64 && name.matches("r\\d\\d\\.bin")) {
                    addReplaySwarmCatalogPath(
                            name.getBytes(java.nio.charset.Charset.forName("UTF-8")));
                    added++;
                }
            }
            // Archived library entries are pickable too (relative sub-path).
            java.io.File[] archived = new java.io.File(dir, "swarm_replays").listFiles();
            if (archived != null) {
                for (java.io.File file : archived) {
                    if (file.isFile() && file.length() > 64 && file.getName().endsWith(".bin")) {
                        addReplaySwarmCatalogPath(("swarm_replays/" + file.getName())
                                .getBytes(java.nio.charset.Charset.forName("UTF-8")));
                        added++;
                    }
                }
            }
        }
        return added;
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
    static native void setReplayTracksideTuning(int sideMode, int sideDist, int height,
            int minDist, int maxDist);
    static native void setReplayCameraCycle(boolean enabled, int seconds);
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
    static native void setReplaySwarmRacePack(byte[] nulSeparatedPaths);
    static native void addReplaySwarmCatalogPath(byte[] pathUtf8);
}
