.class Lcom/google/android/gms/internal/zzip$2$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzla$zzc;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzip$2;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/gms/internal/zzla$zzc<",
        "Lcom/google/android/gms/internal/zzft;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic zzceh:Lcom/google/android/gms/internal/zzdi;

.field final synthetic zzcei:Lcom/google/android/gms/internal/zzip$2;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzip$2;Lcom/google/android/gms/internal/zzdi;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzip$2$1;->zzcei:Lcom/google/android/gms/internal/zzip$2;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzip$2$1;->zzceh:Lcom/google/android/gms/internal/zzdi;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zzb(Lcom/google/android/gms/internal/zzft;)V
    .locals 5

    iget-object v0, p0, Lcom/google/android/gms/internal/zzip$2$1;->zzcei:Lcom/google/android/gms/internal/zzip$2;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzip$2;->zzakg:Lcom/google/android/gms/internal/zzdk;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzip$2$1;->zzceh:Lcom/google/android/gms/internal/zzdi;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "jsf"

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzdk;->zza(Lcom/google/android/gms/internal/zzdi;[Ljava/lang/String;)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/zzip$2$1;->zzcei:Lcom/google/android/gms/internal/zzip$2;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzip$2;->zzakg:Lcom/google/android/gms/internal/zzdk;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzdk;->zzkh()V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzip$2$1;->zzcei:Lcom/google/android/gms/internal/zzip$2;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzip$2;->zzcee:Lcom/google/android/gms/internal/zzir;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzir;->zzcep:Lcom/google/android/gms/internal/zzep;

    const-string v1, "/invalidRequest"

    invoke-interface {p1, v1, v0}, Lcom/google/android/gms/internal/zzft;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzep;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzip$2$1;->zzcei:Lcom/google/android/gms/internal/zzip$2;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzip$2;->zzcee:Lcom/google/android/gms/internal/zzir;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzir;->zzceq:Lcom/google/android/gms/internal/zzep;

    const-string v1, "/loadAdURL"

    invoke-interface {p1, v1, v0}, Lcom/google/android/gms/internal/zzft;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzep;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzip$2$1;->zzcei:Lcom/google/android/gms/internal/zzip$2;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzip$2;->zzcee:Lcom/google/android/gms/internal/zzir;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzir;->zzcer:Lcom/google/android/gms/internal/zzep;

    const-string v1, "/loadAd"

    invoke-interface {p1, v1, v0}, Lcom/google/android/gms/internal/zzft;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzep;)V

    :try_start_0
    const-string v0, "AFMA_getAd"

    iget-object v1, p0, Lcom/google/android/gms/internal/zzip$2$1;->zzcei:Lcom/google/android/gms/internal/zzip$2;

    iget-object v1, v1, Lcom/google/android/gms/internal/zzip$2;->zzceg:Ljava/lang/String;

    invoke-interface {p1, v0, v1}, Lcom/google/android/gms/internal/zzft;->zzj(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v0, "Error requesting an ad url"

    invoke-static {v0, p1}, Lcom/google/android/gms/internal/zzkd;->zzb(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method public synthetic zzd(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lcom/google/android/gms/internal/zzft;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzip$2$1;->zzb(Lcom/google/android/gms/internal/zzft;)V

    return-void
.end method
