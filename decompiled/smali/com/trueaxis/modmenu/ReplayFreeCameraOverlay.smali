.class final Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;
.super Ljava/lang/Object;
.source "ReplayFreeCameraOverlay.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;
    }
.end annotation


# static fields
.field private static final GESTURE_MARGIN_BOTTOM_RATIO:F = 0.22f

.field private static final GESTURE_MARGIN_TOP_RATIO:F = 0.14f

.field private static final GESTURE_MARGIN_X_RATIO:F = 0.12f

.field private static final POLL_MS:I = 0x32

.field private static final STATUS_ACTIVE:I = 0x4

.field private static final STATUS_ENABLED:I = 0x1

.field private static final STATUS_IN_LEVEL_INTRO:I = 0x2

.field private static final STATUS_IN_REPLAY:I = 0x8


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    return-void
.end method

.method static install(Landroid/app/Activity;)V
    .registers 15

    .line 30
    nop

    .line 31
    const-string v0, "window"

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Landroid/view/WindowManager;

    .line 32
    if-nez v5, :cond_d

    return-void

    .line 34
    :cond_d
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    .line 35
    iget v1, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 36
    iget v0, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 37
    int-to-float v2, v1

    const v3, 0x3df5c28f

    mul-float v2, v2, v3

    float-to-int v2, v2

    const/4 v3, 0x1

    invoke-static {v3, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 38
    int-to-float v4, v0

    const v6, 0x3e0f5c29

    mul-float v6, v6, v4

    float-to-int v6, v6

    invoke-static {v3, v6}, Ljava/lang/Math;->max(II)I

    move-result v6

    .line 39
    const v7, 0x3e6147ae

    mul-float v4, v4, v7

    float-to-int v4, v4

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    .line 44
    new-instance v13, Landroid/view/WindowManager$LayoutParams;

    mul-int/lit8 v7, v2, 0x2

    sub-int/2addr v1, v7

    .line 45
    invoke-static {v3, v1}, Ljava/lang/Math;->max(II)I

    move-result v8

    sub-int/2addr v0, v6

    sub-int/2addr v0, v4

    .line 46
    invoke-static {v3, v0}, Ljava/lang/Math;->max(II)I

    move-result v9

    const/16 v11, 0x128

    const/4 v12, -0x3

    const/16 v10, 0x3e8

    move-object v7, v13

    invoke-direct/range {v7 .. v12}, Landroid/view/WindowManager$LayoutParams;-><init>(IIIII)V

    .line 50
    const/16 v0, 0x33

    iput v0, v13, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 51
    iput v2, v13, Landroid/view/WindowManager$LayoutParams;->x:I

    .line 52
    iput v6, v13, Landroid/view/WindowManager$LayoutParams;->y:I

    .line 54
    new-instance v6, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;

    invoke-direct {v6, p0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;-><init>(Landroid/app/Activity;)V

    .line 55
    const/16 v0, 0x8

    invoke-virtual {v6, v0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->setVisibility(I)V

    .line 56
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_6f

    .line 57
    const/high16 v0, 0x44960000

    invoke-virtual {v6, v0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->setTranslationZ(F)V

    .line 60
    :cond_6f
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 61
    new-array v3, v3, [Z

    const/4 v1, 0x0

    aput-boolean v1, v3, v1

    .line 62
    new-instance v8, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;

    move-object v1, v8

    move-object v2, p0

    move-object v4, v13

    move-object v7, v0

    invoke-direct/range {v1 .. v7}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;-><init>(Landroid/app/Activity;[ZLandroid/view/WindowManager$LayoutParams;Landroid/view/WindowManager;Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;Landroid/os/Handler;)V

    .line 124
    invoke-virtual {v0, v8}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 125
    return-void
.end method
