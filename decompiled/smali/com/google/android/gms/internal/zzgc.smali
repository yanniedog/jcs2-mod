.class public final Lcom/google/android/gms/internal/zzgc;
.super Lcom/google/android/gms/internal/zzgl$zza;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzin;
.end annotation


# instance fields
.field private final zzail:Ljava/lang/Object;

.field private zzboa:Lcom/google/android/gms/internal/zzge$zza;

.field private zzbob:Lcom/google/android/gms/internal/zzgb;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzgl$zza;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzail:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public onAdClicked()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzail:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgc;->zzbob:Lcom/google/android/gms/internal/zzgb;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgc;->zzbob:Lcom/google/android/gms/internal/zzgb;

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzgb;->zzdz()V

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

.method public onAdClosed()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzail:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgc;->zzbob:Lcom/google/android/gms/internal/zzgb;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgc;->zzbob:Lcom/google/android/gms/internal/zzgb;

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzgb;->zzea()V

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

.method public onAdFailedToLoad(I)V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzail:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgc;->zzboa:Lcom/google/android/gms/internal/zzge$zza;

    if-eqz v1, :cond_1

    const/4 v1, 0x3

    if-ne p1, v1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x2

    :goto_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgc;->zzboa:Lcom/google/android/gms/internal/zzge$zza;

    invoke-interface {v1, p1}, Lcom/google/android/gms/internal/zzge$zza;->zzy(I)V

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzgc;->zzboa:Lcom/google/android/gms/internal/zzge$zza;

    :cond_1
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public onAdImpression()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzail:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgc;->zzbob:Lcom/google/android/gms/internal/zzgb;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgc;->zzbob:Lcom/google/android/gms/internal/zzgb;

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzgb;->zzee()V

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

.method public onAdLeftApplication()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzail:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgc;->zzbob:Lcom/google/android/gms/internal/zzgb;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgc;->zzbob:Lcom/google/android/gms/internal/zzgb;

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzgb;->zzeb()V

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

.method public onAdLoaded()V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzail:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgc;->zzboa:Lcom/google/android/gms/internal/zzge$zza;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgc;->zzboa:Lcom/google/android/gms/internal/zzge$zza;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Lcom/google/android/gms/internal/zzge$zza;->zzy(I)V

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/google/android/gms/internal/zzgc;->zzboa:Lcom/google/android/gms/internal/zzge$zza;

    monitor-exit v0

    return-void

    :cond_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgc;->zzbob:Lcom/google/android/gms/internal/zzgb;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgc;->zzbob:Lcom/google/android/gms/internal/zzgb;

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzgb;->zzed()V

    :cond_1
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public onAdOpened()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzail:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgc;->zzbob:Lcom/google/android/gms/internal/zzgb;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgc;->zzbob:Lcom/google/android/gms/internal/zzgb;

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzgb;->zzec()V

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

.method public zza(Lcom/google/android/gms/internal/zzgb;)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzail:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iput-object p1, p0, Lcom/google/android/gms/internal/zzgc;->zzbob:Lcom/google/android/gms/internal/zzgb;

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public zza(Lcom/google/android/gms/internal/zzge$zza;)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzail:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iput-object p1, p0, Lcom/google/android/gms/internal/zzgc;->zzboa:Lcom/google/android/gms/internal/zzge$zza;

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public zza(Lcom/google/android/gms/internal/zzgm;)V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgc;->zzail:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgc;->zzboa:Lcom/google/android/gms/internal/zzge$zza;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgc;->zzboa:Lcom/google/android/gms/internal/zzge$zza;

    const/4 v2, 0x0

    invoke-interface {v1, v2, p1}, Lcom/google/android/gms/internal/zzge$zza;->zza(ILcom/google/android/gms/internal/zzgm;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzgc;->zzboa:Lcom/google/android/gms/internal/zzge$zza;

    monitor-exit v0

    return-void

    :cond_0
    iget-object p1, p0, Lcom/google/android/gms/internal/zzgc;->zzbob:Lcom/google/android/gms/internal/zzgb;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/google/android/gms/internal/zzgc;->zzbob:Lcom/google/android/gms/internal/zzgb;

    invoke-interface {p1}, Lcom/google/android/gms/internal/zzgb;->zzed()V

    :cond_1
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method
