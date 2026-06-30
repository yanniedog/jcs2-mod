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
.field private consumedDown:Z

.field private final density:F

.field private downX:F

.field private downY:F

.field private gestureActive:Z

.field private haveBaseline:Z

.field private lastAngle:F

.field private lastCentroidX:F

.field private lastCentroidY:F

.field private lastDistance:F

.field private maxMoveDp:F

.field private mode:I

.field private replayTouchable:Z


# direct methods
.method constructor <init>(Landroid/app/Activity;)V
    .registers 3

    .line 169
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 170
    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    iget p1, p1, Landroid/util/DisplayMetrics;->density:F

    const/high16 v0, 0x3f400000

    invoke-static {v0, p1}, Ljava/lang/Math;->max(FF)F

    move-result p1

    iput p1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->density:F

    .line 171
    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->setWillNotDraw(Z)V

    .line 172
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->setFocusable(Z)V

    .line 173
    invoke-virtual {p0, p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->setFocusableInTouchMode(Z)V

    .line 174
    return-void
.end method

.method private static angle(Landroid/view/MotionEvent;)F
    .registers 5

    .line 396
    invoke-static {p0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->firstPointerIndex(Landroid/view/MotionEvent;)I

    move-result v0

    .line 397
    invoke-static {p0, v0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->secondPointerIndex(Landroid/view/MotionEvent;I)I

    move-result v1

    .line 398
    invoke-virtual {p0, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v2

    invoke-virtual {p0, v0}, Landroid/view/MotionEvent;->getY(I)F

    move-result v3

    sub-float/2addr v2, v3

    float-to-double v2, v2

    .line 399
    invoke-virtual {p0, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v1

    invoke-virtual {p0, v0}, Landroid/view/MotionEvent;->getX(I)F

    move-result p0

    sub-float/2addr v1, p0

    float-to-double v0, v1

    .line 398
    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v0

    double-to-float p0, v0

    return p0
.end method

.method private applyGesture(FFFFFFFLjava/lang/String;)V
    .registers 11

    .line 361
    invoke-static/range {p1 .. p7}, Lcom/trueaxis/modmenu/RequiredPatches;->gestureReplayFreeCamera(FFFFFFF)V

    .line 363
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

    .line 364
    invoke-static {p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->fmt(F)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p8, " u="

    invoke-virtual {p1, p8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 365
    invoke-static {p2}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->fmt(F)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " f="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 366
    invoke-static {p3}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->fmt(F)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " y="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 367
    invoke-static {p4}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->fmt(F)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " p="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 368
    invoke-static {p5}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->fmt(F)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " cr="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 369
    invoke-static {p6}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->fmt(F)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " cu="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 370
    invoke-static {p7}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->fmt(F)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 363
    const-string p2, "freecam"

    invoke-static {p2, p1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 371
    return-void
.end method

.method private static centroidX(Landroid/view/MotionEvent;)F
    .registers 5

    .line 374
    nop

    .line 375
    invoke-virtual {p0}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    .line 376
    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_7
    if-ge v2, v0, :cond_11

    invoke-virtual {p0, v2}, Landroid/view/MotionEvent;->getX(I)F

    move-result v3

    add-float/2addr v1, v3

    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 377
    :cond_11
    int-to-float p0, v0

    div-float/2addr v1, p0

    return v1
.end method

.method private static centroidY(Landroid/view/MotionEvent;)F
    .registers 5

    .line 381
    nop

    .line 382
    invoke-virtual {p0}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    .line 383
    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_7
    if-ge v2, v0, :cond_11

    invoke-virtual {p0, v2}, Landroid/view/MotionEvent;->getY(I)F

    move-result v3

    add-float/2addr v1, v3

    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 384
    :cond_11
    int-to-float p0, v0

    div-float/2addr v1, p0

    return v1
.end method

.method private static clamp(FF)F
    .registers 3

    .line 436
    cmpl-float v0, p0, p1

    if-lez v0, :cond_5

    return p1

    .line 437
    :cond_5
    neg-float p1, p1

    cmpg-float v0, p0, p1

    if-gez v0, :cond_b

    return p1

    .line 438
    :cond_b
    return p0
.end method

.method private static distance(Landroid/view/MotionEvent;)F
    .registers 5

    .line 388
    invoke-static {p0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->firstPointerIndex(Landroid/view/MotionEvent;)I

    move-result v0

    .line 389
    invoke-static {p0, v0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->secondPointerIndex(Landroid/view/MotionEvent;I)I

    move-result v1

    .line 390
    invoke-virtual {p0, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v2

    invoke-virtual {p0, v0}, Landroid/view/MotionEvent;->getX(I)F

    move-result v3

    sub-float/2addr v2, v3

    .line 391
    invoke-virtual {p0, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v1

    invoke-virtual {p0, v0}, Landroid/view/MotionEvent;->getY(I)F

    move-result p0

    sub-float/2addr v1, p0

    .line 392
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

    .line 403
    nop

    .line 404
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v1

    .line 405
    const/4 v2, 0x1

    :goto_7
    invoke-virtual {p0}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v3

    if-ge v2, v3, :cond_19

    .line 406
    invoke-virtual {p0, v2}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v3

    .line 407
    if-ge v3, v1, :cond_16

    .line 408
    nop

    .line 409
    move v0, v2

    move v1, v3

    .line 405
    :cond_16
    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 412
    :cond_19
    return v0
.end method

.method private static fmt(F)Ljava/lang/String;
    .registers 2

    .line 442
    const/high16 v0, 0x447a0000

    mul-float p0, p0, v0

    float-to-int p0, p0

    int-to-float p0, p0

    div-float/2addr p0, v0

    invoke-static {p0}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private forwardTap(FF)Z
    .registers 15

    .line 254
    invoke-virtual {p0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->getContext()Landroid/content/Context;

    move-result-object v0

    instance-of v0, v0, Landroid/app/Activity;

    const/4 v1, 0x0

    if-nez v0, :cond_a

    return v1

    .line 255
    :cond_a
    invoke-virtual {p0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    .line 256
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    .line 257
    if-nez v0, :cond_1b

    return v1

    .line 258
    :cond_1b
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v10

    .line 259
    const/4 v6, 0x0

    const/4 v9, 0x0

    move-wide v2, v10

    move-wide v4, v10

    move v7, p1

    move v8, p2

    invoke-static/range {v2 .. v9}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object v1

    .line 260
    const-wide/16 v2, 0xc

    add-long v4, v10, v2

    const/4 v6, 0x1

    move-wide v2, v10

    invoke-static/range {v2 .. v9}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object v2

    .line 262
    :try_start_33
    invoke-virtual {v0, v1}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 263
    invoke-virtual {v0, v2}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 264
    const-string v0, "freecam"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "tap forwarded x="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 265
    invoke-static {p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->fmt(F)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v3, " y="

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-static {p2}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->fmt(F)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 264
    invoke-static {v0, p1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_63
    .catchall {:try_start_33 .. :try_end_63} :catchall_6c

    .line 266
    nop

    .line 268
    invoke-virtual {v1}, Landroid/view/MotionEvent;->recycle()V

    .line 269
    invoke-virtual {v2}, Landroid/view/MotionEvent;->recycle()V

    .line 266
    const/4 p1, 0x1

    return p1

    .line 268
    :catchall_6c
    move-exception p1

    invoke-virtual {v1}, Landroid/view/MotionEvent;->recycle()V

    .line 269
    invoke-virtual {v2}, Landroid/view/MotionEvent;->recycle()V

    .line 270
    throw p1
.end method

.method private handleMove(Landroid/view/MotionEvent;)V
    .registers 15

    .line 274
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    .line 275
    const/4 v1, 0x1

    if-lt v0, v1, :cond_ec

    const/4 v2, 0x3

    if-le v0, v2, :cond_c

    goto/16 :goto_ec

    .line 279
    :cond_c
    iget-boolean v2, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->haveBaseline:Z

    if-eqz v2, :cond_e8

    iget v2, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->mode:I

    if-eq v2, v0, :cond_16

    goto/16 :goto_e8

    .line 283
    :cond_16
    invoke-static {p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->centroidX(Landroid/view/MotionEvent;)F

    move-result v9

    .line 284
    invoke-static {p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->centroidY(Landroid/view/MotionEvent;)F

    move-result v10

    .line 285
    iget v2, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastCentroidX:F

    sub-float v2, v9, v2

    iget v3, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->density:F

    div-float/2addr v2, v3

    .line 286
    iget v3, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastCentroidY:F

    sub-float v3, v10, v3

    iget v4, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->density:F

    div-float/2addr v3, v4

    .line 287
    const/high16 v4, 0x430c0000

    if-ne v0, v1, :cond_5f

    .line 288
    invoke-direct {p0, v2, v3}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->smallTranslation(FF)Z

    move-result v0

    if-eqz v0, :cond_37

    return-void

    .line 289
    :cond_37
    neg-float v0, v2

    const v1, 0x3f59999a

    mul-float v0, v0, v1

    invoke-static {v0, v4}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->clamp(FF)F

    move-result v2

    mul-float v3, v3, v1

    .line 290
    invoke-static {v3, v4}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->clamp(FF)F

    move-result v3

    .line 289
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

    .line 292
    iput v9, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastCentroidX:F

    .line 293
    iput v10, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastCentroidY:F

    .line 294
    return-void

    .line 296
    :cond_5f
    const/4 v5, 0x2

    if-ne v0, v5, :cond_c1

    .line 297
    invoke-static {p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->distance(Landroid/view/MotionEvent;)F

    move-result v11

    .line 298
    invoke-static {p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->angle(Landroid/view/MotionEvent;)F

    move-result v12

    .line 299
    iget v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastDistance:F

    sub-float v0, v11, v0

    iget v2, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->density:F

    div-float/2addr v0, v2

    .line 300
    iget v2, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastAngle:F

    sub-float v2, v12, v2

    invoke-static {v2}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->normalizeAngle(F)F

    move-result v2

    .line 301
    nop

    .line 302
    nop

    .line 303
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v3

    const/high16 v5, 0x3fc00000

    const/4 v6, 0x0

    cmpl-float v3, v3, v5

    if-ltz v3, :cond_92

    .line 304
    const v3, 0x3fb9999a

    mul-float v0, v0, v3

    invoke-static {v0, v4}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->clamp(FF)F

    move-result v0

    .line 305
    move v3, v0

    const/4 v0, 0x1

    goto :goto_94

    .line 303
    :cond_92
    const/4 v0, 0x0

    const/4 v3, 0x0

    .line 307
    :goto_94
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v4

    const v5, 0x3b83126f

    cmpl-float v4, v4, v5

    if-ltz v4, :cond_a8

    .line 308
    const v0, 0x3e23d70a

    invoke-static {v2, v0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->clamp(FF)F

    move-result v0

    .line 309
    move v4, v0

    goto :goto_aa

    .line 311
    :cond_a8
    move v1, v0

    const/4 v4, 0x0

    .line 313
    :goto_aa
    if-nez v1, :cond_ad

    return-void

    .line 314
    :cond_ad
    const/4 v7, 0x0

    const-string v8, "pinch_rotate"

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v0, p0

    invoke-direct/range {v0 .. v8}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->applyGesture(FFFFFFFLjava/lang/String;)V

    .line 315
    iput v9, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastCentroidX:F

    .line 316
    iput v10, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastCentroidY:F

    .line 317
    iput v11, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastDistance:F

    .line 318
    iput v12, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastAngle:F

    .line 319
    return-void

    .line 321
    :cond_c1
    invoke-direct {p0, v2, v3}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->smallTranslation(FF)Z

    move-result v0

    if-eqz v0, :cond_c8

    return-void

    .line 322
    :cond_c8
    neg-float v0, v2

    const v1, 0x3f8ccccd

    mul-float v0, v0, v1

    .line 323
    invoke-static {v0, v4}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->clamp(FF)F

    move-result v6

    mul-float v3, v3, v1

    .line 324
    invoke-static {v3, v4}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->clamp(FF)F

    move-result v7

    .line 322
    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const-string v8, "car_drag"

    move-object v0, p0

    invoke-direct/range {v0 .. v8}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->applyGesture(FFFFFFFLjava/lang/String;)V

    .line 325
    iput v9, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastCentroidX:F

    .line 326
    iput v10, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastCentroidY:F

    .line 327
    return-void

    .line 280
    :cond_e8
    :goto_e8
    invoke-direct {p0, p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->resetBaseline(Landroid/view/MotionEvent;)V

    .line 281
    return-void

    .line 276
    :cond_ec
    :goto_ec
    invoke-direct {p0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->resetGesture()V

    .line 277
    return-void
.end method

.method private static normalizeAngle(F)F
    .registers 7

    .line 430
    nop

    :goto_1
    float-to-double v0, p0

    const-wide v2, 0x400921fb54442d18L

    const v4, 0x40c90fdb

    cmpl-double v5, v0, v2

    if-lez v5, :cond_10

    sub-float/2addr p0, v4

    goto :goto_1

    .line 431
    :cond_10
    :goto_10
    float-to-double v0, p0

    const-wide v2, -0x3ff6de04abbbd2e8L

    cmpg-double v5, v0, v2

    if-gez v5, :cond_1c

    add-float/2addr p0, v4

    goto :goto_10

    .line 432
    :cond_1c
    return p0
.end method

.method private resetBaseline(Landroid/view/MotionEvent;)V
    .registers 6

    .line 330
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    .line 331
    const/4 v1, 0x1

    if-lt v0, v1, :cond_30

    const/4 v2, 0x3

    if-le v0, v2, :cond_b

    goto :goto_30

    .line 335
    :cond_b
    iput v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->mode:I

    .line 336
    iput-boolean v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->haveBaseline:Z

    .line 337
    invoke-static {p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->centroidX(Landroid/view/MotionEvent;)F

    move-result v1

    iput v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastCentroidX:F

    .line 338
    invoke-static {p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->centroidY(Landroid/view/MotionEvent;)F

    move-result v1

    iput v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastCentroidY:F

    .line 339
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

    .line 340
    if-lt v0, v2, :cond_2d

    invoke-static {p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->angle(Landroid/view/MotionEvent;)F

    move-result v1

    :cond_2d
    iput v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastAngle:F

    .line 341
    return-void

    .line 332
    :cond_30
    :goto_30
    invoke-direct {p0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->resetGesture()V

    .line 333
    return-void
.end method

.method private resetGesture()V
    .registers 3

    .line 344
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->haveBaseline:Z

    .line 345
    iput v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->mode:I

    .line 346
    const/4 v1, 0x0

    iput v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastCentroidX:F

    .line 347
    iput v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastCentroidY:F

    .line 348
    iput v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastDistance:F

    .line 349
    iput v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastAngle:F

    .line 350
    iput-boolean v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->consumedDown:Z

    .line 351
    iput v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->maxMoveDp:F

    .line 352
    iput-boolean v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->gestureActive:Z

    .line 353
    return-void
.end method

.method private static secondPointerIndex(Landroid/view/MotionEvent;I)I
    .registers 6

    .line 416
    const/4 v0, 0x0

    if-nez p1, :cond_5

    const/4 v1, 0x1

    goto :goto_6

    :cond_5
    const/4 v1, 0x0

    .line 417
    :goto_6
    invoke-virtual {p0, v1}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v2

    .line 418
    nop

    :goto_b
    invoke-virtual {p0}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v3

    if-ge v0, v3, :cond_20

    .line 419
    if-ne v0, p1, :cond_14

    goto :goto_1d

    .line 420
    :cond_14
    invoke-virtual {p0, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v3

    .line 421
    if-ge v3, v2, :cond_1d

    .line 422
    nop

    .line 423
    move v1, v0

    move v2, v3

    .line 418
    :cond_1d
    :goto_1d
    add-int/lit8 v0, v0, 0x1

    goto :goto_b

    .line 426
    :cond_20
    return v1
.end method

.method private smallTranslation(FF)Z
    .registers 4

    .line 356
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
    .registers 16

    .line 184
    iget-boolean v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->replayTouchable:Z

    const/4 v1, 0x0

    if-nez v0, :cond_6

    return v1

    .line 185
    :cond_6
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    .line 186
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v2

    .line 187
    nop

    .line 188
    const-string v3, ",\"pointerCount\":"

    const-string v4, "A"

    const/4 v5, 0x5

    const-string v6, "}"

    const-string v7, "ReplayFreeCameraOverlay.java:onTouchEvent"

    const/4 v8, 0x1

    if-nez v0, :cond_30

    .line 189
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v9

    iput v9, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->downX:F

    .line 190
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v9

    iput v9, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->downY:F

    .line 191
    const/4 v9, 0x0

    iput v9, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->maxMoveDp:F

    .line 192
    iput-boolean v8, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->consumedDown:Z

    .line 193
    iput-boolean v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->gestureActive:Z

    goto/16 :goto_12f

    .line 194
    :cond_30
    if-ne v0, v5, :cond_39

    .line 195
    iput-boolean v8, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->gestureActive:Z

    .line 196
    invoke-direct {p0, p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->resetBaseline(Landroid/view/MotionEvent;)V

    goto/16 :goto_12f

    .line 197
    :cond_39
    const/high16 v9, 0x3fc00000

    const/4 v10, 0x2

    if-ne v0, v10, :cond_91

    .line 198
    if-ne v2, v8, :cond_7b

    iget-boolean v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->consumedDown:Z

    if-eqz v1, :cond_7b

    .line 199
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    iget v10, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->downX:F

    sub-float/2addr v1, v10

    iget v10, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->density:F

    div-float/2addr v1, v10

    .line 200
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v10

    iget v11, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->downY:F

    sub-float/2addr v10, v11

    iget v11, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->density:F

    div-float/2addr v10, v11

    .line 201
    mul-float v1, v1, v1

    mul-float v10, v10, v10

    add-float/2addr v1, v10

    float-to-double v10, v1

    invoke-static {v10, v11}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v10

    double-to-float v1, v10

    .line 202
    iget v10, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->maxMoveDp:F

    cmpl-float v10, v1, v10

    if-lez v10, :cond_6b

    iput v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->maxMoveDp:F

    .line 203
    :cond_6b
    iget-boolean v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->gestureActive:Z

    if-nez v1, :cond_87

    iget v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->maxMoveDp:F

    cmpl-float v1, v1, v9

    if-ltz v1, :cond_87

    .line 204
    iput-boolean v8, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->gestureActive:Z

    .line 205
    invoke-direct {p0, p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->resetBaseline(Landroid/view/MotionEvent;)V

    goto :goto_87

    .line 207
    :cond_7b
    if-lt v2, v10, :cond_87

    iget-boolean v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->gestureActive:Z

    if-nez v1, :cond_87

    .line 208
    iput-boolean v8, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->gestureActive:Z

    .line 209
    invoke-direct {p0, p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->resetBaseline(Landroid/view/MotionEvent;)V

    goto :goto_88

    .line 207
    :cond_87
    :goto_87
    nop

    .line 211
    :goto_88
    iget-boolean v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->gestureActive:Z

    if-eqz v1, :cond_12f

    .line 212
    invoke-direct {p0, p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->handleMove(Landroid/view/MotionEvent;)V

    goto/16 :goto_12f

    .line 214
    :cond_91
    const/4 v10, 0x6

    if-ne v0, v10, :cond_9e

    .line 215
    iget-boolean v9, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->gestureActive:Z

    if-eqz v9, :cond_12f

    .line 216
    iput-boolean v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->haveBaseline:Z

    .line 217
    iput v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->mode:I

    goto/16 :goto_12f

    .line 219
    :cond_9e
    if-eq v0, v8, :cond_a6

    const/4 v10, 0x3

    if-ne v0, v10, :cond_a4

    goto :goto_a6

    .line 236
    :cond_a4
    goto/16 :goto_12f

    .line 220
    :cond_a6
    :goto_a6
    iget-boolean v10, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->consumedDown:Z

    if-eqz v10, :cond_b8

    iget-boolean v10, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->gestureActive:Z

    if-nez v10, :cond_b8

    iget v10, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->maxMoveDp:F

    cmpg-float v9, v10, v9

    if-gez v9, :cond_b8

    if-gt v2, v8, :cond_b8

    const/4 v9, 0x1

    goto :goto_b9

    :cond_b8
    const/4 v9, 0x0

    .line 222
    :goto_b9
    nop

    .line 223
    if-eqz v9, :cond_c4

    .line 224
    iget v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->downX:F

    iget v10, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->downY:F

    invoke-direct {p0, v1, v10}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->forwardTap(FF)Z

    move-result v1

    .line 227
    :cond_c4
    if-eqz v9, :cond_c8

    move-object v10, v4

    goto :goto_ca

    :cond_c8
    const-string v10, "E"

    .line 228
    :goto_ca
    if-eqz v9, :cond_cf

    const-string v11, "tap_forwarded_to_game"

    goto :goto_d1

    :cond_cf
    const-string v11, "gesture_or_multi_touch_end"

    :goto_d1
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "{\"action\":"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ",\"maxMoveDp\":"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget v13, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->maxMoveDp:F

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ",\"downX\":"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget v13, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->downX:F

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ",\"downY\":"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget v13, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->downY:F

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ",\"tapLike\":"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v12, ",\"forwarded\":"

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 227
    # invokes: Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->agentLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {v10, v7, v11, v1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->access$000(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 234
    invoke-direct {p0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->resetGesture()V

    .line 235
    nop

    .line 239
    :cond_12f
    :goto_12f
    const-string v1, ",\"handled\":"

    if-nez v0, :cond_172

    .line 240
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "{\"x\":"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 242
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v5, ",\"y\":"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 240
    const-string v0, "touch_down_claimed"

    # invokes: Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->agentLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {v4, v7, v0, p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->access$000(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_19a

    .line 244
    :cond_172
    if-ne v0, v5, :cond_19a

    .line 245
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "{\"pointerCount\":"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "C"

    const-string v1, "pointer_down_claimed"

    # invokes: Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->agentLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {v0, v7, v1, p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->access$000(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 250
    :cond_19a
    :goto_19a
    return v8
.end method

.method setReplayTouchable(Z)V
    .registers 2

    .line 177
    iput-boolean p1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->replayTouchable:Z

    .line 178
    if-nez p1, :cond_7

    .line 179
    invoke-direct {p0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->resetGesture()V

    .line 181
    :cond_7
    return-void
.end method
