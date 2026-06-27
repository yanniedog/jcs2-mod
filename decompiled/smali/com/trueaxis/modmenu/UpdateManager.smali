.class public final Lcom/trueaxis/modmenu/UpdateManager;
.super Ljava/lang/Object;
.source "UpdateManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;
    }
.end annotation


# static fields
.field private static final APK_MIME:Ljava/lang/String; = "application/vnd.android.package-archive"

.field private static final CHECK_INTERVAL_MS:J = 0x2932e00L

.field private static final K_DISMISSED_VERSION_CODE:Ljava/lang/String; = "dismissed_version_code"

.field private static final K_DOWNLOAD_ID:Ljava/lang/String; = "download_id"

.field private static final K_DOWNLOAD_SHA256:Ljava/lang/String; = "download_sha256"

.field private static final K_DOWNLOAD_VERSION_CODE:Ljava/lang/String; = "download_version_code"

.field private static final K_INSTALL_PERMISSION_PROMPTED_VERSION_CODE:Ljava/lang/String; = "install_permission_prompted_version_code"

.field private static final K_INSTALL_PROMPTED_DOWNLOAD_ID:Ljava/lang/String; = "install_prompted_download_id"

.field private static final K_LAST_CHECK_MS:Ljava/lang/String; = "last_check_ms"

.field private static final MAX_MANIFEST_CHARS:I = 0x10000

.field private static final PREFS:Ljava/lang/String; = "jcs_mod_update"

.field private static final UPDATE_MANIFEST_URL:Ljava/lang/String; = "https://github.com/yanniedog/jcs2-mod/releases/latest/download/jcs2-update.json"

.field private static checking:Z


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    return-void
.end method

.method static synthetic access$000()Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 40
    invoke-static {}, Lcom/trueaxis/modmenu/UpdateManager;->fetchUpdateInfo()Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Landroid/content/Context;Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;)Z
    .registers 2

    .line 40
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/UpdateManager;->shouldSuppressUpdatePrompt(Landroid/content/Context;Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$1000(Landroid/app/Activity;JZ)Z
    .registers 4

    .line 40
    invoke-static {p0, p1, p2, p3}, Lcom/trueaxis/modmenu/UpdateManager;->installDownloadedApk(Landroid/app/Activity;JZ)Z

    move-result p0

    return p0
.end method

.method static synthetic access$200(Landroid/app/Activity;Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;Landroid/content/pm/PackageInfo;)V
    .registers 3

    .line 40
    invoke-static {p0, p1, p2}, Lcom/trueaxis/modmenu/UpdateManager;->showUpdateAvailable(Landroid/app/Activity;Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;Landroid/content/pm/PackageInfo;)V

    return-void
.end method

.method static synthetic access$300(Landroid/app/Activity;Ljava/lang/Runnable;)V
    .registers 2

    .line 40
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/UpdateManager;->runOnUi(Landroid/app/Activity;Ljava/lang/Runnable;)V

    return-void
.end method

.method static synthetic access$400(Landroid/content/Context;Ljava/lang/String;)V
    .registers 2

    .line 40
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/UpdateManager;->toast(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$500(Ljava/lang/Throwable;)Ljava/lang/String;
    .registers 1

    .line 40
    invoke-static {p0}, Lcom/trueaxis/modmenu/UpdateManager;->readable(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$602(Z)Z
    .registers 1

    .line 40
    sput-boolean p0, Lcom/trueaxis/modmenu/UpdateManager;->checking:Z

    return p0
.end method

.method static synthetic access$700(Landroid/content/Context;Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;)V
    .registers 2

    .line 40
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/UpdateManager;->recordUpdateDismissed(Landroid/content/Context;Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;)V

    return-void
.end method

.method static synthetic access$800(Landroid/app/Activity;Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;)V
    .registers 2

    .line 40
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/UpdateManager;->startDownload(Landroid/app/Activity;Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;)V

    return-void
.end method

.method private static canInstallPackages(Landroid/content/Context;)Z
    .registers 6

    .line 370
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    const/4 v2, 0x1

    if-ge v0, v1, :cond_8

    return v2

    .line 372
    :cond_8
    :try_start_8
    const-class v0, Landroid/content/pm/PackageManager;

    const-string v1, "canRequestPackageInstalls"

    const/4 v3, 0x0

    new-array v4, v3, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 373
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0

    new-array v1, v3, [Ljava/lang/Object;

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .line 374
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0, p0}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result p0
    :try_end_23
    .catchall {:try_start_8 .. :try_end_23} :catchall_24

    return p0

    .line 375
    :catchall_24
    move-exception p0

    .line 376
    return v2
.end method

.method private static checkForUpdates(Landroid/app/Activity;Z)V
    .registers 6

    .line 74
    sget-boolean v0, Lcom/trueaxis/modmenu/UpdateManager;->checking:Z

    if-eqz v0, :cond_c

    .line 75
    if-eqz p1, :cond_b

    const-string p1, "Update check is already running."

    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/UpdateManager;->toast(Landroid/content/Context;Ljava/lang/String;)V

    .line 76
    :cond_b
    return-void

    .line 78
    :cond_c
    const/4 v0, 0x1

    sput-boolean v0, Lcom/trueaxis/modmenu/UpdateManager;->checking:Z

    .line 79
    invoke-static {p0}, Lcom/trueaxis/modmenu/UpdateManager;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "last_check_ms"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 80
    if-eqz p1, :cond_2b

    const-string v0, "Checking for updates..."

    invoke-static {p0, v0}, Lcom/trueaxis/modmenu/UpdateManager;->toast(Landroid/content/Context;Ljava/lang/String;)V

    .line 81
    :cond_2b
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/trueaxis/modmenu/UpdateManager$1;

    invoke-direct {v1, p0, p1}, Lcom/trueaxis/modmenu/UpdateManager$1;-><init>(Landroid/app/Activity;Z)V

    const-string p0, "YCS2UpdateCheck"

    invoke-direct {v0, v1, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 122
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 123
    return-void
.end method

.method public static checkNow(Landroid/app/Activity;)V
    .registers 3

    .line 69
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lcom/trueaxis/modmenu/UpdateManager;->resumePendingInstall(Landroid/app/Activity;Z)Z

    move-result v1

    if-eqz v1, :cond_8

    return-void

    .line 70
    :cond_8
    invoke-static {p0, v0}, Lcom/trueaxis/modmenu/UpdateManager;->checkForUpdates(Landroid/app/Activity;Z)V

    .line 71
    return-void
.end method

.method public static checkSilently(Landroid/app/Activity;)V
    .registers 8

    .line 61
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/trueaxis/modmenu/UpdateManager;->resumePendingInstall(Landroid/app/Activity;Z)Z

    move-result v1

    if-eqz v1, :cond_8

    return-void

    .line 62
    :cond_8
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    .line 63
    invoke-static {p0}, Lcom/trueaxis/modmenu/UpdateManager;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    const-string v4, "last_check_ms"

    const-wide/16 v5, 0x0

    invoke-interface {v3, v4, v5, v6}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v3

    .line 64
    sub-long/2addr v1, v3

    const-wide/32 v3, 0x2932e00

    cmp-long v5, v1, v3

    if-gez v5, :cond_21

    return-void

    .line 65
    :cond_21
    invoke-static {p0, v0}, Lcom/trueaxis/modmenu/UpdateManager;->checkForUpdates(Landroid/app/Activity;Z)V

    .line 66
    return-void
.end method

.method private static clearDownload(Landroid/content/Context;)V
    .registers 2

    .line 466
    invoke-static {p0}, Lcom/trueaxis/modmenu/UpdateManager;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 467
    const-string v0, "download_id"

    invoke-interface {p0, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 468
    const-string v0, "download_sha256"

    invoke-interface {p0, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 469
    const-string v0, "download_version_code"

    invoke-interface {p0, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 470
    const-string v0, "install_prompted_download_id"

    invoke-interface {p0, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 471
    const-string v0, "install_permission_prompted_version_code"

    invoke-interface {p0, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 472
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 473
    return-void
.end method

.method private static closeQuietly(Ljava/io/Closeable;)V
    .registers 1

    .line 485
    if-nez p0, :cond_3

    return-void

    .line 487
    :cond_3
    :try_start_3
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_6
    .catchall {:try_start_3 .. :try_end_6} :catchall_7

    .line 489
    goto :goto_8

    .line 488
    :catchall_7
    move-exception p0

    .line 490
    :goto_8
    return-void
.end method

.method private static currentVersionCode(Landroid/content/Context;)I
    .registers 4

    .line 345
    const/4 v0, 0x0

    :try_start_1
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 346
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0, v0}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object p0

    .line 347
    iget p0, p0, Landroid/content/pm/PackageInfo;->versionCode:I
    :try_end_f
    .catchall {:try_start_1 .. :try_end_f} :catchall_10

    return p0

    .line 348
    :catchall_10
    move-exception p0

    .line 349
    const-string v1, "update"

    const-string v2, "could not read current version"

    invoke-static {v1, v2, p0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 350
    return v0
.end method

.method private static downloadAlreadyInstalled(Landroid/content/Context;)Z
    .registers 4

    .line 337
    invoke-static {p0}, Lcom/trueaxis/modmenu/UpdateManager;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "download_version_code"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 338
    if-gtz v0, :cond_e

    return v2

    .line 339
    :cond_e
    invoke-static {p0}, Lcom/trueaxis/modmenu/UpdateManager;->currentVersionCode(Landroid/content/Context;)I

    move-result p0

    .line 340
    if-lt p0, v0, :cond_15

    const/4 v2, 0x1

    :cond_15
    return v2
.end method

.method private static fetchUpdateInfo()Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 172
    const-string v0, ""

    new-instance v1, Ljava/net/URL;

    const-string v2, "https://github.com/yanniedog/jcs2-mod/releases/latest/download/jcs2-update.json"

    invoke-direct {v1, v2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 173
    invoke-virtual {v1}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v1

    check-cast v1, Ljava/net/HttpURLConnection;

    .line 174
    const/16 v2, 0x2710

    invoke-virtual {v1, v2}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 175
    const/16 v2, 0x4e20

    invoke-virtual {v1, v2}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 176
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/net/HttpURLConnection;->setUseCaches(Z)V

    .line 177
    const-string v3, "Accept"

    const-string v4, "application/json"

    invoke-virtual {v1, v3, v4}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 178
    const-string v3, "User-Agent"

    const-string v4, "YCS2ModUpdater/1.0"

    invoke-virtual {v1, v3, v4}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 179
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v3

    .line 180
    const/16 v4, 0xc8

    if-lt v3, v4, :cond_be

    const/16 v4, 0x12c

    if-ge v3, v4, :cond_be

    .line 183
    nop

    .line 185
    const/4 v3, 0x0

    :try_start_39
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v4
    :try_end_3d
    .catchall {:try_start_39 .. :try_end_3d} :catchall_b6

    .line 186
    :try_start_3d
    new-instance v5, Lorg/json/JSONObject;

    invoke-static {v4}, Lcom/trueaxis/modmenu/UpdateManager;->readString(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 187
    new-instance v6, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;

    invoke-direct {v6, v3}, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;-><init>(Lcom/trueaxis/modmenu/UpdateManager$1;)V

    .line 188
    const-string v3, "package_name"

    invoke-virtual {v5, v3, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v6, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->packageName:Ljava/lang/String;

    .line 189
    const-string v3, "version_code"

    invoke-virtual {v5, v3, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v2

    iput v2, v6, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->versionCode:I

    .line 190
    const-string v2, "version_name"

    invoke-virtual {v5, v2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v6, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->versionName:Ljava/lang/String;

    .line 191
    const-string v2, "apk_name"

    const-string v3, "jcs2-update.apk"

    invoke-virtual {v5, v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v6, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->apkName:Ljava/lang/String;

    .line 192
    const-string v2, "apk_url"

    invoke-virtual {v5, v2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v6, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->apkUrl:Ljava/lang/String;

    .line 193
    const-string v2, "apk_sha256"

    invoke-virtual {v5, v2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v6, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->apkSha256:Ljava/lang/String;

    .line 194
    const-string v0, "apk_size"

    const-wide/16 v2, 0x0

    invoke-virtual {v5, v0, v2, v3}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v2

    iput-wide v2, v6, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->apkSize:J

    .line 195
    iget-object v0, v6, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_ab

    iget v0, v6, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->versionCode:I

    if-lez v0, :cond_ab

    iget-object v0, v6, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->versionName:Ljava/lang/String;

    .line 197
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_ab

    iget-object v0, v6, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->apkUrl:Ljava/lang/String;

    .line 198
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0
    :try_end_a1
    .catchall {:try_start_3d .. :try_end_a1} :catchall_b3

    if-eqz v0, :cond_ab

    .line 201
    nop

    .line 203
    invoke-static {v4}, Lcom/trueaxis/modmenu/UpdateManager;->closeQuietly(Ljava/io/Closeable;)V

    .line 204
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 201
    return-object v6

    .line 199
    :cond_ab
    :try_start_ab
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v2, "Update manifest is incomplete"

    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_b3
    .catchall {:try_start_ab .. :try_end_b3} :catchall_b3

    .line 203
    :catchall_b3
    move-exception v0

    move-object v3, v4

    goto :goto_b7

    :catchall_b6
    move-exception v0

    :goto_b7
    invoke-static {v3}, Lcom/trueaxis/modmenu/UpdateManager;->closeQuietly(Ljava/io/Closeable;)V

    .line 204
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 205
    throw v0

    .line 181
    :cond_be
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "HTTP "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static formatBytes(J)Ljava/lang/String;
    .registers 5

    .line 451
    const-wide/32 v0, 0x100000

    cmp-long v2, p0, v0

    if-gez v2, :cond_1e

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-wide/16 v1, 0x400

    div-long/2addr p0, v1

    invoke-virtual {v0, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " KB"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 452
    :cond_1e
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    long-to-double p0, p0

    const-wide/high16 v1, 0x4090000000000000L

    invoke-static {p0, p1}, Ljava/lang/Double;->isNaN(D)Z

    div-double/2addr p0, v1

    div-double/2addr p0, v1

    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p0

    const/4 p1, 0x1

    new-array p1, p1, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p0, p1, v1

    const-string p0, "%.1f MB"

    invoke-static {v0, p0, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static hex([B)Ljava/lang/String;
    .registers 5

    .line 441
    new-instance v0, Ljava/lang/StringBuilder;

    array-length v1, p0

    mul-int/lit8 v1, v1, 0x2

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 442
    const/4 v1, 0x0

    :goto_9
    array-length v2, p0

    if-ge v1, v2, :cond_23

    .line 443
    aget-byte v2, p0, v1

    and-int/lit16 v2, v2, 0xff

    .line 444
    const/16 v3, 0x10

    if-ge v2, v3, :cond_19

    const/16 v3, 0x30

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 445
    :cond_19
    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 442
    add-int/lit8 v1, v1, 0x1

    goto :goto_9

    .line 447
    :cond_23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static installDownloadedApk(Landroid/app/Activity;JZ)Z
    .registers 13

    .line 271
    const-string v0, "install_prompted_download_id"

    const-string v1, "update"

    invoke-static {p0}, Lcom/trueaxis/modmenu/UpdateManager;->downloadAlreadyInstalled(Landroid/content/Context;)Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_f

    .line 272
    invoke-static {p0}, Lcom/trueaxis/modmenu/UpdateManager;->clearDownload(Landroid/content/Context;)V

    .line 273
    return v3

    .line 275
    :cond_f
    const-string v2, "download"

    invoke-virtual {p0, v2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/DownloadManager;

    .line 276
    if-nez v2, :cond_1a

    return v3

    .line 277
    :cond_1a
    nop

    .line 279
    const/4 v4, 0x0

    :try_start_1c
    new-instance v5, Landroid/app/DownloadManager$Query;

    invoke-direct {v5}, Landroid/app/DownloadManager$Query;-><init>()V

    const/4 v6, 0x1

    new-array v7, v6, [J

    aput-wide p1, v7, v3

    invoke-virtual {v5, v7}, Landroid/app/DownloadManager$Query;->setFilterById([J)Landroid/app/DownloadManager$Query;

    move-result-object v5

    invoke-virtual {v2, v5}, Landroid/app/DownloadManager;->query(Landroid/app/DownloadManager$Query;)Landroid/database/Cursor;

    move-result-object v4

    .line 280
    if-eqz v4, :cond_14f

    invoke-interface {v4}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v5

    if-nez v5, :cond_38

    goto/16 :goto_14f

    .line 284
    :cond_38
    const-string v5, "status"

    invoke-interface {v4, v5}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v5

    invoke-interface {v4, v5}, Landroid/database/Cursor;->getInt(I)I

    move-result v5

    .line 285
    if-eq v5, v6, :cond_141

    const/4 v7, 0x4

    if-eq v5, v7, :cond_141

    const/4 v7, 0x2

    if-ne v5, v7, :cond_4c

    goto/16 :goto_141

    .line 291
    :cond_4c
    const/16 v7, 0x8

    if-eq v5, v7, :cond_61

    .line 292
    invoke-static {p0}, Lcom/trueaxis/modmenu/UpdateManager;->clearDownload(Landroid/content/Context;)V

    .line 293
    if-eqz p3, :cond_5a

    const-string p1, "Update download failed. Please try again."

    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/UpdateManager;->toast(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_5a
    .catchall {:try_start_1c .. :try_end_5a} :catchall_159

    .line 294
    :cond_5a
    nop

    .line 332
    if-eqz v4, :cond_60

    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    .line 294
    :cond_60
    return v3

    .line 296
    :cond_61
    :try_start_61
    invoke-static {p0}, Lcom/trueaxis/modmenu/UpdateManager;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v5

    const-string v7, "download_sha256"

    const-string v8, ""

    invoke-interface {v5, v7, v8}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 297
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v7

    if-lez v7, :cond_b3

    .line 298
    invoke-static {v2, p1, p2}, Lcom/trueaxis/modmenu/UpdateManager;->sha256(Landroid/app/DownloadManager;J)Ljava/lang/String;

    move-result-object v7

    .line 299
    invoke-virtual {v5, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_b3

    .line 300
    new-array v0, v6, [J

    aput-wide p1, v0, v3

    invoke-virtual {v2, v0}, Landroid/app/DownloadManager;->remove([J)I

    .line 301
    invoke-static {p0}, Lcom/trueaxis/modmenu/UpdateManager;->clearDownload(Landroid/content/Context;)V

    .line 302
    const-string p1, "Downloaded update did not match its checksum."

    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/UpdateManager;->toast(Landroid/content/Context;Ljava/lang/String;)V

    .line 303
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "checksum mismatch expected="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " actual="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_ac
    .catchall {:try_start_61 .. :try_end_ac} :catchall_159

    .line 305
    nop

    .line 332
    if-eqz v4, :cond_b2

    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    .line 305
    :cond_b2
    return v3

    .line 308
    :cond_b3
    :try_start_b3
    invoke-static {p0}, Lcom/trueaxis/modmenu/UpdateManager;->canInstallPackages(Landroid/content/Context;)Z

    move-result v5

    if-nez v5, :cond_c3

    .line 309
    invoke-static {p0, p3}, Lcom/trueaxis/modmenu/UpdateManager;->maybePromptInstallPermission(Landroid/app/Activity;Z)V
    :try_end_bc
    .catchall {:try_start_b3 .. :try_end_bc} :catchall_159

    .line 310
    nop

    .line 332
    if-eqz v4, :cond_c2

    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    .line 310
    :cond_c2
    return v6

    .line 312
    :cond_c3
    :try_start_c3
    invoke-static {p0}, Lcom/trueaxis/modmenu/UpdateManager;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v5

    const-wide/16 v7, -0x1

    invoke-interface {v5, v0, v7, v8}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v7

    .line 313
    if-nez p3, :cond_f0

    cmp-long v5, v7, p1

    if-nez v5, :cond_f0

    .line 314
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "pending installer already opened id="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_e9
    .catchall {:try_start_c3 .. :try_end_e9} :catchall_159

    .line 315
    nop

    .line 332
    if-eqz v4, :cond_ef

    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    .line 315
    :cond_ef
    return v6

    .line 317
    :cond_f0
    :try_start_f0
    invoke-virtual {v2, p1, p2}, Landroid/app/DownloadManager;->getUriForDownloadedFile(J)Landroid/net/Uri;

    move-result-object v2

    .line 318
    if-eqz v2, :cond_139

    .line 319
    new-instance v5, Landroid/content/Intent;

    const-string v7, "android.intent.action.VIEW"

    invoke-direct {v5, v7}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 320
    const-string v7, "application/vnd.android.package-archive"

    invoke-virtual {v5, v2, v7}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 321
    invoke-virtual {v5, v6}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 322
    const/high16 v2, 0x10000000

    invoke-virtual {v5, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 323
    invoke-virtual {p0, v5}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 324
    invoke-static {p0}, Lcom/trueaxis/modmenu/UpdateManager;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2, v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 325
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "installer opened for download id="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_132
    .catchall {:try_start_f0 .. :try_end_132} :catchall_159

    .line 326
    nop

    .line 332
    if-eqz v4, :cond_138

    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    .line 326
    :cond_138
    return v6

    .line 318
    :cond_139
    :try_start_139
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Downloaded APK URI unavailable"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 288
    :cond_141
    :goto_141
    if-eqz p3, :cond_148

    const-string p1, "Update download is still in progress."

    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/UpdateManager;->toast(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_148
    .catchall {:try_start_139 .. :try_end_148} :catchall_159

    .line 289
    :cond_148
    nop

    .line 332
    if-eqz v4, :cond_14e

    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    .line 289
    :cond_14e
    return v6

    .line 281
    :cond_14f
    :goto_14f
    :try_start_14f
    invoke-static {p0}, Lcom/trueaxis/modmenu/UpdateManager;->clearDownload(Landroid/content/Context;)V
    :try_end_152
    .catchall {:try_start_14f .. :try_end_152} :catchall_159

    .line 282
    nop

    .line 332
    if-eqz v4, :cond_158

    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    .line 282
    :cond_158
    return v3

    .line 327
    :catchall_159
    move-exception p1

    .line 328
    :try_start_15a
    const-string p2, "install downloaded apk failed"

    invoke-static {v1, p2, p1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 329
    if-eqz p3, :cond_17b

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "Could not open installer: "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-static {p1}, Lcom/trueaxis/modmenu/UpdateManager;->readable(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/UpdateManager;->toast(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_17b
    .catchall {:try_start_15a .. :try_end_17b} :catchall_182

    .line 330
    :cond_17b
    nop

    .line 332
    if-eqz v4, :cond_181

    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    .line 330
    :cond_181
    return v3

    .line 332
    :catchall_182
    move-exception p0

    if-eqz v4, :cond_188

    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    .line 333
    :cond_188
    throw p0
.end method

.method private static maybePromptInstallPermission(Landroid/app/Activity;Z)V
    .registers 6

    .line 355
    invoke-static {p0}, Lcom/trueaxis/modmenu/UpdateManager;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 356
    const-string v1, "download_version_code"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    .line 357
    const-string v3, "install_permission_prompted_version_code"

    invoke-interface {v0, v3, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    .line 358
    if-nez p1, :cond_30

    if-lez v1, :cond_30

    if-ne v2, v1, :cond_30

    .line 359
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string p1, "install permission prompt already shown version="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "update"

    invoke-static {p1, p0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 361
    return-void

    .line 363
    :cond_30
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    .line 364
    invoke-interface {p1, v3, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    .line 365
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 366
    invoke-static {p0}, Lcom/trueaxis/modmenu/UpdateManager;->promptInstallPermission(Landroid/app/Activity;)V

    .line 367
    return-void
.end method

.method private static prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .registers 3

    .line 462
    const-string v0, "jcs_mod_update"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    return-object p0
.end method

.method private static promptInstallPermission(Landroid/app/Activity;)V
    .registers 3

    .line 381
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 382
    const-string v1, "Allow YCS2 updates"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 383
    const-string v1, "Android needs permission for this app to install downloaded APK updates. After enabling it, return here and tap Check for updates."

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lcom/trueaxis/modmenu/UpdateManager$6;

    invoke-direct {v1, p0}, Lcom/trueaxis/modmenu/UpdateManager$6;-><init>(Landroid/app/Activity;)V

    .line 385
    const-string p0, "Open settings"

    invoke-virtual {v0, p0, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    .line 398
    const-string v0, "Later"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    .line 399
    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 400
    return-void
.end method

.method private static readString(Ljava/io/InputStream;)Ljava/lang/String;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 427
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v1, Ljava/io/InputStreamReader;

    const-string v2, "UTF-8"

    invoke-direct {v1, p0, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v0, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 428
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 429
    const/16 v1, 0x1000

    new-array v1, v1, [C

    .line 431
    :goto_15
    invoke-virtual {v0, v1}, Ljava/io/BufferedReader;->read([C)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_31

    .line 432
    const/4 v3, 0x0

    invoke-virtual {p0, v1, v3, v2}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 433
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    const/high16 v3, 0x10000

    if-gt v2, v3, :cond_29

    goto :goto_15

    .line 434
    :cond_29
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "Update manifest is too large"

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 437
    :cond_31
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static readable(Ljava/lang/Throwable;)Ljava/lang/String;
    .registers 3

    .line 456
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    .line 457
    if-eqz v0, :cond_e

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_d

    goto :goto_e

    .line 458
    :cond_d
    goto :goto_16

    :cond_e
    :goto_e
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    .line 457
    :goto_16
    return-object v0
.end method

.method private static recordUpdateDismissed(Landroid/content/Context;Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;)V
    .registers 4

    .line 164
    invoke-static {p0}, Lcom/trueaxis/modmenu/UpdateManager;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    iget v0, p1, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->versionCode:I

    .line 165
    const-string v1, "dismissed_version_code"

    invoke-interface {p0, v1, v0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 166
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 167
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "update prompt dismissed version="

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    iget-object v0, p1, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->versionName:Ljava/lang/String;

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, " code="

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    iget p1, p1, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->versionCode:I

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "update"

    invoke-static {p1, p0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 169
    return-void
.end method

.method private static registerDownloadReceiver(Landroid/app/Activity;J)V
    .registers 4

    .line 242
    new-instance v0, Lcom/trueaxis/modmenu/UpdateManager$5;

    invoke-direct {v0, p1, p2, p0}, Lcom/trueaxis/modmenu/UpdateManager$5;-><init>(JLandroid/app/Activity;)V

    .line 255
    :try_start_5
    new-instance p1, Landroid/content/IntentFilter;

    const-string p2, "android.intent.action.DOWNLOAD_COMPLETE"

    invoke-direct {p1, p2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0, p1}, Landroid/app/Activity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;
    :try_end_f
    .catchall {:try_start_5 .. :try_end_f} :catchall_10

    .line 259
    goto :goto_18

    .line 257
    :catchall_10
    move-exception p0

    .line 258
    const-string p1, "update"

    const-string p2, "download receiver registration failed"

    invoke-static {p1, p2, p0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 260
    :goto_18
    return-void
.end method

.method private static resumePendingInstall(Landroid/app/Activity;Z)Z
    .registers 7

    .line 263
    invoke-static {p0}, Lcom/trueaxis/modmenu/UpdateManager;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "download_id"

    const-wide/16 v2, -0x1

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    .line 264
    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-gez v4, :cond_14

    const/4 p0, 0x0

    return p0

    .line 265
    :cond_14
    invoke-static {p0, v0, v1, p1}, Lcom/trueaxis/modmenu/UpdateManager;->installDownloadedApk(Landroid/app/Activity;JZ)Z

    move-result p0

    return p0
.end method

.method private static runOnUi(Landroid/app/Activity;Ljava/lang/Runnable;)V
    .registers 3

    .line 476
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    .line 477
    :cond_7
    invoke-virtual {p0, p1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 478
    return-void
.end method

.method private static sha256(Landroid/app/DownloadManager;J)Ljava/lang/String;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 403
    nop

    .line 404
    nop

    .line 406
    const/4 v0, 0x0

    :try_start_3
    invoke-virtual {p0, p1, p2}, Landroid/app/DownloadManager;->openDownloadedFile(J)Landroid/os/ParcelFileDescriptor;

    move-result-object p0
    :try_end_7
    .catchall {:try_start_3 .. :try_end_7} :catchall_3e

    .line 407
    :try_start_7
    new-instance p1, Ljava/io/FileInputStream;

    invoke-virtual {p0}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/io/FileInputStream;-><init>(Ljava/io/FileDescriptor;)V
    :try_end_10
    .catchall {:try_start_7 .. :try_end_10} :catchall_3c

    .line 408
    :try_start_10
    const-string p2, "SHA-256"

    invoke-static {p2}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object p2

    .line 409
    const/high16 v0, 0x10000

    new-array v0, v0, [B

    .line 411
    :goto_1a
    invoke-virtual {p1, v0}, Ljava/io/FileInputStream;->read([B)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_26

    .line 412
    const/4 v2, 0x0

    invoke-virtual {p2, v0, v2, v1}, Ljava/security/MessageDigest;->update([BII)V

    goto :goto_1a

    .line 414
    :cond_26
    invoke-virtual {p2}, Ljava/security/MessageDigest;->digest()[B

    move-result-object p2

    invoke-static {p2}, Lcom/trueaxis/modmenu/UpdateManager;->hex([B)Ljava/lang/String;

    move-result-object p2
    :try_end_2e
    .catchall {:try_start_10 .. :try_end_2e} :catchall_39

    .line 416
    invoke-static {p1}, Lcom/trueaxis/modmenu/UpdateManager;->closeQuietly(Ljava/io/Closeable;)V

    .line 417
    if-eqz p0, :cond_38

    .line 419
    :try_start_33
    invoke-virtual {p0}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_36
    .catchall {:try_start_33 .. :try_end_36} :catchall_37

    .line 421
    goto :goto_38

    .line 420
    :catchall_37
    move-exception p0

    .line 414
    :cond_38
    :goto_38
    return-object p2

    .line 416
    :catchall_39
    move-exception p2

    move-object v0, p1

    goto :goto_40

    :catchall_3c
    move-exception p2

    goto :goto_40

    :catchall_3e
    move-exception p2

    move-object p0, v0

    :goto_40
    invoke-static {v0}, Lcom/trueaxis/modmenu/UpdateManager;->closeQuietly(Ljava/io/Closeable;)V

    .line 417
    if-eqz p0, :cond_4a

    .line 419
    :try_start_45
    invoke-virtual {p0}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_48
    .catchall {:try_start_45 .. :try_end_48} :catchall_49

    .line 421
    goto :goto_4a

    .line 420
    :catchall_49
    move-exception p0

    .line 423
    :cond_4a
    :goto_4a
    goto :goto_4c

    :goto_4b
    throw p2

    :goto_4c
    goto :goto_4b
.end method

.method private static shouldSuppressUpdatePrompt(Landroid/content/Context;Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;)Z
    .registers 10

    .line 154
    invoke-static {p0}, Lcom/trueaxis/modmenu/UpdateManager;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 155
    const-string v0, "dismissed_version_code"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    iget v2, p1, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->versionCode:I

    const/4 v3, 0x1

    if-ne v0, v2, :cond_11

    .line 156
    return v3

    .line 158
    :cond_11
    const-string v0, "download_id"

    const-wide/16 v4, -0x1

    invoke-interface {p0, v0, v4, v5}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v4

    .line 159
    const-string v0, "download_version_code"

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    .line 160
    const-wide/16 v6, 0x0

    cmp-long v0, v4, v6

    if-ltz v0, :cond_2a

    iget p1, p1, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->versionCode:I

    if-lt p0, p1, :cond_2a

    const/4 v1, 0x1

    :cond_2a
    return v1
.end method

.method private static showUpdateAvailable(Landroid/app/Activity;Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;Landroid/content/pm/PackageInfo;)V
    .registers 8

    .line 128
    iget-wide v0, p1, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->apkSize:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-lez v4, :cond_22

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\nSize: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p1, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->apkSize:J

    invoke-static {v1, v2}, Lcom/trueaxis/modmenu/UpdateManager;->formatBytes(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_24

    :cond_22
    const-string v0, ""

    .line 129
    :goto_24
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 130
    const-string v2, "Update available"

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Installed: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p2, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget p2, p2, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v2, ")\nLatest: "

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    iget-object v2, p1, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->versionName:Ljava/lang/String;

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    iget v2, p1, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->versionCode:I

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v2, ")"

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v0, "\n\nThe APK will download now, then Android will ask you to approve installing it."

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 131
    invoke-virtual {v1, p2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    new-instance v0, Lcom/trueaxis/modmenu/UpdateManager$4;

    invoke-direct {v0, p0, p1}, Lcom/trueaxis/modmenu/UpdateManager$4;-><init>(Landroid/app/Activity;Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;)V

    .line 135
    const-string v1, "Download update"

    invoke-virtual {p2, v1, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    new-instance v0, Lcom/trueaxis/modmenu/UpdateManager$3;

    invoke-direct {v0, p0, p1}, Lcom/trueaxis/modmenu/UpdateManager$3;-><init>(Landroid/app/Activity;Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;)V

    .line 140
    const-string v1, "Later"

    invoke-virtual {p2, v1, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    new-instance v0, Lcom/trueaxis/modmenu/UpdateManager$2;

    invoke-direct {v0, p0, p1}, Lcom/trueaxis/modmenu/UpdateManager$2;-><init>(Landroid/app/Activity;Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;)V

    .line 145
    invoke-virtual {p2, v0}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    .line 150
    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 151
    return-void
.end method

.method private static startDownload(Landroid/app/Activity;Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;)V
    .registers 8

    .line 210
    const-string v0, "update"

    :try_start_2
    const-string v1, "download"

    invoke-virtual {p0, v1}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/DownloadManager;

    .line 211
    if-eqz v1, :cond_be

    .line 212
    new-instance v2, Landroid/app/DownloadManager$Request;

    iget-object v3, p1, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->apkUrl:Ljava/lang/String;

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/app/DownloadManager$Request;-><init>(Landroid/net/Uri;)V

    .line 213
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "YCS2 update "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p1, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->versionName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/app/DownloadManager$Request;->setTitle(Ljava/lang/CharSequence;)Landroid/app/DownloadManager$Request;

    .line 214
    iget-object v3, p1, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->apkName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/app/DownloadManager$Request;->setDescription(Ljava/lang/CharSequence;)Landroid/app/DownloadManager$Request;

    .line 215
    const-string v3, "application/vnd.android.package-archive"

    invoke-virtual {v2, v3}, Landroid/app/DownloadManager$Request;->setMimeType(Ljava/lang/String;)Landroid/app/DownloadManager$Request;

    .line 216
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/app/DownloadManager$Request;->setNotificationVisibility(I)Landroid/app/DownloadManager$Request;

    .line 218
    invoke-virtual {v2, v3}, Landroid/app/DownloadManager$Request;->setAllowedOverRoaming(Z)Landroid/app/DownloadManager$Request;

    .line 219
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x10

    if-lt v4, v5, :cond_49

    invoke-virtual {v2, v3}, Landroid/app/DownloadManager$Request;->setAllowedOverMetered(Z)Landroid/app/DownloadManager$Request;

    .line 220
    :cond_49
    sget-object v3, Landroid/os/Environment;->DIRECTORY_DOWNLOADS:Ljava/lang/String;

    iget-object v4, p1, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->apkName:Ljava/lang/String;

    invoke-virtual {v2, p0, v3, v4}, Landroid/app/DownloadManager$Request;->setDestinationInExternalFilesDir(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/app/DownloadManager$Request;

    .line 222
    invoke-virtual {v1, v2}, Landroid/app/DownloadManager;->enqueue(Landroid/app/DownloadManager$Request;)J

    move-result-wide v1

    .line 223
    invoke-static {p0}, Lcom/trueaxis/modmenu/UpdateManager;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    const-string v4, "download_id"

    .line 224
    invoke-interface {v3, v4, v1, v2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    const-string v4, "download_sha256"

    iget-object v5, p1, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->apkSha256:Ljava/lang/String;

    .line 225
    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    const-string v4, "download_version_code"

    iget v5, p1, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->versionCode:I

    .line 226
    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    const-string v4, "dismissed_version_code"

    .line 227
    invoke-interface {v3, v4}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    const-string v4, "install_prompted_download_id"

    .line 228
    invoke-interface {v3, v4}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    const-string v4, "install_permission_prompted_version_code"

    .line 229
    invoke-interface {v3, v4}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    .line 230
    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 231
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "download started id="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " version="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p1, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->versionName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " url="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object p1, p1, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->apkUrl:Ljava/lang/String;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 233
    const-string p1, "Downloading update. The installer will open when it finishes."

    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/UpdateManager;->toast(Landroid/content/Context;Ljava/lang/String;)V

    .line 234
    invoke-static {p0, v1, v2}, Lcom/trueaxis/modmenu/UpdateManager;->registerDownloadReceiver(Landroid/app/Activity;J)V

    .line 238
    goto :goto_e6

    .line 211
    :cond_be
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v1, "Download manager is unavailable"

    invoke-direct {p1, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_c6
    .catchall {:try_start_2 .. :try_end_c6} :catchall_c6

    .line 235
    :catchall_c6
    move-exception p1

    .line 236
    const-string v1, "download start failed"

    invoke-static {v0, v1, p1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 237
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Could not start update download: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p1}, Lcom/trueaxis/modmenu/UpdateManager;->readable(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/UpdateManager;->toast(Landroid/content/Context;Ljava/lang/String;)V

    .line 239
    :goto_e6
    return-void
.end method

.method private static toast(Landroid/content/Context;Ljava/lang/String;)V
    .registers 3

    .line 481
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 482
    return-void
.end method
