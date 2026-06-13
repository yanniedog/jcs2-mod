.class public Lcom/google/android/gms/ads/internal/client/zzm;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzin;
.end annotation


# static fields
.field private static final zzamr:Ljava/lang/Object;

.field private static zzavm:Lcom/google/android/gms/ads/internal/client/zzm;


# instance fields
.field private final zzavn:Lcom/google/android/gms/ads/internal/util/client/zza;

.field private final zzavo:Lcom/google/android/gms/ads/internal/client/zzl;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/google/android/gms/ads/internal/client/zzm;->zzamr:Ljava/lang/Object;

    new-instance v0, Lcom/google/android/gms/ads/internal/client/zzm;

    invoke-direct {v0}, Lcom/google/android/gms/ads/internal/client/zzm;-><init>()V

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/client/zzm;->zza(Lcom/google/android/gms/ads/internal/client/zzm;)V

    return-void
.end method

.method protected constructor <init>()V
    .locals 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/google/android/gms/ads/internal/util/client/zza;

    invoke-direct {v0}, Lcom/google/android/gms/ads/internal/util/client/zza;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/client/zzm;->zzavn:Lcom/google/android/gms/ads/internal/util/client/zza;

    new-instance v0, Lcom/google/android/gms/ads/internal/client/zzl;

    new-instance v2, Lcom/google/android/gms/ads/internal/client/zze;

    invoke-direct {v2}, Lcom/google/android/gms/ads/internal/client/zze;-><init>()V

    new-instance v3, Lcom/google/android/gms/ads/internal/client/zzd;

    invoke-direct {v3}, Lcom/google/android/gms/ads/internal/client/zzd;-><init>()V

    new-instance v4, Lcom/google/android/gms/ads/internal/client/zzai;

    invoke-direct {v4}, Lcom/google/android/gms/ads/internal/client/zzai;-><init>()V

    new-instance v5, Lcom/google/android/gms/internal/zzef;

    invoke-direct {v5}, Lcom/google/android/gms/internal/zzef;-><init>()V

    new-instance v6, Lcom/google/android/gms/ads/internal/reward/client/zzf;

    invoke-direct {v6}, Lcom/google/android/gms/ads/internal/reward/client/zzf;-><init>()V

    new-instance v7, Lcom/google/android/gms/internal/zzhu;

    invoke-direct {v7}, Lcom/google/android/gms/internal/zzhu;-><init>()V

    new-instance v8, Lcom/google/android/gms/internal/zzhh;

    invoke-direct {v8}, Lcom/google/android/gms/internal/zzhh;-><init>()V

    move-object v1, v0

    invoke-direct/range {v1 .. v8}, Lcom/google/android/gms/ads/internal/client/zzl;-><init>(Lcom/google/android/gms/ads/internal/client/zze;Lcom/google/android/gms/ads/internal/client/zzd;Lcom/google/android/gms/ads/internal/client/zzai;Lcom/google/android/gms/internal/zzef;Lcom/google/android/gms/ads/internal/reward/client/zzf;Lcom/google/android/gms/internal/zzhu;Lcom/google/android/gms/internal/zzhh;)V

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/client/zzm;->zzavo:Lcom/google/android/gms/ads/internal/client/zzl;

    return-void
.end method

.method protected static zza(Lcom/google/android/gms/ads/internal/client/zzm;)V
    .locals 1

    sget-object v0, Lcom/google/android/gms/ads/internal/client/zzm;->zzamr:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    sput-object p0, Lcom/google/android/gms/ads/internal/client/zzm;->zzavm:Lcom/google/android/gms/ads/internal/client/zzm;

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method private static zziv()Lcom/google/android/gms/ads/internal/client/zzm;
    .locals 2

    sget-object v0, Lcom/google/android/gms/ads/internal/client/zzm;->zzamr:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/google/android/gms/ads/internal/client/zzm;->zzavm:Lcom/google/android/gms/ads/internal/client/zzm;

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public static zziw()Lcom/google/android/gms/ads/internal/util/client/zza;
    .locals 1

    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzm;->zziv()Lcom/google/android/gms/ads/internal/client/zzm;

    move-result-object v0

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/client/zzm;->zzavn:Lcom/google/android/gms/ads/internal/util/client/zza;

    return-object v0
.end method

.method public static zzix()Lcom/google/android/gms/ads/internal/client/zzl;
    .locals 1

    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzm;->zziv()Lcom/google/android/gms/ads/internal/client/zzm;

    move-result-object v0

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/client/zzm;->zzavo:Lcom/google/android/gms/ads/internal/client/zzl;

    return-object v0
.end method
