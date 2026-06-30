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

.field private downX:F

.field private downY:F

.field private gestureActive:Z

.field private final handler:Landroid/os/Handler;

.field private haveBaseline:Z

.field private lastAngle:F

.field private lastCentroidX:F

.field private lastCentroidY:F

.field private lastDistance:F

.field private final layout:Landroid/view/WindowManager$LayoutParams;

.field private maxMoveDp:F

.field private mode:I

.field private overlayPassThrough:Z

.field private replayTouchable:Z

.field private final windowManager:Landroid/view/WindowManager;


# direct methods
.method constructor <init>(Landroid/app/Activity;Landroid/view/WindowManager;Landroid/view/WindowManager$LayoutParams;)V
    .registers 6

    .line 155
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 139
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->handler:Landroid/os/Handler;

    .line 156
    iput-object p2, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->windowManager:Landroid/view/WindowManager;

    .line 157
    iput-object p3, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->layout:Landroid/view/WindowManager$LayoutParams;

    .line 158
    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    iget p1, p1, Landroid/util/DisplayMetrics;->density:F

    const/high16 p2, 0x3f400000

    invoke-static {p2, p1}, Ljava/lang/Math;->max(FF)F

    move-result p1

    iput p1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->density:F

    .line 159
    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->setWillNotDraw(Z)V

    .line 160
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->setFocusable(Z)V

    .line 161
    invoke-virtual {p0, p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->setFocusableInTouchMode(Z)V

    .line 162
    return-void
.end method

.method static synthetic access$100(F)Ljava/lang/String;
    .registers 1

    .line 127
    invoke-static {p0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->fmt(F)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$200(Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;)Landroid/os/Handler;
    .registers 1

    .line 127
    iget-object p0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->handler:Landroid/os/Handler;

    return-object p0
.end method

.method private static angle(Landroid/view/MotionEvent;)F
    .registers 5

    .line 402
    invoke-static {p0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->firstPointerIndex(Landroid/view/MotionEvent;)I

    move-result v0

    .line 403
    invoke-static {p0, v0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->secondPointerIndex(Landroid/view/MotionEvent;I)I

    move-result v1

    .line 404
    invoke-virtual {p0, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v2

    invoke-virtual {p0, v0}, Landroid/view/MotionEvent;->getY(I)F

    move-result v3

    sub-float/2addr v2, v3

    float-to-double v2, v2

    .line 405
    invoke-virtual {p0, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v1

    invoke-virtual {p0, v0}, Landroid/view/MotionEvent;->getX(I)F

    move-result p0

    sub-float/2addr v1, p0

    float-to-double v0, v1

    .line 404
    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v0

    double-to-float p0, v0

    return p0
.end method

.method private applyGesture(FFFFFFFLjava/lang/String;)V
    .registers 11

    .line 367
    invoke-static/range {p1 .. p7}, Lcom/trueaxis/modmenu/RequiredPatches;->gestureReplayFreeCamera(FFFFFFF)V

    .line 369
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

    .line 370
    invoke-static {p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->fmt(F)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p8, " u="

    invoke-virtual {p1, p8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 371
    invoke-static {p2}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->fmt(F)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " f="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 372
    invoke-static {p3}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->fmt(F)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " y="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 373
    invoke-static {p4}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->fmt(F)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " p="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 374
    invoke-static {p5}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->fmt(F)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " cr="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 375
    invoke-static {p6}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->fmt(F)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " cu="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 376
    invoke-static {p7}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->fmt(F)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 369
    const-string p2, "freecam"

    invoke-static {p2, p1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 377
    return-void
.end method

.method private static centroidX(Landroid/view/MotionEvent;)F
    .registers 5

    .line 380
    nop

    .line 381
    invoke-virtual {p0}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    .line 382
    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_7
    if-ge v2, v0, :cond_11

    invoke-virtual {p0, v2}, Landroid/view/MotionEvent;->getX(I)F

    move-result v3

    add-float/2addr v1, v3

    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 383
    :cond_11
    int-to-float p0, v0

    div-float/2addr v1, p0

    return v1
.end method

.method private static centroidY(Landroid/view/MotionEvent;)F
    .registers 5

    .line 387
    nop

    .line 388
    invoke-virtual {p0}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    .line 389
    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_7
    if-ge v2, v0, :cond_11

    invoke-virtual {p0, v2}, Landroid/view/MotionEvent;->getY(I)F

    move-result v3

    add-float/2addr v1, v3

    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 390
    :cond_11
    int-to-float p0, v0

    div-float/2addr v1, p0

    return v1
.end method

.method private static clamp(FF)F
    .registers 3

    .line 442
    cmpl-float v0, p0, p1

    if-lez v0, :cond_5

    return p1

    .line 443
    :cond_5
    neg-float p1, p1

    cmpg-float v0, p0, p1

    if-gez v0, :cond_b

    return p1

    .line 444
    :cond_b
    return p0
.end method

.method private static distance(Landroid/view/MotionEvent;)F
    .registers 5

    .line 394
    invoke-static {p0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->firstPointerIndex(Landroid/view/MotionEvent;)I

    move-result v0

    .line 395
    invoke-static {p0, v0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->secondPointerIndex(Landroid/view/MotionEvent;I)I

    move-result v1

    .line 396
    invoke-virtual {p0, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v2

    invoke-virtual {p0, v0}, Landroid/view/MotionEvent;->getX(I)F

    move-result v3

    sub-float/2addr v2, v3

    .line 397
    invoke-virtual {p0, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v1

    invoke-virtual {p0, v0}, Landroid/view/MotionEvent;->getY(I)F

    move-result p0

    sub-float/2addr v1, p0

    .line 398
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

    .line 409
    nop

    .line 410
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v1

    .line 411
    const/4 v2, 0x1

    :goto_7
    invoke-virtual {p0}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v3

    if-ge v2, v3, :cond_19

    .line 412
    invoke-virtual {p0, v2}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v3

    .line 413
    if-ge v3, v1, :cond_16

    .line 414
    nop

    .line 415
    move v0, v2

    move v1, v3

    .line 411
    :cond_16
    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 418
    :cond_19
    return v0
.end method

.method private static fmt(F)Ljava/lang/String;
    .registers 2

    .line 448
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

    .line 281
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    .line 282
    const/4 v1, 0x1

    if-lt v0, v1, :cond_ec

    const/4 v2, 0x3

    if-le v0, v2, :cond_c

    goto/16 :goto_ec

    .line 286
    :cond_c
    iget-boolean v2, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->haveBaseline:Z

    if-eqz v2, :cond_e8

    iget v2, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->mode:I

    if-eq v2, v0, :cond_16

    goto/16 :goto_e8

    .line 290
    :cond_16
    invoke-static {p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->centroidX(Landroid/view/MotionEvent;)F

    move-result v9

    .line 291
    invoke-static {p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->centroidY(Landroid/view/MotionEvent;)F

    move-result v10

    .line 292
    iget v2, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastCentroidX:F

    sub-float v2, v9, v2

    iget v3, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->density:F

    div-float/2addr v2, v3

    .line 293
    iget v3, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastCentroidY:F

    sub-float v3, v10, v3

    iget v4, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->density:F

    div-float/2addr v3, v4

    .line 294
    const/high16 v4, 0x430c0000

    if-ne v0, v1, :cond_5f

    .line 295
    invoke-direct {p0, v2, v3}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->smallTranslation(FF)Z

    move-result v0

    if-eqz v0, :cond_37

    return-void

    .line 296
    :cond_37
    neg-float v0, v2

    const v1, 0x3f59999a

    mul-float v0, v0, v1

    invoke-static {v0, v4}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->clamp(FF)F

    move-result v2

    mul-float v3, v3, v1

    .line 297
    invoke-static {v3, v4}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->clamp(FF)F

    move-result v3

    .line 296
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

    .line 299
    iput v9, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastCentroidX:F

    .line 300
    iput v10, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastCentroidY:F

    .line 301
    return-void

    .line 303
    :cond_5f
    const/4 v5, 0x2

    if-ne v0, v5, :cond_c1

    .line 304
    invoke-static {p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->distance(Landroid/view/MotionEvent;)F

    move-result v11

    .line 305
    invoke-static {p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->angle(Landroid/view/MotionEvent;)F

    move-result v12

    .line 306
    iget v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastDistance:F

    sub-float v0, v11, v0

    iget v2, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->density:F

    div-float/2addr v0, v2

    .line 307
    iget v2, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastAngle:F

    sub-float v2, v12, v2

    invoke-static {v2}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->normalizeAngle(F)F

    move-result v2

    .line 308
    nop

    .line 309
    nop

    .line 310
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v3

    const/high16 v5, 0x3fc00000

    const/4 v6, 0x0

    cmpl-float v3, v3, v5

    if-ltz v3, :cond_92

    .line 311
    const v3, 0x3fb9999a

    mul-float v0, v0, v3

    invoke-static {v0, v4}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->clamp(FF)F

    move-result v0

    .line 312
    move v3, v0

    const/4 v0, 0x1

    goto :goto_94

    .line 310
    :cond_92
    const/4 v0, 0x0

    const/4 v3, 0x0

    .line 314
    :goto_94
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v4

    const v5, 0x3b83126f

    cmpl-float v4, v4, v5

    if-ltz v4, :cond_a8

    .line 315
    const v0, 0x3e23d70a

    invoke-static {v2, v0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->clamp(FF)F

    move-result v0

    .line 316
    move v4, v0

    goto :goto_aa

    .line 318
    :cond_a8
    move v1, v0

    const/4 v4, 0x0

    .line 320
    :goto_aa
    if-nez v1, :cond_ad

    return-void

    .line 321
    :cond_ad
    const/4 v7, 0x0

    const-string v8, "pinch_rotate"

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v0, p0

    invoke-direct/range {v0 .. v8}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->applyGesture(FFFFFFFLjava/lang/String;)V

    .line 322
    iput v9, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastCentroidX:F

    .line 323
    iput v10, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastCentroidY:F

    .line 324
    iput v11, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastDistance:F

    .line 325
    iput v12, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastAngle:F

    .line 326
    return-void

    .line 328
    :cond_c1
    invoke-direct {p0, v2, v3}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->smallTranslation(FF)Z

    move-result v0

    if-eqz v0, :cond_c8

    return-void

    .line 329
    :cond_c8
    neg-float v0, v2

    const v1, 0x3f8ccccd

    mul-float v0, v0, v1

    .line 330
    invoke-static {v0, v4}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->clamp(FF)F

    move-result v6

    mul-float v3, v3, v1

    .line 331
    invoke-static {v3, v4}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->clamp(FF)F

    move-result v7

    .line 329
    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const-string v8, "car_drag"

    move-object v0, p0

    invoke-direct/range {v0 .. v8}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->applyGesture(FFFFFFFLjava/lang/String;)V

    .line 332
    iput v9, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastCentroidX:F

    .line 333
    iput v10, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastCentroidY:F

    .line 334
    return-void

    .line 287
    :cond_e8
    :goto_e8
    invoke-direct {p0, p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->resetBaseline(Landroid/view/MotionEvent;)V

    .line 288
    return-void

    .line 283
    :cond_ec
    :goto_ec
    invoke-direct {p0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->resetGesture()V

    .line 284
    return-void
.end method

.method private static normalizeAngle(F)F
    .registers 7

    .line 436
    nop

    :goto_1
    float-to-double v0, p0

    const-wide v2, 0x400921fb54442d18L

    const v4, 0x40c90fdb

    cmpl-double v5, v0, v2

    if-lez v5, :cond_10

    sub-float/2addr p0, v4

    goto :goto_1

    .line 437
    :cond_10
    :goto_10
    float-to-double v0, p0

    const-wide v2, -0x3ff6de04abbbd2e8L

    cmpg-double v5, v0, v2

    if-gez v5, :cond_1c

    add-float/2addr p0, v4

    goto :goto_10

    .line 438
    :cond_1c
    return p0
.end method

.method private replayTapToGame(FF)Z
    .registers 7

    .line 241
    invoke-virtual {p0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->getContext()Landroid/content/Context;

    move-result-object v0

    instance-of v0, v0, Landroid/app/Activity;

    const/4 v1, 0x0

    if-nez v0, :cond_a

    return v1

    .line 242
    :cond_a
    invoke-virtual {p0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    .line 243
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    .line 244
    if-nez v0, :cond_1b

    return v1

    .line 245
    :cond_1b
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->setOverlayPassThrough(Z)V

    .line 246
    iget-object v2, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->handler:Landroid/os/Handler;

    new-instance v3, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer$1;

    invoke-direct {v3, p0, p1, p2, v0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer$1;-><init>(Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;FFLandroid/view/View;)V

    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 277
    return v1
.end method

.method private resetBaseline(Landroid/view/MotionEvent;)V
    .registers 6

    .line 337
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    .line 338
    const/4 v1, 0x1

    if-lt v0, v1, :cond_30

    const/4 v2, 0x3

    if-le v0, v2, :cond_b

    goto :goto_30

    .line 342
    :cond_b
    iput v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->mode:I

    .line 343
    iput-boolean v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->haveBaseline:Z

    .line 344
    invoke-static {p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->centroidX(Landroid/view/MotionEvent;)F

    move-result v1

    iput v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastCentroidX:F

    .line 345
    invoke-static {p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->centroidY(Landroid/view/MotionEvent;)F

    move-result v1

    iput v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastCentroidY:F

    .line 346
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

    .line 347
    if-lt v0, v2, :cond_2d

    invoke-static {p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->angle(Landroid/view/MotionEvent;)F

    move-result v1

    :cond_2d
    iput v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastAngle:F

    .line 348
    return-void

    .line 339
    :cond_30
    :goto_30
    invoke-direct {p0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->resetGesture()V

    .line 340
    return-void
.end method

.method private resetGesture()V
    .registers 3

    .line 351
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->haveBaseline:Z

    .line 352
    iput v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->mode:I

    .line 353
    const/4 v1, 0x0

    iput v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastCentroidX:F

    .line 354
    iput v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastCentroidY:F

    .line 355
    iput v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastDistance:F

    .line 356
    iput v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->lastAngle:F

    .line 357
    iput v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->maxMoveDp:F

    .line 358
    iput-boolean v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->gestureActive:Z

    .line 359
    return-void
.end method

.method private static secondPointerIndex(Landroid/view/MotionEvent;I)I
    .registers 6

    .line 422
    const/4 v0, 0x0

    if-nez p1, :cond_5

    const/4 v1, 0x1

    goto :goto_6

    :cond_5
    const/4 v1, 0x0

    .line 423
    :goto_6
    invoke-virtual {p0, v1}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v2

    .line 424
    nop

    :goto_b
    invoke-virtual {p0}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v3

    if-ge v0, v3, :cond_20

    .line 425
    if-ne v0, p1, :cond_14

    goto :goto_1d

    .line 426
    :cond_14
    invoke-virtual {p0, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v3

    .line 427
    if-ge v3, v2, :cond_1d

    .line 428
    nop

    .line 429
    move v1, v0

    move v2, v3

    .line 424
    :cond_1d
    :goto_1d
    add-int/lit8 v0, v0, 0x1

    goto :goto_b

    .line 432
    :cond_20
    return v1
.end method

.method private smallTranslation(FF)Z
    .registers 4

    .line 362
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
    .registers 10

    .line 189
    iget-boolean v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->replayTouchable:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_11f

    iget-boolean v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->overlayPassThrough:Z

    if-eqz v0, :cond_b

    goto/16 :goto_11f

    .line 190
    :cond_b
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    .line 191
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v2

    .line 192
    const/4 v3, 0x1

    if-nez v0, :cond_29

    .line 193
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iput v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->downX:F

    .line 194
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    iput p1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->downY:F

    .line 195
    const/4 p1, 0x0

    iput p1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->maxMoveDp:F

    .line 196
    iput-boolean v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->gestureActive:Z

    goto/16 :goto_11e

    .line 197
    :cond_29
    const/4 v4, 0x5

    if-ne v0, v4, :cond_33

    .line 198
    iput-boolean v3, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->gestureActive:Z

    .line 199
    invoke-direct {p0, p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->resetBaseline(Landroid/view/MotionEvent;)V

    goto/16 :goto_11e

    .line 200
    :cond_33
    const/high16 v4, 0x3fc00000

    const/4 v5, 0x2

    if-ne v0, v5, :cond_81

    .line 201
    if-ne v2, v3, :cond_6b

    .line 202
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iget v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->downX:F

    sub-float/2addr v0, v1

    iget v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->density:F

    div-float/2addr v0, v1

    .line 203
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    iget v2, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->downY:F

    sub-float/2addr v1, v2

    iget v2, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->density:F

    div-float/2addr v1, v2

    .line 204
    mul-float v0, v0, v0

    mul-float v1, v1, v1

    add-float/2addr v0, v1

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    double-to-float v0, v0

    iput v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->maxMoveDp:F

    .line 205
    iget-boolean v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->gestureActive:Z

    if-nez v0, :cond_77

    iget v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->maxMoveDp:F

    cmpl-float v0, v0, v4

    if-ltz v0, :cond_77

    .line 206
    iput-boolean v3, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->gestureActive:Z

    .line 207
    invoke-direct {p0, p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->resetBaseline(Landroid/view/MotionEvent;)V

    goto :goto_77

    .line 209
    :cond_6b
    if-lt v2, v5, :cond_77

    iget-boolean v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->gestureActive:Z

    if-nez v0, :cond_77

    .line 210
    iput-boolean v3, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->gestureActive:Z

    .line 211
    invoke-direct {p0, p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->resetBaseline(Landroid/view/MotionEvent;)V

    goto :goto_78

    .line 209
    :cond_77
    :goto_77
    nop

    .line 213
    :goto_78
    iget-boolean v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->gestureActive:Z

    if-eqz v0, :cond_11e

    .line 214
    invoke-direct {p0, p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->handleMove(Landroid/view/MotionEvent;)V

    goto/16 :goto_11e

    .line 216
    :cond_81
    const/4 p1, 0x6

    if-ne v0, p1, :cond_8e

    .line 217
    iget-boolean p1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->gestureActive:Z

    if-eqz p1, :cond_11e

    .line 218
    iput-boolean v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->haveBaseline:Z

    .line 219
    iput v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->mode:I

    goto/16 :goto_11e

    .line 221
    :cond_8e
    if-eq v0, v3, :cond_93

    const/4 p1, 0x3

    if-ne v0, p1, :cond_11e

    .line 222
    :cond_93
    iget-boolean p1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->gestureActive:Z

    if-nez p1, :cond_a1

    iget p1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->maxMoveDp:F

    cmpg-float p1, p1, v4

    if-gez p1, :cond_a1

    if-gt v2, v3, :cond_a1

    const/4 p1, 0x1

    goto :goto_a2

    :cond_a1
    const/4 p1, 0x0

    .line 223
    :goto_a2
    nop

    .line 224
    if-eqz p1, :cond_ad

    .line 225
    iget v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->downX:F

    iget v4, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->downY:F

    invoke-direct {p0, v1, v4}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->replayTapToGame(FF)Z

    move-result v1

    .line 228
    :cond_ad
    if-eqz p1, :cond_b2

    const-string v4, "H"

    goto :goto_b4

    :cond_b2
    const-string v4, "E"

    .line 229
    :goto_b4
    if-eqz p1, :cond_b9

    const-string v5, "tap_replay_scheduled"

    goto :goto_bb

    :cond_b9
    const-string v5, "gesture_or_multi_touch_end"

    :goto_bb
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "{\"action\":"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v6, ",\"pointerCount\":"

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ",\"maxMoveDp\":"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v2, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->maxMoveDp:F

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ",\"downX\":"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v2, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->downX:F

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ",\"downY\":"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v2, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->downY:F

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ",\"tapLike\":"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, ",\"replayed\":"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, "}"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 228
    const-string v0, "ReplayFreeCameraOverlay.java:onTouchEvent"

    # invokes: Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->agentLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {v4, v0, v5, p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->access$000(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 235
    invoke-direct {p0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->resetGesture()V

    .line 237
    :cond_11e
    :goto_11e
    return v3

    .line 189
    :cond_11f
    :goto_11f
    return v1
.end method

.method setOverlayPassThrough(Z)V
    .registers 4

    .line 172
    iput-boolean p1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->overlayPassThrough:Z

    .line 173
    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->layout:Landroid/view/WindowManager$LayoutParams;

    iget v0, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 174
    if-eqz p1, :cond_f

    .line 175
    iget-object p1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->layout:Landroid/view/WindowManager$LayoutParams;

    or-int/lit8 v0, v0, 0x10

    iput v0, p1, Landroid/view/WindowManager$LayoutParams;->flags:I

    goto :goto_15

    .line 177
    :cond_f
    iget-object p1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->layout:Landroid/view/WindowManager$LayoutParams;

    and-int/lit8 v0, v0, -0x11

    iput v0, p1, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 179
    :goto_15
    invoke-virtual {p0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->getWindowToken()Landroid/os/IBinder;

    move-result-object p1

    if-eqz p1, :cond_2b

    .line 181
    :try_start_1b
    iget-object p1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->windowManager:Landroid/view/WindowManager;

    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->layout:Landroid/view/WindowManager$LayoutParams;

    invoke-interface {p1, p0, v0}, Landroid/view/WindowManager;->updateViewLayout(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    :try_end_22
    .catchall {:try_start_1b .. :try_end_22} :catchall_23

    .line 184
    goto :goto_2b

    .line 182
    :catchall_23
    move-exception p1

    .line 183
    const-string v0, "freecam"

    const-string v1, "overlay pass-through update failed"

    invoke-static {v0, v1, p1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 186
    :cond_2b
    :goto_2b
    return-void
.end method

.method setReplayTouchable(Z)V
    .registers 2

    .line 165
    iput-boolean p1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->replayTouchable:Z

    .line 166
    if-nez p1, :cond_7

    .line 167
    invoke-direct {p0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->resetGesture()V

    .line 169
    :cond_7
    return-void
.end method
