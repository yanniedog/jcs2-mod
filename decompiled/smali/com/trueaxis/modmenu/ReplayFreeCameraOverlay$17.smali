.class Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$17;
.super Ljava/lang/Object;
.source "ReplayFreeCameraOverlay.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->repeatButton(Landroid/widget/Button;Landroid/os/Handler;Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$Step;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private holding:Z

.field private final repeat:Ljava/lang/Runnable;

.field final synthetic val$handler:Landroid/os/Handler;

.field final synthetic val$step:Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$Step;


# direct methods
.method constructor <init>(Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$Step;Landroid/os/Handler;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 281
    iput-object p1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$17;->val$step:Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$Step;

    iput-object p2, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$17;->val$handler:Landroid/os/Handler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 283
    new-instance p1, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$17$1;

    invoke-direct {p1, p0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$17$1;-><init>(Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$17;)V

    iput-object p1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$17;->repeat:Ljava/lang/Runnable;

    return-void
.end method

.method static synthetic access$000(Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$17;)Z
    .registers 1

    .line 281
    iget-boolean p0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$17;->holding:Z

    return p0
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 6

    .line 292
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result p1

    .line 293
    const/4 p2, 0x1

    if-nez p1, :cond_1f

    .line 294
    iput-boolean p2, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$17;->holding:Z

    .line 295
    iget-object p1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$17;->val$step:Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$Step;

    invoke-interface {p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$Step;->run()V

    .line 296
    iget-object p1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$17;->val$handler:Landroid/os/Handler;

    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$17;->repeat:Ljava/lang/Runnable;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 297
    iget-object p1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$17;->val$handler:Landroid/os/Handler;

    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$17;->repeat:Ljava/lang/Runnable;

    const-wide/16 v1, 0x2d

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 298
    return p2

    .line 300
    :cond_1f
    if-eq p1, p2, :cond_26

    const/4 v0, 0x3

    if-ne p1, v0, :cond_25

    goto :goto_26

    .line 305
    :cond_25
    return p2

    .line 301
    :cond_26
    :goto_26
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$17;->holding:Z

    .line 302
    iget-object p1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$17;->val$handler:Landroid/os/Handler;

    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$17;->repeat:Ljava/lang/Runnable;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 303
    return p2
.end method
