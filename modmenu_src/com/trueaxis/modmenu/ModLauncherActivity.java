package com.trueaxis.modmenu;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;

import com.trueaxis.jetcarstunts2.Jetcarstunts2Activity;

/**
 * Pre-game mod configuration screen. Shown as the app launcher before the native
 * game activity (and its splash) starts, so gameplay is never obscured by overlays.
 */
public class ModLauncherActivity extends Activity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        ModDebugLog.install(this);
        ModDebugLog.lifecycle(this, "onCreate launcher entry");
        if (!isTaskRoot()) {
            ModDebugLog.module("launcher", "non-root launcher entry; finishing to reveal existing game task");
            finish();
            return;
        }
        handleAutomationExtras();
        ModMenu.showPreLaunchMenu(this, new Runnable() {
            public void run() {
                try {
                    ModDebugLog.module("launcher", "Start game clicked; launching Jetcarstunts2Activity");
                    ModMenu.validateCustomLiveriesForGame(ModLauncherActivity.this);
                    Intent game = new Intent(ModLauncherActivity.this, Jetcarstunts2Activity.class);
                    startActivity(game);
                    ModDebugLog.module("launcher", "Jetcarstunts2Activity startActivity returned");
                    finish();
                } catch (Throwable error) {
                    ModDebugLog.module("launcher", "Start game failed", error);
                    throw new RuntimeException("Could not launch game activity", error);
                }
            }
        });
        new Handler().postDelayed(new Runnable() {
            public void run() {
                ModDebugLog.requestSharedLogPermission(ModLauncherActivity.this);
            }
        }, 500);
        new Handler().postDelayed(new Runnable() {
            public void run() {
                UpdateManager.checkSilently(ModLauncherActivity.this);
            }
        }, 1500);
    }

    /** Test-harness support: launch extras toggle prefs before the menu builds. */
    private void handleAutomationExtras() {
        try {
            Intent intent = getIntent();
            if (intent == null) {
                return;
            }
            if (intent.hasExtra("automation_enable_replay_swarm")) {
                boolean on = intent.getBooleanExtra("automation_enable_replay_swarm", false);
                ModMenu.setReplaySwarmEnabled(this, on);
                ModDebugLog.module("automation", "automation replay_swarm=" + on);
            }
            if (intent.hasExtra("automation_enable_race_swarm")) {
                boolean on = intent.getBooleanExtra("automation_enable_race_swarm", false);
                ModMenu.setRaceSwarmEnabled(this, on);
                ModDebugLog.module("automation", "automation race_swarm=" + on);
            }
            if (intent.hasExtra("automation_swarm_autoapply")) {
                boolean on = intent.getBooleanExtra("automation_swarm_autoapply", false);
                ModMenu.setSwarmAutoApply(this, on);
                ModDebugLog.module("automation", "automation swarm_autoapply=" + on);
            }
            if (intent.getBooleanExtra("automation_ghost_pack_all", false)) {
                RequiredPatches.archiveNewSlotReplays(this);
                java.util.ArrayList<String> all = new java.util.ArrayList<String>();
                for (java.io.File file : RequiredPatches.swarmLibraryFiles(this)) {
                    all.add("swarm_replays/" + file.getName());
                }
                ModMenu.setGhostPackPaths(this, all);
                ModDebugLog.module("automation", "automation ghost_pack entries="
                        + ModMenu.ghostPackPaths(this).length);
            }
        } catch (Throwable error) {
            ModDebugLog.module("automation", "automation extras failed", error);
        }
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        ModDebugLog.module("launcher", "activity result request=" + requestCode
                + " result=" + resultCode + " hasData=" + (data != null));
        if (!ModMenu.handleActivityResult(this, requestCode, resultCode, data)) {
            super.onActivityResult(requestCode, resultCode, data);
        }
    }

    public void onRequestPermissionsResult(int requestCode, String[] permissions, int[] grantResults) {
        ModDebugLog.onRequestPermissionsResult(this, requestCode, permissions, grantResults);
    }
}
