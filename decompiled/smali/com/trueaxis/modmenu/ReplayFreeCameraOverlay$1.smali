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

    .line 62
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

    .line 114
    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$added:[Z

    const/4 v1, 0x0

    aget-boolean v0, v0, v1

    if-nez v0, :cond_8

    return-void

    .line 116
    :cond_8
    :try_start_8
    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$windowManager:Landroid/view/WindowManager;

    iget-object v2, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$layer:Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;

    invoke-interface {v0, v2}, Landroid/view/WindowManager;->removeView(Landroid/view/View;)V
    :try_end_f
    .catchall {:try_start_8 .. :try_end_f} :catchall_10

    .line 118
    goto :goto_11

    .line 117
    :catchall_10
    move-exception v0

    .line 119
    :goto_11
    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$added:[Z

    aput-boolean v1, v0, v1

    .line 120
    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$layer:Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;

    invoke-virtual {v0, v1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->setReplayTouchable(Z)V

    .line 121
    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$layer:Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->setVisibility(I)V

    .line 122
    return-void
.end method


# virtual methods
.method public run()V
    .registers 11

    .line 69
    const-string v0, "freecam"

    iget-object v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$activity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_eb

    iget-boolean v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->disabled:Z

    if-eqz v1, :cond_10

    goto/16 :goto_eb

    .line 74
    :cond_10
    const/16 v1, 0x8

    const/4 v2, 0x1

    const/4 v3, 0x0

    :try_start_14
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readReplayFreeCameraStatus()I

    move-result v4

    .line 75
    and-int/lit8 v5, v4, 0x1

    if-eqz v5, :cond_1e

    const/4 v5, 0x1

    goto :goto_1f

    :cond_1e
    const/4 v5, 0x0

    .line 76
    :goto_1f
    nop

    .line 77
    and-int/lit8 v6, v4, 0x8

    if-eqz v6, :cond_26

    const/4 v6, 0x1

    goto :goto_27

    :cond_26
    const/4 v6, 0x0

    .line 78
    :goto_27
    if-eqz v5, :cond_2d

    if-eqz v6, :cond_2d

    const/4 v5, 0x1

    goto :goto_2e

    :cond_2d
    const/4 v5, 0x0

    .line 79
    :goto_2e
    and-int/lit8 v6, v4, 0x4

    if-eqz v6, :cond_34

    const/4 v6, 0x1

    goto :goto_35

    :cond_34
    const/4 v6, 0x0

    .line 80
    :goto_35
    if-eqz v5, :cond_7c

    iget-object v7, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$added:[Z

    aget-boolean v7, v7, v3

    if-nez v7, :cond_7c

    .line 81
    iget-object v7, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$layout:Landroid/view/WindowManager$LayoutParams;

    iget-object v8, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$activity:Landroid/app/Activity;

    invoke-virtual {v8}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v8

    invoke-virtual {v8}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v8

    invoke-virtual {v8}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v8

    iput-object v8, v7, Landroid/view/WindowManager$LayoutParams;->token:Landroid/os/IBinder;

    .line 82
    iget-object v7, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$layout:Landroid/view/WindowManager$LayoutParams;

    iget-object v7, v7, Landroid/view/WindowManager$LayoutParams;->token:Landroid/os/IBinder;

    if-eqz v7, :cond_6a

    .line 83
    iget-object v7, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$windowManager:Landroid/view/WindowManager;

    iget-object v8, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$layer:Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;

    iget-object v9, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$layout:Landroid/view/WindowManager$LayoutParams;

    invoke-interface {v7, v8, v9}, Landroid/view/WindowManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 84
    iget-object v7, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$added:[Z

    aput-boolean v2, v7, v3

    .line 85
    iput v3, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->attachAttempts:I

    .line 86
    const-string v7, "gesture layer installed"

    invoke-static {v0, v7}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_87

    .line 87
    :cond_6a
    iget v7, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->attachAttempts:I

    add-int/lit8 v8, v7, 0x1

    iput v8, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->attachAttempts:I

    const/16 v8, 0x14

    if-le v7, v8, :cond_87

    .line 88
    const-string v7, "gesture layer waiting for window token"

    invoke-static {v0, v7}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    iput v3, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->attachAttempts:I

    goto :goto_87

    .line 91
    :cond_7c
    if-nez v5, :cond_87

    iget-object v7, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$added:[Z

    aget-boolean v7, v7, v3

    if-eqz v7, :cond_87

    .line 92
    invoke-direct {p0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->removeLayer()V

    .line 94
    :cond_87
    :goto_87
    iget-object v7, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$layer:Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;

    invoke-virtual {v7, v5}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->setReplayTouchable(Z)V

    .line 95
    iget-object v7, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$layer:Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;

    if-eqz v5, :cond_92

    const/4 v8, 0x0

    goto :goto_94

    :cond_92
    const/16 v8, 0x8

    :goto_94
    invoke-virtual {v7, v8}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->setVisibility(I)V

    .line 96
    iget-boolean v7, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->lastTouchable:Z

    if-ne v5, v7, :cond_9f

    iget-boolean v7, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->lastActive:Z

    if-eq v6, v7, :cond_cd

    .line 97
    :cond_9f
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

    .line 100
    iput-boolean v5, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->lastTouchable:Z

    .line 101
    iput-boolean v6, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->lastActive:Z

    .line 103
    :cond_cd
    iget-object v4, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$handler:Landroid/os/Handler;

    const-wide/16 v5, 0x32

    invoke-virtual {v4, p0, v5, v6}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_d4
    .catchall {:try_start_14 .. :try_end_d4} :catchall_d5

    .line 110
    goto :goto_ea

    .line 104
    :catchall_d5
    move-exception v4

    .line 105
    iput-boolean v2, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->disabled:Z

    .line 106
    iget-object v2, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$layer:Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;

    invoke-virtual {v2, v3}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->setReplayTouchable(Z)V

    .line 107
    iget-object v2, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$layer:Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;

    invoke-virtual {v2, v1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->setVisibility(I)V

    .line 108
    invoke-direct {p0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->removeLayer()V

    .line 109
    const-string v1, "gesture layer poll failed; disabling"

    invoke-static {v0, v1, v4}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 111
    :goto_ea
    return-void

    .line 70
    :cond_eb
    :goto_eb
    invoke-direct {p0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->removeLayer()V

    .line 71
    return-void
.end method
