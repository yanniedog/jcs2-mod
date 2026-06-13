.class public Lcom/google/android/gms/internal/zzph;
.super Ljava/lang/Object;


# direct methods
.method public static zzd(JJ)J
    .locals 6

    const-wide/16 v0, 0x0

    cmp-long v2, p0, v0

    if-ltz v2, :cond_0

    rem-long/2addr p0, p2

    return-wide p0

    :cond_0
    const-wide v0, 0x7fffffffffffffffL

    rem-long v2, v0, p2

    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    and-long/2addr p0, v0

    rem-long/2addr p0, p2

    add-long/2addr v2, p0

    rem-long/2addr v2, p2

    return-wide v2
.end method
