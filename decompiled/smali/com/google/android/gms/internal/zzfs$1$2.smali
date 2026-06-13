.class Lcom/google/android/gms/internal/zzfs$1$2;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzep;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzfs$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzblz:Lcom/google/android/gms/internal/zzfp;

.field final synthetic zzbma:Lcom/google/android/gms/internal/zzfs$1;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzfs$1;Lcom/google/android/gms/internal/zzfp;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzfs$1$2;->zzbma:Lcom/google/android/gms/internal/zzfs$1;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzfs$1$2;->zzblz:Lcom/google/android/gms/internal/zzfp;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/internal/zzlh;Ljava/util/Map;)V
    .locals 1
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

    iget-object p1, p0, Lcom/google/android/gms/internal/zzfs$1$2;->zzbma:Lcom/google/android/gms/internal/zzfs$1;

    iget-object p1, p1, Lcom/google/android/gms/internal/zzfs$1;->zzbly:Lcom/google/android/gms/internal/zzfs;

    invoke-static {p1}, Lcom/google/android/gms/internal/zzfs;->zzc(Lcom/google/android/gms/internal/zzfs;)Ljava/lang/Object;

    move-result-object p1

    monitor-enter p1

    :try_start_0
    iget-object p2, p0, Lcom/google/android/gms/internal/zzfs$1$2;->zzbma:Lcom/google/android/gms/internal/zzfs$1;

    iget-object p2, p2, Lcom/google/android/gms/internal/zzfs$1;->zzblx:Lcom/google/android/gms/internal/zzfs$zzd;

    invoke-virtual {p2}, Lcom/google/android/gms/internal/zzfs$zzd;->getStatus()I

    move-result p2

    const/4 v0, -0x1

    if-eq p2, v0, :cond_1

    iget-object p2, p0, Lcom/google/android/gms/internal/zzfs$1$2;->zzbma:Lcom/google/android/gms/internal/zzfs$1;

    iget-object p2, p2, Lcom/google/android/gms/internal/zzfs$1;->zzblx:Lcom/google/android/gms/internal/zzfs$zzd;

    invoke-virtual {p2}, Lcom/google/android/gms/internal/zzfs$zzd;->getStatus()I

    move-result p2

    const/4 v0, 0x1

    if-ne p2, v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object p2, p0, Lcom/google/android/gms/internal/zzfs$1$2;->zzbma:Lcom/google/android/gms/internal/zzfs$1;

    iget-object p2, p2, Lcom/google/android/gms/internal/zzfs$1;->zzbly:Lcom/google/android/gms/internal/zzfs;

    const/4 v0, 0x0

    invoke-static {p2, v0}, Lcom/google/android/gms/internal/zzfs;->zza(Lcom/google/android/gms/internal/zzfs;I)I

    iget-object p2, p0, Lcom/google/android/gms/internal/zzfs$1$2;->zzbma:Lcom/google/android/gms/internal/zzfs$1;

    iget-object p2, p2, Lcom/google/android/gms/internal/zzfs$1;->zzbly:Lcom/google/android/gms/internal/zzfs;

    invoke-static {p2}, Lcom/google/android/gms/internal/zzfs;->zzd(Lcom/google/android/gms/internal/zzfs;)Lcom/google/android/gms/internal/zzkl;

    move-result-object p2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfs$1$2;->zzblz:Lcom/google/android/gms/internal/zzfp;

    invoke-interface {p2, v0}, Lcom/google/android/gms/internal/zzkl;->zzd(Ljava/lang/Object;)V

    iget-object p2, p0, Lcom/google/android/gms/internal/zzfs$1$2;->zzbma:Lcom/google/android/gms/internal/zzfs$1;

    iget-object p2, p2, Lcom/google/android/gms/internal/zzfs$1;->zzblx:Lcom/google/android/gms/internal/zzfs$zzd;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfs$1$2;->zzblz:Lcom/google/android/gms/internal/zzfp;

    invoke-virtual {p2, v0}, Lcom/google/android/gms/internal/zzfs$zzd;->zzg(Ljava/lang/Object;)V

    iget-object p2, p0, Lcom/google/android/gms/internal/zzfs$1$2;->zzbma:Lcom/google/android/gms/internal/zzfs$1;

    iget-object p2, p2, Lcom/google/android/gms/internal/zzfs$1;->zzbly:Lcom/google/android/gms/internal/zzfs;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfs$1$2;->zzbma:Lcom/google/android/gms/internal/zzfs$1;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzfs$1;->zzblx:Lcom/google/android/gms/internal/zzfs$zzd;

    invoke-static {p2, v0}, Lcom/google/android/gms/internal/zzfs;->zza(Lcom/google/android/gms/internal/zzfs;Lcom/google/android/gms/internal/zzfs$zzd;)Lcom/google/android/gms/internal/zzfs$zzd;

    const-string p2, "Successfully loaded JS Engine."

    invoke-static {p2}, Lcom/google/android/gms/internal/zzkd;->v(Ljava/lang/String;)V

    monitor-exit p1

    return-void

    :cond_1
    :goto_0
    monitor-exit p1

    return-void

    :catchall_0
    move-exception p2

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p2
.end method
