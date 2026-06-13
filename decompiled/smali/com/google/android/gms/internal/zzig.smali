.class public Lcom/google/android/gms/internal/zzig;
.super Lcom/google/android/gms/internal/zzkc;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzin;
.end annotation


# instance fields
.field private final zzail:Ljava/lang/Object;

.field private final zzbxq:Lcom/google/android/gms/internal/zzic$zza;

.field private final zzbxr:Lcom/google/android/gms/internal/zzju$zza;

.field private final zzbxs:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

.field private final zzbyq:Lcom/google/android/gms/internal/zzii;

.field private zzbyr:Ljava/util/concurrent/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Future<",
            "Lcom/google/android/gms/internal/zzju;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/zzq;Lcom/google/android/gms/internal/zzju$zza;Lcom/google/android/gms/internal/zzas;Lcom/google/android/gms/internal/zzic$zza;)V
    .locals 7

    new-instance v6, Lcom/google/android/gms/internal/zzii;

    new-instance v3, Lcom/google/android/gms/internal/zzkn;

    invoke-direct {v3, p1}, Lcom/google/android/gms/internal/zzkn;-><init>(Landroid/content/Context;)V

    move-object v0, v6

    move-object v1, p1

    move-object v2, p2

    move-object v4, p4

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/zzii;-><init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/zzq;Lcom/google/android/gms/internal/zzkn;Lcom/google/android/gms/internal/zzas;Lcom/google/android/gms/internal/zzju$zza;)V

    invoke-direct {p0, p3, p5, v6}, Lcom/google/android/gms/internal/zzig;-><init>(Lcom/google/android/gms/internal/zzju$zza;Lcom/google/android/gms/internal/zzic$zza;Lcom/google/android/gms/internal/zzii;)V

    return-void
.end method

.method constructor <init>(Lcom/google/android/gms/internal/zzju$zza;Lcom/google/android/gms/internal/zzic$zza;Lcom/google/android/gms/internal/zzii;)V
    .locals 1

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzkc;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzig;->zzail:Ljava/lang/Object;

    iput-object p1, p0, Lcom/google/android/gms/internal/zzig;->zzbxr:Lcom/google/android/gms/internal/zzju$zza;

    iget-object p1, p1, Lcom/google/android/gms/internal/zzju$zza;->zzciq:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iput-object p1, p0, Lcom/google/android/gms/internal/zzig;->zzbxs:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzig;->zzbxq:Lcom/google/android/gms/internal/zzic$zza;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzig;->zzbyq:Lcom/google/android/gms/internal/zzii;

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzig;)Lcom/google/android/gms/internal/zzic$zza;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/zzig;->zzbxq:Lcom/google/android/gms/internal/zzic$zza;

    return-object p0
.end method

.method private zzam(I)Lcom/google/android/gms/internal/zzju;
    .locals 38

    move-object/from16 v0, p0

    move/from16 v5, p1

    new-instance v37, Lcom/google/android/gms/internal/zzju;

    move-object/from16 v1, v37

    iget-object v2, v0, Lcom/google/android/gms/internal/zzig;->zzbxr:Lcom/google/android/gms/internal/zzju$zza;

    iget-object v2, v2, Lcom/google/android/gms/internal/zzju$zza;->zzcip:Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzcar:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

    iget-object v3, v0, Lcom/google/android/gms/internal/zzig;->zzbxs:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget v8, v3, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->orientation:I

    iget-object v3, v0, Lcom/google/android/gms/internal/zzig;->zzbxs:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-wide v9, v3, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzbns:J

    iget-object v3, v0, Lcom/google/android/gms/internal/zzig;->zzbxr:Lcom/google/android/gms/internal/zzju$zza;

    iget-object v3, v3, Lcom/google/android/gms/internal/zzju$zza;->zzcip:Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;

    iget-object v11, v3, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzcau:Ljava/lang/String;

    iget-object v3, v0, Lcom/google/android/gms/internal/zzig;->zzbxs:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-wide v3, v3, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzcbz:J

    move-wide/from16 v18, v3

    iget-object v3, v0, Lcom/google/android/gms/internal/zzig;->zzbxr:Lcom/google/android/gms/internal/zzju$zza;

    iget-object v3, v3, Lcom/google/android/gms/internal/zzju$zza;->zzapa:Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    move-object/from16 v20, v3

    iget-object v3, v0, Lcom/google/android/gms/internal/zzig;->zzbxs:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-wide v3, v3, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzcbx:J

    move-wide/from16 v21, v3

    iget-object v3, v0, Lcom/google/android/gms/internal/zzig;->zzbxr:Lcom/google/android/gms/internal/zzju$zza;

    iget-wide v3, v3, Lcom/google/android/gms/internal/zzju$zza;->zzcik:J

    move-wide/from16 v23, v3

    iget-object v3, v0, Lcom/google/android/gms/internal/zzig;->zzbxs:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-wide v3, v3, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzccc:J

    move-wide/from16 v25, v3

    iget-object v3, v0, Lcom/google/android/gms/internal/zzig;->zzbxs:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-object v3, v3, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzccd:Ljava/lang/String;

    move-object/from16 v27, v3

    iget-object v3, v0, Lcom/google/android/gms/internal/zzig;->zzbxr:Lcom/google/android/gms/internal/zzju$zza;

    iget-object v3, v3, Lcom/google/android/gms/internal/zzju$zza;->zzcie:Lorg/json/JSONObject;

    move-object/from16 v28, v3

    iget-object v3, v0, Lcom/google/android/gms/internal/zzig;->zzbxr:Lcom/google/android/gms/internal/zzju$zza;

    iget-object v3, v3, Lcom/google/android/gms/internal/zzju$zza;->zzciq:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-boolean v3, v3, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzccq:Z

    move/from16 v33, v3

    iget-object v3, v0, Lcom/google/android/gms/internal/zzig;->zzbxr:Lcom/google/android/gms/internal/zzju$zza;

    iget-object v3, v3, Lcom/google/android/gms/internal/zzju$zza;->zzciq:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-object v3, v3, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzccr:Lcom/google/android/gms/ads/internal/request/AutoClickProtectionConfigurationParcel;

    move-object/from16 v34, v3

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v29, 0x0

    const/16 v30, 0x0

    const/16 v31, 0x0

    const/16 v32, 0x0

    const/16 v35, 0x0

    const/16 v36, 0x0

    invoke-direct/range {v1 .. v36}, Lcom/google/android/gms/internal/zzju;-><init>(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;Lcom/google/android/gms/internal/zzlh;Ljava/util/List;ILjava/util/List;Ljava/util/List;IJLjava/lang/String;ZLcom/google/android/gms/internal/zzfz;Lcom/google/android/gms/internal/zzgk;Ljava/lang/String;Lcom/google/android/gms/internal/zzga;Lcom/google/android/gms/internal/zzgc;JLcom/google/android/gms/ads/internal/client/AdSizeParcel;JJJLjava/lang/String;Lorg/json/JSONObject;Lcom/google/android/gms/ads/internal/formats/zzh$zza;Lcom/google/android/gms/ads/internal/reward/mediation/client/RewardItemParcel;Ljava/util/List;Ljava/util/List;ZLcom/google/android/gms/ads/internal/request/AutoClickProtectionConfigurationParcel;Ljava/lang/String;Ljava/util/List;)V

    return-object v37
.end method


# virtual methods
.method public onStop()V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzig;->zzail:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzig;->zzbyr:Ljava/util/concurrent/Future;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzig;->zzbyr:Ljava/util/concurrent/Future;

    const/4 v2, 0x1

    invoke-interface {v1, v2}, Ljava/util/concurrent/Future;->cancel(Z)Z

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

.method public zzew()V
    .locals 6

    const/4 v0, 0x0

    const/4 v1, 0x0

    :try_start_0
    iget-object v2, p0, Lcom/google/android/gms/internal/zzig;->zzail:Ljava/lang/Object;

    monitor-enter v2
    :try_end_0
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/util/concurrent/CancellationException; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    iget-object v3, p0, Lcom/google/android/gms/internal/zzig;->zzbyq:Lcom/google/android/gms/internal/zzii;

    invoke-static {v3}, Lcom/google/android/gms/internal/zzkg;->zza(Ljava/util/concurrent/Callable;)Lcom/google/android/gms/internal/zzky;

    move-result-object v3

    iput-object v3, p0, Lcom/google/android/gms/internal/zzig;->zzbyr:Ljava/util/concurrent/Future;

    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    iget-object v2, p0, Lcom/google/android/gms/internal/zzig;->zzbyr:Ljava/util/concurrent/Future;

    const-wide/32 v3, 0xea60

    sget-object v5, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v2, v3, v4, v5}, Ljava/util/concurrent/Future;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/zzju;
    :try_end_2
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/util/concurrent/CancellationException; {:try_start_2 .. :try_end_2} :catch_0

    const/4 v0, -0x2

    move-object v1, v2

    goto :goto_0

    :catchall_0
    move-exception v3

    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw v3
    :try_end_4
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/lang/InterruptedException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/util/concurrent/CancellationException; {:try_start_4 .. :try_end_4} :catch_0

    :catch_0
    nop

    goto :goto_0

    :catch_1
    const-string v0, "Timed out waiting for native ad."

    invoke-static {v0}, Lcom/google/android/gms/internal/zzkd;->zzcx(Ljava/lang/String;)V

    const/4 v0, 0x2

    iget-object v2, p0, Lcom/google/android/gms/internal/zzig;->zzbyr:Ljava/util/concurrent/Future;

    const/4 v3, 0x1

    invoke-interface {v2, v3}, Ljava/util/concurrent/Future;->cancel(Z)Z

    :goto_0
    if-eqz v1, :cond_0

    goto :goto_1

    :cond_0
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzig;->zzam(I)Lcom/google/android/gms/internal/zzju;

    move-result-object v1

    :goto_1
    sget-object v0, Lcom/google/android/gms/internal/zzkh;->zzclc:Landroid/os/Handler;

    new-instance v2, Lcom/google/android/gms/internal/zzig$1;

    invoke-direct {v2, p0, v1}, Lcom/google/android/gms/internal/zzig$1;-><init>(Lcom/google/android/gms/internal/zzig;Lcom/google/android/gms/internal/zzju;)V

    invoke-virtual {v0, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
