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

    if-eqz v1, :cond_1eb

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
    invoke-static {p0}, Lcom/trueaxis/modmenu/RequiredPatches;->archiveNewSlotReplays(Landroid/content/Context;)I

    .line 97
    invoke-static {p0}, Lcom/trueaxis/modmenu/RequiredPatches;->seedSwarmSlotReplays(Landroid/app/Activity;)I

    move-result v2

    .line 98
    invoke-static {p0}, Lcom/trueaxis/modmenu/RequiredPatches;->applyGhostPack(Landroid/content/Context;)V

    .line 99
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

    .line 103
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readReplaySwarmCatalogCount()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 99
    invoke-static {v2}, Lcom/trueaxis/modmenu/ModDebugLog;->log(Ljava/lang/String;)V

    .line 104
    if-eqz v1, :cond_1ea

    .line 105
    invoke-static {p0}, Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->install(Landroid/app/Activity;)V
    :try_end_1e0
    .catchall {:try_start_160 .. :try_end_1e0} :catchall_1e1

    goto :goto_1ea

    .line 107
    :catchall_1e1
    move-exception v1

    .line 108
    const-string v2, "Could not install replay swarm mode"

    invoke-static {v0, v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 109
    invoke-static {v2, v1}, Lcom/trueaxis/modmenu/ModDebugLog;->log(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 110
    :cond_1ea
    :goto_1ea
    goto :goto_1f0

    .line 113
    :cond_1eb
    :try_start_1eb
    invoke-static {v2}, Lcom/trueaxis/modmenu/RequiredPatches;->setReplaySwarmEnabled(Z)V
    :try_end_1ee
    .catchall {:try_start_1eb .. :try_end_1ee} :catchall_1ef

    .line 115
    goto :goto_1f0

    .line 114
    :catchall_1ef
    move-exception v1

    .line 117
    :goto_1f0
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->checkpointSplitsEnabled(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_209

    .line 118
    const-string v1, "checkpoint split HUD enabled"

    invoke-static {v1}, Lcom/trueaxis/modmenu/ModDebugLog;->log(Ljava/lang/String;)V

    .line 120
    :try_start_1fb
    invoke-static {p0}, Lcom/trueaxis/modmenu/SplitTimeHud;->install(Landroid/app/Activity;)V
    :try_end_1fe
    .catchall {:try_start_1fb .. :try_end_1fe} :catchall_1ff

    .line 124
    :goto_1fe
    goto :goto_20e

    .line 121
    :catchall_1ff
    move-exception p0

    .line 122
    const-string v1, "Could not install checkpoint split HUD"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 123
    invoke-static {v1, p0}, Lcom/trueaxis/modmenu/ModDebugLog;->log(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1fe

    .line 126
    :cond_209
    const-string p0, "checkpoint split HUD disabled"

    invoke-static {p0}, Lcom/trueaxis/modmenu/ModDebugLog;->log(Ljava/lang/String;)V

    .line 128
    :goto_20e
    const-string p0, "after RequiredPatches.apply"

    invoke-static {p0}, Lcom/trueaxis/modmenu/ModDebugLog;->logRuntime(Ljava/lang/String;)V

    .line 129
    return-void
.end method

.method static applyGhostPack(Landroid/content/Context;)V
    .registers 8

    .line 246
    const-string v0, "swarm"

    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->ghostPackPaths(Landroid/content/Context;)[Ljava/lang/String;

    move-result-object p0

    .line 247
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 248
    array-length v2, p0

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_e
    if-ge v4, v2, :cond_28

    aget-object v5, p0, v4

    .line 249
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v6

    if-nez v6, :cond_19

    .line 250
    goto :goto_25

    .line 252
    :cond_19
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v6

    if-lez v6, :cond_22

    .line 253
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 255
    :cond_22
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 248
    :goto_25
    add-int/lit8 v4, v4, 0x1

    goto :goto_e

    .line 258
    :cond_28
    nop

    .line 259
    :try_start_29
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "UTF-8"

    invoke-static {v2}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v1

    .line 258
    invoke-static {v1}, Lcom/trueaxis/modmenu/RequiredPatches;->setReplaySwarmRacePack([B)V

    .line 260
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ghost pack applied entries="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    array-length p0, p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_51
    .catchall {:try_start_29 .. :try_end_51} :catchall_52

    .line 263
    goto :goto_58

    .line 261
    :catchall_52
    move-exception p0

    .line 262
    const-string v1, "ghost pack apply failed"

    invoke-static {v0, v1, p0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 264
    :goto_58
    return-void
.end method

.method private static native applyUnlimitedCheckpoints()Z
.end method

.method static archiveNewSlotReplays(Landroid/content/Context;)I
    .registers 16

    .line 139
    const/4 v0, 0x0

    if-nez p0, :cond_4

    .line 140
    return v0

    .line 142
    :cond_4
    nop

    .line 143
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object p0

    const/4 v2, 0x2

    new-array v3, v2, [Ljava/io/File;

    aput-object v1, v3, v0

    const/4 v1, 0x1

    aput-object p0, v3, v1

    .line 144
    const/4 p0, 0x0

    const/4 v1, 0x0

    :goto_18
    if-ge p0, v2, :cond_a8

    aget-object v4, v3, p0

    .line 145
    if-nez v4, :cond_20

    .line 146
    goto/16 :goto_a4

    .line 148
    :cond_20
    invoke-virtual {v4}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v5

    .line 149
    if-nez v5, :cond_28

    .line 150
    goto/16 :goto_a4

    .line 152
    :cond_28
    new-instance v6, Ljava/io/File;

    const-string v7, "swarm_replays"

    invoke-direct {v6, v4, v7}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 153
    array-length v4, v5

    const/4 v7, 0x0

    :goto_31
    if-ge v7, v4, :cond_9f

    aget-object v8, v5, v7

    .line 154
    invoke-virtual {v8}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v9

    .line 155
    invoke-virtual {v8}, Ljava/io/File;->isFile()Z

    move-result v10

    if-eqz v10, :cond_9c

    invoke-virtual {v8}, Ljava/io/File;->length()J

    move-result-wide v10

    const-wide/16 v12, 0x40

    cmp-long v14, v10, v12

    if-lez v14, :cond_9c

    const-string v10, "r\\d\\d\\.bin"

    invoke-virtual {v9, v10}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v10

    if-nez v10, :cond_52

    .line 156
    goto :goto_9c

    .line 158
    :cond_52
    invoke-virtual {v6}, Ljava/io/File;->isDirectory()Z

    move-result v10

    if-nez v10, :cond_5f

    invoke-virtual {v6}, Ljava/io/File;->mkdirs()Z

    move-result v10

    if-nez v10, :cond_5f

    .line 159
    goto :goto_9c

    .line 161
    :cond_5f
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v11, 0x3

    invoke-virtual {v9, v0, v11}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "-"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    .line 162
    invoke-virtual {v8}, Ljava/io/File;->lastModified()J

    move-result-wide v10

    const-wide/16 v12, 0x3e8

    div-long/2addr v10, v12

    invoke-virtual {v9, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ".bin"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 163
    new-instance v10, Ljava/io/File;

    invoke-direct {v10, v6, v9}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 164
    invoke-virtual {v10}, Ljava/io/File;->isFile()Z

    move-result v9

    if-eqz v9, :cond_94

    .line 165
    goto :goto_9c

    .line 167
    :cond_94
    invoke-static {v8, v10}, Lcom/trueaxis/modmenu/RequiredPatches;->copyFile(Ljava/io/File;Ljava/io/File;)Z

    move-result v8

    if-eqz v8, :cond_9c

    .line 168
    add-int/lit8 v1, v1, 0x1

    .line 153
    :cond_9c
    :goto_9c
    add-int/lit8 v7, v7, 0x1

    goto :goto_31

    .line 171
    :cond_9f
    const/16 v4, 0x18

    invoke-static {v6, v4}, Lcom/trueaxis/modmenu/RequiredPatches;->pruneLibrary(Ljava/io/File;I)V

    .line 144
    :goto_a4
    add-int/lit8 p0, p0, 0x1

    goto/16 :goto_18

    .line 173
    :cond_a8
    if-lez v1, :cond_c8

    .line 174
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "archived "

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, " new slot replays"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "swarm"

    invoke-static {v0, p0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 176
    :cond_c8
    return v1
.end method

.method static native clearReplaySwarm()V
.end method

.method private static copyFile(Ljava/io/File;Ljava/io/File;)Z
    .registers 10

    .line 180
    nop

    .line 181
    nop

    .line 183
    const/4 v0, 0x0

    const/4 v1, 0x0

    :try_start_4
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_9
    .catchall {:try_start_4 .. :try_end_9} :catchall_30

    .line 184
    :try_start_9
    new-instance v3, Ljava/io/FileOutputStream;

    invoke-direct {v3, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_e
    .catchall {:try_start_9 .. :try_end_e} :catchall_2b

    .line 185
    const/high16 v1, 0x10000

    :try_start_10
    new-array v1, v1, [B

    .line 187
    :goto_12
    invoke-virtual {v2, v1}, Ljava/io/FileInputStream;->read([B)I

    move-result v4

    if-lez v4, :cond_1c

    .line 188
    invoke-virtual {v3, v1, v0, v4}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_1b
    .catchall {:try_start_10 .. :try_end_1b} :catchall_29

    goto :goto_12

    .line 190
    :cond_1c
    nop

    .line 196
    :try_start_1d
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V
    :try_end_20
    .catchall {:try_start_1d .. :try_end_20} :catchall_21

    goto :goto_22

    :catchall_21
    move-exception p0

    .line 197
    :goto_22
    :try_start_22
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V
    :try_end_25
    .catchall {:try_start_22 .. :try_end_25} :catchall_26

    goto :goto_27

    :catchall_26
    move-exception p0

    .line 190
    :goto_27
    const/4 p0, 0x1

    return p0

    .line 191
    :catchall_29
    move-exception v1

    goto :goto_34

    :catchall_2b
    move-exception v3

    move-object v7, v3

    move-object v3, v1

    move-object v1, v7

    goto :goto_34

    :catchall_30
    move-exception v2

    move-object v3, v1

    move-object v1, v2

    move-object v2, v3

    .line 192
    :goto_34
    :try_start_34
    const-string v4, "swarm"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "archive copy failed "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v4, p0, v1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 193
    invoke-virtual {p1}, Ljava/io/File;->delete()Z
    :try_end_4f
    .catchall {:try_start_34 .. :try_end_4f} :catchall_5f

    .line 194
    nop

    .line 196
    if-eqz v2, :cond_57

    :try_start_52
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V
    :try_end_55
    .catchall {:try_start_52 .. :try_end_55} :catchall_56

    goto :goto_57

    :catchall_56
    move-exception p0

    .line 197
    :cond_57
    :goto_57
    if-eqz v3, :cond_5e

    :try_start_59
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V
    :try_end_5c
    .catchall {:try_start_59 .. :try_end_5c} :catchall_5d

    goto :goto_5e

    :catchall_5d
    move-exception p0

    .line 194
    :cond_5e
    :goto_5e
    return v0

    .line 196
    :catchall_5f
    move-exception p0

    if-eqz v2, :cond_67

    :try_start_62
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V
    :try_end_65
    .catchall {:try_start_62 .. :try_end_65} :catchall_66

    goto :goto_67

    :catchall_66
    move-exception p1

    .line 197
    :cond_67
    :goto_67
    if-eqz v3, :cond_6e

    :try_start_69
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V
    :try_end_6c
    .catchall {:try_start_69 .. :try_end_6c} :catchall_6d

    goto :goto_6e

    :catchall_6d
    move-exception p1

    .line 198
    :cond_6e
    :goto_6e
    goto :goto_70

    :goto_6f
    throw p0

    :goto_70
    goto :goto_6f
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

.method private static pruneLibrary(Ljava/io/File;I)V
    .registers 3

    .line 202
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object p0

    .line 203
    if-eqz p0, :cond_1f

    array-length v0, p0

    if-gt v0, p1, :cond_a

    goto :goto_1f

    .line 206
    :cond_a
    new-instance v0, Lcom/trueaxis/modmenu/RequiredPatches$1;

    invoke-direct {v0}, Lcom/trueaxis/modmenu/RequiredPatches$1;-><init>()V

    invoke-static {p0, v0}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 212
    nop

    :goto_13
    array-length v0, p0

    if-ge p1, v0, :cond_1e

    .line 213
    aget-object v0, p0, p1

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 212
    add-int/lit8 p1, p1, 0x1

    goto :goto_13

    .line 215
    :cond_1e
    return-void

    .line 204
    :cond_1f
    :goto_1f
    return-void
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
    .registers 16

    .line 273
    const/4 v0, 0x0

    if-nez p0, :cond_4

    .line 274
    return v0

    .line 276
    :cond_4
    nop

    .line 277
    invoke-virtual {p0}, Landroid/app/Activity;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Landroid/app/Activity;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object p0

    const/4 v2, 0x2

    new-array v3, v2, [Ljava/io/File;

    aput-object v1, v3, v0

    const/4 v1, 0x1

    aput-object p0, v3, v1

    .line 278
    const/4 p0, 0x0

    const/4 v1, 0x0

    :goto_18
    if-ge p0, v2, :cond_b5

    aget-object v4, v3, p0

    .line 279
    if-nez v4, :cond_20

    .line 280
    goto/16 :goto_b1

    .line 282
    :cond_20
    invoke-virtual {v4}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v5

    .line 283
    if-nez v5, :cond_28

    .line 284
    goto/16 :goto_b1

    .line 286
    :cond_28
    array-length v6, v5

    const/4 v7, 0x0

    :goto_2a
    const-string v8, "UTF-8"

    const-wide/16 v9, 0x40

    if-ge v7, v6, :cond_5d

    aget-object v11, v5, v7

    .line 287
    invoke-virtual {v11}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v12

    .line 288
    invoke-virtual {v11}, Ljava/io/File;->isFile()Z

    move-result v13

    if-eqz v13, :cond_5a

    invoke-virtual {v11}, Ljava/io/File;->length()J

    move-result-wide v13

    cmp-long v11, v13, v9

    if-lez v11, :cond_5a

    const-string v9, "r\\d\\d\\.bin"

    invoke-virtual {v12, v9}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_5a

    .line 289
    nop

    .line 290
    invoke-static {v8}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v8

    invoke-virtual {v12, v8}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v8

    .line 289
    invoke-static {v8}, Lcom/trueaxis/modmenu/RequiredPatches;->addReplaySwarmCatalogPath([B)V

    .line 291
    add-int/lit8 v1, v1, 0x1

    .line 286
    :cond_5a
    add-int/lit8 v7, v7, 0x1

    goto :goto_2a

    .line 295
    :cond_5d
    new-instance v5, Ljava/io/File;

    const-string v6, "swarm_replays"

    invoke-direct {v5, v4, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v4

    .line 296
    if-eqz v4, :cond_b1

    .line 297
    array-length v5, v4

    const/4 v6, 0x0

    :goto_6c
    if-ge v6, v5, :cond_b1

    aget-object v7, v4, v6

    .line 298
    invoke-virtual {v7}, Ljava/io/File;->isFile()Z

    move-result v11

    if-eqz v11, :cond_ae

    invoke-virtual {v7}, Ljava/io/File;->length()J

    move-result-wide v11

    cmp-long v13, v11, v9

    if-lez v13, :cond_ae

    invoke-virtual {v7}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v11

    const-string v12, ".bin"

    invoke-virtual {v11, v12}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_ae

    .line 299
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "swarm_replays/"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v7}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 300
    invoke-static {v8}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v11

    invoke-virtual {v7, v11}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v7

    .line 299
    invoke-static {v7}, Lcom/trueaxis/modmenu/RequiredPatches;->addReplaySwarmCatalogPath([B)V

    .line 301
    add-int/lit8 v1, v1, 0x1

    .line 297
    :cond_ae
    add-int/lit8 v6, v6, 0x1

    goto :goto_6c

    .line 278
    :cond_b1
    :goto_b1
    add-int/lit8 p0, p0, 0x1

    goto/16 :goto_18

    .line 306
    :cond_b5
    return v1
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

.method static native setReplaySwarmRacePack([B)V
.end method

.method static native setReplaySwarmSelection(I[I)V
.end method

.method static native setReplayTracksideTuning(IIIII)V
.end method

.method static swarmLibraryFiles(Landroid/content/Context;)Ljava/util/List;
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    .line 219
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 220
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object p0

    const/4 v2, 0x2

    new-array v3, v2, [Ljava/io/File;

    const/4 v4, 0x0

    aput-object v1, v3, v4

    const/4 v1, 0x1

    aput-object p0, v3, v1

    .line 221
    const/4 p0, 0x0

    :goto_18
    if-ge p0, v2, :cond_4e

    aget-object v1, v3, p0

    .line 222
    if-nez v1, :cond_1f

    .line 223
    goto :goto_4b

    .line 225
    :cond_1f
    new-instance v5, Ljava/io/File;

    const-string v6, "swarm_replays"

    invoke-direct {v5, v1, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v1

    .line 226
    if-nez v1, :cond_2d

    .line 227
    goto :goto_4b

    .line 229
    :cond_2d
    array-length v5, v1

    const/4 v6, 0x0

    :goto_2f
    if-ge v6, v5, :cond_4b

    aget-object v7, v1, v6

    .line 230
    invoke-virtual {v7}, Ljava/io/File;->isFile()Z

    move-result v8

    if-eqz v8, :cond_48

    invoke-virtual {v7}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v8

    const-string v9, ".bin"

    invoke-virtual {v8, v9}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_48

    .line 231
    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 229
    :cond_48
    add-int/lit8 v6, v6, 0x1

    goto :goto_2f

    .line 221
    :cond_4b
    :goto_4b
    add-int/lit8 p0, p0, 0x1

    goto :goto_18

    .line 235
    :cond_4e
    new-instance p0, Lcom/trueaxis/modmenu/RequiredPatches$2;

    invoke-direct {p0}, Lcom/trueaxis/modmenu/RequiredPatches$2;-><init>()V

    invoke-static {v0, p0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 241
    return-object v0
.end method
