.class Lcom/google/android/gms/internal/zzii$5;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzkx$zza;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzii;->zzg(Lorg/json/JSONObject;)Lcom/google/android/gms/internal/zzky;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/gms/internal/zzkx$zza<",
        "Ljava/util/List<",
        "Lcom/google/android/gms/ads/internal/formats/zzc;",
        ">;",
        "Lcom/google/android/gms/ads/internal/formats/zza;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic zzbzk:Lcom/google/android/gms/internal/zzii;

.field final synthetic zzbzq:Ljava/lang/String;

.field final synthetic zzbzr:Ljava/lang/Integer;

.field final synthetic zzbzs:Ljava/lang/Integer;

.field final synthetic zzbzt:I

.field final synthetic zzbzu:I

.field final synthetic zzbzv:I

.field final synthetic zzbzw:I


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzii;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;IIII)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzii$5;->zzbzk:Lcom/google/android/gms/internal/zzii;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzii$5;->zzbzq:Ljava/lang/String;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzii$5;->zzbzr:Ljava/lang/Integer;

    iput-object p4, p0, Lcom/google/android/gms/internal/zzii$5;->zzbzs:Ljava/lang/Integer;

    iput p5, p0, Lcom/google/android/gms/internal/zzii$5;->zzbzt:I

    iput p6, p0, Lcom/google/android/gms/internal/zzii$5;->zzbzu:I

    iput p7, p0, Lcom/google/android/gms/internal/zzii$5;->zzbzv:I

    iput p8, p0, Lcom/google/android/gms/internal/zzii$5;->zzbzw:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public synthetic apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Ljava/util/List;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzii$5;->zzj(Ljava/util/List;)Lcom/google/android/gms/ads/internal/formats/zza;

    move-result-object p1

    return-object p1
.end method

.method public zzj(Ljava/util/List;)Lcom/google/android/gms/ads/internal/formats/zza;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/android/gms/ads/internal/formats/zzc;",
            ">;)",
            "Lcom/google/android/gms/ads/internal/formats/zza;"
        }
    .end annotation

    const/4 v0, 0x0

    if-eqz p1, :cond_2

    :try_start_0
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_1

    :cond_0
    new-instance v1, Lcom/google/android/gms/ads/internal/formats/zza;

    iget-object v3, p0, Lcom/google/android/gms/internal/zzii$5;->zzbzq:Ljava/lang/String;

    invoke-static {p1}, Lcom/google/android/gms/internal/zzii;->zzi(Ljava/util/List;)Ljava/util/List;

    move-result-object v4

    iget-object v5, p0, Lcom/google/android/gms/internal/zzii$5;->zzbzr:Ljava/lang/Integer;

    iget-object v6, p0, Lcom/google/android/gms/internal/zzii$5;->zzbzs:Ljava/lang/Integer;

    iget p1, p0, Lcom/google/android/gms/internal/zzii$5;->zzbzt:I

    if-lez p1, :cond_1

    iget p1, p0, Lcom/google/android/gms/internal/zzii$5;->zzbzt:I

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    move-object v7, p1

    goto :goto_0

    :cond_1
    move-object v7, v0

    :goto_0
    iget p1, p0, Lcom/google/android/gms/internal/zzii$5;->zzbzu:I

    iget v2, p0, Lcom/google/android/gms/internal/zzii$5;->zzbzv:I

    add-int v8, p1, v2

    iget v9, p0, Lcom/google/android/gms/internal/zzii$5;->zzbzw:I

    move-object v2, v1

    invoke-direct/range {v2 .. v9}, Lcom/google/android/gms/ads/internal/formats/zza;-><init>(Ljava/lang/String;Ljava/util/List;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;II)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v1

    goto :goto_1

    :catch_0
    move-exception p1

    const-string v1, "Could not get attribution icon"

    invoke-static {v1, p1}, Lcom/google/android/gms/internal/zzkd;->zzb(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_2
    :goto_1
    return-object v0
.end method
