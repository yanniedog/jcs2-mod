.class public final Lcom/trueaxis/modmenu/RequiredPatches;
.super Ljava/lang/Object;
.source "RequiredPatches.java"


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 8
    const-string v0, "jcs2mod"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 9
    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    return-void
.end method

.method public static apply()V
    .registers 2

    .line 15
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->applyUnlimitedCheckpoints()Z

    .line 16
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->installReplayVisualMarker()Z

    move-result v0

    if-eqz v0, :cond_a

    .line 19
    return-void

    .line 17
    :cond_a
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Replay visual marker unavailable"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static native applyUnlimitedCheckpoints()Z
.end method

.method private static native installReplayVisualMarker()Z
.end method
