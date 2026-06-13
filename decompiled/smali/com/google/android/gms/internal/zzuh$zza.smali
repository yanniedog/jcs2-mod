.class public final Lcom/google/android/gms/internal/zzuh$zza;
.super Lcom/google/android/gms/internal/zzapv;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzuh;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "zza"
.end annotation


# static fields
.field private static volatile ani:[Lcom/google/android/gms/internal/zzuh$zza;


# instance fields
.field public amz:Ljava/lang/Integer;

.field public anj:Lcom/google/android/gms/internal/zzuh$zzf;

.field public ank:Lcom/google/android/gms/internal/zzuh$zzf;

.field public anl:Ljava/lang/Boolean;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzapv;-><init>()V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzuh$zza;->zzbvt()Lcom/google/android/gms/internal/zzuh$zza;

    return-void
.end method

.method public static zzbvs()[Lcom/google/android/gms/internal/zzuh$zza;
    .locals 2

    sget-object v0, Lcom/google/android/gms/internal/zzuh$zza;->ani:[Lcom/google/android/gms/internal/zzuh$zza;

    if-nez v0, :cond_1

    sget-object v0, Lcom/google/android/gms/internal/zzapt;->bjF:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/google/android/gms/internal/zzuh$zza;->ani:[Lcom/google/android/gms/internal/zzuh$zza;

    if-nez v1, :cond_0

    const/4 v1, 0x0

    new-array v1, v1, [Lcom/google/android/gms/internal/zzuh$zza;

    sput-object v1, Lcom/google/android/gms/internal/zzuh$zza;->ani:[Lcom/google/android/gms/internal/zzuh$zza;

    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    :cond_1
    :goto_0
    sget-object v0, Lcom/google/android/gms/internal/zzuh$zza;->ani:[Lcom/google/android/gms/internal/zzuh$zza;

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/google/android/gms/internal/zzuh$zza;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lcom/google/android/gms/internal/zzuh$zza;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzuh$zza;->amz:Ljava/lang/Integer;

    if-nez v1, :cond_2

    iget-object v1, p1, Lcom/google/android/gms/internal/zzuh$zza;->amz:Ljava/lang/Integer;

    if-eqz v1, :cond_3

    return v2

    :cond_2
    iget-object v3, p1, Lcom/google/android/gms/internal/zzuh$zza;->amz:Ljava/lang/Integer;

    invoke-virtual {v1, v3}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    return v2

    :cond_3
    iget-object v1, p0, Lcom/google/android/gms/internal/zzuh$zza;->anj:Lcom/google/android/gms/internal/zzuh$zzf;

    if-nez v1, :cond_4

    iget-object v1, p1, Lcom/google/android/gms/internal/zzuh$zza;->anj:Lcom/google/android/gms/internal/zzuh$zzf;

    if-eqz v1, :cond_5

    return v2

    :cond_4
    iget-object v3, p1, Lcom/google/android/gms/internal/zzuh$zza;->anj:Lcom/google/android/gms/internal/zzuh$zzf;

    invoke-virtual {v1, v3}, Lcom/google/android/gms/internal/zzuh$zzf;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    return v2

    :cond_5
    iget-object v1, p0, Lcom/google/android/gms/internal/zzuh$zza;->ank:Lcom/google/android/gms/internal/zzuh$zzf;

    if-nez v1, :cond_6

    iget-object v1, p1, Lcom/google/android/gms/internal/zzuh$zza;->ank:Lcom/google/android/gms/internal/zzuh$zzf;

    if-eqz v1, :cond_7

    return v2

    :cond_6
    iget-object v3, p1, Lcom/google/android/gms/internal/zzuh$zza;->ank:Lcom/google/android/gms/internal/zzuh$zzf;

    invoke-virtual {v1, v3}, Lcom/google/android/gms/internal/zzuh$zzf;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_7

    return v2

    :cond_7
    iget-object v1, p0, Lcom/google/android/gms/internal/zzuh$zza;->anl:Ljava/lang/Boolean;

    iget-object p1, p1, Lcom/google/android/gms/internal/zzuh$zza;->anl:Ljava/lang/Boolean;

    if-nez v1, :cond_8

    if-eqz p1, :cond_9

    return v2

    :cond_8
    invoke-virtual {v1, p1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_9

    return v2

    :cond_9
    return v0
.end method

.method public hashCode()I
    .locals 3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    add-int/lit16 v0, v0, 0x20f

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/google/android/gms/internal/zzuh$zza;->amz:Ljava/lang/Integer;

    const/4 v2, 0x0

    if-nez v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v1}, Ljava/lang/Integer;->hashCode()I

    move-result v1

    :goto_0
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/google/android/gms/internal/zzuh$zza;->anj:Lcom/google/android/gms/internal/zzuh$zzf;

    if-nez v1, :cond_1

    const/4 v1, 0x0

    goto :goto_1

    :cond_1
    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzuh$zzf;->hashCode()I

    move-result v1

    :goto_1
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/google/android/gms/internal/zzuh$zza;->ank:Lcom/google/android/gms/internal/zzuh$zzf;

    if-nez v1, :cond_2

    const/4 v1, 0x0

    goto :goto_2

    :cond_2
    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzuh$zzf;->hashCode()I

    move-result v1

    :goto_2
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/google/android/gms/internal/zzuh$zza;->anl:Ljava/lang/Boolean;

    if-nez v1, :cond_3

    goto :goto_3

    :cond_3
    invoke-virtual {v1}, Ljava/lang/Boolean;->hashCode()I

    move-result v2

    :goto_3
    add-int/2addr v0, v2

    return v0
.end method

.method public zza(Lcom/google/android/gms/internal/zzapo;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzuh$zza;->amz:Ljava/lang/Integer;

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1, v1, v0}, Lcom/google/android/gms/internal/zzapo;->zzae(II)V

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzuh$zza;->anj:Lcom/google/android/gms/internal/zzuh$zzf;

    if-eqz v0, :cond_1

    const/4 v1, 0x2

    invoke-virtual {p1, v1, v0}, Lcom/google/android/gms/internal/zzapo;->zza(ILcom/google/android/gms/internal/zzapv;)V

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzuh$zza;->ank:Lcom/google/android/gms/internal/zzuh$zzf;

    if-eqz v0, :cond_2

    const/4 v1, 0x3

    invoke-virtual {p1, v1, v0}, Lcom/google/android/gms/internal/zzapo;->zza(ILcom/google/android/gms/internal/zzapv;)V

    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/internal/zzuh$zza;->anl:Ljava/lang/Boolean;

    if-eqz v0, :cond_3

    const/4 v1, 0x4

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    invoke-virtual {p1, v1, v0}, Lcom/google/android/gms/internal/zzapo;->zzj(IZ)V

    :cond_3
    invoke-super {p0, p1}, Lcom/google/android/gms/internal/zzapv;->zza(Lcom/google/android/gms/internal/zzapo;)V

    return-void
.end method

.method public zzal(Lcom/google/android/gms/internal/zzapn;)Lcom/google/android/gms/internal/zzuh$zza;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    :cond_0
    :goto_0
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzapn;->ah()I

    move-result v0

    if-eqz v0, :cond_7

    const/16 v1, 0x8

    if-eq v0, v1, :cond_6

    const/16 v1, 0x12

    if-eq v0, v1, :cond_4

    const/16 v1, 0x1a

    if-eq v0, v1, :cond_2

    const/16 v1, 0x20

    if-eq v0, v1, :cond_1

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/zzapy;->zzb(Lcom/google/android/gms/internal/zzapn;I)Z

    move-result v0

    if-nez v0, :cond_0

    return-object p0

    :cond_1
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzapn;->an()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzuh$zza;->anl:Ljava/lang/Boolean;

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/internal/zzuh$zza;->ank:Lcom/google/android/gms/internal/zzuh$zzf;

    if-nez v0, :cond_3

    new-instance v0, Lcom/google/android/gms/internal/zzuh$zzf;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzuh$zzf;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzuh$zza;->ank:Lcom/google/android/gms/internal/zzuh$zzf;

    :cond_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzuh$zza;->ank:Lcom/google/android/gms/internal/zzuh$zzf;

    goto :goto_1

    :cond_4
    iget-object v0, p0, Lcom/google/android/gms/internal/zzuh$zza;->anj:Lcom/google/android/gms/internal/zzuh$zzf;

    if-nez v0, :cond_5

    new-instance v0, Lcom/google/android/gms/internal/zzuh$zzf;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzuh$zzf;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzuh$zza;->anj:Lcom/google/android/gms/internal/zzuh$zzf;

    :cond_5
    iget-object v0, p0, Lcom/google/android/gms/internal/zzuh$zza;->anj:Lcom/google/android/gms/internal/zzuh$zzf;

    :goto_1
    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzapn;->zza(Lcom/google/android/gms/internal/zzapv;)V

    goto :goto_0

    :cond_6
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzapn;->al()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzuh$zza;->amz:Ljava/lang/Integer;

    goto :goto_0

    :cond_7
    return-object p0
.end method

.method public synthetic zzb(Lcom/google/android/gms/internal/zzapn;)Lcom/google/android/gms/internal/zzapv;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzuh$zza;->zzal(Lcom/google/android/gms/internal/zzapn;)Lcom/google/android/gms/internal/zzuh$zza;

    move-result-object p1

    return-object p1
.end method

.method public zzbvt()Lcom/google/android/gms/internal/zzuh$zza;
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzuh$zza;->amz:Ljava/lang/Integer;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzuh$zza;->anj:Lcom/google/android/gms/internal/zzuh$zzf;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzuh$zza;->ank:Lcom/google/android/gms/internal/zzuh$zzf;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzuh$zza;->anl:Ljava/lang/Boolean;

    const/4 v0, -0x1

    iput v0, p0, Lcom/google/android/gms/internal/zzuh$zza;->bjG:I

    return-object p0
.end method

.method protected zzx()I
    .locals 3

    invoke-super {p0}, Lcom/google/android/gms/internal/zzapv;->zzx()I

    move-result v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzuh$zza;->amz:Ljava/lang/Integer;

    if-eqz v1, :cond_0

    const/4 v2, 0x1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {v2, v1}, Lcom/google/android/gms/internal/zzapo;->zzag(II)I

    move-result v1

    add-int/2addr v0, v1

    :cond_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzuh$zza;->anj:Lcom/google/android/gms/internal/zzuh$zzf;

    if-eqz v1, :cond_1

    const/4 v2, 0x2

    invoke-static {v2, v1}, Lcom/google/android/gms/internal/zzapo;->zzc(ILcom/google/android/gms/internal/zzapv;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_1
    iget-object v1, p0, Lcom/google/android/gms/internal/zzuh$zza;->ank:Lcom/google/android/gms/internal/zzuh$zzf;

    if-eqz v1, :cond_2

    const/4 v2, 0x3

    invoke-static {v2, v1}, Lcom/google/android/gms/internal/zzapo;->zzc(ILcom/google/android/gms/internal/zzapv;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_2
    iget-object v1, p0, Lcom/google/android/gms/internal/zzuh$zza;->anl:Ljava/lang/Boolean;

    if-eqz v1, :cond_3

    const/4 v2, 0x4

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-static {v2, v1}, Lcom/google/android/gms/internal/zzapo;->zzk(IZ)I

    move-result v1

    add-int/2addr v0, v1

    :cond_3
    return v0
.end method
