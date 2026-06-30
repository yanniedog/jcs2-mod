.class final Lcom/trueaxis/modmenu/ModDebugLog;
.super Ljava/lang/Object;
.source "ModDebugLog.java"


# static fields
.field private static final FILE_NAME:Ljava/lang/String; = "ycs2_mod_debug.log"

.field private static final LOCK:Ljava/lang/Object;

.field private static final LOG_STORAGE_PERMISSION_REQUEST:I = 0x106a

.field private static final NATIVE_FILE_NAME:Ljava/lang/String; = "ycs2_mod_native_crash.log"

.field private static final PUBLIC_DIR:Ljava/lang/String; = "YCS2CommunityMod/logs"

.field private static final TAG:Ljava/lang/String; = "YCS2Mod"

.field private static final WRITE_EXTERNAL_STORAGE:Ljava/lang/String; = "android.permission.WRITE_EXTERNAL_STORAGE"

.field private static componentCallbacksInstalled:Z

.field private static fallbackFile:Ljava/io/File;

.field private static file:Ljava/io/File;

.field private static installed:Z

.field private static lifecycleInstalled:Z

.field private static logDir:Ljava/io/File;

.field private static nativeFile:Ljava/io/File;

.field private static publicLogDir:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 39
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/trueaxis/modmenu/ModDebugLog;->LOCK:Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    return-void
.end method

.method private static appendFileSection(Ljava/lang/StringBuilder;Ljava/io/File;Ljava/lang/String;)V
    .registers 10

    .line 199
    const-string v0, "\n--- "

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ---\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 200
    if-nez p1, :cond_17

    .line 201
    const-string p1, "(unavailable)\n"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 202
    return-void

    .line 204
    :cond_17
    invoke-virtual {p1}, Ljava/io/File;->isFile()Z

    move-result v0

    const-string v1, ")\n"

    if-nez v0, :cond_31

    .line 205
    const-string p2, "(missing: "

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 206
    return-void

    .line 208
    :cond_31
    nop

    .line 210
    const/4 v0, 0x0

    :try_start_33
    new-instance v2, Ljava/io/BufferedReader;

    new-instance v3, Ljava/io/InputStreamReader;

    new-instance v4, Ljava/io/FileInputStream;

    invoke-direct {v4, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    const-string v5, "UTF-8"

    invoke-direct {v3, v4, v5}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v2, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_44
    .catchall {:try_start_33 .. :try_end_44} :catchall_5c

    .line 212
    const/16 v0, 0x1000

    :try_start_46
    new-array v0, v0, [C

    .line 214
    :goto_48
    invoke-virtual {v2, v0}, Ljava/io/BufferedReader;->read([C)I

    move-result v3

    if-ltz v3, :cond_53

    .line 215
    const/4 v4, 0x0

    invoke-virtual {p0, v0, v4, v3}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;
    :try_end_52
    .catchall {:try_start_46 .. :try_end_52} :catchall_5a

    goto :goto_48

    .line 222
    :cond_53
    nop

    .line 224
    :try_start_54
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_57
    .catchall {:try_start_54 .. :try_end_57} :catchall_58

    .line 226
    :goto_57
    goto :goto_a1

    .line 225
    :catchall_58
    move-exception p0

    goto :goto_57

    .line 217
    :catchall_5a
    move-exception v0

    goto :goto_60

    :catchall_5c
    move-exception v2

    move-object v6, v2

    move-object v2, v0

    move-object v0, v6

    .line 218
    :goto_60
    :try_start_60
    const-string v3, "(read failed: "

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v3, " path="

    .line 219
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 220
    const-string p0, "YCS2Mod"

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Could not read mod debug log section "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_9b
    .catchall {:try_start_60 .. :try_end_9b} :catchall_a2

    .line 222
    if-eqz v2, :cond_a1

    .line 224
    :try_start_9d
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_a0
    .catchall {:try_start_9d .. :try_end_a0} :catchall_58

    goto :goto_57

    .line 229
    :cond_a1
    :goto_a1
    return-void

    .line 222
    :catchall_a2
    move-exception p0

    if-eqz v2, :cond_aa

    .line 224
    :try_start_a5
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_a8
    .catchall {:try_start_a5 .. :try_end_a8} :catchall_a9

    .line 226
    goto :goto_aa

    .line 225
    :catchall_a9
    move-exception p1

    .line 228
    :cond_aa
    :goto_aa
    goto :goto_ac

    :goto_ab
    throw p0

    :goto_ac
    goto :goto_ab
.end method

.method private static chooseLogDirectory(Landroid/content/Context;Landroid/content/Context;Ljava/io/File;)Ljava/io/File;
    .registers 9

    .line 280
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object p0

    .line 281
    nop

    .line 282
    const-string v0, "YCS2CommunityMod/logs"

    const/4 v1, 0x0

    if-nez p0, :cond_c

    move-object v2, v1

    goto :goto_11

    :cond_c
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p0, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    :goto_11
    new-instance p0, Ljava/io/File;

    const-string v3, "/storage/emulated/0/YCS2CommunityMod/logs"

    invoke-direct {p0, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    new-instance v3, Ljava/io/File;

    const-string v4, "/sdcard/YCS2CommunityMod/logs"

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    new-instance v4, Ljava/io/File;

    sget-object v5, Landroid/os/Environment;->DIRECTORY_DOWNLOADS:Ljava/lang/String;

    .line 285
    invoke-static {v5}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v5

    invoke-direct {v4, v5, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 287
    invoke-virtual {p1, v1}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    if-nez v0, :cond_31

    .line 288
    goto :goto_3d

    :cond_31
    new-instance v0, Ljava/io/File;

    invoke-virtual {p1, v1}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object p1

    const-string v1, "logs"

    invoke-direct {v0, p1, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    move-object v1, v0

    :goto_3d
    const/4 p1, 0x6

    new-array v0, p1, [Ljava/io/File;

    const/4 v5, 0x0

    aput-object v2, v0, v5

    const/4 v2, 0x1

    aput-object p0, v0, v2

    const/4 p0, 0x2

    aput-object v3, v0, p0

    const/4 p0, 0x3

    aput-object v4, v0, p0

    const/4 p0, 0x4

    aput-object v1, v0, p0

    const/4 p0, 0x5

    aput-object p2, v0, p0

    .line 291
    nop

    :goto_53
    if-ge v5, p1, :cond_a1

    .line 292
    aget-object p0, v0, v5

    .line 293
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModDebugLog;->isWritableDirectory(Ljava/io/File;)Z

    move-result v1

    const-string v2, " path="

    const-string v3, "YCS2Mod"

    if-eqz v1, :cond_80

    .line 294
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "debug log directory selected index="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v3, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 295
    return-object p0

    .line 297
    :cond_80
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "debug log directory unavailable index="

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v3, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 291
    add-int/lit8 v5, v5, 0x1

    goto :goto_53

    .line 299
    :cond_a1
    invoke-static {p2}, Lcom/trueaxis/modmenu/ModDebugLog;->ensureDirectory(Ljava/io/File;)Z

    .line 300
    return-object p2
.end method

.method private static copyPreviousLog(Ljava/io/File;Ljava/io/File;)V
    .registers 9

    .line 386
    if-eqz p0, :cond_b5

    if-eqz p1, :cond_b5

    invoke-virtual {p0, p1}, Ljava/io/File;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_b5

    invoke-virtual {p0}, Ljava/io/File;->isFile()Z

    move-result v0

    if-nez v0, :cond_12

    goto/16 :goto_b5

    .line 387
    :cond_12
    nop

    .line 388
    nop

    .line 390
    const/4 v0, 0x0

    :try_start_15
    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v1

    invoke-static {v1}, Lcom/trueaxis/modmenu/ModDebugLog;->ensureDirectory(Ljava/io/File;)Z

    .line 391
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_21
    .catchall {:try_start_15 .. :try_end_21} :catchall_4b

    .line 392
    :try_start_21
    new-instance v2, Ljava/io/FileOutputStream;

    const/4 v3, 0x1

    invoke-direct {v2, p1, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V
    :try_end_27
    .catchall {:try_start_21 .. :try_end_27} :catchall_46

    .line 393
    const/16 v0, 0x1000

    :try_start_29
    new-array v0, v0, [B

    .line 395
    :goto_2b
    invoke-virtual {v1, v0}, Ljava/io/InputStream;->read([B)I

    move-result v3

    if-lez v3, :cond_36

    .line 396
    const/4 v4, 0x0

    invoke-virtual {v2, v0, v4, v3}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_2b

    .line 398
    :cond_36
    invoke-virtual {v2}, Ljava/io/OutputStream;->flush()V
    :try_end_39
    .catchall {:try_start_29 .. :try_end_39} :catchall_44

    .line 405
    :try_start_39
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_3c
    .catchall {:try_start_39 .. :try_end_3c} :catchall_3d

    .line 407
    goto :goto_3e

    .line 406
    :catchall_3d
    move-exception p0

    .line 409
    :goto_3e
    :try_start_3e
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    :try_end_41
    .catchall {:try_start_3e .. :try_end_41} :catchall_42

    .line 411
    :cond_41
    :goto_41
    goto :goto_a0

    .line 410
    :catchall_42
    move-exception p0

    .line 412
    goto :goto_a0

    .line 399
    :catchall_44
    move-exception v0

    goto :goto_4f

    :catchall_46
    move-exception v2

    move-object v6, v2

    move-object v2, v0

    move-object v0, v6

    goto :goto_4f

    :catchall_4b
    move-exception v1

    move-object v2, v0

    move-object v0, v1

    move-object v1, v2

    .line 400
    :goto_4f
    :try_start_4f
    const-string v3, "YCS2Mod"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Could not copy previous mod debug log from "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " to "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 401
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Could not copy previous mod debug log source="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v3, " target="

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, v0}, Lcom/trueaxis/modmenu/ModDebugLog;->writeFallback(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_91
    .catchall {:try_start_4f .. :try_end_91} :catchall_a1

    .line 405
    if-eqz v1, :cond_99

    :try_start_93
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_96
    .catchall {:try_start_93 .. :try_end_96} :catchall_97

    goto :goto_99

    .line 406
    :catchall_97
    move-exception p0

    goto :goto_9a

    .line 407
    :cond_99
    :goto_99
    nop

    .line 409
    :goto_9a
    if-eqz v2, :cond_41

    :try_start_9c
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    :try_end_9f
    .catchall {:try_start_9c .. :try_end_9f} :catchall_42

    goto :goto_41

    .line 413
    :goto_a0
    return-void

    .line 404
    :catchall_a1
    move-exception p0

    .line 405
    if-eqz v1, :cond_aa

    :try_start_a4
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_a7
    .catchall {:try_start_a4 .. :try_end_a7} :catchall_a8

    goto :goto_aa

    .line 406
    :catchall_a8
    move-exception p1

    goto :goto_ab

    .line 407
    :cond_aa
    :goto_aa
    nop

    .line 409
    :goto_ab
    if-eqz v2, :cond_b3

    :try_start_ad
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    :try_end_b0
    .catchall {:try_start_ad .. :try_end_b0} :catchall_b1

    goto :goto_b3

    .line 410
    :catchall_b1
    move-exception p1

    goto :goto_b4

    .line 411
    :cond_b3
    :goto_b3
    nop

    .line 412
    :goto_b4
    throw p0

    .line 386
    :cond_b5
    :goto_b5
    return-void
.end method

.method private static ensureDirectory(Ljava/io/File;)Z
    .registers 2

    .line 359
    if-eqz p0, :cond_16

    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-nez v0, :cond_14

    invoke-virtual {p0}, Ljava/io/File;->mkdirs()Z

    move-result v0

    if-nez v0, :cond_14

    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result p0

    if-eqz p0, :cond_16

    :cond_14
    const/4 p0, 0x1

    goto :goto_17

    :cond_16
    const/4 p0, 0x0

    :goto_17
    return p0
.end method

.method static file()Ljava/io/File;
    .registers 1

    .line 175
    sget-object v0, Lcom/trueaxis/modmenu/ModDebugLog;->file:Ljava/io/File;

    return-object v0
.end method

.method static install(Landroid/content/Context;)V
    .registers 6

    .line 54
    sget-object v0, Lcom/trueaxis/modmenu/ModDebugLog;->LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 55
    :try_start_3
    sget-boolean v1, Lcom/trueaxis/modmenu/ModDebugLog;->installed:Z

    if-eqz v1, :cond_1d

    .line 56
    sget-boolean v1, Lcom/trueaxis/modmenu/ModDebugLog;->publicLogDir:Z

    if-nez v1, :cond_18

    const-string v1, "android.permission.WRITE_EXTERNAL_STORAGE"

    invoke-static {p0, v1}, Lcom/trueaxis/modmenu/ModDebugLog;->permissionGranted(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_18

    .line 57
    const-string v1, "install re-entry after storage permission"

    invoke-static {p0, v1}, Lcom/trueaxis/modmenu/ModDebugLog;->refreshStorageTargetLocked(Landroid/content/Context;Ljava/lang/String;)V

    .line 59
    :cond_18
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModDebugLog;->installLifecycleLocked(Landroid/content/Context;)V

    .line 60
    monitor-exit v0

    return-void

    .line 62
    :cond_1d
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    if-eqz v1, :cond_28

    .line 63
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    goto :goto_29

    :cond_28
    move-object v1, p0

    .line 64
    :goto_29
    new-instance v2, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v3

    const-string v4, "logs"

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 65
    invoke-static {v2}, Lcom/trueaxis/modmenu/ModDebugLog;->ensureDirectory(Ljava/io/File;)Z

    .line 66
    new-instance v3, Ljava/io/File;

    const-string v4, "ycs2_mod_debug.log"

    invoke-direct {v3, v2, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    sput-object v3, Lcom/trueaxis/modmenu/ModDebugLog;->fallbackFile:Ljava/io/File;

    .line 67
    invoke-static {p0, v1, v2}, Lcom/trueaxis/modmenu/ModDebugLog;->chooseLogDirectory(Landroid/content/Context;Landroid/content/Context;Ljava/io/File;)Ljava/io/File;

    move-result-object v2

    sput-object v2, Lcom/trueaxis/modmenu/ModDebugLog;->logDir:Ljava/io/File;

    .line 68
    sget-object v2, Lcom/trueaxis/modmenu/ModDebugLog;->logDir:Ljava/io/File;

    invoke-static {v2}, Lcom/trueaxis/modmenu/ModDebugLog;->isPublicSharedLogDir(Ljava/io/File;)Z

    move-result v2

    sput-boolean v2, Lcom/trueaxis/modmenu/ModDebugLog;->publicLogDir:Z

    .line 69
    new-instance v2, Ljava/io/File;

    sget-object v3, Lcom/trueaxis/modmenu/ModDebugLog;->logDir:Ljava/io/File;

    const-string v4, "ycs2_mod_debug.log"

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    sput-object v2, Lcom/trueaxis/modmenu/ModDebugLog;->file:Ljava/io/File;

    .line 70
    new-instance v2, Ljava/io/File;

    sget-object v3, Lcom/trueaxis/modmenu/ModDebugLog;->logDir:Ljava/io/File;

    const-string v4, "ycs2_mod_native_crash.log"

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    sput-object v2, Lcom/trueaxis/modmenu/ModDebugLog;->nativeFile:Ljava/io/File;

    .line 71
    const/4 v2, 0x1

    sput-boolean v2, Lcom/trueaxis/modmenu/ModDebugLog;->installed:Z

    .line 74
    invoke-static {}, Ljava/lang/Thread;->getDefaultUncaughtExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;

    move-result-object v2

    .line 75
    new-instance v3, Lcom/trueaxis/modmenu/ModDebugLog$1;

    invoke-direct {v3, v2}, Lcom/trueaxis/modmenu/ModDebugLog$1;-><init>(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    invoke-static {v3}, Ljava/lang/Thread;->setDefaultUncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    .line 84
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "debug log started path="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lcom/trueaxis/modmenu/ModDebugLog;->file:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " native_path="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lcom/trueaxis/modmenu/ModDebugLog;->nativeFile:Ljava/io/File;

    .line 85
    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " public_shared_log_dir="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-boolean v3, Lcom/trueaxis/modmenu/ModDebugLog;->publicLogDir:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " user_visible_folder_hint=Internal storage/YCS2CommunityMod/logs fallback_path="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lcom/trueaxis/modmenu/ModDebugLog;->fallbackFile:Ljava/io/File;

    .line 88
    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " files_dir="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 89
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " external_files_dir="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 90
    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " writable="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lcom/trueaxis/modmenu/ModDebugLog;->logDir:Ljava/io/File;

    .line 91
    invoke-virtual {v3}, Ljava/io/File;->canWrite()Z

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " usable_bytes="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lcom/trueaxis/modmenu/ModDebugLog;->logDir:Ljava/io/File;

    .line 92
    invoke-virtual {v3}, Ljava/io/File;->getUsableSpace()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " sdk="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " release="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " fingerprint="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Landroid/os/Build;->FINGERPRINT:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " device="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " app="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 97
    invoke-static {v1}, Lcom/trueaxis/modmenu/ModDebugLog;->packageSummary(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " pid="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 98
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " tid="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 99
    invoke-static {}, Landroid/os/Process;->myTid()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " process="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 100
    invoke-static {}, Lcom/trueaxis/modmenu/ModDebugLog;->processName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 84
    invoke-static {v2}, Lcom/trueaxis/modmenu/ModDebugLog;->log(Ljava/lang/String;)V

    .line 101
    const-string v2, "startup"

    invoke-static {v2}, Lcom/trueaxis/modmenu/ModDebugLog;->logRuntime(Ljava/lang/String;)V

    .line 102
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModDebugLog;->logPermissionState(Landroid/content/Context;)V

    .line 103
    invoke-static {v1}, Lcom/trueaxis/modmenu/ModDebugLog;->logHistoricalExitReasons(Landroid/content/Context;)V

    .line 104
    invoke-static {v1}, Lcom/trueaxis/modmenu/ModDebugLog;->installLifecycleLocked(Landroid/content/Context;)V

    .line 105
    invoke-static {v1}, Lcom/trueaxis/modmenu/ModDebugLog;->installComponentCallbacksLocked(Landroid/content/Context;)V

    .line 106
    monitor-exit v0

    .line 107
    return-void

    .line 106
    :catchall_17f
    move-exception p0

    monitor-exit v0
    :try_end_181
    .catchall {:try_start_3 .. :try_end_181} :catchall_17f

    throw p0
.end method

.method private static installComponentCallbacksLocked(Landroid/content/Context;)V
    .registers 2

    .line 474
    sget-boolean v0, Lcom/trueaxis/modmenu/ModDebugLog;->componentCallbacksInstalled:Z

    if-eqz v0, :cond_5

    return-void

    .line 475
    :cond_5
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    .line 476
    instance-of v0, p0, Landroid/app/Application;

    if-nez v0, :cond_e

    return-void

    .line 477
    :cond_e
    const/4 v0, 0x1

    sput-boolean v0, Lcom/trueaxis/modmenu/ModDebugLog;->componentCallbacksInstalled:Z

    .line 478
    check-cast p0, Landroid/app/Application;

    new-instance v0, Lcom/trueaxis/modmenu/ModDebugLog$3;

    invoke-direct {v0}, Lcom/trueaxis/modmenu/ModDebugLog$3;-><init>()V

    invoke-virtual {p0, v0}, Landroid/app/Application;->registerComponentCallbacks(Landroid/content/ComponentCallbacks;)V

    .line 495
    return-void
.end method

.method private static installLifecycleLocked(Landroid/content/Context;)V
    .registers 2

    .line 436
    sget-boolean v0, Lcom/trueaxis/modmenu/ModDebugLog;->lifecycleInstalled:Z

    if-eqz v0, :cond_5

    return-void

    .line 437
    :cond_5
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    .line 438
    instance-of v0, p0, Landroid/app/Application;

    if-nez v0, :cond_e

    return-void

    .line 439
    :cond_e
    const/4 v0, 0x1

    sput-boolean v0, Lcom/trueaxis/modmenu/ModDebugLog;->lifecycleInstalled:Z

    .line 440
    check-cast p0, Landroid/app/Application;

    new-instance v0, Lcom/trueaxis/modmenu/ModDebugLog$2;

    invoke-direct {v0}, Lcom/trueaxis/modmenu/ModDebugLog$2;-><init>()V

    invoke-virtual {p0, v0}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 471
    return-void
.end method

.method private static isPublicSharedLogDir(Ljava/io/File;)Z
    .registers 3

    .line 363
    const/4 v0, 0x0

    if-nez p0, :cond_4

    return v0

    .line 364
    :cond_4
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p0

    .line 365
    const-string v1, "/storage/emulated/0/YCS2CommunityMod/logs"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_20

    .line 366
    const-string v1, "/sdcard/YCS2CommunityMod/logs"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_20

    .line 367
    const-string v1, "/YCS2CommunityMod/logs"

    invoke-virtual {p0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_21

    :cond_20
    const/4 v0, 0x1

    .line 365
    :cond_21
    return v0
.end method

.method private static isWritableDirectory(Ljava/io/File;)Z
    .registers 7

    .line 337
    const-string v0, "YCS2Mod"

    const/4 v1, 0x0

    if-nez p0, :cond_6

    return v1

    .line 339
    :cond_6
    :try_start_6
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModDebugLog;->ensureDirectory(Ljava/io/File;)Z

    move-result v2

    if-eqz v2, :cond_62

    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v2

    if-eqz v2, :cond_62

    invoke-virtual {p0}, Ljava/io/File;->canWrite()Z

    move-result v2

    if-nez v2, :cond_19

    goto :goto_62

    .line 340
    :cond_19
    new-instance v2, Ljava/io/File;

    const-string v3, ".ycs2_mod_log_probe"

    invoke-direct {v2, p0, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_20
    .catchall {:try_start_6 .. :try_end_20} :catchall_63

    .line 341
    nop

    .line 343
    const/4 v3, 0x0

    :try_start_22
    new-instance v4, Ljava/io/PrintWriter;

    new-instance v5, Ljava/io/FileWriter;

    invoke-direct {v5, v2, v1}, Ljava/io/FileWriter;-><init>(Ljava/io/File;Z)V

    invoke-direct {v4, v5}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V
    :try_end_2c
    .catchall {:try_start_22 .. :try_end_2c} :catchall_5b

    .line 344
    :try_start_2c
    const-string v3, "probe"

    invoke-virtual {v4, v3}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V
    :try_end_31
    .catchall {:try_start_2c .. :try_end_31} :catchall_58

    .line 346
    :try_start_31
    invoke-virtual {v4}, Ljava/io/PrintWriter;->close()V

    .line 348
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_56

    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    move-result v3

    if-nez v3, :cond_56

    .line 349
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Could not delete log probe "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 351
    :cond_56
    const/4 p0, 0x1

    return p0

    .line 346
    :catchall_58
    move-exception v2

    move-object v3, v4

    goto :goto_5c

    :catchall_5b
    move-exception v2

    :goto_5c
    if-eqz v3, :cond_61

    invoke-virtual {v3}, Ljava/io/PrintWriter;->close()V

    .line 347
    :cond_61
    throw v2
    :try_end_62
    .catchall {:try_start_31 .. :try_end_62} :catchall_63

    .line 339
    :cond_62
    :goto_62
    return v1

    .line 352
    :catchall_63
    move-exception v2

    .line 353
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "debug log directory probe failed path="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 354
    return v1
.end method

.method static lifecycle(Landroid/app/Activity;Ljava/lang/String;)V
    .registers 4

    .line 118
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " finishing="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 119
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 118
    const-string p1, "lifecycle"

    invoke-static {p1, p0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    return-void
.end method

.method static log(Ljava/lang/String;)V
    .registers 8

    .line 139
    sget-object v0, Lcom/trueaxis/modmenu/ModDebugLog;->LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 140
    :try_start_3
    const-string v1, "YCS2Mod"

    invoke-static {v1, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 141
    sget-object v1, Lcom/trueaxis/modmenu/ModDebugLog;->file:Ljava/io/File;

    if-nez v1, :cond_e

    monitor-exit v0
    :try_end_d
    .catchall {:try_start_3 .. :try_end_d} :catchall_88

    return-void

    .line 142
    :cond_e
    nop

    .line 144
    const/4 v1, 0x0

    :try_start_10
    new-instance v2, Ljava/io/PrintWriter;

    new-instance v3, Ljava/io/FileWriter;

    sget-object v4, Lcom/trueaxis/modmenu/ModDebugLog;->file:Ljava/io/File;

    const/4 v5, 0x1

    invoke-direct {v3, v4, v5}, Ljava/io/FileWriter;-><init>(Ljava/io/File;Z)V

    invoke-direct {v2, v3}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V
    :try_end_1d
    .catchall {:try_start_10 .. :try_end_1d} :catchall_3c

    .line 145
    :try_start_1d
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/trueaxis/modmenu/ModDebugLog;->prefix()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V
    :try_end_35
    .catchall {:try_start_1d .. :try_end_35} :catchall_3a

    .line 150
    nop

    :goto_36
    :try_start_36
    invoke-virtual {v2}, Ljava/io/PrintWriter;->close()V
    :try_end_39
    .catchall {:try_start_36 .. :try_end_39} :catchall_88

    goto :goto_7f

    .line 146
    :catchall_3a
    move-exception v1

    goto :goto_40

    :catchall_3c
    move-exception v2

    move-object v6, v2

    move-object v2, v1

    move-object v1, v6

    .line 147
    :goto_40
    :try_start_40
    const-string v3, "YCS2Mod"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Could not write mod debug log to "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Lcom/trueaxis/modmenu/ModDebugLog;->file:Ljava/io/File;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 148
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "LOG WRITE FAILURE target="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Lcom/trueaxis/modmenu/ModDebugLog;->file:Ljava/io/File;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " message="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, v1}, Lcom/trueaxis/modmenu/ModDebugLog;->writeFallback(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_7c
    .catchall {:try_start_40 .. :try_end_7c} :catchall_81

    .line 150
    if-eqz v2, :cond_7f

    goto :goto_36

    .line 152
    :cond_7f
    :goto_7f
    :try_start_7f
    monitor-exit v0

    .line 153
    return-void

    .line 150
    :catchall_81
    move-exception p0

    if-eqz v2, :cond_87

    invoke-virtual {v2}, Ljava/io/PrintWriter;->close()V

    .line 151
    :cond_87
    throw p0

    .line 152
    :catchall_88
    move-exception p0

    monitor-exit v0
    :try_end_8a
    .catchall {:try_start_7f .. :try_end_8a} :catchall_88

    goto :goto_8c

    :goto_8b
    throw p0

    :goto_8c
    goto :goto_8b
.end method

.method static log(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 9

    .line 156
    sget-object v0, Lcom/trueaxis/modmenu/ModDebugLog;->LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 157
    :try_start_3
    const-string v1, "YCS2Mod"

    invoke-static {v1, p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 158
    sget-object v1, Lcom/trueaxis/modmenu/ModDebugLog;->file:Ljava/io/File;

    if-nez v1, :cond_e

    monitor-exit v0
    :try_end_d
    .catchall {:try_start_3 .. :try_end_d} :catchall_8e

    return-void

    .line 159
    :cond_e
    nop

    .line 161
    const/4 v1, 0x0

    :try_start_10
    new-instance v2, Ljava/io/PrintWriter;

    new-instance v3, Ljava/io/FileWriter;

    sget-object v4, Lcom/trueaxis/modmenu/ModDebugLog;->file:Ljava/io/File;

    const/4 v5, 0x1

    invoke-direct {v3, v4, v5}, Ljava/io/FileWriter;-><init>(Ljava/io/File;Z)V

    invoke-direct {v2, v3}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V
    :try_end_1d
    .catchall {:try_start_10 .. :try_end_1d} :catchall_3f

    .line 162
    :try_start_1d
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/trueaxis/modmenu/ModDebugLog;->prefix()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 163
    invoke-virtual {p1, v2}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V
    :try_end_38
    .catchall {:try_start_1d .. :try_end_38} :catchall_3d

    .line 169
    nop

    :goto_39
    :try_start_39
    invoke-virtual {v2}, Ljava/io/PrintWriter;->close()V
    :try_end_3c
    .catchall {:try_start_39 .. :try_end_3c} :catchall_8e

    goto :goto_85

    .line 164
    :catchall_3d
    move-exception v1

    goto :goto_43

    :catchall_3f
    move-exception v2

    move-object v6, v2

    move-object v2, v1

    move-object v1, v6

    .line 165
    :goto_43
    :try_start_43
    const-string v3, "YCS2Mod"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Could not write mod debug log to "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Lcom/trueaxis/modmenu/ModDebugLog;->file:Ljava/io/File;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 166
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "LOG WRITE FAILURE target="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Lcom/trueaxis/modmenu/ModDebugLog;->file:Ljava/io/File;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " message="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v1}, Lcom/trueaxis/modmenu/ModDebugLog;->writeFallback(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 167
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/ModDebugLog;->writeFallback(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_82
    .catchall {:try_start_43 .. :try_end_82} :catchall_87

    .line 169
    if-eqz v2, :cond_85

    goto :goto_39

    .line 171
    :cond_85
    :goto_85
    :try_start_85
    monitor-exit v0

    .line 172
    return-void

    .line 169
    :catchall_87
    move-exception p0

    if-eqz v2, :cond_8d

    invoke-virtual {v2}, Ljava/io/PrintWriter;->close()V

    .line 170
    :cond_8d
    throw p0

    .line 171
    :catchall_8e
    move-exception p0

    monitor-exit v0
    :try_end_90
    .catchall {:try_start_85 .. :try_end_90} :catchall_8e

    goto :goto_92

    :goto_91
    throw p0

    :goto_92
    goto :goto_91
.end method

.method private static logHistoricalExitReasons(Landroid/content/Context;)V
    .registers 10

    .line 498
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    if-ge v0, v1, :cond_1f

    .line 499
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "process exit history unavailable sdk="

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/trueaxis/modmenu/ModDebugLog;->log(Ljava/lang/String;)V

    .line 500
    return-void

    .line 503
    :cond_1f
    :try_start_1f
    const-string v0, "activity"

    .line 504
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    .line 505
    if-nez v0, :cond_2f

    .line 506
    const-string p0, "process exit history unavailable; activity manager null"

    invoke-static {p0}, Lcom/trueaxis/modmenu/ModDebugLog;->log(Ljava/lang/String;)V

    .line 507
    return-void

    .line 509
    :cond_2f
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "getHistoricalProcessExitReasons"

    const/4 v3, 0x3

    new-array v4, v3, [Ljava/lang/Class;

    const-class v5, Ljava/lang/String;

    const/4 v6, 0x0

    aput-object v5, v4, v6

    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v7, 0x1

    aput-object v5, v4, v7

    const/4 v8, 0x2

    aput-object v5, v4, v8

    invoke-virtual {v1, v2, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 514
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v4, 0x5

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    new-array v3, v3, [Ljava/lang/Object;

    aput-object p0, v3, v6

    aput-object v2, v3, v7

    aput-object v4, v3, v8

    invoke-virtual {v1, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .line 515
    instance-of v0, p0, Ljava/util/List;

    if-nez v0, :cond_7d

    .line 516
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "process exit history unavailable; unexpected result="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/trueaxis/modmenu/ModDebugLog;->log(Ljava/lang/String;)V

    .line 517
    return-void

    .line 519
    :cond_7d
    check-cast p0, Ljava/util/List;

    .line 520
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "process exit history count="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/trueaxis/modmenu/ModDebugLog;->log(Ljava/lang/String;)V

    .line 521
    nop

    :goto_9a
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    if-ge v6, v0, :cond_13e

    .line 522
    invoke-interface {p0, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    .line 523
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "process exit["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "] reason="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "getReason"

    .line 524
    invoke-static {v0, v2}, Lcom/trueaxis/modmenu/ModDebugLog;->reflected(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " importance="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "getImportance"

    .line 525
    invoke-static {v0, v2}, Lcom/trueaxis/modmenu/ModDebugLog;->reflected(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " pid="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "getPid"

    .line 526
    invoke-static {v0, v2}, Lcom/trueaxis/modmenu/ModDebugLog;->reflected(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " pss="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "getPss"

    .line 527
    invoke-static {v0, v2}, Lcom/trueaxis/modmenu/ModDebugLog;->reflected(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " rss="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "getRss"

    .line 528
    invoke-static {v0, v2}, Lcom/trueaxis/modmenu/ModDebugLog;->reflected(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " timestamp="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "getTimestamp"

    .line 529
    invoke-static {v0, v2}, Lcom/trueaxis/modmenu/ModDebugLog;->reflected(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " process="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "getProcessName"

    .line 530
    invoke-static {v0, v2}, Lcom/trueaxis/modmenu/ModDebugLog;->reflected(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " description="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "getDescription"

    .line 531
    invoke-static {v0, v2}, Lcom/trueaxis/modmenu/ModDebugLog;->reflected(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 523
    invoke-static {v0}, Lcom/trueaxis/modmenu/ModDebugLog;->log(Ljava/lang/String;)V
    :try_end_13a
    .catchall {:try_start_1f .. :try_end_13a} :catchall_13f

    .line 521
    add-int/lit8 v6, v6, 0x1

    goto/16 :goto_9a

    .line 535
    :cond_13e
    goto :goto_145

    .line 533
    :catchall_13f
    move-exception p0

    .line 534
    const-string v0, "process exit history unavailable"

    invoke-static {v0, p0}, Lcom/trueaxis/modmenu/ModDebugLog;->log(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 536
    :goto_145
    return-void
.end method

.method private static logPermissionState(Landroid/content/Context;)V
    .registers 3

    .line 416
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "permission WRITE_EXTERNAL_STORAGE="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "android.permission.WRITE_EXTERNAL_STORAGE"

    invoke-static {p0, v1}, Lcom/trueaxis/modmenu/ModDebugLog;->permissionState(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " READ_EXTERNAL_STORAGE="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 418
    const-string v1, "android.permission.READ_EXTERNAL_STORAGE"

    invoke-static {p0, v1}, Lcom/trueaxis/modmenu/ModDebugLog;->permissionState(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, " external_storage_state="

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    .line 420
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 416
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModDebugLog;->log(Ljava/lang/String;)V

    .line 421
    return-void
.end method

.method static logRuntime(Ljava/lang/String;)V
    .registers 6

    .line 123
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v0

    .line 124
    invoke-virtual {v0}, Ljava/lang/Runtime;->totalMemory()J

    move-result-wide v1

    invoke-virtual {v0}, Ljava/lang/Runtime;->freeMemory()J

    move-result-wide v3

    sub-long/2addr v1, v3

    .line 125
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "runtime "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v3, " thread="

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    .line 126
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v3, " used="

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v1, " free="

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    .line 128
    invoke-virtual {v0}, Ljava/lang/Runtime;->freeMemory()J

    move-result-wide v1

    invoke-virtual {p0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v1, " total="

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    .line 129
    invoke-virtual {v0}, Ljava/lang/Runtime;->totalMemory()J

    move-result-wide v1

    invoke-virtual {p0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v1, " max="

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    .line 130
    invoke-virtual {v0}, Ljava/lang/Runtime;->maxMemory()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, " nativeHeap="

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    .line 131
    invoke-static {}, Landroid/os/Debug;->getNativeHeapAllocatedSize()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 125
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModDebugLog;->log(Ljava/lang/String;)V

    .line 132
    return-void
.end method

.method static module(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    .line 110
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, "] "

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/trueaxis/modmenu/ModDebugLog;->log(Ljava/lang/String;)V

    .line 111
    return-void
.end method

.method static module(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 5

    .line 114
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, "] "

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, p2}, Lcom/trueaxis/modmenu/ModDebugLog;->log(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 115
    return-void
.end method

.method static nativeCrashFile()Ljava/io/File;
    .registers 1

    .line 135
    sget-object v0, Lcom/trueaxis/modmenu/ModDebugLog;->nativeFile:Ljava/io/File;

    return-object v0
.end method

.method static onRequestPermissionsResult(Landroid/app/Activity;I[Ljava/lang/String;[I)V
    .registers 9

    .line 264
    const/16 v0, 0x106a

    if-eq p1, v0, :cond_5

    return-void

    .line 265
    :cond_5
    sget-object v0, Lcom/trueaxis/modmenu/ModDebugLog;->LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 266
    :try_start_8
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 267
    if-eqz p2, :cond_33

    if-eqz p3, :cond_33

    .line 268
    const/4 v2, 0x0

    :goto_12
    array-length v3, p2

    if-ge v2, v3, :cond_33

    array-length v3, p3

    if-ge v2, v3, :cond_33

    .line 269
    if-lez v2, :cond_1f

    const-string v3, ","

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 270
    :cond_1f
    aget-object v3, p2, v2

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    aget v4, p3, v2

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 268
    add-int/lit8 v2, v2, 0x1

    goto :goto_12

    .line 273
    :cond_33
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "shared log folder permission result request="

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " results="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/trueaxis/modmenu/ModDebugLog;->log(Ljava/lang/String;)V

    .line 275
    const-string p1, "storage permission result"

    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/ModDebugLog;->refreshStorageTargetLocked(Landroid/content/Context;Ljava/lang/String;)V

    .line 276
    monitor-exit v0

    .line 277
    return-void

    .line 276
    :catchall_5a
    move-exception p0

    monitor-exit v0
    :try_end_5c
    .catchall {:try_start_8 .. :try_end_5c} :catchall_5a

    goto :goto_5e

    :goto_5d
    throw p0

    :goto_5e
    goto :goto_5d
.end method

.method private static packageSummary(Landroid/content/Context;)Ljava/lang/String;
    .registers 4

    .line 550
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    .line 551
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, v0, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "#"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v0, v0, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_36
    .catchall {:try_start_0 .. :try_end_36} :catchall_37

    return-object p0

    .line 552
    :catchall_37
    move-exception v0

    .line 553
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, "/unknown"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static permissionGranted(Landroid/content/Context;Ljava/lang/String;)Z
    .registers 2

    .line 424
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/ModDebugLog;->permissionState(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string p1, "0"

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method private static permissionState(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    .line 429
    :try_start_0
    invoke-virtual {p0, p1}, Landroid/content/Context;->checkCallingOrSelfPermission(Ljava/lang/String;)I

    move-result p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p0
    :try_end_8
    .catchall {:try_start_0 .. :try_end_8} :catchall_9

    return-object p0

    .line 430
    :catchall_9
    move-exception p0

    .line 431
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "unavailable:"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static prefix()Ljava/lang/String;
    .registers 2

    .line 572
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/trueaxis/modmenu/ModDebugLog;->timestamp()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " pid="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 573
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " tid="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 574
    invoke-static {}, Landroid/os/Process;->myTid()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " thread="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 575
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 572
    return-object v0
.end method

.method private static processName()Ljava/lang/String;
    .registers 2

    .line 558
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-lt v0, v1, :cond_c

    .line 560
    :try_start_6
    invoke-static {}, Landroid/app/Application;->getProcessName()Ljava/lang/String;

    move-result-object v0
    :try_end_a
    .catchall {:try_start_6 .. :try_end_a} :catchall_b

    return-object v0

    .line 561
    :catchall_b
    move-exception v0

    .line 564
    :cond_c
    const-string v0, "unknown"

    return-object v0
.end method

.method static readExportContent()Ljava/lang/String;
    .registers 4

    .line 180
    sget-object v0, Lcom/trueaxis/modmenu/ModDebugLog;->LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 181
    :try_start_3
    new-instance v1, Ljava/lang/StringBuilder;

    const/16 v2, 0x2000

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 182
    const-string v2, "=== YCS2 Community Mod debug log export ===\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 183
    const-string v2, "exported_at="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {}, Lcom/trueaxis/modmenu/ModDebugLog;->timestamp()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 184
    const-string v2, "main_log_path="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lcom/trueaxis/modmenu/ModDebugLog;->file:Ljava/io/File;

    if-nez v3, :cond_2f

    const-string v3, "null"

    goto :goto_35

    :cond_2f
    sget-object v3, Lcom/trueaxis/modmenu/ModDebugLog;->file:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    :goto_35
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\n"

    .line 185
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 186
    const-string v2, "native_log_path="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 187
    sget-object v3, Lcom/trueaxis/modmenu/ModDebugLog;->nativeFile:Ljava/io/File;

    if-nez v3, :cond_4b

    const-string v3, "null"

    goto :goto_51

    :cond_4b
    sget-object v3, Lcom/trueaxis/modmenu/ModDebugLog;->nativeFile:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    :goto_51
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\n"

    .line 188
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 189
    sget-object v2, Lcom/trueaxis/modmenu/ModDebugLog;->file:Ljava/io/File;

    const-string v3, "ycs2_mod_debug.log"

    invoke-static {v1, v2, v3}, Lcom/trueaxis/modmenu/ModDebugLog;->appendFileSection(Ljava/lang/StringBuilder;Ljava/io/File;Ljava/lang/String;)V

    .line 190
    sget-object v2, Lcom/trueaxis/modmenu/ModDebugLog;->nativeFile:Ljava/io/File;

    const-string v3, "ycs2_mod_native_crash.log"

    invoke-static {v1, v2, v3}, Lcom/trueaxis/modmenu/ModDebugLog;->appendFileSection(Ljava/lang/StringBuilder;Ljava/io/File;Ljava/lang/String;)V

    .line 191
    sget-object v2, Lcom/trueaxis/modmenu/ModDebugLog;->fallbackFile:Ljava/io/File;

    if-eqz v2, :cond_7d

    sget-object v2, Lcom/trueaxis/modmenu/ModDebugLog;->fallbackFile:Ljava/io/File;

    sget-object v3, Lcom/trueaxis/modmenu/ModDebugLog;->file:Ljava/io/File;

    invoke-virtual {v2, v3}, Ljava/io/File;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_7d

    .line 192
    sget-object v2, Lcom/trueaxis/modmenu/ModDebugLog;->fallbackFile:Ljava/io/File;

    const-string v3, "ycs2_mod_debug.log (fallback)"

    invoke-static {v1, v2, v3}, Lcom/trueaxis/modmenu/ModDebugLog;->appendFileSection(Ljava/lang/StringBuilder;Ljava/io/File;Ljava/lang/String;)V

    .line 194
    :cond_7d
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    monitor-exit v0

    return-object v1

    .line 195
    :catchall_83
    move-exception v1

    monitor-exit v0
    :try_end_85
    .catchall {:try_start_3 .. :try_end_85} :catchall_83

    throw v1
.end method

.method private static reflected(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 5

    .line 539
    if-nez p0, :cond_5

    const-string p0, "null"

    return-object p0

    .line 541
    :cond_5
    :try_start_5
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/Class;

    invoke-virtual {v0, p1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    .line 542
    new-array v0, v1, [Ljava/lang/Object;

    invoke-virtual {p1, p0, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0
    :try_end_16
    .catchall {:try_start_5 .. :try_end_16} :catchall_17

    return-object p0

    .line 543
    :catchall_17
    move-exception p0

    .line 544
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "unavailable:"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static refreshStorageTargetLocked(Landroid/content/Context;Ljava/lang/String;)V
    .registers 7

    .line 304
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_b

    .line 305
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    goto :goto_c

    :cond_b
    move-object v0, p0

    .line 306
    :goto_c
    sget-object v1, Lcom/trueaxis/modmenu/ModDebugLog;->fallbackFile:Ljava/io/File;

    if-nez v1, :cond_1c

    .line 307
    new-instance v1, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v2

    const-string v3, "logs"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    goto :goto_22

    .line 308
    :cond_1c
    sget-object v1, Lcom/trueaxis/modmenu/ModDebugLog;->fallbackFile:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v1

    .line 309
    :goto_22
    invoke-static {v1}, Lcom/trueaxis/modmenu/ModDebugLog;->ensureDirectory(Ljava/io/File;)Z

    .line 310
    invoke-static {p0, v0, v1}, Lcom/trueaxis/modmenu/ModDebugLog;->chooseLogDirectory(Landroid/content/Context;Landroid/content/Context;Ljava/io/File;)Ljava/io/File;

    move-result-object p0

    .line 311
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModDebugLog;->isPublicSharedLogDir(Ljava/io/File;)Z

    move-result v0

    .line 312
    new-instance v1, Ljava/io/File;

    const-string v2, "ycs2_mod_debug.log"

    invoke-direct {v1, p0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 313
    sget-object v2, Lcom/trueaxis/modmenu/ModDebugLog;->file:Ljava/io/File;

    const-string v3, " public_shared_log_dir="

    if-eqz v2, :cond_6f

    sget-object v2, Lcom/trueaxis/modmenu/ModDebugLog;->file:Ljava/io/File;

    invoke-virtual {v2, v1}, Ljava/io/File;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6f

    .line 314
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "debug log storage refresh unchanged reason="

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " path="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    .line 315
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 314
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModDebugLog;->log(Ljava/lang/String;)V

    .line 317
    return-void

    .line 320
    :cond_6f
    sget-object v2, Lcom/trueaxis/modmenu/ModDebugLog;->file:Ljava/io/File;

    .line 321
    sget-object v4, Lcom/trueaxis/modmenu/ModDebugLog;->nativeFile:Ljava/io/File;

    .line 322
    sput-object p0, Lcom/trueaxis/modmenu/ModDebugLog;->logDir:Ljava/io/File;

    .line 323
    sput-boolean v0, Lcom/trueaxis/modmenu/ModDebugLog;->publicLogDir:Z

    .line 324
    sput-object v1, Lcom/trueaxis/modmenu/ModDebugLog;->file:Ljava/io/File;

    .line 325
    new-instance v0, Ljava/io/File;

    const-string v1, "ycs2_mod_native_crash.log"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    sput-object v0, Lcom/trueaxis/modmenu/ModDebugLog;->nativeFile:Ljava/io/File;

    .line 326
    sget-object p0, Lcom/trueaxis/modmenu/ModDebugLog;->file:Ljava/io/File;

    invoke-static {v2, p0}, Lcom/trueaxis/modmenu/ModDebugLog;->copyPreviousLog(Ljava/io/File;Ljava/io/File;)V

    .line 327
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "debug log storage moved reason="

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " old_path="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " old_native_path="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " new_path="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    sget-object p1, Lcom/trueaxis/modmenu/ModDebugLog;->file:Ljava/io/File;

    .line 330
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " new_native_path="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    sget-object p1, Lcom/trueaxis/modmenu/ModDebugLog;->nativeFile:Ljava/io/File;

    .line 331
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    sget-boolean p1, Lcom/trueaxis/modmenu/ModDebugLog;->publicLogDir:Z

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " user_visible_folder_hint=Internal storage/YCS2CommunityMod/logs"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 327
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModDebugLog;->log(Ljava/lang/String;)V

    .line 334
    return-void
.end method

.method static requestSharedLogPermission(Landroid/app/Activity;)V
    .registers 9

    .line 232
    sget-object v0, Lcom/trueaxis/modmenu/ModDebugLog;->LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 233
    :try_start_3
    sget-boolean v1, Lcom/trueaxis/modmenu/ModDebugLog;->publicLogDir:Z

    if-eqz v1, :cond_9

    .line 234
    monitor-exit v0

    return-void

    .line 236
    :cond_9
    const-string v1, "android.permission.WRITE_EXTERNAL_STORAGE"

    invoke-static {p0, v1}, Lcom/trueaxis/modmenu/ModDebugLog;->permissionGranted(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_18

    .line 237
    const-string v1, "storage permission already granted"

    invoke-static {p0, v1}, Lcom/trueaxis/modmenu/ModDebugLog;->refreshStorageTargetLocked(Landroid/content/Context;Ljava/lang/String;)V

    .line 238
    monitor-exit v0

    return-void

    .line 240
    :cond_18
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x17

    if-ge v1, v2, :cond_38

    .line 241
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "shared log permission request skipped sdk="

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/trueaxis/modmenu/ModDebugLog;->log(Ljava/lang/String;)V

    .line 242
    monitor-exit v0
    :try_end_37
    .catchall {:try_start_3 .. :try_end_37} :catchall_70

    return-void

    .line 245
    :cond_38
    :try_start_38
    const-class v1, Landroid/app/Activity;

    const-string v2, "requestPermissions"

    const/4 v3, 0x2

    new-array v4, v3, [Ljava/lang/Class;

    const-class v5, [Ljava/lang/String;

    const/4 v6, 0x0

    aput-object v5, v4, v6

    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v7, 0x1

    aput-object v5, v4, v7

    invoke-virtual {v1, v2, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 249
    new-array v2, v7, [Ljava/lang/String;

    const-string v4, "android.permission.WRITE_EXTERNAL_STORAGE"

    aput-object v4, v2, v6

    .line 250
    const/16 v4, 0x106a

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    new-array v3, v3, [Ljava/lang/Object;

    aput-object v2, v3, v6

    aput-object v4, v3, v7

    .line 249
    invoke-virtual {v1, p0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 251
    const-string p0, "requested shared log folder permission permission=android.permission.WRITE_EXTERNAL_STORAGE request=4202"

    invoke-static {p0}, Lcom/trueaxis/modmenu/ModDebugLog;->log(Ljava/lang/String;)V
    :try_end_67
    .catchall {:try_start_38 .. :try_end_67} :catchall_68

    .line 255
    goto :goto_6e

    .line 253
    :catchall_68
    move-exception p0

    .line 254
    :try_start_69
    const-string v1, "Could not request shared log folder permission"

    invoke-static {v1, p0}, Lcom/trueaxis/modmenu/ModDebugLog;->log(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 256
    :goto_6e
    monitor-exit v0

    .line 257
    return-void

    .line 256
    :catchall_70
    move-exception p0

    monitor-exit v0
    :try_end_72
    .catchall {:try_start_69 .. :try_end_72} :catchall_70

    throw p0
.end method

.method private static timestamp()Ljava/lang/String;
    .registers 3

    .line 568
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyy-MM-dd HH:mm:ss.SSS"

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static writeFallback(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 7

    .line 371
    sget-object v0, Lcom/trueaxis/modmenu/ModDebugLog;->fallbackFile:Ljava/io/File;

    if-eqz v0, :cond_73

    sget-object v0, Lcom/trueaxis/modmenu/ModDebugLog;->fallbackFile:Ljava/io/File;

    sget-object v1, Lcom/trueaxis/modmenu/ModDebugLog;->file:Ljava/io/File;

    invoke-virtual {v0, v1}, Ljava/io/File;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_f

    goto :goto_73

    .line 372
    :cond_f
    nop

    .line 374
    const/4 v0, 0x0

    :try_start_11
    sget-object v1, Lcom/trueaxis/modmenu/ModDebugLog;->fallbackFile:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v1

    invoke-static {v1}, Lcom/trueaxis/modmenu/ModDebugLog;->ensureDirectory(Ljava/io/File;)Z

    .line 375
    new-instance v1, Ljava/io/PrintWriter;

    new-instance v2, Ljava/io/FileWriter;

    sget-object v3, Lcom/trueaxis/modmenu/ModDebugLog;->fallbackFile:Ljava/io/File;

    const/4 v4, 0x1

    invoke-direct {v2, v3, v4}, Ljava/io/FileWriter;-><init>(Ljava/io/File;Z)V

    invoke-direct {v1, v2}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V
    :try_end_27
    .catchall {:try_start_11 .. :try_end_27} :catchall_4b

    .line 376
    :try_start_27
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/trueaxis/modmenu/ModDebugLog;->prefix()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 377
    if-eqz p1, :cond_44

    invoke-virtual {p1, v1}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V
    :try_end_44
    .catchall {:try_start_27 .. :try_end_44} :catchall_48

    .line 381
    :cond_44
    invoke-virtual {v1}, Ljava/io/PrintWriter;->close()V

    goto :goto_6b

    .line 378
    :catchall_48
    move-exception p0

    move-object v0, v1

    goto :goto_4c

    :catchall_4b
    move-exception p0

    .line 379
    :goto_4c
    :try_start_4c
    const-string p1, "YCS2Mod"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Could not write fallback mod debug log to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lcom/trueaxis/modmenu/ModDebugLog;->fallbackFile:Ljava/io/File;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_66
    .catchall {:try_start_4c .. :try_end_66} :catchall_6c

    .line 381
    if-eqz v0, :cond_6b

    invoke-virtual {v0}, Ljava/io/PrintWriter;->close()V

    .line 383
    :cond_6b
    :goto_6b
    return-void

    .line 381
    :catchall_6c
    move-exception p0

    if-eqz v0, :cond_72

    invoke-virtual {v0}, Ljava/io/PrintWriter;->close()V

    .line 382
    :cond_72
    throw p0

    .line 371
    :cond_73
    :goto_73
    return-void
.end method
