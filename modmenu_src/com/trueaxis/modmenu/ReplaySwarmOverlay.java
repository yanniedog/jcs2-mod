package com.trueaxis.modmenu;

import android.app.Activity;
import android.app.AlertDialog;
import android.graphics.Color;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import java.nio.charset.Charset;

/** In-replay picker and status overlay for multi-replay swarm mode. */
final class ReplaySwarmOverlay {
    private static final int POLL_MS = 500;
    private static final int PATH_BUFFER = 192;

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
        configure.setVisibility(View.GONE);

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
            private int lastCatalog;
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
                int catalog = RequiredPatches.readReplaySwarmCatalogCount();
                if (catalog != lastCatalog) {
                    lastCatalog = catalog;
                    ModDebugLog.module("swarm", "catalog updated count=" + catalog);
                    persistCatalog(activity, catalog);
                }
                if (state != lastState) {
                    lastState = state;
                    ModDebugLog.module("swarm", "overlay state=" + state
                            + " catalog=" + catalog
                            + " ghosts=" + RequiredPatches.readReplaySwarmGhostCount());
                }

                if (state == 0) {
                    configureButton.setVisibility(View.GONE);
                    statusView.setVisibility(View.GONE);
                    handler.postDelayed(this, POLL_MS);
                    return;
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
                showPicker(activity, status);
            }
        });
    }

    private static void showPicker(final Activity activity, final TextView status) {
        final int count = RequiredPatches.readReplaySwarmCatalogCount();
        if (count <= 0) {
            toast(activity, "Open a replay first so the swarm catalog can populate.");
            return;
        }

        final LinearLayout root = new LinearLayout(activity);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setPadding(dp(activity, 16), dp(activity, 8), dp(activity, 16), dp(activity, 4));

        TextView help = new TextView(activity);
        help.setText(
                "Pick one primary replay for the camera, then select additional replays "
                        + "to render as synced ghost cars. Watch them together here, or hit "
                        + "Race to race against the pack (enable race swarm in the mod menu).");
        help.setTextSize(11.0f);
        help.setTextColor(Color.DKGRAY);
        help.setPadding(0, 0, 0, dp(activity, 8));
        root.addView(help);

        ScrollView scroll = new ScrollView(activity);
        LinearLayout list = new LinearLayout(activity);
        list.setOrientation(LinearLayout.VERTICAL);
        scroll.addView(list);
        root.addView(scroll, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(activity, 220)));

        final RadioGroup primaryGroup = new RadioGroup(activity);
        primaryGroup.setOrientation(LinearLayout.VERTICAL);
        list.addView(primaryGroup);
        final CheckBox[] boxes = new CheckBox[count];
        final byte[] pathBuffer = new byte[PATH_BUFFER];
        int defaultPrimary = RequiredPatches.readReplaySwarmPrimaryIndex();
        if (defaultPrimary < 0 || defaultPrimary >= count) {
            defaultPrimary = 0;
        }

        for (int index = 0; index < count; index++) {
            String label = replayLabel(index, pathBuffer);

            RadioButton primary = new RadioButton(activity);
            primary.setText("Primary: " + label);
            primary.setId(index);
            primary.setTextSize(11.0f);
            primaryGroup.addView(primary);

            CheckBox ghost = new CheckBox(activity);
            ghost.setText("Ghost overlay for " + label);
            ghost.setTextSize(11.0f);
            ghost.setPadding(dp(activity, 12), 0, 0, dp(activity, 4));
            boxes[index] = ghost;
            list.addView(ghost);
        }
        primaryGroup.check(defaultPrimary);

        new AlertDialog.Builder(activity)
                .setTitle("Replay swarm")
                .setView(root)
                .setNegativeButton("Cancel", null)
                .setNeutralButton("Clear", new android.content.DialogInterface.OnClickListener() {
                    public void onClick(android.content.DialogInterface dialog, int which) {
                        RequiredPatches.clearReplaySwarm();
                        status.setVisibility(View.GONE);
                        toast(activity, "Replay swarm cleared.");
                    }
                })
                .setPositiveButton("Apply", new android.content.DialogInterface.OnClickListener() {
                    public void onClick(android.content.DialogInterface dialog, int which) {
                        int primary = primaryGroup.getCheckedRadioButtonId();
                        if (primary < 0) {
                            toast(activity, "Choose a primary replay.");
                            return;
                        }
                        int ghostCount = 0;
                        for (int index = 0; index < count; index++) {
                            if (index != primary && boxes[index].isChecked()) {
                                ghostCount++;
                            }
                        }
                        if (ghostCount < 1) {
                            toast(activity, "Select at least one ghost replay.");
                            return;
                        }
                        int[] secondary = new int[ghostCount];
                        int slot = 0;
                        for (int index = 0; index < count; index++) {
                            if (index != primary && boxes[index].isChecked()) {
                                secondary[slot++] = index;
                            }
                        }
                        RequiredPatches.setReplaySwarmSelection(primary, secondary);
                        toast(activity, "Replay swarm active with "
                                + RequiredPatches.readReplaySwarmGhostCount()
                                + " ghost replays.");
                    }
                })
                .show();
    }

    /** Remember every catalog path so future sessions can re-seed the picker. */
    private static void persistCatalog(Activity activity, int count) {
        if (count <= 0) {
            return;
        }
        java.util.ArrayList<String> paths = new java.util.ArrayList<String>(count);
        byte[] buffer = new byte[PATH_BUFFER];
        for (int index = 0; index < count; index++) {
            int length = RequiredPatches.readReplaySwarmCatalogPath(index, buffer);
            if (length > 0) {
                paths.add(new String(buffer, 0, length, Charset.forName("UTF-8")));
            }
        }
        ModMenu.rememberSwarmCatalogPaths(activity, paths);
    }

    private static String replayLabel(int index, byte[] buffer) {
        int length = RequiredPatches.readReplaySwarmCatalogPath(index, buffer);
        if (length <= 0) {
            return "Replay " + (index + 1);
        }
        String path = new String(buffer, 0, length, Charset.forName("UTF-8"));
        int slash = path.lastIndexOf('/');
        if (slash >= 0 && slash + 1 < path.length()) {
            return path.substring(slash + 1);
        }
        return path;
    }

    private static void toast(Activity activity, String message) {
        Toast.makeText(activity, message, Toast.LENGTH_LONG).show();
    }

    private static int dp(Activity activity, int value) {
        return (int) (value * activity.getResources().getDisplayMetrics().density + 0.5f);
    }
}
