.class public final Lcom/google/android/gms/internal/zzhz$zza;
.super Landroid/os/AsyncTask;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzhz;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x14
    name = "zza"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field private final zzbyd:Landroid/webkit/WebView;

.field private zzbye:Landroid/graphics/Bitmap;

.field final synthetic zzbyf:Lcom/google/android/gms/internal/zzhz;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zzhz;Landroid/webkit/WebView;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzhz$zza;->zzbyf:Lcom/google/android/gms/internal/zzhz;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    iput-object p2, p0, Lcom/google/android/gms/internal/zzhz$zza;->zzbyd:Landroid/webkit/WebView;

    return-void
.end method


# virtual methods
.method protected synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzhz$zza;->zza([Ljava/lang/Void;)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method

.method protected synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzhz$zza;->zza(Ljava/lang/Boolean;)V

    return-void
.end method

.method protected declared-synchronized onPreExecute()V
    .locals 4

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzhz$zza;->zzbyf:Lcom/google/android/gms/internal/zzhz;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzhz;->zza(Lcom/google/android/gms/internal/zzhz;)I

    move-result v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzhz$zza;->zzbyf:Lcom/google/android/gms/internal/zzhz;

    invoke-static {v1}, Lcom/google/android/gms/internal/zzhz;->zzb(Lcom/google/android/gms/internal/zzhz;)I

    move-result v1

    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v1, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzhz$zza;->zzbye:Landroid/graphics/Bitmap;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzhz$zza;->zzbyd:Landroid/webkit/WebView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setVisibility(I)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzhz$zza;->zzbyd:Landroid/webkit/WebView;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzhz$zza;->zzbyf:Lcom/google/android/gms/internal/zzhz;

    invoke-static {v2}, Lcom/google/android/gms/internal/zzhz;->zza(Lcom/google/android/gms/internal/zzhz;)I

    move-result v2

    invoke-static {v2, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v2

    iget-object v3, p0, Lcom/google/android/gms/internal/zzhz$zza;->zzbyf:Lcom/google/android/gms/internal/zzhz;

    invoke-static {v3}, Lcom/google/android/gms/internal/zzhz;->zzb(Lcom/google/android/gms/internal/zzhz;)I

    move-result v3

    invoke-static {v3, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v3

    invoke-virtual {v0, v2, v3}, Landroid/webkit/WebView;->measure(II)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzhz$zza;->zzbyd:Landroid/webkit/WebView;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzhz$zza;->zzbyf:Lcom/google/android/gms/internal/zzhz;

    invoke-static {v2}, Lcom/google/android/gms/internal/zzhz;->zza(Lcom/google/android/gms/internal/zzhz;)I

    move-result v2

    iget-object v3, p0, Lcom/google/android/gms/internal/zzhz$zza;->zzbyf:Lcom/google/android/gms/internal/zzhz;

    invoke-static {v3}, Lcom/google/android/gms/internal/zzhz;->zzb(Lcom/google/android/gms/internal/zzhz;)I

    move-result v3

    invoke-virtual {v0, v1, v1, v2, v3}, Landroid/webkit/WebView;->layout(IIII)V

    new-instance v0, Landroid/graphics/Canvas;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzhz$zza;->zzbye:Landroid/graphics/Bitmap;

    invoke-direct {v0, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    iget-object v1, p0, Lcom/google/android/gms/internal/zzhz$zza;->zzbyd:Landroid/webkit/WebView;

    invoke-virtual {v1, v0}, Landroid/webkit/WebView;->draw(Landroid/graphics/Canvas;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzhz$zza;->zzbyd:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->invalidate()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected varargs declared-synchronized zza([Ljava/lang/Void;)Ljava/lang/Boolean;
    .locals 8

    monitor-enter p0

    :try_start_0
    iget-object p1, p0, Lcom/google/android/gms/internal/zzhz$zza;->zzbye:Landroid/graphics/Bitmap;

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzhz$zza;->zzbye:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    const/4 v1, 0x0

    if-eqz p1, :cond_5

    if-nez v0, :cond_0

    goto :goto_2

    :cond_0
    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v2, p1, :cond_3

    move v4, v3

    const/4 v3, 0x0

    :goto_1
    if-ge v3, v0, :cond_2

    iget-object v5, p0, Lcom/google/android/gms/internal/zzhz$zza;->zzbye:Landroid/graphics/Bitmap;

    invoke-virtual {v5, v2, v3}, Landroid/graphics/Bitmap;->getPixel(II)I

    move-result v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v5, :cond_1

    add-int/lit8 v4, v4, 0x1

    :cond_1
    add-int/lit8 v3, v3, 0xa

    goto :goto_1

    :cond_2
    add-int/lit8 v2, v2, 0xa

    move v3, v4

    goto :goto_0

    :cond_3
    int-to-double v2, v3

    mul-int p1, p1, v0

    int-to-double v4, p1

    const-wide/high16 v6, 0x4059000000000000L    # 100.0

    invoke-static {v4, v5}, Ljava/lang/Double;->isNaN(D)Z

    div-double/2addr v4, v6

    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    div-double/2addr v2, v4

    const-wide v4, 0x3fb999999999999aL    # 0.1

    cmpl-double p1, v2, v4

    if-lez p1, :cond_4

    const/4 v1, 0x1

    :cond_4
    :try_start_1
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object p1

    :cond_5
    :goto_2
    :try_start_2
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    goto :goto_4

    :goto_3
    throw p1

    :goto_4
    goto :goto_3
.end method

.method protected zza(Ljava/lang/Boolean;)V
    .locals 5

    iget-object v0, p0, Lcom/google/android/gms/internal/zzhz$zza;->zzbyf:Lcom/google/android/gms/internal/zzhz;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzhz;->zzc(Lcom/google/android/gms/internal/zzhz;)J

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzhz$zza;->zzbyf:Lcom/google/android/gms/internal/zzhz;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzhz;->zzqb()Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzhz$zza;->zzbyf:Lcom/google/android/gms/internal/zzhz;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzhz;->zzd(Lcom/google/android/gms/internal/zzhz;)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-gtz v4, :cond_0

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/google/android/gms/internal/zzhz$zza;->zzbyf:Lcom/google/android/gms/internal/zzhz;

    invoke-static {p1}, Lcom/google/android/gms/internal/zzhz;->zzd(Lcom/google/android/gms/internal/zzhz;)J

    move-result-wide v0

    cmp-long p1, v0, v2

    if-lez p1, :cond_3

    const/4 p1, 0x2

    invoke-static {p1}, Lcom/google/android/gms/internal/zzkd;->zzaz(I)Z

    move-result p1

    if-eqz p1, :cond_1

    const-string p1, "Ad not detected, scheduling another run."

    invoke-static {p1}, Lcom/google/android/gms/internal/zzkd;->zzcv(Ljava/lang/String;)V

    :cond_1
    iget-object p1, p0, Lcom/google/android/gms/internal/zzhz$zza;->zzbyf:Lcom/google/android/gms/internal/zzhz;

    invoke-static {p1}, Lcom/google/android/gms/internal/zzhz;->zzg(Lcom/google/android/gms/internal/zzhz;)Landroid/os/Handler;

    move-result-object p1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzhz$zza;->zzbyf:Lcom/google/android/gms/internal/zzhz;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzhz;->zzf(Lcom/google/android/gms/internal/zzhz;)J

    move-result-wide v1

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_1

    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzhz$zza;->zzbyf:Lcom/google/android/gms/internal/zzhz;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, v0, Lcom/google/android/gms/internal/zzhz;->zzbyc:Z

    iget-object p1, p0, Lcom/google/android/gms/internal/zzhz$zza;->zzbyf:Lcom/google/android/gms/internal/zzhz;

    invoke-static {p1}, Lcom/google/android/gms/internal/zzhz;->zze(Lcom/google/android/gms/internal/zzhz;)Lcom/google/android/gms/internal/zzli$zza;

    move-result-object p1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzhz$zza;->zzbyf:Lcom/google/android/gms/internal/zzhz;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzhz;->zzbgf:Lcom/google/android/gms/internal/zzlh;

    const/4 v1, 0x1

    invoke-interface {p1, v0, v1}, Lcom/google/android/gms/internal/zzli$zza;->zza(Lcom/google/android/gms/internal/zzlh;Z)V

    :cond_3
    :goto_1
    return-void
.end method
