.class public final Lcom/trueaxis/modmenu/RequiredPatches;
.super Ljava/lang/Object;
.source "RequiredPatches.java"


# static fields
.field private static final NATIVE_AVAILABLE:Z

.field private static final TAG:Ljava/lang/String; = "MCS2Mod"


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .line 14
    nop

    .line 16
    :try_start_1
    const-string v0, "jcs2mod"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_9

    .line 17
    nop

    .line 20
    const/4 v0, 0x1

    goto :goto_12

    .line 18
    :catchall_9
    move-exception v0

    .line 19
    const-string v1, "MCS2Mod"

    const-string v2, "Could not load required patch library"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const/4 v0, 0x0

    .line 21
    :goto_12
    sput-boolean v0, Lcom/trueaxis/modmenu/RequiredPatches;->NATIVE_AVAILABLE:Z

    .line 22
    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    return-void
.end method

.method public static apply(Landroid/app/Activity;)V
    .registers 4

    .line 28
    const-string v0, "MCS2Mod"

    sget-boolean v1, Lcom/trueaxis/modmenu/RequiredPatches;->NATIVE_AVAILABLE:Z

    if-nez v1, :cond_7

    .line 29
    return-void

    .line 32
    :cond_7
    :try_start_7
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->applyUnlimitedCheckpoints()Z
    :try_end_a
    .catchall {:try_start_7 .. :try_end_a} :catchall_b

    .line 35
    goto :goto_11

    .line 33
    :catchall_b
    move-exception v1

    .line 34
    const-string v2, "Could not apply unlimited checkpoints"

    invoke-static {v0, v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 37
    :goto_11
    :try_start_11
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->installReplayVisualMarker()Z
    :try_end_14
    .catchall {:try_start_11 .. :try_end_14} :catchall_15

    .line 40
    goto :goto_1b

    .line 38
    :catchall_15
    move-exception v1

    .line 39
    const-string v2, "Could not install replay visual marker"

    invoke-static {v0, v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 41
    :goto_1b
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->checkpointSplitsEnabled(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_24

    .line 42
    invoke-static {p0}, Lcom/trueaxis/modmenu/SplitTimeHud;->install(Landroid/app/Activity;)V

    .line 44
    :cond_24
    return-void
.end method

.method private static native applyUnlimitedCheckpoints()Z
.end method

.method private static native installReplayVisualMarker()Z
.end method

.method static native readLatestCheckpointSplit()J
.end method
