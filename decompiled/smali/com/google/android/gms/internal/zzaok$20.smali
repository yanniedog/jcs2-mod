.class final Lcom/google/android/gms/internal/zzaok$20;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzani;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzaok;->zza(Lcom/google/android/gms/internal/zzaol;Lcom/google/android/gms/internal/zzanh;)Lcom/google/android/gms/internal/zzani;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic beT:Lcom/google/android/gms/internal/zzaol;

.field final synthetic bgR:Lcom/google/android/gms/internal/zzanh;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzaol;Lcom/google/android/gms/internal/zzanh;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzaok$20;->beT:Lcom/google/android/gms/internal/zzaol;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzaok$20;->bgR:Lcom/google/android/gms/internal/zzanh;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/internal/zzamp;Lcom/google/android/gms/internal/zzaol;)Lcom/google/android/gms/internal/zzanh;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/android/gms/internal/zzamp;",
            "Lcom/google/android/gms/internal/zzaol<",
            "TT;>;)",
            "Lcom/google/android/gms/internal/zzanh<",
            "TT;>;"
        }
    .end annotation

    iget-object p1, p0, Lcom/google/android/gms/internal/zzaok$20;->beT:Lcom/google/android/gms/internal/zzaol;

    invoke-virtual {p2, p1}, Lcom/google/android/gms/internal/zzaol;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/google/android/gms/internal/zzaok$20;->bgR:Lcom/google/android/gms/internal/zzanh;

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return-object p1
.end method
