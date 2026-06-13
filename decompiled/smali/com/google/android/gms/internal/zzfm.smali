.class Lcom/google/android/gms/internal/zzfm;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzin;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/zzfm$zza;
    }
.end annotation


# instance fields
.field private final zzaln:Ljava/lang/String;

.field private final zzbkr:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Lcom/google/android/gms/internal/zzfm$zza;",
            ">;"
        }
    .end annotation
.end field

.field private zzbks:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

.field private final zzbkt:I

.field private zzbku:Z


# direct methods
.method constructor <init>(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;Ljava/lang/String;I)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Lcom/google/android/gms/common/internal/zzab;->zzy(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p2}, Lcom/google/android/gms/common/internal/zzab;->zzy(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzfm;->zzbkr:Ljava/util/LinkedList;

    iput-object p1, p0, Lcom/google/android/gms/internal/zzfm;->zzbks:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzfm;->zzaln:Ljava/lang/String;

    iput p3, p0, Lcom/google/android/gms/internal/zzfm;->zzbkt:I

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzfm;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/zzfm;->zzaln:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic zzb(Lcom/google/android/gms/internal/zzfm;)Lcom/google/android/gms/ads/internal/client/AdRequestParcel;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/zzfm;->zzbks:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

    return-object p0
.end method


# virtual methods
.method getAdUnitId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfm;->zzaln:Ljava/lang/String;

    return-object v0
.end method

.method getNetworkType()I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/internal/zzfm;->zzbkt:I

    return v0
.end method

.method size()I
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfm;->zzbkr:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    return v0
.end method

.method zza(Lcom/google/android/gms/internal/zzfh;Lcom/google/android/gms/ads/internal/client/AdRequestParcel;)V
    .locals 1

    new-instance v0, Lcom/google/android/gms/internal/zzfm$zza;

    invoke-direct {v0, p0, p1, p2}, Lcom/google/android/gms/internal/zzfm$zza;-><init>(Lcom/google/android/gms/internal/zzfm;Lcom/google/android/gms/internal/zzfh;Lcom/google/android/gms/ads/internal/client/AdRequestParcel;)V

    iget-object p1, p0, Lcom/google/android/gms/internal/zzfm;->zzbkr:Ljava/util/LinkedList;

    invoke-virtual {p1, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method zzb(Lcom/google/android/gms/internal/zzfh;)V
    .locals 1

    new-instance v0, Lcom/google/android/gms/internal/zzfm$zza;

    invoke-direct {v0, p0, p1}, Lcom/google/android/gms/internal/zzfm$zza;-><init>(Lcom/google/android/gms/internal/zzfm;Lcom/google/android/gms/internal/zzfh;)V

    iget-object p1, p0, Lcom/google/android/gms/internal/zzfm;->zzbkr:Ljava/util/LinkedList;

    invoke-virtual {p1, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzfm$zza;->zzlv()V

    return-void
.end method

.method zzlq()Lcom/google/android/gms/ads/internal/client/AdRequestParcel;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfm;->zzbks:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

    return-object v0
.end method

.method zzlr()I
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfm;->zzbkr:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/zzfm$zza;

    iget-boolean v2, v2, Lcom/google/android/gms/internal/zzfm$zza;->zzbkz:Z

    if-eqz v2, :cond_0

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return v1
.end method

.method zzls()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfm;->zzbkr:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/zzfm$zza;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzfm$zza;->zzlv()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method zzlt()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzfm;->zzbku:Z

    return-void
.end method

.method zzlu()Z
    .locals 1

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzfm;->zzbku:Z

    return v0
.end method

.method zzm(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;)Lcom/google/android/gms/internal/zzfm$zza;
    .locals 0

    if-eqz p1, :cond_0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzfm;->zzbks:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

    :cond_0
    iget-object p1, p0, Lcom/google/android/gms/internal/zzfm;->zzbkr:Ljava/util/LinkedList;

    invoke-virtual {p1}, Ljava/util/LinkedList;->remove()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/internal/zzfm$zza;

    return-object p1
.end method
