package com.trueaxis.modmenu;

import android.app.Activity;
import android.graphics.Color;
import android.os.Handler;
import android.os.Looper;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import java.nio.charset.Charset;
import java.util.ArrayList;

/** Mod-drawn leaderboard picker for replay swarm watch/race. */
final class SwarmLeaderboardPanel {
    private static final int MAX_SELECTION = 8;
    private static final int MAX_GHOSTS = 7;
    private static final int NAME_BUFFER = 64;
    private static final int PATH_BUFFER = 96;
    private static final int FETCH_IDLE = 0;
    private static final int FETCH_PENDING = 1;
    private static final int FETCH_READY = 2;
    private static final int FETCH_FAILED = 3;
    private static final int POLL_MS = 250;
    private static final int FETCH_TIMEOUT_MS = 45000;

    private SwarmLeaderboardPanel() {
    }

    static void show(final Activity activity, final TextView statusView) {
        final int count = RequiredPatches.readLeaderboardEntryCount();
        if (count <= 0) {
            toast(activity, "Leaderboard is empty. Open a level and wait for ranks to load.");
            return;
        }

        final ViewGroup content = (ViewGroup) activity.findViewById(android.R.id.content);
        if (content == null) {
            return;
        }

        final LinearLayout root = new LinearLayout(activity);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(Color.argb(230, 20, 24, 32));
        root.setPadding(dp(activity, 12), dp(activity, 10), dp(activity, 12), dp(activity, 10));

        TextView title = new TextView(activity);
        title.setText("Swarm — leaderboard replays");
        title.setTextColor(Color.WHITE);
        title.setTextSize(14.0f);
        root.addView(title);

        final TextView progress = new TextView(activity);
        progress.setTextSize(11.0f);
        progress.setTextColor(Color.rgb(180, 220, 255));
        progress.setPadding(0, dp(activity, 4), 0, dp(activity, 4));
        root.addView(progress);

        ScrollView scroll = new ScrollView(activity);
        LinearLayout list = new LinearLayout(activity);
        list.setOrientation(LinearLayout.VERTICAL);
        scroll.addView(list);
        root.addView(scroll, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(activity, 220)));

        final CheckBox[] boxes = new CheckBox[count];
        final byte[] nameBuffer = new byte[NAME_BUFFER];
        for (int index = 0; index < count; index++) {
            CheckBox row = new CheckBox(activity);
            int timeMs = RequiredPatches.readLeaderboardEntryTimeMs(index);
            String time = formatTime(timeMs);
            int nameLen = RequiredPatches.readLeaderboardEntryName(index, nameBuffer);
            String name = nameLen > 0
                    ? new String(nameBuffer, 0, nameLen, Charset.forName("UTF-8"))
                    : ("Rank " + (index + 1));
            row.setText(time + "  " + name);
            row.setTextSize(12.0f);
            row.setTextColor(Color.WHITE);
            row.setPadding(dp(activity, 2), 0, 0, 0);
            boxes[index] = row;
            list.addView(row);
        }

        TextView hint = new TextView(activity);
        hint.setText("Tick up to " + MAX_SELECTION + " entries. First ticked replay is the camera car.");
        hint.setTextSize(10.0f);
        hint.setTextColor(Color.rgb(170, 178, 185));
        hint.setPadding(0, dp(activity, 6), 0, dp(activity, 4));
        root.addView(hint);

        LinearLayout buttons = new LinearLayout(activity);
        buttons.setOrientation(LinearLayout.HORIZONTAL);
        buttons.setGravity(Gravity.END);

        final Button cancel = button(activity, "Cancel");
        final Button clear = button(activity, "Clear");
        final Button watch = button(activity, "Watch swarm");
        final Button race = button(activity, "Race swarm");

        buttons.addView(cancel);
        buttons.addView(clear);
        buttons.addView(watch);
        buttons.addView(race);
        root.addView(buttons);

        android.widget.FrameLayout.LayoutParams lp =
                new android.widget.FrameLayout.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT,
                        ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.gravity = Gravity.CENTER;
        lp.leftMargin = dp(activity, 24);
        lp.rightMargin = dp(activity, 24);
        content.addView(root, lp);
        root.bringToFront();

        final Handler handler = new Handler(Looper.getMainLooper());
        final Runnable dismiss = new Runnable() {
            public void run() {
                content.removeView(root);
            }
        };

        cancel.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                handler.post(dismiss);
            }
        });
        clear.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                RequiredPatches.clearReplaySwarm();
                if (statusView != null) {
                    statusView.setVisibility(View.GONE);
                }
                toast(activity, "Replay swarm cleared.");
                handler.post(dismiss);
            }
        });

        View.OnClickListener confirm = new View.OnClickListener() {
            public void onClick(View v) {
                final boolean raceMode = v == race;
                final int[] selected = selectedIndices(boxes);
                if (selected.length < 1) {
                    toast(activity, "Tick at least one leaderboard replay.");
                    return;
                }
                if (selected.length > MAX_SELECTION) {
                    toast(activity, "At most " + MAX_SELECTION + " replays (1 camera + "
                            + MAX_GHOSTS + " ghosts).");
                    return;
                }
                watch.setEnabled(false);
                race.setEnabled(false);
                clear.setEnabled(false);
                cancel.setEnabled(false);
                ModDebugLog.module("swarm", "panel confirm race=" + raceMode
                        + " selected=" + selected.length);
                downloadAndStart(activity, statusView, progress, handler, dismiss,
                        selected, raceMode);
            }
        };
        watch.setOnClickListener(confirm);
        race.setOnClickListener(confirm);
    }

    private static void downloadAndStart(
            final Activity activity,
            final TextView statusView,
            final TextView progress,
            final Handler handler,
            final Runnable dismiss,
            final int[] selected,
            final boolean raceMode) {
        handler.post(new Runnable() {
            private int fetchCursor;
            private final byte[][] paths = new byte[selected.length][PATH_BUFFER];
            private final long startedMs = System.currentTimeMillis();

            public void run() {
                if (activity.isFinishing()) {
                    return;
                }
                if (fetchCursor < selected.length) {
                    int index = selected[fetchCursor];
                    int status = RequiredPatches.readLeaderboardReplayFetchStatus(index);
                    if (status == FETCH_IDLE) {
                        status = RequiredPatches.fetchLeaderboardReplay(index);
                    }
                    if (status == FETCH_PENDING || status == FETCH_IDLE) {
                        progress.setText("Downloading " + (fetchCursor + 1) + "/"
                                + selected.length + "...");
                        if (System.currentTimeMillis() - startedMs > FETCH_TIMEOUT_MS) {
                            toast(activity, "Replay download timed out (network required).");
                            handler.post(dismiss);
                            return;
                        }
                        handler.postDelayed(this, POLL_MS);
                        return;
                    }
                    if (status == FETCH_FAILED) {
                        toast(activity, "Could not download replay for row "
                                + (index + 1) + ". Check network and try again.");
                        handler.post(dismiss);
                        return;
                    }
                    int pathLen = RequiredPatches.readLeaderboardReplayPath(index, paths[fetchCursor]);
                    if (pathLen <= 0) {
                        toast(activity, "Download finished but replay path is missing.");
                        handler.post(dismiss);
                        return;
                    }
                    fetchCursor++;
                    handler.post(this);
                    return;
                }

                byte[] primary = paths[0];
                byte[][] ghostBytes;
                if (paths.length > 1) {
                    ghostBytes = new byte[paths.length - 1][];
                    for (int i = 1; i < paths.length; i++) {
                        ghostBytes[i - 1] = paths[i];
                    }
                } else {
                    ghostBytes = new byte[0][];
                }
                int started;
                if (raceMode) {
                    started = RequiredPatches.startSwarmRace(primary, ghostBytes);
                } else {
                    started = RequiredPatches.startSwarmWatch(primary, ghostBytes);
                }
                int ghosts = RequiredPatches.readReplaySwarmGhostCount();
                ModDebugLog.module("swarm", "panel started race=" + raceMode
                        + " ok=" + started + " ghosts=" + ghosts);
                if (started == 0 || ghosts < 1) {
                    toast(activity, "Could not start swarm (replays missing or unloadable).");
                } else {
                    toast(activity, (raceMode ? "Race" : "Watch") + " swarm: " + ghosts
                            + " ghost replays.");
                    if (statusView != null) {
                        statusView.setText("Swarm: " + ghosts + " ghost replays");
                        statusView.setVisibility(View.VISIBLE);
                    }
                }
                handler.post(dismiss);
            }
        });
    }

    private static int[] selectedIndices(CheckBox[] boxes) {
        ArrayList<Integer> picked = new ArrayList<Integer>();
        for (int index = 0; index < boxes.length; index++) {
            if (boxes[index] != null && boxes[index].isChecked()) {
                picked.add(index);
            }
        }
        int[] out = new int[picked.size()];
        for (int i = 0; i < picked.size(); i++) {
            out[i] = picked.get(i);
        }
        return out;
    }

    private static String formatTime(int timeMs) {
        if (timeMs < 0) {
            return "--:--.---";
        }
        int ms = timeMs;
        int minutes = ms / 60000;
        ms %= 60000;
        int seconds = ms / 1000;
        int millis = ms % 1000;
        return String.format(
                java.util.Locale.US,
                "%02d:%02d.%03d",
                minutes,
                seconds,
                millis);
    }

    private static Button button(Activity activity, String label) {
        Button button = new Button(activity);
        button.setText(label);
        button.setTextSize(10.0f);
        button.setAllCaps(false);
        button.setTextColor(Color.WHITE);
        button.setBackgroundColor(Color.rgb(70, 90, 120));
        button.setPadding(dp(activity, 8), dp(activity, 4), dp(activity, 8), dp(activity, 4));
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.leftMargin = dp(activity, 4);
        button.setLayoutParams(lp);
        return button;
    }

    private static void toast(Activity activity, String message) {
        Toast.makeText(activity, message, Toast.LENGTH_LONG).show();
    }

    private static int dp(Activity activity, int value) {
        return (int) (value * activity.getResources().getDisplayMetrics().density + 0.5f);
    }
}
