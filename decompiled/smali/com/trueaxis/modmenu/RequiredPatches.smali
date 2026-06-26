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
    .registers 6

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

    .line 50
    :goto_82
    const-string v1, "replay visual marker disabled; replay data is not modified"

    invoke-static {v1}, Lcom/trueaxis/modmenu/ModDebugLog;->log(Ljava/lang/String;)V

    .line 51
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->checkpointSplitsEnabled(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_a0

    .line 52
    const-string v1, "checkpoint split HUD enabled"

    invoke-static {v1}, Lcom/trueaxis/modmenu/ModDebugLog;->log(Ljava/lang/String;)V

    .line 54
    :try_start_92
    invoke-static {p0}, Lcom/trueaxis/modmenu/SplitTimeHud;->install(Landroid/app/Activity;)V
    :try_end_95
    .catchall {:try_start_92 .. :try_end_95} :catchall_96

    .line 58
    :goto_95
    goto :goto_a5

    .line 55
    :catchall_96
    move-exception p0

    .line 56
    const-string v1, "Could not install checkpoint split HUD"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 57
    invoke-static {v1, p0}, Lcom/trueaxis/modmenu/ModDebugLog;->log(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_95

    .line 60
    :cond_a0
    const-string p0, "checkpoint split HUD disabled"

    invoke-static {p0}, Lcom/trueaxis/modmenu/ModDebugLog;->log(Ljava/lang/String;)V

    .line 62
    :goto_a5
    const-string p0, "after RequiredPatches.apply"

    invoke-static {p0}, Lcom/trueaxis/modmenu/ModDebugLog;->logRuntime(Ljava/lang/String;)V

    .line 63
    return-void
.end method

.method private static native applyUnlimitedCheckpoints()Z
.end method

.method private static native installNativeCrashLogger()Z
.end method

.method static native readGhostCheckpointMillis(I)I
.end method

.method static native readLatestCheckpointCurrentMillis()I
.end method

.method static native readLatestCheckpointGhostMillis()I
.end method

.method static native readLatestCheckpointSplit()J
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
