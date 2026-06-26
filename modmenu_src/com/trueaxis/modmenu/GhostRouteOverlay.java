package com.trueaxis.modmenu;

import android.app.Activity;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;

/**
 * Read-only ghost route line overlay.
 *
 * <p>The native bridge reconstructs the entire ghost world-space path from the
 * engine's decompressed {@code g_pGhost} replay buffer (replaying the stock
 * per-node integration) and exposes the camera modelview/projection matrices.
 * This view projects that path to screen and draws it as a semi-transparent,
 * control-state coloured line. The whole route is reconstructed once when the
 * ghost is loaded, so it is plotted ahead of the ghost immediately. Nothing
 * here writes game memory, replay data, timing, score, physics, or input.</p>
 */
final class GhostRouteOverlay extends View {
    private static final int COLOR_ACCEL = Color.rgb(0, 220, 80);
    private static final int COLOR_BOOST = Color.rgb(40, 200, 255);
    private static final int COLOR_COAST = Color.rgb(255, 210, 0);
    private static final int COLOR_BRAKE = Color.rgb(255, 70, 70);
    private static final int CLASS_ACCEL = 0;
    private static final int CLASS_BOOST = 1;
    private static final int CLASS_COAST = 2;
    private static final int CLASS_BRAKE = 3;
    private static final int ROUTE_STRIDE = 4;
    private static final int POLL_MS = 1000;
    private static final int MAX_DRAW_POINTS = 700;

    private final Activity activity;
    private final Paint[] paints = new Paint[4];
    private final Paint underlayPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final float[] matrices = new float[35];
    private final float[] viewProjection = new float[16];

    private float[] route;
    private int routePoints;
    private int loadedCount = -1;
    private float[] screenX;
    private float[] screenY;
    private boolean[] onScreen;
    private int[] segmentClass;
    private float[][] segmentBatch;
    private final int[] segmentCount = new int[4];
    private final Handler handler = new Handler(Looper.getMainLooper());
    private boolean haveMatrices;
    private boolean usingTopDownFallback;
    private boolean loggedFirstDraw;
    private boolean loggedProjectionFallback;
    private boolean projectionBrokenFallback;
    private boolean needsDraw;
    private boolean disabled;

    private GhostRouteOverlay(Activity activity) {
        super(activity);
        this.activity = activity;
        setWillNotDraw(false);
        setClickable(false);
        setFocusable(false);
        for (int i = 0; i < paints.length; i++) {
            Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeCap(Paint.Cap.ROUND);
            paint.setStrokeJoin(Paint.Join.ROUND);
            paints[i] = paint;
        }
        underlayPaint.setStyle(Paint.Style.STROKE);
        underlayPaint.setStrokeCap(Paint.Cap.ROUND);
        underlayPaint.setStrokeJoin(Paint.Join.ROUND);
        underlayPaint.setColor(Color.BLACK);
        paints[CLASS_ACCEL].setColor(COLOR_ACCEL);
        paints[CLASS_BOOST].setColor(COLOR_BOOST);
        paints[CLASS_COAST].setColor(COLOR_COAST);
        paints[CLASS_BRAKE].setColor(COLOR_BRAKE);
    }

    static void install(final Activity activity) {
        final ViewGroup content = (ViewGroup) activity.findViewById(android.R.id.content);
        if (content == null) return;

        final GhostRouteOverlay overlay = new GhostRouteOverlay(activity);
        FrameLayout.LayoutParams layout = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
        layout.gravity = Gravity.TOP | Gravity.LEFT;
        content.addView(overlay, layout);
        overlay.bringToFront();
        if (Build.VERSION.SDK_INT >= 21) {
            overlay.setTranslationZ(999.0f);
        }
        ModDebugLog.log("ghost route overlay installed");
        overlay.handler.post(overlay.pollRunnable);
    }

    private final Runnable pollRunnable = new Runnable() {
        public void run() {
            if (activity.isFinishing() || disabled) return;
            try {
                tick();
            } catch (Throwable error) {
                disabled = true;
                setVisibility(GONE);
                ModDebugLog.module("ghost", "ghost route overlay failed; disabling", error);
                return;
            }
            handler.postDelayed(this, POLL_MS);
        }
    };

    private void tick() {
        if (!ModMenu.ghostRouteEnabled(activity)) {
            if (getVisibility() != GONE) setVisibility(GONE);
            return;
        }
        int count = RequiredPatches.readGhostRoutePointCount();
        if (count < 2) {
            routePoints = 0;
            loadedCount = -1;
            if (getVisibility() != GONE) setVisibility(GONE);
            return;
        }
        if (count != loadedCount) {
            loadRoute(count);
        }
        if (routePoints < 2) {
            if (getVisibility() != GONE) setVisibility(GONE);
            return;
        }
        int alpha = ModMenu.ghostRouteAlphaPercent(activity) * 255 / 100;
        float thickness = ModMenu.ghostRouteThicknessDp(activity)
                * activity.getResources().getDisplayMetrics().density;
        underlayPaint.setAlpha(Math.min(220, Math.max(110, alpha + 70)));
        underlayPaint.setStrokeWidth(thickness + activity.getResources().getDisplayMetrics().density * 3.0f);
        for (Paint paint : paints) {
            paint.setAlpha(alpha);
            paint.setStrokeWidth(thickness);
        }
        haveMatrices = RequiredPatches.readGhostViewMatrices(matrices) == 1;
        if (getVisibility() != VISIBLE) setVisibility(VISIBLE);
        if (needsDraw || (haveMatrices && !projectionBrokenFallback)) {
            needsDraw = false;
            invalidate();
        }
    }

    private void loadRoute(int count) {
        float[] buffer = new float[count * ROUTE_STRIDE];
        int got = RequiredPatches.readGhostRoute(buffer);
        if (got < 2) {
            routePoints = 0;
            loadedCount = -1;
            return;
        }
        if (got > MAX_DRAW_POINTS) {
            int compactPoints = MAX_DRAW_POINTS;
            float[] compact = new float[compactPoints * ROUTE_STRIDE];
            for (int i = 0; i < compactPoints; i++) {
                int source = Math.round(i * (got - 1) / (float) (compactPoints - 1));
                System.arraycopy(buffer, source * ROUTE_STRIDE,
                        compact, i * ROUTE_STRIDE, ROUTE_STRIDE);
            }
            route = compact;
            routePoints = compactPoints;
        } else {
            route = buffer;
            routePoints = got;
        }
        loadedCount = count;
        screenX = new float[routePoints];
        screenY = new float[routePoints];
        onScreen = new boolean[routePoints];
        segmentClass = new int[routePoints];
        segmentBatch = new float[4][];
        for (int i = 0; i < 4; i++) {
            segmentBatch[i] = new float[(routePoints - 1) * 4];
        }
        classifySegmentsFromRoute();
        loggedFirstDraw = false;
        loggedProjectionFallback = false;
        projectionBrokenFallback = false;
        needsDraw = true;
        ModDebugLog.log("ghost route reconstructed points=" + got
                + " draw_points=" + routePoints + " nodes=" + count);
    }

    private void classifySegmentsFromRoute() {
        float maxSpeed = 0.0f;
        float previousSpeed = 0.0f;
        for (int i = 0; i + 1 < routePoints; i++) {
            float speed = segmentSpeed(i);
            if (speed > maxSpeed) maxSpeed = speed;
        }
        float accelEps = Math.max(maxSpeed * 0.01f, 1.0e-4f);
        float boostFloor = maxSpeed * 0.85f;
        for (int i = 0; i + 1 < routePoints; i++) {
            int nativeClass = Math.round(route[i * ROUTE_STRIDE + 3]);
            if (nativeClass >= CLASS_ACCEL && nativeClass <= CLASS_BRAKE) {
                segmentClass[i] = nativeClass;
                previousSpeed = segmentSpeed(i);
                continue;
            }
            float speed = segmentSpeed(i);
            float delta = speed - previousSpeed;
            int classification;
            if (maxSpeed > 0.0f && speed >= boostFloor) {
                classification = CLASS_BOOST;
            } else if (delta > accelEps) {
                classification = CLASS_ACCEL;
            } else if (delta < -accelEps) {
                classification = CLASS_BRAKE;
            } else {
                classification = CLASS_COAST;
            }
            segmentClass[i] = classification;
            previousSpeed = speed;
        }
    }

    private float segmentSpeed(int index) {
        int a = index * ROUTE_STRIDE;
        int b = (index + 1) * ROUTE_STRIDE;
        float dx = route[b] - route[a];
        float dy = route[b + 1] - route[a + 1];
        float dz = route[b + 2] - route[a + 2];
        return (float) Math.sqrt(dx * dx + dy * dy + dz * dz);
    }

    protected void onDraw(Canvas canvas) {
        if (disabled || route == null || routePoints < 2) return;
        int width = getWidth();
        int height = getHeight();
        if (width <= 0 || height <= 0) return;

        if (haveMatrices) {
            buildViewProjection();
            projectRoute(width, height);
            usingTopDownFallback = false;
            if (visibleSegmentCount() == 0) {
                projectRouteForwardFallback(width, height);
                if (!loggedProjectionFallback) {
                    loggedProjectionFallback = true;
                    ModDebugLog.module("ghost",
                            "using forward ghost route fallback; camera projection produced no visible segments");
                }
                projectionBrokenFallback = true;
            }
        } else {
            projectRouteForwardFallback(width, height);
            projectionBrokenFallback = true;
        }

        for (int i = 0; i < 4; i++) segmentCount[i] = 0;
        for (int i = 0; i + 1 < routePoints; i++) {
            if (!onScreen[i] || !onScreen[i + 1]) continue;
            int classification = segmentClass[i];
            float[] batch = segmentBatch[classification];
            int offset = segmentCount[classification];
            batch[offset] = screenX[i];
            batch[offset + 1] = screenY[i];
            batch[offset + 2] = screenX[i + 1];
            batch[offset + 3] = screenY[i + 1];
            segmentCount[classification] = offset + 4;
        }
        int totalSegments = 0;
        for (int i = 0; i < 4; i++) totalSegments += segmentCount[i] / 4;
        if (!loggedFirstDraw) {
            loggedFirstDraw = true;
            ModDebugLog.module("ghost",
                    "ghost route draw segments=" + totalSegments
                            + " points=" + routePoints
                            + " fallback=" + usingTopDownFallback
                            + " matrices=" + haveMatrices
                            + " width=" + width
                            + " height=" + height);
        }
        for (int i = 0; i < 4; i++) {
            if (segmentCount[i] > 0) {
                canvas.drawLines(segmentBatch[i], 0, segmentCount[i], underlayPaint);
                canvas.drawLines(segmentBatch[i], 0, segmentCount[i], paints[i]);
            }
        }
    }



    /** viewProjection = projection * modelview, both column-major. */
    private void buildViewProjection() {
        for (int col = 0; col < 4; col++) {
            for (int row = 0; row < 4; row++) {
                float sum = 0.0f;
                for (int k = 0; k < 4; k++) {
                    sum += matrices[16 + k * 4 + row] * matrices[col * 4 + k];
                }
                viewProjection[col * 4 + row] = sum;
            }
        }
    }

    private void projectRoute(int width, int height) {
        float m0 = viewProjection[0], m4 = viewProjection[4], m8 = viewProjection[8], m12 = viewProjection[12];
        float m1 = viewProjection[1], m5 = viewProjection[5], m9 = viewProjection[9], m13 = viewProjection[13];
        float m3 = viewProjection[3], m7 = viewProjection[7], m11 = viewProjection[11], m15 = viewProjection[15];
        for (int i = 0; i < routePoints; i++) {
            float x = route[i * ROUTE_STRIDE];
            float y = route[i * ROUTE_STRIDE + 1];
            float z = route[i * ROUTE_STRIDE + 2];
            float clipW = m3 * x + m7 * y + m11 * z + m15;
            if (clipW <= 1.0e-4f) {
                onScreen[i] = false;
                continue;
            }
            float clipX = m0 * x + m4 * y + m8 * z + m12;
            float clipY = m1 * x + m5 * y + m9 * z + m13;
            float ndcX = clipX / clipW;
            float ndcY = clipY / clipW;
            float sx = (ndcX * 0.5f + 0.5f) * width;
            float sy = (1.0f - (ndcY * 0.5f + 0.5f)) * height;
            screenX[i] = sx;
            screenY[i] = sy;
            onScreen[i] = sx > -width && sx < width * 2.0f && sy > -height && sy < height * 2.0f;
        }
    }

    private void projectRouteForwardFallback(int width, int height) {
        usingTopDownFallback = true;
        float startX = route[0];
        float startZ = route[2];
        int last = (routePoints - 1) * ROUTE_STRIDE;
        float endX = route[last];
        float endZ = route[last + 2];
        float axisX = endX - startX;
        float axisZ = endZ - startZ;
        float axisLen = (float) Math.sqrt(axisX * axisX + axisZ * axisZ);
        if (axisLen < 1.0e-4f) {
            axisX = 0.0f;
            axisZ = 1.0f;
        } else {
            axisX /= axisLen;
            axisZ /= axisLen;
        }
        float sideX = -axisZ;
        float sideZ = axisX;
        float maxAbsSide = 1.0f;
        float totalDistance = 0.0f;
        screenY[0] = 0.0f;
        for (int i = 0; i < routePoints; i++) {
            float x = route[i * ROUTE_STRIDE];
            float y = route[i * ROUTE_STRIDE + 1];
            float z = route[i * ROUTE_STRIDE + 2];
            float dx = x - startX;
            float dz = z - startZ;
            float side = dx * sideX + dz * sideZ;
            float absSide = Math.abs(side);
            if (absSide > maxAbsSide) maxAbsSide = absSide;
            if (i > 0) {
                int previous = (i - 1) * ROUTE_STRIDE;
                float pdx = x - route[previous];
                float pdy = y - route[previous + 1];
                float pdz = z - route[previous + 2];
                totalDistance += (float) Math.sqrt(pdx * pdx + pdy * pdy + pdz * pdz);
                screenY[i] = totalDistance;
            }
        }
        totalDistance = Math.max(totalDistance, 1.0f);
        float centerX = width * 0.5f;
        float horizonY = height * 0.22f;
        float bottomY = height * 0.88f;
        float roadHalfBase = width * 0.42f;
        for (int i = 0; i < routePoints; i++) {
            float x = route[i * ROUTE_STRIDE];
            float z = route[i * ROUTE_STRIDE + 2];
            float dx = x - startX;
            float dz = z - startZ;
            float progress = screenY[i] / totalDistance;
            if (progress < 0.0f) progress = 0.0f;
            if (progress > 1.0f) progress = 1.0f;
            float side = (dx * sideX + dz * sideZ) / maxAbsSide;
            float perspective = 1.0f - progress * 0.72f;
            screenX[i] = centerX + side * roadHalfBase * perspective;
            screenY[i] = bottomY - progress * (bottomY - horizonY);
            onScreen[i] = true;
        }
        if (!loggedProjectionFallback) {
            loggedProjectionFallback = true;
            ModDebugLog.module("ghost", "using forward ghost route fallback; projection matrices unavailable");
        }
    }

    private int visibleSegmentCount() {
        int count = 0;
        for (int i = 0; i + 1 < routePoints; i++) {
            if (onScreen[i] && onScreen[i + 1]) count++;
        }
        return count;
    }
}
