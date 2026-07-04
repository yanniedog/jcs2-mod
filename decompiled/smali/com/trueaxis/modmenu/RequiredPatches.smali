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

.method static native addReplaySwarmCatalogPath([B)V
.end method

.method public static apply(Landroid/app/Activity;)V
    .registers 10

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
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->orbitRadius(Landroid/content/Context;)I

    move-result v4

    .line 64
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->orbitSpeed(Landroid/content/Context;)I

    move-result v5

    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->orbitHeight(Landroid/content/Context;)I

    move-result v6

    .line 63
    invoke-static {v4, v5, v6}, Lcom/trueaxis/modmenu/RequiredPatches;->setReplayOrbitTuning(III)V

    .line 65
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->tracksideSideMode(Landroid/content/Context;)I

    move-result v4

    .line 66
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->tracksideSideDist(Landroid/content/Context;)I

    move-result v5

    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->tracksideHeight(Landroid/content/Context;)I

    move-result v6

    .line 67
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->tracksideMinDist(Landroid/content/Context;)I

    move-result v7

    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->tracksideMaxDist(Landroid/content/Context;)I

    move-result v8

    .line 65
    invoke-static {v4, v5, v6, v7, v8}, Lcom/trueaxis/modmenu/RequiredPatches;->setReplayTracksideTuning(IIIII)V

    .line 68
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->cameraCycleEnabled(Landroid/content/Context;)Z

    move-result v4

    .line 69
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->cameraCycleSeconds(Landroid/content/Context;)I

    move-result v5

    .line 68
    invoke-static {v4, v5}, Lcom/trueaxis/modmenu/RequiredPatches;->setReplayCameraCycle(ZI)V

    .line 70
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

    const-string v4, " orbit="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 72
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->orbitRadius(Landroid/content/Context;)I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "u/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 73
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->orbitSpeed(Landroid/content/Context;)I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "dps/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 74
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->orbitHeight(Landroid/content/Context;)I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "deg"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 70
    invoke-static {v3}, Lcom/trueaxis/modmenu/ModDebugLog;->log(Ljava/lang/String;)V

    .line 75
    if-eqz v2, :cond_14a

    if-eqz v1, :cond_14a

    .line 76
    invoke-static {p0}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->install(Landroid/app/Activity;)V
    :try_end_14a
    .catchall {:try_start_aa .. :try_end_14a} :catchall_14b

    .line 81
    :cond_14a
    goto :goto_154

    .line 78
    :catchall_14b
    move-exception v1

    .line 79
    const-string v2, "Could not install replay free camera"

    invoke-static {v0, v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 80
    invoke-static {v2, v1}, Lcom/trueaxis/modmenu/ModDebugLog;->log(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 82
    :goto_154
    const-string v1, "replay visual marker disabled; replay data is not modified"

    invoke-static {v1}, Lcom/trueaxis/modmenu/ModDebugLog;->log(Ljava/lang/String;)V

    .line 83
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->replaySwarmEnabled(Landroid/content/Context;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_1e5

    .line 85
    :try_start_160
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->installReplaySwarmHooks()Z

    move-result v1

    .line 86
    const/4 v3, 0x1

    invoke-static {v3}, Lcom/trueaxis/modmenu/RequiredPatches;->setReplaySwarmEnabled(Z)V

    .line 87
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->raceSwarmEnabled(Landroid/content/Context;)Z

    move-result v3

    .line 88
    invoke-static {v3}, Lcom/trueaxis/modmenu/RequiredPatches;->setReplayRaceSwarmEnabled(Z)V

    .line 89
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->swarmCatalogPaths(Landroid/content/Context;)[Ljava/lang/String;

    move-result-object v4

    .line 90
    array-length v5, v4

    :goto_174
    if-ge v2, v5, :cond_18e

    aget-object v6, v4, v2

    .line 91
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v7

    if-lez v7, :cond_18b

    .line 92
    const-string v7, "UTF-8"

    .line 93
    invoke-static {v7}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v6

    .line 92
    invoke-static {v6}, Lcom/trueaxis/modmenu/RequiredPatches;->addReplaySwarmCatalogPath([B)V

    .line 90
    :cond_18b
    add-int/lit8 v2, v2, 0x1

    goto :goto_174

    .line 96
    :cond_18e
    invoke-static {p0}, Lcom/trueaxis/modmenu/RequiredPatches;->seedSwarmSlotReplays(Landroid/app/Activity;)I

    move-result v2

    .line 97
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "replay swarm hooks installed="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " raceSwarm="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, " remembered="

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    array-length v4, v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " slotReplays="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " catalog="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 101
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readReplaySwarmCatalogCount()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 97
    invoke-static {v2}, Lcom/trueaxis/modmenu/ModDebugLog;->log(Ljava/lang/String;)V

    .line 102
    if-eqz v1, :cond_1e4

    .line 103
    invoke-static {p0}, Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->install(Landroid/app/Activity;)V
    :try_end_1da
    .catchall {:try_start_160 .. :try_end_1da} :catchall_1db

    goto :goto_1e4

    .line 105
    :catchall_1db
    move-exception v1

    .line 106
    const-string v2, "Could not install replay swarm mode"

    invoke-static {v0, v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 107
    invoke-static {v2, v1}, Lcom/trueaxis/modmenu/ModDebugLog;->log(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 108
    :cond_1e4
    :goto_1e4
    goto :goto_1ea

    .line 111
    :cond_1e5
    :try_start_1e5
    invoke-static {v2}, Lcom/trueaxis/modmenu/RequiredPatches;->setReplaySwarmEnabled(Z)V
    :try_end_1e8
    .catchall {:try_start_1e5 .. :try_end_1e8} :catchall_1e9

    .line 113
    goto :goto_1ea

    .line 112
    :catchall_1e9
    move-exception v1

    .line 115
    :goto_1ea
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->checkpointSplitsEnabled(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_203

    .line 116
    const-string v1, "checkpoint split HUD enabled"

    invoke-static {v1}, Lcom/trueaxis/modmenu/ModDebugLog;->log(Ljava/lang/String;)V

    .line 118
    :try_start_1f5
    invoke-static {p0}, Lcom/trueaxis/modmenu/SplitTimeHud;->install(Landroid/app/Activity;)V
    :try_end_1f8
    .catchall {:try_start_1f5 .. :try_end_1f8} :catchall_1f9

    .line 122
    :goto_1f8
    goto :goto_208

    .line 119
    :catchall_1f9
    move-exception p0

    .line 120
    const-string v1, "Could not install checkpoint split HUD"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 121
    invoke-static {v1, p0}, Lcom/trueaxis/modmenu/ModDebugLog;->log(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1f8

    .line 124
    :cond_203
    const-string p0, "checkpoint split HUD disabled"

    invoke-static {p0}, Lcom/trueaxis/modmenu/ModDebugLog;->log(Ljava/lang/String;)V

    .line 126
    :goto_208
    const-string p0, "after RequiredPatches.apply"

    invoke-static {p0}, Lcom/trueaxis/modmenu/ModDebugLog;->logRuntime(Ljava/lang/String;)V

    .line 127
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

.method private static seedSwarmSlotReplays(Landroid/app/Activity;)I
    .registers 14

    .line 136
    nop

    .line 137
    invoke-virtual {p0}, Landroid/app/Activity;->getFilesDir()Ljava/io/File;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Landroid/app/Activity;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object p0

    const/4 v1, 0x2

    new-array v2, v1, [Ljava/io/File;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v0, 0x1

    aput-object p0, v2, v0

    .line 138
    const/4 p0, 0x0

    const/4 v0, 0x0

    :goto_15
    if-ge p0, v1, :cond_5b

    aget-object v4, v2, p0

    .line 139
    if-nez v4, :cond_1c

    .line 140
    goto :goto_58

    .line 142
    :cond_1c
    invoke-virtual {v4}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v4

    .line 143
    if-nez v4, :cond_23

    .line 144
    goto :goto_58

    .line 146
    :cond_23
    array-length v5, v4

    const/4 v6, 0x0

    :goto_25
    if-ge v6, v5, :cond_58

    aget-object v7, v4, v6

    .line 147
    invoke-virtual {v7}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v8

    .line 148
    invoke-virtual {v7}, Ljava/io/File;->isFile()Z

    move-result v9

    if-eqz v9, :cond_55

    invoke-virtual {v7}, Ljava/io/File;->length()J

    move-result-wide v9

    const-wide/16 v11, 0x40

    cmp-long v7, v9, v11

    if-lez v7, :cond_55

    const-string v7, "r\\d\\d\\.bin"

    invoke-virtual {v8, v7}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_55

    .line 149
    nop

    .line 150
    const-string v7, "UTF-8"

    invoke-static {v7}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v7

    invoke-virtual {v8, v7}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v7

    .line 149
    invoke-static {v7}, Lcom/trueaxis/modmenu/RequiredPatches;->addReplaySwarmCatalogPath([B)V

    .line 151
    add-int/lit8 v0, v0, 0x1

    .line 146
    :cond_55
    add-int/lit8 v6, v6, 0x1

    goto :goto_25

    .line 138
    :cond_58
    :goto_58
    add-int/lit8 p0, p0, 0x1

    goto :goto_15

    .line 155
    :cond_5b
    return v0
.end method

.method static native setReplayCameraCycle(ZI)V
.end method

.method static native setReplayCameraMode(I)V
.end method

.method static native setReplayFreeCameraEnabled(Z)V
.end method

.method static native setReplayFreeCameraLocked(Z)V
.end method

.method static native setReplayOrbitTuning(III)V
.end method

.method static native setReplayRaceSwarmEnabled(Z)V
.end method

.method static native setReplaySwarmEnabled(Z)V
.end method

.method static native setReplaySwarmSelection(I[I)V
.end method

.method static native setReplayTracksideTuning(IIIII)V
.end method
