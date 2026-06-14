package com.trueaxis.modmenu;

/**
 * Non-configurable compatibility patches retained by the community build.
 */
public final class RequiredPatches {
    static {
        System.loadLibrary("jcs2mod");
    }

    private RequiredPatches() {
    }

    public static void apply() {
        applyUnlimitedCheckpoints();
        installReplayVisualMarker();
    }

    private static native boolean applyUnlimitedCheckpoints();
    private static native boolean installReplayVisualMarker();
}
