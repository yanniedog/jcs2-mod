.class final Lcom/trueaxis/vsync/Vsync$1;
.super Ljava/lang/Object;
.source "Vsync.java"

# interfaces
.implements Landroid/view/Choreographer$FrameCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/vsync/Vsync;->setVsyncCallback()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public doFrame(J)V
    .locals 0

    .line 34
    sget p1, Lcom/trueaxis/vsync/Vsync;->frameCount:I

    add-int/lit8 p1, p1, 0x1

    sput p1, Lcom/trueaxis/vsync/Vsync;->frameCount:I

    .line 35
    sget p1, Lcom/trueaxis/vsync/Vsync;->frameCount:I

    sget p2, Lcom/trueaxis/vsync/Vsync;->frameCountMax:I

    if-lt p1, p2, :cond_0

    const/4 p1, 0x0

    .line 37
    sput p1, Lcom/trueaxis/vsync/Vsync;->frameCount:I

    .line 38
    invoke-static {}, Lcom/trueaxis/cLib/TrueaxisLib;->Render()V

    .line 40
    :cond_0
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    move-result-object p1

    .line 41
    invoke-static {}, Lcom/trueaxis/vsync/Vsync;->access$000()Landroid/view/Choreographer$FrameCallback;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    return-void
.end method
