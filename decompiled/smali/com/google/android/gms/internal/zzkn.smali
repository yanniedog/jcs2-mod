.class public Lcom/google/android/gms/internal/zzkn;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzin;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/zzkn$zzc;,
        Lcom/google/android/gms/internal/zzkn$zzb;,
        Lcom/google/android/gms/internal/zzkn$zza;
    }
.end annotation


# static fields
.field private static zzcmc:Lcom/google/android/gms/internal/zzl;

.field private static final zzcmd:Ljava/lang/Object;

.field public static final zzcme:Lcom/google/android/gms/internal/zzkn$zza;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/zzkn$zza<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/zzkn;->zzcmd:Ljava/lang/Object;

    new-instance v0, Lcom/google/android/gms/internal/zzkn$1;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzkn$1;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/zzkn;->zzcme:Lcom/google/android/gms/internal/zzkn$zza;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Lcom/google/android/gms/internal/zzkn;->zzap(Landroid/content/Context;)Lcom/google/android/gms/internal/zzl;

    return-void
.end method

.method private static zzap(Landroid/content/Context;)Lcom/google/android/gms/internal/zzl;
    .locals 2

    sget-object v0, Lcom/google/android/gms/internal/zzkn;->zzcmd:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/google/android/gms/internal/zzkn;->zzcmc:Lcom/google/android/gms/internal/zzl;

    if-nez v1, :cond_0

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/internal/zzac;->zza(Landroid/content/Context;)Lcom/google/android/gms/internal/zzl;

    move-result-object p0

    sput-object p0, Lcom/google/android/gms/internal/zzkn;->zzcmc:Lcom/google/android/gms/internal/zzl;

    :cond_0
    sget-object p0, Lcom/google/android/gms/internal/zzkn;->zzcmc:Lcom/google/android/gms/internal/zzl;

    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method


# virtual methods
.method public zza(ILjava/lang/String;Ljava/util/Map;[B)Lcom/google/android/gms/internal/zzky;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;[B)",
            "Lcom/google/android/gms/internal/zzky<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    new-instance v8, Lcom/google/android/gms/internal/zzkn$zzc;

    const/4 v0, 0x0

    invoke-direct {v8, p0, v0}, Lcom/google/android/gms/internal/zzkn$zzc;-><init>(Lcom/google/android/gms/internal/zzkn;Lcom/google/android/gms/internal/zzkn$1;)V

    new-instance v5, Lcom/google/android/gms/internal/zzkn$2;

    invoke-direct {v5, p0, p2, v8}, Lcom/google/android/gms/internal/zzkn$2;-><init>(Lcom/google/android/gms/internal/zzkn;Ljava/lang/String;Lcom/google/android/gms/internal/zzkn$zzc;)V

    new-instance v9, Lcom/google/android/gms/internal/zzkn$3;

    move-object v0, v9

    move-object v1, p0

    move v2, p1

    move-object v3, p2

    move-object v4, v8

    move-object v6, p4

    move-object v7, p3

    invoke-direct/range {v0 .. v7}, Lcom/google/android/gms/internal/zzkn$3;-><init>(Lcom/google/android/gms/internal/zzkn;ILjava/lang/String;Lcom/google/android/gms/internal/zzm$zzb;Lcom/google/android/gms/internal/zzm$zza;[BLjava/util/Map;)V

    sget-object p1, Lcom/google/android/gms/internal/zzkn;->zzcmc:Lcom/google/android/gms/internal/zzl;

    invoke-virtual {p1, v9}, Lcom/google/android/gms/internal/zzl;->zze(Lcom/google/android/gms/internal/zzk;)Lcom/google/android/gms/internal/zzk;

    return-object v8
.end method

.method public zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzkn$zza;)Lcom/google/android/gms/internal/zzky;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/zzkn$zza<",
            "TT;>;)",
            "Lcom/google/android/gms/internal/zzky<",
            "TT;>;"
        }
    .end annotation

    new-instance v0, Lcom/google/android/gms/internal/zzkn$zzc;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/google/android/gms/internal/zzkn$zzc;-><init>(Lcom/google/android/gms/internal/zzkn;Lcom/google/android/gms/internal/zzkn$1;)V

    sget-object v1, Lcom/google/android/gms/internal/zzkn;->zzcmc:Lcom/google/android/gms/internal/zzl;

    new-instance v2, Lcom/google/android/gms/internal/zzkn$zzb;

    invoke-direct {v2, p1, p2, v0}, Lcom/google/android/gms/internal/zzkn$zzb;-><init>(Ljava/lang/String;Lcom/google/android/gms/internal/zzkn$zza;Lcom/google/android/gms/internal/zzm$zzb;)V

    invoke-virtual {v1, v2}, Lcom/google/android/gms/internal/zzl;->zze(Lcom/google/android/gms/internal/zzk;)Lcom/google/android/gms/internal/zzk;

    return-object v0
.end method

.method public zzc(Ljava/lang/String;Ljava/util/Map;)Lcom/google/android/gms/internal/zzky;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/google/android/gms/internal/zzky<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, p2, v1}, Lcom/google/android/gms/internal/zzkn;->zza(ILjava/lang/String;Ljava/util/Map;[B)Lcom/google/android/gms/internal/zzky;

    move-result-object p1

    return-object p1
.end method
