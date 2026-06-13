.class public Lcom/google/android/gms/internal/zzct;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzin;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/zzct$zza;
    }
.end annotation


# direct methods
.method static zza(IIJJJ)J
    .locals 6

    int-to-long v0, p0

    const-wide/32 v2, 0x7fffffff

    add-long/2addr v0, v2

    const-wide/32 v4, 0x4000ffff

    rem-long/2addr v0, v4

    mul-long p4, p4, v0

    rem-long/2addr p4, v4

    add-long/2addr p2, v4

    sub-long/2addr p2, p4

    rem-long/2addr p2, v4

    mul-long p2, p2, p6

    rem-long/2addr p2, v4

    int-to-long p0, p1

    add-long/2addr p0, v2

    rem-long/2addr p0, v4

    add-long/2addr p2, p0

    rem-long/2addr p2, v4

    return-wide p2
.end method

.method static zza(JI)J
    .locals 5

    if-nez p2, :cond_0

    const-wide/16 p0, 0x1

    return-wide p0

    :cond_0
    const/4 v0, 0x1

    if-ne p2, v0, :cond_1

    return-wide p0

    :cond_1
    rem-int/lit8 v0, p2, 0x2

    const-wide/32 v1, 0x4000ffff

    if-nez v0, :cond_2

    mul-long p0, p0, p0

    rem-long/2addr p0, v1

    div-int/lit8 p2, p2, 0x2

    invoke-static {p0, p1, p2}, Lcom/google/android/gms/internal/zzct;->zza(JI)J

    move-result-wide p0

    :goto_0
    rem-long/2addr p0, v1

    return-wide p0

    :cond_2
    mul-long v3, p0, p0

    rem-long/2addr v3, v1

    div-int/lit8 p2, p2, 0x2

    invoke-static {v3, v4, p2}, Lcom/google/android/gms/internal/zzct;->zza(JI)J

    move-result-wide v3

    rem-long/2addr v3, v1

    mul-long p0, p0, v3

    goto :goto_0
.end method

.method static zza([Ljava/lang/String;II)Ljava/lang/String;
    .locals 2

    array-length v0, p0

    add-int/2addr p2, p1

    if-ge v0, p2, :cond_0

    const-string p0, "Unable to construct shingle"

    invoke-static {p0}, Lcom/google/android/gms/internal/zzkd;->e(Ljava/lang/String;)V

    const-string p0, ""

    return-object p0

    :cond_0
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    :goto_0
    add-int/lit8 v1, p2, -0x1

    if-ge p1, v1, :cond_1

    aget-object v1, p0, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_1
    aget-object p0, p0, v1

    invoke-virtual {v0, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static zza(IJLjava/lang/String;ILjava/util/PriorityQueue;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IJ",
            "Ljava/lang/String;",
            "I",
            "Ljava/util/PriorityQueue<",
            "Lcom/google/android/gms/internal/zzct$zza;",
            ">;)V"
        }
    .end annotation

    new-instance v0, Lcom/google/android/gms/internal/zzct$zza;

    invoke-direct {v0, p1, p2, p3, p4}, Lcom/google/android/gms/internal/zzct$zza;-><init>(JLjava/lang/String;I)V

    invoke-virtual {p5}, Ljava/util/PriorityQueue;->size()I

    move-result p1

    if-ne p1, p0, :cond_1

    invoke-virtual {p5}, Ljava/util/PriorityQueue;->peek()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/internal/zzct$zza;

    iget p1, p1, Lcom/google/android/gms/internal/zzct$zza;->zzatj:I

    iget p2, v0, Lcom/google/android/gms/internal/zzct$zza;->zzatj:I

    if-gt p1, p2, :cond_0

    invoke-virtual {p5}, Ljava/util/PriorityQueue;->peek()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/internal/zzct$zza;

    iget-wide p1, p1, Lcom/google/android/gms/internal/zzct$zza;->value:J

    iget-wide p3, v0, Lcom/google/android/gms/internal/zzct$zza;->value:J

    cmp-long v1, p1, p3

    if-lez v1, :cond_1

    :cond_0
    return-void

    :cond_1
    invoke-virtual {p5, v0}, Ljava/util/PriorityQueue;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    return-void

    :cond_2
    invoke-virtual {p5, v0}, Ljava/util/PriorityQueue;->add(Ljava/lang/Object;)Z

    invoke-virtual {p5}, Ljava/util/PriorityQueue;->size()I

    move-result p1

    if-le p1, p0, :cond_3

    invoke-virtual {p5}, Ljava/util/PriorityQueue;->poll()Ljava/lang/Object;

    :cond_3
    return-void
.end method

.method public static zza([Ljava/lang/String;IILjava/util/PriorityQueue;)V
    .locals 24
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/String;",
            "II",
            "Ljava/util/PriorityQueue<",
            "Lcom/google/android/gms/internal/zzct$zza;",
            ">;)V"
        }
    .end annotation

    move-object/from16 v0, p0

    move/from16 v7, p2

    array-length v1, v0

    const/4 v2, 0x0

    if-ge v1, v7, :cond_0

    array-length v1, v0

    invoke-static {v0, v2, v1}, Lcom/google/android/gms/internal/zzct;->zzb([Ljava/lang/String;II)J

    move-result-wide v4

    array-length v1, v0

    invoke-static {v0, v2, v1}, Lcom/google/android/gms/internal/zzct;->zza([Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v6

    array-length v7, v0

    move/from16 v3, p1

    move-object/from16 v8, p3

    invoke-static/range {v3 .. v8}, Lcom/google/android/gms/internal/zzct;->zza(IJLjava/lang/String;ILjava/util/PriorityQueue;)V

    return-void

    :cond_0
    invoke-static {v0, v2, v7}, Lcom/google/android/gms/internal/zzct;->zzb([Ljava/lang/String;II)J

    move-result-wide v8

    invoke-static {v0, v2, v7}, Lcom/google/android/gms/internal/zzct;->zza([Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v4

    move/from16 v1, p1

    move-wide v2, v8

    move/from16 v5, p2

    move-object/from16 v6, p3

    invoke-static/range {v1 .. v6}, Lcom/google/android/gms/internal/zzct;->zza(IJLjava/lang/String;ILjava/util/PriorityQueue;)V

    const-wide/32 v1, 0x1001fff

    add-int/lit8 v3, v7, -0x1

    invoke-static {v1, v2, v3}, Lcom/google/android/gms/internal/zzct;->zza(JI)J

    move-result-wide v1

    const/4 v3, 0x1

    move-wide v12, v8

    const/4 v4, 0x1

    :goto_0
    array-length v5, v0

    sub-int/2addr v5, v7

    add-int/2addr v5, v3

    if-ge v4, v5, :cond_1

    add-int/lit8 v5, v4, -0x1

    aget-object v5, v0, v5

    invoke-static {v5}, Lcom/google/android/gms/internal/zzcr;->zzac(Ljava/lang/String;)I

    move-result v10

    add-int v5, v4, v7

    sub-int/2addr v5, v3

    aget-object v5, v0, v5

    invoke-static {v5}, Lcom/google/android/gms/internal/zzcr;->zzac(Ljava/lang/String;)I

    move-result v11

    const-wide/32 v16, 0x1001fff

    move-wide v14, v1

    invoke-static/range {v10 .. v17}, Lcom/google/android/gms/internal/zzct;->zza(IIJJJ)J

    move-result-wide v5

    invoke-static {v0, v4, v7}, Lcom/google/android/gms/internal/zzct;->zza([Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v21

    array-length v8, v0

    move/from16 v18, p1

    move-wide/from16 v19, v5

    move/from16 v22, v8

    move-object/from16 v23, p3

    invoke-static/range {v18 .. v23}, Lcom/google/android/gms/internal/zzct;->zza(IJLjava/lang/String;ILjava/util/PriorityQueue;)V

    add-int/lit8 v4, v4, 0x1

    move-wide v12, v5

    goto :goto_0

    :cond_1
    return-void
.end method

.method private static zzb([Ljava/lang/String;II)J
    .locals 9

    aget-object v0, p0, p1

    invoke-static {v0}, Lcom/google/android/gms/internal/zzcr;->zzac(Ljava/lang/String;)I

    move-result v0

    int-to-long v0, v0

    const-wide/32 v2, 0x7fffffff

    add-long/2addr v0, v2

    const-wide/32 v4, 0x4000ffff

    rem-long/2addr v0, v4

    add-int/lit8 v6, p1, 0x1

    :goto_0
    add-int v7, p1, p2

    if-ge v6, v7, :cond_0

    const-wide/32 v7, 0x1001fff

    mul-long v0, v0, v7

    rem-long/2addr v0, v4

    aget-object v7, p0, v6

    invoke-static {v7}, Lcom/google/android/gms/internal/zzcr;->zzac(Ljava/lang/String;)I

    move-result v7

    int-to-long v7, v7

    add-long/2addr v7, v2

    rem-long/2addr v7, v4

    add-long/2addr v0, v7

    rem-long/2addr v0, v4

    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    :cond_0
    return-wide v0
.end method
