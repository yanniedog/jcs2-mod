.class public Lcom/google/android/gms/internal/zzif;
.super Lcom/google/android/gms/internal/zzib;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzin;
.end annotation


# instance fields
.field private final zzajn:Lcom/google/android/gms/internal/zzdk;

.field private zzajz:Lcom/google/android/gms/internal/zzgj;

.field private final zzbgf:Lcom/google/android/gms/internal/zzlh;

.field private zzboe:Lcom/google/android/gms/internal/zzga;

.field zzbym:Lcom/google/android/gms/internal/zzfy;

.field protected zzbyn:Lcom/google/android/gms/internal/zzge;

.field private zzbyo:Z


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/google/android/gms/internal/zzju$zza;Lcom/google/android/gms/internal/zzgj;Lcom/google/android/gms/internal/zzic$zza;Lcom/google/android/gms/internal/zzdk;Lcom/google/android/gms/internal/zzlh;)V
    .locals 0

    invoke-direct {p0, p1, p2, p4}, Lcom/google/android/gms/internal/zzib;-><init>(Landroid/content/Context;Lcom/google/android/gms/internal/zzju$zza;Lcom/google/android/gms/internal/zzic$zza;)V

    iput-object p3, p0, Lcom/google/android/gms/internal/zzif;->zzajz:Lcom/google/android/gms/internal/zzgj;

    iget-object p1, p2, Lcom/google/android/gms/internal/zzju$zza;->zzcig:Lcom/google/android/gms/internal/zzga;

    iput-object p1, p0, Lcom/google/android/gms/internal/zzif;->zzboe:Lcom/google/android/gms/internal/zzga;

    iput-object p5, p0, Lcom/google/android/gms/internal/zzif;->zzajn:Lcom/google/android/gms/internal/zzdk;

    iput-object p6, p0, Lcom/google/android/gms/internal/zzif;->zzbgf:Lcom/google/android/gms/internal/zzlh;

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzif;)Lcom/google/android/gms/internal/zzlh;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/zzif;->zzbgf:Lcom/google/android/gms/internal/zzlh;

    return-object p0
.end method

.method private static zza(Lcom/google/android/gms/internal/zzge;)Ljava/lang/String;
    .locals 5

    iget-object v0, p0, Lcom/google/android/gms/internal/zzge;->zzbon:Lcom/google/android/gms/internal/zzfz;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzfz;->zzbmx:Ljava/lang/String;

    iget v1, p0, Lcom/google/android/gms/internal/zzge;->zzbom:I

    invoke-static {v1}, Lcom/google/android/gms/internal/zzif;->zzal(I)I

    move-result v1

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzge;->zzbos:J

    new-instance p0, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, 0x21

    invoke-direct {p0, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "."

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzif;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/google/android/gms/internal/zzif;->zzbyo:Z

    return p1
.end method

.method private static zzal(I)I
    .locals 2

    const/4 v0, -0x1

    const/4 v1, 0x4

    if-eq p0, v0, :cond_4

    if-eqz p0, :cond_3

    const/4 v0, 0x1

    if-eq p0, v0, :cond_2

    const/4 v0, 0x3

    if-eq p0, v0, :cond_1

    if-eq p0, v1, :cond_0

    const/4 v0, 0x5

    if-eq p0, v0, :cond_0

    const/4 p0, 0x6

    return p0

    :cond_0
    return v0

    :cond_1
    const/4 p0, 0x2

    return p0

    :cond_2
    return v0

    :cond_3
    const/4 p0, 0x0

    return p0

    :cond_4
    return v1
.end method

.method private static zzg(Ljava/util/List;)Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/android/gms/internal/zzge;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    const-string v0, ""

    if-nez p0, :cond_0

    return-object v0

    :cond_0
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_1
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/zzge;

    if-eqz v1, :cond_1

    iget-object v2, v1, Lcom/google/android/gms/internal/zzge;->zzbon:Lcom/google/android/gms/internal/zzfz;

    if-eqz v2, :cond_1

    iget-object v2, v1, Lcom/google/android/gms/internal/zzge;->zzbon:Lcom/google/android/gms/internal/zzfz;

    iget-object v2, v2, Lcom/google/android/gms/internal/zzfz;->zzbmx:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_2

    goto :goto_0

    :cond_2
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1}, Lcom/google/android/gms/internal/zzif;->zza(Lcom/google/android/gms/internal/zzge;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    add-int/2addr v3, v4

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "_"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_3
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result p0

    add-int/lit8 p0, p0, -0x1

    const/4 v1, 0x0

    invoke-static {v1, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    invoke-virtual {v0, v1, p0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private zzqf()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/zzib$zza;
        }
    .end annotation

    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    sget-object v1, Lcom/google/android/gms/internal/zzkh;->zzclc:Landroid/os/Handler;

    new-instance v2, Lcom/google/android/gms/internal/zzif$1;

    invoke-direct {v2, p0, v0}, Lcom/google/android/gms/internal/zzif$1;-><init>(Lcom/google/android/gms/internal/zzif;Ljava/util/concurrent/CountDownLatch;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    const-wide/16 v1, 0xa

    const/4 v3, 0x0

    :try_start_0
    sget-object v4, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v1, v2, v4}, Ljava/util/concurrent/CountDownLatch;->await(JLjava/util/concurrent/TimeUnit;)Z
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzif;->zzbxu:Ljava/lang/Object;

    monitor-enter v0

    :try_start_1
    iget-boolean v1, p0, Lcom/google/android/gms/internal/zzif;->zzbyo:Z

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/google/android/gms/internal/zzif;->zzbgf:Lcom/google/android/gms/internal/zzlh;

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzlh;->isDestroyed()Z

    move-result v1

    if-nez v1, :cond_0

    monitor-exit v0

    return-void

    :cond_0
    new-instance v1, Lcom/google/android/gms/internal/zzib$zza;

    const-string v2, "Assets not loaded, web view is destroyed"

    invoke-direct {v1, v2, v3}, Lcom/google/android/gms/internal/zzib$zza;-><init>(Ljava/lang/String;I)V

    throw v1

    :cond_1
    new-instance v1, Lcom/google/android/gms/internal/zzib$zza;

    const-string v2, "View could not be prepared"

    invoke-direct {v1, v2, v3}, Lcom/google/android/gms/internal/zzib$zza;-><init>(Ljava/lang/String;I)V

    throw v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1

    :catch_0
    move-exception v0

    new-instance v1, Lcom/google/android/gms/internal/zzib$zza;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, 0x26

    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v4, "Interrupted while waiting for latch : "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0, v3}, Lcom/google/android/gms/internal/zzib$zza;-><init>(Ljava/lang/String;I)V

    throw v1
.end method


# virtual methods
.method public onStop()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzif;->zzbxu:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    invoke-super {p0}, Lcom/google/android/gms/internal/zzib;->onStop()V

    iget-object v1, p0, Lcom/google/android/gms/internal/zzif;->zzbym:Lcom/google/android/gms/internal/zzfy;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzif;->zzbym:Lcom/google/android/gms/internal/zzfy;

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzfy;->cancel()V

    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method protected zzak(I)Lcom/google/android/gms/internal/zzju;
    .locals 41

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/gms/internal/zzif;->zzbxr:Lcom/google/android/gms/internal/zzju$zza;

    iget-object v1, v1, Lcom/google/android/gms/internal/zzju$zza;->zzcip:Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;

    new-instance v38, Lcom/google/android/gms/internal/zzju;

    iget-object v3, v1, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzcar:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

    iget-object v4, v0, Lcom/google/android/gms/internal/zzif;->zzbgf:Lcom/google/android/gms/internal/zzlh;

    iget-object v2, v0, Lcom/google/android/gms/internal/zzif;->zzbxs:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-object v5, v2, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzbnm:Ljava/util/List;

    iget-object v2, v0, Lcom/google/android/gms/internal/zzif;->zzbxs:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-object v7, v2, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzbnn:Ljava/util/List;

    iget-object v2, v0, Lcom/google/android/gms/internal/zzif;->zzbxs:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-object v8, v2, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzcca:Ljava/util/List;

    iget-object v2, v0, Lcom/google/android/gms/internal/zzif;->zzbxs:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget v9, v2, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->orientation:I

    iget-object v2, v0, Lcom/google/android/gms/internal/zzif;->zzbxs:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-wide v10, v2, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzbns:J

    iget-object v12, v1, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzcau:Ljava/lang/String;

    iget-object v1, v0, Lcom/google/android/gms/internal/zzif;->zzbxs:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-boolean v13, v1, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzcby:Z

    iget-object v1, v0, Lcom/google/android/gms/internal/zzif;->zzbyn:Lcom/google/android/gms/internal/zzge;

    if-eqz v1, :cond_0

    iget-object v1, v1, Lcom/google/android/gms/internal/zzge;->zzbon:Lcom/google/android/gms/internal/zzfz;

    move-object v14, v1

    goto :goto_0

    :cond_0
    const/4 v14, 0x0

    :goto_0
    iget-object v1, v0, Lcom/google/android/gms/internal/zzif;->zzbyn:Lcom/google/android/gms/internal/zzge;

    if-eqz v1, :cond_1

    iget-object v1, v1, Lcom/google/android/gms/internal/zzge;->zzboo:Lcom/google/android/gms/internal/zzgk;

    move-object v15, v1

    goto :goto_1

    :cond_1
    const/4 v15, 0x0

    :goto_1
    iget-object v1, v0, Lcom/google/android/gms/internal/zzif;->zzbyn:Lcom/google/android/gms/internal/zzge;

    if-eqz v1, :cond_2

    iget-object v1, v1, Lcom/google/android/gms/internal/zzge;->zzbop:Ljava/lang/String;

    goto :goto_2

    :cond_2
    const-class v1, Lcom/google/ads/mediation/admob/AdMobAdapter;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    :goto_2
    move-object/from16 v16, v1

    iget-object v1, v0, Lcom/google/android/gms/internal/zzif;->zzboe:Lcom/google/android/gms/internal/zzga;

    iget-object v6, v0, Lcom/google/android/gms/internal/zzif;->zzbyn:Lcom/google/android/gms/internal/zzge;

    if-eqz v6, :cond_3

    iget-object v6, v6, Lcom/google/android/gms/internal/zzge;->zzboq:Lcom/google/android/gms/internal/zzgc;

    move-object/from16 v18, v6

    goto :goto_3

    :cond_3
    const/16 v18, 0x0

    :goto_3
    iget-object v6, v0, Lcom/google/android/gms/internal/zzif;->zzbxs:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    move-object/from16 v17, v14

    move-object/from16 v19, v15

    iget-wide v14, v6, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzcbz:J

    iget-object v6, v0, Lcom/google/android/gms/internal/zzif;->zzbxr:Lcom/google/android/gms/internal/zzju$zza;

    iget-object v6, v6, Lcom/google/android/gms/internal/zzju$zza;->zzapa:Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    iget-object v2, v0, Lcom/google/android/gms/internal/zzif;->zzbxs:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    move-wide/from16 v21, v14

    iget-wide v14, v2, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzcbx:J

    iget-object v2, v0, Lcom/google/android/gms/internal/zzif;->zzbxr:Lcom/google/android/gms/internal/zzju$zza;

    move-wide/from16 v23, v14

    iget-wide v14, v2, Lcom/google/android/gms/internal/zzju$zza;->zzcik:J

    iget-object v2, v0, Lcom/google/android/gms/internal/zzif;->zzbxs:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    move-wide/from16 v25, v14

    iget-wide v14, v2, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzccc:J

    iget-object v2, v0, Lcom/google/android/gms/internal/zzif;->zzbxs:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzccd:Ljava/lang/String;

    move-object/from16 v27, v2

    iget-object v2, v0, Lcom/google/android/gms/internal/zzif;->zzbxr:Lcom/google/android/gms/internal/zzju$zza;

    iget-object v2, v2, Lcom/google/android/gms/internal/zzju$zza;->zzcie:Lorg/json/JSONObject;

    const/16 v30, 0x0

    move-object/from16 v28, v2

    iget-object v2, v0, Lcom/google/android/gms/internal/zzif;->zzbxs:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzccn:Lcom/google/android/gms/ads/internal/reward/mediation/client/RewardItemParcel;

    move-object/from16 v29, v2

    iget-object v2, v0, Lcom/google/android/gms/internal/zzif;->zzbxs:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzcco:Ljava/util/List;

    move-object/from16 v31, v2

    iget-object v2, v0, Lcom/google/android/gms/internal/zzif;->zzbxs:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzccp:Ljava/util/List;

    move-object/from16 v32, v2

    iget-object v2, v0, Lcom/google/android/gms/internal/zzif;->zzboe:Lcom/google/android/gms/internal/zzga;

    if-eqz v2, :cond_4

    iget-boolean v2, v2, Lcom/google/android/gms/internal/zzga;->zzbnx:Z

    move/from16 v34, v2

    goto :goto_4

    :cond_4
    const/4 v2, 0x0

    const/16 v34, 0x0

    :goto_4
    iget-object v2, v0, Lcom/google/android/gms/internal/zzif;->zzbxs:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzccr:Lcom/google/android/gms/ads/internal/request/AutoClickProtectionConfigurationParcel;

    move-object/from16 v33, v2

    iget-object v2, v0, Lcom/google/android/gms/internal/zzif;->zzbym:Lcom/google/android/gms/internal/zzfy;

    if-eqz v2, :cond_5

    invoke-interface {v2}, Lcom/google/android/gms/internal/zzfy;->zzmg()Ljava/util/List;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/gms/internal/zzif;->zzg(Ljava/util/List;)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v36, v2

    goto :goto_5

    :cond_5
    const/16 v36, 0x0

    :goto_5
    iget-object v2, v0, Lcom/google/android/gms/internal/zzif;->zzbxs:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzbnp:Ljava/util/List;

    move-object/from16 v37, v2

    move-object/from16 v35, v33

    move-object/from16 v33, v32

    move-object/from16 v32, v31

    move-object/from16 v31, v29

    move-object/from16 v29, v28

    move-object/from16 v28, v27

    move-object/from16 v2, v38

    move-object/from16 v27, v6

    move/from16 v6, p1

    move-wide/from16 v39, v14

    move-wide/from16 v20, v21

    move-wide/from16 v22, v23

    move-wide/from16 v24, v25

    move-object/from16 v14, v17

    move-object/from16 v15, v19

    move-object/from16 v17, v1

    move-wide/from16 v19, v20

    move-object/from16 v21, v27

    move-wide/from16 v26, v39

    invoke-direct/range {v2 .. v37}, Lcom/google/android/gms/internal/zzju;-><init>(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;Lcom/google/android/gms/internal/zzlh;Ljava/util/List;ILjava/util/List;Ljava/util/List;IJLjava/lang/String;ZLcom/google/android/gms/internal/zzfz;Lcom/google/android/gms/internal/zzgk;Ljava/lang/String;Lcom/google/android/gms/internal/zzga;Lcom/google/android/gms/internal/zzgc;JLcom/google/android/gms/ads/internal/client/AdSizeParcel;JJJLjava/lang/String;Lorg/json/JSONObject;Lcom/google/android/gms/ads/internal/formats/zzh$zza;Lcom/google/android/gms/ads/internal/reward/mediation/client/RewardItemParcel;Ljava/util/List;Ljava/util/List;ZLcom/google/android/gms/ads/internal/request/AutoClickProtectionConfigurationParcel;Ljava/lang/String;Ljava/util/List;)V

    return-object v38
.end method

.method protected zzh(J)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/zzib$zza;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzif;->zzbxu:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/internal/zzif;->zzi(J)Lcom/google/android/gms/internal/zzfy;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/gms/internal/zzif;->zzbym:Lcom/google/android/gms/internal/zzfy;

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    new-instance p1, Ljava/util/ArrayList;

    iget-object p2, p0, Lcom/google/android/gms/internal/zzif;->zzboe:Lcom/google/android/gms/internal/zzga;

    iget-object p2, p2, Lcom/google/android/gms/internal/zzga;->zzbnk:Ljava/util/List;

    invoke-direct {p1, p2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iget-object p2, p0, Lcom/google/android/gms/internal/zzif;->zzbxr:Lcom/google/android/gms/internal/zzju$zza;

    iget-object p2, p2, Lcom/google/android/gms/internal/zzju$zza;->zzcip:Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;

    iget-object p2, p2, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzcar:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

    iget-object p2, p2, Lcom/google/android/gms/ads/internal/client/AdRequestParcel;->zzatw:Landroid/os/Bundle;

    const-string v0, "com.google.ads.mediation.admob.AdMobAdapter"

    const/4 v1, 0x0

    if-eqz p2, :cond_0

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p2

    if-eqz p2, :cond_0

    const-string v2, "_skipMediation"

    invoke-virtual {p2, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result p2

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    :goto_0
    if-eqz p2, :cond_2

    invoke-interface {p1}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    move-result-object p2

    :cond_1
    :goto_1
    invoke-interface {p2}, Ljava/util/ListIterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {p2}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/zzfz;

    iget-object v2, v2, Lcom/google/android/gms/internal/zzfz;->zzbmw:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    invoke-interface {p2}, Ljava/util/ListIterator;->remove()V

    goto :goto_1

    :cond_2
    iget-object p2, p0, Lcom/google/android/gms/internal/zzif;->zzbym:Lcom/google/android/gms/internal/zzfy;

    invoke-interface {p2, p1}, Lcom/google/android/gms/internal/zzfy;->zzd(Ljava/util/List;)Lcom/google/android/gms/internal/zzge;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/gms/internal/zzif;->zzbyn:Lcom/google/android/gms/internal/zzge;

    iget-object p1, p0, Lcom/google/android/gms/internal/zzif;->zzbyn:Lcom/google/android/gms/internal/zzge;

    iget p1, p1, Lcom/google/android/gms/internal/zzge;->zzbom:I

    if-eqz p1, :cond_4

    const/4 p2, 0x1

    if-eq p1, p2, :cond_3

    new-instance p1, Lcom/google/android/gms/internal/zzib$zza;

    iget-object p2, p0, Lcom/google/android/gms/internal/zzif;->zzbyn:Lcom/google/android/gms/internal/zzge;

    iget p2, p2, Lcom/google/android/gms/internal/zzge;->zzbom:I

    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v2, 0x28

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v2, "Unexpected mediation result: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2, v1}, Lcom/google/android/gms/internal/zzib$zza;-><init>(Ljava/lang/String;I)V

    throw p1

    :cond_3
    new-instance p1, Lcom/google/android/gms/internal/zzib$zza;

    const/4 p2, 0x3

    const-string v0, "No fill from any mediation ad networks."

    invoke-direct {p1, v0, p2}, Lcom/google/android/gms/internal/zzib$zza;-><init>(Ljava/lang/String;I)V

    throw p1

    :cond_4
    iget-object p1, p0, Lcom/google/android/gms/internal/zzif;->zzbyn:Lcom/google/android/gms/internal/zzge;

    iget-object p1, p1, Lcom/google/android/gms/internal/zzge;->zzbon:Lcom/google/android/gms/internal/zzfz;

    if-eqz p1, :cond_5

    iget-object p1, p0, Lcom/google/android/gms/internal/zzif;->zzbyn:Lcom/google/android/gms/internal/zzge;

    iget-object p1, p1, Lcom/google/android/gms/internal/zzge;->zzbon:Lcom/google/android/gms/internal/zzfz;

    iget-object p1, p1, Lcom/google/android/gms/internal/zzfz;->zzbnf:Ljava/lang/String;

    if-eqz p1, :cond_5

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzif;->zzqf()V

    :cond_5
    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_3

    :goto_2
    throw p1

    :goto_3
    goto :goto_2
.end method

.method zzi(J)Lcom/google/android/gms/internal/zzfy;
    .locals 27

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/gms/internal/zzif;->zzboe:Lcom/google/android/gms/internal/zzga;

    iget v1, v1, Lcom/google/android/gms/internal/zzga;->zzbnv:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    new-instance v1, Lcom/google/android/gms/internal/zzgg;

    iget-object v4, v0, Lcom/google/android/gms/internal/zzif;->mContext:Landroid/content/Context;

    iget-object v2, v0, Lcom/google/android/gms/internal/zzif;->zzbxr:Lcom/google/android/gms/internal/zzju$zza;

    iget-object v5, v2, Lcom/google/android/gms/internal/zzju$zza;->zzcip:Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;

    iget-object v6, v0, Lcom/google/android/gms/internal/zzif;->zzajz:Lcom/google/android/gms/internal/zzgj;

    iget-object v7, v0, Lcom/google/android/gms/internal/zzif;->zzboe:Lcom/google/android/gms/internal/zzga;

    iget-object v2, v0, Lcom/google/android/gms/internal/zzif;->zzbxs:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-boolean v8, v2, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzauu:Z

    iget-object v2, v0, Lcom/google/android/gms/internal/zzif;->zzbxs:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-boolean v9, v2, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzauw:Z

    sget-object v2, Lcom/google/android/gms/internal/zzdc;->zzbbh:Lcom/google/android/gms/internal/zzcy;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzcy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v12

    const/4 v14, 0x2

    move-object v3, v1

    move-wide/from16 v10, p1

    invoke-direct/range {v3 .. v14}, Lcom/google/android/gms/internal/zzgg;-><init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;Lcom/google/android/gms/internal/zzgj;Lcom/google/android/gms/internal/zzga;ZZJJI)V

    return-object v1

    :cond_0
    new-instance v1, Lcom/google/android/gms/internal/zzgh;

    iget-object v2, v0, Lcom/google/android/gms/internal/zzif;->mContext:Landroid/content/Context;

    iget-object v3, v0, Lcom/google/android/gms/internal/zzif;->zzbxr:Lcom/google/android/gms/internal/zzju$zza;

    iget-object v3, v3, Lcom/google/android/gms/internal/zzju$zza;->zzcip:Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;

    iget-object v4, v0, Lcom/google/android/gms/internal/zzif;->zzajz:Lcom/google/android/gms/internal/zzgj;

    iget-object v5, v0, Lcom/google/android/gms/internal/zzif;->zzboe:Lcom/google/android/gms/internal/zzga;

    iget-object v6, v0, Lcom/google/android/gms/internal/zzif;->zzbxs:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-boolean v6, v6, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzauu:Z

    iget-object v7, v0, Lcom/google/android/gms/internal/zzif;->zzbxs:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-boolean v7, v7, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzauw:Z

    sget-object v8, Lcom/google/android/gms/internal/zzdc;->zzbbh:Lcom/google/android/gms/internal/zzcy;

    invoke-virtual {v8}, Lcom/google/android/gms/internal/zzcy;->get()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Long;

    invoke-virtual {v8}, Ljava/lang/Long;->longValue()J

    move-result-wide v24

    iget-object v8, v0, Lcom/google/android/gms/internal/zzif;->zzajn:Lcom/google/android/gms/internal/zzdk;

    move-object v15, v1

    move-object/from16 v16, v2

    move-object/from16 v17, v3

    move-object/from16 v18, v4

    move-object/from16 v19, v5

    move/from16 v20, v6

    move/from16 v21, v7

    move-wide/from16 v22, p1

    move-object/from16 v26, v8

    invoke-direct/range {v15 .. v26}, Lcom/google/android/gms/internal/zzgh;-><init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;Lcom/google/android/gms/internal/zzgj;Lcom/google/android/gms/internal/zzga;ZZJJLcom/google/android/gms/internal/zzdk;)V

    return-object v1
.end method
