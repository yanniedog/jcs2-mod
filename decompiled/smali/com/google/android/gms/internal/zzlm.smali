.class public Lcom/google/android/gms/internal/zzlm;
.super Lcom/google/android/gms/ads/internal/client/zzab$zza;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzin;
.end annotation


# instance fields
.field private final zzail:Ljava/lang/Object;

.field private zzaio:Z

.field private final zzbgf:Lcom/google/android/gms/internal/zzlh;

.field private final zzcpy:F

.field private zzcpz:I

.field private zzcqa:Lcom/google/android/gms/ads/internal/client/zzac;

.field private zzcqb:Z

.field private zzcqc:Z

.field private zzcqd:F


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zzlh;F)V
    .locals 1

    invoke-direct {p0}, Lcom/google/android/gms/ads/internal/client/zzab$zza;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzlm;->zzail:Ljava/lang/Object;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzlm;->zzaio:Z

    iput-object p1, p0, Lcom/google/android/gms/internal/zzlm;->zzbgf:Lcom/google/android/gms/internal/zzlh;

    iput p2, p0, Lcom/google/android/gms/internal/zzlm;->zzcpy:F

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzlm;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/google/android/gms/internal/zzlm;->zzcqb:Z

    return p1
.end method

.method static synthetic zzb(Lcom/google/android/gms/internal/zzlm;)Lcom/google/android/gms/internal/zzlh;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/zzlm;->zzbgf:Lcom/google/android/gms/internal/zzlh;

    return-object p0
.end method

.method static synthetic zzc(Lcom/google/android/gms/internal/zzlm;)Ljava/lang/Object;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/zzlm;->zzail:Ljava/lang/Object;

    return-object p0
.end method

.method private zzd(Ljava/lang/String;Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    if-nez p2, :cond_0

    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, p2}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    move-object p2, v0

    :goto_0
    const-string v0, "action"

    invoke-interface {p2, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzfq()Lcom/google/android/gms/internal/zzkh;

    move-result-object p1

    new-instance v0, Lcom/google/android/gms/internal/zzlm$1;

    invoke-direct {v0, p0, p2}, Lcom/google/android/gms/internal/zzlm$1;-><init>(Lcom/google/android/gms/internal/zzlm;Ljava/util/Map;)V

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzkh;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method static synthetic zzd(Lcom/google/android/gms/internal/zzlm;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/google/android/gms/internal/zzlm;->zzcqb:Z

    return p0
.end method

.method private zzdd(Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/internal/zzlm;->zzd(Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method static synthetic zze(Lcom/google/android/gms/internal/zzlm;)Lcom/google/android/gms/ads/internal/client/zzac;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/zzlm;->zzcqa:Lcom/google/android/gms/ads/internal/client/zzac;

    return-object p0
.end method

.method private zzi(II)V
    .locals 2

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzfq()Lcom/google/android/gms/internal/zzkh;

    move-result-object v0

    new-instance v1, Lcom/google/android/gms/internal/zzlm$2;

    invoke-direct {v1, p0, p1, p2}, Lcom/google/android/gms/internal/zzlm$2;-><init>(Lcom/google/android/gms/internal/zzlm;II)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzkh;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method


# virtual methods
.method public getPlaybackState()I
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzlm;->zzail:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget v1, p0, Lcom/google/android/gms/internal/zzlm;->zzcpz:I

    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public isMuted()Z
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzlm;->zzail:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-boolean v1, p0, Lcom/google/android/gms/internal/zzlm;->zzcqc:Z

    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public pause()V
    .locals 1

    const-string v0, "pause"

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzlm;->zzdd(Ljava/lang/String;)V

    return-void
.end method

.method public play()V
    .locals 1

    const-string v0, "play"

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzlm;->zzdd(Ljava/lang/String;)V

    return-void
.end method

.method public zza(FIZ)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzlm;->zzail:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iput p1, p0, Lcom/google/android/gms/internal/zzlm;->zzcqd:F

    iput-boolean p3, p0, Lcom/google/android/gms/internal/zzlm;->zzcqc:Z

    iget p1, p0, Lcom/google/android/gms/internal/zzlm;->zzcpz:I

    iput p2, p0, Lcom/google/android/gms/internal/zzlm;->zzcpz:I

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/zzlm;->zzi(II)V

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public zza(Lcom/google/android/gms/ads/internal/client/zzac;)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzlm;->zzail:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iput-object p1, p0, Lcom/google/android/gms/internal/zzlm;->zzcqa:Lcom/google/android/gms/ads/internal/client/zzac;

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public zzam(Z)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzlm;->zzail:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iput-boolean p1, p0, Lcom/google/android/gms/internal/zzlm;->zzaio:Z

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz p1, :cond_0

    const-string p1, "1"

    goto :goto_0

    :cond_0
    const-string p1, "0"

    :goto_0
    const-string v0, "muteStart"

    invoke-static {v0, p1}, Lcom/google/android/gms/common/util/zzf;->zze(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object p1

    const-string v0, "initialState"

    invoke-direct {p0, v0, p1}, Lcom/google/android/gms/internal/zzlm;->zzd(Ljava/lang/String;Ljava/util/Map;)V

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public zziz()F
    .locals 1

    iget v0, p0, Lcom/google/android/gms/internal/zzlm;->zzcpy:F

    return v0
.end method

.method public zzja()F
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzlm;->zzail:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget v1, p0, Lcom/google/android/gms/internal/zzlm;->zzcqd:F

    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public zzm(Z)V
    .locals 0

    if-eqz p1, :cond_0

    const-string p1, "mute"

    goto :goto_0

    :cond_0
    const-string p1, "unmute"

    :goto_0
    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzlm;->zzdd(Ljava/lang/String;)V

    return-void
.end method
