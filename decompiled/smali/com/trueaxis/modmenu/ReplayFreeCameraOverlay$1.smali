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

.field private diagPolls:I

.field private disabled:Z

.field private lastActive:Z

.field private lastDiagSamples:I

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

    .line 131
    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$added:[Z

    const/4 v1, 0x0

    aget-boolean v0, v0, v1

    if-nez v0, :cond_8

    return-void

    .line 133
    :cond_8
    :try_start_8
    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$windowManager:Landroid/view/WindowManager;

    iget-object v2, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$layer:Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;

    invoke-interface {v0, v2}, Landroid/view/WindowManager;->removeView(Landroid/view/View;)V
    :try_end_f
    .catchall {:try_start_8 .. :try_end_f} :catchall_10

    .line 135
    goto :goto_11

    .line 134
    :catchall_10
    move-exception v0

    .line 136
    :goto_11
    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$added:[Z

    aput-boolean v1, v0, v1

    .line 137
    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$layer:Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;

    invoke-virtual {v0, v1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->setReplayTouchable(Z)V

    .line 138
    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$layer:Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->setVisibility(I)V

    .line 139
    return-void
.end method


# virtual methods
.method public run()V
    .registers 13

    .line 71
    const-string v0, ","

    const-string v1, "freecam"

    iget-object v2, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$activity:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->isFinishing()Z

    move-result v2

    if-nez v2, :cond_18b

    iget-boolean v2, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->disabled:Z

    if-eqz v2, :cond_12

    goto/16 :goto_18b

    .line 76
    :cond_12
    const/16 v2, 0x8

    const/4 v3, 0x1

    const/4 v4, 0x0

    :try_start_16
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readReplayFreeCameraStatus()I

    move-result v5

    .line 77
    and-int/lit8 v6, v5, 0x1

    if-eqz v6, :cond_20

    const/4 v6, 0x1

    goto :goto_21

    :cond_20
    const/4 v6, 0x0

    .line 78
    :goto_21
    nop

    .line 79
    and-int/lit8 v7, v5, 0x8

    if-eqz v7, :cond_28

    const/4 v7, 0x1

    goto :goto_29

    :cond_28
    const/4 v7, 0x0

    .line 80
    :goto_29
    if-eqz v6, :cond_2f

    if-eqz v7, :cond_2f

    const/4 v6, 0x1

    goto :goto_30

    :cond_2f
    const/4 v6, 0x0

    .line 81
    :goto_30
    and-int/lit8 v7, v5, 0x4

    if-eqz v7, :cond_36

    const/4 v7, 0x1

    goto :goto_37

    :cond_36
    const/4 v7, 0x0

    .line 82
    :goto_37
    const/16 v8, 0x14

    if-eqz v6, :cond_7e

    iget-object v9, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$added:[Z

    aget-boolean v9, v9, v4

    if-nez v9, :cond_7e

    .line 83
    iget-object v9, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$layout:Landroid/view/WindowManager$LayoutParams;

    iget-object v10, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$activity:Landroid/app/Activity;

    invoke-virtual {v10}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v10

    invoke-virtual {v10}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v10

    invoke-virtual {v10}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v10

    iput-object v10, v9, Landroid/view/WindowManager$LayoutParams;->token:Landroid/os/IBinder;

    .line 84
    iget-object v9, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$layout:Landroid/view/WindowManager$LayoutParams;

    iget-object v9, v9, Landroid/view/WindowManager$LayoutParams;->token:Landroid/os/IBinder;

    if-eqz v9, :cond_6e

    .line 85
    iget-object v9, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$windowManager:Landroid/view/WindowManager;

    iget-object v10, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$layer:Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;

    iget-object v11, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$layout:Landroid/view/WindowManager$LayoutParams;

    invoke-interface {v9, v10, v11}, Landroid/view/WindowManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 86
    iget-object v9, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$added:[Z

    aput-boolean v3, v9, v4

    .line 87
    iput v4, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->attachAttempts:I

    .line 88
    const-string v9, "gesture layer installed"

    invoke-static {v1, v9}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_89

    .line 89
    :cond_6e
    iget v9, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->attachAttempts:I

    add-int/lit8 v10, v9, 0x1

    iput v10, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->attachAttempts:I

    if-le v9, v8, :cond_89

    .line 90
    const-string v9, "gesture layer waiting for window token"

    invoke-static {v1, v9}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 91
    iput v4, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->attachAttempts:I

    goto :goto_89

    .line 93
    :cond_7e
    if-nez v6, :cond_89

    iget-object v9, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$added:[Z

    aget-boolean v9, v9, v4

    if-eqz v9, :cond_89

    .line 94
    invoke-direct {p0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->removeLayer()V

    .line 96
    :cond_89
    :goto_89
    iget-object v9, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$layer:Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;

    invoke-virtual {v9, v6}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->setReplayTouchable(Z)V

    .line 97
    iget-object v9, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$layer:Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;

    if-eqz v6, :cond_94

    const/4 v10, 0x0

    goto :goto_96

    :cond_94
    const/16 v10, 0x8

    :goto_96
    invoke-virtual {v9, v10}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->setVisibility(I)V

    .line 98
    iget-boolean v9, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->lastTouchable:Z

    if-ne v6, v9, :cond_a1

    iget-boolean v9, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->lastActive:Z

    if-eq v7, v9, :cond_cf

    .line 99
    :cond_a1
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "gesture_layer touchable="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " active="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " status="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v1, v5}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 102
    iput-boolean v6, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->lastTouchable:Z

    .line 103
    iput-boolean v7, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->lastActive:Z

    .line 105
    :cond_cf
    if-eqz v6, :cond_16d

    if-eqz v7, :cond_16d

    iget v5, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->diagPolls:I

    add-int/2addr v5, v3

    iput v5, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->diagPolls:I

    rem-int/2addr v5, v8

    if-nez v5, :cond_16d

    .line 106
    invoke-static {v4}, Lcom/trueaxis/modmenu/RequiredPatches;->readReplayCameraDiag(I)I

    move-result v5

    .line 107
    iget v6, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->lastDiagSamples:I

    if-eq v5, v6, :cond_16d

    .line 108
    iput v5, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->lastDiagSamples:I

    .line 109
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "orbit_diag samples="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " radius1000="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 110
    invoke-static {v3}, Lcom/trueaxis/modmenu/RequiredPatches;->readReplayCameraDiag(I)I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " inwardDot1000="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 111
    const/4 v6, 0x2

    invoke-static {v6}, Lcom/trueaxis/modmenu/RequiredPatches;->readReplayCameraDiag(I)I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " orbitChord1000="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 112
    const/4 v6, 0x3

    invoke-static {v6}, Lcom/trueaxis/modmenu/RequiredPatches;->readReplayCameraDiag(I)I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " dir1000="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 113
    const/4 v6, 0x4

    invoke-static {v6}, Lcom/trueaxis/modmenu/RequiredPatches;->readReplayCameraDiag(I)I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 114
    const/4 v6, 0x5

    invoke-static {v6}, Lcom/trueaxis/modmenu/RequiredPatches;->readReplayCameraDiag(I)I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 115
    const/4 v5, 0x6

    invoke-static {v5}, Lcom/trueaxis/modmenu/RequiredPatches;->readReplayCameraDiag(I)I

    move-result v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v5, " anchorErr1000="

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 116
    const/4 v5, 0x7

    invoke-static {v5}, Lcom/trueaxis/modmenu/RequiredPatches;->readReplayCameraDiag(I)I

    move-result v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v5, " anchorSrc="

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 117
    invoke-static {v2}, Lcom/trueaxis/modmenu/RequiredPatches;->readReplayCameraDiag(I)I

    move-result v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 109
    invoke-static {v1, v0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    :cond_16d
    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$handler:Landroid/os/Handler;

    const-wide/16 v5, 0x32

    invoke-virtual {v0, p0, v5, v6}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_174
    .catchall {:try_start_16 .. :try_end_174} :catchall_175

    .line 127
    goto :goto_18a

    .line 121
    :catchall_175
    move-exception v0

    .line 122
    iput-boolean v3, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->disabled:Z

    .line 123
    iget-object v3, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$layer:Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;

    invoke-virtual {v3, v4}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->setReplayTouchable(Z)V

    .line 124
    iget-object v3, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->val$layer:Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;

    invoke-virtual {v3, v2}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->setVisibility(I)V

    .line 125
    invoke-direct {p0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->removeLayer()V

    .line 126
    const-string v2, "gesture layer poll failed; disabling"

    invoke-static {v1, v2, v0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 128
    :goto_18a
    return-void

    .line 72
    :cond_18b
    :goto_18b
    invoke-direct {p0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;->removeLayer()V

    .line 73
    return-void
.end method
