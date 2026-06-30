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
.field private static final POLL_MS:I = 0x32

.field private static final STATUS_ACTIVE:I = 0x4

.field private static final STATUS_ENABLED:I = 0x1

.field private static final STATUS_IN_LEVEL_INTRO:I = 0x2


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    return-void
.end method

.method static install(Landroid/app/Activity;)V
    .registers 14

    .line 25
    nop

    .line 26
    const-string v0, "window"

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Landroid/view/WindowManager;

    .line 27
    if-nez v5, :cond_d

    return-void

    .line 29
    :cond_d
    new-instance v6, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;

    invoke-direct {v6, p0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;-><init>(Landroid/app/Activity;)V

    .line 30
    const/16 v0, 0x8

    invoke-virtual {v6, v0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->setVisibility(I)V

    .line 31
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_22

    .line 32
    const/high16 v0, 0x44960000

    invoke-virtual {v6, v0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->setTranslationZ(F)V

    .line 38
    :cond_22
    new-instance v4, Landroid/view/WindowManager$LayoutParams;

    const/16 v11, 0x128

    const/4 v12, -0x3

    const/4 v8, -0x1

    const/4 v9, -0x1

    const/16 v10, 0x3e8

    move-object v7, v4

    invoke-direct/range {v7 .. v12}, Landroid/view/WindowManager$LayoutParams;-><init>(IIIII)V

    .line 44
    const/16 v0, 0x33

    iput v0, v4, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 46
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 47
    const/4 v1, 0x1

    new-array v3, v1, [Z

    const/4 v1, 0x0

    aput-boolean v1, v3, v1

    .line 48
    new-instance v8, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;

    move-object v1, v8

    move-object v2, p0

    move-object v7, v0

    invoke-direct/range {v1 .. v7}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;-><init>(Landroid/app/Activity;[ZLandroid/view/WindowManager$LayoutParams;Landroid/view/WindowManager;Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;Landroid/os/Handler;)V

    .line 112
    invoke-virtual {v0, v8}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 113
    return-void
.end method
