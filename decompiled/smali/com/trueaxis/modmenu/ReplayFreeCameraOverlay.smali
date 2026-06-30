.class final Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;
.super Ljava/lang/Object;
.source "ReplayFreeCameraOverlay.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;,
        Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$FreeCamWindowCallback;,
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

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    return-void
.end method

.method static synthetic access$000(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    .line 26
    invoke-static {p0, p1, p2, p3}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->agentLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private static agentLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 7

    .line 38
    :try_start_0
    new-instance v0, Ljava/io/File;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    const-string v2, "YCS2CommunityMod/logs"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 39
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_18

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v1

    if-nez v1, :cond_18

    return-void

    .line 40
    :cond_18
    new-instance v1, Ljava/io/File;

    const-string v2, "debug-04e8a3.log"

    invoke-direct {v1, v0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 41
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "{\"sessionId\":\"04e8a3\",\"hypothesisId\":\""

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, "\",\"location\":\""

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, "\",\"message\":\""

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, "\",\"data\":"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, ",\"timestamp\":"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    .line 44
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p1

    invoke-virtual {p0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, "}\n"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 45
    new-instance p1, Ljava/io/FileOutputStream;

    const/4 p2, 0x1

    invoke-direct {p1, v1, p2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V

    .line 46
    const-string p2, "UTF-8"

    invoke-virtual {p0, p2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/io/FileOutputStream;->write([B)V

    .line 47
    invoke-virtual {p1}, Ljava/io/FileOutputStream;->close()V
    :try_end_76
    .catchall {:try_start_0 .. :try_end_76} :catchall_77

    .line 49
    goto :goto_78

    .line 48
    :catchall_77
    move-exception p0

    .line 50
    :goto_78
    return-void
.end method

.method static install(Landroid/app/Activity;)V
    .registers 15

    .line 54
    nop

    .line 55
    const-string v0, "window"

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    move-object v6, v0

    check-cast v6, Landroid/view/WindowManager;

    .line 56
    if-nez v6, :cond_d

    return-void

    .line 58
    :cond_d
    new-instance v3, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;

    invoke-direct {v3, p0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;-><init>(Landroid/app/Activity;)V

    .line 59
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    .line 60
    invoke-virtual {v0}, Landroid/view/Window;->getCallback()Landroid/view/Window$Callback;

    move-result-object v1

    .line 61
    instance-of v2, v1, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$FreeCamWindowCallback;

    if-nez v2, :cond_2d

    .line 62
    new-instance v2, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$FreeCamWindowCallback;

    invoke-direct {v2, v1, v3}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$FreeCamWindowCallback;-><init>(Landroid/view/Window$Callback;Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;)V

    invoke-virtual {v0, v2}, Landroid/view/Window;->setCallback(Landroid/view/Window$Callback;)V

    .line 63
    const-string v0, "freecam"

    const-string v1, "window touch interceptor installed"

    invoke-static {v0, v1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    :cond_2d
    new-instance v7, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;

    invoke-direct {v7, p0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;-><init>(Landroid/app/Activity;)V

    .line 67
    const/16 v0, 0x8

    invoke-virtual {v7, v0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->setVisibility(I)V

    .line 68
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_42

    .line 69
    const/high16 v0, 0x44960000

    invoke-virtual {v7, v0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->setTranslationZ(F)V

    .line 76
    :cond_42
    new-instance v5, Landroid/view/WindowManager$LayoutParams;

    const/16 v12, 0x138

    const/4 v13, -0x3

    const/4 v9, -0x1

    const/4 v10, -0x1

    const/16 v11, 0x3e8

    move-object v8, v5

    invoke-direct/range {v8 .. v13}, Landroid/view/WindowManager$LayoutParams;-><init>(IIIII)V

    .line 82
    const/16 v0, 0x33

    iput v0, v5, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 84
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 85
    const/4 v1, 0x1

    new-array v4, v1, [Z

    const/4 v1, 0x0

    aput-boolean v1, v4, v1

    .line 86
    new-instance v9, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;

    move-object v1, v9

    move-object v2, p0

    move-object v8, v0

    invoke-direct/range {v1 .. v8}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;-><init>(Landroid/app/Activity;Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;[ZLandroid/view/WindowManager$LayoutParams;Landroid/view/WindowManager;Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;Landroid/os/Handler;)V

    .line 153
    invoke-virtual {v0, v9}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 154
    return-void
.end method
