.class Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$11;
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


# direct methods
.method constructor <init>()V
    .registers 1

    .line 128
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 130
    const/4 v0, 0x0

    const v1, 0x3d3851ec

    invoke-static {v0, v0, v0, v1, v0}, Lcom/trueaxis/modmenu/RequiredPatches;->nudgeReplayFreeCamera(FFFFF)V

    .line 131
    return-void
.end method
