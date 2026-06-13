.class public Lcom/google/android/gms/internal/zzfn;
.super Lcom/google/android/gms/ads/internal/client/zzu$zza;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzin;
.end annotation


# instance fields
.field private zzaln:Ljava/lang/String;

.field private zzbkq:Lcom/google/android/gms/internal/zzfh;

.field private zzbkv:Lcom/google/android/gms/ads/internal/zzl;

.field private zzblc:Lcom/google/android/gms/internal/zzfj;

.field private zzbld:Lcom/google/android/gms/internal/zzhs;

.field private zzble:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Lcom/google/android/gms/internal/zzgj;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;Lcom/google/android/gms/ads/internal/zzd;)V
    .locals 1

    new-instance v0, Lcom/google/android/gms/internal/zzfh;

    invoke-direct {v0, p1, p3, p4, p5}, Lcom/google/android/gms/internal/zzfh;-><init>(Landroid/content/Context;Lcom/google/android/gms/internal/zzgj;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;Lcom/google/android/gms/ads/internal/zzd;)V

    invoke-direct {p0, p2, v0}, Lcom/google/android/gms/internal/zzfn;-><init>(Ljava/lang/String;Lcom/google/android/gms/internal/zzfh;)V

    return-void
.end method

.method constructor <init>(Ljava/lang/String;Lcom/google/android/gms/internal/zzfh;)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/ads/internal/client/zzu$zza;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzfn;->zzaln:Ljava/lang/String;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzfn;->zzbkq:Lcom/google/android/gms/internal/zzfh;

    new-instance p1, Lcom/google/android/gms/internal/zzfj;

    invoke-direct {p1}, Lcom/google/android/gms/internal/zzfj;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzfn;->zzblc:Lcom/google/android/gms/internal/zzfj;

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzgb()Lcom/google/android/gms/internal/zzfk;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/google/android/gms/internal/zzfk;->zza(Lcom/google/android/gms/internal/zzfh;)V

    return-void
.end method

.method private zzlw()V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfn;->zzbkv:Lcom/google/android/gms/ads/internal/zzl;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzfn;->zzbld:Lcom/google/android/gms/internal/zzhs;

    if-eqz v1, :cond_0

    iget-object v2, p0, Lcom/google/android/gms/internal/zzfn;->zzble:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/ads/internal/zzl;->zza(Lcom/google/android/gms/internal/zzhs;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method static zzn(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;)Z
    .locals 1

    invoke-static {p0}, Lcom/google/android/gms/internal/zzfk;->zzi(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;)Landroid/os/Bundle;

    move-result-object p0

    if-eqz p0, :cond_0

    const-string v0, "gw"

    invoke-virtual {p0, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method static zzo(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;)Z
    .locals 1

    invoke-static {p0}, Lcom/google/android/gms/internal/zzfk;->zzi(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;)Landroid/os/Bundle;

    move-result-object p0

    if-eqz p0, :cond_0

    const-string v0, "_ad"

    invoke-virtual {p0, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method


# virtual methods
.method abort()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfn;->zzbkv:Lcom/google/android/gms/ads/internal/zzl;

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzfn;->zzbkq:Lcom/google/android/gms/internal/zzfh;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzfn;->zzaln:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzfh;->zzbc(Ljava/lang/String;)Lcom/google/android/gms/ads/internal/zzl;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzfn;->zzbkv:Lcom/google/android/gms/ads/internal/zzl;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfn;->zzblc:Lcom/google/android/gms/internal/zzfj;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzfn;->zzbkv:Lcom/google/android/gms/ads/internal/zzl;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzfj;->zzc(Lcom/google/android/gms/ads/internal/zzl;)V

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzfn;->zzlw()V

    return-void
.end method

.method public destroy()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfn;->zzbkv:Lcom/google/android/gms/ads/internal/zzl;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/zzl;->destroy()V

    :cond_0
    return-void
.end method

.method public getMediationAdapterClassName()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfn;->zzbkv:Lcom/google/android/gms/ads/internal/zzl;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/zzl;->getMediationAdapterClassName()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public isLoading()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfn;->zzbkv:Lcom/google/android/gms/ads/internal/zzl;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/zzl;->isLoading()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isReady()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfn;->zzbkv:Lcom/google/android/gms/ads/internal/zzl;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/zzl;->isReady()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public pause()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfn;->zzbkv:Lcom/google/android/gms/ads/internal/zzl;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/zzl;->pause()V

    :cond_0
    return-void
.end method

.method public resume()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfn;->zzbkv:Lcom/google/android/gms/ads/internal/zzl;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/zzl;->resume()V

    :cond_0
    return-void
.end method

.method public setManualImpressionsEnabled(Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzfn;->abort()V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfn;->zzbkv:Lcom/google/android/gms/ads/internal/zzl;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lcom/google/android/gms/ads/internal/zzl;->setManualImpressionsEnabled(Z)V

    :cond_0
    return-void
.end method

.method public setUserId(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public showInterstitial()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfn;->zzbkv:Lcom/google/android/gms/ads/internal/zzl;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/zzl;->showInterstitial()V

    goto :goto_0

    :cond_0
    const-string v0, "Interstitial ad must be loaded before showInterstitial()."

    invoke-static {v0}, Lcom/google/android/gms/internal/zzkd;->zzcx(Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method public stopLoading()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfn;->zzbkv:Lcom/google/android/gms/ads/internal/zzl;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/zzl;->stopLoading()V

    :cond_0
    return-void
.end method

.method public zza(Lcom/google/android/gms/ads/internal/client/AdSizeParcel;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfn;->zzbkv:Lcom/google/android/gms/ads/internal/zzl;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lcom/google/android/gms/ads/internal/zzl;->zza(Lcom/google/android/gms/ads/internal/client/AdSizeParcel;)V

    :cond_0
    return-void
.end method

.method public zza(Lcom/google/android/gms/ads/internal/client/VideoOptionsParcel;)V
    .locals 1

    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "getVideoController not implemented for interstitials"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public zza(Lcom/google/android/gms/ads/internal/client/zzp;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfn;->zzblc:Lcom/google/android/gms/internal/zzfj;

    iput-object p1, v0, Lcom/google/android/gms/internal/zzfj;->zzbkk:Lcom/google/android/gms/ads/internal/client/zzp;

    iget-object p1, p0, Lcom/google/android/gms/internal/zzfn;->zzbkv:Lcom/google/android/gms/ads/internal/zzl;

    if-eqz p1, :cond_0

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzfj;->zzc(Lcom/google/android/gms/ads/internal/zzl;)V

    :cond_0
    return-void
.end method

.method public zza(Lcom/google/android/gms/ads/internal/client/zzq;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfn;->zzblc:Lcom/google/android/gms/internal/zzfj;

    iput-object p1, v0, Lcom/google/android/gms/internal/zzfj;->zzalf:Lcom/google/android/gms/ads/internal/client/zzq;

    iget-object p1, p0, Lcom/google/android/gms/internal/zzfn;->zzbkv:Lcom/google/android/gms/ads/internal/zzl;

    if-eqz p1, :cond_0

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzfj;->zzc(Lcom/google/android/gms/ads/internal/zzl;)V

    :cond_0
    return-void
.end method

.method public zza(Lcom/google/android/gms/ads/internal/client/zzw;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfn;->zzblc:Lcom/google/android/gms/internal/zzfj;

    iput-object p1, v0, Lcom/google/android/gms/internal/zzfj;->zzbkh:Lcom/google/android/gms/ads/internal/client/zzw;

    iget-object p1, p0, Lcom/google/android/gms/internal/zzfn;->zzbkv:Lcom/google/android/gms/ads/internal/zzl;

    if-eqz p1, :cond_0

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzfj;->zzc(Lcom/google/android/gms/ads/internal/zzl;)V

    :cond_0
    return-void
.end method

.method public zza(Lcom/google/android/gms/ads/internal/client/zzy;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzfn;->abort()V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfn;->zzbkv:Lcom/google/android/gms/ads/internal/zzl;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lcom/google/android/gms/ads/internal/zzl;->zza(Lcom/google/android/gms/ads/internal/client/zzy;)V

    :cond_0
    return-void
.end method

.method public zza(Lcom/google/android/gms/ads/internal/reward/client/zzd;)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfn;->zzblc:Lcom/google/android/gms/internal/zzfj;

    iput-object p1, v0, Lcom/google/android/gms/internal/zzfj;->zzbkl:Lcom/google/android/gms/ads/internal/reward/client/zzd;

    iget-object p1, p0, Lcom/google/android/gms/internal/zzfn;->zzbkv:Lcom/google/android/gms/ads/internal/zzl;

    if-eqz p1, :cond_0

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzfj;->zzc(Lcom/google/android/gms/ads/internal/zzl;)V

    :cond_0
    return-void
.end method

.method public zza(Lcom/google/android/gms/internal/zzdo;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfn;->zzblc:Lcom/google/android/gms/internal/zzfj;

    iput-object p1, v0, Lcom/google/android/gms/internal/zzfj;->zzbkj:Lcom/google/android/gms/internal/zzdo;

    iget-object p1, p0, Lcom/google/android/gms/internal/zzfn;->zzbkv:Lcom/google/android/gms/ads/internal/zzl;

    if-eqz p1, :cond_0

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzfj;->zzc(Lcom/google/android/gms/ads/internal/zzl;)V

    :cond_0
    return-void
.end method

.method public zza(Lcom/google/android/gms/internal/zzho;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfn;->zzblc:Lcom/google/android/gms/internal/zzfj;

    iput-object p1, v0, Lcom/google/android/gms/internal/zzfj;->zzbki:Lcom/google/android/gms/internal/zzho;

    iget-object p1, p0, Lcom/google/android/gms/internal/zzfn;->zzbkv:Lcom/google/android/gms/ads/internal/zzl;

    if-eqz p1, :cond_0

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzfj;->zzc(Lcom/google/android/gms/ads/internal/zzl;)V

    :cond_0
    return-void
.end method

.method public zza(Lcom/google/android/gms/internal/zzhs;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iput-object p1, p0, Lcom/google/android/gms/internal/zzfn;->zzbld:Lcom/google/android/gms/internal/zzhs;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzfn;->zzble:Ljava/lang/String;

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzfn;->zzlw()V

    return-void
.end method

.method public zzb(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    invoke-static {p1}, Lcom/google/android/gms/internal/zzfn;->zzn(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzfn;->abort()V

    :cond_0
    invoke-static {p1}, Lcom/google/android/gms/internal/zzfk;->zzk(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzfn;->abort()V

    :cond_1
    iget-object v0, p1, Lcom/google/android/gms/ads/internal/client/AdRequestParcel;->zzatt:Lcom/google/android/gms/ads/internal/client/SearchAdRequestParcel;

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzfn;->abort()V

    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/internal/zzfn;->zzbkv:Lcom/google/android/gms/ads/internal/zzl;

    if-eqz v0, :cond_3

    invoke-virtual {v0, p1}, Lcom/google/android/gms/ads/internal/zzl;->zzb(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;)Z

    move-result p1

    return p1

    :cond_3
    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzgb()Lcom/google/android/gms/internal/zzfk;

    move-result-object v0

    invoke-static {p1}, Lcom/google/android/gms/internal/zzfn;->zzo(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;)Z

    move-result v1

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/google/android/gms/internal/zzfn;->zzaln:Ljava/lang/String;

    invoke-virtual {v0, p1, v1}, Lcom/google/android/gms/internal/zzfk;->zzb(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;Ljava/lang/String;)V

    :cond_4
    iget-object v1, p0, Lcom/google/android/gms/internal/zzfn;->zzaln:Ljava/lang/String;

    invoke-virtual {v0, p1, v1}, Lcom/google/android/gms/internal/zzfk;->zza(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;Ljava/lang/String;)Lcom/google/android/gms/internal/zzfm$zza;

    move-result-object v0

    if-eqz v0, :cond_6

    iget-boolean p1, v0, Lcom/google/android/gms/internal/zzfm$zza;->zzbkz:Z

    if-nez p1, :cond_5

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzfm$zza;->zzlv()V

    :cond_5
    iget-object p1, v0, Lcom/google/android/gms/internal/zzfm$zza;->zzbkv:Lcom/google/android/gms/ads/internal/zzl;

    iput-object p1, p0, Lcom/google/android/gms/internal/zzfn;->zzbkv:Lcom/google/android/gms/ads/internal/zzl;

    iget-object p1, v0, Lcom/google/android/gms/internal/zzfm$zza;->zzbkx:Lcom/google/android/gms/internal/zzfi;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzfn;->zzblc:Lcom/google/android/gms/internal/zzfj;

    invoke-virtual {p1, v1}, Lcom/google/android/gms/internal/zzfi;->zza(Lcom/google/android/gms/internal/zzfj;)V

    iget-object p1, p0, Lcom/google/android/gms/internal/zzfn;->zzblc:Lcom/google/android/gms/internal/zzfj;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzfn;->zzbkv:Lcom/google/android/gms/ads/internal/zzl;

    invoke-virtual {p1, v1}, Lcom/google/android/gms/internal/zzfj;->zzc(Lcom/google/android/gms/ads/internal/zzl;)V

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzfn;->zzlw()V

    iget-boolean p1, v0, Lcom/google/android/gms/internal/zzfm$zza;->zzbla:Z

    return p1

    :cond_6
    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzfn;->abort()V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfn;->zzbkv:Lcom/google/android/gms/ads/internal/zzl;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/ads/internal/zzl;->zzb(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;)Z

    move-result p1

    return p1
.end method

.method public zzdm()Lcom/google/android/gms/dynamic/zzd;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfn;->zzbkv:Lcom/google/android/gms/ads/internal/zzl;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/zzl;->zzdm()Lcom/google/android/gms/dynamic/zzd;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public zzdn()Lcom/google/android/gms/ads/internal/client/AdSizeParcel;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfn;->zzbkv:Lcom/google/android/gms/ads/internal/zzl;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/zzl;->zzdn()Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public zzdp()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfn;->zzbkv:Lcom/google/android/gms/ads/internal/zzl;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/zzl;->zzdp()V

    goto :goto_0

    :cond_0
    const-string v0, "Interstitial ad must be loaded before pingManualTrackingUrl()."

    invoke-static {v0}, Lcom/google/android/gms/internal/zzkd;->zzcx(Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method public zzdq()Lcom/google/android/gms/ads/internal/client/zzab;
    .locals 2

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "getVideoController not implemented for interstitials"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
