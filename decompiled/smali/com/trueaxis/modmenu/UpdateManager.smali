.class public final Lcom/trueaxis/modmenu/UpdateManager;
.super Ljava/lang/Object;
.source "UpdateManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trueaxis/modmenu/UpdateManager$DownloadProgress;,
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

.field private static final PROGRESS_MAX:I = 0x3e8

.field private static final PROGRESS_POLL_MS:J = 0x1f4L

.field private static final UPDATE_MANIFEST_URL:Ljava/lang/String; = "https://github.com/yanniedog/jcs2-mod/releases/latest/download/jcs2-update.json"

.field private static checking:Z


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    return-void
.end method

.method static synthetic access$000()Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 45
    invoke-static {}, Lcom/trueaxis/modmenu/UpdateManager;->fetchUpdateInfo()Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Landroid/content/Context;Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;)Z
    .registers 2

    .line 45
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/UpdateManager;->shouldSuppressUpdatePrompt(Landroid/content/Context;Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$1000(Landroid/app/Activity;JZ)Z
    .registers 4

    .line 45
    invoke-static {p0, p1, p2, p3}, Lcom/trueaxis/modmenu/UpdateManager;->installDownloadedApk(Landroid/app/Activity;JZ)Z

    move-result p0

    return p0
.end method

.method static synthetic access$1100(Landroid/content/Context;)V
    .registers 1

    .line 45
    invoke-static {p0}, Lcom/trueaxis/modmenu/UpdateManager;->clearDownload(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic access$1200(Landroid/app/DownloadManager;J)Lcom/trueaxis/modmenu/UpdateManager$DownloadProgress;
    .registers 3

    .line 45
    invoke-static {p0, p1, p2}, Lcom/trueaxis/modmenu/UpdateManager;->readDownloadProgress(Landroid/app/DownloadManager;J)Lcom/trueaxis/modmenu/UpdateManager$DownloadProgress;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1300(Landroid/widget/TextView;Landroid/widget/ProgressBar;Lcom/trueaxis/modmenu/UpdateManager$DownloadProgress;)V
    .registers 3

    .line 45
    invoke-static {p0, p1, p2}, Lcom/trueaxis/modmenu/UpdateManager;->updateProgressViews(Landroid/widget/TextView;Landroid/widget/ProgressBar;Lcom/trueaxis/modmenu/UpdateManager$DownloadProgress;)V

    return-void
.end method

.method static synthetic access$200(Landroid/app/Activity;Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;Landroid/content/pm/PackageInfo;)V
    .registers 3

    .line 45
    invoke-static {p0, p1, p2}, Lcom/trueaxis/modmenu/UpdateManager;->showUpdateAvailable(Landroid/app/Activity;Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;Landroid/content/pm/PackageInfo;)V

    return-void
.end method

.method static synthetic access$300(Landroid/app/Activity;Ljava/lang/Runnable;)V
    .registers 2

    .line 45
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/UpdateManager;->runOnUi(Landroid/app/Activity;Ljava/lang/Runnable;)V

    return-void
.end method

.method static synthetic access$400(Landroid/content/Context;Ljava/lang/String;)V
    .registers 2

    .line 45
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/UpdateManager;->toast(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$500(Ljava/lang/Throwable;)Ljava/lang/String;
    .registers 1

    .line 45
    invoke-static {p0}, Lcom/trueaxis/modmenu/UpdateManager;->readable(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$602(Z)Z
    .registers 1

    .line 45
    sput-boolean p0, Lcom/trueaxis/modmenu/UpdateManager;->checking:Z

    return p0
.end method

.method static synthetic access$700(Landroid/content/Context;Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;)V
    .registers 2

    .line 45
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/UpdateManager;->recordUpdateDismissed(Landroid/content/Context;Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;)V

    return-void
.end method

.method static synthetic access$800(Landroid/app/Activity;Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;)V
    .registers 2

    .line 45
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/UpdateManager;->startDownload(Landroid/app/Activity;Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;)V

    return-void
.end method

.method private static canInstallPackages(Landroid/content/Context;)Z
    .registers 6

    .line 521
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    const/4 v2, 0x1

    if-ge v0, v1, :cond_8

    return v2

    .line 523
    :cond_8
    :try_start_8
    const-class v0, Landroid/content/pm/PackageManager;

    const-string v1, "canRequestPackageInstalls"

    const/4 v3, 0x0

    new-array v4, v3, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 524
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0

    new-array v1, v3, [Ljava/lang/Object;

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .line 525
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0, p0}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result p0
    :try_end_23
    .catchall {:try_start_8 .. :try_end_23} :catchall_24

    return p0

    .line 526
    :catchall_24
    move-exception p0

    .line 527
    return v2
.end method

.method private static checkForUpdates(Landroid/app/Activity;Z)V
    .registers 6

    .line 81
    sget-boolean v0, Lcom/trueaxis/modmenu/UpdateManager;->checking:Z

    if-eqz v0, :cond_c

    .line 82
    if-eqz p1, :cond_b

    const-string p1, "Update check is already running."

    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/UpdateManager;->toast(Landroid/content/Context;Ljava/lang/String;)V

    .line 83
    :cond_b
    return-void

    .line 85
    :cond_c
    const/4 v0, 0x1

    sput-boolean v0, Lcom/trueaxis/modmenu/UpdateManager;->checking:Z

    .line 86
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

    .line 87
    if-eqz p1, :cond_2b

    const-string v0, "Checking for updates..."

    invoke-static {p0, v0}, Lcom/trueaxis/modmenu/UpdateManager;->toast(Landroid/content/Context;Ljava/lang/String;)V

    .line 88
    :cond_2b
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/trueaxis/modmenu/UpdateManager$1;

    invoke-direct {v1, p0, p1}, Lcom/trueaxis/modmenu/UpdateManager$1;-><init>(Landroid/app/Activity;Z)V

    const-string p0, "YCS2UpdateCheck"

    invoke-direct {v0, v1, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 129
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 130
    return-void
.end method

.method public static checkNow(Landroid/app/Activity;)V
    .registers 3

    .line 76
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lcom/trueaxis/modmenu/UpdateManager;->resumePendingInstall(Landroid/app/Activity;Z)Z

    move-result v1

    if-eqz v1, :cond_8

    return-void

    .line 77
    :cond_8
    invoke-static {p0, v0}, Lcom/trueaxis/modmenu/UpdateManager;->checkForUpdates(Landroid/app/Activity;Z)V

    .line 78
    return-void
.end method

.method public static checkSilently(Landroid/app/Activity;)V
    .registers 8

    .line 68
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/trueaxis/modmenu/UpdateManager;->resumePendingInstall(Landroid/app/Activity;Z)Z

    move-result v1

    if-eqz v1, :cond_8

    return-void

    .line 69
    :cond_8
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    .line 70
    invoke-static {p0}, Lcom/trueaxis/modmenu/UpdateManager;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    const-string v4, "last_check_ms"

    const-wide/16 v5, 0x0

    invoke-interface {v3, v4, v5, v6}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v3

    .line 71
    sub-long/2addr v1, v3

    const-wide/32 v3, 0x2932e00

    cmp-long v5, v1, v3

    if-gez v5, :cond_21

    return-void

    .line 72
    :cond_21
    invoke-static {p0, v0}, Lcom/trueaxis/modmenu/UpdateManager;->checkForUpdates(Landroid/app/Activity;Z)V

    .line 73
    return-void
.end method

.method private static clearDownload(Landroid/content/Context;)V
    .registers 2

    .line 633
    invoke-static {p0}, Lcom/trueaxis/modmenu/UpdateManager;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 634
    const-string v0, "download_id"

    invoke-interface {p0, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 635
    const-string v0, "download_sha256"

    invoke-interface {p0, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 636
    const-string v0, "download_version_code"

    invoke-interface {p0, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 637
    const-string v0, "install_prompted_download_id"

    invoke-interface {p0, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 638
    const-string v0, "install_permission_prompted_version_code"

    invoke-interface {p0, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 639
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 640
    return-void
.end method

.method private static closeQuietly(Ljava/io/Closeable;)V
    .registers 1

    .line 652
    if-nez p0, :cond_3

    return-void

    .line 654
    :cond_3
    :try_start_3
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_6
    .catchall {:try_start_3 .. :try_end_6} :catchall_7

    .line 656
    goto :goto_8

    .line 655
    :catchall_7
    move-exception p0

    .line 657
    :goto_8
    return-void
.end method

.method private static currentVersionCode(Landroid/content/Context;)I
    .registers 4

    .line 496
    const/4 v0, 0x0

    :try_start_1
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 497
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0, v0}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object p0

    .line 498
    iget p0, p0, Landroid/content/pm/PackageInfo;->versionCode:I
    :try_end_f
    .catchall {:try_start_1 .. :try_end_f} :catchall_10

    return p0

    .line 499
    :catchall_10
    move-exception p0

    .line 500
    const-string v1, "update"

    const-string v2, "could not read current version"

    invoke-static {v1, v2, p0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 501
    return v0
.end method

.method private static downloadAlreadyInstalled(Landroid/content/Context;)Z
    .registers 4

    .line 488
    invoke-static {p0}, Lcom/trueaxis/modmenu/UpdateManager;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "download_version_code"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 489
    if-gtz v0, :cond_e

    return v2

    .line 490
    :cond_e
    invoke-static {p0}, Lcom/trueaxis/modmenu/UpdateManager;->currentVersionCode(Landroid/content/Context;)I

    move-result p0

    .line 491
    if-lt p0, v0, :cond_15

    const/4 v2, 0x1

    :cond_15
    return v2
.end method

.method private static dp(Landroid/content/Context;I)I
    .registers 2

    .line 613
    int-to-float p1, p1

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    mul-float p1, p1, p0

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p0

    return p0
.end method

.method private static fetchUpdateInfo()Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 179
    const-string v0, ""

    new-instance v1, Ljava/net/URL;

    const-string v2, "https://github.com/yanniedog/jcs2-mod/releases/latest/download/jcs2-update.json"

    invoke-direct {v1, v2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 180
    invoke-virtual {v1}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v1

    check-cast v1, Ljava/net/HttpURLConnection;

    .line 181
    const/16 v2, 0x2710

    invoke-virtual {v1, v2}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 182
    const/16 v2, 0x4e20

    invoke-virtual {v1, v2}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 183
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/net/HttpURLConnection;->setUseCaches(Z)V

    .line 184
    const-string v3, "Accept"

    const-string v4, "application/json"

    invoke-virtual {v1, v3, v4}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 185
    const-string v3, "User-Agent"

    const-string v4, "YCS2ModUpdater/1.0"

    invoke-virtual {v1, v3, v4}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 186
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v3

    .line 187
    const/16 v4, 0xc8

    if-lt v3, v4, :cond_be

    const/16 v4, 0x12c

    if-ge v3, v4, :cond_be

    .line 190
    nop

    .line 192
    const/4 v3, 0x0

    :try_start_39
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v4
    :try_end_3d
    .catchall {:try_start_39 .. :try_end_3d} :catchall_b6

    .line 193
    :try_start_3d
    new-instance v5, Lorg/json/JSONObject;

    invoke-static {v4}, Lcom/trueaxis/modmenu/UpdateManager;->readString(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 194
    new-instance v6, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;

    invoke-direct {v6, v3}, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;-><init>(Lcom/trueaxis/modmenu/UpdateManager$1;)V

    .line 195
    const-string v3, "package_name"

    invoke-virtual {v5, v3, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v6, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->packageName:Ljava/lang/String;

    .line 196
    const-string v3, "version_code"

    invoke-virtual {v5, v3, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v2

    iput v2, v6, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->versionCode:I

    .line 197
    const-string v2, "version_name"

    invoke-virtual {v5, v2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v6, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->versionName:Ljava/lang/String;

    .line 198
    const-string v2, "apk_name"

    const-string v3, "jcs2-update.apk"

    invoke-virtual {v5, v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v6, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->apkName:Ljava/lang/String;

    .line 199
    const-string v2, "apk_url"

    invoke-virtual {v5, v2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v6, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->apkUrl:Ljava/lang/String;

    .line 200
    const-string v2, "apk_sha256"

    invoke-virtual {v5, v2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v6, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->apkSha256:Ljava/lang/String;

    .line 201
    const-string v0, "apk_size"

    const-wide/16 v2, 0x0

    invoke-virtual {v5, v0, v2, v3}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v2

    iput-wide v2, v6, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->apkSize:J

    .line 202
    iget-object v0, v6, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_ab

    iget v0, v6, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->versionCode:I

    if-lez v0, :cond_ab

    iget-object v0, v6, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->versionName:Ljava/lang/String;

    .line 204
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_ab

    iget-object v0, v6, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->apkUrl:Ljava/lang/String;

    .line 205
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0
    :try_end_a1
    .catchall {:try_start_3d .. :try_end_a1} :catchall_b3

    if-eqz v0, :cond_ab

    .line 208
    nop

    .line 210
    invoke-static {v4}, Lcom/trueaxis/modmenu/UpdateManager;->closeQuietly(Ljava/io/Closeable;)V

    .line 211
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 208
    return-object v6

    .line 206
    :cond_ab
    :try_start_ab
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v2, "Update manifest is incomplete"

    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_b3
    .catchall {:try_start_ab .. :try_end_b3} :catchall_b3

    .line 210
    :catchall_b3
    move-exception v0

    move-object v3, v4

    goto :goto_b7

    :catchall_b6
    move-exception v0

    :goto_b7
    invoke-static {v3}, Lcom/trueaxis/modmenu/UpdateManager;->closeQuietly(Ljava/io/Closeable;)V

    .line 211
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 212
    throw v0

    .line 188
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

    .line 602
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

    .line 603
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

    .line 592
    new-instance v0, Ljava/lang/StringBuilder;

    array-length v1, p0

    mul-int/lit8 v1, v1, 0x2

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 593
    const/4 v1, 0x0

    :goto_9
    array-length v2, p0

    if-ge v1, v2, :cond_23

    .line 594
    aget-byte v2, p0, v1

    and-int/lit16 v2, v2, 0xff

    .line 595
    const/16 v3, 0x10

    if-ge v2, v3, :cond_19

    const/16 v3, 0x30

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 596
    :cond_19
    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 593
    add-int/lit8 v1, v1, 0x1

    goto :goto_9

    .line 598
    :cond_23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static installDownloadedApk(Landroid/app/Activity;JZ)Z
    .registers 13

    .line 278
    const-string v0, "install_prompted_download_id"

    const-string v1, "update"

    invoke-static {p0}, Lcom/trueaxis/modmenu/UpdateManager;->downloadAlreadyInstalled(Landroid/content/Context;)Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_f

    .line 279
    invoke-static {p0}, Lcom/trueaxis/modmenu/UpdateManager;->clearDownload(Landroid/content/Context;)V

    .line 280
    return v3

    .line 282
    :cond_f
    const-string v2, "download"

    invoke-virtual {p0, v2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/DownloadManager;

    .line 283
    if-nez v2, :cond_1a

    return v3

    .line 284
    :cond_1a
    nop

    .line 286
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

    .line 287
    if-eqz v4, :cond_14e

    invoke-interface {v4}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v5

    if-nez v5, :cond_38

    goto/16 :goto_14e

    .line 291
    :cond_38
    const-string v5, "status"

    invoke-interface {v4, v5}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v5

    invoke-interface {v4, v5}, Landroid/database/Cursor;->getInt(I)I

    move-result v5

    .line 292
    if-eq v5, v6, :cond_13f

    const/4 v7, 0x4

    if-eq v5, v7, :cond_13f

    const/4 v7, 0x2

    if-ne v5, v7, :cond_4c

    goto/16 :goto_13f

    .line 299
    :cond_4c
    const/16 v7, 0x8

    if-eq v5, v7, :cond_61

    .line 300
    invoke-static {p0}, Lcom/trueaxis/modmenu/UpdateManager;->clearDownload(Landroid/content/Context;)V

    .line 301
    if-eqz p3, :cond_5a

    const-string p1, "Update download failed. Please try again."

    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/UpdateManager;->toast(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_5a
    .catchall {:try_start_1c .. :try_end_5a} :catchall_158

    .line 302
    :cond_5a
    nop

    .line 340
    if-eqz v4, :cond_60

    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    .line 302
    :cond_60
    return v3

    .line 304
    :cond_61
    :try_start_61
    invoke-static {p0}, Lcom/trueaxis/modmenu/UpdateManager;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v5

    const-string v7, "download_sha256"

    const-string v8, ""

    invoke-interface {v5, v7, v8}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 305
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v7

    if-lez v7, :cond_b3

    .line 306
    invoke-static {v2, p1, p2}, Lcom/trueaxis/modmenu/UpdateManager;->sha256(Landroid/app/DownloadManager;J)Ljava/lang/String;

    move-result-object v7

    .line 307
    invoke-virtual {v5, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_b3

    .line 308
    new-array v0, v6, [J

    aput-wide p1, v0, v3

    invoke-virtual {v2, v0}, Landroid/app/DownloadManager;->remove([J)I

    .line 309
    invoke-static {p0}, Lcom/trueaxis/modmenu/UpdateManager;->clearDownload(Landroid/content/Context;)V

    .line 310
    const-string p1, "Downloaded update did not match its checksum."

    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/UpdateManager;->toast(Landroid/content/Context;Ljava/lang/String;)V

    .line 311
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
    .catchall {:try_start_61 .. :try_end_ac} :catchall_158

    .line 313
    nop

    .line 340
    if-eqz v4, :cond_b2

    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    .line 313
    :cond_b2
    return v3

    .line 316
    :cond_b3
    :try_start_b3
    invoke-static {p0}, Lcom/trueaxis/modmenu/UpdateManager;->canInstallPackages(Landroid/content/Context;)Z

    move-result v5

    if-nez v5, :cond_c3

    .line 317
    invoke-static {p0, p3}, Lcom/trueaxis/modmenu/UpdateManager;->maybePromptInstallPermission(Landroid/app/Activity;Z)V
    :try_end_bc
    .catchall {:try_start_b3 .. :try_end_bc} :catchall_158

    .line 318
    nop

    .line 340
    if-eqz v4, :cond_c2

    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    .line 318
    :cond_c2
    return v6

    .line 320
    :cond_c3
    :try_start_c3
    invoke-static {p0}, Lcom/trueaxis/modmenu/UpdateManager;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v5

    const-wide/16 v7, -0x1

    invoke-interface {v5, v0, v7, v8}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v7

    .line 321
    cmp-long v5, v7, p1

    if-nez v5, :cond_ee

    .line 322
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
    :try_end_e7
    .catchall {:try_start_c3 .. :try_end_e7} :catchall_158

    .line 323
    nop

    .line 340
    if-eqz v4, :cond_ed

    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    .line 323
    :cond_ed
    return v6

    .line 325
    :cond_ee
    :try_start_ee
    invoke-virtual {v2, p1, p2}, Landroid/app/DownloadManager;->getUriForDownloadedFile(J)Landroid/net/Uri;

    move-result-object v2

    .line 326
    if-eqz v2, :cond_137

    .line 327
    new-instance v5, Landroid/content/Intent;

    const-string v7, "android.intent.action.VIEW"

    invoke-direct {v5, v7}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 328
    const-string v7, "application/vnd.android.package-archive"

    invoke-virtual {v5, v2, v7}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 329
    invoke-virtual {v5, v6}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 330
    const/high16 v2, 0x10000000

    invoke-virtual {v5, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 331
    invoke-virtual {p0, v5}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 332
    invoke-static {p0}, Lcom/trueaxis/modmenu/UpdateManager;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2, v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 333
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
    :try_end_130
    .catchall {:try_start_ee .. :try_end_130} :catchall_158

    .line 334
    nop

    .line 340
    if-eqz v4, :cond_136

    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    .line 334
    :cond_136
    return v6

    .line 326
    :cond_137
    :try_start_137
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Downloaded APK URI unavailable"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 295
    :cond_13f
    :goto_13f
    invoke-static {p0, p1, p2}, Lcom/trueaxis/modmenu/UpdateManager;->registerDownloadReceiver(Landroid/app/Activity;J)V

    .line 296
    if-eqz p3, :cond_147

    invoke-static {p0, p1, p2}, Lcom/trueaxis/modmenu/UpdateManager;->showDownloadProgress(Landroid/app/Activity;J)V
    :try_end_147
    .catchall {:try_start_137 .. :try_end_147} :catchall_158

    .line 297
    :cond_147
    nop

    .line 340
    if-eqz v4, :cond_14d

    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    .line 297
    :cond_14d
    return v6

    .line 288
    :cond_14e
    :goto_14e
    :try_start_14e
    invoke-static {p0}, Lcom/trueaxis/modmenu/UpdateManager;->clearDownload(Landroid/content/Context;)V
    :try_end_151
    .catchall {:try_start_14e .. :try_end_151} :catchall_158

    .line 289
    nop

    .line 340
    if-eqz v4, :cond_157

    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    .line 289
    :cond_157
    return v3

    .line 335
    :catchall_158
    move-exception p1

    .line 336
    :try_start_159
    const-string p2, "install downloaded apk failed"

    invoke-static {v1, p2, p1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 337
    if-eqz p3, :cond_17a

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
    :try_end_17a
    .catchall {:try_start_159 .. :try_end_17a} :catchall_181

    .line 338
    :cond_17a
    nop

    .line 340
    if-eqz v4, :cond_180

    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    .line 338
    :cond_180
    return v3

    .line 340
    :catchall_181
    move-exception p0

    if-eqz v4, :cond_187

    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    .line 341
    :cond_187
    throw p0
.end method

.method private static maybePromptInstallPermission(Landroid/app/Activity;Z)V
    .registers 6

    .line 506
    invoke-static {p0}, Lcom/trueaxis/modmenu/UpdateManager;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 507
    const-string v1, "download_version_code"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    .line 508
    const-string v3, "install_permission_prompted_version_code"

    invoke-interface {v0, v3, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    .line 509
    if-nez p1, :cond_30

    if-lez v1, :cond_30

    if-ne v2, v1, :cond_30

    .line 510
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

    .line 512
    return-void

    .line 514
    :cond_30
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    .line 515
    invoke-interface {p1, v3, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    .line 516
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 517
    invoke-static {p0}, Lcom/trueaxis/modmenu/UpdateManager;->promptInstallPermission(Landroid/app/Activity;)V

    .line 518
    return-void
.end method

.method private static prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .registers 3

    .line 629
    const-string v0, "jcs_mod_update"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    return-object p0
.end method

.method private static promptInstallPermission(Landroid/app/Activity;)V
    .registers 3

    .line 532
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 533
    const-string v1, "Allow YCS2 updates"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 534
    const-string v1, "Android needs permission for this app to install downloaded APK updates. After enabling it, return here and tap Check for updates."

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lcom/trueaxis/modmenu/UpdateManager$9;

    invoke-direct {v1, p0}, Lcom/trueaxis/modmenu/UpdateManager$9;-><init>(Landroid/app/Activity;)V

    .line 536
    const-string p0, "Open settings"

    invoke-virtual {v0, p0, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    .line 549
    const-string v0, "Later"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    .line 550
    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 551
    return-void
.end method

.method private static readDownloadProgress(Landroid/app/DownloadManager;J)Lcom/trueaxis/modmenu/UpdateManager$DownloadProgress;
    .registers 9

    .line 435
    new-instance v0, Lcom/trueaxis/modmenu/UpdateManager$DownloadProgress;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/trueaxis/modmenu/UpdateManager$DownloadProgress;-><init>(Lcom/trueaxis/modmenu/UpdateManager$1;)V

    .line 436
    nop

    .line 438
    :try_start_7
    new-instance v2, Landroid/app/DownloadManager$Query;

    invoke-direct {v2}, Landroid/app/DownloadManager$Query;-><init>()V

    const/4 v3, 0x1

    new-array v4, v3, [J

    const/4 v5, 0x0

    aput-wide p1, v4, v5

    invoke-virtual {v2, v4}, Landroid/app/DownloadManager$Query;->setFilterById([J)Landroid/app/DownloadManager$Query;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/app/DownloadManager;->query(Landroid/app/DownloadManager$Query;)Landroid/database/Cursor;

    move-result-object v1

    .line 439
    if-eqz v1, :cond_50

    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result p0

    if-nez p0, :cond_23

    goto :goto_50

    .line 440
    :cond_23
    iput-boolean v3, v0, Lcom/trueaxis/modmenu/UpdateManager$DownloadProgress;->exists:Z

    .line 441
    const-string p0, "status"

    .line 442
    invoke-interface {v1, p0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result p0

    .line 441
    invoke-interface {v1, p0}, Landroid/database/Cursor;->getInt(I)I

    move-result p0

    iput p0, v0, Lcom/trueaxis/modmenu/UpdateManager$DownloadProgress;->status:I

    .line 443
    const-string p0, "bytes_so_far"

    invoke-static {v1, p0}, Lcom/trueaxis/modmenu/UpdateManager;->readLongColumn(Landroid/database/Cursor;Ljava/lang/String;)J

    move-result-wide p0

    iput-wide p0, v0, Lcom/trueaxis/modmenu/UpdateManager$DownloadProgress;->downloaded:J

    .line 445
    const-string p0, "total_size"

    invoke-static {v1, p0}, Lcom/trueaxis/modmenu/UpdateManager;->readLongColumn(Landroid/database/Cursor;Ljava/lang/String;)J

    move-result-wide p0

    iput-wide p0, v0, Lcom/trueaxis/modmenu/UpdateManager$DownloadProgress;->total:J

    .line 446
    const-string p0, "reason"

    invoke-static {v1, p0}, Lcom/trueaxis/modmenu/UpdateManager;->readIntColumn(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result p0

    iput p0, v0, Lcom/trueaxis/modmenu/UpdateManager$DownloadProgress;->reason:I
    :try_end_49
    .catchall {:try_start_7 .. :try_end_49} :catchall_56

    .line 447
    nop

    .line 452
    if-eqz v1, :cond_4f

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 447
    :cond_4f
    return-object v0

    .line 452
    :cond_50
    :goto_50
    if-eqz v1, :cond_55

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 439
    :cond_55
    return-object v0

    .line 448
    :catchall_56
    move-exception p0

    .line 449
    :try_start_57
    const-string p1, "update"

    const-string p2, "download progress query failed"

    invoke-static {p1, p2, p0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_5e
    .catchall {:try_start_57 .. :try_end_5e} :catchall_65

    .line 450
    nop

    .line 452
    if-eqz v1, :cond_64

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 450
    :cond_64
    return-object v0

    .line 452
    :catchall_65
    move-exception p0

    if-eqz v1, :cond_6b

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 453
    :cond_6b
    throw p0
.end method

.method private static readIntColumn(Landroid/database/Cursor;Ljava/lang/String;)I
    .registers 3

    .line 623
    invoke-interface {p0, p1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result p1

    .line 624
    if-ltz p1, :cond_12

    invoke-interface {p0, p1}, Landroid/database/Cursor;->isNull(I)Z

    move-result v0

    if-eqz v0, :cond_d

    goto :goto_12

    .line 625
    :cond_d
    invoke-interface {p0, p1}, Landroid/database/Cursor;->getInt(I)I

    move-result p0

    return p0

    .line 624
    :cond_12
    :goto_12
    const/4 p0, 0x0

    return p0
.end method

.method private static readLongColumn(Landroid/database/Cursor;Ljava/lang/String;)J
    .registers 3

    .line 617
    invoke-interface {p0, p1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result p1

    .line 618
    if-ltz p1, :cond_12

    invoke-interface {p0, p1}, Landroid/database/Cursor;->isNull(I)Z

    move-result v0

    if-eqz v0, :cond_d

    goto :goto_12

    .line 619
    :cond_d
    invoke-interface {p0, p1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide p0

    return-wide p0

    .line 618
    :cond_12
    :goto_12
    const-wide/16 p0, -0x1

    return-wide p0
.end method

.method private static readString(Ljava/io/InputStream;)Ljava/lang/String;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 578
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v1, Ljava/io/InputStreamReader;

    const-string v2, "UTF-8"

    invoke-direct {v1, p0, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v0, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 579
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 580
    const/16 v1, 0x1000

    new-array v1, v1, [C

    .line 582
    :goto_15
    invoke-virtual {v0, v1}, Ljava/io/BufferedReader;->read([C)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_31

    .line 583
    const/4 v3, 0x0

    invoke-virtual {p0, v1, v3, v2}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 584
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    const/high16 v3, 0x10000

    if-gt v2, v3, :cond_29

    goto :goto_15

    .line 585
    :cond_29
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "Update manifest is too large"

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 588
    :cond_31
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static readable(Ljava/lang/Throwable;)Ljava/lang/String;
    .registers 3

    .line 607
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    .line 608
    if-eqz v0, :cond_e

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_d

    goto :goto_e

    .line 609
    :cond_d
    goto :goto_16

    :cond_e
    :goto_e
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    .line 608
    :goto_16
    return-object v0
.end method

.method private static recordUpdateDismissed(Landroid/content/Context;Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;)V
    .registers 4

    .line 171
    invoke-static {p0}, Lcom/trueaxis/modmenu/UpdateManager;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    iget v0, p1, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->versionCode:I

    .line 172
    const-string v1, "dismissed_version_code"

    invoke-interface {p0, v1, v0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 173
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 174
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

    .line 176
    return-void
.end method

.method private static registerDownloadReceiver(Landroid/app/Activity;J)V
    .registers 4

    .line 249
    new-instance v0, Lcom/trueaxis/modmenu/UpdateManager$5;

    invoke-direct {v0, p1, p2, p0}, Lcom/trueaxis/modmenu/UpdateManager$5;-><init>(JLandroid/app/Activity;)V

    .line 262
    :try_start_5
    new-instance p1, Landroid/content/IntentFilter;

    const-string p2, "android.intent.action.DOWNLOAD_COMPLETE"

    invoke-direct {p1, p2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0, p1}, Landroid/app/Activity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;
    :try_end_f
    .catchall {:try_start_5 .. :try_end_f} :catchall_10

    .line 266
    goto :goto_18

    .line 264
    :catchall_10
    move-exception p0

    .line 265
    const-string p1, "update"

    const-string p2, "download receiver registration failed"

    invoke-static {p1, p2, p0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 267
    :goto_18
    return-void
.end method

.method private static resumePendingInstall(Landroid/app/Activity;Z)Z
    .registers 7

    .line 270
    invoke-static {p0}, Lcom/trueaxis/modmenu/UpdateManager;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "download_id"

    const-wide/16 v2, -0x1

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    .line 271
    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-gez v4, :cond_14

    const/4 p0, 0x0

    return p0

    .line 272
    :cond_14
    invoke-static {p0, v0, v1, p1}, Lcom/trueaxis/modmenu/UpdateManager;->installDownloadedApk(Landroid/app/Activity;JZ)Z

    move-result p0

    return p0
.end method

.method private static runOnUi(Landroid/app/Activity;Ljava/lang/Runnable;)V
    .registers 3

    .line 643
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    .line 644
    :cond_7
    invoke-virtual {p0, p1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 645
    return-void
.end method

.method private static sha256(Landroid/app/DownloadManager;J)Ljava/lang/String;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 554
    nop

    .line 555
    nop

    .line 557
    const/4 v0, 0x0

    :try_start_3
    invoke-virtual {p0, p1, p2}, Landroid/app/DownloadManager;->openDownloadedFile(J)Landroid/os/ParcelFileDescriptor;

    move-result-object p0
    :try_end_7
    .catchall {:try_start_3 .. :try_end_7} :catchall_3e

    .line 558
    :try_start_7
    new-instance p1, Ljava/io/FileInputStream;

    invoke-virtual {p0}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/io/FileInputStream;-><init>(Ljava/io/FileDescriptor;)V
    :try_end_10
    .catchall {:try_start_7 .. :try_end_10} :catchall_3c

    .line 559
    :try_start_10
    const-string p2, "SHA-256"

    invoke-static {p2}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object p2

    .line 560
    const/high16 v0, 0x10000

    new-array v0, v0, [B

    .line 562
    :goto_1a
    invoke-virtual {p1, v0}, Ljava/io/FileInputStream;->read([B)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_26

    .line 563
    const/4 v2, 0x0

    invoke-virtual {p2, v0, v2, v1}, Ljava/security/MessageDigest;->update([BII)V

    goto :goto_1a

    .line 565
    :cond_26
    invoke-virtual {p2}, Ljava/security/MessageDigest;->digest()[B

    move-result-object p2

    invoke-static {p2}, Lcom/trueaxis/modmenu/UpdateManager;->hex([B)Ljava/lang/String;

    move-result-object p2
    :try_end_2e
    .catchall {:try_start_10 .. :try_end_2e} :catchall_39

    .line 567
    invoke-static {p1}, Lcom/trueaxis/modmenu/UpdateManager;->closeQuietly(Ljava/io/Closeable;)V

    .line 568
    if-eqz p0, :cond_38

    .line 570
    :try_start_33
    invoke-virtual {p0}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_36
    .catchall {:try_start_33 .. :try_end_36} :catchall_37

    .line 572
    goto :goto_38

    .line 571
    :catchall_37
    move-exception p0

    .line 565
    :cond_38
    :goto_38
    return-object p2

    .line 567
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

    .line 568
    if-eqz p0, :cond_4a

    .line 570
    :try_start_45
    invoke-virtual {p0}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_48
    .catchall {:try_start_45 .. :try_end_48} :catchall_49

    .line 572
    goto :goto_4a

    .line 571
    :catchall_49
    move-exception p0

    .line 574
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

    .line 161
    invoke-static {p0}, Lcom/trueaxis/modmenu/UpdateManager;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 162
    const-string v0, "dismissed_version_code"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    iget v2, p1, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->versionCode:I

    const/4 v3, 0x1

    if-ne v0, v2, :cond_11

    .line 163
    return v3

    .line 165
    :cond_11
    const-string v0, "download_id"

    const-wide/16 v4, -0x1

    invoke-interface {p0, v0, v4, v5}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v4

    .line 166
    const-string v0, "download_version_code"

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    .line 167
    const-wide/16 v6, 0x0

    cmp-long v0, v4, v6

    if-ltz v0, :cond_2a

    iget p1, p1, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->versionCode:I

    if-lt p0, p1, :cond_2a

    const/4 v1, 0x1

    :cond_2a
    return v1
.end method

.method private static showDownloadProgress(Landroid/app/Activity;J)V
    .registers 21

    .line 345
    move-object/from16 v9, p0

    .line 346
    const-string v0, "download"

    invoke-virtual {v9, v0}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    move-object v10, v0

    check-cast v10, Landroid/app/DownloadManager;

    .line 347
    if-nez v10, :cond_13

    .line 348
    const-string v0, "Download manager is unavailable."

    invoke-static {v9, v0}, Lcom/trueaxis/modmenu/UpdateManager;->toast(Landroid/content/Context;Ljava/lang/String;)V

    .line 349
    return-void

    .line 352
    :cond_13
    new-instance v11, Landroid/widget/TextView;

    invoke-direct {v11, v9}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 353
    const-string v0, "Starting download..."

    invoke-virtual {v11, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 355
    new-instance v12, Landroid/widget/ProgressBar;

    const v0, 0x1010078

    const/4 v1, 0x0

    invoke-direct {v12, v9, v1, v0}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 357
    const/16 v0, 0x3e8

    invoke-virtual {v12, v0}, Landroid/widget/ProgressBar;->setMax(I)V

    .line 358
    const/4 v0, 0x1

    invoke-virtual {v12, v0}, Landroid/widget/ProgressBar;->setIndeterminate(Z)V

    .line 360
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, v9}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 361
    invoke-virtual {v2, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 362
    const/16 v3, 0x14

    invoke-static {v9, v3}, Lcom/trueaxis/modmenu/UpdateManager;->dp(Landroid/content/Context;I)I

    move-result v3

    .line 363
    const/4 v13, 0x0

    invoke-virtual {v2, v3, v3, v3, v13}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 364
    invoke-virtual {v2, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 365
    invoke-virtual {v2, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 367
    new-instance v14, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-direct {v14, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 368
    new-array v15, v0, [Z

    aput-boolean v0, v15, v13

    .line 369
    new-array v8, v0, [Ljava/lang/Runnable;

    .line 371
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, v9}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 372
    const-string v3, "Downloading update"

    invoke-virtual {v0, v3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 373
    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 374
    const-string v2, "Hide"

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 375
    const-string v2, "Cancel download"

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 376
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v6

    .line 377
    new-instance v7, Lcom/trueaxis/modmenu/UpdateManager$6;

    move-object v0, v7

    move-object v1, v6

    move-object v2, v15

    move-object v3, v14

    move-object v4, v8

    move-object v5, v10

    move-object v13, v6

    move-object v9, v7

    move-wide/from16 v6, p1

    move-object/from16 v16, v12

    move-object v12, v8

    move-object/from16 v8, p0

    invoke-direct/range {v0 .. v8}, Lcom/trueaxis/modmenu/UpdateManager$6;-><init>(Landroid/app/AlertDialog;[ZLandroid/os/Handler;[Ljava/lang/Runnable;Landroid/app/DownloadManager;JLandroid/app/Activity;)V

    invoke-virtual {v13, v9}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 393
    new-instance v0, Lcom/trueaxis/modmenu/UpdateManager$7;

    invoke-direct {v0, v15, v14, v12}, Lcom/trueaxis/modmenu/UpdateManager$7;-><init>([ZLandroid/os/Handler;[Ljava/lang/Runnable;)V

    invoke-virtual {v13, v0}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 400
    new-instance v17, Lcom/trueaxis/modmenu/UpdateManager$8;

    move-object/from16 v0, v17

    move-object v1, v15

    move-object/from16 v2, p0

    move-object v3, v10

    move-wide/from16 v4, p1

    move-object v6, v13

    move-object v7, v11

    move-object/from16 v8, v16

    move-object v9, v14

    invoke-direct/range {v0 .. v9}, Lcom/trueaxis/modmenu/UpdateManager$8;-><init>([ZLandroid/app/Activity;Landroid/app/DownloadManager;JLandroid/app/AlertDialog;Landroid/widget/TextView;Landroid/widget/ProgressBar;Landroid/os/Handler;)V

    const/4 v0, 0x0

    aput-object v17, v12, v0

    .line 430
    invoke-virtual {v13}, Landroid/app/AlertDialog;->show()V

    .line 431
    aget-object v0, v12, v0

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 432
    return-void
.end method

.method private static showUpdateAvailable(Landroid/app/Activity;Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;Landroid/content/pm/PackageInfo;)V
    .registers 8

    .line 135
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

    .line 136
    :goto_24
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 137
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

    .line 138
    invoke-virtual {v1, p2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    new-instance v0, Lcom/trueaxis/modmenu/UpdateManager$4;

    invoke-direct {v0, p0, p1}, Lcom/trueaxis/modmenu/UpdateManager$4;-><init>(Landroid/app/Activity;Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;)V

    .line 142
    const-string v1, "Download update"

    invoke-virtual {p2, v1, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    new-instance v0, Lcom/trueaxis/modmenu/UpdateManager$3;

    invoke-direct {v0, p0, p1}, Lcom/trueaxis/modmenu/UpdateManager$3;-><init>(Landroid/app/Activity;Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;)V

    .line 147
    const-string v1, "Later"

    invoke-virtual {p2, v1, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    new-instance v0, Lcom/trueaxis/modmenu/UpdateManager$2;

    invoke-direct {v0, p0, p1}, Lcom/trueaxis/modmenu/UpdateManager$2;-><init>(Landroid/app/Activity;Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;)V

    .line 152
    invoke-virtual {p2, v0}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    .line 157
    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 158
    return-void
.end method

.method private static startDownload(Landroid/app/Activity;Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;)V
    .registers 8

    .line 217
    const-string v0, "update"

    :try_start_2
    const-string v1, "download"

    invoke-virtual {p0, v1}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/DownloadManager;

    .line 218
    if-eqz v1, :cond_bc

    .line 219
    new-instance v2, Landroid/app/DownloadManager$Request;

    iget-object v3, p1, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->apkUrl:Ljava/lang/String;

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/app/DownloadManager$Request;-><init>(Landroid/net/Uri;)V

    .line 220
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

    .line 221
    iget-object v3, p1, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->apkName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/app/DownloadManager$Request;->setDescription(Ljava/lang/CharSequence;)Landroid/app/DownloadManager$Request;

    .line 222
    const-string v3, "application/vnd.android.package-archive"

    invoke-virtual {v2, v3}, Landroid/app/DownloadManager$Request;->setMimeType(Ljava/lang/String;)Landroid/app/DownloadManager$Request;

    .line 223
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/app/DownloadManager$Request;->setNotificationVisibility(I)Landroid/app/DownloadManager$Request;

    .line 225
    invoke-virtual {v2, v3}, Landroid/app/DownloadManager$Request;->setAllowedOverRoaming(Z)Landroid/app/DownloadManager$Request;

    .line 226
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x10

    if-lt v4, v5, :cond_49

    invoke-virtual {v2, v3}, Landroid/app/DownloadManager$Request;->setAllowedOverMetered(Z)Landroid/app/DownloadManager$Request;

    .line 227
    :cond_49
    sget-object v3, Landroid/os/Environment;->DIRECTORY_DOWNLOADS:Ljava/lang/String;

    iget-object v4, p1, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->apkName:Ljava/lang/String;

    invoke-virtual {v2, p0, v3, v4}, Landroid/app/DownloadManager$Request;->setDestinationInExternalFilesDir(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/app/DownloadManager$Request;

    .line 229
    invoke-virtual {v1, v2}, Landroid/app/DownloadManager;->enqueue(Landroid/app/DownloadManager$Request;)J

    move-result-wide v1

    .line 230
    invoke-static {p0}, Lcom/trueaxis/modmenu/UpdateManager;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    const-string v4, "download_id"

    .line 231
    invoke-interface {v3, v4, v1, v2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    const-string v4, "download_sha256"

    iget-object v5, p1, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->apkSha256:Ljava/lang/String;

    .line 232
    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    const-string v4, "download_version_code"

    iget v5, p1, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->versionCode:I

    .line 233
    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    const-string v4, "dismissed_version_code"

    .line 234
    invoke-interface {v3, v4}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    const-string v4, "install_prompted_download_id"

    .line 235
    invoke-interface {v3, v4}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    const-string v4, "install_permission_prompted_version_code"

    .line 236
    invoke-interface {v3, v4}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    .line 237
    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 238
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

    .line 240
    invoke-static {p0, v1, v2}, Lcom/trueaxis/modmenu/UpdateManager;->registerDownloadReceiver(Landroid/app/Activity;J)V

    .line 241
    invoke-static {p0, v1, v2}, Lcom/trueaxis/modmenu/UpdateManager;->showDownloadProgress(Landroid/app/Activity;J)V

    .line 245
    goto :goto_e4

    .line 218
    :cond_bc
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v1, "Download manager is unavailable"

    invoke-direct {p1, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_c4
    .catchall {:try_start_2 .. :try_end_c4} :catchall_c4

    .line 242
    :catchall_c4
    move-exception p1

    .line 243
    const-string v1, "download start failed"

    invoke-static {v0, v1, p1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 244
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

    .line 246
    :goto_e4
    return-void
.end method

.method private static toast(Landroid/content/Context;Ljava/lang/String;)V
    .registers 3

    .line 648
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 649
    return-void
.end method

.method private static updateProgressViews(Landroid/widget/TextView;Landroid/widget/ProgressBar;Lcom/trueaxis/modmenu/UpdateManager$DownloadProgress;)V
    .registers 14

    .line 459
    iget-wide v0, p2, Lcom/trueaxis/modmenu/UpdateManager$DownloadProgress;->total:J

    const/4 v2, 0x1

    const/4 v3, 0x0

    const-wide/16 v4, 0x0

    cmp-long v6, v0, v4

    if-lez v6, :cond_c

    const/4 v0, 0x1

    goto :goto_d

    :cond_c
    const/4 v0, 0x0

    .line 460
    :goto_d
    const/16 v1, 0x10

    const/16 v6, 0x8

    if-nez v0, :cond_1d

    iget v7, p2, Lcom/trueaxis/modmenu/UpdateManager$DownloadProgress;->status:I

    if-eq v7, v6, :cond_1d

    iget v7, p2, Lcom/trueaxis/modmenu/UpdateManager$DownloadProgress;->status:I

    if-eq v7, v1, :cond_1d

    const/4 v7, 0x1

    goto :goto_1e

    :cond_1d
    const/4 v7, 0x0

    :goto_1e
    invoke-virtual {p1, v7}, Landroid/widget/ProgressBar;->setIndeterminate(Z)V

    .line 463
    if-eqz v0, :cond_3a

    .line 464
    iget-wide v7, p2, Lcom/trueaxis/modmenu/UpdateManager$DownloadProgress;->downloaded:J

    iget-wide v9, p2, Lcom/trueaxis/modmenu/UpdateManager$DownloadProgress;->total:J

    invoke-static {v7, v8, v9, v10}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v7

    invoke-static {v4, v5, v7, v8}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v7

    .line 465
    const-wide/16 v9, 0x3e8

    mul-long v7, v7, v9

    iget-wide v9, p2, Lcom/trueaxis/modmenu/UpdateManager$DownloadProgress;->total:J

    div-long/2addr v7, v9

    long-to-int v8, v7

    invoke-virtual {p1, v8}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 468
    :cond_3a
    if-eqz v0, :cond_64

    .line 469
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v7, p2, Lcom/trueaxis/modmenu/UpdateManager$DownloadProgress;->downloaded:J

    invoke-static {v4, v5, v7, v8}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v4

    invoke-static {v4, v5}, Lcom/trueaxis/modmenu/UpdateManager;->formatBytes(J)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, " / "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v4, p2, Lcom/trueaxis/modmenu/UpdateManager$DownloadProgress;->total:J

    invoke-static {v4, v5}, Lcom/trueaxis/modmenu/UpdateManager;->formatBytes(J)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_6e

    .line 470
    :cond_64
    iget-wide v7, p2, Lcom/trueaxis/modmenu/UpdateManager$DownloadProgress;->downloaded:J

    invoke-static {v4, v5, v7, v8}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v4

    invoke-static {v4, v5}, Lcom/trueaxis/modmenu/UpdateManager;->formatBytes(J)Ljava/lang/String;

    move-result-object v0

    .line 471
    :goto_6e
    iget v4, p2, Lcom/trueaxis/modmenu/UpdateManager$DownloadProgress;->status:I

    if-ne v4, v2, :cond_89

    .line 472
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "Waiting to start... "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_da

    .line 473
    :cond_89
    iget v2, p2, Lcom/trueaxis/modmenu/UpdateManager$DownloadProgress;->status:I

    const/4 v4, 0x4

    if-ne v2, v4, :cond_a5

    .line 474
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "Paused... "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_da

    .line 475
    :cond_a5
    iget v2, p2, Lcom/trueaxis/modmenu/UpdateManager$DownloadProgress;->status:I

    if-ne v2, v6, :cond_b7

    .line 476
    invoke-virtual {p1, v3}, Landroid/widget/ProgressBar;->setIndeterminate(Z)V

    .line 477
    const/16 p2, 0x3e8

    invoke-virtual {p1, p2}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 478
    const-string p1, "Download complete. Opening installer..."

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_da

    .line 479
    :cond_b7
    iget p2, p2, Lcom/trueaxis/modmenu/UpdateManager$DownloadProgress;->status:I

    if-ne p2, v1, :cond_c4

    .line 480
    invoke-virtual {p1, v3}, Landroid/widget/ProgressBar;->setIndeterminate(Z)V

    .line 481
    const-string p1, "Download failed."

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_da

    .line 483
    :cond_c4
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "Downloading... "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 485
    :goto_da
    return-void
.end method
