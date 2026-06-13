.class public Lcom/google/android/gms/internal/zzev;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzep;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzin;
.end annotation


# static fields
.field static final zzbiv:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final zzbit:Lcom/google/android/gms/ads/internal/zze;

.field private final zzbiu:Lcom/google/android/gms/internal/zzha;


# direct methods
.method static constructor <clinit>()V
    .locals 13

    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v0, 0x2

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v0, 0x3

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/4 v0, 0x4

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    const/4 v0, 0x5

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    const/4 v0, 0x6

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    const-string v1, "resize"

    const-string v3, "playVideo"

    const-string v5, "storePicture"

    const-string v7, "createCalendarEvent"

    const-string v9, "setOrientationProperties"

    const-string v11, "closeResizedAd"

    invoke-static/range {v1 .. v12}, Lcom/google/android/gms/common/util/zzf;->zza(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/internal/zzev;->zzbiv:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>(Lcom/google/android/gms/ads/internal/zze;Lcom/google/android/gms/internal/zzha;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzev;->zzbit:Lcom/google/android/gms/ads/internal/zze;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzev;->zzbiu:Lcom/google/android/gms/internal/zzha;

    return-void
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/internal/zzlh;Ljava/util/Map;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzlh;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    const-string v0, "a"

    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    sget-object v1, Lcom/google/android/gms/internal/zzev;->zzbiv:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v1, 0x5

    if-eq v0, v1, :cond_0

    iget-object v2, p0, Lcom/google/android/gms/internal/zzev;->zzbit:Lcom/google/android/gms/ads/internal/zze;

    if-eqz v2, :cond_0

    invoke-virtual {v2}, Lcom/google/android/gms/ads/internal/zze;->zzel()Z

    move-result v2

    if-nez v2, :cond_0

    iget-object p1, p0, Lcom/google/android/gms/internal/zzev;->zzbit:Lcom/google/android/gms/ads/internal/zze;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lcom/google/android/gms/ads/internal/zze;->zzt(Ljava/lang/String;)V

    return-void

    :cond_0
    const/4 v2, 0x1

    if-eq v0, v2, :cond_5

    const/4 v3, 0x3

    if-eq v0, v3, :cond_4

    const/4 v3, 0x4

    if-eq v0, v3, :cond_3

    if-eq v0, v1, :cond_2

    const/4 p1, 0x6

    if-eq v0, p1, :cond_1

    const-string p1, "Unknown MRAID command called."

    invoke-static {p1}, Lcom/google/android/gms/internal/zzkd;->zzcw(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/google/android/gms/internal/zzev;->zzbiu:Lcom/google/android/gms/internal/zzha;

    invoke-virtual {p1, v2}, Lcom/google/android/gms/internal/zzha;->zzs(Z)V

    goto :goto_0

    :cond_2
    new-instance v0, Lcom/google/android/gms/internal/zzhb;

    invoke-direct {v0, p1, p2}, Lcom/google/android/gms/internal/zzhb;-><init>(Lcom/google/android/gms/internal/zzlh;Ljava/util/Map;)V

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzhb;->execute()V

    goto :goto_0

    :cond_3
    new-instance v0, Lcom/google/android/gms/internal/zzgz;

    invoke-direct {v0, p1, p2}, Lcom/google/android/gms/internal/zzgz;-><init>(Lcom/google/android/gms/internal/zzlh;Ljava/util/Map;)V

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzgz;->execute()V

    goto :goto_0

    :cond_4
    new-instance v0, Lcom/google/android/gms/internal/zzhc;

    invoke-direct {v0, p1, p2}, Lcom/google/android/gms/internal/zzhc;-><init>(Lcom/google/android/gms/internal/zzlh;Ljava/util/Map;)V

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzhc;->execute()V

    goto :goto_0

    :cond_5
    iget-object p1, p0, Lcom/google/android/gms/internal/zzev;->zzbiu:Lcom/google/android/gms/internal/zzha;

    invoke-virtual {p1, p2}, Lcom/google/android/gms/internal/zzha;->execute(Ljava/util/Map;)V

    :goto_0
    return-void
.end method
