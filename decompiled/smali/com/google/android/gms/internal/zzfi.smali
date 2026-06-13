.class Lcom/google/android/gms/internal/zzfi;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzin;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/zzfi$zza;
    }
.end annotation


# instance fields
.field private final zzalc:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/android/gms/internal/zzfi$zza;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzfi;->zzalc:Ljava/util/List;

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzfi;)Ljava/util/List;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/zzfi;->zzalc:Ljava/util/List;

    return-object p0
.end method


# virtual methods
.method zza(Lcom/google/android/gms/internal/zzfj;)V
    .locals 4

    sget-object v0, Lcom/google/android/gms/internal/zzkh;->zzclc:Landroid/os/Handler;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzfi;->zzalc:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/zzfi$zza;

    new-instance v3, Lcom/google/android/gms/internal/zzfi$7;

    invoke-direct {v3, p0, v2, p1}, Lcom/google/android/gms/internal/zzfi$7;-><init>(Lcom/google/android/gms/internal/zzfi;Lcom/google/android/gms/internal/zzfi$zza;Lcom/google/android/gms/internal/zzfj;)V

    invoke-virtual {v0, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    :cond_0
    return-void
.end method

.method zzc(Lcom/google/android/gms/ads/internal/zzl;)V
    .locals 1

    new-instance v0, Lcom/google/android/gms/internal/zzfi$1;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/zzfi$1;-><init>(Lcom/google/android/gms/internal/zzfi;)V

    invoke-virtual {p1, v0}, Lcom/google/android/gms/ads/internal/zzl;->zza(Lcom/google/android/gms/ads/internal/client/zzq;)V

    new-instance v0, Lcom/google/android/gms/internal/zzfi$2;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/zzfi$2;-><init>(Lcom/google/android/gms/internal/zzfi;)V

    invoke-virtual {p1, v0}, Lcom/google/android/gms/ads/internal/zzl;->zza(Lcom/google/android/gms/ads/internal/client/zzw;)V

    new-instance v0, Lcom/google/android/gms/internal/zzfi$3;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/zzfi$3;-><init>(Lcom/google/android/gms/internal/zzfi;)V

    invoke-virtual {p1, v0}, Lcom/google/android/gms/ads/internal/zzl;->zza(Lcom/google/android/gms/internal/zzho;)V

    new-instance v0, Lcom/google/android/gms/internal/zzfi$4;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/zzfi$4;-><init>(Lcom/google/android/gms/internal/zzfi;)V

    invoke-virtual {p1, v0}, Lcom/google/android/gms/ads/internal/zzl;->zza(Lcom/google/android/gms/internal/zzdo;)V

    new-instance v0, Lcom/google/android/gms/internal/zzfi$5;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/zzfi$5;-><init>(Lcom/google/android/gms/internal/zzfi;)V

    invoke-virtual {p1, v0}, Lcom/google/android/gms/ads/internal/zzl;->zza(Lcom/google/android/gms/ads/internal/client/zzp;)V

    new-instance v0, Lcom/google/android/gms/internal/zzfi$6;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/zzfi$6;-><init>(Lcom/google/android/gms/internal/zzfi;)V

    invoke-virtual {p1, v0}, Lcom/google/android/gms/ads/internal/zzl;->zza(Lcom/google/android/gms/ads/internal/reward/client/zzd;)V

    return-void
.end method
