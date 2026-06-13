.class Lcom/google/android/gms/internal/zziw$zza;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zziw;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "zza"
.end annotation


# instance fields
.field public final zzchb:J

.field public final zzchc:Lcom/google/android/gms/internal/zziv;

.field final synthetic zzchd:Lcom/google/android/gms/internal/zziw;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zziw;Lcom/google/android/gms/internal/zziv;)V
    .locals 2

    iput-object p1, p0, Lcom/google/android/gms/internal/zziw$zza;->zzchd:Lcom/google/android/gms/internal/zziw;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzfu()Lcom/google/android/gms/common/util/zze;

    move-result-object p1

    invoke-interface {p1}, Lcom/google/android/gms/common/util/zze;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/gms/internal/zziw$zza;->zzchb:J

    iput-object p2, p0, Lcom/google/android/gms/internal/zziw$zza;->zzchc:Lcom/google/android/gms/internal/zziv;

    return-void
.end method


# virtual methods
.method public hasExpired()Z
    .locals 5

    iget-wide v0, p0, Lcom/google/android/gms/internal/zziw$zza;->zzchb:J

    sget-object v2, Lcom/google/android/gms/internal/zzdc;->zzbat:Lcom/google/android/gms/internal/zzcy;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzcy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    add-long/2addr v0, v2

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzfu()Lcom/google/android/gms/common/util/zze;

    move-result-object v2

    invoke-interface {v2}, Lcom/google/android/gms/common/util/zze;->currentTimeMillis()J

    move-result-wide v2

    cmp-long v4, v0, v2

    if-gez v4, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
