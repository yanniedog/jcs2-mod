.class Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$16;
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
.field private attempts:I

.field final synthetic val$activity:Landroid/app/Activity;

.field final synthetic val$added:[Z

.field final synthetic val$handler:Landroid/os/Handler;

.field final synthetic val$layout:Landroid/view/WindowManager$LayoutParams;

.field final synthetic val$panel:Landroid/widget/LinearLayout;

.field final synthetic val$poll:Ljava/lang/Runnable;

.field final synthetic val$windowManager:Landroid/view/WindowManager;


# direct methods
.method constructor <init>(Landroid/app/Activity;[ZLandroid/view/WindowManager$LayoutParams;Landroid/os/Handler;Landroid/view/WindowManager;Landroid/widget/LinearLayout;Ljava/lang/Runnable;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 254
    iput-object p1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$16;->val$activity:Landroid/app/Activity;

    iput-object p2, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$16;->val$added:[Z

    iput-object p3, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$16;->val$layout:Landroid/view/WindowManager$LayoutParams;

    iput-object p4, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$16;->val$handler:Landroid/os/Handler;

    iput-object p5, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$16;->val$windowManager:Landroid/view/WindowManager;

    iput-object p6, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$16;->val$panel:Landroid/widget/LinearLayout;

    iput-object p7, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$16;->val$poll:Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 9

    .line 258
    const-string v0, "freecam"

    iget-object v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$16;->val$activity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_6c

    iget-object v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$16;->val$added:[Z

    const/4 v2, 0x0

    aget-boolean v1, v1, v2

    if-eqz v1, :cond_12

    goto :goto_6c

    .line 260
    :cond_12
    const-wide/16 v3, 0x64

    const/16 v1, 0x14

    :try_start_16
    iget-object v5, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$16;->val$layout:Landroid/view/WindowManager$LayoutParams;

    iget-object v6, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$16;->val$activity:Landroid/app/Activity;

    invoke-virtual {v6}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v6

    invoke-virtual {v6}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v6

    invoke-virtual {v6}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v6

    iput-object v6, v5, Landroid/view/WindowManager$LayoutParams;->token:Landroid/os/IBinder;

    .line 261
    iget-object v5, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$16;->val$layout:Landroid/view/WindowManager$LayoutParams;

    iget-object v5, v5, Landroid/view/WindowManager$LayoutParams;->token:Landroid/os/IBinder;

    if-nez v5, :cond_3c

    iget v5, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$16;->attempts:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$16;->attempts:I

    if-ge v5, v1, :cond_3c

    .line 262
    iget-object v2, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$16;->val$handler:Landroid/os/Handler;

    invoke-virtual {v2, p0, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 263
    return-void

    .line 265
    :cond_3c
    iget-object v5, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$16;->val$windowManager:Landroid/view/WindowManager;

    iget-object v6, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$16;->val$panel:Landroid/widget/LinearLayout;

    iget-object v7, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$16;->val$layout:Landroid/view/WindowManager$LayoutParams;

    invoke-interface {v5, v6, v7}, Landroid/view/WindowManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 266
    iget-object v5, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$16;->val$added:[Z

    const/4 v6, 0x1

    aput-boolean v6, v5, v2

    .line 267
    const-string v2, "overlay installed"

    invoke-static {v0, v2}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 268
    iget-object v2, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$16;->val$handler:Landroid/os/Handler;

    iget-object v5, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$16;->val$poll:Ljava/lang/Runnable;

    invoke-virtual {v2, v5}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_56
    .catchall {:try_start_16 .. :try_end_56} :catchall_57

    .line 275
    goto :goto_6b

    .line 269
    :catchall_57
    move-exception v2

    .line 270
    iget v5, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$16;->attempts:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$16;->attempts:I

    if-ge v5, v1, :cond_66

    .line 271
    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$16;->val$handler:Landroid/os/Handler;

    invoke-virtual {v0, p0, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_6b

    .line 273
    :cond_66
    const-string v1, "overlay install failed"

    invoke-static {v0, v1, v2}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 276
    :goto_6b
    return-void

    .line 258
    :cond_6c
    :goto_6c
    return-void
.end method
