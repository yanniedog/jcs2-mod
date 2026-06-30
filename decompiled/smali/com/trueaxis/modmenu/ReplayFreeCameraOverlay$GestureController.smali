.class final Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;
.super Ljava/lang/Object;
.source "ReplayFreeCameraOverlay.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "GestureController"
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

.field private haveBaseline:Z

.field private introActive:Z

.field private lastAngle:F

.field private lastCentroidX:F

.field private lastCentroidY:F

.field private lastDistance:F

.field private maxMoveDp:F

.field private mode:I

.field private panActive:Z


# direct methods
.method constructor <init>(Landroid/app/Activity;)V
    .registers 3

    .line 295
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 296
    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    iget p1, p1, Landroid/util/DisplayMetrics;->density:F

    const/high16 v0, 0x3f400000

    invoke-static {v0, p1}, Ljava/lang/Math;->max(FF)F

    move-result p1

    iput p1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->density:F

    .line 297
    return-void
.end method

.method private static angle(Landroid/view/MotionEvent;)F
    .registers 5

    .line 477
    invoke-static {p0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->firstPointerIndex(Landroid/view/MotionEvent;)I

    move-result v0

    .line 478
    invoke-static {p0, v0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->secondPointerIndex(Landroid/view/MotionEvent;I)I

    move-result v1

    .line 479
    invoke-virtual {p0, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v2

    invoke-virtual {p0, v0}, Landroid/view/MotionEvent;->getY(I)F

    move-result v3

    sub-float/2addr v2, v3

    float-to-double v2, v2

    .line 480
    invoke-virtual {p0, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v1

    invoke-virtual {p0, v0}, Landroid/view/MotionEvent;->getX(I)F

    move-result p0

    sub-float/2addr v1, p0

    float-to-double v0, v1

    .line 479
    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v0

    double-to-float p0, v0

    return p0
.end method

.method private applyGesture(FFFFFFFLjava/lang/String;)V
    .registers 11

    .line 442
    invoke-static/range {p1 .. p7}, Lcom/trueaxis/modmenu/RequiredPatches;->gestureReplayFreeCamera(FFFFFFF)V

    .line 444
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

    .line 445
    invoke-static {p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->fmt(F)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p8, " u="

    invoke-virtual {p1, p8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 446
    invoke-static {p2}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->fmt(F)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " f="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 447
    invoke-static {p3}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->fmt(F)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " y="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 448
    invoke-static {p4}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->fmt(F)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " p="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 449
    invoke-static {p5}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->fmt(F)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " cr="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 450
    invoke-static {p6}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->fmt(F)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " cu="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 451
    invoke-static {p7}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->fmt(F)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 444
    const-string p2, "freecam"

    invoke-static {p2, p1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 452
    return-void
.end method

.method private static centroidX(Landroid/view/MotionEvent;)F
    .registers 5

    .line 455
    nop

    .line 456
    invoke-virtual {p0}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    .line 457
    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_7
    if-ge v2, v0, :cond_11

    invoke-virtual {p0, v2}, Landroid/view/MotionEvent;->getX(I)F

    move-result v3

    add-float/2addr v1, v3

    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 458
    :cond_11
    int-to-float p0, v0

    div-float/2addr v1, p0

    return v1
.end method

.method private static centroidY(Landroid/view/MotionEvent;)F
    .registers 5

    .line 462
    nop

    .line 463
    invoke-virtual {p0}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    .line 464
    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_7
    if-ge v2, v0, :cond_11

    invoke-virtual {p0, v2}, Landroid/view/MotionEvent;->getY(I)F

    move-result v3

    add-float/2addr v1, v3

    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 465
    :cond_11
    int-to-float p0, v0

    div-float/2addr v1, p0

    return v1
.end method

.method private static clamp(FF)F
    .registers 3

    .line 517
    cmpl-float v0, p0, p1

    if-lez v0, :cond_5

    return p1

    .line 518
    :cond_5
    neg-float p1, p1

    cmpg-float v0, p0, p1

    if-gez v0, :cond_b

    return p1

    .line 519
    :cond_b
    return p0
.end method

.method private static distance(Landroid/view/MotionEvent;)F
    .registers 5

    .line 469
    invoke-static {p0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->firstPointerIndex(Landroid/view/MotionEvent;)I

    move-result v0

    .line 470
    invoke-static {p0, v0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->secondPointerIndex(Landroid/view/MotionEvent;I)I

    move-result v1

    .line 471
    invoke-virtual {p0, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v2

    invoke-virtual {p0, v0}, Landroid/view/MotionEvent;->getX(I)F

    move-result v3

    sub-float/2addr v2, v3

    .line 472
    invoke-virtual {p0, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v1

    invoke-virtual {p0, v0}, Landroid/view/MotionEvent;->getY(I)F

    move-result p0

    sub-float/2addr v1, p0

    .line 473
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

    .line 484
    nop

    .line 485
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v1

    .line 486
    const/4 v2, 0x1

    :goto_7
    invoke-virtual {p0}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v3

    if-ge v2, v3, :cond_19

    .line 487
    invoke-virtual {p0, v2}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v3

    .line 488
    if-ge v3, v1, :cond_16

    .line 489
    nop

    .line 490
    move v0, v2

    move v1, v3

    .line 486
    :cond_16
    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 493
    :cond_19
    return v0
.end method

.method private static fmt(F)Ljava/lang/String;
    .registers 2

    .line 523
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

    .line 356
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    .line 357
    const/4 v1, 0x1

    if-lt v0, v1, :cond_ec

    const/4 v2, 0x3

    if-le v0, v2, :cond_c

    goto/16 :goto_ec

    .line 361
    :cond_c
    iget-boolean v2, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->haveBaseline:Z

    if-eqz v2, :cond_e8

    iget v2, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->mode:I

    if-eq v2, v0, :cond_16

    goto/16 :goto_e8

    .line 365
    :cond_16
    invoke-static {p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->centroidX(Landroid/view/MotionEvent;)F

    move-result v9

    .line 366
    invoke-static {p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->centroidY(Landroid/view/MotionEvent;)F

    move-result v10

    .line 367
    iget v2, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->lastCentroidX:F

    sub-float v2, v9, v2

    iget v3, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->density:F

    div-float/2addr v2, v3

    .line 368
    iget v3, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->lastCentroidY:F

    sub-float v3, v10, v3

    iget v4, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->density:F

    div-float/2addr v3, v4

    .line 369
    const/high16 v4, 0x430c0000

    if-ne v0, v1, :cond_5f

    .line 370
    invoke-direct {p0, v2, v3}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->smallTranslation(FF)Z

    move-result v0

    if-eqz v0, :cond_37

    return-void

    .line 371
    :cond_37
    neg-float v0, v2

    const v1, 0x3f59999a

    mul-float v0, v0, v1

    invoke-static {v0, v4}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->clamp(FF)F

    move-result v2

    mul-float v3, v3, v1

    .line 372
    invoke-static {v3, v4}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->clamp(FF)F

    move-result v3

    .line 371
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

    invoke-direct/range {v0 .. v8}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->applyGesture(FFFFFFFLjava/lang/String;)V

    .line 374
    iput v9, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->lastCentroidX:F

    .line 375
    iput v10, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->lastCentroidY:F

    .line 376
    return-void

    .line 378
    :cond_5f
    const/4 v5, 0x2

    if-ne v0, v5, :cond_c1

    .line 379
    invoke-static {p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->distance(Landroid/view/MotionEvent;)F

    move-result v11

    .line 380
    invoke-static {p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->angle(Landroid/view/MotionEvent;)F

    move-result v12

    .line 381
    iget v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->lastDistance:F

    sub-float v0, v11, v0

    iget v2, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->density:F

    div-float/2addr v0, v2

    .line 382
    iget v2, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->lastAngle:F

    sub-float v2, v12, v2

    invoke-static {v2}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->normalizeAngle(F)F

    move-result v2

    .line 383
    nop

    .line 384
    nop

    .line 385
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v3

    const/high16 v5, 0x3fc00000

    const/4 v6, 0x0

    cmpl-float v3, v3, v5

    if-ltz v3, :cond_92

    .line 386
    const v3, 0x3fb9999a

    mul-float v0, v0, v3

    invoke-static {v0, v4}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->clamp(FF)F

    move-result v0

    .line 387
    move v3, v0

    const/4 v0, 0x1

    goto :goto_94

    .line 385
    :cond_92
    const/4 v0, 0x0

    const/4 v3, 0x0

    .line 389
    :goto_94
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v4

    const v5, 0x3b83126f

    cmpl-float v4, v4, v5

    if-ltz v4, :cond_a8

    .line 390
    const v0, 0x3e23d70a

    invoke-static {v2, v0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->clamp(FF)F

    move-result v0

    .line 391
    move v4, v0

    goto :goto_aa

    .line 393
    :cond_a8
    move v1, v0

    const/4 v4, 0x0

    .line 395
    :goto_aa
    if-nez v1, :cond_ad

    return-void

    .line 396
    :cond_ad
    const/4 v7, 0x0

    const-string v8, "pinch_rotate"

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v0, p0

    invoke-direct/range {v0 .. v8}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->applyGesture(FFFFFFFLjava/lang/String;)V

    .line 397
    iput v9, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->lastCentroidX:F

    .line 398
    iput v10, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->lastCentroidY:F

    .line 399
    iput v11, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->lastDistance:F

    .line 400
    iput v12, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->lastAngle:F

    .line 401
    return-void

    .line 403
    :cond_c1
    invoke-direct {p0, v2, v3}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->smallTranslation(FF)Z

    move-result v0

    if-eqz v0, :cond_c8

    return-void

    .line 404
    :cond_c8
    neg-float v0, v2

    const v1, 0x3f8ccccd

    mul-float v0, v0, v1

    .line 405
    invoke-static {v0, v4}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->clamp(FF)F

    move-result v6

    mul-float v3, v3, v1

    .line 406
    invoke-static {v3, v4}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->clamp(FF)F

    move-result v7

    .line 404
    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const-string v8, "car_drag"

    move-object v0, p0

    invoke-direct/range {v0 .. v8}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->applyGesture(FFFFFFFLjava/lang/String;)V

    .line 407
    iput v9, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->lastCentroidX:F

    .line 408
    iput v10, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->lastCentroidY:F

    .line 409
    return-void

    .line 362
    :cond_e8
    :goto_e8
    invoke-direct {p0, p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->resetBaseline(Landroid/view/MotionEvent;)V

    .line 363
    return-void

    .line 358
    :cond_ec
    :goto_ec
    invoke-direct {p0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->resetGesture()V

    .line 359
    return-void
.end method

.method private static normalizeAngle(F)F
    .registers 7

    .line 511
    nop

    :goto_1
    float-to-double v0, p0

    const-wide v2, 0x400921fb54442d18L

    const v4, 0x40c90fdb

    cmpl-double v5, v0, v2

    if-lez v5, :cond_10

    sub-float/2addr p0, v4

    goto :goto_1

    .line 512
    :cond_10
    :goto_10
    float-to-double v0, p0

    const-wide v2, -0x3ff6de04abbbd2e8L

    cmpg-double v5, v0, v2

    if-gez v5, :cond_1c

    add-float/2addr p0, v4

    goto :goto_10

    .line 513
    :cond_1c
    return p0
.end method

.method private resetBaseline(Landroid/view/MotionEvent;)V
    .registers 6

    .line 412
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    .line 413
    const/4 v1, 0x1

    if-lt v0, v1, :cond_30

    const/4 v2, 0x3

    if-le v0, v2, :cond_b

    goto :goto_30

    .line 417
    :cond_b
    iput v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->mode:I

    .line 418
    iput-boolean v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->haveBaseline:Z

    .line 419
    invoke-static {p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->centroidX(Landroid/view/MotionEvent;)F

    move-result v1

    iput v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->lastCentroidX:F

    .line 420
    invoke-static {p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->centroidY(Landroid/view/MotionEvent;)F

    move-result v1

    iput v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->lastCentroidY:F

    .line 421
    const/4 v1, 0x0

    const/4 v2, 0x2

    if-lt v0, v2, :cond_24

    invoke-static {p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->distance(Landroid/view/MotionEvent;)F

    move-result v3

    goto :goto_25

    :cond_24
    const/4 v3, 0x0

    :goto_25
    iput v3, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->lastDistance:F

    .line 422
    if-lt v0, v2, :cond_2d

    invoke-static {p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->angle(Landroid/view/MotionEvent;)F

    move-result v1

    :cond_2d
    iput v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->lastAngle:F

    .line 423
    return-void

    .line 414
    :cond_30
    :goto_30
    invoke-direct {p0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->resetGesture()V

    .line 415
    return-void
.end method

.method private resetGesture()V
    .registers 3

    .line 426
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->haveBaseline:Z

    .line 427
    iput v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->mode:I

    .line 428
    const/4 v1, 0x0

    iput v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->lastCentroidX:F

    .line 429
    iput v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->lastCentroidY:F

    .line 430
    iput v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->lastDistance:F

    .line 431
    iput v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->lastAngle:F

    .line 432
    iput v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->maxMoveDp:F

    .line 433
    iput-boolean v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->panActive:Z

    .line 434
    return-void
.end method

.method private static secondPointerIndex(Landroid/view/MotionEvent;I)I
    .registers 6

    .line 497
    const/4 v0, 0x0

    if-nez p1, :cond_5

    const/4 v1, 0x1

    goto :goto_6

    :cond_5
    const/4 v1, 0x0

    .line 498
    :goto_6
    invoke-virtual {p0, v1}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v2

    .line 499
    nop

    :goto_b
    invoke-virtual {p0}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v3

    if-ge v0, v3, :cond_20

    .line 500
    if-ne v0, p1, :cond_14

    goto :goto_1d

    .line 501
    :cond_14
    invoke-virtual {p0, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v3

    .line 502
    if-ge v3, v2, :cond_1d

    .line 503
    nop

    .line 504
    move v1, v0

    move v2, v3

    .line 499
    :cond_1d
    :goto_1d
    add-int/lit8 v0, v0, 0x1

    goto :goto_b

    .line 507
    :cond_20
    return v1
.end method

.method private smallTranslation(FF)Z
    .registers 4

    .line 437
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
.method onWindowTouch(Landroid/view/MotionEvent;)Ljava/lang/Boolean;
    .registers 9

    .line 307
    iget-boolean v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->introActive:Z

    const/4 v1, 0x0

    if-nez v0, :cond_6

    return-object v1

    .line 308
    :cond_6
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    .line 309
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v2

    .line 310
    const/4 v3, 0x3

    const/4 v4, 0x2

    const/4 v5, 0x1

    const/4 v6, 0x0

    if-lt v2, v4, :cond_28

    .line 311
    const/4 v1, 0x5

    if-eq v0, v1, :cond_1a

    const/4 v1, 0x6

    if-ne v0, v1, :cond_1e

    .line 313
    :cond_1a
    iput-boolean v6, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->haveBaseline:Z

    .line 314
    iput v6, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->mode:I

    .line 316
    :cond_1e
    if-eq v0, v5, :cond_25

    if-eq v0, v3, :cond_25

    .line 317
    invoke-direct {p0, p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->handleMove(Landroid/view/MotionEvent;)V

    .line 319
    :cond_25
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object p1

    .line 321
    :cond_28
    if-nez v0, :cond_6c

    .line 322
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iput v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->downX:F

    .line 323
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    iput p1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->downY:F

    .line 324
    const/4 p1, 0x0

    iput p1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->maxMoveDp:F

    .line 325
    iput-boolean v6, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->panActive:Z

    .line 327
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "{\"x\":"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->downX:F

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, ",\"y\":"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->downY:F

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, "}"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "F"

    const-string v2, "ReplayFreeCameraOverlay.java:onWindowTouch"

    const-string v3, "single_finger_down_pass_through"

    # invokes: Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->agentLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {v0, v2, v3, p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->access$000(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 331
    return-object v1

    .line 333
    :cond_6c
    if-ne v0, v4, :cond_ab

    .line 334
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iget v2, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->downX:F

    sub-float/2addr v0, v2

    iget v2, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->density:F

    div-float/2addr v0, v2

    .line 335
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    iget v3, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->downY:F

    sub-float/2addr v2, v3

    iget v3, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->density:F

    div-float/2addr v2, v3

    .line 336
    mul-float v0, v0, v0

    mul-float v2, v2, v2

    add-float/2addr v0, v2

    float-to-double v2, v0

    invoke-static {v2, v3}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v2

    double-to-float v0, v2

    iput v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->maxMoveDp:F

    .line 337
    iget-boolean v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->panActive:Z

    if-nez v0, :cond_a0

    iget v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->maxMoveDp:F

    const/high16 v2, 0x3fc00000

    cmpl-float v0, v0, v2

    if-ltz v0, :cond_a0

    .line 338
    iput-boolean v5, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->panActive:Z

    .line 339
    invoke-direct {p0, p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->resetBaseline(Landroid/view/MotionEvent;)V

    .line 341
    :cond_a0
    iget-boolean v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->panActive:Z

    if-eqz v0, :cond_aa

    .line 342
    invoke-direct {p0, p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->handleMove(Landroid/view/MotionEvent;)V

    .line 343
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object p1

    .line 345
    :cond_aa
    return-object v1

    .line 347
    :cond_ab
    if-eq v0, v5, :cond_b1

    if-ne v0, v3, :cond_b0

    goto :goto_b1

    .line 352
    :cond_b0
    return-object v1

    .line 348
    :cond_b1
    :goto_b1
    iget-boolean p1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->panActive:Z

    .line 349
    invoke-direct {p0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->resetGesture()V

    .line 350
    if-eqz p1, :cond_ba

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :cond_ba
    return-object v1
.end method

.method setIntroActive(Z)V
    .registers 2

    .line 300
    if-nez p1, :cond_5

    .line 301
    invoke-direct {p0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->resetGesture()V

    .line 303
    :cond_5
    iput-boolean p1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->introActive:Z

    .line 304
    return-void
.end method
