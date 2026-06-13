.class public Lcom/google/android/gms/internal/zzjj;
.super Lcom/google/android/gms/ads/internal/reward/mediation/client/zza$zza;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzin;
.end annotation


# instance fields
.field private zzchn:Lcom/google/android/gms/internal/zzjk;

.field private zzchu:Lcom/google/android/gms/internal/zzjh;

.field private zzchv:Lcom/google/android/gms/internal/zzji;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zzji;)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/ads/internal/reward/mediation/client/zza$zza;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzjj;->zzchv:Lcom/google/android/gms/internal/zzji;

    return-void
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/dynamic/zzd;Lcom/google/android/gms/ads/internal/reward/mediation/client/RewardItemParcel;)V
    .locals 0

    iget-object p1, p0, Lcom/google/android/gms/internal/zzjj;->zzchv:Lcom/google/android/gms/internal/zzji;

    if-eqz p1, :cond_0

    invoke-interface {p1, p2}, Lcom/google/android/gms/internal/zzji;->zzc(Lcom/google/android/gms/ads/internal/reward/mediation/client/RewardItemParcel;)V

    :cond_0
    return-void
.end method

.method public zza(Lcom/google/android/gms/internal/zzjh;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzjj;->zzchu:Lcom/google/android/gms/internal/zzjh;

    return-void
.end method

.method public zza(Lcom/google/android/gms/internal/zzjk;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzjj;->zzchn:Lcom/google/android/gms/internal/zzjk;

    return-void
.end method

.method public zzb(Lcom/google/android/gms/dynamic/zzd;I)V
    .locals 0

    iget-object p1, p0, Lcom/google/android/gms/internal/zzjj;->zzchu:Lcom/google/android/gms/internal/zzjh;

    if-eqz p1, :cond_0

    invoke-interface {p1, p2}, Lcom/google/android/gms/internal/zzjh;->zzaw(I)V

    :cond_0
    return-void
.end method

.method public zzc(Lcom/google/android/gms/dynamic/zzd;I)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzjj;->zzchn:Lcom/google/android/gms/internal/zzjk;

    if-eqz v0, :cond_0

    invoke-static {p1}, Lcom/google/android/gms/dynamic/zze;->zzad(Lcom/google/android/gms/dynamic/zzd;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1, p2}, Lcom/google/android/gms/internal/zzjk;->zza(Ljava/lang/String;I)V

    :cond_0
    return-void
.end method

.method public zzp(Lcom/google/android/gms/dynamic/zzd;)V
    .locals 0

    iget-object p1, p0, Lcom/google/android/gms/internal/zzjj;->zzchu:Lcom/google/android/gms/internal/zzjh;

    if-eqz p1, :cond_0

    invoke-interface {p1}, Lcom/google/android/gms/internal/zzjh;->zzrs()V

    :cond_0
    return-void
.end method

.method public zzq(Lcom/google/android/gms/dynamic/zzd;)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzjj;->zzchn:Lcom/google/android/gms/internal/zzjk;

    if-eqz v0, :cond_0

    invoke-static {p1}, Lcom/google/android/gms/dynamic/zze;->zzad(Lcom/google/android/gms/dynamic/zzd;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Lcom/google/android/gms/internal/zzjk;->zzcg(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public zzr(Lcom/google/android/gms/dynamic/zzd;)V
    .locals 0

    iget-object p1, p0, Lcom/google/android/gms/internal/zzjj;->zzchv:Lcom/google/android/gms/internal/zzji;

    if-eqz p1, :cond_0

    invoke-interface {p1}, Lcom/google/android/gms/internal/zzji;->onRewardedVideoAdOpened()V

    :cond_0
    return-void
.end method

.method public zzs(Lcom/google/android/gms/dynamic/zzd;)V
    .locals 0

    iget-object p1, p0, Lcom/google/android/gms/internal/zzjj;->zzchv:Lcom/google/android/gms/internal/zzji;

    if-eqz p1, :cond_0

    invoke-interface {p1}, Lcom/google/android/gms/internal/zzji;->onRewardedVideoStarted()V

    :cond_0
    return-void
.end method

.method public zzt(Lcom/google/android/gms/dynamic/zzd;)V
    .locals 0

    iget-object p1, p0, Lcom/google/android/gms/internal/zzjj;->zzchv:Lcom/google/android/gms/internal/zzji;

    if-eqz p1, :cond_0

    invoke-interface {p1}, Lcom/google/android/gms/internal/zzji;->onRewardedVideoAdClosed()V

    :cond_0
    return-void
.end method

.method public zzu(Lcom/google/android/gms/dynamic/zzd;)V
    .locals 0

    iget-object p1, p0, Lcom/google/android/gms/internal/zzjj;->zzchv:Lcom/google/android/gms/internal/zzji;

    if-eqz p1, :cond_0

    invoke-interface {p1}, Lcom/google/android/gms/internal/zzji;->zzrr()V

    :cond_0
    return-void
.end method

.method public zzv(Lcom/google/android/gms/dynamic/zzd;)V
    .locals 0

    iget-object p1, p0, Lcom/google/android/gms/internal/zzjj;->zzchv:Lcom/google/android/gms/internal/zzji;

    if-eqz p1, :cond_0

    invoke-interface {p1}, Lcom/google/android/gms/internal/zzji;->onRewardedVideoAdLeftApplication()V

    :cond_0
    return-void
.end method
