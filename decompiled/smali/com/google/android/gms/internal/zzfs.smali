.class public Lcom/google/android/gms/internal/zzfs;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzin;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/zzfs$zza;,
        Lcom/google/android/gms/internal/zzfs$zze;,
        Lcom/google/android/gms/internal/zzfs$zzc;,
        Lcom/google/android/gms/internal/zzfs$zzd;,
        Lcom/google/android/gms/internal/zzfs$zzb;
    }
.end annotation


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final zzail:Ljava/lang/Object;

.field private final zzalo:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

.field private final zzblr:Ljava/lang/String;

.field private zzbls:Lcom/google/android/gms/internal/zzkl;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/zzkl<",
            "Lcom/google/android/gms/internal/zzfp;",
            ">;"
        }
    .end annotation
.end field

.field private zzblt:Lcom/google/android/gms/internal/zzkl;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/zzkl<",
            "Lcom/google/android/gms/internal/zzfp;",
            ">;"
        }
    .end annotation
.end field

.field private zzblu:Lcom/google/android/gms/internal/zzfs$zzd;

.field private zzblv:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;Ljava/lang/String;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzfs;->zzail:Ljava/lang/Object;

    const/4 v0, 0x1

    iput v0, p0, Lcom/google/android/gms/internal/zzfs;->zzblv:I

    iput-object p3, p0, Lcom/google/android/gms/internal/zzfs;->zzblr:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/gms/internal/zzfs;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzfs;->zzalo:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    new-instance p1, Lcom/google/android/gms/internal/zzfs$zzb;

    invoke-direct {p1}, Lcom/google/android/gms/internal/zzfs$zzb;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzfs;->zzbls:Lcom/google/android/gms/internal/zzkl;

    new-instance p1, Lcom/google/android/gms/internal/zzfs$zzb;

    invoke-direct {p1}, Lcom/google/android/gms/internal/zzfs$zzb;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzfs;->zzblt:Lcom/google/android/gms/internal/zzkl;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;Ljava/lang/String;Lcom/google/android/gms/internal/zzkl;Lcom/google/android/gms/internal/zzkl;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/zzkl<",
            "Lcom/google/android/gms/internal/zzfp;",
            ">;",
            "Lcom/google/android/gms/internal/zzkl<",
            "Lcom/google/android/gms/internal/zzfp;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/gms/internal/zzfs;-><init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;Ljava/lang/String;)V

    iput-object p4, p0, Lcom/google/android/gms/internal/zzfs;->zzbls:Lcom/google/android/gms/internal/zzkl;

    iput-object p5, p0, Lcom/google/android/gms/internal/zzfs;->zzblt:Lcom/google/android/gms/internal/zzkl;

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzfs;I)I
    .locals 0

    iput p1, p0, Lcom/google/android/gms/internal/zzfs;->zzblv:I

    return p1
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzfs;)Landroid/content/Context;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/zzfs;->mContext:Landroid/content/Context;

    return-object p0
.end method

.method private zza(Lcom/google/android/gms/internal/zzas;)Lcom/google/android/gms/internal/zzfs$zzd;
    .locals 3

    new-instance v0, Lcom/google/android/gms/internal/zzfs$zzd;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzfs;->zzblt:Lcom/google/android/gms/internal/zzkl;

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/zzfs$zzd;-><init>(Lcom/google/android/gms/internal/zzkl;)V

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzfq()Lcom/google/android/gms/internal/zzkh;

    move-result-object v1

    new-instance v2, Lcom/google/android/gms/internal/zzfs$1;

    invoke-direct {v2, p0, p1, v0}, Lcom/google/android/gms/internal/zzfs$1;-><init>(Lcom/google/android/gms/internal/zzfs;Lcom/google/android/gms/internal/zzas;Lcom/google/android/gms/internal/zzfs$zzd;)V

    invoke-virtual {v1, v2}, Lcom/google/android/gms/internal/zzkh;->runOnUiThread(Ljava/lang/Runnable;)V

    return-object v0
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzfs;Lcom/google/android/gms/internal/zzfs$zzd;)Lcom/google/android/gms/internal/zzfs$zzd;
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzfs;->zzblu:Lcom/google/android/gms/internal/zzfs$zzd;

    return-object p1
.end method

.method static synthetic zzb(Lcom/google/android/gms/internal/zzfs;)Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/zzfs;->zzalo:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    return-object p0
.end method

.method static synthetic zzc(Lcom/google/android/gms/internal/zzfs;)Ljava/lang/Object;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/zzfs;->zzail:Ljava/lang/Object;

    return-object p0
.end method

.method static synthetic zzd(Lcom/google/android/gms/internal/zzfs;)Lcom/google/android/gms/internal/zzkl;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/zzfs;->zzbls:Lcom/google/android/gms/internal/zzkl;

    return-object p0
.end method

.method static synthetic zze(Lcom/google/android/gms/internal/zzfs;)I
    .locals 0

    iget p0, p0, Lcom/google/android/gms/internal/zzfs;->zzblv:I

    return p0
.end method

.method static synthetic zzf(Lcom/google/android/gms/internal/zzfs;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/zzfs;->zzblr:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic zzg(Lcom/google/android/gms/internal/zzfs;)Lcom/google/android/gms/internal/zzfs$zzd;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/zzfs;->zzblu:Lcom/google/android/gms/internal/zzfs$zzd;

    return-object p0
.end method


# virtual methods
.method protected zza(Landroid/content/Context;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;Lcom/google/android/gms/internal/zzas;)Lcom/google/android/gms/internal/zzfp;
    .locals 1

    new-instance v0, Lcom/google/android/gms/internal/zzfr;

    invoke-direct {v0, p1, p2, p3}, Lcom/google/android/gms/internal/zzfr;-><init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;Lcom/google/android/gms/internal/zzas;)V

    return-object v0
.end method

.method protected zzb(Lcom/google/android/gms/internal/zzas;)Lcom/google/android/gms/internal/zzfs$zzd;
    .locals 2

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzfs;->zza(Lcom/google/android/gms/internal/zzas;)Lcom/google/android/gms/internal/zzfs$zzd;

    move-result-object p1

    new-instance v0, Lcom/google/android/gms/internal/zzfs$2;

    invoke-direct {v0, p0, p1}, Lcom/google/android/gms/internal/zzfs$2;-><init>(Lcom/google/android/gms/internal/zzfs;Lcom/google/android/gms/internal/zzfs$zzd;)V

    new-instance v1, Lcom/google/android/gms/internal/zzfs$3;

    invoke-direct {v1, p0, p1}, Lcom/google/android/gms/internal/zzfs$3;-><init>(Lcom/google/android/gms/internal/zzfs;Lcom/google/android/gms/internal/zzfs$zzd;)V

    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/internal/zzfs$zzd;->zza(Lcom/google/android/gms/internal/zzla$zzc;Lcom/google/android/gms/internal/zzla$zza;)V

    return-object p1
.end method

.method public zzc(Lcom/google/android/gms/internal/zzas;)Lcom/google/android/gms/internal/zzfs$zzc;
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfs;->zzail:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzfs;->zzblu:Lcom/google/android/gms/internal/zzfs$zzd;

    const/4 v2, 0x2

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/google/android/gms/internal/zzfs;->zzblu:Lcom/google/android/gms/internal/zzfs$zzd;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzfs$zzd;->getStatus()I

    move-result v1

    const/4 v3, -0x1

    if-ne v1, v3, :cond_0

    goto :goto_0

    :cond_0
    iget v1, p0, Lcom/google/android/gms/internal/zzfs;->zzblv:I

    if-nez v1, :cond_1

    iget-object p1, p0, Lcom/google/android/gms/internal/zzfs;->zzblu:Lcom/google/android/gms/internal/zzfs$zzd;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzfs$zzd;->zzmb()Lcom/google/android/gms/internal/zzfs$zzc;

    move-result-object p1

    monitor-exit v0

    return-object p1

    :cond_1
    iget v1, p0, Lcom/google/android/gms/internal/zzfs;->zzblv:I

    const/4 v3, 0x1

    if-ne v1, v3, :cond_2

    iput v2, p0, Lcom/google/android/gms/internal/zzfs;->zzblv:I

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzfs;->zzb(Lcom/google/android/gms/internal/zzas;)Lcom/google/android/gms/internal/zzfs$zzd;

    iget-object p1, p0, Lcom/google/android/gms/internal/zzfs;->zzblu:Lcom/google/android/gms/internal/zzfs$zzd;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzfs$zzd;->zzmb()Lcom/google/android/gms/internal/zzfs$zzc;

    move-result-object p1

    monitor-exit v0

    return-object p1

    :cond_2
    iget p1, p0, Lcom/google/android/gms/internal/zzfs;->zzblv:I

    if-ne p1, v2, :cond_3

    iget-object p1, p0, Lcom/google/android/gms/internal/zzfs;->zzblu:Lcom/google/android/gms/internal/zzfs$zzd;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzfs$zzd;->zzmb()Lcom/google/android/gms/internal/zzfs$zzc;

    move-result-object p1

    monitor-exit v0

    return-object p1

    :cond_3
    iget-object p1, p0, Lcom/google/android/gms/internal/zzfs;->zzblu:Lcom/google/android/gms/internal/zzfs$zzd;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzfs$zzd;->zzmb()Lcom/google/android/gms/internal/zzfs$zzc;

    move-result-object p1

    monitor-exit v0

    return-object p1

    :cond_4
    :goto_0
    iput v2, p0, Lcom/google/android/gms/internal/zzfs;->zzblv:I

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzfs;->zzb(Lcom/google/android/gms/internal/zzas;)Lcom/google/android/gms/internal/zzfs$zzd;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/gms/internal/zzfs;->zzblu:Lcom/google/android/gms/internal/zzfs$zzd;

    iget-object p1, p0, Lcom/google/android/gms/internal/zzfs;->zzblu:Lcom/google/android/gms/internal/zzfs$zzd;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzfs$zzd;->zzmb()Lcom/google/android/gms/internal/zzfs$zzc;

    move-result-object p1

    monitor-exit v0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public zzma()Lcom/google/android/gms/internal/zzfs$zzc;
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzfs;->zzc(Lcom/google/android/gms/internal/zzas;)Lcom/google/android/gms/internal/zzfs$zzc;

    move-result-object v0

    return-object v0
.end method
