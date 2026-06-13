.class Lcom/google/android/gms/internal/zzfq$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzfq;->zza(Landroid/content/Context;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;Ljava/lang/String;Lcom/google/android/gms/internal/zzas;)Ljava/util/concurrent/Future;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzala:Landroid/content/Context;

.field final synthetic zzblf:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

.field final synthetic zzblg:Lcom/google/android/gms/internal/zzfq$zza;

.field final synthetic zzblh:Lcom/google/android/gms/internal/zzas;

.field final synthetic zzbli:Ljava/lang/String;

.field final synthetic zzblj:Lcom/google/android/gms/internal/zzfq;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzfq;Landroid/content/Context;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;Lcom/google/android/gms/internal/zzfq$zza;Lcom/google/android/gms/internal/zzas;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzfq$1;->zzblj:Lcom/google/android/gms/internal/zzfq;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzfq$1;->zzala:Landroid/content/Context;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzfq$1;->zzblf:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    iput-object p4, p0, Lcom/google/android/gms/internal/zzfq$1;->zzblg:Lcom/google/android/gms/internal/zzfq$zza;

    iput-object p5, p0, Lcom/google/android/gms/internal/zzfq$1;->zzblh:Lcom/google/android/gms/internal/zzas;

    iput-object p6, p0, Lcom/google/android/gms/internal/zzfq$1;->zzbli:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfq$1;->zzblj:Lcom/google/android/gms/internal/zzfq;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzfq$1;->zzala:Landroid/content/Context;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzfq$1;->zzblf:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    iget-object v3, p0, Lcom/google/android/gms/internal/zzfq$1;->zzblg:Lcom/google/android/gms/internal/zzfq$zza;

    iget-object v4, p0, Lcom/google/android/gms/internal/zzfq$1;->zzblh:Lcom/google/android/gms/internal/zzas;

    invoke-static {v0, v1, v2, v3, v4}, Lcom/google/android/gms/internal/zzfq;->zza(Lcom/google/android/gms/internal/zzfq;Landroid/content/Context;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;Lcom/google/android/gms/internal/zzfq$zza;Lcom/google/android/gms/internal/zzas;)Lcom/google/android/gms/internal/zzfp;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzfq$1;->zzbli:Ljava/lang/String;

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzfp;->zzbh(Ljava/lang/String;)V

    return-void
.end method
