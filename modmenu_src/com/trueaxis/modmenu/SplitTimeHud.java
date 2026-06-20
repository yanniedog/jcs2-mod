package com.trueaxis.modmenu;

import android.app.Activity;
import android.graphics.Color;
import android.graphics.Typeface;
import android.os.Handler;
import android.os.Looper;
import android.view.Gravity;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.TextView;

import java.util.Locale;

/** Read-only checkpoint split overlay driven by the stock engine's current and PB ghost arrays. */
final class SplitTimeHud {
    private static final int POLL_MS = 50;
    private static final int DISPLAY_MS = 2500;

    private SplitTimeHud() {
    }

    static void install(final Activity activity) {
        final ViewGroup content = (ViewGroup) activity.findViewById(android.R.id.content);
        if (content == null) return;

        final TextView split = new TextView(activity);
        split.setTextSize(21.0f);
        split.setTypeface(Typeface.DEFAULT_BOLD);
        split.setGravity(Gravity.CENTER);
        split.setShadowLayer(3.0f, 1.0f, 1.0f, Color.BLACK);
        split.setVisibility(TextView.GONE);

        FrameLayout.LayoutParams layout = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        layout.gravity = Gravity.TOP | Gravity.CENTER_HORIZONTAL;
        layout.topMargin = dp(activity, 38);
        content.addView(split, layout);

        final Handler handler = new Handler(Looper.getMainLooper());
        handler.post(new Runnable() {
            private int lastCheckpointCount;
            private long hideAt;

            public void run() {
                if (activity.isFinishing()) return;
                long packed = RequiredPatches.readLatestCheckpointSplit();
                int checkpointCount = (int) (packed >>> 32);
                int splitMillis = (int) packed;

                if (checkpointCount < lastCheckpointCount) {
                    lastCheckpointCount = checkpointCount;
                    split.setVisibility(TextView.GONE);
                } else if (checkpointCount > lastCheckpointCount + 1) {
                    // Replay loading/decompression can populate all ghost checkpoints at once.
                    // Treat that as arming data only; do not display until the following race.
                    lastCheckpointCount = checkpointCount;
                    split.setVisibility(TextView.GONE);
                } else if (checkpointCount > lastCheckpointCount) {
                    lastCheckpointCount = checkpointCount;
                    if (checkpointCount > 0) {
                        boolean gained = splitMillis <= 0;
                        split.setText(String.format(Locale.US, "%s%.2f",
                                gained ? "-" : "+", Math.abs(splitMillis) / 1000.0f));
                        split.setTextColor(gained
                                ? Color.rgb(80, 255, 110)
                                : Color.rgb(255, 80, 70));
                        split.setVisibility(TextView.VISIBLE);
                        hideAt = System.currentTimeMillis() + DISPLAY_MS;
                    }
                } else if (split.getVisibility() == TextView.VISIBLE
                        && System.currentTimeMillis() >= hideAt) {
                    split.setVisibility(TextView.GONE);
                }
                handler.postDelayed(this, POLL_MS);
            }
        });
    }

    private static int dp(Activity activity, int value) {
        return (int) (value * activity.getResources().getDisplayMetrics().density + 0.5f);
    }
}
