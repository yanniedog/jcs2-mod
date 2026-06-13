.class Lcom/google/android/gms/internal/zzgz$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzgz;->execute()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzbqd:Lcom/google/android/gms/internal/zzgz;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzgz;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzgz$1;->zzbqd:Lcom/google/android/gms/internal/zzgz;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    iget-object p1, p0, Lcom/google/android/gms/internal/zzgz$1;->zzbqd:Lcom/google/android/gms/internal/zzgz;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzgz;->createIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzfq()Lcom/google/android/gms/internal/zzkh;

    move-result-object p2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgz$1;->zzbqd:Lcom/google/android/gms/internal/zzgz;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzgz;->zza(Lcom/google/android/gms/internal/zzgz;)Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p2, v0, p1}, Lcom/google/android/gms/internal/zzkh;->zzb(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method
