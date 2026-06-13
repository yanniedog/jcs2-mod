.class public final Lcom/google/android/gms/internal/zzapy;
.super Ljava/lang/Object;


# static fields
.field public static final bjH:[I

.field public static final bjI:[J

.field public static final bjJ:[F

.field public static final bjK:[D

.field public static final bjL:[Z

.field public static final bjM:[Ljava/lang/String;

.field public static final bjN:[[B

.field public static final bjO:[B


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/4 v0, 0x0

    new-array v1, v0, [I

    sput-object v1, Lcom/google/android/gms/internal/zzapy;->bjH:[I

    new-array v1, v0, [J

    sput-object v1, Lcom/google/android/gms/internal/zzapy;->bjI:[J

    new-array v1, v0, [F

    sput-object v1, Lcom/google/android/gms/internal/zzapy;->bjJ:[F

    new-array v1, v0, [D

    sput-object v1, Lcom/google/android/gms/internal/zzapy;->bjK:[D

    new-array v1, v0, [Z

    sput-object v1, Lcom/google/android/gms/internal/zzapy;->bjL:[Z

    new-array v1, v0, [Ljava/lang/String;

    sput-object v1, Lcom/google/android/gms/internal/zzapy;->bjM:[Ljava/lang/String;

    new-array v1, v0, [[B

    sput-object v1, Lcom/google/android/gms/internal/zzapy;->bjN:[[B

    new-array v0, v0, [B

    sput-object v0, Lcom/google/android/gms/internal/zzapy;->bjO:[B

    return-void
.end method

.method static zzagi(I)I
    .locals 0

    and-int/lit8 p0, p0, 0x7

    return p0
.end method

.method public static zzagj(I)I
    .locals 0

    ushr-int/lit8 p0, p0, 0x3

    return p0
.end method

.method public static zzaj(II)I
    .locals 0

    shl-int/lit8 p0, p0, 0x3

    or-int/2addr p0, p1

    return p0
.end method

.method public static zzb(Lcom/google/android/gms/internal/zzapn;I)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzapn;->zzafp(I)Z

    move-result p0

    return p0
.end method

.method public static final zzc(Lcom/google/android/gms/internal/zzapn;I)I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzapn;->getPosition()I

    move-result v0

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzapn;->zzafp(I)Z

    const/4 v1, 0x1

    :goto_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzapn;->ah()I

    move-result v2

    if-ne v2, p1, :cond_0

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzapn;->zzafp(I)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzapn;->zzaft(I)V

    return v1
.end method
