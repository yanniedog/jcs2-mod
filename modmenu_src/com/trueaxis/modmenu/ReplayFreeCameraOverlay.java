package com.trueaxis.modmenu;

import android.app.Activity;
import android.graphics.PixelFormat;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.util.DisplayMetrics;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.WindowManager;

/** Transparent replay-only gesture layer backed by the native g_pCamera hook. */
final class ReplayFreeCameraOverlay {
    private static final int POLL_MS = 50;
    private static final int STATUS_ENABLED = 1;
    private static final int STATUS_IN_LEVEL_INTRO = 2;
    private static final int STATUS_ACTIVE = 4;
    private static final int STATUS_IN_REPLAY = 8;

    private static final float GESTURE_MARGIN_X_RATIO = 0.12f;
    private static final float GESTURE_MARGIN_TOP_RATIO = 0.14f;
    private static final float GESTURE_MARGIN_BOTTOM_RATIO = 0.22f;

    private ReplayFreeCameraOverlay() {
    }

    static void install(final Activity activity) {
        final WindowManager windowManager =
                (WindowManager) activity.getSystemService(Activity.WINDOW_SERVICE);
        if (windowManager == null) return;

        final DisplayMetrics metrics = activity.getResources().getDisplayMetrics();
        final int screenW = metrics.widthPixels;
        final int screenH = metrics.heightPixels;
        final int marginX = Math.max(1, (int) (screenW * GESTURE_MARGIN_X_RATIO));
        final int marginTop = Math.max(1, (int) (screenH * GESTURE_MARGIN_TOP_RATIO));
        final int marginBottom = Math.max(1, (int) (screenH * GESTURE_MARGIN_BOTTOM_RATIO));

        final int baseWindowFlags = WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE
                | WindowManager.LayoutParams.FLAG_NOT_TOUCH_MODAL
                | WindowManager.LayoutParams.FLAG_LAYOUT_IN_SCREEN;
        final WindowManager.LayoutParams layout = new WindowManager.LayoutParams(
                Math.max(1, screenW - marginX * 2),
                Math.max(1, screenH - marginTop - marginBottom),
                WindowManager.LayoutParams.TYPE_APPLICATION_PANEL,
                baseWindowFlags,
                PixelFormat.TRANSLUCENT);
        layout.gravity = Gravity.TOP | Gravity.LEFT;
        layout.x = marginX;
        layout.y = marginTop;

        final GestureLayer layer = new GestureLayer(activity);
        layer.setVisibility(View.GONE);
        if (Build.VERSION.SDK_INT >= 21) {
            layer.setTranslationZ(1200.0f);
        }

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
                    boolean inReplay = (bits & STATUS_IN_REPLAY) != 0;
                    boolean visible = enabled && inReplay;
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
                    if (visible != lastTouchable || active != lastActive) {
                        ModDebugLog.module("freecam",
                                "gesture_layer touchable=" + visible + " active=" + active
                                        + " status=" + bits);
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
            int pointerCount = event.getPointerCount();
            int action = event.getActionMasked();

            // Single-finger touches always pass through so buttons and menus always win.
            if (pointerCount < 2) {
                resetGesture();
                return false;
            }

            if (action == MotionEvent.ACTION_POINTER_DOWN) {
                gestureActive = true;
                resetBaseline(event);
            } else if (action == MotionEvent.ACTION_MOVE) {
                if (!gestureActive) {
                    gestureActive = true;
                    resetBaseline(event);
                }
                handleMove(event);
            } else if (action == MotionEvent.ACTION_POINTER_UP) {
                if (event.getPointerCount() <= 2) {
                    haveBaseline = false;
                    mode = 0;
                }
            } else if (action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL) {
                resetGesture();
            }
            return true;
        }

        private void handleMove(MotionEvent event) {
            int pointerCount = event.getPointerCount();
            if (pointerCount < 2 || pointerCount > 3) {
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
            if (pointerCount == 2) {
                float distance = distance(event);
                float angle = angle(event);
                float distanceDp = (distance - lastDistance) / density;
                float yaw = normalizeAngle(angle - lastAngle);
                float forward = 0.0f;
                float yawOut = 0.0f;
                boolean pinchRotate = false;
                if (Math.abs(distanceDp) >= MIN_MOTION_DP) {
                    // Pinch in (fingers closer) zooms out; pinch out zooms in.
                    forward = clamp(-distanceDp * DOLLY_UNITS_PER_DP, MAX_TRANSLATE);
                    pinchRotate = true;
                }
                if (Math.abs(yaw) >= ROTATE_DEADZONE) {
                    yawOut = clamp(yaw, MAX_ROTATE);
                    pinchRotate = true;
                }
                if (pinchRotate) {
                    applyGesture(0.0f, 0.0f, forward, yawOut, 0.0f, 0.0f, 0.0f, "pinch_rotate");
                } else if (!smallTranslation(dxDp, dyDp)) {
                    applyGesture(clamp(-dxDp * PAN_UNITS_PER_DP, MAX_TRANSLATE),
                            clamp(dyDp * PAN_UNITS_PER_DP, MAX_TRANSLATE),
                            0.0f, 0.0f, 0.0f, 0.0f, 0.0f, "pan");
                } else {
                    return;
                }
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
            if (pointerCount < 2 || pointerCount > 3) {
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
