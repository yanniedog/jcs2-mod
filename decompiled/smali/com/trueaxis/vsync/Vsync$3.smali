.class final Lcom/trueaxis/vsync/Vsync$3;
.super Ljava/lang/Object;
.source "Vsync.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/vsync/Vsync;->removeVsyncCallback()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 68
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    move-result-object v0

    .line 69
    invoke-static {}, Lcom/trueaxis/vsync/Vsync;->access$000()Landroid/view/Choreographer$FrameCallback;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 71
    invoke-static {}, Lcom/trueaxis/vsync/Vsync;->access$000()Landroid/view/Choreographer$FrameCallback;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    const/4 v0, 0x0

    .line 72
    invoke-static {v0}, Lcom/trueaxis/vsync/Vsync;->access$002(Landroid/view/Choreographer$FrameCallback;)Landroid/view/Choreographer$FrameCallback;

    :cond_0
    return-void
.end method
