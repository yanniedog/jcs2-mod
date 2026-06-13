.class public Lcom/google/android/gms/internal/zzia;
.super Lcom/google/android/gms/internal/zzhy;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzin;
.end annotation


# instance fields
.field private zzbyg:Lcom/google/android/gms/internal/zzhz;


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/google/android/gms/internal/zzju$zza;Lcom/google/android/gms/internal/zzlh;Lcom/google/android/gms/internal/zzic$zza;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/google/android/gms/internal/zzhy;-><init>(Landroid/content/Context;Lcom/google/android/gms/internal/zzju$zza;Lcom/google/android/gms/internal/zzlh;Lcom/google/android/gms/internal/zzic$zza;)V

    return-void
.end method


# virtual methods
.method protected zzpw()V
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/zzia;->zzbgf:Lcom/google/android/gms/internal/zzlh;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzlh;->zzdn()Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    move-result-object v0

    iget-boolean v1, v0, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->zzaus:Z

    if-eqz v1, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzia;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v1, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    iget v0, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    goto :goto_0

    :cond_0
    iget v1, v0, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->widthPixels:I

    iget v0, v0, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->heightPixels:I

    :goto_0
    new-instance v2, Lcom/google/android/gms/internal/zzhz;

    iget-object v3, p0, Lcom/google/android/gms/internal/zzia;->zzbgf:Lcom/google/android/gms/internal/zzlh;

    invoke-direct {v2, p0, v3, v1, v0}, Lcom/google/android/gms/internal/zzhz;-><init>(Lcom/google/android/gms/internal/zzli$zza;Lcom/google/android/gms/internal/zzlh;II)V

    iput-object v2, p0, Lcom/google/android/gms/internal/zzia;->zzbyg:Lcom/google/android/gms/internal/zzhz;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzia;->zzbgf:Lcom/google/android/gms/internal/zzlh;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzlh;->zzuj()Lcom/google/android/gms/internal/zzli;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/google/android/gms/internal/zzli;->zza(Lcom/google/android/gms/internal/zzli$zza;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzia;->zzbyg:Lcom/google/android/gms/internal/zzhz;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzia;->zzbxs:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzhz;->zza(Lcom/google/android/gms/ads/internal/request/AdResponseParcel;)V

    return-void
.end method

.method protected zzpx()I
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzia;->zzbyg:Lcom/google/android/gms/internal/zzhz;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzhz;->zzqb()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "Ad-Network indicated no fill with passback URL."

    invoke-static {v0}, Lcom/google/android/gms/internal/zzkd;->zzcv(Ljava/lang/String;)V

    const/4 v0, 0x3

    return v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzia;->zzbyg:Lcom/google/android/gms/internal/zzhz;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzhz;->zzqc()Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x2

    return v0

    :cond_1
    const/4 v0, -0x2

    return v0
.end method
