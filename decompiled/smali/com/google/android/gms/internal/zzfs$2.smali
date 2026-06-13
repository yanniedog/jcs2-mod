.class Lcom/google/android/gms/internal/zzfs$2;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzla$zzc;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzfs;->zzb(Lcom/google/android/gms/internal/zzas;)Lcom/google/android/gms/internal/zzfs$zzd;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/gms/internal/zzla$zzc<",
        "Lcom/google/android/gms/internal/zzfp;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic zzbly:Lcom/google/android/gms/internal/zzfs;

.field final synthetic zzbmf:Lcom/google/android/gms/internal/zzfs$zzd;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzfs;Lcom/google/android/gms/internal/zzfs$zzd;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzfs$2;->zzbly:Lcom/google/android/gms/internal/zzfs;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzfs$2;->zzbmf:Lcom/google/android/gms/internal/zzfs$zzd;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/internal/zzfp;)V
    .locals 2

    iget-object p1, p0, Lcom/google/android/gms/internal/zzfs$2;->zzbly:Lcom/google/android/gms/internal/zzfs;

    invoke-static {p1}, Lcom/google/android/gms/internal/zzfs;->zzc(Lcom/google/android/gms/internal/zzfs;)Ljava/lang/Object;

    move-result-object p1

    monitor-enter p1

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzfs$2;->zzbly:Lcom/google/android/gms/internal/zzfs;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/zzfs;->zza(Lcom/google/android/gms/internal/zzfs;I)I

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfs$2;->zzbly:Lcom/google/android/gms/internal/zzfs;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzfs;->zzg(Lcom/google/android/gms/internal/zzfs;)Lcom/google/android/gms/internal/zzfs$zzd;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfs$2;->zzbmf:Lcom/google/android/gms/internal/zzfs$zzd;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzfs$2;->zzbly:Lcom/google/android/gms/internal/zzfs;

    invoke-static {v1}, Lcom/google/android/gms/internal/zzfs;->zzg(Lcom/google/android/gms/internal/zzfs;)Lcom/google/android/gms/internal/zzfs$zzd;

    move-result-object v1

    if-eq v0, v1, :cond_0

    const-string v0, "New JS engine is loaded, marking previous one as destroyable."

    invoke-static {v0}, Lcom/google/android/gms/internal/zzkd;->v(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfs$2;->zzbly:Lcom/google/android/gms/internal/zzfs;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzfs;->zzg(Lcom/google/android/gms/internal/zzfs;)Lcom/google/android/gms/internal/zzfs$zzd;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzfs$zzd;->zzmd()V

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzfs$2;->zzbly:Lcom/google/android/gms/internal/zzfs;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzfs$2;->zzbmf:Lcom/google/android/gms/internal/zzfs$zzd;

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/zzfs;->zza(Lcom/google/android/gms/internal/zzfs;Lcom/google/android/gms/internal/zzfs$zzd;)Lcom/google/android/gms/internal/zzfs$zzd;

    monitor-exit p1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public synthetic zzd(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lcom/google/android/gms/internal/zzfp;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzfs$2;->zza(Lcom/google/android/gms/internal/zzfp;)V

    return-void
.end method
