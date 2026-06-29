.class Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$17$1;
.super Ljava/lang/Object;
.source "ReplayFreeCameraOverlay.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$17;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$17;


# direct methods
.method constructor <init>(Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$17;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 283
    iput-object p1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$17$1;->this$0:Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$17;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .line 285
    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$17$1;->this$0:Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$17;

    # getter for: Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$17;->holding:Z
    invoke-static {v0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$17;->access$000(Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$17;)Z

    move-result v0

    if-nez v0, :cond_9

    return-void

    .line 286
    :cond_9
    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$17$1;->this$0:Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$17;

    iget-object v0, v0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$17;->val$step:Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$Step;

    invoke-interface {v0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$Step;->run()V

    .line 287
    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$17$1;->this$0:Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$17;

    iget-object v0, v0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$17;->val$handler:Landroid/os/Handler;

    const-wide/16 v1, 0x2d

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 288
    return-void
.end method
