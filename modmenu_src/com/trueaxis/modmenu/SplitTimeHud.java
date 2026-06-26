package com.trueaxis.modmenu;

import android.app.Activity;
import android.graphics.Color;
import android.graphics.Typeface;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.style.ForegroundColorSpan;
import android.view.Gravity;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.Locale;

/** Read-only checkpoint split overlay driven by the stock engine's current and replay ghost arrays. */
final class SplitTimeHud {
    private static final int POLL_MS = 200;
    private static final int SPLIT_READY = Color.rgb(255, 220, 0);
    private static final int SPLIT_FAST = Color.rgb(0, 220, 80);
    private static final int SPLIT_SLOW = Color.rgb(255, 70, 70);

    private static final class SplitEntry {
        final String line;
        final int color;
        final int checkpoint;
        final int cumulativeMillis;

        SplitEntry(String line, int color, int checkpoint, int cumulativeMillis) {
            this.line = line;
            this.color = color;
            this.checkpoint = checkpoint;
            this.cumulativeMillis = cumulativeMillis;
        }
    }

    private SplitTimeHud() {
    }

    static void install(final Activity activity) {
        final ViewGroup content = (ViewGroup) activity.findViewById(android.R.id.content);
        if (content == null) return;

        final TextView split = new TextView(activity);
        split.setTextSize(16.0f);
        split.setTypeface(Typeface.create(Typeface.SANS_SERIF, Typeface.BOLD));
        split.setGravity(Gravity.LEFT);
        split.setIncludeFontPadding(false);
        split.setShadowLayer(2.0f, 1.0f, 1.0f, Color.BLACK);
        split.setVisibility(TextView.GONE);

        FrameLayout.LayoutParams layout = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        layout.gravity = Gravity.TOP | Gravity.LEFT;
        layout.leftMargin = dp(activity, ModMenu.splitXdp(activity));
        layout.topMargin = dp(activity, ModMenu.splitYdp(activity));
        content.addView(split, layout);
        split.bringToFront();
        split.setAlpha(ModMenu.splitAlphaPercent(activity) / 100.0f);
        if (Build.VERSION.SDK_INT >= 21) {
            split.setTranslationZ(1000.0f);
        }

        final Handler handler = new Handler(Looper.getMainLooper());
        ModDebugLog.log("split HUD installed");
        handler.post(new Runnable() {
            private int lastCheckpointCount;
            private int loggedGhostCheckpointCount;
            private int loggedReplayLoadCount;
            private long nextArmedDiagnosticAt;
            private boolean disabled;
            private final ArrayList<SplitEntry> splitHistory = new ArrayList<SplitEntry>();

            public void run() {
                if (activity.isFinishing() || disabled) return;
                try {
                    poll();
                } catch (Throwable error) {
                    disabled = true;
                    split.setVisibility(TextView.GONE);
                    ModDebugLog.module("splits", "split HUD poll failed; disabling HUD", error);
                }
            }

            private void poll() {
                long packed = RequiredPatches.readLatestCheckpointSplit();
                int encodedCount = (int) (packed >>> 32);
                int splitMillis = (int) packed;
                if (encodedCount == 0) {
                    lastCheckpointCount = 0;
                    loggedGhostCheckpointCount = 0;
                    loggedReplayLoadCount = 0;
                    splitHistory.clear();
                    split.setVisibility(TextView.GONE);
                    handler.postDelayed(this, POLL_MS);
                    return;
                }

                applyLayoutOptions(split);
                int checkpointCount = encodedCount - 1;
                if (checkpointCount == 0 && split.getVisibility() != TextView.VISIBLE) {
                    split.setText(displayText("SPLIT --"));
                    split.setTextColor(SPLIT_READY);
                    split.bringToFront();
                    split.setVisibility(TextView.VISIBLE);
                    logArmedDiagnostics("armed");
                    ModDebugLog.log("split HUD armed for raced replay ghost");
                }

                if (checkpointCount < lastCheckpointCount) {
                    lastCheckpointCount = checkpointCount;
                    splitHistory.clear();
                    if (checkpointCount == 0) {
                        loggedGhostCheckpointCount = 0;
                    }
                    split.setText(displayText("SPLIT --"));
                    split.setTextColor(SPLIT_READY);
                    split.bringToFront();
                    split.setVisibility(TextView.VISIBLE);
                    logArmedDiagnostics("reset");
                    ModDebugLog.log("split checkpoint counter reset count=" + checkpointCount);
                } else if (checkpointCount > lastCheckpointCount + 1) {
                    if (splitHistory.isEmpty()) {
                        // Replay loading/decompression can populate all ghost checkpoints at once.
                        // Treat that as arming data only; the first live checkpoint must still display.
                        lastCheckpointCount = 0;
                        split.setText(displayText("SPLIT --"));
                        split.setTextColor(SPLIT_READY);
                        split.bringToFront();
                        split.setVisibility(TextView.VISIBLE);
                        logArmedDiagnostics("jump");
                        if (loggedReplayLoadCount != checkpointCount) {
                            loggedReplayLoadCount = checkpointCount;
                            ModDebugLog.log("split replay-load checkpoint data armed count=" + checkpointCount);
                            logGhostCheckpoints(checkpointCount);
                        }
                    } else {
                        ModDebugLog.log("split checkpoint jump accepted from="
                                + lastCheckpointCount + " to=" + checkpointCount);
                        lastCheckpointCount = checkpointCount;
                        showSplit(split, checkpointCount, splitMillis);
                    }
                } else if (checkpointCount > lastCheckpointCount) {
                    lastCheckpointCount = checkpointCount;
                    if (checkpointCount > 0) {
                        showSplit(split, checkpointCount, splitMillis);
                    }
                } else if (checkpointCount == 0 && split.getVisibility() == TextView.VISIBLE) {
                    logArmedDiagnostics("waiting");
                }
                handler.postDelayed(this, POLL_MS);
            }

            private void showSplit(TextView split, int checkpointCount, int splitMillis) {
                boolean sectorMode = ModMenu.sectorSplitsEnabled(activity);
                int displayMillis = sectorMode
                        ? sectorSplitMillis(checkpointCount, splitMillis)
                        : splitMillis;
                String line = splitLine(checkpointCount, displayMillis, sectorMode);
                int color = splitColor(displayMillis);
                splitHistory.add(new SplitEntry(line, color, checkpointCount, splitMillis));
                while (splitHistory.size() > 8) splitHistory.remove(0);
                split.setText(displayText(line));
                split.setTextColor(ModMenu.splitListEnabled(activity) ? SPLIT_READY : color);
                split.bringToFront();
                split.setVisibility(TextView.VISIBLE);
                int currentMillis = RequiredPatches.readLatestCheckpointCurrentMillis();
                int ghostMillis = RequiredPatches.readLatestCheckpointGhostMillis();
                int lastCheckpointMillis = RequiredPatches.readSplitLastCheckpointMillis();
                int engineCheckpoint = RequiredPatches.readSplitEngineLastCheckpointIndex();
                int liveCount = RequiredPatches.readSplitLiveCheckpointCount();
                int effectiveGhostCount = RequiredPatches.readSplitGhostCheckpointCount();
                int officialGhostCount = RequiredPatches.readSplitOfficialGhostCheckpointCount();
                ModDebugLog.log(String.format(Locale.US,
                        "split checkpoint=%d current_ms=%d ghost_ms=%d delta_ms=%d cumulative_delta_ms=%d mode=%s last_checkpoint_ms=%d scanned_checkpoint=%d decoded_engine_checkpoint=%d engine_checkpoint=%d selected_checkpoint=%d live_count=%d effective_ghost_count=%d official_ghost_count=%d live_cp_ms=%d live_appended_ms=%d official_ghost_cp_ms=%d replay_header_size=%d replay_header_checkpoints=%d replay_header_finish_ms=%d ghost_pos=%d last_ghost_pos=%d last_replay_size=%d replay_visual_ms=%d ghost_visual_ms=%d visual_delta_ms=%d ghost_checkpoint_dist_sq1000=%d ghost_retry_index=%d last_ghost_retry_index=%d ghost_retry_pause=%d last_ghost_retry_pause=%d ghost_retry_count=%d live_array=%s official_ghost_array=%s color=%s list=%s",
                        checkpointCount, currentMillis, ghostMillis, displayMillis, splitMillis,
                        sectorMode ? "sector" : "checkpoint",
                        lastCheckpointMillis, RequiredPatches.readSplitScannedCheckpointIndex(),
                        RequiredPatches.readSplitDecodedEngineCheckpointIndex(),
                        engineCheckpoint, RequiredPatches.readSplitResolvedCheckpoint(),
                        liveCount, effectiveGhostCount, officialGhostCount,
                        RequiredPatches.readSplitLiveArrayMillis(checkpointCount - 1),
                        RequiredPatches.readSplitLiveArrayMillis(
                                effectiveGhostCount + checkpointCount - 1),
                        RequiredPatches.readSplitOfficialGhostArrayMillis(checkpointCount - 1),
                        RequiredPatches.readSplitReplayHeaderSize(),
                        RequiredPatches.readSplitReplayHeaderCheckpointCount(),
                        RequiredPatches.readSplitReplayHeaderFinishMillis(),
                        RequiredPatches.readSplitGhostPos(),
                        RequiredPatches.readSplitLastGhostPos(),
                        RequiredPatches.readSplitLastReplaySize(),
                        RequiredPatches.readSplitReplayVisualMillis(),
                        RequiredPatches.readSplitGhostVisualMillis(),
                        RequiredPatches.readSplitVisualDeltaMillis(),
                        RequiredPatches.readSplitGhostCheckpointDistanceSq1000(),
                        RequiredPatches.readSplitGhostRetrySkipIndex(),
                        RequiredPatches.readSplitLastGhostRetrySkipIndex(),
                        RequiredPatches.readSplitGhostRetryPauseTime(),
                        RequiredPatches.readSplitLastGhostRetryPauseTime(),
                        RequiredPatches.readSplitGhostRetrySkipCount(),
                        liveArrayTrace(liveCount), officialGhostArrayTrace(officialGhostCount),
                        splitColorName(displayMillis), ModMenu.splitListEnabled(activity)));
            }

            private int sectorSplitMillis(int checkpointCount, int cumulativeSplitMillis) {
                int previous = previousCumulativeSplitMillis(checkpointCount - 1);
                return previous == Integer.MIN_VALUE
                        ? cumulativeSplitMillis
                        : cumulativeSplitMillis - previous;
            }

            private int previousCumulativeSplitMillis(int checkpointCount) {
                for (int i = splitHistory.size() - 1; i >= 0; i--) {
                    SplitEntry entry = splitHistory.get(i);
                    if (entry.checkpoint == checkpointCount) return entry.cumulativeMillis;
                }
                return Integer.MIN_VALUE;
            }

            private String splitLine(int checkpointCount, int splitMillis, boolean sectorMode) {
                boolean gained = splitMillis <= 0;
                return String.format(Locale.US, "%s%d %s%.2f",
                        sectorMode ? "S" : "CP",
                        checkpointCount, gained ? "-" : "+", Math.abs(splitMillis) / 1000.0f);
            }

            private CharSequence displayText(String latest) {
                if (!ModMenu.splitListEnabled(activity) || splitHistory.isEmpty()) {
                    return latest.startsWith("SPLIT") ? latest : "SPLIT " + latest;
                }
                SpannableStringBuilder builder = new SpannableStringBuilder("SPLITS");
                for (int i = 0; i < splitHistory.size(); i++) {
                    SplitEntry entry = splitHistory.get(i);
                    builder.append('\n');
                    int start = builder.length();
                    builder.append(entry.line);
                    builder.setSpan(new ForegroundColorSpan(entry.color), start, builder.length(),
                            Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
                }
                return builder;
            }

            private void applyLayoutOptions(TextView split) {
                split.setAlpha(ModMenu.splitAlphaPercent(activity) / 100.0f);
                ViewGroup.LayoutParams params = split.getLayoutParams();
                if (params instanceof FrameLayout.LayoutParams) {
                    FrameLayout.LayoutParams frame = (FrameLayout.LayoutParams) params;
                    int left = dp(activity, ModMenu.splitXdp(activity));
                    int top = dp(activity, ModMenu.splitYdp(activity));
                    if (frame.leftMargin != left || frame.topMargin != top) {
                        frame.leftMargin = left;
                        frame.topMargin = top;
                        split.setLayoutParams(frame);
                    }
                }
            }

            private int splitColor(int splitMillis) {
                if (splitMillis < 0) return SPLIT_FAST;
                if (splitMillis > 0) return SPLIT_SLOW;
                return SPLIT_READY;
            }

            private String splitColorName(int splitMillis) {
                if (splitMillis < 0) return "green";
                if (splitMillis > 0) return "red";
                return "yellow";
            }

            private void logArmedDiagnostics(String reason) {
                long now = System.currentTimeMillis();
                if (now < nextArmedDiagnosticAt) return;
                nextArmedDiagnosticAt = now + ("waiting".equals(reason) ? 10000L : 2000L);
                ModDebugLog.log(String.format(Locale.US,
                        "split armed reason=%s live_count=%d ghost_count=%d ghost_size=%d show_replay=%d scanned_checkpoint=%d decoded_engine_checkpoint=%d engine_checkpoint=%d last_checkpoint_ms=%d",
                        reason,
                        RequiredPatches.readSplitLiveCheckpointCount(),
                        RequiredPatches.readSplitGhostCheckpointCount(),
                        RequiredPatches.readSplitGhostSize(),
                        RequiredPatches.readSplitShowReplayFlag(),
                        RequiredPatches.readSplitScannedCheckpointIndex(),
                        RequiredPatches.readSplitDecodedEngineCheckpointIndex(),
                        RequiredPatches.readSplitEngineLastCheckpointIndex(),
                        RequiredPatches.readSplitLastCheckpointMillis()));
            }

            private void logGhostCheckpoints(int checkpointCount) {
                if (checkpointCount <= loggedGhostCheckpointCount) return;
                for (int checkpoint = loggedGhostCheckpointCount + 1;
                        checkpoint <= checkpointCount; checkpoint++) {
                    ModDebugLog.log(String.format(Locale.US,
                            "ghost checkpoint=%d ghost_ms=%d",
                            checkpoint, RequiredPatches.readGhostCheckpointMillis(checkpoint)));
                }
                loggedGhostCheckpointCount = checkpointCount;
            }

            private String liveArrayTrace(int count) {
                int limit = Math.min(Math.max(count, 0), 12);
                StringBuilder builder = new StringBuilder("[");
                for (int i = 0; i < limit; i++) {
                    if (i > 0) builder.append(',');
                    builder.append(i + 1).append(':')
                            .append(RequiredPatches.readSplitLiveArrayMillis(i));
                }
                if (count > limit) builder.append(",...");
                builder.append(']');
                return builder.toString();
            }

            private String officialGhostArrayTrace(int count) {
                int limit = Math.min(Math.max(count, 0), 12);
                StringBuilder builder = new StringBuilder("[");
                for (int i = 0; i < limit; i++) {
                    if (i > 0) builder.append(',');
                    builder.append(i + 1).append(':')
                            .append(RequiredPatches.readSplitOfficialGhostArrayMillis(i));
                }
                if (count > limit) builder.append(",...");
                builder.append(']');
                return builder.toString();
            }
        });
    }

    private static int dp(Activity activity, int value) {
        return (int) (value * activity.getResources().getDisplayMetrics().density + 0.5f);
    }
}
