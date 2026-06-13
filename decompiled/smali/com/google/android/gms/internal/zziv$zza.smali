.class public final Lcom/google/android/gms/internal/zziv$zza;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zziv;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "zza"
.end annotation


# instance fields
.field private zzcbb:I

.field private zzcbc:I

.field private zzcbd:F

.field private zzcgd:I

.field private zzcge:Z

.field private zzcgf:Z

.field private zzcgg:Ljava/lang/String;

.field private zzcgh:Ljava/lang/String;

.field private zzcgi:Z

.field private zzcgj:Z

.field private zzcgk:Z

.field private zzcgl:Z

.field private zzcgm:Ljava/lang/String;

.field private zzcgn:Ljava/lang/String;

.field private zzcgo:I

.field private zzcgp:I

.field private zzcgq:I

.field private zzcgr:I

.field private zzcgs:I

.field private zzcgt:I

.field private zzcgu:D

.field private zzcgv:Z

.field private zzcgw:Z

.field private zzcgx:I

.field private zzcgy:Ljava/lang/String;

.field private zzcgz:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zziv$zza;->zzv(Landroid/content/Context;)V

    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/internal/zziv$zza;->zza(Landroid/content/Context;Landroid/content/pm/PackageManager;)V

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zziv$zza;->zzw(Landroid/content/Context;)V

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    const-string v2, "geo:0,0?q=donuts"

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/zziv$zza;->zza(Landroid/content/pm/PackageManager;Ljava/lang/String;)Landroid/content/pm/ResolveInfo;

    move-result-object v2

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v2, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    iput-boolean v2, p0, Lcom/google/android/gms/internal/zziv$zza;->zzcge:Z

    const-string v2, "http://www.google.com"

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/zziv$zza;->zza(Landroid/content/pm/PackageManager;Ljava/lang/String;)Landroid/content/pm/ResolveInfo;

    move-result-object v2

    if-eqz v2, :cond_1

    goto :goto_1

    :cond_1
    const/4 v3, 0x0

    :goto_1
    iput-boolean v3, p0, Lcom/google/android/gms/internal/zziv$zza;->zzcgf:Z

    invoke-virtual {v1}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/google/android/gms/internal/zziv$zza;->zzcgh:Ljava/lang/String;

    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzm;->zziw()Lcom/google/android/gms/ads/internal/util/client/zza;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/ads/internal/util/client/zza;->zztw()Z

    move-result v2

    iput-boolean v2, p0, Lcom/google/android/gms/internal/zziv$zza;->zzcgi:Z

    invoke-static {p1}, Lcom/google/android/gms/common/util/zzi;->zzcl(Landroid/content/Context;)Z

    move-result v2

    iput-boolean v2, p0, Lcom/google/android/gms/internal/zziv$zza;->zzcgj:Z

    invoke-virtual {v1}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/gms/internal/zziv$zza;->zzcgm:Ljava/lang/String;

    invoke-static {v0}, Lcom/google/android/gms/internal/zziv$zza;->zza(Landroid/content/pm/PackageManager;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zziv$zza;->zzcgn:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    if-nez p1, :cond_2

    return-void

    :cond_2
    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    if-nez p1, :cond_3

    return-void

    :cond_3
    iget v0, p1, Landroid/util/DisplayMetrics;->density:F

    iput v0, p0, Lcom/google/android/gms/internal/zziv$zza;->zzcbd:F

    iget v0, p1, Landroid/util/DisplayMetrics;->widthPixels:I

    iput v0, p0, Lcom/google/android/gms/internal/zziv$zza;->zzcbb:I

    iget p1, p1, Landroid/util/DisplayMetrics;->heightPixels:I

    iput p1, p0, Lcom/google/android/gms/internal/zziv$zza;->zzcbc:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/internal/zziv;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zziv$zza;->zzv(Landroid/content/Context;)V

    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/internal/zziv$zza;->zza(Landroid/content/Context;Landroid/content/pm/PackageManager;)V

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zziv$zza;->zzw(Landroid/content/Context;)V

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zziv$zza;->zzx(Landroid/content/Context;)V

    iget-boolean p1, p2, Lcom/google/android/gms/internal/zziv;->zzcge:Z

    iput-boolean p1, p0, Lcom/google/android/gms/internal/zziv$zza;->zzcge:Z

    iget-boolean p1, p2, Lcom/google/android/gms/internal/zziv;->zzcgf:Z

    iput-boolean p1, p0, Lcom/google/android/gms/internal/zziv$zza;->zzcgf:Z

    iget-object p1, p2, Lcom/google/android/gms/internal/zziv;->zzcgh:Ljava/lang/String;

    iput-object p1, p0, Lcom/google/android/gms/internal/zziv$zza;->zzcgh:Ljava/lang/String;

    iget-boolean p1, p2, Lcom/google/android/gms/internal/zziv;->zzcgi:Z

    iput-boolean p1, p0, Lcom/google/android/gms/internal/zziv$zza;->zzcgi:Z

    iget-boolean p1, p2, Lcom/google/android/gms/internal/zziv;->zzcgj:Z

    iput-boolean p1, p0, Lcom/google/android/gms/internal/zziv$zza;->zzcgj:Z

    iget-object p1, p2, Lcom/google/android/gms/internal/zziv;->zzcgm:Ljava/lang/String;

    iput-object p1, p0, Lcom/google/android/gms/internal/zziv$zza;->zzcgm:Ljava/lang/String;

    iget-object p1, p2, Lcom/google/android/gms/internal/zziv;->zzcgn:Ljava/lang/String;

    iput-object p1, p0, Lcom/google/android/gms/internal/zziv$zza;->zzcgn:Ljava/lang/String;

    iget p1, p2, Lcom/google/android/gms/internal/zziv;->zzcbd:F

    iput p1, p0, Lcom/google/android/gms/internal/zziv$zza;->zzcbd:F

    iget p1, p2, Lcom/google/android/gms/internal/zziv;->zzcbb:I

    iput p1, p0, Lcom/google/android/gms/internal/zziv$zza;->zzcbb:I

    iget p1, p2, Lcom/google/android/gms/internal/zziv;->zzcbc:I

    iput p1, p0, Lcom/google/android/gms/internal/zziv$zza;->zzcbc:I

    return-void
.end method

.method private static zza(Landroid/content/pm/PackageManager;Ljava/lang/String;)Landroid/content/pm/ResolveInfo;
    .locals 2

    new-instance v0, Landroid/content/Intent;

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const/high16 p1, 0x10000

    invoke-virtual {p0, v0, p1}, Landroid/content/pm/PackageManager;->resolveActivity(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    move-result-object p0

    return-object p0
.end method

.method private static zza(Landroid/content/pm/PackageManager;)Ljava/lang/String;
    .locals 4

    const-string v0, "market://details?id=com.google.android.gms.ads"

    invoke-static {p0, v0}, Lcom/google/android/gms/internal/zziv$zza;->zza(Landroid/content/pm/PackageManager;Ljava/lang/String;)Landroid/content/pm/ResolveInfo;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    :cond_0
    iget-object v0, v0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    if-nez v0, :cond_1

    return-object v1

    :cond_1
    :try_start_0
    iget-object v2, v0, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object p0

    if-eqz p0, :cond_2

    iget p0, p0, Landroid/content/pm/PackageInfo;->versionCode:I

    iget-object v0, v0, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, 0xc

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, "."

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_2
    return-object v1
.end method

.method private zza(Landroid/content/Context;Landroid/content/pm/PackageManager;)V
    .locals 4

    const-string v0, "phone"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    const-string v1, "connectivity"

    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/ConnectivityManager;

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getNetworkOperator()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/google/android/gms/internal/zziv$zza;->zzcgg:Ljava/lang/String;

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getNetworkType()I

    move-result v2

    iput v2, p0, Lcom/google/android/gms/internal/zziv$zza;->zzcgq:I

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getPhoneType()I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/internal/zziv$zza;->zzcgr:I

    const/4 v0, -0x2

    iput v0, p0, Lcom/google/android/gms/internal/zziv$zza;->zzcgp:I

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zziv$zza;->zzcgw:Z

    const/4 v0, -0x1

    iput v0, p0, Lcom/google/android/gms/internal/zziv$zza;->zzcgx:I

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzfq()Lcom/google/android/gms/internal/zzkh;

    move-result-object v2

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p1

    const-string v3, "android.permission.ACCESS_NETWORK_STATE"

    invoke-virtual {v2, p2, p1, v3}, Lcom/google/android/gms/internal/zzkh;->zza(Landroid/content/pm/PackageManager;Ljava/lang/String;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1

    invoke-virtual {v1}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/net/NetworkInfo;->getType()I

    move-result p2

    iput p2, p0, Lcom/google/android/gms/internal/zziv$zza;->zzcgp:I

    invoke-virtual {p1}, Landroid/net/NetworkInfo;->getDetailedState()Landroid/net/NetworkInfo$DetailedState;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/NetworkInfo$DetailedState;->ordinal()I

    move-result p1

    iput p1, p0, Lcom/google/android/gms/internal/zziv$zza;->zzcgx:I

    goto :goto_0

    :cond_0
    iput v0, p0, Lcom/google/android/gms/internal/zziv$zza;->zzcgp:I

    :goto_0
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 p2, 0x10

    if-lt p1, p2, :cond_1

    invoke-virtual {v1}, Landroid/net/ConnectivityManager;->isActiveNetworkMetered()Z

    move-result p1

    iput-boolean p1, p0, Lcom/google/android/gms/internal/zziv$zza;->zzcgw:Z

    :cond_1
    return-void
.end method

.method private zzv(Landroid/content/Context;)V
    .locals 2

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzfq()Lcom/google/android/gms/internal/zzkh;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzkh;->zzak(Landroid/content/Context;)Landroid/media/AudioManager;

    move-result-object p1

    if-eqz p1, :cond_0

    :try_start_0
    invoke-virtual {p1}, Landroid/media/AudioManager;->getMode()I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/internal/zziv$zza;->zzcgd:I

    invoke-virtual {p1}, Landroid/media/AudioManager;->isMusicActive()Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zziv$zza;->zzcgk:Z

    invoke-virtual {p1}, Landroid/media/AudioManager;->isSpeakerphoneOn()Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zziv$zza;->zzcgl:Z

    const/4 v0, 0x3

    invoke-virtual {p1, v0}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/internal/zziv$zza;->zzcgo:I

    invoke-virtual {p1}, Landroid/media/AudioManager;->getRingerMode()I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/internal/zziv$zza;->zzcgs:I

    const/4 v0, 0x2

    invoke-virtual {p1, v0}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result p1

    iput p1, p0, Lcom/google/android/gms/internal/zziv$zza;->zzcgt:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p1

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzft()Lcom/google/android/gms/internal/zzjx;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Lcom/google/android/gms/internal/zzjx;->zzb(Ljava/lang/Throwable;Z)V

    :cond_0
    const/4 p1, -0x2

    iput p1, p0, Lcom/google/android/gms/internal/zziv$zza;->zzcgd:I

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/google/android/gms/internal/zziv$zza;->zzcgk:Z

    iput-boolean p1, p0, Lcom/google/android/gms/internal/zziv$zza;->zzcgl:Z

    iput p1, p0, Lcom/google/android/gms/internal/zziv$zza;->zzcgo:I

    iput p1, p0, Lcom/google/android/gms/internal/zziv$zza;->zzcgs:I

    iput p1, p0, Lcom/google/android/gms/internal/zziv$zza;->zzcgt:I

    return-void
.end method

.method private zzw(Landroid/content/Context;)V
    .locals 5

    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.intent.action.BATTERY_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    const/4 v1, 0x0

    invoke-virtual {p1, v1, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    move-result-object p1

    const/4 v0, 0x0

    if-eqz p1, :cond_1

    const/4 v1, -0x1

    const-string v2, "status"

    invoke-virtual {p1, v2, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    const-string v3, "level"

    invoke-virtual {p1, v3, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    const-string v4, "scale"

    invoke-virtual {p1, v4, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    int-to-float v1, v3

    int-to-float p1, p1

    div-float/2addr v1, p1

    float-to-double v3, v1

    iput-wide v3, p0, Lcom/google/android/gms/internal/zziv$zza;->zzcgu:D

    const/4 p1, 0x2

    if-eq v2, p1, :cond_0

    const/4 p1, 0x5

    if-ne v2, p1, :cond_2

    :cond_0
    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const-wide/high16 v1, -0x4010000000000000L    # -1.0

    iput-wide v1, p0, Lcom/google/android/gms/internal/zziv$zza;->zzcgu:D

    :cond_2
    :goto_0
    iput-boolean v0, p0, Lcom/google/android/gms/internal/zziv$zza;->zzcgv:Z

    return-void
.end method

.method private zzx(Landroid/content/Context;)V
    .locals 1

    sget-object v0, Landroid/os/Build;->FINGERPRINT:Ljava/lang/String;

    iput-object v0, p0, Lcom/google/android/gms/internal/zziv$zza;->zzcgy:Ljava/lang/String;

    invoke-static {p1}, Lcom/google/android/gms/internal/zzdq;->zzo(Landroid/content/Context;)Z

    move-result p1

    iput-boolean p1, p0, Lcom/google/android/gms/internal/zziv$zza;->zzcgz:Z

    return-void
.end method


# virtual methods
.method public zzrn()Lcom/google/android/gms/internal/zziv;
    .locals 32

    move-object/from16 v0, p0

    new-instance v29, Lcom/google/android/gms/internal/zziv;

    move-object/from16 v1, v29

    iget v2, v0, Lcom/google/android/gms/internal/zziv$zza;->zzcgd:I

    iget-boolean v3, v0, Lcom/google/android/gms/internal/zziv$zza;->zzcge:Z

    iget-boolean v4, v0, Lcom/google/android/gms/internal/zziv$zza;->zzcgf:Z

    iget-object v5, v0, Lcom/google/android/gms/internal/zziv$zza;->zzcgg:Ljava/lang/String;

    iget-object v6, v0, Lcom/google/android/gms/internal/zziv$zza;->zzcgh:Ljava/lang/String;

    iget-boolean v7, v0, Lcom/google/android/gms/internal/zziv$zza;->zzcgi:Z

    iget-boolean v8, v0, Lcom/google/android/gms/internal/zziv$zza;->zzcgj:Z

    iget-boolean v9, v0, Lcom/google/android/gms/internal/zziv$zza;->zzcgk:Z

    iget-boolean v10, v0, Lcom/google/android/gms/internal/zziv$zza;->zzcgl:Z

    iget-object v11, v0, Lcom/google/android/gms/internal/zziv$zza;->zzcgm:Ljava/lang/String;

    iget-object v12, v0, Lcom/google/android/gms/internal/zziv$zza;->zzcgn:Ljava/lang/String;

    iget v13, v0, Lcom/google/android/gms/internal/zziv$zza;->zzcgo:I

    iget v14, v0, Lcom/google/android/gms/internal/zziv$zza;->zzcgp:I

    iget v15, v0, Lcom/google/android/gms/internal/zziv$zza;->zzcgq:I

    move-object/from16 v30, v1

    iget v1, v0, Lcom/google/android/gms/internal/zziv$zza;->zzcgr:I

    move/from16 v16, v1

    iget v1, v0, Lcom/google/android/gms/internal/zziv$zza;->zzcgs:I

    move/from16 v17, v1

    iget v1, v0, Lcom/google/android/gms/internal/zziv$zza;->zzcgt:I

    move/from16 v18, v1

    iget v1, v0, Lcom/google/android/gms/internal/zziv$zza;->zzcbd:F

    move/from16 v19, v1

    iget v1, v0, Lcom/google/android/gms/internal/zziv$zza;->zzcbb:I

    move/from16 v20, v1

    iget v1, v0, Lcom/google/android/gms/internal/zziv$zza;->zzcbc:I

    move/from16 v21, v1

    move/from16 v31, v2

    iget-wide v1, v0, Lcom/google/android/gms/internal/zziv$zza;->zzcgu:D

    move-wide/from16 v22, v1

    iget-boolean v1, v0, Lcom/google/android/gms/internal/zziv$zza;->zzcgv:Z

    move/from16 v24, v1

    iget-boolean v1, v0, Lcom/google/android/gms/internal/zziv$zza;->zzcgw:Z

    move/from16 v25, v1

    iget v1, v0, Lcom/google/android/gms/internal/zziv$zza;->zzcgx:I

    move/from16 v26, v1

    iget-object v1, v0, Lcom/google/android/gms/internal/zziv$zza;->zzcgy:Ljava/lang/String;

    move-object/from16 v27, v1

    iget-boolean v1, v0, Lcom/google/android/gms/internal/zziv$zza;->zzcgz:Z

    move/from16 v28, v1

    move-object/from16 v1, v30

    move/from16 v2, v31

    invoke-direct/range {v1 .. v28}, Lcom/google/android/gms/internal/zziv;-><init>(IZZLjava/lang/String;Ljava/lang/String;ZZZZLjava/lang/String;Ljava/lang/String;IIIIIIFIIDZZILjava/lang/String;Z)V

    return-object v29
.end method
