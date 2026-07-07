package com.trueaxis.modmenu;

import android.app.Activity;
import android.graphics.Color;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;

/** Always-visible Swarm button and status line for leaderboard-driven swarm mode. */
final class ReplaySwarmOverlay {
    private static final int POLL_MS = 500;

    private ReplaySwarmOverlay() {
    }

    static void install(final Activity activity) {
        if (!ModMenu.replaySwarmEnabled(activity)) {
            return;
        }
        final ViewGroup content = (ViewGroup) activity.findViewById(android.R.id.content);
        if (content == null) {
            return;
        }

        final Button configure = new Button(activity);
        configure.setText("Swarm");
        configure.setTextSize(11.0f);
        configure.setAllCaps(false);
        configure.setTextColor(Color.WHITE);
        configure.setBackgroundColor(Color.rgb(70, 90, 120));
        configure.setPadding(dp(activity, 10), dp(activity, 6), dp(activity, 10), dp(activity, 6));
        configure.setVisibility(View.VISIBLE);

        final TextView status = new TextView(activity);
        status.setTextSize(11.0f);
        status.setTextColor(Color.rgb(180, 220, 255));
        status.setShadowLayer(2.0f, 1.0f, 1.0f, Color.BLACK);
        status.setVisibility(View.GONE);

        android.widget.FrameLayout.LayoutParams configureLp =
                new android.widget.FrameLayout.LayoutParams(
                        ViewGroup.LayoutParams.WRAP_CONTENT,
                        ViewGroup.LayoutParams.WRAP_CONTENT);
        configureLp.gravity = Gravity.TOP | Gravity.RIGHT;
        configureLp.topMargin = dp(activity, 12);
        configureLp.rightMargin = dp(activity, 12);

        android.widget.FrameLayout.LayoutParams statusLp =
                new android.widget.FrameLayout.LayoutParams(
                        ViewGroup.LayoutParams.WRAP_CONTENT,
                        ViewGroup.LayoutParams.WRAP_CONTENT);
        statusLp.gravity = Gravity.TOP | Gravity.LEFT;
        statusLp.topMargin = dp(activity, 12);
        statusLp.leftMargin = dp(activity, 12);

        content.addView(configure, configureLp);
        content.addView(status, statusLp);
        if (Build.VERSION.SDK_INT >= 21) {
            configure.setTranslationZ(1000.0f);
            status.setTranslationZ(1000.0f);
        }

        final Handler handler = new Handler(Looper.getMainLooper());
        ModDebugLog.log("replay swarm overlay installed");
        handler.post(new Runnable() {
            private int lastState;
            private boolean disabled;

            public void run() {
                if (activity.isFinishing() || disabled) {
                    return;
                }
                try {
                    poll(configure, status);
                } catch (Throwable error) {
                    disabled = true;
                    configure.setVisibility(View.GONE);
                    status.setVisibility(View.GONE);
                    ModDebugLog.module("swarm", "overlay poll failed; disabling overlay", error);
                }
            }

            private void poll(Button configureButton, TextView statusView) {
                int state = RequiredPatches.readReplaySwarmActive();
                int entries = RequiredPatches.readLeaderboardEntryCount();
                if (state != lastState) {
                    lastState = state;
                    ModDebugLog.module("swarm", "overlay state=" + state
                            + " leaderboard=" + entries
                            + " ghosts=" + RequiredPatches.readReplaySwarmGhostCount());
                }

                configureButton.setVisibility(View.VISIBLE);
                configureButton.bringToFront();
                if (state == 2) {
                    statusView.setText("Swarm: "
                            + RequiredPatches.readReplaySwarmGhostCount()
                            + " ghost replays");
                    statusView.setVisibility(View.VISIBLE);
                    statusView.bringToFront();
                } else {
                    statusView.setVisibility(View.GONE);
                }
                handler.postDelayed(this, POLL_MS);
            }
        });

        configure.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                try {
                    ModDebugLog.module("swarm", "swarm button tapped leaderboard="
                            + RequiredPatches.readLeaderboardEntryCount());
                    SwarmLeaderboardPanel.show(activity, status);
                } catch (Throwable error) {
                    ModDebugLog.module("swarm", "leaderboard panel failed", error);
                    android.widget.Toast.makeText(activity,
                            "Swarm panel failed: " + error,
                            android.widget.Toast.LENGTH_LONG).show();
                }
            }
        });
    }

    private static int dp(Activity activity, int value) {
        return (int) (value * activity.getResources().getDisplayMetrics().density + 0.5f);
    }
}
