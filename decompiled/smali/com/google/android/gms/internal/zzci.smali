.class public Lcom/google/android/gms/internal/zzci;
.super Lcom/google/android/gms/internal/zzcd;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzin;
.end annotation


# instance fields
.field private final zzarp:Lcom/google/android/gms/internal/zzft;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/client/AdSizeParcel;Lcom/google/android/gms/internal/zzju;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;Lcom/google/android/gms/internal/zzck;Lcom/google/android/gms/internal/zzft;)V
    .locals 0

    invoke-direct/range {p0 .. p5}, Lcom/google/android/gms/internal/zzcd;-><init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/client/AdSizeParcel;Lcom/google/android/gms/internal/zzju;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;Lcom/google/android/gms/internal/zzck;)V

    iput-object p6, p0, Lcom/google/android/gms/internal/zzci;->zzarp:Lcom/google/android/gms/internal/zzft;

    iget-object p1, p0, Lcom/google/android/gms/internal/zzci;->zzarp:Lcom/google/android/gms/internal/zzft;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzci;->zzc(Lcom/google/android/gms/internal/zzft;)V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzci;->zzgw()V

    const/4 p1, 0x3

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzci;->zzk(I)V

    iget-object p1, p0, Lcom/google/android/gms/internal/zzci;->zzaqk:Lcom/google/android/gms/internal/zzcf;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzcf;->zzhn()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p2

    const-string p3, "Tracking ad unit: "

    if-eqz p2, :cond_0

    invoke-virtual {p3, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    new-instance p1, Ljava/lang/String;

    invoke-direct {p1, p3}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    :goto_0
    invoke-static {p1}, Lcom/google/android/gms/internal/zzkd;->zzcv(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method protected destroy()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzci;->zzail:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    invoke-super {p0}, Lcom/google/android/gms/internal/zzcd;->destroy()V

    iget-object v1, p0, Lcom/google/android/gms/internal/zzci;->zzarp:Lcom/google/android/gms/internal/zzft;

    invoke-virtual {p0, v1}, Lcom/google/android/gms/internal/zzci;->zzd(Lcom/google/android/gms/internal/zzft;)V

    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method protected zzb(Lorg/json/JSONObject;)V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzci;->zzarp:Lcom/google/android/gms/internal/zzft;

    const-string v1, "AFMA_updateActiveView"

    invoke-interface {v0, v1, p1}, Lcom/google/android/gms/internal/zzft;->zza(Ljava/lang/String;Lorg/json/JSONObject;)V

    return-void
.end method

.method public zzgy()V
    .locals 0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzci;->destroy()V

    return-void
.end method

.method protected zzhe()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method
