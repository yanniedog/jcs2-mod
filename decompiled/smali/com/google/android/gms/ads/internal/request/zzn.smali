.class public Lcom/google/android/gms/ads/internal/request/zzn;
.super Lcom/google/android/gms/internal/zzkc;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzin;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/ads/internal/request/zzn$zza;,
        Lcom/google/android/gms/ads/internal/request/zzn$zzb;,
        Lcom/google/android/gms/ads/internal/request/zzn$zzc;
    }
.end annotation


# static fields
.field private static final zzamr:Ljava/lang/Object;

.field private static zzbyv:Lcom/google/android/gms/internal/zzfs;

.field static final zzcdf:J

.field static zzcdg:Z

.field private static zzcdh:Lcom/google/android/gms/internal/zzeq;

.field private static zzcdi:Lcom/google/android/gms/internal/zzeu;

.field private static zzcdj:Lcom/google/android/gms/internal/zzep;


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final zzbxu:Ljava/lang/Object;

.field private final zzcae:Lcom/google/android/gms/ads/internal/request/zza$zza;

.field private final zzcaf:Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;

.field private zzcdk:Lcom/google/android/gms/internal/zzfs$zzc;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v1, 0xa

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    sput-wide v0, Lcom/google/android/gms/ads/internal/request/zzn;->zzcdf:J

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/google/android/gms/ads/internal/request/zzn;->zzamr:Ljava/lang/Object;

    const/4 v0, 0x0

    sput-boolean v0, Lcom/google/android/gms/ads/internal/request/zzn;->zzcdg:Z

    const/4 v0, 0x0

    sput-object v0, Lcom/google/android/gms/ads/internal/request/zzn;->zzbyv:Lcom/google/android/gms/internal/zzfs;

    sput-object v0, Lcom/google/android/gms/ads/internal/request/zzn;->zzcdh:Lcom/google/android/gms/internal/zzeq;

    sput-object v0, Lcom/google/android/gms/ads/internal/request/zzn;->zzcdi:Lcom/google/android/gms/internal/zzeu;

    sput-object v0, Lcom/google/android/gms/ads/internal/request/zzn;->zzcdj:Lcom/google/android/gms/internal/zzep;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;Lcom/google/android/gms/ads/internal/request/zza$zza;)V
    .locals 7

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzkc;-><init>(Z)V

    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lcom/google/android/gms/ads/internal/request/zzn;->zzbxu:Ljava/lang/Object;

    iput-object p3, p0, Lcom/google/android/gms/ads/internal/request/zzn;->zzcae:Lcom/google/android/gms/ads/internal/request/zza$zza;

    iput-object p1, p0, Lcom/google/android/gms/ads/internal/request/zzn;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/google/android/gms/ads/internal/request/zzn;->zzcaf:Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;

    sget-object p3, Lcom/google/android/gms/ads/internal/request/zzn;->zzamr:Ljava/lang/Object;

    monitor-enter p3

    :try_start_0
    sget-boolean v1, Lcom/google/android/gms/ads/internal/request/zzn;->zzcdg:Z

    if-nez v1, :cond_0

    new-instance v1, Lcom/google/android/gms/internal/zzeu;

    invoke-direct {v1}, Lcom/google/android/gms/internal/zzeu;-><init>()V

    sput-object v1, Lcom/google/android/gms/ads/internal/request/zzn;->zzcdi:Lcom/google/android/gms/internal/zzeu;

    new-instance v1, Lcom/google/android/gms/internal/zzeq;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iget-object p2, p2, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;->zzaow:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    invoke-direct {v1, p1, p2}, Lcom/google/android/gms/internal/zzeq;-><init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;)V

    sput-object v1, Lcom/google/android/gms/ads/internal/request/zzn;->zzcdh:Lcom/google/android/gms/internal/zzeq;

    new-instance p1, Lcom/google/android/gms/ads/internal/request/zzn$zzc;

    invoke-direct {p1}, Lcom/google/android/gms/ads/internal/request/zzn$zzc;-><init>()V

    sput-object p1, Lcom/google/android/gms/ads/internal/request/zzn;->zzcdj:Lcom/google/android/gms/internal/zzep;

    new-instance p1, Lcom/google/android/gms/internal/zzfs;

    iget-object p2, p0, Lcom/google/android/gms/ads/internal/request/zzn;->mContext:Landroid/content/Context;

    invoke-virtual {p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    iget-object p2, p0, Lcom/google/android/gms/ads/internal/request/zzn;->zzcaf:Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;

    iget-object v3, p2, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;->zzaow:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    sget-object p2, Lcom/google/android/gms/internal/zzdc;->zzaxy:Lcom/google/android/gms/internal/zzcy;

    invoke-virtual {p2}, Lcom/google/android/gms/internal/zzcy;->get()Ljava/lang/Object;

    move-result-object p2

    move-object v4, p2

    check-cast v4, Ljava/lang/String;

    new-instance v5, Lcom/google/android/gms/ads/internal/request/zzn$zzb;

    invoke-direct {v5}, Lcom/google/android/gms/ads/internal/request/zzn$zzb;-><init>()V

    new-instance v6, Lcom/google/android/gms/ads/internal/request/zzn$zza;

    invoke-direct {v6}, Lcom/google/android/gms/ads/internal/request/zzn$zza;-><init>()V

    move-object v1, p1

    invoke-direct/range {v1 .. v6}, Lcom/google/android/gms/internal/zzfs;-><init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;Ljava/lang/String;Lcom/google/android/gms/internal/zzkl;Lcom/google/android/gms/internal/zzkl;)V

    sput-object p1, Lcom/google/android/gms/ads/internal/request/zzn;->zzbyv:Lcom/google/android/gms/internal/zzfs;

    sput-boolean v0, Lcom/google/android/gms/ads/internal/request/zzn;->zzcdg:Z

    :cond_0
    monitor-exit p3

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method static synthetic zza(Lcom/google/android/gms/ads/internal/request/zzn;)Lcom/google/android/gms/ads/internal/request/zza$zza;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/ads/internal/request/zzn;->zzcae:Lcom/google/android/gms/ads/internal/request/zza$zza;

    return-object p0
.end method

.method static synthetic zza(Lcom/google/android/gms/ads/internal/request/zzn;Lcom/google/android/gms/internal/zzfs$zzc;)Lcom/google/android/gms/internal/zzfs$zzc;
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/ads/internal/request/zzn;->zzcdk:Lcom/google/android/gms/internal/zzfs$zzc;

    return-object p1
.end method

.method private zza(Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 13

    iget-object v0, p1, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzcar:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/client/AdRequestParcel;->extras:Landroid/os/Bundle;

    const-string v1, "sdk_less_server_data"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    iget-object v1, p1, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzcar:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/client/AdRequestParcel;->extras:Landroid/os/Bundle;

    const-string v2, "sdk_less_network_id"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    if-nez v0, :cond_0

    return-object v2

    :cond_0
    iget-object v3, p0, Lcom/google/android/gms/ads/internal/request/zzn;->mContext:Landroid/content/Context;

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzfw()Lcom/google/android/gms/internal/zziw;

    move-result-object v4

    iget-object v5, p0, Lcom/google/android/gms/ads/internal/request/zzn;->mContext:Landroid/content/Context;

    invoke-virtual {v4, v5}, Lcom/google/android/gms/internal/zziw;->zzy(Landroid/content/Context;)Lcom/google/android/gms/internal/zziv;

    move-result-object v5

    const/4 v6, 0x0

    const/4 v7, 0x0

    new-instance v8, Lcom/google/android/gms/internal/zzcv;

    sget-object v4, Lcom/google/android/gms/internal/zzdc;->zzaxy:Lcom/google/android/gms/internal/zzcy;

    invoke-virtual {v4}, Lcom/google/android/gms/internal/zzcy;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-direct {v8, v4}, Lcom/google/android/gms/internal/zzcv;-><init>(Ljava/lang/String;)V

    const/4 v9, 0x0

    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    const/4 v11, 0x0

    const/4 v12, 0x0

    move-object v4, p1

    invoke-static/range {v3 .. v12}, Lcom/google/android/gms/internal/zziq;->zza(Landroid/content/Context;Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;Lcom/google/android/gms/internal/zziv;Lcom/google/android/gms/internal/zziz$zza;Landroid/location/Location;Lcom/google/android/gms/internal/zzcv;Ljava/lang/String;Ljava/util/List;Landroid/os/Bundle;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    if-nez p1, :cond_1

    return-object v2

    :cond_1
    :try_start_0
    iget-object v3, p0, Lcom/google/android/gms/ads/internal/request/zzn;->mContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient;->getAdvertisingIdInfo(Landroid/content/Context;)Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;

    move-result-object v3
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Lcom/google/android/gms/common/GooglePlayServicesNotAvailableException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lcom/google/android/gms/common/GooglePlayServicesRepairableException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v3

    goto :goto_0

    :catch_1
    move-exception v3

    goto :goto_0

    :catch_2
    move-exception v3

    goto :goto_0

    :catch_3
    move-exception v3

    :goto_0
    const-string v4, "Cannot get advertising id info"

    invoke-static {v4, v3}, Lcom/google/android/gms/internal/zzkd;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    move-object v3, v2

    :goto_1
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    const-string v5, "request_id"

    invoke-virtual {v4, v5, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p2, "network_id"

    invoke-virtual {v4, p2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p2, "request_param"

    invoke-virtual {v4, p2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "data"

    invoke-virtual {v4, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz v3, :cond_2

    invoke-virtual {v3}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;->getId()Ljava/lang/String;

    move-result-object p1

    const-string p2, "adid"

    invoke-virtual {v4, p2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v3}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;->isLimitAdTrackingEnabled()Z

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    const-string p2, "lat"

    invoke-virtual {v4, p2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2
    :try_start_1
    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzfq()Lcom/google/android/gms/internal/zzkh;

    move-result-object p1

    invoke-virtual {p1, v4}, Lcom/google/android/gms/internal/zzkh;->zzam(Ljava/util/Map;)Lorg/json/JSONObject;

    move-result-object p1
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_4

    return-object p1

    :catch_4
    return-object v2
.end method

.method static synthetic zzb(Lcom/google/android/gms/ads/internal/request/zzn;)Lcom/google/android/gms/internal/zzfs$zzc;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/ads/internal/request/zzn;->zzcdk:Lcom/google/android/gms/internal/zzfs$zzc;

    return-object p0
.end method

.method protected static zzb(Lcom/google/android/gms/internal/zzfp;)V
    .locals 2

    sget-object v0, Lcom/google/android/gms/ads/internal/request/zzn;->zzcdi:Lcom/google/android/gms/internal/zzeu;

    const-string v1, "/loadAd"

    invoke-interface {p0, v1, v0}, Lcom/google/android/gms/internal/zzfp;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzep;)V

    sget-object v0, Lcom/google/android/gms/ads/internal/request/zzn;->zzcdh:Lcom/google/android/gms/internal/zzeq;

    const-string v1, "/fetchHttpRequest"

    invoke-interface {p0, v1, v0}, Lcom/google/android/gms/internal/zzfp;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzep;)V

    sget-object v0, Lcom/google/android/gms/ads/internal/request/zzn;->zzcdj:Lcom/google/android/gms/internal/zzep;

    const-string v1, "/invalidRequest"

    invoke-interface {p0, v1, v0}, Lcom/google/android/gms/internal/zzfp;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzep;)V

    return-void
.end method

.method protected static zzc(Lcom/google/android/gms/internal/zzfp;)V
    .locals 2

    sget-object v0, Lcom/google/android/gms/ads/internal/request/zzn;->zzcdi:Lcom/google/android/gms/internal/zzeu;

    const-string v1, "/loadAd"

    invoke-interface {p0, v1, v0}, Lcom/google/android/gms/internal/zzfp;->zzb(Ljava/lang/String;Lcom/google/android/gms/internal/zzep;)V

    sget-object v0, Lcom/google/android/gms/ads/internal/request/zzn;->zzcdh:Lcom/google/android/gms/internal/zzeq;

    const-string v1, "/fetchHttpRequest"

    invoke-interface {p0, v1, v0}, Lcom/google/android/gms/internal/zzfp;->zzb(Ljava/lang/String;Lcom/google/android/gms/internal/zzep;)V

    sget-object v0, Lcom/google/android/gms/ads/internal/request/zzn;->zzcdj:Lcom/google/android/gms/internal/zzep;

    const-string v1, "/invalidRequest"

    invoke-interface {p0, v1, v0}, Lcom/google/android/gms/internal/zzfp;->zzb(Ljava/lang/String;Lcom/google/android/gms/internal/zzep;)V

    return-void
.end method

.method private zze(Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;)Lcom/google/android/gms/ads/internal/request/AdResponseParcel;
    .locals 8

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzfq()Lcom/google/android/gms/internal/zzkh;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzkh;->zzte()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/ads/internal/request/zzn;->zza(Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    new-instance p1, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    invoke-direct {p1, v2}, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;-><init>(I)V

    return-object p1

    :cond_0
    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzfu()Lcom/google/android/gms/common/util/zze;

    move-result-object v3

    invoke-interface {v3}, Lcom/google/android/gms/common/util/zze;->elapsedRealtime()J

    move-result-wide v3

    sget-object v5, Lcom/google/android/gms/ads/internal/request/zzn;->zzcdi:Lcom/google/android/gms/internal/zzeu;

    invoke-virtual {v5, v0}, Lcom/google/android/gms/internal/zzeu;->zzaw(Ljava/lang/String;)Ljava/util/concurrent/Future;

    move-result-object v5

    sget-object v6, Lcom/google/android/gms/ads/internal/util/client/zza;->zzcnb:Landroid/os/Handler;

    new-instance v7, Lcom/google/android/gms/ads/internal/request/zzn$2;

    invoke-direct {v7, p0, v1, v0}, Lcom/google/android/gms/ads/internal/request/zzn$2;-><init>(Lcom/google/android/gms/ads/internal/request/zzn;Lorg/json/JSONObject;Ljava/lang/String;)V

    invoke-virtual {v6, v7}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    sget-wide v0, Lcom/google/android/gms/ads/internal/request/zzn;->zzcdf:J

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzfu()Lcom/google/android/gms/common/util/zze;

    move-result-object v6

    invoke-interface {v6}, Lcom/google/android/gms/common/util/zze;->elapsedRealtime()J

    move-result-wide v6

    sub-long/2addr v6, v3

    sub-long/2addr v0, v6

    const/4 v3, -0x1

    :try_start_0
    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v5, v0, v1, v4}, Ljava/util/concurrent/Future;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/util/concurrent/CancellationException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    if-nez v0, :cond_1

    new-instance p1, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    invoke-direct {p1, v3}, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;-><init>(I)V

    return-object p1

    :cond_1
    iget-object v1, p0, Lcom/google/android/gms/ads/internal/request/zzn;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, p1, v0}, Lcom/google/android/gms/internal/zziq;->zza(Landroid/content/Context;Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;Ljava/lang/String;)Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    move-result-object p1

    iget v0, p1, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->errorCode:I

    const/4 v1, -0x3

    if-eq v0, v1, :cond_2

    iget-object v0, p1, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->body:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    new-instance p1, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    const/4 v0, 0x3

    invoke-direct {p1, v0}, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;-><init>(I)V

    :cond_2
    return-object p1

    :catch_0
    new-instance p1, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    invoke-direct {p1, v2}, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;-><init>(I)V

    return-object p1

    :catch_1
    new-instance p1, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    const/4 v0, 0x2

    invoke-direct {p1, v0}, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;-><init>(I)V

    return-object p1

    :catch_2
    new-instance p1, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    invoke-direct {p1, v3}, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;-><init>(I)V

    return-object p1
.end method

.method static synthetic zzrc()Lcom/google/android/gms/internal/zzeu;
    .locals 1

    sget-object v0, Lcom/google/android/gms/ads/internal/request/zzn;->zzcdi:Lcom/google/android/gms/internal/zzeu;

    return-object v0
.end method

.method static synthetic zzrd()Lcom/google/android/gms/internal/zzfs;
    .locals 1

    sget-object v0, Lcom/google/android/gms/ads/internal/request/zzn;->zzbyv:Lcom/google/android/gms/internal/zzfs;

    return-object v0
.end method


# virtual methods
.method public onStop()V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/request/zzn;->zzbxu:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/google/android/gms/ads/internal/util/client/zza;->zzcnb:Landroid/os/Handler;

    new-instance v2, Lcom/google/android/gms/ads/internal/request/zzn$3;

    invoke-direct {v2, p0}, Lcom/google/android/gms/ads/internal/request/zzn$3;-><init>(Lcom/google/android/gms/ads/internal/request/zzn;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public zzew()V
    .locals 12

    const-string v0, "SdkLessAdLoaderBackgroundTask started."

    invoke-static {v0}, Lcom/google/android/gms/internal/zzkd;->zzcv(Ljava/lang/String;)V

    new-instance v2, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/request/zzn;->zzcaf:Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;

    const/4 v1, 0x0

    const-wide/16 v3, -0x1

    invoke-direct {v2, v0, v1, v3, v4}, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;-><init>(Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;Ljava/lang/String;J)V

    invoke-direct {p0, v2}, Lcom/google/android/gms/ads/internal/request/zzn;->zze(Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;)Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    move-result-object v3

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzfu()Lcom/google/android/gms/common/util/zze;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/common/util/zze;->elapsedRealtime()J

    move-result-wide v7

    new-instance v0, Lcom/google/android/gms/internal/zzju$zza;

    iget v6, v3, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->errorCode:I

    iget-wide v9, v3, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzccc:J

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v11, 0x0

    move-object v1, v0

    invoke-direct/range {v1 .. v11}, Lcom/google/android/gms/internal/zzju$zza;-><init>(Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;Lcom/google/android/gms/ads/internal/request/AdResponseParcel;Lcom/google/android/gms/internal/zzga;Lcom/google/android/gms/ads/internal/client/AdSizeParcel;IJJLorg/json/JSONObject;)V

    sget-object v1, Lcom/google/android/gms/ads/internal/util/client/zza;->zzcnb:Landroid/os/Handler;

    new-instance v2, Lcom/google/android/gms/ads/internal/request/zzn$1;

    invoke-direct {v2, p0, v0}, Lcom/google/android/gms/ads/internal/request/zzn$1;-><init>(Lcom/google/android/gms/ads/internal/request/zzn;Lcom/google/android/gms/internal/zzju$zza;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
