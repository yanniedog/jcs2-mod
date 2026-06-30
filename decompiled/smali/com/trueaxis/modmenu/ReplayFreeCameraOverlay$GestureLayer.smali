.class final Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;
.super Landroid/view/View;
.source "ReplayFreeCameraOverlay.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "GestureLayer"
.end annotation


# direct methods
.method constructor <init>(Landroid/app/Activity;)V
    .registers 2

    .line 529
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 530
    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->setWillNotDraw(Z)V

    .line 531
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->setFocusable(Z)V

    .line 532
    invoke-virtual {p0, p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureLayer;->setFocusableInTouchMode(Z)V

    .line 533
    return-void
.end method
