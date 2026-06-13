.class Lcom/google/android/gms/internal/zzfb$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzfb;->zzew()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzbjd:Lcom/google/android/gms/internal/zzfb;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzfb;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzfb$1;->zzbjd:Lcom/google/android/gms/internal/zzfb;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzgj()Lcom/google/android/gms/internal/zzfc;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzfb$1;->zzbjd:Lcom/google/android/gms/internal/zzfb;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzfc;->zzb(Lcom/google/android/gms/internal/zzfb;)V

    return-void
.end method
