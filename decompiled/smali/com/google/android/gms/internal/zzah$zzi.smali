.class public final Lcom/google/android/gms/internal/zzah$zzi;
.super Lcom/google/android/gms/internal/zzapp;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzah;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "zzi"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/zzapp<",
        "Lcom/google/android/gms/internal/zzah$zzi;",
        ">;"
    }
.end annotation


# static fields
.field private static volatile zzwn:[Lcom/google/android/gms/internal/zzah$zzi;


# instance fields
.field public name:Ljava/lang/String;

.field public zzwo:Lcom/google/android/gms/internal/zzai$zza;

.field public zzwp:Lcom/google/android/gms/internal/zzah$zzd;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzapp;-><init>()V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzah$zzi;->zzan()Lcom/google/android/gms/internal/zzah$zzi;

    return-void
.end method

.method public static zzam()[Lcom/google/android/gms/internal/zzah$zzi;
    .locals 2

    sget-object v0, Lcom/google/android/gms/internal/zzah$zzi;->zzwn:[Lcom/google/android/gms/internal/zzah$zzi;

    if-nez v0, :cond_1

    sget-object v0, Lcom/google/android/gms/internal/zzapt;->bjF:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/google/android/gms/internal/zzah$zzi;->zzwn:[Lcom/google/android/gms/internal/zzah$zzi;

    if-nez v1, :cond_0

    const/4 v1, 0x0

    new-array v1, v1, [Lcom/google/android/gms/internal/zzah$zzi;

    sput-object v1, Lcom/google/android/gms/internal/zzah$zzi;->zzwn:[Lcom/google/android/gms/internal/zzah$zzi;

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
    sget-object v0, Lcom/google/android/gms/internal/zzah$zzi;->zzwn:[Lcom/google/android/gms/internal/zzah$zzi;

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/google/android/gms/internal/zzah$zzi;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lcom/google/android/gms/internal/zzah$zzi;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzah$zzi;->name:Ljava/lang/String;

    if-nez v1, :cond_2

    iget-object v1, p1, Lcom/google/android/gms/internal/zzah$zzi;->name:Ljava/lang/String;

    if-eqz v1, :cond_3

    return v2

    :cond_2
    iget-object v3, p1, Lcom/google/android/gms/internal/zzah$zzi;->name:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    return v2

    :cond_3
    iget-object v1, p0, Lcom/google/android/gms/internal/zzah$zzi;->zzwo:Lcom/google/android/gms/internal/zzai$zza;

    if-nez v1, :cond_4

    iget-object v1, p1, Lcom/google/android/gms/internal/zzah$zzi;->zzwo:Lcom/google/android/gms/internal/zzai$zza;

    if-eqz v1, :cond_5

    return v2

    :cond_4
    iget-object v3, p1, Lcom/google/android/gms/internal/zzah$zzi;->zzwo:Lcom/google/android/gms/internal/zzai$zza;

    invoke-virtual {v1, v3}, Lcom/google/android/gms/internal/zzai$zza;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    return v2

    :cond_5
    iget-object v1, p0, Lcom/google/android/gms/internal/zzah$zzi;->zzwp:Lcom/google/android/gms/internal/zzah$zzd;

    if-nez v1, :cond_6

    iget-object v1, p1, Lcom/google/android/gms/internal/zzah$zzi;->zzwp:Lcom/google/android/gms/internal/zzah$zzd;

    if-eqz v1, :cond_7

    return v2

    :cond_6
    iget-object v3, p1, Lcom/google/android/gms/internal/zzah$zzi;->zzwp:Lcom/google/android/gms/internal/zzah$zzd;

    invoke-virtual {v1, v3}, Lcom/google/android/gms/internal/zzah$zzd;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_7

    return v2

    :cond_7
    iget-object v1, p0, Lcom/google/android/gms/internal/zzah$zzi;->bjx:Lcom/google/android/gms/internal/zzapr;

    if-eqz v1, :cond_9

    iget-object v1, p0, Lcom/google/android/gms/internal/zzah$zzi;->bjx:Lcom/google/android/gms/internal/zzapr;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzapr;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_8

    goto :goto_0

    :cond_8
    iget-object v0, p0, Lcom/google/android/gms/internal/zzah$zzi;->bjx:Lcom/google/android/gms/internal/zzapr;

    iget-object p1, p1, Lcom/google/android/gms/internal/zzah$zzi;->bjx:Lcom/google/android/gms/internal/zzapr;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzapr;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1

    :cond_9
    :goto_0
    iget-object v1, p1, Lcom/google/android/gms/internal/zzah$zzi;->bjx:Lcom/google/android/gms/internal/zzapr;

    if-eqz v1, :cond_b

    iget-object p1, p1, Lcom/google/android/gms/internal/zzah$zzi;->bjx:Lcom/google/android/gms/internal/zzapr;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzapr;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_a

    goto :goto_1

    :cond_a
    const/4 v0, 0x0

    :cond_b
    :goto_1
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

    iget-object v1, p0, Lcom/google/android/gms/internal/zzah$zzi;->name:Ljava/lang/String;

    const/4 v2, 0x0

    if-nez v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :goto_0
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/google/android/gms/internal/zzah$zzi;->zzwo:Lcom/google/android/gms/internal/zzai$zza;

    if-nez v1, :cond_1

    const/4 v1, 0x0

    goto :goto_1

    :cond_1
    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzai$zza;->hashCode()I

    move-result v1

    :goto_1
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/google/android/gms/internal/zzah$zzi;->zzwp:Lcom/google/android/gms/internal/zzah$zzd;

    if-nez v1, :cond_2

    const/4 v1, 0x0

    goto :goto_2

    :cond_2
    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzah$zzd;->hashCode()I

    move-result v1

    :goto_2
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/google/android/gms/internal/zzah$zzi;->bjx:Lcom/google/android/gms/internal/zzapr;

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/google/android/gms/internal/zzah$zzi;->bjx:Lcom/google/android/gms/internal/zzapr;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzapr;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_3

    goto :goto_3

    :cond_3
    iget-object v1, p0, Lcom/google/android/gms/internal/zzah$zzi;->bjx:Lcom/google/android/gms/internal/zzapr;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzapr;->hashCode()I

    move-result v2

    :cond_4
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

    iget-object v0, p0, Lcom/google/android/gms/internal/zzah$zzi;->name:Ljava/lang/String;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    iget-object v1, p0, Lcom/google/android/gms/internal/zzah$zzi;->name:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/internal/zzapo;->zzr(ILjava/lang/String;)V

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzah$zzi;->zzwo:Lcom/google/android/gms/internal/zzai$zza;

    if-eqz v0, :cond_1

    const/4 v1, 0x2

    invoke-virtual {p1, v1, v0}, Lcom/google/android/gms/internal/zzapo;->zza(ILcom/google/android/gms/internal/zzapv;)V

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzah$zzi;->zzwp:Lcom/google/android/gms/internal/zzah$zzd;

    if-eqz v0, :cond_2

    const/4 v1, 0x3

    invoke-virtual {p1, v1, v0}, Lcom/google/android/gms/internal/zzapo;->zza(ILcom/google/android/gms/internal/zzapv;)V

    :cond_2
    invoke-super {p0, p1}, Lcom/google/android/gms/internal/zzapp;->zza(Lcom/google/android/gms/internal/zzapo;)V

    return-void
.end method

.method public zzan()Lcom/google/android/gms/internal/zzah$zzi;
    .locals 1

    const-string v0, ""

    iput-object v0, p0, Lcom/google/android/gms/internal/zzah$zzi;->name:Ljava/lang/String;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzah$zzi;->zzwo:Lcom/google/android/gms/internal/zzai$zza;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzah$zzi;->zzwp:Lcom/google/android/gms/internal/zzah$zzd;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzah$zzi;->bjx:Lcom/google/android/gms/internal/zzapr;

    const/4 v0, -0x1

    iput v0, p0, Lcom/google/android/gms/internal/zzah$zzi;->bjG:I

    return-object p0
.end method

.method public synthetic zzb(Lcom/google/android/gms/internal/zzapn;)Lcom/google/android/gms/internal/zzapv;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzah$zzi;->zzr(Lcom/google/android/gms/internal/zzapn;)Lcom/google/android/gms/internal/zzah$zzi;

    move-result-object p1

    return-object p1
.end method

.method public zzr(Lcom/google/android/gms/internal/zzapn;)Lcom/google/android/gms/internal/zzah$zzi;
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

    if-eqz v0, :cond_6

    const/16 v1, 0xa

    if-eq v0, v1, :cond_5

    const/16 v1, 0x12

    if-eq v0, v1, :cond_3

    const/16 v1, 0x1a

    if-eq v0, v1, :cond_1

    invoke-super {p0, p1, v0}, Lcom/google/android/gms/internal/zzapp;->zza(Lcom/google/android/gms/internal/zzapn;I)Z

    move-result v0

    if-nez v0, :cond_0

    return-object p0

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzah$zzi;->zzwp:Lcom/google/android/gms/internal/zzah$zzd;

    if-nez v0, :cond_2

    new-instance v0, Lcom/google/android/gms/internal/zzah$zzd;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzah$zzd;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzah$zzi;->zzwp:Lcom/google/android/gms/internal/zzah$zzd;

    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/internal/zzah$zzi;->zzwp:Lcom/google/android/gms/internal/zzah$zzd;

    goto :goto_1

    :cond_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzah$zzi;->zzwo:Lcom/google/android/gms/internal/zzai$zza;

    if-nez v0, :cond_4

    new-instance v0, Lcom/google/android/gms/internal/zzai$zza;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzai$zza;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzah$zzi;->zzwo:Lcom/google/android/gms/internal/zzai$zza;

    :cond_4
    iget-object v0, p0, Lcom/google/android/gms/internal/zzah$zzi;->zzwo:Lcom/google/android/gms/internal/zzai$zza;

    :goto_1
    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzapn;->zza(Lcom/google/android/gms/internal/zzapv;)V

    goto :goto_0

    :cond_5
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzapn;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzah$zzi;->name:Ljava/lang/String;

    goto :goto_0

    :cond_6
    return-object p0
.end method

.method protected zzx()I
    .locals 3

    invoke-super {p0}, Lcom/google/android/gms/internal/zzapp;->zzx()I

    move-result v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzah$zzi;->name:Ljava/lang/String;

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/google/android/gms/internal/zzah$zzi;->name:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/zzapo;->zzs(ILjava/lang/String;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzah$zzi;->zzwo:Lcom/google/android/gms/internal/zzai$zza;

    if-eqz v1, :cond_1

    const/4 v2, 0x2

    invoke-static {v2, v1}, Lcom/google/android/gms/internal/zzapo;->zzc(ILcom/google/android/gms/internal/zzapv;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_1
    iget-object v1, p0, Lcom/google/android/gms/internal/zzah$zzi;->zzwp:Lcom/google/android/gms/internal/zzah$zzd;

    if-eqz v1, :cond_2

    const/4 v2, 0x3

    invoke-static {v2, v1}, Lcom/google/android/gms/internal/zzapo;->zzc(ILcom/google/android/gms/internal/zzapv;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_2
    return v0
.end method
