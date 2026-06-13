.class Lcom/google/android/gms/internal/zzfs$1$3;
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

.field final synthetic zzbmd:Lcom/google/android/gms/internal/zzks;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzfs$1;Lcom/google/android/gms/internal/zzfp;Lcom/google/android/gms/internal/zzks;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzfs$1$3;->zzbma:Lcom/google/android/gms/internal/zzfs$1;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzfs$1$3;->zzblz:Lcom/google/android/gms/internal/zzfp;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzfs$1$3;->zzbmd:Lcom/google/android/gms/internal/zzks;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/internal/zzlh;Ljava/util/Map;)V
    .locals 2
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

    iget-object p1, p0, Lcom/google/android/gms/internal/zzfs$1$3;->zzbma:Lcom/google/android/gms/internal/zzfs$1;

    iget-object p1, p1, Lcom/google/android/gms/internal/zzfs$1;->zzbly:Lcom/google/android/gms/internal/zzfs;

    invoke-static {p1}, Lcom/google/android/gms/internal/zzfs;->zzc(Lcom/google/android/gms/internal/zzfs;)Ljava/lang/Object;

    move-result-object p1

    monitor-enter p1

    :try_start_0
    const-string p2, "JS Engine is requesting an update"

    invoke-static {p2}, Lcom/google/android/gms/internal/zzkd;->zzcw(Ljava/lang/String;)V

    iget-object p2, p0, Lcom/google/android/gms/internal/zzfs$1$3;->zzbma:Lcom/google/android/gms/internal/zzfs$1;

    iget-object p2, p2, Lcom/google/android/gms/internal/zzfs$1;->zzbly:Lcom/google/android/gms/internal/zzfs;

    invoke-static {p2}, Lcom/google/android/gms/internal/zzfs;->zze(Lcom/google/android/gms/internal/zzfs;)I

    move-result p2

    if-nez p2, :cond_0

    const-string p2, "Starting reload."

    invoke-static {p2}, Lcom/google/android/gms/internal/zzkd;->zzcw(Ljava/lang/String;)V

    iget-object p2, p0, Lcom/google/android/gms/internal/zzfs$1$3;->zzbma:Lcom/google/android/gms/internal/zzfs$1;

    iget-object p2, p2, Lcom/google/android/gms/internal/zzfs$1;->zzbly:Lcom/google/android/gms/internal/zzfs;

    const/4 v0, 0x2

    invoke-static {p2, v0}, Lcom/google/android/gms/internal/zzfs;->zza(Lcom/google/android/gms/internal/zzfs;I)I

    iget-object p2, p0, Lcom/google/android/gms/internal/zzfs$1$3;->zzbma:Lcom/google/android/gms/internal/zzfs$1;

    iget-object p2, p2, Lcom/google/android/gms/internal/zzfs$1;->zzbly:Lcom/google/android/gms/internal/zzfs;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfs$1$3;->zzbma:Lcom/google/android/gms/internal/zzfs$1;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzfs$1;->zzblw:Lcom/google/android/gms/internal/zzas;

    invoke-virtual {p2, v0}, Lcom/google/android/gms/internal/zzfs;->zzb(Lcom/google/android/gms/internal/zzas;)Lcom/google/android/gms/internal/zzfs$zzd;

    :cond_0
    iget-object p2, p0, Lcom/google/android/gms/internal/zzfs$1$3;->zzblz:Lcom/google/android/gms/internal/zzfp;

    const-string v0, "/requestReload"

    iget-object v1, p0, Lcom/google/android/gms/internal/zzfs$1$3;->zzbmd:Lcom/google/android/gms/internal/zzks;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzks;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/zzep;

    invoke-interface {p2, v0, v1}, Lcom/google/android/gms/internal/zzfp;->zzb(Ljava/lang/String;Lcom/google/android/gms/internal/zzep;)V

    monitor-exit p1

    return-void

    :catchall_0
    move-exception p2

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p2
.end method
