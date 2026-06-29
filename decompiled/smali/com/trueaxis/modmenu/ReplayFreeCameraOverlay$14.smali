.class Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$14;
.super Ljava/lang/Object;
.source "ReplayFreeCameraOverlay.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->install(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private lastX:F

.field private lastY:F

.field private tracking:Z


# direct methods
.method constructor <init>()V
    .registers 1

    .line 153
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 7

    .line 159
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result p1

    .line 160
    const/4 v0, 0x1

    if-nez p1, :cond_16

    .line 161
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    iput p1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$14;->lastX:F

    .line 162
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    iput p1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$14;->lastY:F

    .line 163
    iput-boolean v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$14;->tracking:Z

    .line 164
    return v0

    .line 166
    :cond_16
    const/4 v1, 0x2

    if-ne p1, v1, :cond_3c

    iget-boolean v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$14;->tracking:Z

    if-eqz v1, :cond_3c

    .line 167
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    .line 168
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result p2

    .line 169
    iget v1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$14;->lastX:F

    sub-float v1, p1, v1

    const v2, 0x3b83126f

    mul-float v1, v1, v2

    .line 170
    iget v3, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$14;->lastY:F

    sub-float/2addr v3, p2

    mul-float v3, v3, v2

    .line 171
    iput p1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$14;->lastX:F

    .line 172
    iput p2, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$14;->lastY:F

    .line 173
    const/4 p1, 0x0

    invoke-static {p1, p1, p1, v1, v3}, Lcom/trueaxis/modmenu/RequiredPatches;->nudgeReplayFreeCamera(FFFFF)V

    .line 174
    return v0

    .line 176
    :cond_3c
    if-eq p1, v0, :cond_43

    const/4 p2, 0x3

    if-ne p1, p2, :cond_42

    goto :goto_43

    .line 180
    :cond_42
    return v0

    .line 177
    :cond_43
    :goto_43
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$14;->tracking:Z

    .line 178
    return v0
.end method
