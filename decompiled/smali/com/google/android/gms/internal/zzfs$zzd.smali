.class public Lcom/google/android/gms/internal/zzfs$zzd;
.super Lcom/google/android/gms/internal/zzlb;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzfs;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "zzd"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/zzlb<",
        "Lcom/google/android/gms/internal/zzfp;",
        ">;"
    }
.end annotation


# instance fields
.field private final zzail:Ljava/lang/Object;

.field private zzblt:Lcom/google/android/gms/internal/zzkl;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/zzkl<",
            "Lcom/google/android/gms/internal/zzfp;",
            ">;"
        }
    .end annotation
.end field

.field private zzbml:Z

.field private zzbmm:I


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zzkl;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzkl<",
            "Lcom/google/android/gms/internal/zzfp;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzlb;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzfs$zzd;->zzail:Ljava/lang/Object;

    iput-object p1, p0, Lcom/google/android/gms/internal/zzfs$zzd;->zzblt:Lcom/google/android/gms/internal/zzkl;

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/google/android/gms/internal/zzfs$zzd;->zzbml:Z

    iput p1, p0, Lcom/google/android/gms/internal/zzfs$zzd;->zzbmm:I

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzfs$zzd;)Lcom/google/android/gms/internal/zzkl;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/zzfs$zzd;->zzblt:Lcom/google/android/gms/internal/zzkl;

    return-object p0
.end method


# virtual methods
.method public zzmb()Lcom/google/android/gms/internal/zzfs$zzc;
    .locals 4

    new-instance v0, Lcom/google/android/gms/internal/zzfs$zzc;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/zzfs$zzc;-><init>(Lcom/google/android/gms/internal/zzfs$zzd;)V

    iget-object v1, p0, Lcom/google/android/gms/internal/zzfs$zzd;->zzail:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    new-instance v2, Lcom/google/android/gms/internal/zzfs$zzd$1;

    invoke-direct {v2, p0, v0}, Lcom/google/android/gms/internal/zzfs$zzd$1;-><init>(Lcom/google/android/gms/internal/zzfs$zzd;Lcom/google/android/gms/internal/zzfs$zzc;)V

    new-instance v3, Lcom/google/android/gms/internal/zzfs$zzd$2;

    invoke-direct {v3, p0, v0}, Lcom/google/android/gms/internal/zzfs$zzd$2;-><init>(Lcom/google/android/gms/internal/zzfs$zzd;Lcom/google/android/gms/internal/zzfs$zzc;)V

    invoke-virtual {p0, v2, v3}, Lcom/google/android/gms/internal/zzfs$zzd;->zza(Lcom/google/android/gms/internal/zzla$zzc;Lcom/google/android/gms/internal/zzla$zza;)V

    iget v2, p0, Lcom/google/android/gms/internal/zzfs$zzd;->zzbmm:I

    const/4 v3, 0x1

    if-ltz v2, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    invoke-static {v2}, Lcom/google/android/gms/common/internal/zzab;->zzbn(Z)V

    iget v2, p0, Lcom/google/android/gms/internal/zzfs$zzd;->zzbmm:I

    add-int/2addr v2, v3

    iput v2, p0, Lcom/google/android/gms/internal/zzfs$zzd;->zzbmm:I

    monitor-exit v1

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method protected zzmc()V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfs$zzd;->zzail:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget v1, p0, Lcom/google/android/gms/internal/zzfs$zzd;->zzbmm:I

    const/4 v2, 0x1

    if-lt v1, v2, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    invoke-static {v1}, Lcom/google/android/gms/common/internal/zzab;->zzbn(Z)V

    const-string v1, "Releasing 1 reference for JS Engine"

    invoke-static {v1}, Lcom/google/android/gms/internal/zzkd;->v(Ljava/lang/String;)V

    iget v1, p0, Lcom/google/android/gms/internal/zzfs$zzd;->zzbmm:I

    sub-int/2addr v1, v2

    iput v1, p0, Lcom/google/android/gms/internal/zzfs$zzd;->zzbmm:I

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzfs$zzd;->zzme()V

    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public zzmd()V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfs$zzd;->zzail:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget v1, p0, Lcom/google/android/gms/internal/zzfs$zzd;->zzbmm:I

    const/4 v2, 0x1

    if-ltz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    invoke-static {v1}, Lcom/google/android/gms/common/internal/zzab;->zzbn(Z)V

    const-string v1, "Releasing root reference. JS Engine will be destroyed once other references are released."

    invoke-static {v1}, Lcom/google/android/gms/internal/zzkd;->v(Ljava/lang/String;)V

    iput-boolean v2, p0, Lcom/google/android/gms/internal/zzfs$zzd;->zzbml:Z

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzfs$zzd;->zzme()V

    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method protected zzme()V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfs$zzd;->zzail:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget v1, p0, Lcom/google/android/gms/internal/zzfs$zzd;->zzbmm:I

    if-ltz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    invoke-static {v1}, Lcom/google/android/gms/common/internal/zzab;->zzbn(Z)V

    iget-boolean v1, p0, Lcom/google/android/gms/internal/zzfs$zzd;->zzbml:Z

    if-eqz v1, :cond_1

    iget v1, p0, Lcom/google/android/gms/internal/zzfs$zzd;->zzbmm:I

    if-nez v1, :cond_1

    const-string v1, "No reference is left (including root). Cleaning up engine."

    invoke-static {v1}, Lcom/google/android/gms/internal/zzkd;->v(Ljava/lang/String;)V

    new-instance v1, Lcom/google/android/gms/internal/zzfs$zzd$3;

    invoke-direct {v1, p0}, Lcom/google/android/gms/internal/zzfs$zzd$3;-><init>(Lcom/google/android/gms/internal/zzfs$zzd;)V

    new-instance v2, Lcom/google/android/gms/internal/zzla$zzb;

    invoke-direct {v2}, Lcom/google/android/gms/internal/zzla$zzb;-><init>()V

    invoke-virtual {p0, v1, v2}, Lcom/google/android/gms/internal/zzfs$zzd;->zza(Lcom/google/android/gms/internal/zzla$zzc;Lcom/google/android/gms/internal/zzla$zza;)V

    goto :goto_1

    :cond_1
    const-string v1, "There are still references to the engine. Not destroying."

    invoke-static {v1}, Lcom/google/android/gms/internal/zzkd;->v(Ljava/lang/String;)V

    :goto_1
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
