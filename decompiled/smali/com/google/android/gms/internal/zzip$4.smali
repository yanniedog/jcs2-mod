.class Lcom/google/android/gms/internal/zzip$4;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzkl;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzip;-><init>(Landroid/content/Context;Lcom/google/android/gms/internal/zzcv;Lcom/google/android/gms/internal/zzio;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/gms/internal/zzkl<",
        "Lcom/google/android/gms/internal/zzfp;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic zzcej:Lcom/google/android/gms/internal/zzip;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzip;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzip$4;->zzcej:Lcom/google/android/gms/internal/zzip;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/internal/zzfp;)V
    .locals 2

    sget-object v0, Lcom/google/android/gms/internal/zzeo;->zzbhv:Lcom/google/android/gms/internal/zzep;

    const-string v1, "/log"

    invoke-interface {p1, v1, v0}, Lcom/google/android/gms/internal/zzfp;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzep;)V

    return-void
.end method

.method public synthetic zzd(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lcom/google/android/gms/internal/zzfp;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzip$4;->zza(Lcom/google/android/gms/internal/zzfp;)V

    return-void
.end method
