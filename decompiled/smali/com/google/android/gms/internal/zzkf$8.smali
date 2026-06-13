.class final Lcom/google/android/gms/internal/zzkf$8;
.super Lcom/google/android/gms/internal/zzkf$zza;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzkf;->zzc(Landroid/content/Context;Lcom/google/android/gms/internal/zzkf$zzb;)Ljava/util/concurrent/Future;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzala:Landroid/content/Context;

.field final synthetic zzcko:Lcom/google/android/gms/internal/zzkf$zzb;


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/google/android/gms/internal/zzkf$zzb;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzkf$8;->zzala:Landroid/content/Context;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzkf$8;->zzcko:Lcom/google/android/gms/internal/zzkf$zzb;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzkf$zza;-><init>(Lcom/google/android/gms/internal/zzkf$1;)V

    return-void
.end method


# virtual methods
.method public zzew()V
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/zzkf$8;->zzala:Landroid/content/Context;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzkf;->zzn(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "content_url_opted_out"

    const/4 v3, 0x1

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    invoke-virtual {v1, v2, v0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzkf$8;->zzcko:Lcom/google/android/gms/internal/zzkf$zzb;

    if-eqz v0, :cond_0

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzkf$zzb;->zzg(Landroid/os/Bundle;)V

    :cond_0
    return-void
.end method
