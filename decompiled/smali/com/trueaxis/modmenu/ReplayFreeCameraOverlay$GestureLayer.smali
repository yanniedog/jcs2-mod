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

.field private gestureActive:Z

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

    .line 147
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 148
    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    iget p1, p1, Landroid/util/DisplayMetrics;->density:F

    const/high16 v0, 0x3f400000

    invoke-static {v0, p1}, Ljava/lang/Math;->max(FF)F

    move-result p1

    iput p1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->density:F

    .line 149
    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->setWillNotDraw(Z)V

    .line 150
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->setFocusable(Z)V

    .line 151
    invoke-virtual {p0, p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->setFocusableInTouchMode(Z)V

    .line 152
    return-void
.end method

.method private static angle(Landroid/view/MotionEvent;)F
    .registers 5

    .line 311
    invoke-static {p0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->firstPointerIndex(Landroid/view/MotionEvent;)I

    move-result v0

    .line 312
    invoke-static {p0, v0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->secondPointerIndex(Landroid/view/MotionEvent;I)I

    move-result v1

    .line 313
    invoke-virtual {p0, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v2

    invoke-virtual {p0, v0}, Landroid/view/MotionEvent;->getY(I)F

    move-result v3

    sub-float/2addr v2, v3

    float-to-double v2, v2

    .line 314
    invoke-virtual {p0, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v1

    invoke-virtual {p0, v0}, Landroid/view/MotionEvent;->getX(I)F

    move-result p0

    sub-float/2addr v1, p0

    float-to-double v0, v1

    .line 313
    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v0

    double-to-float p0, v0

    return p0
.end method

.method private applyGesture(FFFFFFFLjava/lang/String;)V
    .registers 11

    .line 276
    invoke-static/range {p1 .. p7}, Lcom/trueaxis/modmenu/RequiredPatches;->gestureReplayFreeCamera(FFFFFFF)V

    .line 278
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

    .line 279
    invoke-static {p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->fmt(F)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p8, " u="

    invoke-virtual {p1, p8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 280
    invoke-static {p2}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->fmt(F)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " f="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 281
    invoke-static {p3}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->fmt(F)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " y="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 282
    invoke-static {p4}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->fmt(F)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " p="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 283
    invoke-static {p5}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->fmt(F)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " cr="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 284
    invoke-static {p6}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->fmt(F)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " cu="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 285
    invoke-static {p7}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->fmt(F)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 278
    const-string p2, "freecam"

    invoke-static {p2, p1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 286
    return-void
.end method

.method private static centroidX(Landroid/view/MotionEvent;)F
    .registers 5

    .line 289
    nop

    .line 290
    invoke-virtual {p0}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    .line 291
    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_7
    if-ge v2, v0, :cond_11

    invoke-virtual {p0, v2}, Landroid/view/MotionEvent;->getX(I)F

    move-result v3

    add-float/2addr v1, v3

    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 292
    :cond_11
    int-to-float p0, v0

    div-float/2addr v1, p0

    return v1
.end method

.method private static centroidY(Landroid/view/MotionEvent;)F
    .registers 5

    .line 296
    nop

    .line 297
    invoke-virtual {p0}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    .line 298
    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_7
    if-ge v2, v0, :cond_11

    invoke-virtual {p0, v2}, Landroid/view/MotionEvent;->getY(I)F

    move-result v3

    add-float/2addr v1, v3

    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 299
    :cond_11
    int-to-float p0, v0

    div-float/2addr v1, p0

    return v1
.end method

.method private static clamp(FF)F
    .registers 3

    .line 351
    cmpl-float v0, p0, p1

    if-lez v0, :cond_5

    return p1

    .line 352
    :cond_5
    neg-float p1, p1

    cmpg-float v0, p0, p1

    if-gez v0, :cond_b

    return p1

    .line 353
    :cond_b
    return p0
.end method

.method private static distance(Landroid/view/MotionEvent;)F
    .registers 5

    .line 303
    invoke-static {p0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->firstPointerIndex(Landroid/view/MotionEvent;)I

    move-result v0

    .line 304
    invoke-static {p0, v0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->secondPointerIndex(Landroid/view/MotionEvent;I)I

    move-result v1

    .line 305
    invoke-virtual {p0, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v2

    invoke-virtual {p0, v0}, Landroid/view/MotionEvent;->getX(I)F

    move-result v3

    sub-float/2addr v2, v3

    .line 306
    invoke-virtual {p0, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v1

    invoke-virtual {p0, v0}, Landroid/view/MotionEvent;->getY(I)F

    move-result p0

    sub-float/2addr v1, p0

    .line 307
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

    .line 318
    nop

    .line 319
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v1

    .line 320
    const/4 v2, 0x1

    :goto_7
    invoke-virtual {p0}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v3

    if-ge v2, v3, :cond_19

    .line 321
    invoke-virtual {p0, v2}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v3

    .line 322
    if-ge v3, v1, :cond_16

    .line 323
    nop

    .line 324
    move v0, v2

    move v1, v3

    .line 320
    :cond_16
    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 327
    :cond_19
    return v0
.end method

.method private static fmt(F)Ljava/lang/String;
    .registers 2

    .line 357
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
    .registers 18

    .line 193
    move-object/from16 v9, p0

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    .line 194
    const/4 v1, 0x2

    if-lt v0, v1, :cond_f0

    const/4 v2, 0x3

    if-le v0, v2, :cond_e

    goto/16 :goto_f0

    .line 198
    :cond_e
    iget-boolean v2, v9, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->haveBaseline:Z

    if-eqz v2, :cond_ec

    iget v2, v9, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->mode:I

    if-eq v2, v0, :cond_18

    goto/16 :goto_ec

    .line 202
    :cond_18
    invoke-static/range {p1 .. p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->centroidX(Landroid/view/MotionEvent;)F

    move-result v10

    .line 203
    invoke-static/range {p1 .. p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->centroidY(Landroid/view/MotionEvent;)F

    move-result v11

    .line 204
    iget v2, v9, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastCentroidX:F

    sub-float v2, v10, v2

    iget v3, v9, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->density:F

    div-float/2addr v2, v3

    .line 205
    iget v3, v9, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastCentroidY:F

    sub-float v3, v11, v3

    iget v4, v9, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->density:F

    div-float/2addr v3, v4

    .line 206
    const/high16 v4, 0x430c0000

    if-ne v0, v1, :cond_c4

    .line 207
    invoke-static/range {p1 .. p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->distance(Landroid/view/MotionEvent;)F

    move-result v12

    .line 208
    invoke-static/range {p1 .. p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->angle(Landroid/view/MotionEvent;)F

    move-result v13

    .line 209
    iget v0, v9, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastDistance:F

    sub-float v0, v12, v0

    iget v1, v9, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->density:F

    div-float/2addr v0, v1

    .line 210
    iget v1, v9, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastAngle:F

    sub-float v1, v13, v1

    invoke-static {v1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->normalizeAngle(F)F

    move-result v1

    .line 211
    nop

    .line 212
    nop

    .line 213
    nop

    .line 214
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v5

    const/high16 v6, 0x3fc00000

    const/4 v7, 0x1

    const/4 v8, 0x0

    cmpl-float v5, v5, v6

    if-ltz v5, :cond_65

    .line 216
    neg-float v0, v0

    const v5, 0x3fb9999a

    mul-float v0, v0, v5

    invoke-static {v0, v4}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->clamp(FF)F

    move-result v0

    .line 217
    move v5, v0

    const/4 v0, 0x1

    goto :goto_67

    .line 214
    :cond_65
    const/4 v0, 0x0

    const/4 v5, 0x0

    .line 219
    :goto_67
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v6

    const v14, 0x3b83126f

    cmpl-float v6, v6, v14

    if-ltz v6, :cond_7b

    .line 220
    const v0, 0x3e23d70a

    invoke-static {v1, v0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->clamp(FF)F

    move-result v0

    .line 221
    move v8, v0

    goto :goto_7c

    .line 219
    :cond_7b
    move v7, v0

    .line 223
    :goto_7c
    if-eqz v7, :cond_90

    .line 224
    const/4 v7, 0x0

    const-string v14, "pinch_rotate"

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v6, 0x0

    const/4 v15, 0x0

    move-object/from16 v0, p0

    move v3, v5

    move v4, v8

    move v5, v6

    move v6, v15

    move-object v8, v14

    invoke-direct/range {v0 .. v8}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->applyGesture(FFFFFFFLjava/lang/String;)V

    goto :goto_ba

    .line 225
    :cond_90
    invoke-direct {v9, v2, v3}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->smallTranslation(FF)Z

    move-result v0

    if-nez v0, :cond_c3

    .line 226
    neg-float v0, v2

    const v1, 0x3f59999a

    mul-float v0, v0, v1

    invoke-static {v0, v4}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->clamp(FF)F

    move-result v2

    mul-float v3, v3, v1

    .line 227
    invoke-static {v3, v4}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->clamp(FF)F

    move-result v3

    .line 226
    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const-string v14, "pan"

    move-object/from16 v0, p0

    move v1, v2

    move v2, v3

    move v3, v4

    move v4, v5

    move v5, v6

    move v6, v7

    move v7, v8

    move-object v8, v14

    invoke-direct/range {v0 .. v8}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->applyGesture(FFFFFFFLjava/lang/String;)V

    .line 232
    :goto_ba
    iput v10, v9, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastCentroidX:F

    .line 233
    iput v11, v9, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastCentroidY:F

    .line 234
    iput v12, v9, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastDistance:F

    .line 235
    iput v13, v9, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastAngle:F

    .line 236
    return-void

    .line 230
    :cond_c3
    return-void

    .line 238
    :cond_c4
    invoke-direct {v9, v2, v3}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->smallTranslation(FF)Z

    move-result v0

    if-eqz v0, :cond_cb

    return-void

    .line 239
    :cond_cb
    neg-float v0, v2

    const v1, 0x3f8ccccd

    mul-float v0, v0, v1

    .line 240
    invoke-static {v0, v4}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->clamp(FF)F

    move-result v6

    mul-float v3, v3, v1

    .line 241
    invoke-static {v3, v4}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->clamp(FF)F

    move-result v7

    .line 239
    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const-string v8, "car_drag"

    move-object/from16 v0, p0

    invoke-direct/range {v0 .. v8}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->applyGesture(FFFFFFFLjava/lang/String;)V

    .line 242
    iput v10, v9, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastCentroidX:F

    .line 243
    iput v11, v9, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastCentroidY:F

    .line 244
    return-void

    .line 199
    :cond_ec
    :goto_ec
    invoke-direct/range {p0 .. p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->resetBaseline(Landroid/view/MotionEvent;)V

    .line 200
    return-void

    .line 195
    :cond_f0
    :goto_f0
    invoke-direct/range {p0 .. p0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->resetGesture()V

    .line 196
    return-void
.end method

.method private static normalizeAngle(F)F
    .registers 7

    .line 345
    nop

    :goto_1
    float-to-double v0, p0

    const-wide v2, 0x400921fb54442d18L

    const v4, 0x40c90fdb

    cmpl-double v5, v0, v2

    if-lez v5, :cond_10

    sub-float/2addr p0, v4

    goto :goto_1

    .line 346
    :cond_10
    :goto_10
    float-to-double v0, p0

    const-wide v2, -0x3ff6de04abbbd2e8L

    cmpg-double v5, v0, v2

    if-gez v5, :cond_1c

    add-float/2addr p0, v4

    goto :goto_10

    .line 347
    :cond_1c
    return p0
.end method

.method private resetBaseline(Landroid/view/MotionEvent;)V
    .registers 6

    .line 247
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    .line 248
    const/4 v1, 0x2

    if-lt v0, v1, :cond_30

    const/4 v2, 0x3

    if-le v0, v2, :cond_b

    goto :goto_30

    .line 252
    :cond_b
    iput v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->mode:I

    .line 253
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->haveBaseline:Z

    .line 254
    invoke-static {p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->centroidX(Landroid/view/MotionEvent;)F

    move-result v2

    iput v2, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastCentroidX:F

    .line 255
    invoke-static {p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->centroidY(Landroid/view/MotionEvent;)F

    move-result v2

    iput v2, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastCentroidY:F

    .line 256
    const/4 v2, 0x0

    if-lt v0, v1, :cond_24

    invoke-static {p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->distance(Landroid/view/MotionEvent;)F

    move-result v3

    goto :goto_25

    :cond_24
    const/4 v3, 0x0

    :goto_25
    iput v3, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastDistance:F

    .line 257
    if-lt v0, v1, :cond_2d

    invoke-static {p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->angle(Landroid/view/MotionEvent;)F

    move-result v2

    :cond_2d
    iput v2, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastAngle:F

    .line 258
    return-void

    .line 249
    :cond_30
    :goto_30
    invoke-direct {p0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->resetGesture()V

    .line 250
    return-void
.end method

.method private resetGesture()V
    .registers 3

    .line 261
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->haveBaseline:Z

    .line 262
    iput v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->mode:I

    .line 263
    const/4 v1, 0x0

    iput v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastCentroidX:F

    .line 264
    iput v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastCentroidY:F

    .line 265
    iput v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastDistance:F

    .line 266
    iput v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastAngle:F

    .line 267
    iput-boolean v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->gestureActive:Z

    .line 268
    return-void
.end method

.method private static secondPointerIndex(Landroid/view/MotionEvent;I)I
    .registers 6

    .line 331
    const/4 v0, 0x0

    if-nez p1, :cond_5

    const/4 v1, 0x1

    goto :goto_6

    :cond_5
    const/4 v1, 0x0

    .line 332
    :goto_6
    invoke-virtual {p0, v1}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v2

    .line 333
    nop

    :goto_b
    invoke-virtual {p0}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v3

    if-ge v0, v3, :cond_20

    .line 334
    if-ne v0, p1, :cond_14

    goto :goto_1d

    .line 335
    :cond_14
    invoke-virtual {p0, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v3

    .line 336
    if-ge v3, v2, :cond_1d

    .line 337
    nop

    .line 338
    move v1, v0

    move v2, v3

    .line 333
    :cond_1d
    :goto_1d
    add-int/lit8 v0, v0, 0x1

    goto :goto_b

    .line 341
    :cond_20
    return v1
.end method

.method private smallTranslation(FF)Z
    .registers 4

    .line 271
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
    .registers 7

    .line 162
    iget-boolean v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->replayTouchable:Z

    const/4 v1, 0x0

    if-nez v0, :cond_6

    return v1

    .line 163
    :cond_6
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    .line 164
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v2

    .line 167
    const/4 v3, 0x2

    if-ge v0, v3, :cond_15

    .line 168
    invoke-direct {p0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->resetGesture()V

    .line 169
    return v1

    .line 172
    :cond_15
    const/4 v0, 0x5

    const/4 v4, 0x1

    if-ne v2, v0, :cond_1f

    .line 173
    iput-boolean v4, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->gestureActive:Z

    .line 174
    invoke-direct {p0, p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->resetBaseline(Landroid/view/MotionEvent;)V

    goto :goto_44

    .line 175
    :cond_1f
    if-ne v2, v3, :cond_2e

    .line 176
    iget-boolean v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->gestureActive:Z

    if-nez v0, :cond_2a

    .line 177
    iput-boolean v4, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->gestureActive:Z

    .line 178
    invoke-direct {p0, p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->resetBaseline(Landroid/view/MotionEvent;)V

    .line 180
    :cond_2a
    invoke-direct {p0, p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->handleMove(Landroid/view/MotionEvent;)V

    goto :goto_44

    .line 181
    :cond_2e
    const/4 v0, 0x6

    if-ne v2, v0, :cond_3c

    .line 182
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result p1

    if-gt p1, v3, :cond_44

    .line 183
    iput-boolean v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->haveBaseline:Z

    .line 184
    iput v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->mode:I

    goto :goto_44

    .line 186
    :cond_3c
    if-eq v2, v4, :cond_41

    const/4 p1, 0x3

    if-ne v2, p1, :cond_44

    .line 187
    :cond_41
    invoke-direct {p0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->resetGesture()V

    .line 189
    :cond_44
    :goto_44
    return v4
.end method

.method setReplayTouchable(Z)V
    .registers 2

    .line 155
    iput-boolean p1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->replayTouchable:Z

    .line 156
    if-nez p1, :cond_7

    .line 157
    invoke-direct {p0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->resetGesture()V

    .line 159
    :cond_7
    return-void
.end method
