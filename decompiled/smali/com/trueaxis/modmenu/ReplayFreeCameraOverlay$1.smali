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

    .line 71
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

    .line 132
    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$added:[Z

    const/4 v1, 0x0

    aget-boolean v0, v0, v1

    if-nez v0, :cond_8

    return-void

    .line 134
    :cond_8
    :try_start_8
    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$windowManager:Landroid/view/WindowManager;

    iget-object v2, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$layer:Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;

    invoke-interface {v0, v2}, Landroid/view/WindowManager;->removeView(Landroid/view/View;)V
    :try_end_f
    .catchall {:try_start_8 .. :try_end_f} :catchall_10

    .line 136
    goto :goto_11

    .line 135
    :catchall_10
    move-exception v0

    .line 137
    :goto_11
    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$added:[Z

    aput-boolean v1, v0, v1

    .line 138
    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$layer:Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;

    invoke-virtual {v0, v1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->setReplayTouchable(Z)V

    .line 139
    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$layer:Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->setVisibility(I)V

    .line 140
    return-void
.end method


# virtual methods
.method public run()V
    .registers 15

    .line 78
    const-string v0, "freecam"

    iget-object v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$activity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_14f

    iget-boolean v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->disabled:Z

    if-eqz v1, :cond_10

    goto/16 :goto_14f

    .line 83
    :cond_10
    const/16 v1, 0x8

    const/4 v2, 0x1

    const/4 v3, 0x0

    :try_start_14
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readReplayFreeCameraStatus()I

    move-result v4

    .line 84
    and-int/lit8 v5, v4, 0x1

    if-eqz v5, :cond_1e

    const/4 v5, 0x1

    goto :goto_1f

    :cond_1e
    const/4 v5, 0x0

    .line 85
    :goto_1f
    and-int/lit8 v6, v4, 0x2

    if-eqz v6, :cond_25

    const/4 v6, 0x1

    goto :goto_26

    :cond_25
    const/4 v6, 0x0

    .line 86
    :goto_26
    if-eqz v5, :cond_2c

    if-eqz v6, :cond_2c

    const/4 v7, 0x1

    goto :goto_2d

    :cond_2c
    const/4 v7, 0x0

    .line 87
    :goto_2d
    and-int/lit8 v8, v4, 0x4

    if-eqz v8, :cond_33

    const/4 v8, 0x1

    goto :goto_34

    :cond_33
    const/4 v8, 0x0

    .line 88
    :goto_34
    if-eqz v7, :cond_7b

    iget-object v9, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$added:[Z

    aget-boolean v9, v9, v3

    if-nez v9, :cond_7b

    .line 89
    iget-object v9, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$layout:Landroid/view/WindowManager$LayoutParams;

    iget-object v10, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$activity:Landroid/app/Activity;

    invoke-virtual {v10}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v10

    invoke-virtual {v10}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v10

    invoke-virtual {v10}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v10

    iput-object v10, v9, Landroid/view/WindowManager$LayoutParams;->token:Landroid/os/IBinder;

    .line 90
    iget-object v9, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$layout:Landroid/view/WindowManager$LayoutParams;

    iget-object v9, v9, Landroid/view/WindowManager$LayoutParams;->token:Landroid/os/IBinder;

    if-eqz v9, :cond_69

    .line 91
    iget-object v9, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$windowManager:Landroid/view/WindowManager;

    iget-object v10, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$layer:Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;

    iget-object v11, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$layout:Landroid/view/WindowManager$LayoutParams;

    invoke-interface {v9, v10, v11}, Landroid/view/WindowManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 92
    iget-object v9, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$added:[Z

    aput-boolean v2, v9, v3

    .line 93
    iput v3, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->attachAttempts:I

    .line 94
    const-string v9, "gesture layer installed"

    invoke-static {v0, v9}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_86

    .line 95
    :cond_69
    iget v9, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->attachAttempts:I

    add-int/lit8 v10, v9, 0x1

    iput v10, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->attachAttempts:I

    const/16 v10, 0x14

    if-le v9, v10, :cond_86

    .line 96
    const-string v9, "gesture layer waiting for window token"

    invoke-static {v0, v9}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    iput v3, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->attachAttempts:I

    goto :goto_86

    .line 99
    :cond_7b
    if-nez v7, :cond_86

    iget-object v9, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$added:[Z

    aget-boolean v9, v9, v3

    if-eqz v9, :cond_86

    .line 100
    invoke-direct {p0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->removeLayer()V

    .line 102
    :cond_86
    :goto_86
    iget-object v9, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$layer:Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;

    invoke-virtual {v9, v7}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->setReplayTouchable(Z)V

    .line 103
    iget-object v9, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$layer:Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;

    if-eqz v7, :cond_91

    const/4 v10, 0x0

    goto :goto_93

    :cond_91
    const/16 v10, 0x8

    :goto_93
    invoke-virtual {v9, v10}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->setVisibility(I)V

    .line 104
    if-eqz v7, :cond_a3

    iget-object v9, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$added:[Z

    aget-boolean v9, v9, v3

    if-eqz v9, :cond_a3

    .line 105
    iget-object v9, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$layer:Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;

    invoke-virtual {v9}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->bringToFront()V

    .line 107
    :cond_a3
    iget-boolean v9, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->lastTouchable:Z

    if-ne v7, v9, :cond_ab

    iget-boolean v9, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->lastActive:Z

    if-eq v8, v9, :cond_131

    .line 108
    :cond_ab
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "gesture_layer touchable="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " active="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " status="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v0, v9}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 112
    const-string v9, "B"

    const-string v10, "ReplayFreeCameraOverlay.java:poll"

    const-string v11, "overlay_visibility"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "{\"visible\":"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ",\"active\":"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ",\"enabled\":"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v12, ",\"inIntro\":"

    invoke-virtual {v5, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ",\"added\":"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$added:[Z

    aget-boolean v6, v6, v3

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ",\"bits\":"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "}"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    # invokes: Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->agentLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {v9, v10, v11, v4}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->access$000(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 118
    iput-boolean v7, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->lastTouchable:Z

    .line 119
    iput-boolean v8, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->lastActive:Z

    .line 121
    :cond_131
    iget-object v4, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$handler:Landroid/os/Handler;

    const-wide/16 v5, 0x32

    invoke-virtual {v4, p0, v5, v6}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_138
    .catchall {:try_start_14 .. :try_end_138} :catchall_139

    .line 128
    goto :goto_14e

    .line 122
    :catchall_139
    move-exception v4

    .line 123
    iput-boolean v2, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->disabled:Z

    .line 124
    iget-object v2, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$layer:Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;

    invoke-virtual {v2, v3}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->setReplayTouchable(Z)V

    .line 125
    iget-object v2, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$layer:Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;

    invoke-virtual {v2, v1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->setVisibility(I)V

    .line 126
    invoke-direct {p0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->removeLayer()V

    .line 127
    const-string v1, "gesture layer poll failed; disabling"

    invoke-static {v0, v1, v4}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 129
    :goto_14e
    return-void

    .line 79
    :cond_14f
    :goto_14f
    invoke-direct {p0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->removeLayer()V

    .line 80
    return-void
.end method
