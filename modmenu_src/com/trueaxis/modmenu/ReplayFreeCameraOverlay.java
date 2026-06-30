package com.trueaxis.modmenu;

import android.app.Activity;
import android.graphics.PixelFormat;
import android.os.Build;
import android.os.Environment;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;

import java.io.File;
import java.io.FileOutputStream;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;

/** Transparent replay-intro gesture layer backed by the native g_pCamera hook. */
final class ReplayFreeCameraOverlay {
    private static final int POLL_MS = 50;
    private static final int STATUS_ENABLED = 1;
    private static final int STATUS_IN_LEVEL_INTRO = 2;
    private static final int STATUS_ACTIVE = 4;

    private ReplayFreeCameraOverlay() {
    }

    // #region agent log
    private static void agentLog(String hypothesisId, String location, String message, String dataJson) {
        try {
            File dir = new File(Environment.getExternalStorageDirectory(), "YCS2CommunityMod/logs");
            if (!dir.exists() && !dir.mkdirs()) return;
            File out = new File(dir, "debug-04e8a3.log");
            String line = "{\"sessionId\":\"04e8a3\",\"hypothesisId\":\"" + hypothesisId
                    + "\",\"location\":\"" + location + "\",\"message\":\"" + message
                    + "\",\"data\":" + dataJson + ",\"timestamp\":"
                    + System.currentTimeMillis() + "}\n";
            FileOutputStream stream = new FileOutputStream(out, true);
            stream.write(line.getBytes("UTF-8"));
            stream.close();
        } catch (Throwable ignored) {
        }
    }
    // #endregion

    static void install(final Activity activity) {
        final WindowManager windowManager =
                (WindowManager) activity.getSystemService(Activity.WINDOW_SERVICE);
        if (windowManager == null) return;

        final GestureLayer layer = new GestureLayer(activity);
        layer.setVisibility(View.GONE);
        if (Build.VERSION.SDK_INT >= 21) {
            layer.setTranslationZ(1200.0f);
        }

        final int baseWindowFlags = WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE
                | WindowManager.LayoutParams.FLAG_NOT_TOUCH_MODAL
                | WindowManager.LayoutParams.FLAG_LAYOUT_IN_SCREEN;
        final WindowManager.LayoutParams layout = new WindowManager.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT,
                WindowManager.LayoutParams.TYPE_APPLICATION_PANEL,
                baseWindowFlags,
                PixelFormat.TRANSLUCENT);
        layout.gravity = Gravity.TOP | Gravity.LEFT;

        final Handler handler = new Handler(Looper.getMainLooper());
        final boolean[] added = new boolean[] { false };
        final Runnable poll = new Runnable() {
            private boolean disabled;
            private boolean lastActive;
            private boolean lastTouchable;
            private int attachAttempts;

            public void run() {
                if (activity.isFinishing() || disabled) {
                    removeLayer();
                    return;
                }
                try {
                    int bits = RequiredPatches.readReplayFreeCameraStatus();
                    boolean enabled = (bits & STATUS_ENABLED) != 0;
                    boolean inIntro = (bits & STATUS_IN_LEVEL_INTRO) != 0;
                    boolean visible = enabled && inIntro;
                    boolean active = (bits & STATUS_ACTIVE) != 0;
                    if (visible && !added[0]) {
                        layout.token = activity.getWindow().getDecorView().getWindowToken();
                        if (layout.token != null) {
                            windowManager.addView(layer, layout);
                            added[0] = true;
                            attachAttempts = 0;
                            ModDebugLog.module("freecam", "gesture layer installed");
                        } else if (attachAttempts++ > 20) {
                            ModDebugLog.module("freecam", "gesture layer waiting for window token");
                            attachAttempts = 0;
                        }
                    } else if (!visible && added[0]) {
                        removeLayer();
                    }
                    layer.setReplayTouchable(visible);
                    layer.setVisibility(visible ? View.VISIBLE : View.GONE);
                    if (visible && added[0]) {
                        layer.bringToFront();
                    }
                    if (visible != lastTouchable || active != lastActive) {
                        ModDebugLog.module("freecam",
                                "gesture_layer touchable=" + visible + " active=" + active
                                        + " status=" + bits);
                        // #region agent log
                        agentLog("B", "ReplayFreeCameraOverlay.java:poll",
                                "overlay_visibility",
                                "{\"visible\":" + visible + ",\"active\":" + active
                                        + ",\"enabled\":" + enabled + ",\"inIntro\":" + inIntro
                                        + ",\"added\":" + added[0] + ",\"bits\":" + bits + "}");
                        // #endregion
                        lastTouchable = visible;
                        lastActive = active;
                    }
                    handler.postDelayed(this, POLL_MS);
                } catch (Throwable error) {
                    disabled = true;
                    layer.setReplayTouchable(false);
                    layer.setVisibility(View.GONE);
                    removeLayer();
                    ModDebugLog.module("freecam", "gesture layer poll failed; disabling", error);
                }
            }

            private void removeLayer() {
                if (!added[0]) return;
                try {
                    windowManager.removeView(layer);
                } catch (Throwable ignored) {
                }
                added[0] = false;
                layer.setReplayTouchable(false);
                layer.setVisibility(View.GONE);
            }
        };
        handler.post(poll);
    }

    private static final class GestureLayer extends View {
        private static final float MIN_MOTION_DP = 1.5f;
        private static final float PAN_UNITS_PER_DP = 0.85f;
        private static final float DOLLY_UNITS_PER_DP = 1.45f;
        private static final float CAR_UNITS_PER_DP = 1.10f;
        private static final float ROTATE_DEADZONE = 0.004f;
        private static final float MAX_TRANSLATE = 140.0f;
        private static final float MAX_ROTATE = 0.16f;

        private final float density;
        private boolean replayTouchable;
        private boolean haveBaseline;
        private int mode;
        private float lastCentroidX;
        private float lastCentroidY;
        private float lastDistance;
        private float lastAngle;
        private float downX;
        private float downY;
        private float maxMoveDp;
        private boolean consumedDown;
        private boolean gestureActive;

        GestureLayer(Activity activity) {
            super(activity);
            density = Math.max(0.75f, activity.getResources().getDisplayMetrics().density);
            setWillNotDraw(true);
            setFocusable(false);
            setFocusableInTouchMode(false);
        }

        void setReplayTouchable(boolean touchable) {
            replayTouchable = touchable;
            if (!touchable) {
                resetGesture();
            }
        }

        public boolean onTouchEvent(MotionEvent event) {
            if (!replayTouchable) return false;
            int action = event.getActionMasked();
            int pointerCount = event.getPointerCount();
            boolean handled = true;
            if (action == MotionEvent.ACTION_DOWN) {
                downX = event.getX();
                downY = event.getY();
                maxMoveDp = 0.0f;
                consumedDown = true;
                gestureActive = false;
            } else if (action == MotionEvent.ACTION_POINTER_DOWN) {
                gestureActive = true;
                resetBaseline(event);
            } else if (action == MotionEvent.ACTION_MOVE) {
                if (pointerCount == 1 && consumedDown) {
                    float dxDp = (event.getX() - downX) / density;
                    float dyDp = (event.getY() - downY) / density;
                    float moveDp = (float) Math.sqrt(dxDp * dxDp + dyDp * dyDp);
                    if (moveDp > maxMoveDp) maxMoveDp = moveDp;
                    if (!gestureActive && maxMoveDp >= MIN_MOTION_DP) {
                        gestureActive = true;
                        resetBaseline(event);
                    }
                } else if (pointerCount >= 2 && !gestureActive) {
                    gestureActive = true;
                    resetBaseline(event);
                }
                if (gestureActive) {
                    handleMove(event);
                }
            } else if (action == MotionEvent.ACTION_POINTER_UP) {
                if (gestureActive) {
                    haveBaseline = false;
                    mode = 0;
                }
            } else if (action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL) {
                boolean tapLike = consumedDown && !gestureActive
                        && maxMoveDp < MIN_MOTION_DP && pointerCount <= 1;
                boolean forwarded = false;
                if (tapLike) {
                    forwarded = forwardTap(downX, downY);
                }
                // #region agent log
                agentLog(tapLike ? "A" : "E", "ReplayFreeCameraOverlay.java:onTouchEvent",
                        tapLike ? "tap_forwarded_to_game" : "gesture_or_multi_touch_end",
                        "{\"action\":" + action + ",\"pointerCount\":" + pointerCount
                                + ",\"maxMoveDp\":" + maxMoveDp + ",\"downX\":" + downX
                                + ",\"downY\":" + downY + ",\"tapLike\":" + tapLike
                                + ",\"forwarded\":" + forwarded + "}");
                // #endregion
                resetGesture();
            } else {
                handled = true;
            }
            // #region agent log
            if (action == MotionEvent.ACTION_DOWN) {
                agentLog("A", "ReplayFreeCameraOverlay.java:onTouchEvent",
                        "touch_down_claimed",
                        "{\"x\":" + event.getX() + ",\"y\":" + event.getY()
                                + ",\"pointerCount\":" + pointerCount + ",\"handled\":" + handled + "}");
            } else if (action == MotionEvent.ACTION_POINTER_DOWN) {
                agentLog("C", "ReplayFreeCameraOverlay.java:onTouchEvent",
                        "pointer_down_claimed",
                        "{\"pointerCount\":" + pointerCount + ",\"handled\":" + handled + "}");
            }
            // #endregion
            return handled;
        }

        private boolean forwardTap(float x, float y) {
            if (!(getContext() instanceof Activity)) return false;
            Activity activity = (Activity) getContext();
            View target = activity.getWindow().getDecorView();
            if (target == null) return false;
            long now = SystemClock.uptimeMillis();
            MotionEvent down = MotionEvent.obtain(now, now, MotionEvent.ACTION_DOWN, x, y, 0);
            MotionEvent up = MotionEvent.obtain(now, now + 12, MotionEvent.ACTION_UP, x, y, 0);
            try {
                target.dispatchTouchEvent(down);
                target.dispatchTouchEvent(up);
                ModDebugLog.module("freecam",
                        "tap forwarded x=" + fmt(x) + " y=" + fmt(y));
                return true;
            } finally {
                down.recycle();
                up.recycle();
            }
        }

        private void handleMove(MotionEvent event) {
            int pointerCount = event.getPointerCount();
            if (pointerCount < 1 || pointerCount > 3) {
                resetGesture();
                return;
            }
            if (!haveBaseline || mode != pointerCount) {
                resetBaseline(event);
                return;
            }
            float centroidX = centroidX(event);
            float centroidY = centroidY(event);
            float dxDp = (centroidX - lastCentroidX) / density;
            float dyDp = (centroidY - lastCentroidY) / density;
            if (pointerCount == 1) {
                if (smallTranslation(dxDp, dyDp)) return;
                applyGesture(clamp(-dxDp * PAN_UNITS_PER_DP, MAX_TRANSLATE),
                        clamp(dyDp * PAN_UNITS_PER_DP, MAX_TRANSLATE),
                        0.0f, 0.0f, 0.0f, 0.0f, 0.0f, "pan");
                lastCentroidX = centroidX;
                lastCentroidY = centroidY;
                return;
            }
            if (pointerCount == 2) {
                float distance = distance(event);
                float angle = angle(event);
                float distanceDp = (distance - lastDistance) / density;
                float yaw = normalizeAngle(angle - lastAngle);
                boolean moved = false;
                float forward = 0.0f;
                if (Math.abs(distanceDp) >= MIN_MOTION_DP) {
                    forward = clamp(distanceDp * DOLLY_UNITS_PER_DP, MAX_TRANSLATE);
                    moved = true;
                }
                if (Math.abs(yaw) >= ROTATE_DEADZONE) {
                    yaw = clamp(yaw, MAX_ROTATE);
                    moved = true;
                } else {
                    yaw = 0.0f;
                }
                if (!moved) return;
                applyGesture(0.0f, 0.0f, forward, yaw, 0.0f, 0.0f, 0.0f, "pinch_rotate");
                lastCentroidX = centroidX;
                lastCentroidY = centroidY;
                lastDistance = distance;
                lastAngle = angle;
                return;
            }
            if (smallTranslation(dxDp, dyDp)) return;
            applyGesture(0.0f, 0.0f, 0.0f, 0.0f, 0.0f,
                    clamp(-dxDp * CAR_UNITS_PER_DP, MAX_TRANSLATE),
                    clamp(dyDp * CAR_UNITS_PER_DP, MAX_TRANSLATE), "car_drag");
            lastCentroidX = centroidX;
            lastCentroidY = centroidY;
        }

        private void resetBaseline(MotionEvent event) {
            int pointerCount = event.getPointerCount();
            if (pointerCount < 1 || pointerCount > 3) {
                resetGesture();
                return;
            }
            mode = pointerCount;
            haveBaseline = true;
            lastCentroidX = centroidX(event);
            lastCentroidY = centroidY(event);
            lastDistance = pointerCount >= 2 ? distance(event) : 0.0f;
            lastAngle = pointerCount >= 2 ? angle(event) : 0.0f;
        }

        private void resetGesture() {
            haveBaseline = false;
            mode = 0;
            lastCentroidX = 0.0f;
            lastCentroidY = 0.0f;
            lastDistance = 0.0f;
            lastAngle = 0.0f;
            consumedDown = false;
            maxMoveDp = 0.0f;
            gestureActive = false;
        }

        private boolean smallTranslation(float dxDp, float dyDp) {
            return Math.abs(dxDp) < MIN_MOTION_DP && Math.abs(dyDp) < MIN_MOTION_DP;
        }

        private void applyGesture(float right, float up, float forward, float yaw, float pitch,
                                  float carRight, float carUp, String kind) {
            RequiredPatches.gestureReplayFreeCamera(right, up, forward, yaw, pitch,
                    carRight, carUp);
            ModDebugLog.module("freecam", "gesture=" + kind
                    + " r=" + fmt(right)
                    + " u=" + fmt(up)
                    + " f=" + fmt(forward)
                    + " y=" + fmt(yaw)
                    + " p=" + fmt(pitch)
                    + " cr=" + fmt(carRight)
                    + " cu=" + fmt(carUp));
        }

        private static float centroidX(MotionEvent event) {
            float total = 0.0f;
            int count = event.getPointerCount();
            for (int i = 0; i < count; i++) total += event.getX(i);
            return total / count;
        }

        private static float centroidY(MotionEvent event) {
            float total = 0.0f;
            int count = event.getPointerCount();
            for (int i = 0; i < count; i++) total += event.getY(i);
            return total / count;
        }

        private static float distance(MotionEvent event) {
            int a = firstPointerIndex(event);
            int b = secondPointerIndex(event, a);
            float dx = event.getX(b) - event.getX(a);
            float dy = event.getY(b) - event.getY(a);
            return (float) Math.sqrt(dx * dx + dy * dy);
        }

        private static float angle(MotionEvent event) {
            int a = firstPointerIndex(event);
            int b = secondPointerIndex(event, a);
            return (float) Math.atan2(event.getY(b) - event.getY(a),
                    event.getX(b) - event.getX(a));
        }

        private static int firstPointerIndex(MotionEvent event) {
            int best = 0;
            int bestId = event.getPointerId(0);
            for (int i = 1; i < event.getPointerCount(); i++) {
                int id = event.getPointerId(i);
                if (id < bestId) {
                    best = i;
                    bestId = id;
                }
            }
            return best;
        }

        private static int secondPointerIndex(MotionEvent event, int first) {
            int best = first == 0 ? 1 : 0;
            int bestId = event.getPointerId(best);
            for (int i = 0; i < event.getPointerCount(); i++) {
                if (i == first) continue;
                int id = event.getPointerId(i);
                if (id < bestId) {
                    best = i;
                    bestId = id;
                }
            }
            return best;
        }

        private static float normalizeAngle(float value) {
            while (value > Math.PI) value -= (float) (Math.PI * 2.0);
            while (value < -Math.PI) value += (float) (Math.PI * 2.0);
            return value;
        }

        private static float clamp(float value, float maxAbs) {
            if (value > maxAbs) return maxAbs;
            if (value < -maxAbs) return -maxAbs;
            return value;
        }

        private static String fmt(float value) {
            return String.valueOf(((int) (value * 1000.0f)) / 1000.0f);
        }
    }
}
