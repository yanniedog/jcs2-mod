.class public final Lcom/google/android/gms/internal/zzamy;
.super Lcom/google/android/gms/internal/zzamv;


# instance fields
.field private final bej:Lcom/google/android/gms/internal/zzant;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/zzant<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/zzamv;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzamv;-><init>()V

    new-instance v0, Lcom/google/android/gms/internal/zzant;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzant;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzamy;->bej:Lcom/google/android/gms/internal/zzant;

    return-void
.end method


# virtual methods
.method public entrySet()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/util/Map$Entry<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/zzamv;",
            ">;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzamy;->bej:Lcom/google/android/gms/internal/zzant;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzant;->entrySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1

    if-eq p1, p0, :cond_1

    instance-of v0, p1, Lcom/google/android/gms/internal/zzamy;

    if-eqz v0, :cond_0

    check-cast p1, Lcom/google/android/gms/internal/zzamy;

    iget-object p1, p1, Lcom/google/android/gms/internal/zzamy;->bej:Lcom/google/android/gms/internal/zzant;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzamy;->bej:Lcom/google/android/gms/internal/zzant;

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzant;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    return p1
.end method

.method public has(Ljava/lang/String;)Z
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzamy;->bej:Lcom/google/android/gms/internal/zzant;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzant;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public hashCode()I
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzamy;->bej:Lcom/google/android/gms/internal/zzant;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzant;->hashCode()I

    move-result v0

    return v0
.end method

.method public zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzamv;)V
    .locals 1

    if-nez p2, :cond_0

    sget-object p2, Lcom/google/android/gms/internal/zzamx;->bei:Lcom/google/android/gms/internal/zzamx;

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzamy;->bej:Lcom/google/android/gms/internal/zzant;

    invoke-virtual {v0, p1, p2}, Lcom/google/android/gms/internal/zzant;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public zzto(Ljava/lang/String;)Lcom/google/android/gms/internal/zzamv;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzamy;->bej:Lcom/google/android/gms/internal/zzant;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzant;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/internal/zzamv;

    return-object p1
.end method
