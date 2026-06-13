.class Lcom/google/android/gms/internal/zzpb$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzpb;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic qO:Lcom/google/android/gms/internal/zzpb;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzpb;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzpb$1;->qO:Lcom/google/android/gms/internal/zzpb;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    iget-object v0, p0, Lcom/google/android/gms/internal/zzpb$1;->qO:Lcom/google/android/gms/internal/zzpb;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzpb;->zza(Lcom/google/android/gms/internal/zzpb;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzpb$1;->qO:Lcom/google/android/gms/internal/zzpb;

    invoke-static {v1}, Lcom/google/android/gms/internal/zzpb;->zzb(Lcom/google/android/gms/internal/zzpb;)J

    move-result-wide v1

    iget-object v3, p0, Lcom/google/android/gms/internal/zzpb$1;->qO:Lcom/google/android/gms/internal/zzpb;

    invoke-static {v3}, Lcom/google/android/gms/internal/zzpb;->zzc(Lcom/google/android/gms/internal/zzpb;)Lcom/google/android/gms/common/util/zze;

    move-result-object v3

    invoke-interface {v3}, Lcom/google/android/gms/common/util/zze;->elapsedRealtime()J

    move-result-wide v3

    cmp-long v5, v1, v3

    if-gtz v5, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzpb$1;->qO:Lcom/google/android/gms/internal/zzpb;

    invoke-static {v1}, Lcom/google/android/gms/internal/zzpb;->zzd(Lcom/google/android/gms/internal/zzpb;)Lcom/google/android/gms/common/api/GoogleApiClient;

    move-result-object v1

    if-eqz v1, :cond_0

    const-string v1, "ClearcutLoggerApiImpl"

    const-string v2, "disconnect managed GoogleApiClient"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v1, p0, Lcom/google/android/gms/internal/zzpb$1;->qO:Lcom/google/android/gms/internal/zzpb;

    invoke-static {v1}, Lcom/google/android/gms/internal/zzpb;->zzd(Lcom/google/android/gms/internal/zzpb;)Lcom/google/android/gms/common/api/GoogleApiClient;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/common/api/GoogleApiClient;->disconnect()V

    iget-object v1, p0, Lcom/google/android/gms/internal/zzpb$1;->qO:Lcom/google/android/gms/internal/zzpb;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/zzpb;->zza(Lcom/google/android/gms/internal/zzpb;Lcom/google/android/gms/common/api/GoogleApiClient;)Lcom/google/android/gms/common/api/GoogleApiClient;

    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
