.class public Lcom/google/android/gms/internal/zzpb;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/clearcut/zzc;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/zzpb$zze;,
        Lcom/google/android/gms/internal/zzpb$zzd;,
        Lcom/google/android/gms/internal/zzpb$zzb;,
        Lcom/google/android/gms/internal/zzpb$zza;,
        Lcom/google/android/gms/internal/zzpb$zzc;
    }
.end annotation


# static fields
.field private static final qE:Ljava/lang/Object;

.field private static qF:Ljava/util/concurrent/ScheduledExecutorService;

.field private static final qG:Lcom/google/android/gms/internal/zzpb$zze;

.field private static final qH:J


# instance fields
.field private gY:Lcom/google/android/gms/common/api/GoogleApiClient;

.field private final qI:Lcom/google/android/gms/internal/zzpb$zza;

.field private final qJ:Ljava/lang/Object;

.field private qK:J

.field private final qL:J

.field private qM:Ljava/util/concurrent/ScheduledFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ScheduledFuture<",
            "*>;"
        }
    .end annotation
.end field

.field private final qN:Ljava/lang/Runnable;

.field private final zzaoc:Lcom/google/android/gms/common/util/zze;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/zzpb;->qE:Ljava/lang/Object;

    new-instance v0, Lcom/google/android/gms/internal/zzpb$zze;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/zzpb$zze;-><init>(Lcom/google/android/gms/internal/zzpb$1;)V

    sput-object v0, Lcom/google/android/gms/internal/zzpb;->qG:Lcom/google/android/gms/internal/zzpb$zze;

    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    sget-object v1, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v2, 0x2

    invoke-virtual {v0, v2, v3, v1}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    sput-wide v0, Lcom/google/android/gms/internal/zzpb;->qH:J

    return-void
.end method

.method public constructor <init>()V
    .locals 4

    new-instance v0, Lcom/google/android/gms/common/util/zzh;

    invoke-direct {v0}, Lcom/google/android/gms/common/util/zzh;-><init>()V

    sget-wide v1, Lcom/google/android/gms/internal/zzpb;->qH:J

    new-instance v3, Lcom/google/android/gms/internal/zzpb$zzb;

    invoke-direct {v3}, Lcom/google/android/gms/internal/zzpb$zzb;-><init>()V

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/google/android/gms/internal/zzpb;-><init>(Lcom/google/android/gms/common/util/zze;JLcom/google/android/gms/internal/zzpb$zza;)V

    return-void
.end method

.method public constructor <init>(Lcom/google/android/gms/common/util/zze;JLcom/google/android/gms/internal/zzpb$zza;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzpb;->qJ:Ljava/lang/Object;

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/google/android/gms/internal/zzpb;->qK:J

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzpb;->qM:Ljava/util/concurrent/ScheduledFuture;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzpb;->gY:Lcom/google/android/gms/common/api/GoogleApiClient;

    new-instance v0, Lcom/google/android/gms/internal/zzpb$1;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/zzpb$1;-><init>(Lcom/google/android/gms/internal/zzpb;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzpb;->qN:Ljava/lang/Runnable;

    iput-object p1, p0, Lcom/google/android/gms/internal/zzpb;->zzaoc:Lcom/google/android/gms/common/util/zze;

    iput-wide p2, p0, Lcom/google/android/gms/internal/zzpb;->qL:J

    iput-object p4, p0, Lcom/google/android/gms/internal/zzpb;->qI:Lcom/google/android/gms/internal/zzpb$zza;

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzpb;Lcom/google/android/gms/common/api/GoogleApiClient;)Lcom/google/android/gms/common/api/GoogleApiClient;
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzpb;->gY:Lcom/google/android/gms/common/api/GoogleApiClient;

    return-object p1
.end method

.method private zza(Lcom/google/android/gms/common/api/GoogleApiClient;Lcom/google/android/gms/internal/zzpb$zzc;)Lcom/google/android/gms/common/api/PendingResult;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/GoogleApiClient;",
            "Lcom/google/android/gms/internal/zzpb$zzc<",
            "Lcom/google/android/gms/common/api/Status;",
            ">;)",
            "Lcom/google/android/gms/common/api/PendingResult<",
            "Lcom/google/android/gms/common/api/Status;",
            ">;"
        }
    .end annotation

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzpb;->zzanc()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    new-instance v1, Lcom/google/android/gms/internal/zzpb$3;

    invoke-direct {v1, p0, p1, p2}, Lcom/google/android/gms/internal/zzpb$3;-><init>(Lcom/google/android/gms/internal/zzpb;Lcom/google/android/gms/common/api/GoogleApiClient;Lcom/google/android/gms/internal/zzpb$zzc;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ScheduledExecutorService;->execute(Ljava/lang/Runnable;)V

    return-object p2
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzpb;)Ljava/lang/Object;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/zzpb;->qJ:Ljava/lang/Object;

    return-object p0
.end method

.method private static zza(Lcom/google/android/gms/clearcut/LogEventParcelable;)V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->qC:Lcom/google/android/gms/clearcut/zzb$zzc;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->qB:Lcom/google/android/gms/internal/zzapz$zzd;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzapz$zzd;->bkh:[B

    array-length v0, v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->qB:Lcom/google/android/gms/internal/zzapz$zzd;

    iget-object v1, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->qC:Lcom/google/android/gms/clearcut/zzb$zzc;

    invoke-interface {v1}, Lcom/google/android/gms/clearcut/zzb$zzc;->zzanb()[B

    move-result-object v1

    iput-object v1, v0, Lcom/google/android/gms/internal/zzapz$zzd;->bkh:[B

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->qD:Lcom/google/android/gms/clearcut/zzb$zzc;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->qB:Lcom/google/android/gms/internal/zzapz$zzd;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzapz$zzd;->bko:[B

    array-length v0, v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->qB:Lcom/google/android/gms/internal/zzapz$zzd;

    iget-object v1, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->qD:Lcom/google/android/gms/clearcut/zzb$zzc;

    invoke-interface {v1}, Lcom/google/android/gms/clearcut/zzb$zzc;->zzanb()[B

    move-result-object v1

    iput-object v1, v0, Lcom/google/android/gms/internal/zzapz$zzd;->bko:[B

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->qB:Lcom/google/android/gms/internal/zzapz$zzd;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzapv;->zzf(Lcom/google/android/gms/internal/zzapv;)[B

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->qv:[B

    return-void
.end method

.method private zzanc()Ljava/util/concurrent/ScheduledExecutorService;
    .locals 2

    sget-object v0, Lcom/google/android/gms/internal/zzpb;->qE:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/google/android/gms/internal/zzpb;->qF:Ljava/util/concurrent/ScheduledExecutorService;

    if-nez v1, :cond_0

    new-instance v1, Lcom/google/android/gms/internal/zzpb$2;

    invoke-direct {v1, p0}, Lcom/google/android/gms/internal/zzpb$2;-><init>(Lcom/google/android/gms/internal/zzpb;)V

    invoke-static {v1}, Ljava/util/concurrent/Executors;->newSingleThreadScheduledExecutor(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v1

    sput-object v1, Lcom/google/android/gms/internal/zzpb;->qF:Ljava/util/concurrent/ScheduledExecutorService;

    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    sget-object v0, Lcom/google/android/gms/internal/zzpb;->qF:Ljava/util/concurrent/ScheduledExecutorService;

    return-object v0

    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method static synthetic zzand()Lcom/google/android/gms/internal/zzpb$zze;
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/zzpb;->qG:Lcom/google/android/gms/internal/zzpb$zze;

    return-object v0
.end method

.method static synthetic zzb(Lcom/google/android/gms/internal/zzpb;)J
    .locals 2

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method private zzb(Lcom/google/android/gms/common/api/GoogleApiClient;Lcom/google/android/gms/clearcut/LogEventParcelable;)Lcom/google/android/gms/internal/zzpb$zzd;
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/zzpb;->qG:Lcom/google/android/gms/internal/zzpb$zze;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzpb$zze;->increment()V

    new-instance v0, Lcom/google/android/gms/internal/zzpb$zzd;

    invoke-direct {v0, p2, p1}, Lcom/google/android/gms/internal/zzpb$zzd;-><init>(Lcom/google/android/gms/clearcut/LogEventParcelable;Lcom/google/android/gms/common/api/GoogleApiClient;)V

    new-instance p1, Lcom/google/android/gms/internal/zzpb$4;

    invoke-direct {p1, p0}, Lcom/google/android/gms/internal/zzpb$4;-><init>(Lcom/google/android/gms/internal/zzpb;)V

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzpb$zzd;->zza(Lcom/google/android/gms/common/api/PendingResult$zza;)V

    return-object v0
.end method

.method static synthetic zzb(Lcom/google/android/gms/clearcut/LogEventParcelable;)V
    .locals 0

    invoke-static {p0}, Lcom/google/android/gms/internal/zzpb;->zza(Lcom/google/android/gms/clearcut/LogEventParcelable;)V

    return-void
.end method

.method static synthetic zzc(Lcom/google/android/gms/internal/zzpb;)Lcom/google/android/gms/common/util/zze;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/zzpb;->zzaoc:Lcom/google/android/gms/common/util/zze;

    return-object p0
.end method

.method static synthetic zzd(Lcom/google/android/gms/internal/zzpb;)Lcom/google/android/gms/common/api/GoogleApiClient;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/zzpb;->gY:Lcom/google/android/gms/common/api/GoogleApiClient;

    return-object p0
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/common/api/GoogleApiClient;Lcom/google/android/gms/clearcut/LogEventParcelable;)Lcom/google/android/gms/common/api/PendingResult;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/GoogleApiClient;",
            "Lcom/google/android/gms/clearcut/LogEventParcelable;",
            ")",
            "Lcom/google/android/gms/common/api/PendingResult<",
            "Lcom/google/android/gms/common/api/Status;",
            ">;"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/zzpb;->zzb(Lcom/google/android/gms/common/api/GoogleApiClient;Lcom/google/android/gms/clearcut/LogEventParcelable;)Lcom/google/android/gms/internal/zzpb$zzd;

    move-result-object p2

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/zzpb;->zza(Lcom/google/android/gms/common/api/GoogleApiClient;Lcom/google/android/gms/internal/zzpb$zzc;)Lcom/google/android/gms/common/api/PendingResult;

    move-result-object p1

    return-object p1
.end method
