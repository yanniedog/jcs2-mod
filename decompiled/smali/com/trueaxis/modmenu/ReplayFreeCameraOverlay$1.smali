.class Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;
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


# direct methods
.method constructor <init>()V
    .registers 1

    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 3

    .line 62
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readReplayFreeCameraStatus()I

    move-result p1

    .line 63
    and-int/lit8 p1, p1, 0x4

    if-eqz p1, :cond_a

    const/4 p1, 0x1

    goto :goto_b

    :cond_a
    const/4 p1, 0x0

    .line 64
    :goto_b
    xor-int/lit8 v0, p1, 0x1

    invoke-static {v0}, Lcom/trueaxis/modmenu/RequiredPatches;->setReplayFreeCameraLocked(Z)V

    .line 65
    if-eqz p1, :cond_15

    const-string p1, "return to stock path"

    goto :goto_17

    :cond_15
    const-string p1, "lock camera"

    :goto_17
    const-string v0, "freecam"

    invoke-static {v0, p1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    return-void
.end method
