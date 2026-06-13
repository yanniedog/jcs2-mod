.class public Lcom/google/android/gms/internal/zzeh;
.super Lcom/google/android/gms/internal/zzec$zza;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzin;
.end annotation


# instance fields
.field private final zzbhj:Lcom/google/android/gms/ads/formats/NativeContentAd$OnContentAdLoadedListener;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/ads/formats/NativeContentAd$OnContentAdLoadedListener;)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzec$zza;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzeh;->zzbhj:Lcom/google/android/gms/ads/formats/NativeContentAd$OnContentAdLoadedListener;

    return-void
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/internal/zzdx;)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzeh;->zzbhj:Lcom/google/android/gms/ads/formats/NativeContentAd$OnContentAdLoadedListener;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzeh;->zzb(Lcom/google/android/gms/internal/zzdx;)Lcom/google/android/gms/internal/zzdy;

    move-result-object p1

    invoke-interface {v0, p1}, Lcom/google/android/gms/ads/formats/NativeContentAd$OnContentAdLoadedListener;->onContentAdLoaded(Lcom/google/android/gms/ads/formats/NativeContentAd;)V

    return-void
.end method

.method zzb(Lcom/google/android/gms/internal/zzdx;)Lcom/google/android/gms/internal/zzdy;
    .locals 1

    new-instance v0, Lcom/google/android/gms/internal/zzdy;

    invoke-direct {v0, p1}, Lcom/google/android/gms/internal/zzdy;-><init>(Lcom/google/android/gms/internal/zzdx;)V

    return-object v0
.end method
