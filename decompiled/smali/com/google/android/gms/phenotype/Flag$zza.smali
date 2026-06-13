.class public Lcom/google/android/gms/phenotype/Flag$zza;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/phenotype/Flag;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "zza"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lcom/google/android/gms/phenotype/Flag;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    check-cast p1, Lcom/google/android/gms/phenotype/Flag;

    check-cast p2, Lcom/google/android/gms/phenotype/Flag;

    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/phenotype/Flag$zza;->zza(Lcom/google/android/gms/phenotype/Flag;Lcom/google/android/gms/phenotype/Flag;)I

    move-result p1

    return p1
.end method

.method public zza(Lcom/google/android/gms/phenotype/Flag;Lcom/google/android/gms/phenotype/Flag;)I
    .locals 2

    iget v0, p1, Lcom/google/android/gms/phenotype/Flag;->aro:I

    iget v1, p2, Lcom/google/android/gms/phenotype/Flag;->aro:I

    if-ne v0, v1, :cond_0

    iget-object p1, p1, Lcom/google/android/gms/phenotype/Flag;->name:Ljava/lang/String;

    iget-object p2, p2, Lcom/google/android/gms/phenotype/Flag;->name:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result p1

    return p1

    :cond_0
    iget p1, p1, Lcom/google/android/gms/phenotype/Flag;->aro:I

    iget p2, p2, Lcom/google/android/gms/phenotype/Flag;->aro:I

    sub-int/2addr p1, p2

    return p1
.end method
