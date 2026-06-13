.class public Lcom/google/android/gms/internal/zzbe;
.super Lcom/google/android/gms/internal/zzbp;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zzax;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/zzae$zza;II)V
    .locals 0

    invoke-direct/range {p0 .. p6}, Lcom/google/android/gms/internal/zzbp;-><init>(Lcom/google/android/gms/internal/zzax;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/zzae$zza;II)V

    return-void
.end method


# virtual methods
.method protected zzcu()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbe;->zzaha:Lcom/google/android/gms/internal/zzae$zza;

    const-wide/16 v1, -0x1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    iput-object v1, v0, Lcom/google/android/gms/internal/zzae$zza;->zzcw:Ljava/lang/Long;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbe;->zzaha:Lcom/google/android/gms/internal/zzae$zza;

    iput-object v1, v0, Lcom/google/android/gms/internal/zzae$zza;->zzcx:Ljava/lang/Long;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbe;->zzahh:Ljava/lang/reflect/Method;

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/google/android/gms/internal/zzbe;->zzaey:Lcom/google/android/gms/internal/zzax;

    invoke-virtual {v3}, Lcom/google/android/gms/internal/zzax;->getContext()Landroid/content/Context;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const/4 v3, 0x0

    invoke-virtual {v0, v3, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    iget-object v2, p0, Lcom/google/android/gms/internal/zzbe;->zzaha:Lcom/google/android/gms/internal/zzae$zza;

    monitor-enter v2

    :try_start_0
    iget-object v3, p0, Lcom/google/android/gms/internal/zzbe;->zzaha:Lcom/google/android/gms/internal/zzae$zza;

    aget v4, v0, v4

    int-to-long v4, v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    iput-object v4, v3, Lcom/google/android/gms/internal/zzae$zza;->zzcw:Ljava/lang/Long;

    iget-object v3, p0, Lcom/google/android/gms/internal/zzbe;->zzaha:Lcom/google/android/gms/internal/zzae$zza;

    aget v0, v0, v1

    int-to-long v0, v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iput-object v0, v3, Lcom/google/android/gms/internal/zzae$zza;->zzcx:Ljava/lang/Long;

    monitor-exit v2

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
