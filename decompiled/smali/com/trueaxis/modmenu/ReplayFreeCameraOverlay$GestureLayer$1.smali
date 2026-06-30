.class Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer$1;
.super Ljava/lang/Object;
.source "ReplayFreeCameraOverlay.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->replayTapToGame(FF)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;

.field final synthetic val$decor:Landroid/view/View;

.field final synthetic val$x:F

.field final synthetic val$y:F


# direct methods
.method constructor <init>(Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;FFLandroid/view/View;)V
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 246
    iput-object p1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer$1;->this$0:Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;

    iput p2, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer$1;->val$x:F

    iput p3, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer$1;->val$y:F

    iput-object p4, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer$1;->val$decor:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 12

    .line 248
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v8

    .line 249
    iget v5, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer$1;->val$x:F

    iget v6, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer$1;->val$y:F

    const/4 v7, 0x0

    const/4 v4, 0x0

    move-wide v0, v8

    move-wide v2, v8

    invoke-static/range {v0 .. v7}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object v10

    .line 250
    const-wide/16 v0, 0x10

    add-long v2, v8, v0

    iget v5, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer$1;->val$x:F

    iget v6, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer$1;->val$y:F

    const/4 v4, 0x1

    move-wide v0, v8

    invoke-static/range {v0 .. v7}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object v0

    .line 251
    nop

    .line 252
    nop

    .line 254
    :try_start_20
    iget-object v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer$1;->val$decor:Landroid/view/View;

    invoke-virtual {v1, v10}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v1

    .line 255
    iget-object v2, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer$1;->val$decor:Landroid/view/View;

    invoke-virtual {v2, v0}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v2
    :try_end_2c
    .catchall {:try_start_20 .. :try_end_2c} :catchall_ca

    .line 257
    invoke-virtual {v10}, Landroid/view/MotionEvent;->recycle()V

    .line 258
    invoke-virtual {v0}, Landroid/view/MotionEvent;->recycle()V

    .line 259
    nop

    .line 260
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "tap replay x="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v3, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer$1;->val$x:F

    .line 261
    # invokes: Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->fmt(F)Ljava/lang/String;
    invoke-static {v3}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->access$100(F)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, " y="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v3, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer$1;->val$y:F

    # invokes: Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->fmt(F)Ljava/lang/String;
    invoke-static {v3}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->access$100(F)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, " down="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, " up="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 260
    const-string v3, "freecam"

    invoke-static {v3, v0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 264
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "{\"x\":"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v3, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer$1;->val$x:F

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, ",\"y\":"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v3, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer$1;->val$y:F

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, ",\"downHandled\":"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ",\"upHandled\":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "H"

    const-string v2, "ReplayFreeCameraOverlay.java:replayTapToGame"

    const-string v3, "tap_replay_dispatched"

    # invokes: Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->agentLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {v1, v2, v3, v0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->access$000(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 270
    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer$1;->this$0:Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;

    # getter for: Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->handler:Landroid/os/Handler;
    invoke-static {v0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->access$200(Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;)Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer$1$1;

    invoke-direct {v1, p0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer$1$1;-><init>(Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer$1;)V

    const-wide/16 v2, 0x30

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 275
    return-void

    .line 257
    :catchall_ca
    move-exception v1

    invoke-virtual {v10}, Landroid/view/MotionEvent;->recycle()V

    .line 258
    invoke-virtual {v0}, Landroid/view/MotionEvent;->recycle()V

    .line 259
    throw v1
.end method
