.class Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$15;
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
.field private disabled:Z

.field private lastActive:Z

.field private lastVisible:Z

.field final synthetic val$activity:Landroid/app/Activity;

.field final synthetic val$added:[Z

.field final synthetic val$handler:Landroid/os/Handler;

.field final synthetic val$layout:Landroid/view/WindowManager$LayoutParams;

.field final synthetic val$mode:Landroid/widget/Button;

.field final synthetic val$panel:Landroid/widget/LinearLayout;

.field final synthetic val$status:Landroid/widget/TextView;

.field final synthetic val$touchable:[Z

.field final synthetic val$windowManager:Landroid/view/WindowManager;


# direct methods
.method constructor <init>(Landroid/app/Activity;[ZLandroid/view/WindowManager;Landroid/widget/LinearLayout;[ZLandroid/view/WindowManager$LayoutParams;Landroid/widget/Button;Landroid/widget/TextView;Landroid/os/Handler;)V
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 205
    iput-object p1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$15;->val$activity:Landroid/app/Activity;

    iput-object p2, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$15;->val$added:[Z

    iput-object p3, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$15;->val$windowManager:Landroid/view/WindowManager;

    iput-object p4, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$15;->val$panel:Landroid/widget/LinearLayout;

    iput-object p5, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$15;->val$touchable:[Z

    iput-object p6, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$15;->val$layout:Landroid/view/WindowManager$LayoutParams;

    iput-object p7, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$15;->val$mode:Landroid/widget/Button;

    iput-object p8, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$15;->val$status:Landroid/widget/TextView;

    iput-object p9, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$15;->val$handler:Landroid/os/Handler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 11

    .line 211
    const-string v0, "freecam"

    iget-object v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$15;->val$activity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_be

    iget-boolean v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$15;->disabled:Z

    if-eqz v1, :cond_11

    goto/16 :goto_be

    .line 222
    :cond_11
    const/16 v1, 0x8

    const/4 v3, 0x1

    :try_start_14
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readReplayFreeCameraStatus()I

    move-result v4

    .line 223
    and-int/lit8 v5, v4, 0x1

    if-eqz v5, :cond_22

    and-int/lit8 v5, v4, 0x2

    if-eqz v5, :cond_22

    const/4 v5, 0x1

    goto :goto_23

    :cond_22
    const/4 v5, 0x0

    .line 225
    :goto_23
    and-int/lit8 v6, v4, 0x4

    if-eqz v6, :cond_29

    const/4 v6, 0x1

    goto :goto_2a

    :cond_29
    const/4 v6, 0x0

    .line 226
    :goto_2a
    iget-object v7, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$15;->val$panel:Landroid/widget/LinearLayout;

    if-eqz v5, :cond_30

    const/4 v8, 0x0

    goto :goto_32

    :cond_30
    const/16 v8, 0x8

    :goto_32
    invoke-virtual {v7, v8}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 227
    iget-object v7, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$15;->val$touchable:[Z

    aget-boolean v7, v7, v2

    if-eq v7, v5, :cond_53

    .line 228
    iget-object v7, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$15;->val$layout:Landroid/view/WindowManager$LayoutParams;

    if-eqz v5, :cond_42

    .line 229
    const/16 v8, 0x128

    goto :goto_44

    .line 230
    :cond_42
    const/16 v8, 0x138

    :goto_44
    iput v8, v7, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 231
    iget-object v7, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$15;->val$windowManager:Landroid/view/WindowManager;

    iget-object v8, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$15;->val$panel:Landroid/widget/LinearLayout;

    iget-object v9, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$15;->val$layout:Landroid/view/WindowManager$LayoutParams;

    invoke-interface {v7, v8, v9}, Landroid/view/WindowManager;->updateViewLayout(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 232
    iget-object v7, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$15;->val$touchable:[Z

    aput-boolean v5, v7, v2

    .line 234
    :cond_53
    if-eqz v5, :cond_5a

    .line 235
    iget-object v2, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$15;->val$panel:Landroid/widget/LinearLayout;

    invoke-virtual {v2}, Landroid/widget/LinearLayout;->bringToFront()V

    .line 237
    :cond_5a
    iget-boolean v2, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$15;->lastVisible:Z

    if-ne v5, v2, :cond_62

    iget-boolean v2, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$15;->lastActive:Z

    if-eq v6, v2, :cond_90

    .line 238
    :cond_62
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "overlay visible="

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v7, " active="

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v7, " status="

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 241
    iput-boolean v5, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$15;->lastVisible:Z

    .line 242
    iput-boolean v6, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$15;->lastActive:Z

    .line 244
    :cond_90
    iget-object v2, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$15;->val$mode:Landroid/widget/Button;

    if-eqz v6, :cond_97

    const-string v4, "Path"

    goto :goto_99

    :cond_97
    const-string v4, "Lock"

    :goto_99
    invoke-virtual {v2, v4}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 245
    iget-object v2, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$15;->val$status:Landroid/widget/TextView;

    if-eqz v6, :cond_a3

    const-string v4, "FREE CAM LOCKED"

    goto :goto_a5

    :cond_a3
    const-string v4, "FREE CAM PATH"

    :goto_a5
    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 246
    iget-object v2, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$15;->val$handler:Landroid/os/Handler;

    const-wide/16 v4, 0x64

    invoke-virtual {v2, p0, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_af
    .catchall {:try_start_14 .. :try_end_af} :catchall_b0

    .line 251
    goto :goto_bd

    .line 247
    :catchall_b0
    move-exception v2

    .line 248
    iput-boolean v3, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$15;->disabled:Z

    .line 249
    iget-object v3, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$15;->val$panel:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 250
    const-string v1, "overlay poll failed; disabling"

    invoke-static {v0, v1, v2}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 252
    :goto_bd
    return-void

    .line 212
    :cond_be
    :goto_be
    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$15;->val$added:[Z

    aget-boolean v0, v0, v2

    if-eqz v0, :cond_d1

    .line 214
    :try_start_c4
    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$15;->val$windowManager:Landroid/view/WindowManager;

    iget-object v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$15;->val$panel:Landroid/widget/LinearLayout;

    invoke-interface {v0, v1}, Landroid/view/WindowManager;->removeView(Landroid/view/View;)V
    :try_end_cb
    .catchall {:try_start_c4 .. :try_end_cb} :catchall_cc

    .line 216
    goto :goto_cd

    .line 215
    :catchall_cc
    move-exception v0

    .line 217
    :goto_cd
    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$15;->val$added:[Z

    aput-boolean v2, v0, v2

    .line 219
    :cond_d1
    return-void
.end method
