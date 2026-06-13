.class public Lcom/google/android/gms/internal/zzlg;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzin;
.end annotation


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final zzbgf:Lcom/google/android/gms/internal/zzlh;

.field private zzbwf:Lcom/google/android/gms/ads/internal/overlay/zzk;

.field private final zzcoi:Landroid/view/ViewGroup;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/view/ViewGroup;Lcom/google/android/gms/internal/zzlh;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/google/android/gms/internal/zzlg;-><init>(Landroid/content/Context;Landroid/view/ViewGroup;Lcom/google/android/gms/internal/zzlh;Lcom/google/android/gms/ads/internal/overlay/zzk;)V

    return-void
.end method

.method constructor <init>(Landroid/content/Context;Landroid/view/ViewGroup;Lcom/google/android/gms/internal/zzlh;Lcom/google/android/gms/ads/internal/overlay/zzk;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzlg;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzlg;->zzcoi:Landroid/view/ViewGroup;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzlg;->zzbgf:Lcom/google/android/gms/internal/zzlh;

    iput-object p4, p0, Lcom/google/android/gms/internal/zzlg;->zzbwf:Lcom/google/android/gms/ads/internal/overlay/zzk;

    return-void
.end method


# virtual methods
.method public onDestroy()V
    .locals 2

    const-string v0, "onDestroy must be called from the UI thread."

    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzab;->zzhi(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzlg;->zzbwf:Lcom/google/android/gms/ads/internal/overlay/zzk;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/overlay/zzk;->destroy()V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzlg;->zzcoi:Landroid/view/ViewGroup;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzlg;->zzbwf:Lcom/google/android/gms/ads/internal/overlay/zzk;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzlg;->zzbwf:Lcom/google/android/gms/ads/internal/overlay/zzk;

    :cond_0
    return-void
.end method

.method public onPause()V
    .locals 1

    const-string v0, "onPause must be called from the UI thread."

    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzab;->zzhi(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzlg;->zzbwf:Lcom/google/android/gms/ads/internal/overlay/zzk;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/overlay/zzk;->pause()V

    :cond_0
    return-void
.end method

.method public zza(IIIIIZ)V
    .locals 12

    move-object v0, p0

    iget-object v1, v0, Lcom/google/android/gms/internal/zzlg;->zzbwf:Lcom/google/android/gms/ads/internal/overlay/zzk;

    if-eqz v1, :cond_0

    return-void

    :cond_0
    iget-object v1, v0, Lcom/google/android/gms/internal/zzlg;->zzbgf:Lcom/google/android/gms/internal/zzlh;

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzlh;->zzus()Lcom/google/android/gms/internal/zzdj;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzdj;->zzkf()Lcom/google/android/gms/internal/zzdk;

    move-result-object v1

    iget-object v2, v0, Lcom/google/android/gms/internal/zzlg;->zzbgf:Lcom/google/android/gms/internal/zzlh;

    invoke-interface {v2}, Lcom/google/android/gms/internal/zzlh;->zzur()Lcom/google/android/gms/internal/zzdi;

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v5, "vpr"

    aput-object v5, v3, v4

    invoke-static {v1, v2, v3}, Lcom/google/android/gms/internal/zzdg;->zza(Lcom/google/android/gms/internal/zzdk;Lcom/google/android/gms/internal/zzdi;[Ljava/lang/String;)Z

    iget-object v1, v0, Lcom/google/android/gms/internal/zzlg;->zzbgf:Lcom/google/android/gms/internal/zzlh;

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzlh;->zzus()Lcom/google/android/gms/internal/zzdj;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzdj;->zzkf()Lcom/google/android/gms/internal/zzdk;

    move-result-object v1

    invoke-static {v1}, Lcom/google/android/gms/internal/zzdg;->zzb(Lcom/google/android/gms/internal/zzdk;)Lcom/google/android/gms/internal/zzdi;

    move-result-object v11

    new-instance v1, Lcom/google/android/gms/ads/internal/overlay/zzk;

    iget-object v6, v0, Lcom/google/android/gms/internal/zzlg;->mContext:Landroid/content/Context;

    iget-object v7, v0, Lcom/google/android/gms/internal/zzlg;->zzbgf:Lcom/google/android/gms/internal/zzlh;

    invoke-interface {v7}, Lcom/google/android/gms/internal/zzlh;->zzus()Lcom/google/android/gms/internal/zzdj;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzdj;->zzkf()Lcom/google/android/gms/internal/zzdk;

    move-result-object v10

    move-object v5, v1

    move/from16 v8, p5

    move/from16 v9, p6

    invoke-direct/range {v5 .. v11}, Lcom/google/android/gms/ads/internal/overlay/zzk;-><init>(Landroid/content/Context;Lcom/google/android/gms/internal/zzlh;IZLcom/google/android/gms/internal/zzdk;Lcom/google/android/gms/internal/zzdi;)V

    iput-object v1, v0, Lcom/google/android/gms/internal/zzlg;->zzbwf:Lcom/google/android/gms/ads/internal/overlay/zzk;

    iget-object v1, v0, Lcom/google/android/gms/internal/zzlg;->zzcoi:Landroid/view/ViewGroup;

    iget-object v2, v0, Lcom/google/android/gms/internal/zzlg;->zzbwf:Lcom/google/android/gms/ads/internal/overlay/zzk;

    new-instance v3, Landroid/view/ViewGroup$LayoutParams;

    const/4 v5, -0x1

    invoke-direct {v3, v5, v5}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v2, v4, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    iget-object v1, v0, Lcom/google/android/gms/internal/zzlg;->zzbwf:Lcom/google/android/gms/ads/internal/overlay/zzk;

    move v2, p1

    move v3, p2

    move v5, p3

    move/from16 v6, p4

    invoke-virtual {v1, p1, p2, p3, v6}, Lcom/google/android/gms/ads/internal/overlay/zzk;->zzd(IIII)V

    iget-object v1, v0, Lcom/google/android/gms/internal/zzlg;->zzbgf:Lcom/google/android/gms/internal/zzlh;

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzlh;->zzuj()Lcom/google/android/gms/internal/zzli;

    move-result-object v1

    invoke-virtual {v1, v4}, Lcom/google/android/gms/internal/zzli;->zzak(Z)V

    return-void
.end method

.method public zze(IIII)V
    .locals 1

    const-string v0, "The underlay may only be modified from the UI thread."

    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzab;->zzhi(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzlg;->zzbwf:Lcom/google/android/gms/ads/internal/overlay/zzk;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/google/android/gms/ads/internal/overlay/zzk;->zzd(IIII)V

    :cond_0
    return-void
.end method

.method public zzub()Lcom/google/android/gms/ads/internal/overlay/zzk;
    .locals 1

    const-string v0, "getAdVideoUnderlay must be called from the UI thread."

    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzab;->zzhi(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzlg;->zzbwf:Lcom/google/android/gms/ads/internal/overlay/zzk;

    return-object v0
.end method
