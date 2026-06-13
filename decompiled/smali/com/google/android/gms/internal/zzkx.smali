.class public Lcom/google/android/gms/internal/zzkx;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzin;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/zzkx$zza;
    }
.end annotation


# direct methods
.method public static zza(Lcom/google/android/gms/internal/zzky;Lcom/google/android/gms/internal/zzkx$zza;)Lcom/google/android/gms/internal/zzky;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<A:",
            "Ljava/lang/Object;",
            "B:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/android/gms/internal/zzky<",
            "TA;>;",
            "Lcom/google/android/gms/internal/zzkx$zza<",
            "TA;TB;>;)",
            "Lcom/google/android/gms/internal/zzky<",
            "TB;>;"
        }
    .end annotation

    new-instance v0, Lcom/google/android/gms/internal/zzkv;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzkv;-><init>()V

    new-instance v1, Lcom/google/android/gms/internal/zzkx$1;

    invoke-direct {v1, v0, p1, p0}, Lcom/google/android/gms/internal/zzkx$1;-><init>(Lcom/google/android/gms/internal/zzkv;Lcom/google/android/gms/internal/zzkx$zza;Lcom/google/android/gms/internal/zzky;)V

    invoke-interface {p0, v1}, Lcom/google/android/gms/internal/zzky;->zzc(Ljava/lang/Runnable;)V

    return-object v0
.end method

.method public static zzn(Ljava/util/List;)Lcom/google/android/gms/internal/zzky;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List<",
            "Lcom/google/android/gms/internal/zzky<",
            "TV;>;>;)",
            "Lcom/google/android/gms/internal/zzky<",
            "Ljava/util/List<",
            "TV;>;>;"
        }
    .end annotation

    new-instance v0, Lcom/google/android/gms/internal/zzkv;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzkv;-><init>()V

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    new-instance v2, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/android/gms/internal/zzky;

    new-instance v5, Lcom/google/android/gms/internal/zzkx$2;

    invoke-direct {v5, v2, v1, v0, p0}, Lcom/google/android/gms/internal/zzkx$2;-><init>(Ljava/util/concurrent/atomic/AtomicInteger;ILcom/google/android/gms/internal/zzkv;Ljava/util/List;)V

    invoke-interface {v4, v5}, Lcom/google/android/gms/internal/zzky;->zzc(Ljava/lang/Runnable;)V

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method private static zzo(Ljava/util/List;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List<",
            "Lcom/google/android/gms/internal/zzky<",
            "TV;>;>;)",
            "Ljava/util/List<",
            "TV;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/concurrent/ExecutionException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/zzky;

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzky;->get()Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method static synthetic zzp(Ljava/util/List;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/concurrent/ExecutionException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    invoke-static {p0}, Lcom/google/android/gms/internal/zzkx;->zzo(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method
