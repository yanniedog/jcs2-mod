.class public Lcom/trueaxis/vsync/Vsync;
.super Ljava/lang/Object;
.source "Vsync.java"


# static fields
.field static allowFrameCallback:Z = true

.field private static callback:Landroid/view/Choreographer$FrameCallback; = null

.field static frameCount:I = 0x0

.field static frameCountMax:I = 0x1


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()Landroid/view/Choreographer$FrameCallback;
    .locals 1

    .line 12
    sget-object v0, Lcom/trueaxis/vsync/Vsync;->callback:Landroid/view/Choreographer$FrameCallback;

    return-object v0
.end method

.method static synthetic access$002(Landroid/view/Choreographer$FrameCallback;)Landroid/view/Choreographer$FrameCallback;
    .locals 0

    .line 12
    sput-object p0, Lcom/trueaxis/vsync/Vsync;->callback:Landroid/view/Choreographer$FrameCallback;

    return-object p0
.end method

.method public static removeVsyncCallback()V
    .locals 2

    .line 60
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_0

    .line 62
    invoke-static {}, Lcom/trueaxis/game/Interface;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    .line 63
    new-instance v1, Lcom/trueaxis/vsync/Vsync$3;

    invoke-direct {v1}, Lcom/trueaxis/vsync/Vsync$3;-><init>()V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method public static setVsyncCallback()V
    .locals 2

    .line 25
    sget-boolean v0, Lcom/trueaxis/vsync/Vsync;->allowFrameCallback:Z

    if-eqz v0, :cond_0

    .line 27
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_0

    .line 29
    new-instance v0, Lcom/trueaxis/vsync/Vsync$1;

    invoke-direct {v0}, Lcom/trueaxis/vsync/Vsync$1;-><init>()V

    sput-object v0, Lcom/trueaxis/vsync/Vsync;->callback:Landroid/view/Choreographer$FrameCallback;

    .line 44
    invoke-static {}, Lcom/trueaxis/game/Interface;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    .line 45
    new-instance v1, Lcom/trueaxis/vsync/Vsync$2;

    invoke-direct {v1}, Lcom/trueaxis/vsync/Vsync$2;-><init>()V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method


# virtual methods
.method public setVsyncFps(II)V
    .locals 0

    .line 81
    sput p1, Lcom/trueaxis/vsync/Vsync;->frameCountMax:I

    const/4 p1, 0x1

    if-ne p2, p1, :cond_0

    .line 84
    sput-boolean p1, Lcom/trueaxis/vsync/Vsync;->allowFrameCallback:Z

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 88
    sput-boolean p1, Lcom/trueaxis/vsync/Vsync;->allowFrameCallback:Z

    .line 89
    invoke-static {}, Lcom/trueaxis/vsync/Vsync;->removeVsyncCallback()V

    :goto_0
    return-void
.end method
