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

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    return-void
.end method

.method static synthetic access$000(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    .line 16
    invoke-static {p0, p1, p2, p3}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->agentLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private static agentLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5

    .line 27
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, " "

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "agentdbg"

    invoke-static {p1, p0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    return-void
.end method

.method static install(Landroid/app/Activity;)V
    .registers 13

    .line 32
    nop

    .line 33
    const-string v0, "window"

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Landroid/view/WindowManager;

    .line 34
    if-nez v5, :cond_d

    return-void

    .line 39
    :cond_d
    new-instance v4, Landroid/view/WindowManager$LayoutParams;

    const/16 v10, 0x128

    const/4 v11, -0x3

    const/4 v7, -0x1

    const/4 v8, -0x1

    const/16 v9, 0x3e8

    move-object v6, v4

    invoke-direct/range {v6 .. v11}, Landroid/view/WindowManager$LayoutParams;-><init>(IIIII)V

    .line 45
    const/16 v0, 0x33

    iput v0, v4, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 47
    new-instance v6, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;

    invoke-direct {v6, p0, v5, v4}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;-><init>(Landroid/app/Activity;Landroid/view/WindowManager;Landroid/view/WindowManager$LayoutParams;)V

    .line 48
    const/16 v0, 0x8

    invoke-virtual {v6, v0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->setVisibility(I)V

    .line 49
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_33

    .line 50
    const/high16 v0, 0x44960000

    invoke-virtual {v6, v0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->setTranslationZ(F)V

    .line 53
    :cond_33
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 54
    const/4 v1, 0x1

    new-array v3, v1, [Z

    const/4 v1, 0x0

    aput-boolean v1, v3, v1

    .line 55
    new-instance v8, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;

    move-object v1, v8

    move-object v2, p0

    move-object v7, v0

    invoke-direct/range {v1 .. v7}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;-><init>(Landroid/app/Activity;[ZLandroid/view/WindowManager$LayoutParams;Landroid/view/WindowManager;Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;Landroid/os/Handler;)V

    .line 124
    invoke-virtual {v0, v8}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 125
    return-void
.end method
