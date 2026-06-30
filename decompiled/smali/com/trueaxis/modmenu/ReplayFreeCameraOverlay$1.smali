.class Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;
.super Ljava/lang/Object;
.source "ReplayFreeCameraOverlay.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->install(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private attachAttempts:I

.field private disabled:Z

.field private lastActive:Z

.field private lastTouchable:Z

.field final synthetic val$activity:Landroid/app/Activity;

.field final synthetic val$added:[Z

.field final synthetic val$handler:Landroid/os/Handler;

.field final synthetic val$layer:Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;

.field final synthetic val$layout:Landroid/view/WindowManager$LayoutParams;

.field final synthetic val$windowManager:Landroid/view/WindowManager;


# direct methods
.method constructor <init>(Landroid/app/Activity;[ZLandroid/view/WindowManager$LayoutParams;Landroid/view/WindowManager;Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;Landroid/os/Handler;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 48
    iput-object p1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$activity:Landroid/app/Activity;

    iput-object p2, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$added:[Z

    iput-object p3, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$layout:Landroid/view/WindowManager$LayoutParams;

    iput-object p4, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$windowManager:Landroid/view/WindowManager;

    iput-object p5, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$layer:Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;

    iput-object p6, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$handler:Landroid/os/Handler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private removeLayer()V
    .registers 4

    .line 102
    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$added:[Z

    const/4 v1, 0x0

    aget-boolean v0, v0, v1

    if-nez v0, :cond_8

    return-void

    .line 104
    :cond_8
    :try_start_8
    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$windowManager:Landroid/view/WindowManager;

    iget-object v2, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$layer:Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;

    invoke-interface {v0, v2}, Landroid/view/WindowManager;->removeView(Landroid/view/View;)V
    :try_end_f
    .catchall {:try_start_8 .. :try_end_f} :catchall_10

    .line 106
    goto :goto_11

    .line 105
    :catchall_10
    move-exception v0

    .line 107
    :goto_11
    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$added:[Z

    aput-boolean v1, v0, v1

    .line 108
    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$layer:Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;

    invoke-virtual {v0, v1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->setReplayTouchable(Z)V

    .line 109
    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$layer:Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->setVisibility(I)V

    .line 110
    return-void
.end method


# virtual methods
.method public run()V
    .registers 11

    .line 55
    const-string v0, "freecam"

    iget-object v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$activity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_f7

    iget-boolean v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->disabled:Z

    if-eqz v1, :cond_10

    goto/16 :goto_f7

    .line 60
    :cond_10
    const/16 v1, 0x8

    const/4 v2, 0x1

    const/4 v3, 0x0

    :try_start_14
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readReplayFreeCameraStatus()I

    move-result v4

    .line 61
    and-int/lit8 v5, v4, 0x1

    if-eqz v5, :cond_1e

    const/4 v5, 0x1

    goto :goto_1f

    :cond_1e
    const/4 v5, 0x0

    .line 62
    :goto_1f
    and-int/lit8 v6, v4, 0x2

    if-eqz v6, :cond_25

    const/4 v6, 0x1

    goto :goto_26

    :cond_25
    const/4 v6, 0x0

    .line 63
    :goto_26
    if-eqz v5, :cond_2c

    if-eqz v6, :cond_2c

    const/4 v5, 0x1

    goto :goto_2d

    :cond_2c
    const/4 v5, 0x0

    .line 64
    :goto_2d
    and-int/lit8 v6, v4, 0x4

    if-eqz v6, :cond_33

    const/4 v6, 0x1

    goto :goto_34

    :cond_33
    const/4 v6, 0x0

    .line 65
    :goto_34
    if-eqz v5, :cond_7b

    iget-object v7, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$added:[Z

    aget-boolean v7, v7, v3

    if-nez v7, :cond_7b

    .line 66
    iget-object v7, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$layout:Landroid/view/WindowManager$LayoutParams;

    iget-object v8, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$activity:Landroid/app/Activity;

    invoke-virtual {v8}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v8

    invoke-virtual {v8}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v8

    invoke-virtual {v8}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v8

    iput-object v8, v7, Landroid/view/WindowManager$LayoutParams;->token:Landroid/os/IBinder;

    .line 67
    iget-object v7, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$layout:Landroid/view/WindowManager$LayoutParams;

    iget-object v7, v7, Landroid/view/WindowManager$LayoutParams;->token:Landroid/os/IBinder;

    if-eqz v7, :cond_69

    .line 68
    iget-object v7, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$windowManager:Landroid/view/WindowManager;

    iget-object v8, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$layer:Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;

    iget-object v9, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$layout:Landroid/view/WindowManager$LayoutParams;

    invoke-interface {v7, v8, v9}, Landroid/view/WindowManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 69
    iget-object v7, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$added:[Z

    aput-boolean v2, v7, v3

    .line 70
    iput v3, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->attachAttempts:I

    .line 71
    const-string v7, "gesture layer installed"

    invoke-static {v0, v7}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_86

    .line 72
    :cond_69
    iget v7, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->attachAttempts:I

    add-int/lit8 v8, v7, 0x1

    iput v8, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->attachAttempts:I

    const/16 v8, 0x14

    if-le v7, v8, :cond_86

    .line 73
    const-string v7, "gesture layer waiting for window token"

    invoke-static {v0, v7}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    iput v3, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->attachAttempts:I

    goto :goto_86

    .line 76
    :cond_7b
    if-nez v5, :cond_86

    iget-object v7, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$added:[Z

    aget-boolean v7, v7, v3

    if-eqz v7, :cond_86

    .line 77
    invoke-direct {p0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->removeLayer()V

    .line 79
    :cond_86
    :goto_86
    iget-object v7, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$layer:Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;

    invoke-virtual {v7, v5}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->setReplayTouchable(Z)V

    .line 80
    iget-object v7, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$layer:Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;

    if-eqz v5, :cond_91

    const/4 v8, 0x0

    goto :goto_93

    :cond_91
    const/16 v8, 0x8

    :goto_93
    invoke-virtual {v7, v8}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->setVisibility(I)V

    .line 81
    if-eqz v5, :cond_a3

    iget-object v7, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$added:[Z

    aget-boolean v7, v7, v3

    if-eqz v7, :cond_a3

    .line 82
    iget-object v7, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$layer:Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;

    invoke-virtual {v7}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->bringToFront()V

    .line 84
    :cond_a3
    iget-boolean v7, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->lastTouchable:Z

    if-ne v5, v7, :cond_ab

    iget-boolean v7, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->lastActive:Z

    if-eq v6, v7, :cond_d9

    .line 85
    :cond_ab
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "gesture_layer touchable="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " active="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " status="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v4}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    iput-boolean v5, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->lastTouchable:Z

    .line 89
    iput-boolean v6, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->lastActive:Z

    .line 91
    :cond_d9
    iget-object v4, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$handler:Landroid/os/Handler;

    const-wide/16 v5, 0x32

    invoke-virtual {v4, p0, v5, v6}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_e0
    .catchall {:try_start_14 .. :try_end_e0} :catchall_e1

    .line 98
    goto :goto_f6

    .line 92
    :catchall_e1
    move-exception v4

    .line 93
    iput-boolean v2, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->disabled:Z

    .line 94
    iget-object v2, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$layer:Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;

    invoke-virtual {v2, v3}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->setReplayTouchable(Z)V

    .line 95
    iget-object v2, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$layer:Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;

    invoke-virtual {v2, v1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->setVisibility(I)V

    .line 96
    invoke-direct {p0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->removeLayer()V

    .line 97
    const-string v1, "gesture layer poll failed; disabling"

    invoke-static {v0, v1, v4}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 99
    :goto_f6
    return-void

    .line 56
    :cond_f7
    :goto_f7
    invoke-direct {p0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->removeLayer()V

    .line 57
    return-void
.end method
