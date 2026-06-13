.class public Lcom/google/android/gms/internal/zzeg;
.super Lcom/google/android/gms/internal/zzeb$zza;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzin;
.end annotation


# instance fields
.field private final zzbhi:Lcom/google/android/gms/ads/formats/NativeAppInstallAd$OnAppInstallAdLoadedListener;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/ads/formats/NativeAppInstallAd$OnAppInstallAdLoadedListener;)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzeb$zza;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzeg;->zzbhi:Lcom/google/android/gms/ads/formats/NativeAppInstallAd$OnAppInstallAdLoadedListener;

    return-void
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/internal/zzdv;)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzeg;->zzbhi:Lcom/google/android/gms/ads/formats/NativeAppInstallAd$OnAppInstallAdLoadedListener;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzeg;->zzb(Lcom/google/android/gms/internal/zzdv;)Lcom/google/android/gms/internal/zzdw;

    move-result-object p1

    invoke-interface {v0, p1}, Lcom/google/android/gms/ads/formats/NativeAppInstallAd$OnAppInstallAdLoadedListener;->onAppInstallAdLoaded(Lcom/google/android/gms/ads/formats/NativeAppInstallAd;)V

    return-void
.end method

.method zzb(Lcom/google/android/gms/internal/zzdv;)Lcom/google/android/gms/internal/zzdw;
    .locals 1

    new-instance v0, Lcom/google/android/gms/internal/zzdw;

    invoke-direct {v0, p1}, Lcom/google/android/gms/internal/zzdw;-><init>(Lcom/google/android/gms/internal/zzdv;)V

    return-object v0
.end method
