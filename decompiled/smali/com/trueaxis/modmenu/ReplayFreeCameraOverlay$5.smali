.class Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$5;
.super Ljava/lang/Object;
.source "ReplayFreeCameraOverlay.java"

# interfaces
.implements Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$Step;


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


# direct methods
.method constructor <init>([F)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 92
    iput-object p1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$5;->val$moveStep:[F

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 94
    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$5;->val$moveStep:[F

    const/4 v1, 0x0

    aget v0, v0, v1

    neg-float v0, v0

    const/4 v1, 0x0

    invoke-static {v1, v1, v0, v1, v1}, Lcom/trueaxis/modmenu/RequiredPatches;->nudgeReplayFreeCamera(FFFFF)V

    .line 95
    return-void
.end method
