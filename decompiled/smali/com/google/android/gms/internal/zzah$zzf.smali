.class public final Lcom/google/android/gms/internal/zzah$zzf;
.super Lcom/google/android/gms/internal/zzapp;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzah;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "zzf"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/zzapp<",
        "Lcom/google/android/gms/internal/zzah$zzf;",
        ">;"
    }
.end annotation


# instance fields
.field public version:Ljava/lang/String;

.field public zzvd:[Ljava/lang/String;

.field public zzve:[Ljava/lang/String;

.field public zzvf:[Lcom/google/android/gms/internal/zzai$zza;

.field public zzvg:[Lcom/google/android/gms/internal/zzah$zze;

.field public zzvh:[Lcom/google/android/gms/internal/zzah$zzb;

.field public zzvi:[Lcom/google/android/gms/internal/zzah$zzb;

.field public zzvj:[Lcom/google/android/gms/internal/zzah$zzb;

.field public zzvk:[Lcom/google/android/gms/internal/zzah$zzg;

.field public zzvl:Ljava/lang/String;

.field public zzvm:Ljava/lang/String;

.field public zzvn:Ljava/lang/String;

.field public zzvo:Lcom/google/android/gms/internal/zzah$zza;

.field public zzvp:F

.field public zzvq:Z

.field public zzvr:[Ljava/lang/String;

.field public zzvs:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzapp;-><init>()V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzah$zzf;->zzai()Lcom/google/android/gms/internal/zzah$zzf;

    return-void
.end method

.method public static zze([B)Lcom/google/android/gms/internal/zzah$zzf;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/zzapu;
        }
    .end annotation

    new-instance v0, Lcom/google/android/gms/internal/zzah$zzf;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzah$zzf;-><init>()V

    invoke-static {v0, p0}, Lcom/google/android/gms/internal/zzapv;->zza(Lcom/google/android/gms/internal/zzapv;[B)Lcom/google/android/gms/internal/zzapv;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/internal/zzah$zzf;

    return-object p0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/google/android/gms/internal/zzah$zzf;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lcom/google/android/gms/internal/zzah$zzf;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvd:[Ljava/lang/String;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzah$zzf;->zzvd:[Ljava/lang/String;

    invoke-static {v1, v3}, Lcom/google/android/gms/internal/zzapt;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    return v2

    :cond_2
    iget-object v1, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzve:[Ljava/lang/String;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzah$zzf;->zzve:[Ljava/lang/String;

    invoke-static {v1, v3}, Lcom/google/android/gms/internal/zzapt;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    return v2

    :cond_3
    iget-object v1, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvf:[Lcom/google/android/gms/internal/zzai$zza;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzah$zzf;->zzvf:[Lcom/google/android/gms/internal/zzai$zza;

    invoke-static {v1, v3}, Lcom/google/android/gms/internal/zzapt;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    return v2

    :cond_4
    iget-object v1, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvg:[Lcom/google/android/gms/internal/zzah$zze;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzah$zzf;->zzvg:[Lcom/google/android/gms/internal/zzah$zze;

    invoke-static {v1, v3}, Lcom/google/android/gms/internal/zzapt;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    return v2

    :cond_5
    iget-object v1, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvh:[Lcom/google/android/gms/internal/zzah$zzb;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzah$zzf;->zzvh:[Lcom/google/android/gms/internal/zzah$zzb;

    invoke-static {v1, v3}, Lcom/google/android/gms/internal/zzapt;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6

    return v2

    :cond_6
    iget-object v1, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvi:[Lcom/google/android/gms/internal/zzah$zzb;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzah$zzf;->zzvi:[Lcom/google/android/gms/internal/zzah$zzb;

    invoke-static {v1, v3}, Lcom/google/android/gms/internal/zzapt;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_7

    return v2

    :cond_7
    iget-object v1, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvj:[Lcom/google/android/gms/internal/zzah$zzb;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzah$zzf;->zzvj:[Lcom/google/android/gms/internal/zzah$zzb;

    invoke-static {v1, v3}, Lcom/google/android/gms/internal/zzapt;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_8

    return v2

    :cond_8
    iget-object v1, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvk:[Lcom/google/android/gms/internal/zzah$zzg;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzah$zzf;->zzvk:[Lcom/google/android/gms/internal/zzah$zzg;

    invoke-static {v1, v3}, Lcom/google/android/gms/internal/zzapt;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_9

    return v2

    :cond_9
    iget-object v1, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvl:Ljava/lang/String;

    if-nez v1, :cond_a

    iget-object v1, p1, Lcom/google/android/gms/internal/zzah$zzf;->zzvl:Ljava/lang/String;

    if-eqz v1, :cond_b

    return v2

    :cond_a
    iget-object v3, p1, Lcom/google/android/gms/internal/zzah$zzf;->zzvl:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_b

    return v2

    :cond_b
    iget-object v1, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvm:Ljava/lang/String;

    if-nez v1, :cond_c

    iget-object v1, p1, Lcom/google/android/gms/internal/zzah$zzf;->zzvm:Ljava/lang/String;

    if-eqz v1, :cond_d

    return v2

    :cond_c
    iget-object v3, p1, Lcom/google/android/gms/internal/zzah$zzf;->zzvm:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_d

    return v2

    :cond_d
    iget-object v1, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvn:Ljava/lang/String;

    if-nez v1, :cond_e

    iget-object v1, p1, Lcom/google/android/gms/internal/zzah$zzf;->zzvn:Ljava/lang/String;

    if-eqz v1, :cond_f

    return v2

    :cond_e
    iget-object v3, p1, Lcom/google/android/gms/internal/zzah$zzf;->zzvn:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_f

    return v2

    :cond_f
    iget-object v1, p0, Lcom/google/android/gms/internal/zzah$zzf;->version:Ljava/lang/String;

    if-nez v1, :cond_10

    iget-object v1, p1, Lcom/google/android/gms/internal/zzah$zzf;->version:Ljava/lang/String;

    if-eqz v1, :cond_11

    return v2

    :cond_10
    iget-object v3, p1, Lcom/google/android/gms/internal/zzah$zzf;->version:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_11

    return v2

    :cond_11
    iget-object v1, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvo:Lcom/google/android/gms/internal/zzah$zza;

    if-nez v1, :cond_12

    iget-object v1, p1, Lcom/google/android/gms/internal/zzah$zzf;->zzvo:Lcom/google/android/gms/internal/zzah$zza;

    if-eqz v1, :cond_13

    return v2

    :cond_12
    iget-object v3, p1, Lcom/google/android/gms/internal/zzah$zzf;->zzvo:Lcom/google/android/gms/internal/zzah$zza;

    invoke-virtual {v1, v3}, Lcom/google/android/gms/internal/zzah$zza;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_13

    return v2

    :cond_13
    iget v1, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvp:F

    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v1

    iget v3, p1, Lcom/google/android/gms/internal/zzah$zzf;->zzvp:F

    invoke-static {v3}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v3

    if-eq v1, v3, :cond_14

    return v2

    :cond_14
    iget-boolean v1, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvq:Z

    iget-boolean v3, p1, Lcom/google/android/gms/internal/zzah$zzf;->zzvq:Z

    if-eq v1, v3, :cond_15

    return v2

    :cond_15
    iget-object v1, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvr:[Ljava/lang/String;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzah$zzf;->zzvr:[Ljava/lang/String;

    invoke-static {v1, v3}, Lcom/google/android/gms/internal/zzapt;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_16

    return v2

    :cond_16
    iget v1, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvs:I

    iget v3, p1, Lcom/google/android/gms/internal/zzah$zzf;->zzvs:I

    if-eq v1, v3, :cond_17

    return v2

    :cond_17
    iget-object v1, p0, Lcom/google/android/gms/internal/zzah$zzf;->bjx:Lcom/google/android/gms/internal/zzapr;

    if-eqz v1, :cond_19

    iget-object v1, p0, Lcom/google/android/gms/internal/zzah$zzf;->bjx:Lcom/google/android/gms/internal/zzapr;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzapr;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_18

    goto :goto_0

    :cond_18
    iget-object v0, p0, Lcom/google/android/gms/internal/zzah$zzf;->bjx:Lcom/google/android/gms/internal/zzapr;

    iget-object p1, p1, Lcom/google/android/gms/internal/zzah$zzf;->bjx:Lcom/google/android/gms/internal/zzapr;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzapr;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1

    :cond_19
    :goto_0
    iget-object v1, p1, Lcom/google/android/gms/internal/zzah$zzf;->bjx:Lcom/google/android/gms/internal/zzapr;

    if-eqz v1, :cond_1b

    iget-object p1, p1, Lcom/google/android/gms/internal/zzah$zzf;->bjx:Lcom/google/android/gms/internal/zzapr;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzapr;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_1a

    goto :goto_1

    :cond_1a
    const/4 v0, 0x0

    :cond_1b
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

    iget-object v1, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvd:[Ljava/lang/String;

    invoke-static {v1}, Lcom/google/android/gms/internal/zzapt;->hashCode([Ljava/lang/Object;)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzve:[Ljava/lang/String;

    invoke-static {v1}, Lcom/google/android/gms/internal/zzapt;->hashCode([Ljava/lang/Object;)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvf:[Lcom/google/android/gms/internal/zzai$zza;

    invoke-static {v1}, Lcom/google/android/gms/internal/zzapt;->hashCode([Ljava/lang/Object;)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvg:[Lcom/google/android/gms/internal/zzah$zze;

    invoke-static {v1}, Lcom/google/android/gms/internal/zzapt;->hashCode([Ljava/lang/Object;)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvh:[Lcom/google/android/gms/internal/zzah$zzb;

    invoke-static {v1}, Lcom/google/android/gms/internal/zzapt;->hashCode([Ljava/lang/Object;)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvi:[Lcom/google/android/gms/internal/zzah$zzb;

    invoke-static {v1}, Lcom/google/android/gms/internal/zzapt;->hashCode([Ljava/lang/Object;)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvj:[Lcom/google/android/gms/internal/zzah$zzb;

    invoke-static {v1}, Lcom/google/android/gms/internal/zzapt;->hashCode([Ljava/lang/Object;)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvk:[Lcom/google/android/gms/internal/zzah$zzg;

    invoke-static {v1}, Lcom/google/android/gms/internal/zzapt;->hashCode([Ljava/lang/Object;)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvl:Ljava/lang/String;

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

    iget-object v1, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvm:Ljava/lang/String;

    if-nez v1, :cond_1

    const/4 v1, 0x0

    goto :goto_1

    :cond_1
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :goto_1
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvn:Ljava/lang/String;

    if-nez v1, :cond_2

    const/4 v1, 0x0

    goto :goto_2

    :cond_2
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :goto_2
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/google/android/gms/internal/zzah$zzf;->version:Ljava/lang/String;

    if-nez v1, :cond_3

    const/4 v1, 0x0

    goto :goto_3

    :cond_3
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :goto_3
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvo:Lcom/google/android/gms/internal/zzah$zza;

    if-nez v1, :cond_4

    const/4 v1, 0x0

    goto :goto_4

    :cond_4
    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzah$zza;->hashCode()I

    move-result v1

    :goto_4
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget v1, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvp:F

    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-boolean v1, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvq:Z

    if-eqz v1, :cond_5

    const/16 v1, 0x4cf

    goto :goto_5

    :cond_5
    const/16 v1, 0x4d5

    :goto_5
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvr:[Ljava/lang/String;

    invoke-static {v1}, Lcom/google/android/gms/internal/zzapt;->hashCode([Ljava/lang/Object;)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget v1, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvs:I

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/google/android/gms/internal/zzah$zzf;->bjx:Lcom/google/android/gms/internal/zzapr;

    if-eqz v1, :cond_7

    iget-object v1, p0, Lcom/google/android/gms/internal/zzah$zzf;->bjx:Lcom/google/android/gms/internal/zzapr;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzapr;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_6

    goto :goto_6

    :cond_6
    iget-object v1, p0, Lcom/google/android/gms/internal/zzah$zzf;->bjx:Lcom/google/android/gms/internal/zzapr;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzapr;->hashCode()I

    move-result v2

    :cond_7
    :goto_6
    add-int/2addr v0, v2

    return v0
.end method

.method public zza(Lcom/google/android/gms/internal/zzapo;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzve:[Ljava/lang/String;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    array-length v0, v0

    if-lez v0, :cond_1

    const/4 v0, 0x0

    :goto_0
    iget-object v2, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzve:[Ljava/lang/String;

    array-length v3, v2

    if-ge v0, v3, :cond_1

    aget-object v2, v2, v0

    if-eqz v2, :cond_0

    const/4 v3, 0x1

    invoke-virtual {p1, v3, v2}, Lcom/google/android/gms/internal/zzapo;->zzr(ILjava/lang/String;)V

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvf:[Lcom/google/android/gms/internal/zzai$zza;

    if-eqz v0, :cond_3

    array-length v0, v0

    if-lez v0, :cond_3

    const/4 v0, 0x0

    :goto_1
    iget-object v2, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvf:[Lcom/google/android/gms/internal/zzai$zza;

    array-length v3, v2

    if-ge v0, v3, :cond_3

    aget-object v2, v2, v0

    if-eqz v2, :cond_2

    const/4 v3, 0x2

    invoke-virtual {p1, v3, v2}, Lcom/google/android/gms/internal/zzapo;->zza(ILcom/google/android/gms/internal/zzapv;)V

    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvg:[Lcom/google/android/gms/internal/zzah$zze;

    if-eqz v0, :cond_5

    array-length v0, v0

    if-lez v0, :cond_5

    const/4 v0, 0x0

    :goto_2
    iget-object v2, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvg:[Lcom/google/android/gms/internal/zzah$zze;

    array-length v3, v2

    if-ge v0, v3, :cond_5

    aget-object v2, v2, v0

    if-eqz v2, :cond_4

    const/4 v3, 0x3

    invoke-virtual {p1, v3, v2}, Lcom/google/android/gms/internal/zzapo;->zza(ILcom/google/android/gms/internal/zzapv;)V

    :cond_4
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_5
    iget-object v0, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvh:[Lcom/google/android/gms/internal/zzah$zzb;

    if-eqz v0, :cond_7

    array-length v0, v0

    if-lez v0, :cond_7

    const/4 v0, 0x0

    :goto_3
    iget-object v2, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvh:[Lcom/google/android/gms/internal/zzah$zzb;

    array-length v3, v2

    if-ge v0, v3, :cond_7

    aget-object v2, v2, v0

    if-eqz v2, :cond_6

    const/4 v3, 0x4

    invoke-virtual {p1, v3, v2}, Lcom/google/android/gms/internal/zzapo;->zza(ILcom/google/android/gms/internal/zzapv;)V

    :cond_6
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    :cond_7
    iget-object v0, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvi:[Lcom/google/android/gms/internal/zzah$zzb;

    if-eqz v0, :cond_9

    array-length v0, v0

    if-lez v0, :cond_9

    const/4 v0, 0x0

    :goto_4
    iget-object v2, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvi:[Lcom/google/android/gms/internal/zzah$zzb;

    array-length v3, v2

    if-ge v0, v3, :cond_9

    aget-object v2, v2, v0

    if-eqz v2, :cond_8

    const/4 v3, 0x5

    invoke-virtual {p1, v3, v2}, Lcom/google/android/gms/internal/zzapo;->zza(ILcom/google/android/gms/internal/zzapv;)V

    :cond_8
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    :cond_9
    iget-object v0, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvj:[Lcom/google/android/gms/internal/zzah$zzb;

    if-eqz v0, :cond_b

    array-length v0, v0

    if-lez v0, :cond_b

    const/4 v0, 0x0

    :goto_5
    iget-object v2, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvj:[Lcom/google/android/gms/internal/zzah$zzb;

    array-length v3, v2

    if-ge v0, v3, :cond_b

    aget-object v2, v2, v0

    if-eqz v2, :cond_a

    const/4 v3, 0x6

    invoke-virtual {p1, v3, v2}, Lcom/google/android/gms/internal/zzapo;->zza(ILcom/google/android/gms/internal/zzapv;)V

    :cond_a
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    :cond_b
    iget-object v0, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvk:[Lcom/google/android/gms/internal/zzah$zzg;

    if-eqz v0, :cond_d

    array-length v0, v0

    if-lez v0, :cond_d

    const/4 v0, 0x0

    :goto_6
    iget-object v2, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvk:[Lcom/google/android/gms/internal/zzah$zzg;

    array-length v3, v2

    if-ge v0, v3, :cond_d

    aget-object v2, v2, v0

    if-eqz v2, :cond_c

    const/4 v3, 0x7

    invoke-virtual {p1, v3, v2}, Lcom/google/android/gms/internal/zzapo;->zza(ILcom/google/android/gms/internal/zzapv;)V

    :cond_c
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    :cond_d
    iget-object v0, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvl:Ljava/lang/String;

    const-string v2, ""

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_e

    const/16 v0, 0x9

    iget-object v3, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvl:Ljava/lang/String;

    invoke-virtual {p1, v0, v3}, Lcom/google/android/gms/internal/zzapo;->zzr(ILjava/lang/String;)V

    :cond_e
    iget-object v0, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvm:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_f

    const/16 v0, 0xa

    iget-object v3, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvm:Ljava/lang/String;

    invoke-virtual {p1, v0, v3}, Lcom/google/android/gms/internal/zzapo;->zzr(ILjava/lang/String;)V

    :cond_f
    iget-object v0, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvn:Ljava/lang/String;

    const-string v3, "0"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_10

    const/16 v0, 0xc

    iget-object v3, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvn:Ljava/lang/String;

    invoke-virtual {p1, v0, v3}, Lcom/google/android/gms/internal/zzapo;->zzr(ILjava/lang/String;)V

    :cond_10
    iget-object v0, p0, Lcom/google/android/gms/internal/zzah$zzf;->version:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_11

    const/16 v0, 0xd

    iget-object v2, p0, Lcom/google/android/gms/internal/zzah$zzf;->version:Ljava/lang/String;

    invoke-virtual {p1, v0, v2}, Lcom/google/android/gms/internal/zzapo;->zzr(ILjava/lang/String;)V

    :cond_11
    iget-object v0, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvo:Lcom/google/android/gms/internal/zzah$zza;

    if-eqz v0, :cond_12

    const/16 v2, 0xe

    invoke-virtual {p1, v2, v0}, Lcom/google/android/gms/internal/zzapo;->zza(ILcom/google/android/gms/internal/zzapv;)V

    :cond_12
    iget v0, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvp:F

    invoke-static {v0}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v0

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v2

    if-eq v0, v2, :cond_13

    const/16 v0, 0xf

    iget v2, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvp:F

    invoke-virtual {p1, v0, v2}, Lcom/google/android/gms/internal/zzapo;->zzc(IF)V

    :cond_13
    iget-object v0, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvr:[Ljava/lang/String;

    if-eqz v0, :cond_15

    array-length v0, v0

    if-lez v0, :cond_15

    const/4 v0, 0x0

    :goto_7
    iget-object v2, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvr:[Ljava/lang/String;

    array-length v3, v2

    if-ge v0, v3, :cond_15

    aget-object v2, v2, v0

    if-eqz v2, :cond_14

    const/16 v3, 0x10

    invoke-virtual {p1, v3, v2}, Lcom/google/android/gms/internal/zzapo;->zzr(ILjava/lang/String;)V

    :cond_14
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    :cond_15
    iget v0, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvs:I

    if-eqz v0, :cond_16

    const/16 v2, 0x11

    invoke-virtual {p1, v2, v0}, Lcom/google/android/gms/internal/zzapo;->zzae(II)V

    :cond_16
    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvq:Z

    if-eqz v0, :cond_17

    const/16 v2, 0x12

    invoke-virtual {p1, v2, v0}, Lcom/google/android/gms/internal/zzapo;->zzj(IZ)V

    :cond_17
    iget-object v0, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvd:[Ljava/lang/String;

    if-eqz v0, :cond_19

    array-length v0, v0

    if-lez v0, :cond_19

    :goto_8
    iget-object v0, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvd:[Ljava/lang/String;

    array-length v2, v0

    if-ge v1, v2, :cond_19

    aget-object v0, v0, v1

    if-eqz v0, :cond_18

    const/16 v2, 0x13

    invoke-virtual {p1, v2, v0}, Lcom/google/android/gms/internal/zzapo;->zzr(ILjava/lang/String;)V

    :cond_18
    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    :cond_19
    invoke-super {p0, p1}, Lcom/google/android/gms/internal/zzapp;->zza(Lcom/google/android/gms/internal/zzapo;)V

    return-void
.end method

.method public zzai()Lcom/google/android/gms/internal/zzah$zzf;
    .locals 3

    sget-object v0, Lcom/google/android/gms/internal/zzapy;->bjM:[Ljava/lang/String;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvd:[Ljava/lang/String;

    sget-object v0, Lcom/google/android/gms/internal/zzapy;->bjM:[Ljava/lang/String;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzve:[Ljava/lang/String;

    invoke-static {}, Lcom/google/android/gms/internal/zzai$zza;->zzap()[Lcom/google/android/gms/internal/zzai$zza;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvf:[Lcom/google/android/gms/internal/zzai$zza;

    invoke-static {}, Lcom/google/android/gms/internal/zzah$zze;->zzag()[Lcom/google/android/gms/internal/zzah$zze;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvg:[Lcom/google/android/gms/internal/zzah$zze;

    invoke-static {}, Lcom/google/android/gms/internal/zzah$zzb;->zzab()[Lcom/google/android/gms/internal/zzah$zzb;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvh:[Lcom/google/android/gms/internal/zzah$zzb;

    invoke-static {}, Lcom/google/android/gms/internal/zzah$zzb;->zzab()[Lcom/google/android/gms/internal/zzah$zzb;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvi:[Lcom/google/android/gms/internal/zzah$zzb;

    invoke-static {}, Lcom/google/android/gms/internal/zzah$zzb;->zzab()[Lcom/google/android/gms/internal/zzah$zzb;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvj:[Lcom/google/android/gms/internal/zzah$zzb;

    invoke-static {}, Lcom/google/android/gms/internal/zzah$zzg;->zzaj()[Lcom/google/android/gms/internal/zzah$zzg;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvk:[Lcom/google/android/gms/internal/zzah$zzg;

    const-string v0, ""

    iput-object v0, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvl:Ljava/lang/String;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvm:Ljava/lang/String;

    const-string v1, "0"

    iput-object v1, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvn:Ljava/lang/String;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzah$zzf;->version:Ljava/lang/String;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvo:Lcom/google/android/gms/internal/zzah$zza;

    const/4 v1, 0x0

    iput v1, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvp:F

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvq:Z

    sget-object v2, Lcom/google/android/gms/internal/zzapy;->bjM:[Ljava/lang/String;

    iput-object v2, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvr:[Ljava/lang/String;

    iput v1, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvs:I

    iput-object v0, p0, Lcom/google/android/gms/internal/zzah$zzf;->bjx:Lcom/google/android/gms/internal/zzapr;

    const/4 v0, -0x1

    iput v0, p0, Lcom/google/android/gms/internal/zzah$zzf;->bjG:I

    return-object p0
.end method

.method public synthetic zzb(Lcom/google/android/gms/internal/zzapn;)Lcom/google/android/gms/internal/zzapv;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzah$zzf;->zzo(Lcom/google/android/gms/internal/zzapn;)Lcom/google/android/gms/internal/zzah$zzf;

    move-result-object p1

    return-object p1
.end method

.method public zzo(Lcom/google/android/gms/internal/zzapn;)Lcom/google/android/gms/internal/zzah$zzf;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    :cond_0
    :goto_0
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzapn;->ah()I

    move-result v0

    const/4 v1, 0x0

    sparse-switch v0, :sswitch_data_0

    invoke-super {p0, p1, v0}, Lcom/google/android/gms/internal/zzapp;->zza(Lcom/google/android/gms/internal/zzapn;I)Z

    move-result v0

    if-nez v0, :cond_0

    return-object p0

    :sswitch_0
    const/16 v0, 0x9a

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/zzapy;->zzc(Lcom/google/android/gms/internal/zzapn;I)I

    move-result v0

    iget-object v2, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvd:[Ljava/lang/String;

    if-nez v2, :cond_1

    const/4 v2, 0x0

    goto :goto_1

    :cond_1
    array-length v2, v2

    :goto_1
    add-int/2addr v0, v2

    new-array v0, v0, [Ljava/lang/String;

    if-eqz v2, :cond_2

    iget-object v3, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvd:[Ljava/lang/String;

    invoke-static {v3, v1, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_2
    :goto_2
    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    if-ge v2, v1, :cond_3

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzapn;->readString()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v2

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzapn;->ah()I

    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    :cond_3
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzapn;->readString()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v2

    iput-object v0, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvd:[Ljava/lang/String;

    goto :goto_0

    :sswitch_1
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzapn;->an()Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvq:Z

    goto :goto_0

    :sswitch_2
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzapn;->al()I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvs:I

    goto :goto_0

    :sswitch_3
    const/16 v0, 0x82

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/zzapy;->zzc(Lcom/google/android/gms/internal/zzapn;I)I

    move-result v0

    iget-object v2, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvr:[Ljava/lang/String;

    if-nez v2, :cond_4

    const/4 v2, 0x0

    goto :goto_3

    :cond_4
    array-length v2, v2

    :goto_3
    add-int/2addr v0, v2

    new-array v0, v0, [Ljava/lang/String;

    if-eqz v2, :cond_5

    iget-object v3, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvr:[Ljava/lang/String;

    invoke-static {v3, v1, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_5
    :goto_4
    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    if-ge v2, v1, :cond_6

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzapn;->readString()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v2

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzapn;->ah()I

    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    :cond_6
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzapn;->readString()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v2

    iput-object v0, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvr:[Ljava/lang/String;

    goto :goto_0

    :sswitch_4
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzapn;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvp:F

    goto/16 :goto_0

    :sswitch_5
    iget-object v0, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvo:Lcom/google/android/gms/internal/zzah$zza;

    if-nez v0, :cond_7

    new-instance v0, Lcom/google/android/gms/internal/zzah$zza;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzah$zza;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvo:Lcom/google/android/gms/internal/zzah$zza;

    :cond_7
    iget-object v0, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvo:Lcom/google/android/gms/internal/zzah$zza;

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzapn;->zza(Lcom/google/android/gms/internal/zzapv;)V

    goto/16 :goto_0

    :sswitch_6
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzapn;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzah$zzf;->version:Ljava/lang/String;

    goto/16 :goto_0

    :sswitch_7
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzapn;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvn:Ljava/lang/String;

    goto/16 :goto_0

    :sswitch_8
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzapn;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvm:Ljava/lang/String;

    goto/16 :goto_0

    :sswitch_9
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzapn;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvl:Ljava/lang/String;

    goto/16 :goto_0

    :sswitch_a
    const/16 v0, 0x3a

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/zzapy;->zzc(Lcom/google/android/gms/internal/zzapn;I)I

    move-result v0

    iget-object v2, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvk:[Lcom/google/android/gms/internal/zzah$zzg;

    if-nez v2, :cond_8

    const/4 v2, 0x0

    goto :goto_5

    :cond_8
    array-length v2, v2

    :goto_5
    add-int/2addr v0, v2

    new-array v0, v0, [Lcom/google/android/gms/internal/zzah$zzg;

    if-eqz v2, :cond_9

    iget-object v3, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvk:[Lcom/google/android/gms/internal/zzah$zzg;

    invoke-static {v3, v1, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_9
    :goto_6
    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    if-ge v2, v1, :cond_a

    new-instance v1, Lcom/google/android/gms/internal/zzah$zzg;

    invoke-direct {v1}, Lcom/google/android/gms/internal/zzah$zzg;-><init>()V

    aput-object v1, v0, v2

    aget-object v1, v0, v2

    invoke-virtual {p1, v1}, Lcom/google/android/gms/internal/zzapn;->zza(Lcom/google/android/gms/internal/zzapv;)V

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzapn;->ah()I

    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    :cond_a
    new-instance v1, Lcom/google/android/gms/internal/zzah$zzg;

    invoke-direct {v1}, Lcom/google/android/gms/internal/zzah$zzg;-><init>()V

    aput-object v1, v0, v2

    aget-object v1, v0, v2

    invoke-virtual {p1, v1}, Lcom/google/android/gms/internal/zzapn;->zza(Lcom/google/android/gms/internal/zzapv;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvk:[Lcom/google/android/gms/internal/zzah$zzg;

    goto/16 :goto_0

    :sswitch_b
    const/16 v0, 0x32

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/zzapy;->zzc(Lcom/google/android/gms/internal/zzapn;I)I

    move-result v0

    iget-object v2, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvj:[Lcom/google/android/gms/internal/zzah$zzb;

    if-nez v2, :cond_b

    const/4 v2, 0x0

    goto :goto_7

    :cond_b
    array-length v2, v2

    :goto_7
    add-int/2addr v0, v2

    new-array v0, v0, [Lcom/google/android/gms/internal/zzah$zzb;

    if-eqz v2, :cond_c

    iget-object v3, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvj:[Lcom/google/android/gms/internal/zzah$zzb;

    invoke-static {v3, v1, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_c
    :goto_8
    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    if-ge v2, v1, :cond_d

    new-instance v1, Lcom/google/android/gms/internal/zzah$zzb;

    invoke-direct {v1}, Lcom/google/android/gms/internal/zzah$zzb;-><init>()V

    aput-object v1, v0, v2

    aget-object v1, v0, v2

    invoke-virtual {p1, v1}, Lcom/google/android/gms/internal/zzapn;->zza(Lcom/google/android/gms/internal/zzapv;)V

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzapn;->ah()I

    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    :cond_d
    new-instance v1, Lcom/google/android/gms/internal/zzah$zzb;

    invoke-direct {v1}, Lcom/google/android/gms/internal/zzah$zzb;-><init>()V

    aput-object v1, v0, v2

    aget-object v1, v0, v2

    invoke-virtual {p1, v1}, Lcom/google/android/gms/internal/zzapn;->zza(Lcom/google/android/gms/internal/zzapv;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvj:[Lcom/google/android/gms/internal/zzah$zzb;

    goto/16 :goto_0

    :sswitch_c
    const/16 v0, 0x2a

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/zzapy;->zzc(Lcom/google/android/gms/internal/zzapn;I)I

    move-result v0

    iget-object v2, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvi:[Lcom/google/android/gms/internal/zzah$zzb;

    if-nez v2, :cond_e

    const/4 v2, 0x0

    goto :goto_9

    :cond_e
    array-length v2, v2

    :goto_9
    add-int/2addr v0, v2

    new-array v0, v0, [Lcom/google/android/gms/internal/zzah$zzb;

    if-eqz v2, :cond_f

    iget-object v3, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvi:[Lcom/google/android/gms/internal/zzah$zzb;

    invoke-static {v3, v1, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_f
    :goto_a
    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    if-ge v2, v1, :cond_10

    new-instance v1, Lcom/google/android/gms/internal/zzah$zzb;

    invoke-direct {v1}, Lcom/google/android/gms/internal/zzah$zzb;-><init>()V

    aput-object v1, v0, v2

    aget-object v1, v0, v2

    invoke-virtual {p1, v1}, Lcom/google/android/gms/internal/zzapn;->zza(Lcom/google/android/gms/internal/zzapv;)V

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzapn;->ah()I

    add-int/lit8 v2, v2, 0x1

    goto :goto_a

    :cond_10
    new-instance v1, Lcom/google/android/gms/internal/zzah$zzb;

    invoke-direct {v1}, Lcom/google/android/gms/internal/zzah$zzb;-><init>()V

    aput-object v1, v0, v2

    aget-object v1, v0, v2

    invoke-virtual {p1, v1}, Lcom/google/android/gms/internal/zzapn;->zza(Lcom/google/android/gms/internal/zzapv;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvi:[Lcom/google/android/gms/internal/zzah$zzb;

    goto/16 :goto_0

    :sswitch_d
    const/16 v0, 0x22

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/zzapy;->zzc(Lcom/google/android/gms/internal/zzapn;I)I

    move-result v0

    iget-object v2, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvh:[Lcom/google/android/gms/internal/zzah$zzb;

    if-nez v2, :cond_11

    const/4 v2, 0x0

    goto :goto_b

    :cond_11
    array-length v2, v2

    :goto_b
    add-int/2addr v0, v2

    new-array v0, v0, [Lcom/google/android/gms/internal/zzah$zzb;

    if-eqz v2, :cond_12

    iget-object v3, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvh:[Lcom/google/android/gms/internal/zzah$zzb;

    invoke-static {v3, v1, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_12
    :goto_c
    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    if-ge v2, v1, :cond_13

    new-instance v1, Lcom/google/android/gms/internal/zzah$zzb;

    invoke-direct {v1}, Lcom/google/android/gms/internal/zzah$zzb;-><init>()V

    aput-object v1, v0, v2

    aget-object v1, v0, v2

    invoke-virtual {p1, v1}, Lcom/google/android/gms/internal/zzapn;->zza(Lcom/google/android/gms/internal/zzapv;)V

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzapn;->ah()I

    add-int/lit8 v2, v2, 0x1

    goto :goto_c

    :cond_13
    new-instance v1, Lcom/google/android/gms/internal/zzah$zzb;

    invoke-direct {v1}, Lcom/google/android/gms/internal/zzah$zzb;-><init>()V

    aput-object v1, v0, v2

    aget-object v1, v0, v2

    invoke-virtual {p1, v1}, Lcom/google/android/gms/internal/zzapn;->zza(Lcom/google/android/gms/internal/zzapv;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvh:[Lcom/google/android/gms/internal/zzah$zzb;

    goto/16 :goto_0

    :sswitch_e
    const/16 v0, 0x1a

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/zzapy;->zzc(Lcom/google/android/gms/internal/zzapn;I)I

    move-result v0

    iget-object v2, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvg:[Lcom/google/android/gms/internal/zzah$zze;

    if-nez v2, :cond_14

    const/4 v2, 0x0

    goto :goto_d

    :cond_14
    array-length v2, v2

    :goto_d
    add-int/2addr v0, v2

    new-array v0, v0, [Lcom/google/android/gms/internal/zzah$zze;

    if-eqz v2, :cond_15

    iget-object v3, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvg:[Lcom/google/android/gms/internal/zzah$zze;

    invoke-static {v3, v1, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_15
    :goto_e
    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    if-ge v2, v1, :cond_16

    new-instance v1, Lcom/google/android/gms/internal/zzah$zze;

    invoke-direct {v1}, Lcom/google/android/gms/internal/zzah$zze;-><init>()V

    aput-object v1, v0, v2

    aget-object v1, v0, v2

    invoke-virtual {p1, v1}, Lcom/google/android/gms/internal/zzapn;->zza(Lcom/google/android/gms/internal/zzapv;)V

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzapn;->ah()I

    add-int/lit8 v2, v2, 0x1

    goto :goto_e

    :cond_16
    new-instance v1, Lcom/google/android/gms/internal/zzah$zze;

    invoke-direct {v1}, Lcom/google/android/gms/internal/zzah$zze;-><init>()V

    aput-object v1, v0, v2

    aget-object v1, v0, v2

    invoke-virtual {p1, v1}, Lcom/google/android/gms/internal/zzapn;->zza(Lcom/google/android/gms/internal/zzapv;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvg:[Lcom/google/android/gms/internal/zzah$zze;

    goto/16 :goto_0

    :sswitch_f
    const/16 v0, 0x12

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/zzapy;->zzc(Lcom/google/android/gms/internal/zzapn;I)I

    move-result v0

    iget-object v2, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvf:[Lcom/google/android/gms/internal/zzai$zza;

    if-nez v2, :cond_17

    const/4 v2, 0x0

    goto :goto_f

    :cond_17
    array-length v2, v2

    :goto_f
    add-int/2addr v0, v2

    new-array v0, v0, [Lcom/google/android/gms/internal/zzai$zza;

    if-eqz v2, :cond_18

    iget-object v3, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvf:[Lcom/google/android/gms/internal/zzai$zza;

    invoke-static {v3, v1, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_18
    :goto_10
    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    if-ge v2, v1, :cond_19

    new-instance v1, Lcom/google/android/gms/internal/zzai$zza;

    invoke-direct {v1}, Lcom/google/android/gms/internal/zzai$zza;-><init>()V

    aput-object v1, v0, v2

    aget-object v1, v0, v2

    invoke-virtual {p1, v1}, Lcom/google/android/gms/internal/zzapn;->zza(Lcom/google/android/gms/internal/zzapv;)V

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzapn;->ah()I

    add-int/lit8 v2, v2, 0x1

    goto :goto_10

    :cond_19
    new-instance v1, Lcom/google/android/gms/internal/zzai$zza;

    invoke-direct {v1}, Lcom/google/android/gms/internal/zzai$zza;-><init>()V

    aput-object v1, v0, v2

    aget-object v1, v0, v2

    invoke-virtual {p1, v1}, Lcom/google/android/gms/internal/zzapn;->zza(Lcom/google/android/gms/internal/zzapv;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvf:[Lcom/google/android/gms/internal/zzai$zza;

    goto/16 :goto_0

    :sswitch_10
    const/16 v0, 0xa

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/zzapy;->zzc(Lcom/google/android/gms/internal/zzapn;I)I

    move-result v0

    iget-object v2, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzve:[Ljava/lang/String;

    if-nez v2, :cond_1a

    const/4 v2, 0x0

    goto :goto_11

    :cond_1a
    array-length v2, v2

    :goto_11
    add-int/2addr v0, v2

    new-array v0, v0, [Ljava/lang/String;

    if-eqz v2, :cond_1b

    iget-object v3, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzve:[Ljava/lang/String;

    invoke-static {v3, v1, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_1b
    :goto_12
    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    if-ge v2, v1, :cond_1c

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzapn;->readString()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v2

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzapn;->ah()I

    add-int/lit8 v2, v2, 0x1

    goto :goto_12

    :cond_1c
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzapn;->readString()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v2

    iput-object v0, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzve:[Ljava/lang/String;

    goto/16 :goto_0

    :sswitch_11
    return-object p0

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_11
        0xa -> :sswitch_10
        0x12 -> :sswitch_f
        0x1a -> :sswitch_e
        0x22 -> :sswitch_d
        0x2a -> :sswitch_c
        0x32 -> :sswitch_b
        0x3a -> :sswitch_a
        0x4a -> :sswitch_9
        0x52 -> :sswitch_8
        0x62 -> :sswitch_7
        0x6a -> :sswitch_6
        0x72 -> :sswitch_5
        0x7d -> :sswitch_4
        0x82 -> :sswitch_3
        0x88 -> :sswitch_2
        0x90 -> :sswitch_1
        0x9a -> :sswitch_0
    .end sparse-switch
.end method

.method protected zzx()I
    .locals 8

    invoke-super {p0}, Lcom/google/android/gms/internal/zzapp;->zzx()I

    move-result v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzve:[Ljava/lang/String;

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    array-length v1, v1

    if-lez v1, :cond_2

    const/4 v1, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_0
    iget-object v5, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzve:[Ljava/lang/String;

    array-length v6, v5

    if-ge v1, v6, :cond_1

    aget-object v5, v5, v1

    if-eqz v5, :cond_0

    add-int/lit8 v4, v4, 0x1

    invoke-static {v5}, Lcom/google/android/gms/internal/zzapo;->zztx(Ljava/lang/String;)I

    move-result v5

    add-int/2addr v3, v5

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    add-int/2addr v0, v3

    mul-int/lit8 v4, v4, 0x1

    add-int/2addr v0, v4

    :cond_2
    iget-object v1, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvf:[Lcom/google/android/gms/internal/zzai$zza;

    const/4 v3, 0x2

    if-eqz v1, :cond_5

    array-length v1, v1

    if-lez v1, :cond_5

    move v1, v0

    const/4 v0, 0x0

    :goto_1
    iget-object v4, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvf:[Lcom/google/android/gms/internal/zzai$zza;

    array-length v5, v4

    if-ge v0, v5, :cond_4

    aget-object v4, v4, v0

    if-eqz v4, :cond_3

    invoke-static {v3, v4}, Lcom/google/android/gms/internal/zzapo;->zzc(ILcom/google/android/gms/internal/zzapv;)I

    move-result v4

    add-int/2addr v1, v4

    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_4
    move v0, v1

    :cond_5
    iget-object v1, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvg:[Lcom/google/android/gms/internal/zzah$zze;

    if-eqz v1, :cond_8

    array-length v1, v1

    if-lez v1, :cond_8

    move v1, v0

    const/4 v0, 0x0

    :goto_2
    iget-object v4, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvg:[Lcom/google/android/gms/internal/zzah$zze;

    array-length v5, v4

    if-ge v0, v5, :cond_7

    aget-object v4, v4, v0

    if-eqz v4, :cond_6

    const/4 v5, 0x3

    invoke-static {v5, v4}, Lcom/google/android/gms/internal/zzapo;->zzc(ILcom/google/android/gms/internal/zzapv;)I

    move-result v4

    add-int/2addr v1, v4

    :cond_6
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_7
    move v0, v1

    :cond_8
    iget-object v1, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvh:[Lcom/google/android/gms/internal/zzah$zzb;

    if-eqz v1, :cond_b

    array-length v1, v1

    if-lez v1, :cond_b

    move v1, v0

    const/4 v0, 0x0

    :goto_3
    iget-object v4, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvh:[Lcom/google/android/gms/internal/zzah$zzb;

    array-length v5, v4

    if-ge v0, v5, :cond_a

    aget-object v4, v4, v0

    if-eqz v4, :cond_9

    const/4 v5, 0x4

    invoke-static {v5, v4}, Lcom/google/android/gms/internal/zzapo;->zzc(ILcom/google/android/gms/internal/zzapv;)I

    move-result v4

    add-int/2addr v1, v4

    :cond_9
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    :cond_a
    move v0, v1

    :cond_b
    iget-object v1, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvi:[Lcom/google/android/gms/internal/zzah$zzb;

    if-eqz v1, :cond_e

    array-length v1, v1

    if-lez v1, :cond_e

    move v1, v0

    const/4 v0, 0x0

    :goto_4
    iget-object v4, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvi:[Lcom/google/android/gms/internal/zzah$zzb;

    array-length v5, v4

    if-ge v0, v5, :cond_d

    aget-object v4, v4, v0

    if-eqz v4, :cond_c

    const/4 v5, 0x5

    invoke-static {v5, v4}, Lcom/google/android/gms/internal/zzapo;->zzc(ILcom/google/android/gms/internal/zzapv;)I

    move-result v4

    add-int/2addr v1, v4

    :cond_c
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    :cond_d
    move v0, v1

    :cond_e
    iget-object v1, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvj:[Lcom/google/android/gms/internal/zzah$zzb;

    if-eqz v1, :cond_11

    array-length v1, v1

    if-lez v1, :cond_11

    move v1, v0

    const/4 v0, 0x0

    :goto_5
    iget-object v4, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvj:[Lcom/google/android/gms/internal/zzah$zzb;

    array-length v5, v4

    if-ge v0, v5, :cond_10

    aget-object v4, v4, v0

    if-eqz v4, :cond_f

    const/4 v5, 0x6

    invoke-static {v5, v4}, Lcom/google/android/gms/internal/zzapo;->zzc(ILcom/google/android/gms/internal/zzapv;)I

    move-result v4

    add-int/2addr v1, v4

    :cond_f
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    :cond_10
    move v0, v1

    :cond_11
    iget-object v1, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvk:[Lcom/google/android/gms/internal/zzah$zzg;

    if-eqz v1, :cond_14

    array-length v1, v1

    if-lez v1, :cond_14

    move v1, v0

    const/4 v0, 0x0

    :goto_6
    iget-object v4, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvk:[Lcom/google/android/gms/internal/zzah$zzg;

    array-length v5, v4

    if-ge v0, v5, :cond_13

    aget-object v4, v4, v0

    if-eqz v4, :cond_12

    const/4 v5, 0x7

    invoke-static {v5, v4}, Lcom/google/android/gms/internal/zzapo;->zzc(ILcom/google/android/gms/internal/zzapv;)I

    move-result v4

    add-int/2addr v1, v4

    :cond_12
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    :cond_13
    move v0, v1

    :cond_14
    iget-object v1, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvl:Ljava/lang/String;

    const-string v4, ""

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_15

    const/16 v1, 0x9

    iget-object v5, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvl:Ljava/lang/String;

    invoke-static {v1, v5}, Lcom/google/android/gms/internal/zzapo;->zzs(ILjava/lang/String;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_15
    iget-object v1, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvm:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_16

    const/16 v1, 0xa

    iget-object v5, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvm:Ljava/lang/String;

    invoke-static {v1, v5}, Lcom/google/android/gms/internal/zzapo;->zzs(ILjava/lang/String;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_16
    iget-object v1, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvn:Ljava/lang/String;

    const-string v5, "0"

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    const/16 v1, 0xc

    iget-object v5, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvn:Ljava/lang/String;

    invoke-static {v1, v5}, Lcom/google/android/gms/internal/zzapo;->zzs(ILjava/lang/String;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_17
    iget-object v1, p0, Lcom/google/android/gms/internal/zzah$zzf;->version:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_18

    const/16 v1, 0xd

    iget-object v4, p0, Lcom/google/android/gms/internal/zzah$zzf;->version:Ljava/lang/String;

    invoke-static {v1, v4}, Lcom/google/android/gms/internal/zzapo;->zzs(ILjava/lang/String;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_18
    iget-object v1, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvo:Lcom/google/android/gms/internal/zzah$zza;

    if-eqz v1, :cond_19

    const/16 v4, 0xe

    invoke-static {v4, v1}, Lcom/google/android/gms/internal/zzapo;->zzc(ILcom/google/android/gms/internal/zzapv;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_19
    iget v1, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvp:F

    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v1

    const/4 v4, 0x0

    invoke-static {v4}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v4

    if-eq v1, v4, :cond_1a

    const/16 v1, 0xf

    iget v4, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvp:F

    invoke-static {v1, v4}, Lcom/google/android/gms/internal/zzapo;->zzd(IF)I

    move-result v1

    add-int/2addr v0, v1

    :cond_1a
    iget-object v1, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvr:[Ljava/lang/String;

    if-eqz v1, :cond_1d

    array-length v1, v1

    if-lez v1, :cond_1d

    const/4 v1, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    :goto_7
    iget-object v6, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvr:[Ljava/lang/String;

    array-length v7, v6

    if-ge v1, v7, :cond_1c

    aget-object v6, v6, v1

    if-eqz v6, :cond_1b

    add-int/lit8 v5, v5, 0x1

    invoke-static {v6}, Lcom/google/android/gms/internal/zzapo;->zztx(Ljava/lang/String;)I

    move-result v6

    add-int/2addr v4, v6

    :cond_1b
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    :cond_1c
    add-int/2addr v0, v4

    mul-int/lit8 v5, v5, 0x2

    add-int/2addr v0, v5

    :cond_1d
    iget v1, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvs:I

    if-eqz v1, :cond_1e

    const/16 v4, 0x11

    invoke-static {v4, v1}, Lcom/google/android/gms/internal/zzapo;->zzag(II)I

    move-result v1

    add-int/2addr v0, v1

    :cond_1e
    iget-boolean v1, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvq:Z

    if-eqz v1, :cond_1f

    const/16 v4, 0x12

    invoke-static {v4, v1}, Lcom/google/android/gms/internal/zzapo;->zzk(IZ)I

    move-result v1

    add-int/2addr v0, v1

    :cond_1f
    iget-object v1, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvd:[Ljava/lang/String;

    if-eqz v1, :cond_22

    array-length v1, v1

    if-lez v1, :cond_22

    const/4 v1, 0x0

    const/4 v4, 0x0

    :goto_8
    iget-object v5, p0, Lcom/google/android/gms/internal/zzah$zzf;->zzvd:[Ljava/lang/String;

    array-length v6, v5

    if-ge v2, v6, :cond_21

    aget-object v5, v5, v2

    if-eqz v5, :cond_20

    add-int/lit8 v4, v4, 0x1

    invoke-static {v5}, Lcom/google/android/gms/internal/zzapo;->zztx(Ljava/lang/String;)I

    move-result v5

    add-int/2addr v1, v5

    :cond_20
    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    :cond_21
    add-int/2addr v0, v1

    mul-int/lit8 v4, v4, 0x2

    add-int/2addr v0, v4

    :cond_22
    return v0
.end method
