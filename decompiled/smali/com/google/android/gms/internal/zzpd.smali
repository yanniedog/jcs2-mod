.class public Lcom/google/android/gms/internal/zzpd;
.super Ljava/lang/Object;


# direct methods
.method private static zza([BII)J
    .locals 7

    const/16 v0, 0x8

    invoke-static {p2, v0}, Ljava/lang/Math;->min(II)I

    move-result p2

    const-wide/16 v0, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, p2, :cond_0

    add-int v3, p1, v2

    aget-byte v3, p0, v3

    int-to-long v3, v3

    const-wide/16 v5, 0xff

    and-long/2addr v3, v5

    mul-int/lit8 v5, v2, 0x8

    shl-long/2addr v3, v5

    or-long/2addr v0, v3

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-wide v0
.end method

.method private static zza([BJ)J
    .locals 8

    array-length v0, p0

    and-int/lit8 v0, v0, -0x8

    array-length v1, p0

    and-int/lit8 v1, v1, 0x7

    array-length v2, p0

    int-to-long v2, v2

    const-wide v4, -0x395b586ca42e166bL    # -2.0946245025644615E32

    mul-long v2, v2, v4

    xor-long/2addr p1, v2

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_0

    invoke-static {p0, v2}, Lcom/google/android/gms/internal/zzpd;->zzb([BI)J

    move-result-wide v6

    mul-long v6, v6, v4

    invoke-static {v6, v7}, Lcom/google/android/gms/internal/zzpd;->zzaf(J)J

    move-result-wide v6

    mul-long v6, v6, v4

    xor-long/2addr p1, v6

    mul-long p1, p1, v4

    add-int/lit8 v2, v2, 0x8

    goto :goto_0

    :cond_0
    if-eqz v1, :cond_1

    invoke-static {p0, v0, v1}, Lcom/google/android/gms/internal/zzpd;->zza([BII)J

    move-result-wide v0

    xor-long/2addr p1, v0

    mul-long p1, p1, v4

    :cond_1
    invoke-static {p1, p2}, Lcom/google/android/gms/internal/zzpd;->zzaf(J)J

    move-result-wide p0

    mul-long p0, p0, v4

    invoke-static {p0, p1}, Lcom/google/android/gms/internal/zzpd;->zzaf(J)J

    move-result-wide p0

    return-wide p0
.end method

.method private static zza([BIJJ[J)V
    .locals 6

    invoke-static {p0, p1}, Lcom/google/android/gms/internal/zzpd;->zzb([BI)J

    move-result-wide v0

    add-int/lit8 v2, p1, 0x8

    invoke-static {p0, v2}, Lcom/google/android/gms/internal/zzpd;->zzb([BI)J

    move-result-wide v2

    add-int/lit8 v4, p1, 0x10

    invoke-static {p0, v4}, Lcom/google/android/gms/internal/zzpd;->zzb([BI)J

    move-result-wide v4

    add-int/lit8 p1, p1, 0x18

    invoke-static {p0, p1}, Lcom/google/android/gms/internal/zzpd;->zzb([BI)J

    move-result-wide p0

    add-long/2addr p2, v0

    add-long/2addr p4, p2

    add-long/2addr p4, p0

    const/16 v0, 0x33

    invoke-static {p4, p5, v0}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide p4

    add-long/2addr v2, p2

    add-long/2addr v2, v4

    const/16 v0, 0x17

    invoke-static {v2, v3, v0}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide v0

    add-long/2addr p4, v0

    add-long/2addr v2, p0

    const/4 p0, 0x0

    aput-wide v2, p6, p0

    add-long/2addr p4, p2

    const/4 p0, 0x1

    aput-wide p4, p6, p0

    return-void
.end method

.method private static zzaf(J)J
    .locals 2

    const/16 v0, 0x2f

    ushr-long v0, p0, v0

    xor-long/2addr p0, v0

    return-wide p0
.end method

.method private static zzb([BI)J
    .locals 1

    const/16 v0, 0x8

    invoke-static {p0, p1, v0}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object p0

    sget-object p1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {p0, p1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide p0

    return-wide p0
.end method

.method private static zzc(JJ)J
    .locals 5

    xor-long/2addr p2, p0

    const-wide v0, -0x395b586ca42e166bL    # -2.0946245025644615E32

    mul-long p2, p2, v0

    const/16 v2, 0x2f

    ushr-long v3, p2, v2

    xor-long/2addr p2, v3

    xor-long/2addr p0, p2

    mul-long p0, p0, v0

    ushr-long p2, p0, v2

    xor-long/2addr p0, p2

    mul-long p0, p0, v0

    return-wide p0
.end method

.method public static zzm([B)J
    .locals 9

    array-length v0, p0

    const/16 v1, 0x20

    if-gt v0, v1, :cond_0

    const-wide v0, -0x1364611973070723L    # -1.4877559216887398E215

    invoke-static {p0, v0, v1}, Lcom/google/android/gms/internal/zzpd;->zza([BJ)J

    move-result-wide v0

    goto :goto_0

    :cond_0
    array-length v0, p0

    const/16 v1, 0x40

    if-gt v0, v1, :cond_1

    invoke-static {p0}, Lcom/google/android/gms/internal/zzpd;->zzn([B)J

    move-result-wide v0

    goto :goto_0

    :cond_1
    invoke-static {p0}, Lcom/google/android/gms/internal/zzpd;->zzo([B)J

    move-result-wide v0

    :goto_0
    array-length v2, p0

    const-wide v3, -0x5a47a3a1e67127b7L    # -5.623071142144676E-127

    const/16 v5, 0x8

    if-lt v2, v5, :cond_2

    const/4 v2, 0x0

    invoke-static {p0, v2}, Lcom/google/android/gms/internal/zzpd;->zzb([BI)J

    move-result-wide v6

    goto :goto_1

    :cond_2
    move-wide v6, v3

    :goto_1
    array-length v2, p0

    const/16 v8, 0x9

    if-lt v2, v8, :cond_3

    array-length v2, p0

    sub-int/2addr v2, v5

    invoke-static {p0, v2}, Lcom/google/android/gms/internal/zzpd;->zzb([BI)J

    move-result-wide v3

    :cond_3
    add-long/2addr v0, v3

    invoke-static {v0, v1, v6, v7}, Lcom/google/android/gms/internal/zzpd;->zzc(JJ)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long p0, v0, v2

    if-eqz p0, :cond_4

    const-wide/16 v2, 0x1

    cmp-long p0, v0, v2

    if-nez p0, :cond_5

    :cond_4
    const-wide/16 v2, -0x2

    add-long/2addr v0, v2

    :cond_5
    return-wide v0
.end method

.method private static zzn([B)J
    .locals 18

    move-object/from16 v0, p0

    array-length v1, v0

    const/16 v2, 0x18

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/zzpd;->zzb([BI)J

    move-result-wide v3

    const/4 v5, 0x0

    invoke-static {v0, v5}, Lcom/google/android/gms/internal/zzpd;->zzb([BI)J

    move-result-wide v5

    int-to-long v7, v1

    add-int/lit8 v9, v1, -0x10

    invoke-static {v0, v9}, Lcom/google/android/gms/internal/zzpd;->zzb([BI)J

    move-result-wide v10

    add-long/2addr v7, v10

    const-wide v10, -0x5a47a3a1e67127b7L    # -5.623071142144676E-127

    mul-long v7, v7, v10

    add-long/2addr v5, v7

    add-long v7, v5, v3

    const/16 v12, 0x34

    invoke-static {v7, v8, v12}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide v7

    const/16 v13, 0x25

    invoke-static {v5, v6, v13}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide v14

    const/16 v10, 0x8

    invoke-static {v0, v10}, Lcom/google/android/gms/internal/zzpd;->zzb([BI)J

    move-result-wide v10

    add-long/2addr v5, v10

    const/4 v10, 0x7

    invoke-static {v5, v6, v10}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide v16

    add-long v14, v14, v16

    const/16 v11, 0x10

    invoke-static {v0, v11}, Lcom/google/android/gms/internal/zzpd;->zzb([BI)J

    move-result-wide v16

    add-long v5, v5, v16

    add-long/2addr v3, v5

    const/16 v10, 0x1f

    invoke-static {v5, v6, v10}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide v5

    add-long/2addr v7, v5

    add-long/2addr v7, v14

    invoke-static {v0, v11}, Lcom/google/android/gms/internal/zzpd;->zzb([BI)J

    move-result-wide v5

    add-int/lit8 v11, v1, -0x20

    invoke-static {v0, v11}, Lcom/google/android/gms/internal/zzpd;->zzb([BI)J

    move-result-wide v14

    add-long/2addr v5, v14

    add-int/lit8 v11, v1, -0x8

    invoke-static {v0, v11}, Lcom/google/android/gms/internal/zzpd;->zzb([BI)J

    move-result-wide v14

    add-long v10, v5, v14

    invoke-static {v10, v11, v12}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide v10

    invoke-static {v5, v6, v13}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide v12

    sub-int/2addr v1, v2

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/zzpd;->zzb([BI)J

    move-result-wide v1

    add-long/2addr v5, v1

    const/4 v1, 0x7

    invoke-static {v5, v6, v1}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide v1

    add-long/2addr v12, v1

    invoke-static {v0, v9}, Lcom/google/android/gms/internal/zzpd;->zzb([BI)J

    move-result-wide v0

    add-long/2addr v5, v0

    add-long/2addr v14, v5

    const/16 v0, 0x1f

    invoke-static {v5, v6, v0}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide v0

    add-long/2addr v10, v0

    add-long/2addr v10, v12

    add-long/2addr v3, v10

    const-wide v0, -0x3b849161c568f12dL    # -8.096527404817815E21

    mul-long v3, v3, v0

    add-long/2addr v14, v7

    const-wide v5, -0x5a47a3a1e67127b7L    # -5.623071142144676E-127

    mul-long v14, v14, v5

    add-long/2addr v3, v14

    invoke-static {v3, v4}, Lcom/google/android/gms/internal/zzpd;->zzaf(J)J

    move-result-wide v2

    mul-long v2, v2, v5

    add-long/2addr v2, v7

    invoke-static {v2, v3}, Lcom/google/android/gms/internal/zzpd;->zzaf(J)J

    move-result-wide v2

    mul-long v2, v2, v0

    return-wide v2
.end method

.method private static zzo([B)J
    .locals 24

    move-object/from16 v7, p0

    array-length v8, v7

    const/4 v9, 0x0

    invoke-static {v7, v9}, Lcom/google/android/gms/internal/zzpd;->zzb([BI)J

    move-result-wide v10

    add-int/lit8 v0, v8, -0x10

    invoke-static {v7, v0}, Lcom/google/android/gms/internal/zzpd;->zzb([BI)J

    move-result-wide v0

    const-wide v12, -0x72a753d9501ed1b9L

    xor-long v14, v0, v12

    add-int/lit8 v0, v8, -0x38

    invoke-static {v7, v0}, Lcom/google/android/gms/internal/zzpd;->zzb([BI)J

    move-result-wide v0

    const-wide v2, -0x5a47a3a1e67127b7L    # -5.623071142144676E-127

    xor-long v16, v0, v2

    const/4 v0, 0x2

    new-array v6, v0, [J

    new-array v4, v0, [J

    add-int/lit8 v1, v8, -0x40

    int-to-long v2, v8

    move-object/from16 v0, p0

    move-wide/from16 v18, v2

    move-object/from16 v20, v4

    move-wide v4, v14

    move-object/from16 v21, v6

    invoke-static/range {v0 .. v6}, Lcom/google/android/gms/internal/zzpd;->zza([BIJJ[J)V

    add-int/lit8 v1, v8, -0x20

    mul-long v2, v18, v12

    const-wide v4, -0x5a47a3a1e67127b7L    # -5.623071142144676E-127

    move-object/from16 v6, v20

    invoke-static/range {v0 .. v6}, Lcom/google/android/gms/internal/zzpd;->zza([BIJJ[J)V

    const/16 v18, 0x1

    aget-wide v0, v21, v18

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/zzpd;->zzaf(J)J

    move-result-wide v0

    mul-long v0, v0, v12

    add-long v16, v16, v0

    add-long v10, v16, v10

    const/16 v0, 0x27

    invoke-static {v10, v11, v0}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide v0

    mul-long v0, v0, v12

    const/16 v10, 0x21

    invoke-static {v14, v15, v10}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide v2

    mul-long v2, v2, v12

    add-int/lit8 v8, v8, -0x1

    and-int/lit8 v4, v8, -0x40

    move v11, v4

    const/4 v8, 0x0

    :goto_0
    add-long/2addr v0, v2

    aget-wide v4, v21, v9

    add-long/2addr v0, v4

    add-int/lit8 v4, v8, 0x10

    invoke-static {v7, v4}, Lcom/google/android/gms/internal/zzpd;->zzb([BI)J

    move-result-wide v4

    add-long/2addr v0, v4

    const/16 v4, 0x25

    invoke-static {v0, v1, v4}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide v0

    mul-long v0, v0, v12

    aget-wide v4, v21, v18

    add-long/2addr v2, v4

    add-int/lit8 v4, v8, 0x30

    invoke-static {v7, v4}, Lcom/google/android/gms/internal/zzpd;->zzb([BI)J

    move-result-wide v4

    add-long/2addr v2, v4

    const/16 v4, 0x2a

    invoke-static {v2, v3, v4}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide v2

    mul-long v2, v2, v12

    aget-wide v4, v20, v18

    xor-long v14, v0, v4

    aget-wide v0, v21, v9

    xor-long v22, v2, v0

    aget-wide v0, v20, v9

    xor-long v0, v16, v0

    invoke-static {v0, v1, v10}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide v16

    aget-wide v0, v21, v18

    mul-long v2, v0, v12

    aget-wide v0, v20, v9

    add-long v4, v14, v0

    move-object/from16 v0, p0

    move v1, v8

    move-object/from16 v6, v21

    invoke-static/range {v0 .. v6}, Lcom/google/android/gms/internal/zzpd;->zza([BIJJ[J)V

    add-int/lit8 v1, v8, 0x20

    aget-wide v2, v20, v18

    add-long v2, v16, v2

    move-wide/from16 v4, v22

    move-object/from16 v6, v20

    invoke-static/range {v0 .. v6}, Lcom/google/android/gms/internal/zzpd;->zza([BIJJ[J)V

    add-int/lit8 v8, v8, 0x40

    add-int/lit8 v11, v11, -0x40

    if-nez v11, :cond_0

    aget-wide v0, v21, v9

    aget-wide v2, v20, v9

    invoke-static {v0, v1, v2, v3}, Lcom/google/android/gms/internal/zzpd;->zzc(JJ)J

    move-result-wide v0

    invoke-static/range {v22 .. v23}, Lcom/google/android/gms/internal/zzpd;->zzaf(J)J

    move-result-wide v2

    mul-long v2, v2, v12

    add-long/2addr v0, v2

    add-long/2addr v0, v14

    aget-wide v2, v21, v18

    aget-wide v4, v20, v18

    invoke-static {v2, v3, v4, v5}, Lcom/google/android/gms/internal/zzpd;->zzc(JJ)J

    move-result-wide v2

    add-long v2, v2, v16

    invoke-static {v0, v1, v2, v3}, Lcom/google/android/gms/internal/zzpd;->zzc(JJ)J

    move-result-wide v0

    return-wide v0

    :cond_0
    move-wide/from16 v0, v16

    move-wide/from16 v2, v22

    move-wide/from16 v16, v14

    goto :goto_0
.end method
