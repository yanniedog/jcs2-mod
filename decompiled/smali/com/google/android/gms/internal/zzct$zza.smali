.class public Lcom/google/android/gms/internal/zzct$zza;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzct;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "zza"
.end annotation


# instance fields
.field final value:J

.field final zzati:Ljava/lang/String;

.field final zzatj:I


# direct methods
.method constructor <init>(JLjava/lang/String;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lcom/google/android/gms/internal/zzct$zza;->value:J

    iput-object p3, p0, Lcom/google/android/gms/internal/zzct$zza;->zzati:Ljava/lang/String;

    iput p4, p0, Lcom/google/android/gms/internal/zzct$zza;->zzatj:I

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 6

    const/4 v0, 0x0

    if-eqz p1, :cond_1

    instance-of v1, p1, Lcom/google/android/gms/internal/zzct$zza;

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    check-cast p1, Lcom/google/android/gms/internal/zzct$zza;

    iget-wide v1, p1, Lcom/google/android/gms/internal/zzct$zza;->value:J

    iget-wide v3, p0, Lcom/google/android/gms/internal/zzct$zza;->value:J

    cmp-long v5, v1, v3

    if-nez v5, :cond_1

    iget p1, p1, Lcom/google/android/gms/internal/zzct$zza;->zzatj:I

    iget v1, p0, Lcom/google/android/gms/internal/zzct$zza;->zzatj:I

    if-ne p1, v1, :cond_1

    const/4 v0, 0x1

    :cond_1
    :goto_0
    return v0
.end method

.method public hashCode()I
    .locals 2

    iget-wide v0, p0, Lcom/google/android/gms/internal/zzct$zza;->value:J

    long-to-int v1, v0

    return v1
.end method
