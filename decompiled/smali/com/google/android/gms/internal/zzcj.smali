.class public Lcom/google/android/gms/internal/zzcj;
.super Lcom/google/android/gms/internal/zzcd;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzin;
.end annotation


# instance fields
.field private zzarq:Lcom/google/android/gms/internal/zzfs$zzc;

.field private zzarr:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/client/AdSizeParcel;Lcom/google/android/gms/internal/zzju;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;Lcom/google/android/gms/internal/zzck;Lcom/google/android/gms/internal/zzfs;)V
    .locals 0

    invoke-direct/range {p0 .. p5}, Lcom/google/android/gms/internal/zzcd;-><init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/client/AdSizeParcel;Lcom/google/android/gms/internal/zzju;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;Lcom/google/android/gms/internal/zzck;)V

    invoke-virtual {p6}, Lcom/google/android/gms/internal/zzfs;->zzma()Lcom/google/android/gms/internal/zzfs$zzc;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/gms/internal/zzcj;->zzarq:Lcom/google/android/gms/internal/zzfs$zzc;

    :try_start_0
    invoke-interface {p5}, Lcom/google/android/gms/internal/zzck;->zzhj()Lcom/google/android/gms/internal/zzck;

    move-result-object p1

    invoke-interface {p1}, Lcom/google/android/gms/internal/zzck;->zzhh()Landroid/view/View;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzcj;->zzd(Landroid/view/View;)Lorg/json/JSONObject;

    move-result-object p1

    iget-object p2, p0, Lcom/google/android/gms/internal/zzcj;->zzarq:Lcom/google/android/gms/internal/zzfs$zzc;

    new-instance p3, Lcom/google/android/gms/internal/zzcj$1;

    invoke-direct {p3, p0, p1}, Lcom/google/android/gms/internal/zzcj$1;-><init>(Lcom/google/android/gms/internal/zzcj;Lorg/json/JSONObject;)V

    new-instance p1, Lcom/google/android/gms/internal/zzcj$2;

    invoke-direct {p1, p0}, Lcom/google/android/gms/internal/zzcj$2;-><init>(Lcom/google/android/gms/internal/zzcj;)V

    invoke-virtual {p2, p3, p1}, Lcom/google/android/gms/internal/zzfs$zzc;->zza(Lcom/google/android/gms/internal/zzla$zzc;Lcom/google/android/gms/internal/zzla$zza;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string p2, "Failure while processing active view data."

    invoke-static {p2, p1}, Lcom/google/android/gms/internal/zzkd;->zzb(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    :catch_1
    nop

    :goto_0
    iget-object p1, p0, Lcom/google/android/gms/internal/zzcj;->zzarq:Lcom/google/android/gms/internal/zzfs$zzc;

    new-instance p2, Lcom/google/android/gms/internal/zzcj$3;

    invoke-direct {p2, p0}, Lcom/google/android/gms/internal/zzcj$3;-><init>(Lcom/google/android/gms/internal/zzcj;)V

    new-instance p3, Lcom/google/android/gms/internal/zzcj$4;

    invoke-direct {p3, p0}, Lcom/google/android/gms/internal/zzcj$4;-><init>(Lcom/google/android/gms/internal/zzcj;)V

    invoke-virtual {p1, p2, p3}, Lcom/google/android/gms/internal/zzfs$zzc;->zza(Lcom/google/android/gms/internal/zzla$zzc;Lcom/google/android/gms/internal/zzla$zza;)V

    const-string p1, "Tracking ad unit: "

    iget-object p2, p0, Lcom/google/android/gms/internal/zzcj;->zzaqk:Lcom/google/android/gms/internal/zzcf;

    invoke-virtual {p2}, Lcom/google/android/gms/internal/zzcf;->zzhn()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p3

    if-eqz p3, :cond_0

    invoke-virtual {p1, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    :cond_0
    new-instance p2, Ljava/lang/String;

    invoke-direct {p2, p1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    move-object p1, p2

    :goto_1
    invoke-static {p1}, Lcom/google/android/gms/internal/zzkd;->zzcv(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzcj;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/google/android/gms/internal/zzcj;->zzarr:Z

    return p1
.end method


# virtual methods
.method protected destroy()V
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/zzcj;->zzail:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    invoke-super {p0}, Lcom/google/android/gms/internal/zzcd;->destroy()V

    iget-object v1, p0, Lcom/google/android/gms/internal/zzcj;->zzarq:Lcom/google/android/gms/internal/zzfs$zzc;

    new-instance v2, Lcom/google/android/gms/internal/zzcj$6;

    invoke-direct {v2, p0}, Lcom/google/android/gms/internal/zzcj$6;-><init>(Lcom/google/android/gms/internal/zzcj;)V

    new-instance v3, Lcom/google/android/gms/internal/zzla$zzb;

    invoke-direct {v3}, Lcom/google/android/gms/internal/zzla$zzb;-><init>()V

    invoke-virtual {v1, v2, v3}, Lcom/google/android/gms/internal/zzfs$zzc;->zza(Lcom/google/android/gms/internal/zzla$zzc;Lcom/google/android/gms/internal/zzla$zza;)V

    iget-object v1, p0, Lcom/google/android/gms/internal/zzcj;->zzarq:Lcom/google/android/gms/internal/zzfs$zzc;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzfs$zzc;->release()V

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

    iget-object v0, p0, Lcom/google/android/gms/internal/zzcj;->zzarq:Lcom/google/android/gms/internal/zzfs$zzc;

    new-instance v1, Lcom/google/android/gms/internal/zzcj$5;

    invoke-direct {v1, p0, p1}, Lcom/google/android/gms/internal/zzcj$5;-><init>(Lcom/google/android/gms/internal/zzcj;Lorg/json/JSONObject;)V

    new-instance p1, Lcom/google/android/gms/internal/zzla$zzb;

    invoke-direct {p1}, Lcom/google/android/gms/internal/zzla$zzb;-><init>()V

    invoke-virtual {v0, v1, p1}, Lcom/google/android/gms/internal/zzfs$zzc;->zza(Lcom/google/android/gms/internal/zzla$zzc;Lcom/google/android/gms/internal/zzla$zza;)V

    return-void
.end method

.method protected zzhe()Z
    .locals 1

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzcj;->zzarr:Z

    return v0
.end method
