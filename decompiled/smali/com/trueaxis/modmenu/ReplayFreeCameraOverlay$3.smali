.class Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$3;
.super Ljava/lang/Object;
.source "ReplayFreeCameraOverlay.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->install(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$moveStep:[F

.field final synthetic val$speed:Landroid/widget/Button;


# direct methods
.method constructor <init>([FLandroid/widget/Button;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 74
    iput-object p1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$3;->val$moveStep:[F

    iput-object p2, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$3;->val$speed:Landroid/widget/Button;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 5

    .line 76
    iget-object p1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$3;->val$moveStep:[F

    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$3;->val$moveStep:[F

    const/4 v1, 0x0

    aget v0, v0, v1

    const/high16 v2, 0x41900000

    cmpl-float v0, v0, v2

    if-nez v0, :cond_10

    const/high16 v0, 0x425c0000

    goto :goto_12

    :cond_10
    const/high16 v0, 0x41900000

    :goto_12
    aput v0, p1, v1

    .line 77
    iget-object p1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$3;->val$speed:Landroid/widget/Button;

    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$3;->val$moveStep:[F

    aget v0, v0, v1

    cmpl-float v0, v0, v2

    if-nez v0, :cond_21

    const-string v0, "Fast"

    goto :goto_23

    :cond_21
    const-string v0, "Slow"

    :goto_23
    invoke-virtual {p1, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 78
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "speed="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$3;->val$moveStep:[F

    aget v0, v0, v1

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "freecam"

    invoke-static {v0, p1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    return-void
.end method
