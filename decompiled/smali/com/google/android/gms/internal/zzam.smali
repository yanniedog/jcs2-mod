.class public Lcom/google/android/gms/internal/zzam;
.super Ljava/lang/Object;


# static fields
.field protected static volatile zzaez:Lcom/google/android/gms/clearcut/zzb;

.field private static volatile zzafb:Ljava/util/Random;

.field private static final zzafc:Ljava/lang/Object;


# instance fields
.field private zzaey:Lcom/google/android/gms/internal/zzax;

.field protected zzafa:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/zzam;->zzafc:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lcom/google/android/gms/internal/zzax;)V
    .locals 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzam;->zzafa:Z

    iput-object p1, p0, Lcom/google/android/gms/internal/zzam;->zzaey:Lcom/google/android/gms/internal/zzax;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzax;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/internal/zzdc;->initialize(Landroid/content/Context;)V

    sget-object v0, Lcom/google/android/gms/internal/zzdc;->zzbbi:Lcom/google/android/gms/internal/zzcy;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzcy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzam;->zzafa:Z

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzam;->zzafa:Z

    if-eqz v0, :cond_1

    sget-object v0, Lcom/google/android/gms/internal/zzam;->zzaez:Lcom/google/android/gms/clearcut/zzb;

    if-nez v0, :cond_1

    sget-object v0, Lcom/google/android/gms/internal/zzam;->zzafc:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/google/android/gms/internal/zzam;->zzaez:Lcom/google/android/gms/clearcut/zzb;

    if-nez v1, :cond_0

    new-instance v1, Lcom/google/android/gms/clearcut/zzb;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzax;->getContext()Landroid/content/Context;

    move-result-object p1

    const-string v2, "ADSHIELD"

    const/4 v3, 0x0

    invoke-direct {v1, p1, v2, v3}, Lcom/google/android/gms/clearcut/zzb;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    sput-object v1, Lcom/google/android/gms/internal/zzam;->zzaez:Lcom/google/android/gms/clearcut/zzb;

    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    :cond_1
    :goto_0
    return-void
.end method

.method private static zzau()Ljava/util/Random;
    .locals 2

    sget-object v0, Lcom/google/android/gms/internal/zzam;->zzafb:Ljava/util/Random;

    if-nez v0, :cond_1

    sget-object v0, Lcom/google/android/gms/internal/zzam;->zzafc:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/google/android/gms/internal/zzam;->zzafb:Ljava/util/Random;

    if-nez v1, :cond_0

    new-instance v1, Ljava/util/Random;

    invoke-direct {v1}, Ljava/util/Random;-><init>()V

    sput-object v1, Lcom/google/android/gms/internal/zzam;->zzafb:Ljava/util/Random;

    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    :cond_1
    :goto_0
    sget-object v0, Lcom/google/android/gms/internal/zzam;->zzafb:Ljava/util/Random;

    return-object v0
.end method


# virtual methods
.method public zza(IIJ)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    :try_start_0
    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzam;->zzafa:Z

    if-eqz v0, :cond_0

    sget-object v0, Lcom/google/android/gms/internal/zzam;->zzaez:Lcom/google/android/gms/clearcut/zzb;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzam;->zzaey:Lcom/google/android/gms/internal/zzax;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzax;->zzcj()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Lcom/google/android/gms/internal/zzad$zza;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzad$zza;-><init>()V

    iget-object v1, p0, Lcom/google/android/gms/internal/zzam;->zzaey:Lcom/google/android/gms/internal/zzax;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzax;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/google/android/gms/internal/zzad$zza;->zzck:Ljava/lang/String;

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p3

    iput-object p3, v0, Lcom/google/android/gms/internal/zzad$zza;->zzcl:Ljava/lang/Long;

    sget-object p3, Lcom/google/android/gms/internal/zzam;->zzaez:Lcom/google/android/gms/clearcut/zzb;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzapv;->zzf(Lcom/google/android/gms/internal/zzapv;)[B

    move-result-object p4

    invoke-virtual {p3, p4}, Lcom/google/android/gms/clearcut/zzb;->zzl([B)Lcom/google/android/gms/clearcut/zzb$zza;

    move-result-object p3

    invoke-virtual {p3, p2}, Lcom/google/android/gms/clearcut/zzb$zza;->zzez(I)Lcom/google/android/gms/clearcut/zzb$zza;

    invoke-virtual {p3, p1}, Lcom/google/android/gms/clearcut/zzb$zza;->zzey(I)Lcom/google/android/gms/clearcut/zzb$zza;

    iget-object p1, p0, Lcom/google/android/gms/internal/zzam;->zzaey:Lcom/google/android/gms/internal/zzax;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzax;->zzch()Lcom/google/android/gms/common/api/GoogleApiClient;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/google/android/gms/clearcut/zzb$zza;->zze(Lcom/google/android/gms/common/api/GoogleApiClient;)Lcom/google/android/gms/common/api/PendingResult;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    return-void
.end method

.method public zzat()I
    .locals 1

    :try_start_0
    invoke-static {}, Ljava/util/concurrent/ThreadLocalRandom;->current()Ljava/util/concurrent/ThreadLocalRandom;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/ThreadLocalRandom;->nextInt()I

    move-result v0
    :try_end_0
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    :catch_0
    invoke-static {}, Lcom/google/android/gms/internal/zzam;->zzau()Ljava/util/Random;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Random;->nextInt()I

    move-result v0

    return v0
.end method
