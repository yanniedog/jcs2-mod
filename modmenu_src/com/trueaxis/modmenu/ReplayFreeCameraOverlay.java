package com.trueaxis.modmenu;

import android.app.Activity;
import android.graphics.Color;
import android.graphics.PixelFormat;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;

/** Small replay-intro camera control panel backed by the native g_pCamera hook. */
final class ReplayFreeCameraOverlay {
    private static final int POLL_MS = 100;
    private static final int REPEAT_MS = 45;
    private static final int STATUS_ENABLED = 1;
    private static final int STATUS_IN_LEVEL_INTRO = 2;
    private static final int STATUS_ACTIVE = 4;
    private static final float NORMAL_STEP = 18.0f;
    private static final float FAST_STEP = 55.0f;
    private static final float ROTATE_STEP = 0.045f;
    private static final float DRAG_ROTATE_SCALE = 0.004f;

    private interface Step {
        void run();
    }

    private ReplayFreeCameraOverlay() {
    }

    static void install(final Activity activity) {
        final WindowManager windowManager = (WindowManager) activity.getSystemService(Activity.WINDOW_SERVICE);
        if (windowManager == null) return;

        final LinearLayout panel = new LinearLayout(activity);
        panel.setOrientation(LinearLayout.VERTICAL);
        panel.setPadding(dp(activity, 8), dp(activity, 7), dp(activity, 8), dp(activity, 7));
        panel.setBackgroundDrawable(background(Color.argb(170, 8, 10, 14), dp(activity, 8)));
        panel.setVisibility(View.GONE);

        final TextView status = label(activity, "FREE CAM", 11, Color.rgb(255, 220, 0));
        status.setTypeface(Typeface.create(Typeface.SANS_SERIF, Typeface.BOLD));
        status.setGravity(Gravity.CENTER);
        panel.addView(status, fill());

        final Handler handler = new Handler(Looper.getMainLooper());
        final float[] moveStep = new float[] { NORMAL_STEP };

        final Button mode = button(activity, "Lock");
        final Button reset = button(activity, "Reset");
        final Button speed = button(activity, "Fast");
        mode.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                int bits = RequiredPatches.readReplayFreeCameraStatus();
                boolean active = (bits & STATUS_ACTIVE) != 0;
                RequiredPatches.setReplayFreeCameraLocked(!active);
                ModDebugLog.module("freecam", active ? "return to stock path" : "lock camera");
            }
        });
        reset.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                RequiredPatches.resetReplayFreeCamera();
                ModDebugLog.module("freecam", "reset to stock path");
            }
        });
        speed.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                moveStep[0] = moveStep[0] == NORMAL_STEP ? FAST_STEP : NORMAL_STEP;
                speed.setText(moveStep[0] == NORMAL_STEP ? "Fast" : "Slow");
                ModDebugLog.module("freecam", "speed=" + moveStep[0]);
            }
        });
        panel.addView(row(mode, reset, speed), fill());

        Button forward = button(activity, "FWD");
        Button back = button(activity, "BACK");
        Button up = button(activity, "UP");
        Button down = button(activity, "DOWN");
        repeatButton(forward, handler, new Step() {
            public void run() {
                RequiredPatches.nudgeReplayFreeCamera(0.0f, 0.0f, moveStep[0], 0.0f, 0.0f);
            }
        });
        repeatButton(back, handler, new Step() {
            public void run() {
                RequiredPatches.nudgeReplayFreeCamera(0.0f, 0.0f, -moveStep[0], 0.0f, 0.0f);
            }
        });
        repeatButton(up, handler, new Step() {
            public void run() {
                RequiredPatches.nudgeReplayFreeCamera(0.0f, moveStep[0], 0.0f, 0.0f, 0.0f);
            }
        });
        repeatButton(down, handler, new Step() {
            public void run() {
                RequiredPatches.nudgeReplayFreeCamera(0.0f, -moveStep[0], 0.0f, 0.0f, 0.0f);
            }
        });
        panel.addView(row(forward, back, up, down), fill());

        Button left = button(activity, "LEFT");
        Button right = button(activity, "RIGHT");
        Button lookLeft = button(activity, "LOOK <");
        Button lookRight = button(activity, "LOOK >");
        repeatButton(left, handler, new Step() {
            public void run() {
                RequiredPatches.nudgeReplayFreeCamera(-moveStep[0], 0.0f, 0.0f, 0.0f, 0.0f);
            }
        });
        repeatButton(right, handler, new Step() {
            public void run() {
                RequiredPatches.nudgeReplayFreeCamera(moveStep[0], 0.0f, 0.0f, 0.0f, 0.0f);
            }
        });
        repeatButton(lookLeft, handler, new Step() {
            public void run() {
                RequiredPatches.nudgeReplayFreeCamera(0.0f, 0.0f, 0.0f, -ROTATE_STEP, 0.0f);
            }
        });
        repeatButton(lookRight, handler, new Step() {
            public void run() {
                RequiredPatches.nudgeReplayFreeCamera(0.0f, 0.0f, 0.0f, ROTATE_STEP, 0.0f);
            }
        });
        panel.addView(row(left, right, lookLeft, lookRight), fill());

        Button lookUp = button(activity, "LOOK ^");
        Button lookDown = button(activity, "LOOK v");
        repeatButton(lookUp, handler, new Step() {
            public void run() {
                RequiredPatches.nudgeReplayFreeCamera(0.0f, 0.0f, 0.0f, 0.0f, ROTATE_STEP);
            }
        });
        repeatButton(lookDown, handler, new Step() {
            public void run() {
                RequiredPatches.nudgeReplayFreeCamera(0.0f, 0.0f, 0.0f, 0.0f, -ROTATE_STEP);
            }
        });
        panel.addView(row(lookUp, lookDown), fill());

        TextView lookPad = label(activity, "LOOK", 10, Color.rgb(210, 216, 222));
        lookPad.setGravity(Gravity.CENTER);
        lookPad.setTypeface(Typeface.create(Typeface.SANS_SERIF, Typeface.BOLD));
        lookPad.setBackgroundDrawable(background(Color.argb(110, 255, 255, 255), dp(activity, 5)));
        lookPad.setOnTouchListener(new View.OnTouchListener() {
            private float lastX;
            private float lastY;
            private boolean tracking;

            public boolean onTouch(View v, MotionEvent event) {
                int action = event.getActionMasked();
                if (action == MotionEvent.ACTION_DOWN) {
                    lastX = event.getX();
                    lastY = event.getY();
                    tracking = true;
                    return true;
                }
                if (action == MotionEvent.ACTION_MOVE && tracking) {
                    float x = event.getX();
                    float y = event.getY();
                    float yaw = (x - lastX) * DRAG_ROTATE_SCALE;
                    float pitch = (lastY - y) * DRAG_ROTATE_SCALE;
                    lastX = x;
                    lastY = y;
                    RequiredPatches.nudgeReplayFreeCamera(0.0f, 0.0f, 0.0f, yaw, pitch);
                    return true;
                }
                if (action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL) {
                    tracking = false;
                    return true;
                }
                return true;
            }
        });
        LinearLayout.LayoutParams padParams = fill();
        padParams.topMargin = dp(activity, 4);
        panel.addView(lookPad, padParams);

        final int baseWindowFlags = WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE
                | WindowManager.LayoutParams.FLAG_NOT_TOUCH_MODAL
                | WindowManager.LayoutParams.FLAG_LAYOUT_IN_SCREEN;
        final WindowManager.LayoutParams layout = new WindowManager.LayoutParams(
                dp(activity, 238),
                ViewGroup.LayoutParams.WRAP_CONTENT,
                WindowManager.LayoutParams.TYPE_APPLICATION_PANEL,
                baseWindowFlags | WindowManager.LayoutParams.FLAG_NOT_TOUCHABLE,
                PixelFormat.TRANSLUCENT);
        layout.gravity = Gravity.TOP | Gravity.RIGHT;
        layout.x = dp(activity, 12);
        layout.y = dp(activity, 12);
        if (Build.VERSION.SDK_INT >= 21) {
            panel.setTranslationZ(1200.0f);
        }

        final boolean[] added = new boolean[] { false };
        final boolean[] touchable = new boolean[] { false };
        final Runnable poll = new Runnable() {
            private boolean disabled;
            private boolean lastActive;
            private boolean lastVisible;

            public void run() {
                if (activity.isFinishing() || disabled) {
                    if (added[0]) {
                        try {
                            windowManager.removeView(panel);
                        } catch (Throwable ignored) {
                        }
                        added[0] = false;
                    }
                    return;
                }
                try {
                    int bits = RequiredPatches.readReplayFreeCameraStatus();
                    boolean visible = (bits & STATUS_ENABLED) != 0
                            && (bits & STATUS_IN_LEVEL_INTRO) != 0;
                    boolean active = (bits & STATUS_ACTIVE) != 0;
                    panel.setVisibility(visible ? View.VISIBLE : View.GONE);
                    if (touchable[0] != visible) {
                        layout.flags = visible
                                ? baseWindowFlags
                                : baseWindowFlags | WindowManager.LayoutParams.FLAG_NOT_TOUCHABLE;
                        windowManager.updateViewLayout(panel, layout);
                        touchable[0] = visible;
                    }
                    if (visible) {
                        panel.bringToFront();
                    }
                    if (visible != lastVisible || active != lastActive) {
                        ModDebugLog.module("freecam",
                                "overlay visible=" + visible + " active=" + active
                                        + " status=" + bits);
                        lastVisible = visible;
                        lastActive = active;
                    }
                    mode.setText(active ? "Path" : "Lock");
                    status.setText(active ? "FREE CAM LOCKED" : "FREE CAM PATH");
                    handler.postDelayed(this, POLL_MS);
                } catch (Throwable error) {
                    disabled = true;
                    panel.setVisibility(View.GONE);
                    ModDebugLog.module("freecam", "overlay poll failed; disabling", error);
                }
            }
        };
        handler.post(new Runnable() {
            private int attempts;

            public void run() {
                if (activity.isFinishing() || added[0]) return;
                try {
                    layout.token = activity.getWindow().getDecorView().getWindowToken();
                    if (layout.token == null && attempts++ < 20) {
                        handler.postDelayed(this, 100);
                        return;
                    }
                    windowManager.addView(panel, layout);
                    added[0] = true;
                    ModDebugLog.module("freecam", "overlay installed");
                    handler.post(poll);
                } catch (Throwable error) {
                    if (attempts++ < 20) {
                        handler.postDelayed(this, 100);
                    } else {
                        ModDebugLog.module("freecam", "overlay install failed", error);
                    }
                }
            }
        });
    }

    private static void repeatButton(final Button button, final Handler handler, final Step step) {
        button.setOnTouchListener(new View.OnTouchListener() {
            private boolean holding;
            private final Runnable repeat = new Runnable() {
                public void run() {
                    if (!holding) return;
                    step.run();
                    handler.postDelayed(this, REPEAT_MS);
                }
            };

            public boolean onTouch(View v, MotionEvent event) {
                int action = event.getActionMasked();
                if (action == MotionEvent.ACTION_DOWN) {
                    holding = true;
                    step.run();
                    handler.removeCallbacks(repeat);
                    handler.postDelayed(repeat, REPEAT_MS);
                    return true;
                }
                if (action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL) {
                    holding = false;
                    handler.removeCallbacks(repeat);
                    return true;
                }
                return true;
            }
        });
    }

    private static LinearLayout row(View... children) {
        LinearLayout row = new LinearLayout(children[0].getContext());
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER);
        for (int i = 0; i < children.length; i++) {
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                    0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f);
            if (i > 0) params.leftMargin = dp(children[0].getContext(), 4);
            row.addView(children[i], params);
        }
        return row;
    }

    private static Button button(Activity activity, String text) {
        Button button = new Button(activity);
        button.setText(text);
        button.setTextSize(9.0f);
        button.setAllCaps(false);
        button.setMinHeight(0);
        button.setMinimumHeight(0);
        button.setPadding(dp(activity, 3), dp(activity, 3), dp(activity, 3), dp(activity, 3));
        return button;
    }

    private static TextView label(Activity activity, String text, int size, int color) {
        TextView label = new TextView(activity);
        label.setText(text);
        label.setTextSize((float) size);
        label.setTextColor(color);
        return label;
    }

    private static LinearLayout.LayoutParams fill() {
        return new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
    }

    private static GradientDrawable background(int color, float radius) {
        GradientDrawable drawable = new GradientDrawable();
        drawable.setColor(color);
        drawable.setCornerRadius(radius);
        return drawable;
    }

    private static int dp(android.content.Context context, int value) {
        return (int) (value * context.getResources().getDisplayMetrics().density + 0.5f);
    }
}
