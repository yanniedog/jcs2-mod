.class Lcom/google/android/gms/internal/zzeq$zzc;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzin;
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzeq;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "zzc"
.end annotation


# instance fields
.field final synthetic zzbif:Lcom/google/android/gms/internal/zzeq;

.field private final zzbim:Lcom/google/android/gms/internal/zzeq$zzd;

.field private final zzbin:Z

.field private final zzbio:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zzeq;ZLcom/google/android/gms/internal/zzeq$zzd;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzeq$zzc;->zzbif:Lcom/google/android/gms/internal/zzeq;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p2, p0, Lcom/google/android/gms/internal/zzeq$zzc;->zzbin:Z

    iput-object p3, p0, Lcom/google/android/gms/internal/zzeq$zzc;->zzbim:Lcom/google/android/gms/internal/zzeq$zzd;

    iput-object p4, p0, Lcom/google/android/gms/internal/zzeq$zzc;->zzbio:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getReason()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzeq$zzc;->zzbio:Ljava/lang/String;

    return-object v0
.end method

.method public isSuccess()Z
    .locals 1

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzeq$zzc;->zzbin:Z

    return v0
.end method

.method public zzli()Lcom/google/android/gms/internal/zzeq$zzd;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzeq$zzc;->zzbim:Lcom/google/android/gms/internal/zzeq$zzd;

    return-object v0
.end method
