.class Lcom/trueaxis/modmenu/GhostRouteOverlay$1;
.super Ljava/lang/Object;
.source "GhostRouteOverlay.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trueaxis/modmenu/GhostRouteOverlay;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trueaxis/modmenu/GhostRouteOverlay;


# direct methods
.method constructor <init>(Lcom/trueaxis/modmenu/GhostRouteOverlay;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 103
    iput-object p1, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay$1;->this$0:Lcom/trueaxis/modmenu/GhostRouteOverlay;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .line 105
    iget-object v0, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay$1;->this$0:Lcom/trueaxis/modmenu/GhostRouteOverlay;

    # getter for: Lcom/trueaxis/modmenu/GhostRouteOverlay;->activity:Landroid/app/Activity;
    invoke-static {v0}, Lcom/trueaxis/modmenu/GhostRouteOverlay;->access$000(Lcom/trueaxis/modmenu/GhostRouteOverlay;)Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_3d

    iget-object v0, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay$1;->this$0:Lcom/trueaxis/modmenu/GhostRouteOverlay;

    # getter for: Lcom/trueaxis/modmenu/GhostRouteOverlay;->disabled:Z
    invoke-static {v0}, Lcom/trueaxis/modmenu/GhostRouteOverlay;->access$100(Lcom/trueaxis/modmenu/GhostRouteOverlay;)Z

    move-result v0

    if-eqz v0, :cond_15

    goto :goto_3d

    .line 107
    :cond_15
    :try_start_15
    iget-object v0, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay$1;->this$0:Lcom/trueaxis/modmenu/GhostRouteOverlay;

    # invokes: Lcom/trueaxis/modmenu/GhostRouteOverlay;->tick()V
    invoke-static {v0}, Lcom/trueaxis/modmenu/GhostRouteOverlay;->access$200(Lcom/trueaxis/modmenu/GhostRouteOverlay;)V
    :try_end_1a
    .catchall {:try_start_15 .. :try_end_1a} :catchall_27

    .line 113
    nop

    .line 114
    iget-object v0, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay$1;->this$0:Lcom/trueaxis/modmenu/GhostRouteOverlay;

    # getter for: Lcom/trueaxis/modmenu/GhostRouteOverlay;->handler:Landroid/os/Handler;
    invoke-static {v0}, Lcom/trueaxis/modmenu/GhostRouteOverlay;->access$300(Lcom/trueaxis/modmenu/GhostRouteOverlay;)Landroid/os/Handler;

    move-result-object v0

    const-wide/16 v1, 0x3e8

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 115
    return-void

    .line 108
    :catchall_27
    move-exception v0

    .line 109
    iget-object v1, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay$1;->this$0:Lcom/trueaxis/modmenu/GhostRouteOverlay;

    const/4 v2, 0x1

    # setter for: Lcom/trueaxis/modmenu/GhostRouteOverlay;->disabled:Z
    invoke-static {v1, v2}, Lcom/trueaxis/modmenu/GhostRouteOverlay;->access$102(Lcom/trueaxis/modmenu/GhostRouteOverlay;Z)Z

    .line 110
    iget-object v1, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay$1;->this$0:Lcom/trueaxis/modmenu/GhostRouteOverlay;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Lcom/trueaxis/modmenu/GhostRouteOverlay;->setVisibility(I)V

    .line 111
    const-string v1, "ghost"

    const-string v2, "ghost route overlay failed; disabling"

    invoke-static {v1, v2, v0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 112
    return-void

    .line 105
    :cond_3d
    :goto_3d
    return-void
.end method
