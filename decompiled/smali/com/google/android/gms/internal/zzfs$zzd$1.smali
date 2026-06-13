.class Lcom/google/android/gms/internal/zzfs$zzd$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzla$zzc;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzfs$zzd;->zzmb()Lcom/google/android/gms/internal/zzfs$zzc;
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
.field final synthetic zzbmn:Lcom/google/android/gms/internal/zzfs$zzc;

.field final synthetic zzbmo:Lcom/google/android/gms/internal/zzfs$zzd;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzfs$zzd;Lcom/google/android/gms/internal/zzfs$zzc;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzfs$zzd$1;->zzbmo:Lcom/google/android/gms/internal/zzfs$zzd;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzfs$zzd$1;->zzbmn:Lcom/google/android/gms/internal/zzfs$zzc;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/internal/zzfp;)V
    .locals 1

    const-string v0, "Getting a new session for JS Engine."

    invoke-static {v0}, Lcom/google/android/gms/internal/zzkd;->v(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfs$zzd$1;->zzbmn:Lcom/google/android/gms/internal/zzfs$zzc;

    invoke-interface {p1}, Lcom/google/android/gms/internal/zzfp;->zzly()Lcom/google/android/gms/internal/zzfu;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzfs$zzc;->zzg(Ljava/lang/Object;)V

    return-void
.end method

.method public synthetic zzd(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lcom/google/android/gms/internal/zzfp;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzfs$zzd$1;->zza(Lcom/google/android/gms/internal/zzfp;)V

    return-void
.end method
