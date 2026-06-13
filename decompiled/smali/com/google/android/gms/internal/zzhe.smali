.class public Lcom/google/android/gms/internal/zzhe;
.super Lcom/google/android/gms/internal/zzhf;

# interfaces
.implements Lcom/google/android/gms/internal/zzep;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzin;
.end annotation


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final zzaqm:Landroid/view/WindowManager;

.field private final zzbgf:Lcom/google/android/gms/internal/zzlh;

.field private final zzbrc:Lcom/google/android/gms/internal/zzcu;

.field zzbrd:Landroid/util/DisplayMetrics;

.field private zzbre:F

.field zzbrf:I

.field zzbrg:I

.field private zzbrh:I

.field zzbri:I

.field zzbrj:I

.field zzbrk:I

.field zzbrl:I


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zzlh;Landroid/content/Context;Lcom/google/android/gms/internal/zzcu;)V
    .locals 1

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzhf;-><init>(Lcom/google/android/gms/internal/zzlh;)V

    const/4 v0, -0x1

    iput v0, p0, Lcom/google/android/gms/internal/zzhe;->zzbrf:I

    iput v0, p0, Lcom/google/android/gms/internal/zzhe;->zzbrg:I

    iput v0, p0, Lcom/google/android/gms/internal/zzhe;->zzbri:I

    iput v0, p0, Lcom/google/android/gms/internal/zzhe;->zzbrj:I

    iput v0, p0, Lcom/google/android/gms/internal/zzhe;->zzbrk:I

    iput v0, p0, Lcom/google/android/gms/internal/zzhe;->zzbrl:I

    iput-object p1, p0, Lcom/google/android/gms/internal/zzhe;->zzbgf:Lcom/google/android/gms/internal/zzlh;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzhe;->mContext:Landroid/content/Context;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzhe;->zzbrc:Lcom/google/android/gms/internal/zzcu;

    const-string p1, "window"

    invoke-virtual {p2, p1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/WindowManager;

    iput-object p1, p0, Lcom/google/android/gms/internal/zzhe;->zzaqm:Landroid/view/WindowManager;

    return-void
.end method

.method private zzmz()V
    .locals 2

    new-instance v0, Landroid/util/DisplayMetrics;

    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzhe;->zzbrd:Landroid/util/DisplayMetrics;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzhe;->zzaqm:Landroid/view/WindowManager;

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzhe;->zzbrd:Landroid/util/DisplayMetrics;

    invoke-virtual {v0, v1}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    iget-object v1, p0, Lcom/google/android/gms/internal/zzhe;->zzbrd:Landroid/util/DisplayMetrics;

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    iput v1, p0, Lcom/google/android/gms/internal/zzhe;->zzbre:F

    invoke-virtual {v0}, Landroid/view/Display;->getRotation()I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/internal/zzhe;->zzbrh:I

    return-void
.end method

.method private zzne()V
    .locals 5

    const/4 v0, 0x2

    new-array v0, v0, [I

    iget-object v1, p0, Lcom/google/android/gms/internal/zzhe;->zzbgf:Lcom/google/android/gms/internal/zzlh;

    invoke-interface {v1, v0}, Lcom/google/android/gms/internal/zzlh;->getLocationOnScreen([I)V

    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzm;->zziw()Lcom/google/android/gms/ads/internal/util/client/zza;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/internal/zzhe;->mContext:Landroid/content/Context;

    const/4 v3, 0x0

    aget v3, v0, v3

    invoke-virtual {v1, v2, v3}, Lcom/google/android/gms/ads/internal/util/client/zza;->zzb(Landroid/content/Context;I)I

    move-result v1

    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzm;->zziw()Lcom/google/android/gms/ads/internal/util/client/zza;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/gms/internal/zzhe;->mContext:Landroid/content/Context;

    const/4 v4, 0x1

    aget v0, v0, v4

    invoke-virtual {v2, v3, v0}, Lcom/google/android/gms/ads/internal/util/client/zza;->zzb(Landroid/content/Context;I)I

    move-result v0

    invoke-virtual {p0, v1, v0}, Lcom/google/android/gms/internal/zzhe;->zze(II)V

    return-void
.end method

.method private zznh()Lcom/google/android/gms/internal/zzhd;
    .locals 2

    new-instance v0, Lcom/google/android/gms/internal/zzhd$zza;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzhd$zza;-><init>()V

    iget-object v1, p0, Lcom/google/android/gms/internal/zzhe;->zzbrc:Lcom/google/android/gms/internal/zzcu;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzcu;->zzjp()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzhd$zza;->zzu(Z)Lcom/google/android/gms/internal/zzhd$zza;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzhe;->zzbrc:Lcom/google/android/gms/internal/zzcu;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzcu;->zzjq()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzhd$zza;->zzt(Z)Lcom/google/android/gms/internal/zzhd$zza;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzhe;->zzbrc:Lcom/google/android/gms/internal/zzcu;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzcu;->zzju()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzhd$zza;->zzv(Z)Lcom/google/android/gms/internal/zzhd$zza;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzhe;->zzbrc:Lcom/google/android/gms/internal/zzcu;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzcu;->zzjr()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzhd$zza;->zzw(Z)Lcom/google/android/gms/internal/zzhd$zza;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzhe;->zzbrc:Lcom/google/android/gms/internal/zzcu;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzcu;->zzjs()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzhd$zza;->zzx(Z)Lcom/google/android/gms/internal/zzhd$zza;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzhd$zza;->zzmy()Lcom/google/android/gms/internal/zzhd;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/internal/zzlh;Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzlh;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzhe;->zznc()V

    return-void
.end method

.method public zze(II)V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzhe;->mContext:Landroid/content/Context;

    instance-of v0, v0, Landroid/app/Activity;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzfq()Lcom/google/android/gms/internal/zzkh;

    move-result-object v0

    iget-object v2, p0, Lcom/google/android/gms/internal/zzhe;->mContext:Landroid/content/Context;

    check-cast v2, Landroid/app/Activity;

    invoke-virtual {v0, v2}, Lcom/google/android/gms/internal/zzkh;->zzk(Landroid/app/Activity;)[I

    move-result-object v0

    aget v1, v0, v1

    :cond_0
    sub-int v0, p2, v1

    iget v1, p0, Lcom/google/android/gms/internal/zzhe;->zzbrk:I

    iget v2, p0, Lcom/google/android/gms/internal/zzhe;->zzbrl:I

    invoke-virtual {p0, p1, v0, v1, v2}, Lcom/google/android/gms/internal/zzhe;->zzc(IIII)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzhe;->zzbgf:Lcom/google/android/gms/internal/zzlh;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzlh;->zzuj()Lcom/google/android/gms/internal/zzli;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/google/android/gms/internal/zzli;->zzd(II)V

    return-void
.end method

.method zzna()V
    .locals 4

    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzm;->zziw()Lcom/google/android/gms/ads/internal/util/client/zza;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzhe;->zzbrd:Landroid/util/DisplayMetrics;

    iget v2, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/ads/internal/util/client/zza;->zzb(Landroid/util/DisplayMetrics;I)I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/internal/zzhe;->zzbrf:I

    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzm;->zziw()Lcom/google/android/gms/ads/internal/util/client/zza;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzhe;->zzbrd:Landroid/util/DisplayMetrics;

    iget v2, v1, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/ads/internal/util/client/zza;->zzb(Landroid/util/DisplayMetrics;I)I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/internal/zzhe;->zzbrg:I

    iget-object v0, p0, Lcom/google/android/gms/internal/zzhe;->zzbgf:Lcom/google/android/gms/internal/zzlh;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzlh;->zzue()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzfq()Lcom/google/android/gms/internal/zzkh;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/google/android/gms/internal/zzkh;->zzh(Landroid/app/Activity;)[I

    move-result-object v0

    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzm;->zziw()Lcom/google/android/gms/ads/internal/util/client/zza;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/internal/zzhe;->zzbrd:Landroid/util/DisplayMetrics;

    const/4 v3, 0x0

    aget v3, v0, v3

    invoke-virtual {v1, v2, v3}, Lcom/google/android/gms/ads/internal/util/client/zza;->zzb(Landroid/util/DisplayMetrics;I)I

    move-result v1

    iput v1, p0, Lcom/google/android/gms/internal/zzhe;->zzbri:I

    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzm;->zziw()Lcom/google/android/gms/ads/internal/util/client/zza;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/internal/zzhe;->zzbrd:Landroid/util/DisplayMetrics;

    const/4 v3, 0x1

    aget v0, v0, v3

    invoke-virtual {v1, v2, v0}, Lcom/google/android/gms/ads/internal/util/client/zza;->zzb(Landroid/util/DisplayMetrics;I)I

    move-result v0

    goto :goto_1

    :cond_1
    :goto_0
    iget v0, p0, Lcom/google/android/gms/internal/zzhe;->zzbrf:I

    iput v0, p0, Lcom/google/android/gms/internal/zzhe;->zzbri:I

    iget v0, p0, Lcom/google/android/gms/internal/zzhe;->zzbrg:I

    :goto_1
    iput v0, p0, Lcom/google/android/gms/internal/zzhe;->zzbrj:I

    return-void
.end method

.method zznb()V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzhe;->zzbgf:Lcom/google/android/gms/internal/zzlh;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzlh;->zzdn()Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    move-result-object v0

    iget-boolean v0, v0, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->zzaus:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/google/android/gms/internal/zzhe;->zzbrf:I

    iput v0, p0, Lcom/google/android/gms/internal/zzhe;->zzbrk:I

    iget v0, p0, Lcom/google/android/gms/internal/zzhe;->zzbrg:I

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzhe;->zzbgf:Lcom/google/android/gms/internal/zzlh;

    const/4 v1, 0x0

    invoke-interface {v0, v1, v1}, Lcom/google/android/gms/internal/zzlh;->measure(II)V

    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzm;->zziw()Lcom/google/android/gms/ads/internal/util/client/zza;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzhe;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzhe;->zzbgf:Lcom/google/android/gms/internal/zzlh;

    invoke-interface {v2}, Lcom/google/android/gms/internal/zzlh;->getMeasuredWidth()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/ads/internal/util/client/zza;->zzb(Landroid/content/Context;I)I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/internal/zzhe;->zzbrk:I

    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzm;->zziw()Lcom/google/android/gms/ads/internal/util/client/zza;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzhe;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzhe;->zzbgf:Lcom/google/android/gms/internal/zzlh;

    invoke-interface {v2}, Lcom/google/android/gms/internal/zzlh;->getMeasuredHeight()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/ads/internal/util/client/zza;->zzb(Landroid/content/Context;I)I

    move-result v0

    :goto_0
    iput v0, p0, Lcom/google/android/gms/internal/zzhe;->zzbrl:I

    return-void
.end method

.method public zznc()V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzhe;->zzmz()V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzhe;->zzna()V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzhe;->zznb()V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzhe;->zznf()V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzhe;->zzng()V

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzhe;->zzne()V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzhe;->zznd()V

    return-void
.end method

.method zznd()V
    .locals 1

    const/4 v0, 0x2

    invoke-static {v0}, Lcom/google/android/gms/internal/zzkd;->zzaz(I)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "Dispatching Ready Event."

    invoke-static {v0}, Lcom/google/android/gms/internal/zzkd;->zzcw(Ljava/lang/String;)V

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzhe;->zzbgf:Lcom/google/android/gms/internal/zzlh;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzlh;->zzum()Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    move-result-object v0

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;->zzcs:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzhe;->zzbu(Ljava/lang/String;)V

    return-void
.end method

.method zznf()V
    .locals 7

    iget v1, p0, Lcom/google/android/gms/internal/zzhe;->zzbrf:I

    iget v2, p0, Lcom/google/android/gms/internal/zzhe;->zzbrg:I

    iget v3, p0, Lcom/google/android/gms/internal/zzhe;->zzbri:I

    iget v4, p0, Lcom/google/android/gms/internal/zzhe;->zzbrj:I

    iget v5, p0, Lcom/google/android/gms/internal/zzhe;->zzbre:F

    iget v6, p0, Lcom/google/android/gms/internal/zzhe;->zzbrh:I

    move-object v0, p0

    invoke-virtual/range {v0 .. v6}, Lcom/google/android/gms/internal/zzhe;->zza(IIIIFI)V

    return-void
.end method

.method zzng()V
    .locals 3

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzhe;->zznh()Lcom/google/android/gms/internal/zzhd;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzhe;->zzbgf:Lcom/google/android/gms/internal/zzlh;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzhd;->toJson()Lorg/json/JSONObject;

    move-result-object v0

    const-string v2, "onDeviceFeaturesReceived"

    invoke-interface {v1, v2, v0}, Lcom/google/android/gms/internal/zzlh;->zzb(Ljava/lang/String;Lorg/json/JSONObject;)V

    return-void
.end method
