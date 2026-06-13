.class public Lcom/google/android/gms/internal/zzcs;
.super Lcom/google/android/gms/internal/zzcp;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzin;
.end annotation


# instance fields
.field private zzath:Ljava/security/MessageDigest;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzcp;-><init>()V

    return-void
.end method


# virtual methods
.method zza([Ljava/lang/String;)[B
    .locals 7

    array-length v0, p1

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_0

    aget-object p1, p1, v1

    invoke-static {p1}, Lcom/google/android/gms/internal/zzcr;->zzac(Ljava/lang/String;)I

    move-result p1

    invoke-static {p1}, Lcom/google/android/gms/internal/zzcr;->zzn(I)[B

    move-result-object p1

    return-object p1

    :cond_0
    array-length v0, p1

    const/4 v3, 0x5

    if-ge v0, v3, :cond_2

    array-length v0, p1

    mul-int/lit8 v0, v0, 0x2

    new-array v0, v0, [B

    const/4 v3, 0x0

    :goto_0
    array-length v4, p1

    if-ge v3, v4, :cond_1

    aget-object v4, p1, v3

    invoke-static {v4}, Lcom/google/android/gms/internal/zzcr;->zzac(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {p0, v4}, Lcom/google/android/gms/internal/zzcs;->zzq(I)[B

    move-result-object v4

    mul-int/lit8 v5, v3, 0x2

    aget-byte v6, v4, v1

    aput-byte v6, v0, v5

    add-int/2addr v5, v2

    aget-byte v4, v4, v2

    aput-byte v4, v0, v5

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    return-object v0

    :cond_2
    array-length v0, p1

    new-array v0, v0, [B

    :goto_1
    array-length v2, p1

    if-ge v1, v2, :cond_3

    aget-object v2, p1, v1

    invoke-static {v2}, Lcom/google/android/gms/internal/zzcr;->zzac(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {p0, v2}, Lcom/google/android/gms/internal/zzcs;->zzp(I)B

    move-result v2

    aput-byte v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_3
    return-object v0
.end method

.method public zzaa(Ljava/lang/String;)[B
    .locals 4

    const-string v0, " "

    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzcs;->zza([Ljava/lang/String;)[B

    move-result-object p1

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzcs;->zzie()Ljava/security/MessageDigest;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzcs;->zzath:Ljava/security/MessageDigest;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzcs;->zzail:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzcs;->zzath:Ljava/security/MessageDigest;

    const/4 v2, 0x0

    if-nez v1, :cond_0

    new-array p1, v2, [B

    monitor-exit v0

    return-object p1

    :cond_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzcs;->zzath:Ljava/security/MessageDigest;

    invoke-virtual {v1}, Ljava/security/MessageDigest;->reset()V

    iget-object v1, p0, Lcom/google/android/gms/internal/zzcs;->zzath:Ljava/security/MessageDigest;

    invoke-virtual {v1, p1}, Ljava/security/MessageDigest;->update([B)V

    iget-object p1, p0, Lcom/google/android/gms/internal/zzcs;->zzath:Ljava/security/MessageDigest;

    invoke-virtual {p1}, Ljava/security/MessageDigest;->digest()[B

    move-result-object p1

    array-length v1, p1

    const/4 v3, 0x4

    if-le v1, v3, :cond_1

    goto :goto_0

    :cond_1
    array-length v3, p1

    :goto_0
    new-array v1, v3, [B

    array-length v3, v1

    invoke-static {p1, v2, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method zzp(I)B
    .locals 2

    and-int/lit16 v0, p1, 0xff

    const v1, 0xff00

    and-int/2addr v1, p1

    shr-int/lit8 v1, v1, 0x8

    xor-int/2addr v0, v1

    const/high16 v1, 0xff0000

    and-int/2addr v1, p1

    shr-int/lit8 v1, v1, 0x10

    xor-int/2addr v0, v1

    const/high16 v1, -0x1000000

    and-int/2addr p1, v1

    shr-int/lit8 p1, p1, 0x18

    xor-int/2addr p1, v0

    int-to-byte p1, p1

    return p1
.end method

.method zzq(I)[B
    .locals 3

    const v0, 0xffff

    and-int/2addr v0, p1

    const/high16 v1, -0x10000

    and-int/2addr p1, v1

    shr-int/lit8 p1, p1, 0x10

    xor-int/2addr p1, v0

    const/4 v0, 0x2

    new-array v0, v0, [B

    int-to-byte v1, p1

    const/4 v2, 0x0

    aput-byte v1, v0, v2

    shr-int/lit8 p1, p1, 0x8

    int-to-byte p1, p1

    const/4 v1, 0x1

    aput-byte p1, v0, v1

    return-object v0
.end method
