.class Lcom/google/android/gms/internal/zzfs$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzfs;->zza(Lcom/google/android/gms/internal/zzas;)Lcom/google/android/gms/internal/zzfs$zzd;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzblw:Lcom/google/android/gms/internal/zzas;

.field final synthetic zzblx:Lcom/google/android/gms/internal/zzfs$zzd;

.field final synthetic zzbly:Lcom/google/android/gms/internal/zzfs;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzfs;Lcom/google/android/gms/internal/zzas;Lcom/google/android/gms/internal/zzfs$zzd;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzfs$1;->zzbly:Lcom/google/android/gms/internal/zzfs;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzfs$1;->zzblw:Lcom/google/android/gms/internal/zzas;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzfs$1;->zzblx:Lcom/google/android/gms/internal/zzfs$zzd;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfs$1;->zzbly:Lcom/google/android/gms/internal/zzfs;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzfs;->zza(Lcom/google/android/gms/internal/zzfs;)Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/internal/zzfs$1;->zzbly:Lcom/google/android/gms/internal/zzfs;

    invoke-static {v2}, Lcom/google/android/gms/internal/zzfs;->zzb(Lcom/google/android/gms/internal/zzfs;)Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/gms/internal/zzfs$1;->zzblw:Lcom/google/android/gms/internal/zzas;

    invoke-virtual {v0, v1, v2, v3}, Lcom/google/android/gms/internal/zzfs;->zza(Landroid/content/Context;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;Lcom/google/android/gms/internal/zzas;)Lcom/google/android/gms/internal/zzfp;

    move-result-object v0

    new-instance v1, Lcom/google/android/gms/internal/zzfs$1$1;

    invoke-direct {v1, p0, v0}, Lcom/google/android/gms/internal/zzfs$1$1;-><init>(Lcom/google/android/gms/internal/zzfs$1;Lcom/google/android/gms/internal/zzfp;)V

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzfp;->zza(Lcom/google/android/gms/internal/zzfp$zza;)V

    new-instance v1, Lcom/google/android/gms/internal/zzfs$1$2;

    invoke-direct {v1, p0, v0}, Lcom/google/android/gms/internal/zzfs$1$2;-><init>(Lcom/google/android/gms/internal/zzfs$1;Lcom/google/android/gms/internal/zzfp;)V

    const-string v2, "/jsLoaded"

    invoke-interface {v0, v2, v1}, Lcom/google/android/gms/internal/zzfp;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzep;)V

    new-instance v1, Lcom/google/android/gms/internal/zzks;

    invoke-direct {v1}, Lcom/google/android/gms/internal/zzks;-><init>()V

    new-instance v2, Lcom/google/android/gms/internal/zzfs$1$3;

    invoke-direct {v2, p0, v0, v1}, Lcom/google/android/gms/internal/zzfs$1$3;-><init>(Lcom/google/android/gms/internal/zzfs$1;Lcom/google/android/gms/internal/zzfp;Lcom/google/android/gms/internal/zzks;)V

    invoke-virtual {v1, v2}, Lcom/google/android/gms/internal/zzks;->set(Ljava/lang/Object;)V

    const-string v1, "/requestReload"

    invoke-interface {v0, v1, v2}, Lcom/google/android/gms/internal/zzfp;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzep;)V

    iget-object v1, p0, Lcom/google/android/gms/internal/zzfs$1;->zzbly:Lcom/google/android/gms/internal/zzfs;

    invoke-static {v1}, Lcom/google/android/gms/internal/zzfs;->zzf(Lcom/google/android/gms/internal/zzfs;)Ljava/lang/String;

    move-result-object v1

    const-string v2, ".js"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzfs$1;->zzbly:Lcom/google/android/gms/internal/zzfs;

    invoke-static {v1}, Lcom/google/android/gms/internal/zzfs;->zzf(Lcom/google/android/gms/internal/zzfs;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzfp;->zzbg(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzfs$1;->zzbly:Lcom/google/android/gms/internal/zzfs;

    invoke-static {v1}, Lcom/google/android/gms/internal/zzfs;->zzf(Lcom/google/android/gms/internal/zzfs;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "<html>"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/google/android/gms/internal/zzfs$1;->zzbly:Lcom/google/android/gms/internal/zzfs;

    invoke-static {v1}, Lcom/google/android/gms/internal/zzfs;->zzf(Lcom/google/android/gms/internal/zzfs;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzfp;->zzbi(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/google/android/gms/internal/zzfs$1;->zzbly:Lcom/google/android/gms/internal/zzfs;

    invoke-static {v1}, Lcom/google/android/gms/internal/zzfs;->zzf(Lcom/google/android/gms/internal/zzfs;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzfp;->zzbh(Ljava/lang/String;)V

    :goto_0
    sget-object v1, Lcom/google/android/gms/internal/zzkh;->zzclc:Landroid/os/Handler;

    new-instance v2, Lcom/google/android/gms/internal/zzfs$1$4;

    invoke-direct {v2, p0, v0}, Lcom/google/android/gms/internal/zzfs$1$4;-><init>(Lcom/google/android/gms/internal/zzfs$1;Lcom/google/android/gms/internal/zzfp;)V

    sget v0, Lcom/google/android/gms/internal/zzfs$zza;->zzbmg:I

    int-to-long v3, v0

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method
