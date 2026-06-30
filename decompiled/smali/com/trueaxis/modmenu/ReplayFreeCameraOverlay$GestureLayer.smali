.class final Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;
.super Landroid/view/View;
.source "ReplayFreeCameraOverlay.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "GestureLayer"
.end annotation


# static fields
.field private static final CAR_UNITS_PER_DP:F = 1.1f

.field private static final DOLLY_UNITS_PER_DP:F = 1.45f

.field private static final MAX_ROTATE:F = 0.16f

.field private static final MAX_TRANSLATE:F = 140.0f

.field private static final MIN_MOTION_DP:F = 1.5f

.field private static final PAN_UNITS_PER_DP:F = 0.85f

.field private static final ROTATE_DEADZONE:F = 0.004f


# instance fields
.field private final density:F

.field private haveBaseline:Z

.field private lastAngle:F

.field private lastCentroidX:F

.field private lastCentroidY:F

.field private lastDistance:F

.field private mode:I

.field private replayTouchable:Z


# direct methods
.method constructor <init>(Landroid/app/Activity;)V
    .registers 3

    .line 134
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 135
    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    iget p1, p1, Landroid/util/DisplayMetrics;->density:F

    const/high16 v0, 0x3f400000

    invoke-static {v0, p1}, Ljava/lang/Math;->max(FF)F

    move-result p1

    iput p1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->density:F

    .line 136
    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->setWillNotDraw(Z)V

    .line 137
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->setFocusable(Z)V

    .line 138
    invoke-virtual {p0, p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->setFocusableInTouchMode(Z)V

    .line 139
    return-void
.end method

.method private static angle(Landroid/view/MotionEvent;)F
    .registers 5

    .line 292
    invoke-static {p0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->firstPointerIndex(Landroid/view/MotionEvent;)I

    move-result v0

    .line 293
    invoke-static {p0, v0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->secondPointerIndex(Landroid/view/MotionEvent;I)I

    move-result v1

    .line 294
    invoke-virtual {p0, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v2

    invoke-virtual {p0, v0}, Landroid/view/MotionEvent;->getY(I)F

    move-result v3

    sub-float/2addr v2, v3

    float-to-double v2, v2

    .line 295
    invoke-virtual {p0, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v1

    invoke-virtual {p0, v0}, Landroid/view/MotionEvent;->getX(I)F

    move-result p0

    sub-float/2addr v1, p0

    float-to-double v0, v1

    .line 294
    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v0

    double-to-float p0, v0

    return p0
.end method

.method private applyGesture(FFFFFFFLjava/lang/String;)V
    .registers 11

    .line 257
    invoke-static/range {p1 .. p7}, Lcom/trueaxis/modmenu/RequiredPatches;->gestureReplayFreeCamera(FFFFFFF)V

    .line 259
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "gesture="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p8

    const-string v0, " r="

    invoke-virtual {p8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p8

    .line 260
    invoke-static {p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->fmt(F)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p8, " u="

    invoke-virtual {p1, p8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 261
    invoke-static {p2}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->fmt(F)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " f="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 262
    invoke-static {p3}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->fmt(F)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " y="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 263
    invoke-static {p4}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->fmt(F)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " p="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 264
    invoke-static {p5}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->fmt(F)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " cr="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 265
    invoke-static {p6}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->fmt(F)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " cu="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 266
    invoke-static {p7}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->fmt(F)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 259
    const-string p2, "freecam"

    invoke-static {p2, p1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 267
    return-void
.end method

.method private static centroidX(Landroid/view/MotionEvent;)F
    .registers 5

    .line 270
    nop

    .line 271
    invoke-virtual {p0}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    .line 272
    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_7
    if-ge v2, v0, :cond_11

    invoke-virtual {p0, v2}, Landroid/view/MotionEvent;->getX(I)F

    move-result v3

    add-float/2addr v1, v3

    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 273
    :cond_11
    int-to-float p0, v0

    div-float/2addr v1, p0

    return v1
.end method

.method private static centroidY(Landroid/view/MotionEvent;)F
    .registers 5

    .line 277
    nop

    .line 278
    invoke-virtual {p0}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    .line 279
    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_7
    if-ge v2, v0, :cond_11

    invoke-virtual {p0, v2}, Landroid/view/MotionEvent;->getY(I)F

    move-result v3

    add-float/2addr v1, v3

    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 280
    :cond_11
    int-to-float p0, v0

    div-float/2addr v1, p0

    return v1
.end method

.method private static clamp(FF)F
    .registers 3

    .line 332
    cmpl-float v0, p0, p1

    if-lez v0, :cond_5

    return p1

    .line 333
    :cond_5
    neg-float p1, p1

    cmpg-float v0, p0, p1

    if-gez v0, :cond_b

    return p1

    .line 334
    :cond_b
    return p0
.end method

.method private static distance(Landroid/view/MotionEvent;)F
    .registers 5

    .line 284
    invoke-static {p0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->firstPointerIndex(Landroid/view/MotionEvent;)I

    move-result v0

    .line 285
    invoke-static {p0, v0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->secondPointerIndex(Landroid/view/MotionEvent;I)I

    move-result v1

    .line 286
    invoke-virtual {p0, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v2

    invoke-virtual {p0, v0}, Landroid/view/MotionEvent;->getX(I)F

    move-result v3

    sub-float/2addr v2, v3

    .line 287
    invoke-virtual {p0, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v1

    invoke-virtual {p0, v0}, Landroid/view/MotionEvent;->getY(I)F

    move-result p0

    sub-float/2addr v1, p0

    .line 288
    mul-float v2, v2, v2

    mul-float v1, v1, v1

    add-float/2addr v2, v1

    float-to-double v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    double-to-float p0, v0

    return p0
.end method

.method private static firstPointerIndex(Landroid/view/MotionEvent;)I
    .registers 5

    .line 299
    nop

    .line 300
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v1

    .line 301
    const/4 v2, 0x1

    :goto_7
    invoke-virtual {p0}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v3

    if-ge v2, v3, :cond_19

    .line 302
    invoke-virtual {p0, v2}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v3

    .line 303
    if-ge v3, v1, :cond_16

    .line 304
    nop

    .line 305
    move v0, v2

    move v1, v3

    .line 301
    :cond_16
    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 308
    :cond_19
    return v0
.end method

.method private static fmt(F)Ljava/lang/String;
    .registers 2

    .line 338
    const/high16 v0, 0x447a0000

    mul-float p0, p0, v0

    float-to-int p0, p0

    int-to-float p0, p0

    div-float/2addr p0, v0

    invoke-static {p0}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private handleMove(Landroid/view/MotionEvent;)V
    .registers 15

    .line 173
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    .line 174
    const/4 v1, 0x1

    if-lt v0, v1, :cond_ec

    const/4 v2, 0x3

    if-le v0, v2, :cond_c

    goto/16 :goto_ec

    .line 178
    :cond_c
    iget-boolean v2, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->haveBaseline:Z

    if-eqz v2, :cond_e8

    iget v2, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->mode:I

    if-eq v2, v0, :cond_16

    goto/16 :goto_e8

    .line 182
    :cond_16
    invoke-static {p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->centroidX(Landroid/view/MotionEvent;)F

    move-result v9

    .line 183
    invoke-static {p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->centroidY(Landroid/view/MotionEvent;)F

    move-result v10

    .line 184
    iget v2, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastCentroidX:F

    sub-float v2, v9, v2

    iget v3, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->density:F

    div-float/2addr v2, v3

    .line 185
    iget v3, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastCentroidY:F

    sub-float v3, v10, v3

    iget v4, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->density:F

    div-float/2addr v3, v4

    .line 186
    const/high16 v4, 0x430c0000

    if-ne v0, v1, :cond_5f

    .line 187
    invoke-direct {p0, v2, v3}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->smallTranslation(FF)Z

    move-result v0

    if-eqz v0, :cond_37

    return-void

    .line 188
    :cond_37
    neg-float v0, v2

    const v1, 0x3f59999a

    mul-float v0, v0, v1

    invoke-static {v0, v4}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->clamp(FF)F

    move-result v2

    mul-float v3, v3, v1

    .line 189
    invoke-static {v3, v4}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->clamp(FF)F

    move-result v3

    .line 188
    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const-string v11, "pan"

    move-object v0, p0

    move v1, v2

    move v2, v3

    move v3, v4

    move v4, v5

    move v5, v6

    move v6, v7

    move v7, v8

    move-object v8, v11

    invoke-direct/range {v0 .. v8}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->applyGesture(FFFFFFFLjava/lang/String;)V

    .line 191
    iput v9, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastCentroidX:F

    .line 192
    iput v10, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastCentroidY:F

    .line 193
    return-void

    .line 195
    :cond_5f
    const/4 v5, 0x2

    if-ne v0, v5, :cond_c1

    .line 196
    invoke-static {p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->distance(Landroid/view/MotionEvent;)F

    move-result v11

    .line 197
    invoke-static {p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->angle(Landroid/view/MotionEvent;)F

    move-result v12

    .line 198
    iget v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastDistance:F

    sub-float v0, v11, v0

    iget v2, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->density:F

    div-float/2addr v0, v2

    .line 199
    iget v2, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastAngle:F

    sub-float v2, v12, v2

    invoke-static {v2}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->normalizeAngle(F)F

    move-result v2

    .line 200
    nop

    .line 201
    nop

    .line 202
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v3

    const/high16 v5, 0x3fc00000

    const/4 v6, 0x0

    cmpl-float v3, v3, v5

    if-ltz v3, :cond_92

    .line 203
    const v3, 0x3fb9999a

    mul-float v0, v0, v3

    invoke-static {v0, v4}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->clamp(FF)F

    move-result v0

    .line 204
    move v3, v0

    const/4 v0, 0x1

    goto :goto_94

    .line 202
    :cond_92
    const/4 v0, 0x0

    const/4 v3, 0x0

    .line 206
    :goto_94
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v4

    const v5, 0x3b83126f

    cmpl-float v4, v4, v5

    if-ltz v4, :cond_a8

    .line 207
    const v0, 0x3e23d70a

    invoke-static {v2, v0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->clamp(FF)F

    move-result v0

    .line 208
    move v4, v0

    goto :goto_aa

    .line 210
    :cond_a8
    move v1, v0

    const/4 v4, 0x0

    .line 212
    :goto_aa
    if-nez v1, :cond_ad

    return-void

    .line 213
    :cond_ad
    const/4 v7, 0x0

    const-string v8, "pinch_rotate"

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v0, p0

    invoke-direct/range {v0 .. v8}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->applyGesture(FFFFFFFLjava/lang/String;)V

    .line 214
    iput v9, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastCentroidX:F

    .line 215
    iput v10, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastCentroidY:F

    .line 216
    iput v11, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastDistance:F

    .line 217
    iput v12, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastAngle:F

    .line 218
    return-void

    .line 220
    :cond_c1
    invoke-direct {p0, v2, v3}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->smallTranslation(FF)Z

    move-result v0

    if-eqz v0, :cond_c8

    return-void

    .line 221
    :cond_c8
    neg-float v0, v2

    const v1, 0x3f8ccccd

    mul-float v0, v0, v1

    .line 222
    invoke-static {v0, v4}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->clamp(FF)F

    move-result v6

    mul-float v3, v3, v1

    .line 223
    invoke-static {v3, v4}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->clamp(FF)F

    move-result v7

    .line 221
    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const-string v8, "car_drag"

    move-object v0, p0

    invoke-direct/range {v0 .. v8}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->applyGesture(FFFFFFFLjava/lang/String;)V

    .line 224
    iput v9, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastCentroidX:F

    .line 225
    iput v10, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastCentroidY:F

    .line 226
    return-void

    .line 179
    :cond_e8
    :goto_e8
    invoke-direct {p0, p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->resetBaseline(Landroid/view/MotionEvent;)V

    .line 180
    return-void

    .line 175
    :cond_ec
    :goto_ec
    invoke-direct {p0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->resetGesture()V

    .line 176
    return-void
.end method

.method private static normalizeAngle(F)F
    .registers 7

    .line 326
    nop

    :goto_1
    float-to-double v0, p0

    const-wide v2, 0x400921fb54442d18L

    const v4, 0x40c90fdb

    cmpl-double v5, v0, v2

    if-lez v5, :cond_10

    sub-float/2addr p0, v4

    goto :goto_1

    .line 327
    :cond_10
    :goto_10
    float-to-double v0, p0

    const-wide v2, -0x3ff6de04abbbd2e8L

    cmpg-double v5, v0, v2

    if-gez v5, :cond_1c

    add-float/2addr p0, v4

    goto :goto_10

    .line 328
    :cond_1c
    return p0
.end method

.method private resetBaseline(Landroid/view/MotionEvent;)V
    .registers 6

    .line 229
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    .line 230
    const/4 v1, 0x1

    if-lt v0, v1, :cond_30

    const/4 v2, 0x3

    if-le v0, v2, :cond_b

    goto :goto_30

    .line 234
    :cond_b
    iput v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->mode:I

    .line 235
    iput-boolean v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->haveBaseline:Z

    .line 236
    invoke-static {p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->centroidX(Landroid/view/MotionEvent;)F

    move-result v1

    iput v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastCentroidX:F

    .line 237
    invoke-static {p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->centroidY(Landroid/view/MotionEvent;)F

    move-result v1

    iput v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastCentroidY:F

    .line 238
    const/4 v1, 0x0

    const/4 v2, 0x2

    if-lt v0, v2, :cond_24

    invoke-static {p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->distance(Landroid/view/MotionEvent;)F

    move-result v3

    goto :goto_25

    :cond_24
    const/4 v3, 0x0

    :goto_25
    iput v3, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastDistance:F

    .line 239
    if-lt v0, v2, :cond_2d

    invoke-static {p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->angle(Landroid/view/MotionEvent;)F

    move-result v1

    :cond_2d
    iput v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastAngle:F

    .line 240
    return-void

    .line 231
    :cond_30
    :goto_30
    invoke-direct {p0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->resetGesture()V

    .line 232
    return-void
.end method

.method private resetGesture()V
    .registers 2

    .line 243
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->haveBaseline:Z

    .line 244
    iput v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->mode:I

    .line 245
    const/4 v0, 0x0

    iput v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastCentroidX:F

    .line 246
    iput v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastCentroidY:F

    .line 247
    iput v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastDistance:F

    .line 248
    iput v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastAngle:F

    .line 249
    return-void
.end method

.method private static secondPointerIndex(Landroid/view/MotionEvent;I)I
    .registers 6

    .line 312
    const/4 v0, 0x0

    if-nez p1, :cond_5

    const/4 v1, 0x1

    goto :goto_6

    :cond_5
    const/4 v1, 0x0

    .line 313
    :goto_6
    invoke-virtual {p0, v1}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v2

    .line 314
    nop

    :goto_b
    invoke-virtual {p0}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v3

    if-ge v0, v3, :cond_20

    .line 315
    if-ne v0, p1, :cond_14

    goto :goto_1d

    .line 316
    :cond_14
    invoke-virtual {p0, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v3

    .line 317
    if-ge v3, v2, :cond_1d

    .line 318
    nop

    .line 319
    move v1, v0

    move v2, v3

    .line 314
    :cond_1d
    :goto_1d
    add-int/lit8 v0, v0, 0x1

    goto :goto_b

    .line 322
    :cond_20
    return v1
.end method

.method private smallTranslation(FF)Z
    .registers 4

    .line 252
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    const/high16 v0, 0x3fc00000

    cmpg-float p1, p1, v0

    if-gez p1, :cond_14

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result p1

    cmpg-float p1, p1, v0

    if-gez p1, :cond_14

    const/4 p1, 0x1

    goto :goto_15

    :cond_14
    const/4 p1, 0x0

    :goto_15
    return p1
.end method


# virtual methods
.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 6

    .line 149
    iget-boolean v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->replayTouchable:Z

    const/4 v1, 0x0

    if-nez v0, :cond_6

    return v1

    .line 150
    :cond_6
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    .line 151
    const/4 v2, 0x1

    if-eqz v0, :cond_2b

    const/4 v3, 0x5

    if-ne v0, v3, :cond_11

    goto :goto_2b

    .line 156
    :cond_11
    const/4 v3, 0x2

    if-ne v0, v3, :cond_18

    .line 157
    invoke-direct {p0, p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->handleMove(Landroid/view/MotionEvent;)V

    .line 158
    return v2

    .line 160
    :cond_18
    const/4 p1, 0x6

    if-ne v0, p1, :cond_20

    .line 161
    iput-boolean v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->haveBaseline:Z

    .line 162
    iput v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->mode:I

    .line 163
    return v2

    .line 165
    :cond_20
    if-eq v0, v2, :cond_27

    const/4 p1, 0x3

    if-ne v0, p1, :cond_26

    goto :goto_27

    .line 169
    :cond_26
    return v2

    .line 166
    :cond_27
    :goto_27
    invoke-direct {p0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->resetGesture()V

    .line 167
    return v2

    .line 153
    :cond_2b
    :goto_2b
    invoke-direct {p0, p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->resetBaseline(Landroid/view/MotionEvent;)V

    .line 154
    return v2
.end method

.method setReplayTouchable(Z)V
    .registers 2

    .line 142
    iput-boolean p1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->replayTouchable:Z

    .line 143
    if-nez p1, :cond_7

    .line 144
    invoke-direct {p0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->resetGesture()V

    .line 146
    :cond_7
    return-void
.end method
