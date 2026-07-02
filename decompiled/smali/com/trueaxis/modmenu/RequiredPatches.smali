.class public final Lcom/trueaxis/modmenu/RequiredPatches;
.super Ljava/lang/Object;
.source "RequiredPatches.java"


# static fields
.field private static final NATIVE_AVAILABLE:Z

.field private static final TAG:Ljava/lang/String; = "YCS2Mod"


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
    const-string v1, "YCS2Mod"

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
    .registers 7

    .line 28
    const-string v0, "YCS2Mod"

    invoke-static {p0}, Lcom/trueaxis/modmenu/ModDebugLog;->install(Landroid/content/Context;)V

    .line 29
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModIdentity;->configure(Landroid/content/Context;)V

    .line 30
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "apply start nativeAvailable="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-boolean v2, Lcom/trueaxis/modmenu/RequiredPatches;->NATIVE_AVAILABLE:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "patches"

    invoke-static {v2, v1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    sget-boolean v1, Lcom/trueaxis/modmenu/RequiredPatches;->NATIVE_AVAILABLE:Z

    if-nez v1, :cond_2c

    .line 32
    const-string p0, "native patch library unavailable"

    invoke-static {p0}, Lcom/trueaxis/modmenu/ModDebugLog;->log(Ljava/lang/String;)V

    .line 33
    return-void

    .line 36
    :cond_2c
    :try_start_2c
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->installNativeCrashLogger()Z

    move-result v1

    .line 37
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "native fatal-signal logger installed="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, " path="

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 38
    invoke-static {}, Lcom/trueaxis/modmenu/ModDebugLog;->nativeCrashFile()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 37
    invoke-static {v2, v1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_54
    .catchall {:try_start_2c .. :try_end_54} :catchall_55

    .line 42
    goto :goto_5e

    .line 39
    :catchall_55
    move-exception v1

    .line 40
    const-string v3, "Could not install native fatal-signal logger"

    invoke-static {v0, v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 41
    invoke-static {v2, v3, v1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 44
    :goto_5e
    :try_start_5e
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->applyUnlimitedCheckpoints()Z

    move-result v1

    .line 45
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "applied retained native patches result="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/trueaxis/modmenu/ModDebugLog;->log(Ljava/lang/String;)V
    :try_end_78
    .catchall {:try_start_5e .. :try_end_78} :catchall_79

    .line 49
    goto :goto_82

    .line 46
    :catchall_79
    move-exception v1

    .line 47
    const-string v2, "Could not apply unlimited checkpoints"

    invoke-static {v0, v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 48
    invoke-static {v2, v1}, Lcom/trueaxis/modmenu/ModDebugLog;->log(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 51
    :goto_82
    :try_start_82
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->installUserTrackFeatureHooks()Z

    move-result v1

    .line 52
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "user track creation feature hooks installed="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/trueaxis/modmenu/ModDebugLog;->log(Ljava/lang/String;)V
    :try_end_9c
    .catchall {:try_start_82 .. :try_end_9c} :catchall_9d

    .line 56
    goto :goto_a6

    .line 53
    :catchall_9d
    move-exception v1

    .line 54
    const-string v2, "Could not install user track feature hooks"

    invoke-static {v0, v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 55
    invoke-static {v2, v1}, Lcom/trueaxis/modmenu/ModDebugLog;->log(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 57
    :goto_a6
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->replayFreeCameraEnabled(Landroid/content/Context;)Z

    move-result v1

    .line 59
    :try_start_aa
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->installReplayFreeCameraHooks()Z

    move-result v2

    .line 60
    invoke-static {v1}, Lcom/trueaxis/modmenu/RequiredPatches;->setReplayFreeCameraEnabled(Z)V

    .line 61
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->replayCameraMode(Landroid/content/Context;)I

    move-result v3

    .line 62
    invoke-static {v3}, Lcom/trueaxis/modmenu/RequiredPatches;->setReplayCameraMode(I)V

    .line 63
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "replay free camera hooks installed="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " enabled="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " mode="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/trueaxis/modmenu/ModDebugLog;->log(Ljava/lang/String;)V

    .line 65
    if-eqz v2, :cond_e9

    if-eqz v1, :cond_e9

    .line 66
    invoke-static {p0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->install(Landroid/app/Activity;)V
    :try_end_e9
    .catchall {:try_start_aa .. :try_end_e9} :catchall_ea

    .line 71
    :cond_e9
    goto :goto_f3

    .line 68
    :catchall_ea
    move-exception v1

    .line 69
    const-string v2, "Could not install replay free camera"

    invoke-static {v0, v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 70
    invoke-static {v2, v1}, Lcom/trueaxis/modmenu/ModDebugLog;->log(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 72
    :goto_f3
    const-string v1, "replay visual marker disabled; replay data is not modified"

    invoke-static {v1}, Lcom/trueaxis/modmenu/ModDebugLog;->log(Ljava/lang/String;)V

    .line 73
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->replaySwarmEnabled(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_12c

    .line 75
    :try_start_fe
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->installReplaySwarmHooks()Z

    move-result v1

    .line 76
    const/4 v2, 0x1

    invoke-static {v2}, Lcom/trueaxis/modmenu/RequiredPatches;->setReplaySwarmEnabled(Z)V

    .line 77
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "replay swarm hooks installed="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/trueaxis/modmenu/ModDebugLog;->log(Ljava/lang/String;)V

    .line 78
    if-eqz v1, :cond_12b

    .line 79
    invoke-static {p0}, Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->install(Landroid/app/Activity;)V
    :try_end_121
    .catchall {:try_start_fe .. :try_end_121} :catchall_122

    goto :goto_12b

    .line 81
    :catchall_122
    move-exception v1

    .line 82
    const-string v2, "Could not install replay swarm mode"

    invoke-static {v0, v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 83
    invoke-static {v2, v1}, Lcom/trueaxis/modmenu/ModDebugLog;->log(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 84
    :cond_12b
    :goto_12b
    goto :goto_132

    .line 87
    :cond_12c
    const/4 v1, 0x0

    :try_start_12d
    invoke-static {v1}, Lcom/trueaxis/modmenu/RequiredPatches;->setReplaySwarmEnabled(Z)V
    :try_end_130
    .catchall {:try_start_12d .. :try_end_130} :catchall_131

    .line 89
    goto :goto_132

    .line 88
    :catchall_131
    move-exception v1

    .line 91
    :goto_132
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->checkpointSplitsEnabled(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_14b

    .line 92
    const-string v1, "checkpoint split HUD enabled"

    invoke-static {v1}, Lcom/trueaxis/modmenu/ModDebugLog;->log(Ljava/lang/String;)V

    .line 94
    :try_start_13d
    invoke-static {p0}, Lcom/trueaxis/modmenu/SplitTimeHud;->install(Landroid/app/Activity;)V
    :try_end_140
    .catchall {:try_start_13d .. :try_end_140} :catchall_141

    .line 98
    :goto_140
    goto :goto_150

    .line 95
    :catchall_141
    move-exception p0

    .line 96
    const-string v1, "Could not install checkpoint split HUD"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 97
    invoke-static {v1, p0}, Lcom/trueaxis/modmenu/ModDebugLog;->log(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_140

    .line 100
    :cond_14b
    const-string p0, "checkpoint split HUD disabled"

    invoke-static {p0}, Lcom/trueaxis/modmenu/ModDebugLog;->log(Ljava/lang/String;)V

    .line 102
    :goto_150
    const-string p0, "after RequiredPatches.apply"

    invoke-static {p0}, Lcom/trueaxis/modmenu/ModDebugLog;->logRuntime(Ljava/lang/String;)V

    .line 103
    return-void
.end method

.method private static native applyUnlimitedCheckpoints()Z
.end method

.method static native clearReplaySwarm()V
.end method

.method static native gestureReplayFreeCamera(FFFFFFF)V
.end method

.method private static native installNativeCrashLogger()Z
.end method

.method private static native installReplayFreeCameraHooks()Z
.end method

.method private static native installReplaySwarmHooks()Z
.end method

.method private static native installUserTrackFeatureHooks()Z
.end method

.method static native nudgeReplayFreeCamera(FFFFF)V
.end method

.method static native readGhostCheckpointMillis(I)I
.end method

.method static native readLatestCheckpointCurrentMillis()I
.end method

.method static native readLatestCheckpointGhostMillis()I
.end method

.method static native readLatestCheckpointSplit()J
.end method

.method static native readReplayCameraDiag(I)I
.end method

.method static native readReplayFreeCameraStatus()I
.end method

.method static native readReplaySwarmActive()I
.end method

.method static native readReplaySwarmCatalogCount()I
.end method

.method static native readReplaySwarmCatalogPath(I[B)I
.end method

.method static native readReplaySwarmGhostCount()I
.end method

.method static native readReplaySwarmPrimaryIndex()I
.end method

.method static native readSplitDecodedEngineCheckpointIndex()I
.end method

.method static native readSplitEngineLastCheckpointIndex()I
.end method

.method static native readSplitGhostCheckpointCount()I
.end method

.method static native readSplitGhostCheckpointDistanceSq1000()I
.end method

.method static native readSplitGhostPos()I
.end method

.method static native readSplitGhostRetryPauseTime()I
.end method

.method static native readSplitGhostRetrySkipCount()I
.end method

.method static native readSplitGhostRetrySkipIndex()I
.end method

.method static native readSplitGhostSize()I
.end method

.method static native readSplitGhostVisualMillis()I
.end method

.method static native readSplitLastCheckpointMillis()I
.end method

.method static native readSplitLastGhostPos()I
.end method

.method static native readSplitLastGhostRetryPauseTime()I
.end method

.method static native readSplitLastGhostRetrySkipIndex()I
.end method

.method static native readSplitLastReplaySize()I
.end method

.method static native readSplitLiveArrayMillis(I)I
.end method

.method static native readSplitLiveCheckpointCount()I
.end method

.method static native readSplitOfficialGhostArrayMillis(I)I
.end method

.method static native readSplitOfficialGhostCheckpointCount()I
.end method

.method static native readSplitReplayHeaderCheckpointCount()I
.end method

.method static native readSplitReplayHeaderFinishMillis()I
.end method

.method static native readSplitReplayHeaderSize()I
.end method

.method static native readSplitReplayVisualMillis()I
.end method

.method static native readSplitResolvedCheckpoint()I
.end method

.method static native readSplitScannedCheckpointIndex()I
.end method

.method static native readSplitShowReplayFlag()I
.end method

.method static native readSplitVisualDeltaMillis()I
.end method

.method static native resetReplayFreeCamera()V
.end method

.method static native setReplayCameraMode(I)V
.end method

.method static native setReplayFreeCameraEnabled(Z)V
.end method

.method static native setReplayFreeCameraLocked(Z)V
.end method

.method static native setReplaySwarmEnabled(Z)V
.end method

.method static native setReplaySwarmSelection(I[I)V
.end method
