.class public abstract Lcom/google/android/gms/internal/zzix;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzin;
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract zza(Landroid/content/Context;Lcom/google/android/gms/internal/zzir;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;)V
.end method

.method protected zze(Lcom/google/android/gms/internal/zzir;)V
    .locals 1

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzir;->zzri()V

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzir;->zzrg()Lcom/google/android/gms/internal/zzfs$zzc;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzir;->zzrg()Lcom/google/android/gms/internal/zzfs$zzc;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzfs$zzc;->release()V

    :cond_0
    return-void
.end method
