.class public Lcom/google/android/gms/ads/internal/formats/zzg;
.super Lcom/google/android/gms/ads/internal/formats/zzi;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzin;
.end annotation


# instance fields
.field private zzail:Ljava/lang/Object;

.field private zzbfv:Lcom/google/android/gms/internal/zzgn;

.field private zzbfw:Lcom/google/android/gms/internal/zzgo;

.field private final zzbfx:Lcom/google/android/gms/ads/internal/zzq;

.field private zzbfy:Lcom/google/android/gms/ads/internal/formats/zzh;

.field private zzbfz:Z


# direct methods
.method private constructor <init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/zzq;Lcom/google/android/gms/internal/zzas;)V
    .locals 9

    const/4 v3, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, p3

    invoke-direct/range {v0 .. v8}, Lcom/google/android/gms/ads/internal/formats/zzi;-><init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/zzq;Lcom/google/android/gms/internal/zzih;Lcom/google/android/gms/internal/zzas;Lorg/json/JSONObject;Lcom/google/android/gms/ads/internal/formats/zzh$zza;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;Ljava/lang/String;)V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/google/android/gms/ads/internal/formats/zzg;->zzbfz:Z

    new-instance p1, Ljava/lang/Object;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/ads/internal/formats/zzg;->zzail:Ljava/lang/Object;

    iput-object p2, p0, Lcom/google/android/gms/ads/internal/formats/zzg;->zzbfx:Lcom/google/android/gms/ads/internal/zzq;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/zzq;Lcom/google/android/gms/internal/zzas;Lcom/google/android/gms/internal/zzgn;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/gms/ads/internal/formats/zzg;-><init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/zzq;Lcom/google/android/gms/internal/zzas;)V

    iput-object p4, p0, Lcom/google/android/gms/ads/internal/formats/zzg;->zzbfv:Lcom/google/android/gms/internal/zzgn;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/zzq;Lcom/google/android/gms/internal/zzas;Lcom/google/android/gms/internal/zzgo;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/gms/ads/internal/formats/zzg;-><init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/zzq;Lcom/google/android/gms/internal/zzas;)V

    iput-object p4, p0, Lcom/google/android/gms/ads/internal/formats/zzg;->zzbfw:Lcom/google/android/gms/internal/zzgo;

    return-void
.end method


# virtual methods
.method public recordImpression()V
    .locals 3

    const-string v0, "recordImpression must be called on the main UI thread."

    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzab;->zzhi(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzg;->zzail:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x1

    :try_start_0
    invoke-virtual {p0, v1}, Lcom/google/android/gms/ads/internal/formats/zzg;->zzq(Z)V

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/formats/zzg;->zzbfy:Lcom/google/android/gms/ads/internal/formats/zzh;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/formats/zzg;->zzbfy:Lcom/google/android/gms/ads/internal/formats/zzh;

    invoke-interface {v1}, Lcom/google/android/gms/ads/internal/formats/zzh;->recordImpression()V

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/formats/zzg;->zzbfx:Lcom/google/android/gms/ads/internal/zzq;

    invoke-virtual {v1}, Lcom/google/android/gms/ads/internal/zzq;->recordImpression()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :cond_0
    :try_start_1
    iget-object v1, p0, Lcom/google/android/gms/ads/internal/formats/zzg;->zzbfv:Lcom/google/android/gms/internal/zzgn;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/formats/zzg;->zzbfv:Lcom/google/android/gms/internal/zzgn;

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzgn;->getOverrideImpressionRecording()Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/formats/zzg;->zzbfv:Lcom/google/android/gms/internal/zzgn;

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzgn;->recordImpression()V

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/formats/zzg;->zzbfx:Lcom/google/android/gms/ads/internal/zzq;

    :goto_0
    invoke-virtual {v1}, Lcom/google/android/gms/ads/internal/zzq;->recordImpression()V

    goto :goto_1

    :cond_1
    iget-object v1, p0, Lcom/google/android/gms/ads/internal/formats/zzg;->zzbfw:Lcom/google/android/gms/internal/zzgo;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/formats/zzg;->zzbfw:Lcom/google/android/gms/internal/zzgo;

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzgo;->getOverrideImpressionRecording()Z

    move-result v1

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/formats/zzg;->zzbfw:Lcom/google/android/gms/internal/zzgo;

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzgo;->recordImpression()V

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/formats/zzg;->zzbfx:Lcom/google/android/gms/ads/internal/zzq;
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception v1

    :try_start_2
    const-string v2, "Failed to call recordImpression"

    invoke-static {v2, v1}, Lcom/google/android/gms/internal/zzkd;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_2
    :goto_1
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_3

    :goto_2
    throw v1

    :goto_3
    goto :goto_2
.end method

.method public zza(Landroid/view/View$OnClickListener;)Lcom/google/android/gms/ads/internal/formats/zzb;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public zza(Landroid/view/View;Ljava/util/Map;Landroid/view/View$OnTouchListener;Landroid/view/View$OnClickListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/View;",
            ">;>;",
            "Landroid/view/View$OnTouchListener;",
            "Landroid/view/View$OnClickListener;",
            ")V"
        }
    .end annotation

    iget-object p2, p0, Lcom/google/android/gms/ads/internal/formats/zzg;->zzail:Ljava/lang/Object;

    monitor-enter p2

    const/4 p3, 0x1

    :try_start_0
    iput-boolean p3, p0, Lcom/google/android/gms/ads/internal/formats/zzg;->zzbfz:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    iget-object p3, p0, Lcom/google/android/gms/ads/internal/formats/zzg;->zzbfv:Lcom/google/android/gms/internal/zzgn;

    if-eqz p3, :cond_0

    iget-object p3, p0, Lcom/google/android/gms/ads/internal/formats/zzg;->zzbfv:Lcom/google/android/gms/internal/zzgn;

    invoke-static {p1}, Lcom/google/android/gms/dynamic/zze;->zzac(Ljava/lang/Object;)Lcom/google/android/gms/dynamic/zzd;

    move-result-object p1

    invoke-interface {p3, p1}, Lcom/google/android/gms/internal/zzgn;->zzl(Lcom/google/android/gms/dynamic/zzd;)V

    goto :goto_0

    :cond_0
    iget-object p3, p0, Lcom/google/android/gms/ads/internal/formats/zzg;->zzbfw:Lcom/google/android/gms/internal/zzgo;

    if-eqz p3, :cond_1

    iget-object p3, p0, Lcom/google/android/gms/ads/internal/formats/zzg;->zzbfw:Lcom/google/android/gms/internal/zzgo;

    invoke-static {p1}, Lcom/google/android/gms/dynamic/zze;->zzac(Ljava/lang/Object;)Lcom/google/android/gms/dynamic/zzd;

    move-result-object p1

    invoke-interface {p3, p1}, Lcom/google/android/gms/internal/zzgo;->zzl(Lcom/google/android/gms/dynamic/zzd;)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception p1

    :try_start_2
    const-string p3, "Failed to call prepareAd"

    invoke-static {p3, p1}, Lcom/google/android/gms/internal/zzkd;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_1
    :goto_0
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/google/android/gms/ads/internal/formats/zzg;->zzbfz:Z

    monitor-exit p2

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1
.end method

.method public zza(Landroid/view/View;Ljava/util/Map;Lorg/json/JSONObject;Lorg/json/JSONObject;Lorg/json/JSONObject;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/View;",
            ">;>;",
            "Lorg/json/JSONObject;",
            "Lorg/json/JSONObject;",
            "Lorg/json/JSONObject;",
            ")V"
        }
    .end annotation

    const-string v0, "performClick must be called on the main UI thread."

    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzab;->zzhi(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzg;->zzail:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/google/android/gms/ads/internal/formats/zzg;->zzbfy:Lcom/google/android/gms/ads/internal/formats/zzh;

    if-eqz v1, :cond_0

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/formats/zzg;->zzbfy:Lcom/google/android/gms/ads/internal/formats/zzh;

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    move-object v7, p5

    invoke-interface/range {v2 .. v7}, Lcom/google/android/gms/ads/internal/formats/zzh;->zza(Landroid/view/View;Ljava/util/Map;Lorg/json/JSONObject;Lorg/json/JSONObject;Lorg/json/JSONObject;)V

    iget-object p1, p0, Lcom/google/android/gms/ads/internal/formats/zzg;->zzbfx:Lcom/google/android/gms/ads/internal/zzq;

    invoke-virtual {p1}, Lcom/google/android/gms/ads/internal/zzq;->onAdClicked()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :cond_0
    :try_start_1
    iget-object p2, p0, Lcom/google/android/gms/ads/internal/formats/zzg;->zzbfv:Lcom/google/android/gms/internal/zzgn;

    if-eqz p2, :cond_1

    iget-object p2, p0, Lcom/google/android/gms/ads/internal/formats/zzg;->zzbfv:Lcom/google/android/gms/internal/zzgn;

    invoke-interface {p2}, Lcom/google/android/gms/internal/zzgn;->getOverrideClickHandling()Z

    move-result p2

    if-nez p2, :cond_1

    iget-object p2, p0, Lcom/google/android/gms/ads/internal/formats/zzg;->zzbfv:Lcom/google/android/gms/internal/zzgn;

    invoke-static {p1}, Lcom/google/android/gms/dynamic/zze;->zzac(Ljava/lang/Object;)Lcom/google/android/gms/dynamic/zzd;

    move-result-object p3

    invoke-interface {p2, p3}, Lcom/google/android/gms/internal/zzgn;->zzk(Lcom/google/android/gms/dynamic/zzd;)V

    iget-object p2, p0, Lcom/google/android/gms/ads/internal/formats/zzg;->zzbfx:Lcom/google/android/gms/ads/internal/zzq;

    invoke-virtual {p2}, Lcom/google/android/gms/ads/internal/zzq;->onAdClicked()V

    :cond_1
    iget-object p2, p0, Lcom/google/android/gms/ads/internal/formats/zzg;->zzbfw:Lcom/google/android/gms/internal/zzgo;

    if-eqz p2, :cond_2

    iget-object p2, p0, Lcom/google/android/gms/ads/internal/formats/zzg;->zzbfw:Lcom/google/android/gms/internal/zzgo;

    invoke-interface {p2}, Lcom/google/android/gms/internal/zzgo;->getOverrideClickHandling()Z

    move-result p2

    if-nez p2, :cond_2

    iget-object p2, p0, Lcom/google/android/gms/ads/internal/formats/zzg;->zzbfw:Lcom/google/android/gms/internal/zzgo;

    invoke-static {p1}, Lcom/google/android/gms/dynamic/zze;->zzac(Ljava/lang/Object;)Lcom/google/android/gms/dynamic/zzd;

    move-result-object p1

    invoke-interface {p2, p1}, Lcom/google/android/gms/internal/zzgo;->zzk(Lcom/google/android/gms/dynamic/zzd;)V

    iget-object p1, p0, Lcom/google/android/gms/ads/internal/formats/zzg;->zzbfx:Lcom/google/android/gms/ads/internal/zzq;

    invoke-virtual {p1}, Lcom/google/android/gms/ads/internal/zzq;->onAdClicked()V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception p1

    :try_start_2
    const-string p2, "Failed to call performClick"

    invoke-static {p2, p1}, Lcom/google/android/gms/internal/zzkd;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_2
    :goto_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1
.end method

.method public zzb(Landroid/view/View;Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/View;",
            ">;>;)V"
        }
    .end annotation

    iget-object p2, p0, Lcom/google/android/gms/ads/internal/formats/zzg;->zzail:Ljava/lang/Object;

    monitor-enter p2

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzg;->zzbfv:Lcom/google/android/gms/internal/zzgn;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzg;->zzbfv:Lcom/google/android/gms/internal/zzgn;

    invoke-static {p1}, Lcom/google/android/gms/dynamic/zze;->zzac(Ljava/lang/Object;)Lcom/google/android/gms/dynamic/zzd;

    move-result-object p1

    invoke-interface {v0, p1}, Lcom/google/android/gms/internal/zzgn;->zzm(Lcom/google/android/gms/dynamic/zzd;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzg;->zzbfw:Lcom/google/android/gms/internal/zzgo;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzg;->zzbfw:Lcom/google/android/gms/internal/zzgo;

    invoke-static {p1}, Lcom/google/android/gms/dynamic/zze;->zzac(Ljava/lang/Object;)Lcom/google/android/gms/dynamic/zzd;

    move-result-object p1

    invoke-interface {v0, p1}, Lcom/google/android/gms/internal/zzgo;->zzm(Lcom/google/android/gms/dynamic/zzd;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    :catch_0
    move-exception p1

    :try_start_1
    const-string v0, "Failed to call untrackView"

    invoke-static {v0, p1}, Lcom/google/android/gms/internal/zzkd;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_1
    :goto_0
    monitor-exit p2

    return-void

    :goto_1
    monitor-exit p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public zzc(Lcom/google/android/gms/ads/internal/formats/zzh;)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzg;->zzail:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iput-object p1, p0, Lcom/google/android/gms/ads/internal/formats/zzg;->zzbfy:Lcom/google/android/gms/ads/internal/formats/zzh;

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public zzkz()Z
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzg;->zzail:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-boolean v1, p0, Lcom/google/android/gms/ads/internal/formats/zzg;->zzbfz:Z

    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public zzla()Lcom/google/android/gms/ads/internal/formats/zzh;
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzg;->zzail:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/google/android/gms/ads/internal/formats/zzg;->zzbfy:Lcom/google/android/gms/ads/internal/formats/zzh;

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public zzlb()Lcom/google/android/gms/internal/zzlh;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method
