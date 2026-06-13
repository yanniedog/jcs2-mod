.class public Lcom/google/android/gms/internal/zzjm;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzin;
.end annotation


# instance fields
.field private final zzbog:Lcom/google/android/gms/internal/zzgk;

.field private final zzcib:Lcom/google/android/gms/internal/zzjj;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zzgk;Lcom/google/android/gms/internal/zzji;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzjm;->zzbog:Lcom/google/android/gms/internal/zzgk;

    new-instance p1, Lcom/google/android/gms/internal/zzjj;

    invoke-direct {p1, p2}, Lcom/google/android/gms/internal/zzjj;-><init>(Lcom/google/android/gms/internal/zzji;)V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzjm;->zzcib:Lcom/google/android/gms/internal/zzjj;

    return-void
.end method


# virtual methods
.method public zzru()Lcom/google/android/gms/internal/zzgk;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzjm;->zzbog:Lcom/google/android/gms/internal/zzgk;

    return-object v0
.end method

.method public zzrv()Lcom/google/android/gms/internal/zzjj;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzjm;->zzcib:Lcom/google/android/gms/internal/zzjj;

    return-object v0
.end method
