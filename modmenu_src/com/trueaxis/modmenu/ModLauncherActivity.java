package com.trueaxis.modmenu;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;

import com.trueaxis.jetcarstunts2.Jetcarstunts2Activity;

/**
 * Pre-game mod configuration screen. Shown as the app launcher before the native
 * game activity (and its splash) starts, so gameplay is never obscured by overlays.
 */
public class ModLauncherActivity extends Activity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        ModMenu.showPreLaunchMenu(this, new Runnable() {
            public void run() {
                RequiredPatches.apply();
                Intent game = new Intent(ModLauncherActivity.this, Jetcarstunts2Activity.class);
                startActivity(game);
                finish();
            }
        });
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (!ModMenu.handleActivityResult(this, requestCode, resultCode, data)) {
            super.onActivityResult(requestCode, resultCode, data);
        }
    }
}
