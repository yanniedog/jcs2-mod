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

.field private static final K_DOWNLOAD_ID:Ljava/lang/String; = "download_id"

.field private static final K_DOWNLOAD_SHA256:Ljava/lang/String; = "download_sha256"

.field private static final K_DOWNLOAD_VERSION_CODE:Ljava/lang/String; = "download_version_code"

.field private static final K_LAST_CHECK_MS:Ljava/lang/String; = "last_check_ms"

.field private static final MAX_MANIFEST_CHARS:I = 0x10000

.field private static final PREFS:Ljava/lang/String; = "jcs_mod_update"

.field private static final UPDATE_MANIFEST_URL:Ljava/lang/String; = "https://github.com/yanniedog/jcs2-mod/releases/latest/download/jcs2-update.json"

.field private static checking:Z


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
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

.method static synthetic access$100(Landroid/app/Activity;Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;Landroid/content/pm/PackageInfo;)V
    .registers 3

    .line 40
    invoke-static {p0, p1, p2}, Lcom/trueaxis/modmenu/UpdateManager;->showUpdateAvailable(Landroid/app/Activity;Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;Landroid/content/pm/PackageInfo;)V

    return-void
.end method

.method static synthetic access$200(Landroid/app/Activity;Ljava/lang/Runnable;)V
    .registers 2

    .line 40
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/UpdateManager;->runOnUi(Landroid/app/Activity;Ljava/lang/Runnable;)V

    return-void
.end method

.method static synthetic access$300(Landroid/content/Context;Ljava/lang/String;)V
    .registers 2

    .line 40
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/UpdateManager;->toast(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$400(Ljava/lang/Throwable;)Ljava/lang/String;
    .registers 1

    .line 40
    invoke-static {p0}, Lcom/trueaxis/modmenu/UpdateManager;->readable(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$502(Z)Z
    .registers 1

    .line 40
    sput-boolean p0, Lcom/trueaxis/modmenu/UpdateManager;->checking:Z

    return p0
.end method

.method static synthetic access$600(Landroid/app/Activity;Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;)V
    .registers 2

    .line 40
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/UpdateManager;->startDownload(Landroid/app/Activity;Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;)V

    return-void
.end method

.method static synthetic access$800(Landroid/app/Activity;JZ)V
    .registers 4

    .line 40
    invoke-static {p0, p1, p2, p3}, Lcom/trueaxis/modmenu/UpdateManager;->installDownloadedApk(Landroid/app/Activity;JZ)V

    return-void
.end method

.method private static canInstallPackages(Landroid/content/Context;)Z
    .registers 6

    .line 286
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    const/4 v2, 0x1

    if-ge v0, v1, :cond_8

    return v2

    .line 288
    :cond_8
    :try_start_8
    const-class v0, Landroid/content/pm/PackageManager;

    const-string v1, "canRequestPackageInstalls"

    const/4 v3, 0x0

    new-array v4, v3, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 289
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0

    new-array v1, v3, [Ljava/lang/Object;

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .line 290
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0, p0}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result p0
    :try_end_23
    .catchall {:try_start_8 .. :try_end_23} :catchall_24

    return p0

    .line 291
    :catchall_24
    move-exception p0

    .line 292
    return v2
.end method

.method private static checkForUpdates(Landroid/app/Activity;Z)V
    .registers 6

    .line 70
    sget-boolean v0, Lcom/trueaxis/modmenu/UpdateManager;->checking:Z

    if-eqz v0, :cond_c

    .line 71
    if-eqz p1, :cond_b

    const-string p1, "Update check is already running."

    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/UpdateManager;->toast(Landroid/content/Context;Ljava/lang/String;)V

    .line 72
    :cond_b
    return-void

    .line 74
    :cond_c
    const/4 v0, 0x1

    sput-boolean v0, Lcom/trueaxis/modmenu/UpdateManager;->checking:Z

    .line 75
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

    .line 76
    if-eqz p1, :cond_2b

    const-string v0, "Checking for updates..."

    invoke-static {p0, v0}, Lcom/trueaxis/modmenu/UpdateManager;->toast(Landroid/content/Context;Ljava/lang/String;)V

    .line 77
    :cond_2b
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/trueaxis/modmenu/UpdateManager$1;

    invoke-direct {v1, p0, p1}, Lcom/trueaxis/modmenu/UpdateManager$1;-><init>(Landroid/app/Activity;Z)V

    const-string p0, "YCS2UpdateCheck"

    invoke-direct {v0, v1, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 113
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 114
    return-void
.end method

.method public static checkNow(Landroid/app/Activity;)V
    .registers 2

    .line 65
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lcom/trueaxis/modmenu/UpdateManager;->resumePendingInstall(Landroid/app/Activity;Z)V

    .line 66
    invoke-static {p0, v0}, Lcom/trueaxis/modmenu/UpdateManager;->checkForUpdates(Landroid/app/Activity;Z)V

    .line 67
    return-void
.end method

.method public static checkSilently(Landroid/app/Activity;)V
    .registers 8

    .line 57
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/trueaxis/modmenu/UpdateManager;->resumePendingInstall(Landroid/app/Activity;Z)V

    .line 58
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    .line 59
    invoke-static {p0}, Lcom/trueaxis/modmenu/UpdateManager;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    const-string v4, "last_check_ms"

    const-wide/16 v5, 0x0

    invoke-interface {v3, v4, v5, v6}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v3

    .line 60
    sub-long/2addr v1, v3

    const-wide/32 v3, 0x2932e00

    cmp-long v5, v1, v3

    if-gez v5, :cond_1d

    return-void

    .line 61
    :cond_1d
    invoke-static {p0, v0}, Lcom/trueaxis/modmenu/UpdateManager;->checkForUpdates(Landroid/app/Activity;Z)V

    .line 62
    return-void
.end method

.method private static clearDownload(Landroid/content/Context;)V
    .registers 2

    .line 382
    invoke-static {p0}, Lcom/trueaxis/modmenu/UpdateManager;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 383
    const-string v0, "download_id"

    invoke-interface {p0, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 384
    const-string v0, "download_sha256"

    invoke-interface {p0, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 385
    const-string v0, "download_version_code"

    invoke-interface {p0, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 386
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 387
    return-void
.end method

.method private static closeQuietly(Ljava/io/Closeable;)V
    .registers 1

    .line 399
    if-nez p0, :cond_3

    return-void

    .line 401
    :cond_3
    :try_start_3
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_6
    .catchall {:try_start_3 .. :try_end_6} :catchall_7

    .line 403
    goto :goto_8

    .line 402
    :catchall_7
    move-exception p0

    .line 404
    :goto_8
    return-void
.end method

.method private static fetchUpdateInfo()Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 136
    const-string v0, ""

    new-instance v1, Ljava/net/URL;

    const-string v2, "https://github.com/yanniedog/jcs2-mod/releases/latest/download/jcs2-update.json"

    invoke-direct {v1, v2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 137
    invoke-virtual {v1}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v1

    check-cast v1, Ljava/net/HttpURLConnection;

    .line 138
    const/16 v2, 0x2710

    invoke-virtual {v1, v2}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 139
    const/16 v2, 0x4e20

    invoke-virtual {v1, v2}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 140
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/net/HttpURLConnection;->setUseCaches(Z)V

    .line 141
    const-string v3, "Accept"

    const-string v4, "application/json"

    invoke-virtual {v1, v3, v4}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 142
    const-string v3, "User-Agent"

    const-string v4, "YCS2ModUpdater/1.0"

    invoke-virtual {v1, v3, v4}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 143
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v3

    .line 144
    const/16 v4, 0xc8

    if-lt v3, v4, :cond_be

    const/16 v4, 0x12c

    if-ge v3, v4, :cond_be

    .line 147
    nop

    .line 149
    const/4 v3, 0x0

    :try_start_39
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v4
    :try_end_3d
    .catchall {:try_start_39 .. :try_end_3d} :catchall_b6

    .line 150
    :try_start_3d
    new-instance v5, Lorg/json/JSONObject;

    invoke-static {v4}, Lcom/trueaxis/modmenu/UpdateManager;->readString(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 151
    new-instance v6, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;

    invoke-direct {v6, v3}, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;-><init>(Lcom/trueaxis/modmenu/UpdateManager$1;)V

    .line 152
    const-string v3, "package_name"

    invoke-virtual {v5, v3, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v6, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->packageName:Ljava/lang/String;

    .line 153
    const-string v3, "version_code"

    invoke-virtual {v5, v3, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v2

    iput v2, v6, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->versionCode:I

    .line 154
    const-string v2, "version_name"

    invoke-virtual {v5, v2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v6, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->versionName:Ljava/lang/String;

    .line 155
    const-string v2, "apk_name"

    const-string v3, "jcs2-update.apk"

    invoke-virtual {v5, v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v6, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->apkName:Ljava/lang/String;

    .line 156
    const-string v2, "apk_url"

    invoke-virtual {v5, v2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v6, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->apkUrl:Ljava/lang/String;

    .line 157
    const-string v2, "apk_sha256"

    invoke-virtual {v5, v2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v6, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->apkSha256:Ljava/lang/String;

    .line 158
    const-string v0, "apk_size"

    const-wide/16 v2, 0x0

    invoke-virtual {v5, v0, v2, v3}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v2

    iput-wide v2, v6, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->apkSize:J

    .line 159
    iget-object v0, v6, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_ab

    iget v0, v6, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->versionCode:I

    if-lez v0, :cond_ab

    iget-object v0, v6, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->versionName:Ljava/lang/String;

    .line 161
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_ab

    iget-object v0, v6, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->apkUrl:Ljava/lang/String;

    .line 162
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0
    :try_end_a1
    .catchall {:try_start_3d .. :try_end_a1} :catchall_b3

    if-eqz v0, :cond_ab

    .line 165
    nop

    .line 167
    invoke-static {v4}, Lcom/trueaxis/modmenu/UpdateManager;->closeQuietly(Ljava/io/Closeable;)V

    .line 168
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 165
    return-object v6

    .line 163
    :cond_ab
    :try_start_ab
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v2, "Update manifest is incomplete"

    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_b3
    .catchall {:try_start_ab .. :try_end_b3} :catchall_b3

    .line 167
    :catchall_b3
    move-exception v0

    move-object v3, v4

    goto :goto_b7

    :catchall_b6
    move-exception v0

    :goto_b7
    invoke-static {v3}, Lcom/trueaxis/modmenu/UpdateManager;->closeQuietly(Ljava/io/Closeable;)V

    .line 168
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 169
    throw v0

    .line 145
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

    .line 367
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

    .line 368
    :cond_1e
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    long-to-double p0, p0

    const-wide/high16 v1, 0x4090000000000000L    # 1024.0

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

    .line 357
    new-instance v0, Ljava/lang/StringBuilder;

    array-length v1, p0

    mul-int/lit8 v1, v1, 0x2

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 358
    const/4 v1, 0x0

    :goto_9
    array-length v2, p0

    if-ge v1, v2, :cond_23

    .line 359
    aget-byte v2, p0, v1

    and-int/lit16 v2, v2, 0xff

    .line 360
    const/16 v3, 0x10

    if-ge v2, v3, :cond_19

    const/16 v3, 0x30

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 361
    :cond_19
    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 358
    add-int/lit8 v1, v1, 0x1

    goto :goto_9

    .line 363
    :cond_23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static installDownloadedApk(Landroid/app/Activity;JZ)V
    .registers 12

    .line 232
    const-string v0, "update"

    const-string v1, "download"

    invoke-virtual {p0, v1}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/DownloadManager;

    .line 233
    if-nez v1, :cond_d

    return-void

    .line 234
    :cond_d
    nop

    .line 236
    const/4 v2, 0x0

    :try_start_f
    new-instance v3, Landroid/app/DownloadManager$Query;

    invoke-direct {v3}, Landroid/app/DownloadManager$Query;-><init>()V

    const/4 v4, 0x1

    new-array v5, v4, [J

    const/4 v6, 0x0

    aput-wide p1, v5, v6

    invoke-virtual {v3, v5}, Landroid/app/DownloadManager$Query;->setFilterById([J)Landroid/app/DownloadManager$Query;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/app/DownloadManager;->query(Landroid/app/DownloadManager$Query;)Landroid/database/Cursor;

    move-result-object v2

    .line 237
    if-eqz v2, :cond_ff

    invoke-interface {v2}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v3

    if-nez v3, :cond_2c

    goto/16 :goto_ff

    .line 241
    :cond_2c
    const-string v3, "status"

    invoke-interface {v2, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v2, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    .line 242
    if-eq v3, v4, :cond_f2

    const/4 v5, 0x4

    if-eq v3, v5, :cond_f2

    const/4 v5, 0x2

    if-ne v3, v5, :cond_40

    goto/16 :goto_f2

    .line 248
    :cond_40
    const/16 v5, 0x8

    if-eq v3, v5, :cond_54

    .line 249
    invoke-static {p0}, Lcom/trueaxis/modmenu/UpdateManager;->clearDownload(Landroid/content/Context;)V

    .line 250
    if-eqz p3, :cond_4e

    const-string p1, "Update download failed. Please try again."

    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/UpdateManager;->toast(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_4e
    .catchall {:try_start_f .. :try_end_4e} :catchall_108

    .line 281
    :cond_4e
    if-eqz v2, :cond_53

    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 251
    :cond_53
    return-void

    .line 253
    :cond_54
    :try_start_54
    invoke-static {p0}, Lcom/trueaxis/modmenu/UpdateManager;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    const-string v5, "download_sha256"

    const-string v7, ""

    invoke-interface {v3, v5, v7}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 254
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_a5

    .line 255
    invoke-static {v1, p1, p2}, Lcom/trueaxis/modmenu/UpdateManager;->sha256(Landroid/app/DownloadManager;J)Ljava/lang/String;

    move-result-object v5

    .line 256
    invoke-virtual {v3, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_a5

    .line 257
    new-array v4, v4, [J

    aput-wide p1, v4, v6

    invoke-virtual {v1, v4}, Landroid/app/DownloadManager;->remove([J)I

    .line 258
    invoke-static {p0}, Lcom/trueaxis/modmenu/UpdateManager;->clearDownload(Landroid/content/Context;)V

    .line 259
    const-string p1, "Downloaded update did not match its checksum."

    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/UpdateManager;->toast(Landroid/content/Context;Ljava/lang/String;)V

    .line 260
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "checksum mismatch expected="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " actual="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_9f
    .catchall {:try_start_54 .. :try_end_9f} :catchall_108

    .line 281
    if-eqz v2, :cond_a4

    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 262
    :cond_a4
    return-void

    .line 265
    :cond_a5
    :try_start_a5
    invoke-static {p0}, Lcom/trueaxis/modmenu/UpdateManager;->canInstallPackages(Landroid/content/Context;)Z

    move-result v3

    if-nez v3, :cond_b4

    .line 266
    invoke-static {p0}, Lcom/trueaxis/modmenu/UpdateManager;->promptInstallPermission(Landroid/app/Activity;)V
    :try_end_ae
    .catchall {:try_start_a5 .. :try_end_ae} :catchall_108

    .line 281
    if-eqz v2, :cond_b3

    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 267
    :cond_b3
    return-void

    .line 269
    :cond_b4
    :try_start_b4
    invoke-virtual {v1, p1, p2}, Landroid/app/DownloadManager;->getUriForDownloadedFile(J)Landroid/net/Uri;

    move-result-object v1

    .line 270
    if-eqz v1, :cond_ea

    .line 271
    new-instance v3, Landroid/content/Intent;

    const-string v5, "android.intent.action.VIEW"

    invoke-direct {v3, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 272
    const-string v5, "application/vnd.android.package-archive"

    invoke-virtual {v3, v1, v5}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 273
    invoke-virtual {v3, v4}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 274
    const/high16 v1, 0x10000000

    invoke-virtual {v3, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 275
    invoke-virtual {p0, v3}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 276
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "installer opened for download id="

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 281
    if-eqz v2, :cond_12f

    goto :goto_12c

    .line 270
    :cond_ea
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Downloaded APK URI unavailable"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 245
    :cond_f2
    :goto_f2
    if-eqz p3, :cond_f9

    const-string p1, "Update download is still in progress."

    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/UpdateManager;->toast(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_f9
    .catchall {:try_start_b4 .. :try_end_f9} :catchall_108

    .line 281
    :cond_f9
    if-eqz v2, :cond_fe

    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 246
    :cond_fe
    return-void

    .line 238
    :cond_ff
    :goto_ff
    :try_start_ff
    invoke-static {p0}, Lcom/trueaxis/modmenu/UpdateManager;->clearDownload(Landroid/content/Context;)V
    :try_end_102
    .catchall {:try_start_ff .. :try_end_102} :catchall_108

    .line 281
    if-eqz v2, :cond_107

    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 239
    :cond_107
    return-void

    .line 277
    :catchall_108
    move-exception p1

    .line 278
    :try_start_109
    const-string p2, "install downloaded apk failed"

    invoke-static {v0, p2, p1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 279
    if-eqz p3, :cond_12a

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
    :try_end_12a
    .catchall {:try_start_109 .. :try_end_12a} :catchall_130

    .line 281
    :cond_12a
    if-eqz v2, :cond_12f

    :goto_12c
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 283
    :cond_12f
    return-void

    .line 281
    :catchall_130
    move-exception p0

    if-eqz v2, :cond_136

    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 282
    :cond_136
    throw p0
.end method

.method private static prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .registers 3

    .line 378
    const-string v0, "jcs_mod_update"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    return-object p0
.end method

.method private static promptInstallPermission(Landroid/app/Activity;)V
    .registers 3

    .line 297
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 298
    const-string v1, "Allow YCS2 updates"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 299
    const-string v1, "Android needs permission for this app to install downloaded APK updates. After enabling it, return here and tap Check for updates."

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lcom/trueaxis/modmenu/UpdateManager$4;

    invoke-direct {v1, p0}, Lcom/trueaxis/modmenu/UpdateManager$4;-><init>(Landroid/app/Activity;)V

    .line 301
    const-string p0, "Open settings"

    invoke-virtual {v0, p0, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    .line 314
    const-string v0, "Later"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    .line 315
    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 316
    return-void
.end method

.method private static readString(Ljava/io/InputStream;)Ljava/lang/String;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 343
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v1, Ljava/io/InputStreamReader;

    const-string v2, "UTF-8"

    invoke-direct {v1, p0, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v0, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 344
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 345
    const/16 v1, 0x1000

    new-array v1, v1, [C

    .line 347
    :goto_15
    invoke-virtual {v0, v1}, Ljava/io/BufferedReader;->read([C)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_31

    .line 348
    const/4 v3, 0x0

    invoke-virtual {p0, v1, v3, v2}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 349
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    const/high16 v3, 0x10000

    if-gt v2, v3, :cond_29

    goto :goto_15

    .line 350
    :cond_29
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "Update manifest is too large"

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 353
    :cond_31
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static readable(Ljava/lang/Throwable;)Ljava/lang/String;
    .registers 3

    .line 372
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    .line 373
    if-eqz v0, :cond_e

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_d

    goto :goto_e

    .line 374
    :cond_d
    goto :goto_16

    :cond_e
    :goto_e
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    .line 373
    :goto_16
    return-object v0
.end method

.method private static registerDownloadReceiver(Landroid/app/Activity;J)V
    .registers 4

    .line 203
    new-instance v0, Lcom/trueaxis/modmenu/UpdateManager$3;

    invoke-direct {v0, p1, p2, p0}, Lcom/trueaxis/modmenu/UpdateManager$3;-><init>(JLandroid/app/Activity;)V

    .line 216
    :try_start_5
    new-instance p1, Landroid/content/IntentFilter;

    const-string p2, "android.intent.action.DOWNLOAD_COMPLETE"

    invoke-direct {p1, p2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0, p1}, Landroid/app/Activity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;
    :try_end_f
    .catchall {:try_start_5 .. :try_end_f} :catchall_10

    .line 220
    goto :goto_18

    .line 218
    :catchall_10
    move-exception p0

    .line 219
    const-string p1, "update"

    const-string p2, "download receiver registration failed"

    invoke-static {p1, p2, p0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 221
    :goto_18
    return-void
.end method

.method private static resumePendingInstall(Landroid/app/Activity;Z)V
    .registers 7

    .line 224
    invoke-static {p0}, Lcom/trueaxis/modmenu/UpdateManager;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "download_id"

    const-wide/16 v2, -0x1

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    .line 225
    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-gez v4, :cond_13

    return-void

    .line 226
    :cond_13
    invoke-static {p0, v0, v1, p1}, Lcom/trueaxis/modmenu/UpdateManager;->installDownloadedApk(Landroid/app/Activity;JZ)V

    .line 227
    return-void
.end method

.method private static runOnUi(Landroid/app/Activity;Ljava/lang/Runnable;)V
    .registers 3

    .line 390
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    .line 391
    :cond_7
    invoke-virtual {p0, p1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 392
    return-void
.end method

.method private static sha256(Landroid/app/DownloadManager;J)Ljava/lang/String;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 319
    nop

    .line 320
    nop

    .line 322
    const/4 v0, 0x0

    :try_start_3
    invoke-virtual {p0, p1, p2}, Landroid/app/DownloadManager;->openDownloadedFile(J)Landroid/os/ParcelFileDescriptor;

    move-result-object p0
    :try_end_7
    .catchall {:try_start_3 .. :try_end_7} :catchall_3e

    .line 323
    :try_start_7
    new-instance p1, Ljava/io/FileInputStream;

    invoke-virtual {p0}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/io/FileInputStream;-><init>(Ljava/io/FileDescriptor;)V
    :try_end_10
    .catchall {:try_start_7 .. :try_end_10} :catchall_3c

    .line 324
    :try_start_10
    const-string p2, "SHA-256"

    invoke-static {p2}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object p2

    .line 325
    const/high16 v0, 0x10000

    new-array v0, v0, [B

    .line 327
    :goto_1a
    invoke-virtual {p1, v0}, Ljava/io/FileInputStream;->read([B)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_26

    .line 328
    const/4 v2, 0x0

    invoke-virtual {p2, v0, v2, v1}, Ljava/security/MessageDigest;->update([BII)V

    goto :goto_1a

    .line 330
    :cond_26
    invoke-virtual {p2}, Ljava/security/MessageDigest;->digest()[B

    move-result-object p2

    invoke-static {p2}, Lcom/trueaxis/modmenu/UpdateManager;->hex([B)Ljava/lang/String;

    move-result-object p2
    :try_end_2e
    .catchall {:try_start_10 .. :try_end_2e} :catchall_39

    .line 332
    invoke-static {p1}, Lcom/trueaxis/modmenu/UpdateManager;->closeQuietly(Ljava/io/Closeable;)V

    .line 333
    if-eqz p0, :cond_38

    .line 335
    :try_start_33
    invoke-virtual {p0}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_36
    .catchall {:try_start_33 .. :try_end_36} :catchall_37

    .line 337
    goto :goto_38

    .line 336
    :catchall_37
    move-exception p0

    .line 330
    :cond_38
    :goto_38
    return-object p2

    .line 332
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

    .line 333
    if-eqz p0, :cond_4a

    .line 335
    :try_start_45
    invoke-virtual {p0}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_48
    .catchall {:try_start_45 .. :try_end_48} :catchall_49

    .line 337
    goto :goto_4a

    .line 336
    :catchall_49
    move-exception p0

    .line 339
    :cond_4a
    :goto_4a
    goto :goto_4c

    :goto_4b
    throw p2

    :goto_4c
    goto :goto_4b
.end method

.method private static showUpdateAvailable(Landroid/app/Activity;Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;Landroid/content/pm/PackageInfo;)V
    .registers 8

    .line 119
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

    .line 120
    :goto_24
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 121
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

    .line 122
    invoke-virtual {v1, p2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    new-instance v0, Lcom/trueaxis/modmenu/UpdateManager$2;

    invoke-direct {v0, p0, p1}, Lcom/trueaxis/modmenu/UpdateManager$2;-><init>(Landroid/app/Activity;Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;)V

    .line 126
    const-string p0, "Download update"

    invoke-virtual {p2, p0, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    .line 131
    const-string p1, "Later"

    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    .line 132
    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 133
    return-void
.end method

.method private static startDownload(Landroid/app/Activity;Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;)V
    .registers 8

    .line 174
    const-string v0, "update"

    :try_start_2
    const-string v1, "download"

    invoke-virtual {p0, v1}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/DownloadManager;

    .line 175
    if-eqz v1, :cond_ac

    .line 176
    new-instance v2, Landroid/app/DownloadManager$Request;

    iget-object v3, p1, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->apkUrl:Ljava/lang/String;

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/app/DownloadManager$Request;-><init>(Landroid/net/Uri;)V

    .line 177
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

    .line 178
    iget-object v3, p1, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->apkName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/app/DownloadManager$Request;->setDescription(Ljava/lang/CharSequence;)Landroid/app/DownloadManager$Request;

    .line 179
    const-string v3, "application/vnd.android.package-archive"

    invoke-virtual {v2, v3}, Landroid/app/DownloadManager$Request;->setMimeType(Ljava/lang/String;)Landroid/app/DownloadManager$Request;

    .line 180
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/app/DownloadManager$Request;->setNotificationVisibility(I)Landroid/app/DownloadManager$Request;

    .line 182
    invoke-virtual {v2, v3}, Landroid/app/DownloadManager$Request;->setAllowedOverRoaming(Z)Landroid/app/DownloadManager$Request;

    .line 183
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x10

    if-lt v4, v5, :cond_49

    invoke-virtual {v2, v3}, Landroid/app/DownloadManager$Request;->setAllowedOverMetered(Z)Landroid/app/DownloadManager$Request;

    .line 184
    :cond_49
    sget-object v3, Landroid/os/Environment;->DIRECTORY_DOWNLOADS:Ljava/lang/String;

    iget-object v4, p1, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->apkName:Ljava/lang/String;

    invoke-virtual {v2, p0, v3, v4}, Landroid/app/DownloadManager$Request;->setDestinationInExternalFilesDir(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/app/DownloadManager$Request;

    .line 186
    invoke-virtual {v1, v2}, Landroid/app/DownloadManager;->enqueue(Landroid/app/DownloadManager$Request;)J

    move-result-wide v1

    .line 187
    invoke-static {p0}, Lcom/trueaxis/modmenu/UpdateManager;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    const-string v4, "download_id"

    .line 188
    invoke-interface {v3, v4, v1, v2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    const-string v4, "download_sha256"

    iget-object v5, p1, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->apkSha256:Ljava/lang/String;

    .line 189
    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    const-string v4, "download_version_code"

    iget v5, p1, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->versionCode:I

    .line 190
    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    .line 191
    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 192
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

    .line 194
    const-string p1, "Downloading update. The installer will open when it finishes."

    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/UpdateManager;->toast(Landroid/content/Context;Ljava/lang/String;)V

    .line 195
    invoke-static {p0, v1, v2}, Lcom/trueaxis/modmenu/UpdateManager;->registerDownloadReceiver(Landroid/app/Activity;J)V

    .line 199
    goto :goto_d4

    .line 175
    :cond_ac
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v1, "Download manager is unavailable"

    invoke-direct {p1, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_b4
    .catchall {:try_start_2 .. :try_end_b4} :catchall_b4

    .line 196
    :catchall_b4
    move-exception p1

    .line 197
    const-string v1, "download start failed"

    invoke-static {v0, v1, p1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 198
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

    .line 200
    :goto_d4
    return-void
.end method

.method private static toast(Landroid/content/Context;Ljava/lang/String;)V
    .registers 3

    .line 395
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 396
    return-void
.end method
