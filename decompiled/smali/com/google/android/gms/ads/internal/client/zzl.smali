.class public Lcom/google/android/gms/ads/internal/client/zzl;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzin;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/ads/internal/client/zzl$zza;
    }
.end annotation


# instance fields
.field private final zzail:Ljava/lang/Object;

.field private zzauz:Lcom/google/android/gms/ads/internal/client/zzx;

.field private final zzava:Lcom/google/android/gms/ads/internal/client/zze;

.field private final zzavb:Lcom/google/android/gms/ads/internal/client/zzd;

.field private final zzavc:Lcom/google/android/gms/ads/internal/client/zzai;

.field private final zzavd:Lcom/google/android/gms/internal/zzef;

.field private final zzave:Lcom/google/android/gms/ads/internal/reward/client/zzf;

.field private final zzavf:Lcom/google/android/gms/internal/zzhu;

.field private final zzavg:Lcom/google/android/gms/internal/zzhh;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/ads/internal/client/zze;Lcom/google/android/gms/ads/internal/client/zzd;Lcom/google/android/gms/ads/internal/client/zzai;Lcom/google/android/gms/internal/zzef;Lcom/google/android/gms/ads/internal/reward/client/zzf;Lcom/google/android/gms/internal/zzhu;Lcom/google/android/gms/internal/zzhh;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/client/zzl;->zzail:Ljava/lang/Object;

    iput-object p1, p0, Lcom/google/android/gms/ads/internal/client/zzl;->zzava:Lcom/google/android/gms/ads/internal/client/zze;

    iput-object p2, p0, Lcom/google/android/gms/ads/internal/client/zzl;->zzavb:Lcom/google/android/gms/ads/internal/client/zzd;

    iput-object p3, p0, Lcom/google/android/gms/ads/internal/client/zzl;->zzavc:Lcom/google/android/gms/ads/internal/client/zzai;

    iput-object p4, p0, Lcom/google/android/gms/ads/internal/client/zzl;->zzavd:Lcom/google/android/gms/internal/zzef;

    iput-object p5, p0, Lcom/google/android/gms/ads/internal/client/zzl;->zzave:Lcom/google/android/gms/ads/internal/reward/client/zzf;

    iput-object p6, p0, Lcom/google/android/gms/ads/internal/client/zzl;->zzavf:Lcom/google/android/gms/internal/zzhu;

    iput-object p7, p0, Lcom/google/android/gms/ads/internal/client/zzl;->zzavg:Lcom/google/android/gms/internal/zzhh;

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/ads/internal/client/zzl;)Lcom/google/android/gms/ads/internal/client/zzx;
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/ads/internal/client/zzl;->zzil()Lcom/google/android/gms/ads/internal/client/zzx;

    move-result-object p0

    return-object p0
.end method

.method private zza(Landroid/content/Context;ZLcom/google/android/gms/ads/internal/client/zzl$zza;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/content/Context;",
            "Z",
            "Lcom/google/android/gms/ads/internal/client/zzl$zza<",
            "TT;>;)TT;"
        }
    .end annotation

    if-nez p2, :cond_0

    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzm;->zziw()Lcom/google/android/gms/ads/internal/util/client/zza;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/android/gms/ads/internal/util/client/zza;->zzar(Landroid/content/Context;)Z

    move-result p1

    if-nez p1, :cond_0

    const-string p1, "Google Play Services is not available"

    invoke-static {p1}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzcv(Ljava/lang/String;)V

    const/4 p2, 0x1

    :cond_0
    if-eqz p2, :cond_1

    invoke-virtual {p3}, Lcom/google/android/gms/ads/internal/client/zzl$zza;->zziu()Ljava/lang/Object;

    move-result-object p1

    if-nez p1, :cond_2

    invoke-virtual {p3}, Lcom/google/android/gms/ads/internal/client/zzl$zza;->zzin()Ljava/lang/Object;

    move-result-object p1

    goto :goto_0

    :cond_1
    invoke-virtual {p3}, Lcom/google/android/gms/ads/internal/client/zzl$zza;->zzin()Ljava/lang/Object;

    move-result-object p1

    if-nez p1, :cond_2

    invoke-virtual {p3}, Lcom/google/android/gms/ads/internal/client/zzl$zza;->zziu()Ljava/lang/Object;

    move-result-object p1

    :cond_2
    :goto_0
    return-object p1
.end method

.method static synthetic zza(Lcom/google/android/gms/ads/internal/client/zzl;Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/ads/internal/client/zzl;->zzc(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method private static zza(Landroid/app/Activity;Ljava/lang/String;)Z
    .locals 2

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const-string p0, "useClientJar flag not found in activity intent extras."

    invoke-static {p0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->e(Ljava/lang/String;)V

    return v1

    :cond_0
    invoke-virtual {p0, p1, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method static synthetic zzb(Lcom/google/android/gms/ads/internal/client/zzl;)Lcom/google/android/gms/ads/internal/client/zze;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/ads/internal/client/zzl;->zzava:Lcom/google/android/gms/ads/internal/client/zze;

    return-object p0
.end method

.method static synthetic zzc(Lcom/google/android/gms/ads/internal/client/zzl;)Lcom/google/android/gms/ads/internal/client/zzd;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/ads/internal/client/zzl;->zzavb:Lcom/google/android/gms/ads/internal/client/zzd;

    return-object p0
.end method

.method private zzc(Landroid/content/Context;Ljava/lang/String;)V
    .locals 6

    new-instance v4, Landroid/os/Bundle;

    invoke-direct {v4}, Landroid/os/Bundle;-><init>()V

    const-string v0, "action"

    const-string v1, "no_ads_fallback"

    invoke-virtual {v4, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "flow"

    invoke-virtual {v4, v0, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzm;->zziw()Lcom/google/android/gms/ads/internal/util/client/zza;

    move-result-object v0

    const/4 v2, 0x0

    const-string v3, "gmob-apps"

    const/4 v5, 0x1

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lcom/google/android/gms/ads/internal/util/client/zza;->zza(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;Z)V

    return-void
.end method

.method static synthetic zzd(Lcom/google/android/gms/ads/internal/client/zzl;)Lcom/google/android/gms/ads/internal/client/zzai;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/ads/internal/client/zzl;->zzavc:Lcom/google/android/gms/ads/internal/client/zzai;

    return-object p0
.end method

.method static synthetic zze(Lcom/google/android/gms/ads/internal/client/zzl;)Lcom/google/android/gms/internal/zzef;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/ads/internal/client/zzl;->zzavd:Lcom/google/android/gms/internal/zzef;

    return-object p0
.end method

.method static synthetic zzf(Lcom/google/android/gms/ads/internal/client/zzl;)Lcom/google/android/gms/ads/internal/reward/client/zzf;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/ads/internal/client/zzl;->zzave:Lcom/google/android/gms/ads/internal/reward/client/zzf;

    return-object p0
.end method

.method static synthetic zzg(Lcom/google/android/gms/ads/internal/client/zzl;)Lcom/google/android/gms/internal/zzhu;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/ads/internal/client/zzl;->zzavf:Lcom/google/android/gms/internal/zzhu;

    return-object p0
.end method

.method static synthetic zzh(Lcom/google/android/gms/ads/internal/client/zzl;)Lcom/google/android/gms/internal/zzhh;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/ads/internal/client/zzl;->zzavg:Lcom/google/android/gms/internal/zzhh;

    return-object p0
.end method

.method private static zzik()Lcom/google/android/gms/ads/internal/client/zzx;
    .locals 3

    const/4 v0, 0x0

    :try_start_0
    const-class v1, Lcom/google/android/gms/ads/internal/client/zzl;

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    const-string v2, "com.google.android.gms.ads.internal.ClientApi"

    invoke-virtual {v1, v2}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v1

    instance-of v2, v1, Landroid/os/IBinder;

    if-nez v2, :cond_0

    const-string v1, "ClientApi class is not an instance of IBinder"

    invoke-static {v1}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzcx(Ljava/lang/String;)V

    return-object v0

    :cond_0
    check-cast v1, Landroid/os/IBinder;

    invoke-static {v1}, Lcom/google/android/gms/ads/internal/client/zzx$zza;->asInterface(Landroid/os/IBinder;)Lcom/google/android/gms/ads/internal/client/zzx;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v1

    const-string v2, "Failed to instantiate ClientApi class."

    invoke-static {v2, v1}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-object v0
.end method

.method private zzil()Lcom/google/android/gms/ads/internal/client/zzx;
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/client/zzl;->zzail:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/google/android/gms/ads/internal/client/zzl;->zzauz:Lcom/google/android/gms/ads/internal/client/zzx;

    if-nez v1, :cond_0

    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzl;->zzik()Lcom/google/android/gms/ads/internal/client/zzx;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/gms/ads/internal/client/zzl;->zzauz:Lcom/google/android/gms/ads/internal/client/zzx;

    :cond_0
    iget-object v1, p0, Lcom/google/android/gms/ads/internal/client/zzl;->zzauz:Lcom/google/android/gms/ads/internal/client/zzx;

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method


# virtual methods
.method public zza(Landroid/content/Context;Lcom/google/android/gms/ads/internal/client/AdSizeParcel;Ljava/lang/String;)Lcom/google/android/gms/ads/internal/client/zzu;
    .locals 1

    new-instance v0, Lcom/google/android/gms/ads/internal/client/zzl$2;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/google/android/gms/ads/internal/client/zzl$2;-><init>(Lcom/google/android/gms/ads/internal/client/zzl;Landroid/content/Context;Lcom/google/android/gms/ads/internal/client/AdSizeParcel;Ljava/lang/String;)V

    const/4 p2, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/gms/ads/internal/client/zzl;->zza(Landroid/content/Context;ZLcom/google/android/gms/ads/internal/client/zzl$zza;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/ads/internal/client/zzu;

    return-object p1
.end method

.method public zza(Landroid/content/Context;Lcom/google/android/gms/ads/internal/client/AdSizeParcel;Ljava/lang/String;Lcom/google/android/gms/internal/zzgj;)Lcom/google/android/gms/ads/internal/client/zzu;
    .locals 7

    new-instance v6, Lcom/google/android/gms/ads/internal/client/zzl$1;

    move-object v0, v6

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/ads/internal/client/zzl$1;-><init>(Lcom/google/android/gms/ads/internal/client/zzl;Landroid/content/Context;Lcom/google/android/gms/ads/internal/client/AdSizeParcel;Ljava/lang/String;Lcom/google/android/gms/internal/zzgj;)V

    const/4 p2, 0x0

    invoke-direct {p0, p1, p2, v6}, Lcom/google/android/gms/ads/internal/client/zzl;->zza(Landroid/content/Context;ZLcom/google/android/gms/ads/internal/client/zzl$zza;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/ads/internal/client/zzu;

    return-object p1
.end method

.method public zza(Landroid/content/Context;Lcom/google/android/gms/internal/zzgj;)Lcom/google/android/gms/ads/internal/reward/client/zzb;
    .locals 1

    new-instance v0, Lcom/google/android/gms/ads/internal/client/zzl$7;

    invoke-direct {v0, p0, p1, p2}, Lcom/google/android/gms/ads/internal/client/zzl$7;-><init>(Lcom/google/android/gms/ads/internal/client/zzl;Landroid/content/Context;Lcom/google/android/gms/internal/zzgj;)V

    const/4 p2, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/gms/ads/internal/client/zzl;->zza(Landroid/content/Context;ZLcom/google/android/gms/ads/internal/client/zzl$zza;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/ads/internal/reward/client/zzb;

    return-object p1
.end method

.method public zza(Landroid/content/Context;Landroid/widget/FrameLayout;Landroid/widget/FrameLayout;)Lcom/google/android/gms/internal/zzdt;
    .locals 1

    new-instance v0, Lcom/google/android/gms/ads/internal/client/zzl$6;

    invoke-direct {v0, p0, p2, p3, p1}, Lcom/google/android/gms/ads/internal/client/zzl$6;-><init>(Lcom/google/android/gms/ads/internal/client/zzl;Landroid/widget/FrameLayout;Landroid/widget/FrameLayout;Landroid/content/Context;)V

    const/4 p2, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/gms/ads/internal/client/zzl;->zza(Landroid/content/Context;ZLcom/google/android/gms/ads/internal/client/zzl$zza;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/internal/zzdt;

    return-object p1
.end method

.method public zzb(Landroid/content/Context;Ljava/lang/String;Lcom/google/android/gms/internal/zzgj;)Lcom/google/android/gms/ads/internal/client/zzs;
    .locals 1

    new-instance v0, Lcom/google/android/gms/ads/internal/client/zzl$4;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/google/android/gms/ads/internal/client/zzl$4;-><init>(Lcom/google/android/gms/ads/internal/client/zzl;Landroid/content/Context;Ljava/lang/String;Lcom/google/android/gms/internal/zzgj;)V

    const/4 p2, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/gms/ads/internal/client/zzl;->zza(Landroid/content/Context;ZLcom/google/android/gms/ads/internal/client/zzl$zza;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/ads/internal/client/zzs;

    return-object p1
.end method

.method public zzb(Landroid/content/Context;Lcom/google/android/gms/ads/internal/client/AdSizeParcel;Ljava/lang/String;Lcom/google/android/gms/internal/zzgj;)Lcom/google/android/gms/ads/internal/client/zzu;
    .locals 7

    new-instance v6, Lcom/google/android/gms/ads/internal/client/zzl$3;

    move-object v0, v6

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/ads/internal/client/zzl$3;-><init>(Lcom/google/android/gms/ads/internal/client/zzl;Landroid/content/Context;Lcom/google/android/gms/ads/internal/client/AdSizeParcel;Ljava/lang/String;Lcom/google/android/gms/internal/zzgj;)V

    const/4 p2, 0x0

    invoke-direct {p0, p1, p2, v6}, Lcom/google/android/gms/ads/internal/client/zzl;->zza(Landroid/content/Context;ZLcom/google/android/gms/ads/internal/client/zzl$zza;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/ads/internal/client/zzu;

    return-object p1
.end method

.method public zzb(Landroid/app/Activity;)Lcom/google/android/gms/internal/zzhp;
    .locals 2

    const-string v0, "com.google.android.gms.ads.internal.purchase.useClientJar"

    invoke-static {p1, v0}, Lcom/google/android/gms/ads/internal/client/zzl;->zza(Landroid/app/Activity;Ljava/lang/String;)Z

    move-result v0

    new-instance v1, Lcom/google/android/gms/ads/internal/client/zzl$8;

    invoke-direct {v1, p0, p1}, Lcom/google/android/gms/ads/internal/client/zzl$8;-><init>(Lcom/google/android/gms/ads/internal/client/zzl;Landroid/app/Activity;)V

    invoke-direct {p0, p1, v0, v1}, Lcom/google/android/gms/ads/internal/client/zzl;->zza(Landroid/content/Context;ZLcom/google/android/gms/ads/internal/client/zzl$zza;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/internal/zzhp;

    return-object p1
.end method

.method public zzc(Landroid/app/Activity;)Lcom/google/android/gms/internal/zzhi;
    .locals 2

    const-string v0, "com.google.android.gms.ads.internal.overlay.useClientJar"

    invoke-static {p1, v0}, Lcom/google/android/gms/ads/internal/client/zzl;->zza(Landroid/app/Activity;Ljava/lang/String;)Z

    move-result v0

    new-instance v1, Lcom/google/android/gms/ads/internal/client/zzl$9;

    invoke-direct {v1, p0, p1}, Lcom/google/android/gms/ads/internal/client/zzl$9;-><init>(Lcom/google/android/gms/ads/internal/client/zzl;Landroid/app/Activity;)V

    invoke-direct {p0, p1, v0, v1}, Lcom/google/android/gms/ads/internal/client/zzl;->zza(Landroid/content/Context;ZLcom/google/android/gms/ads/internal/client/zzl$zza;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/internal/zzhi;

    return-object p1
.end method

.method public zzl(Landroid/content/Context;)Lcom/google/android/gms/ads/internal/client/zzz;
    .locals 2

    new-instance v0, Lcom/google/android/gms/ads/internal/client/zzl$5;

    invoke-direct {v0, p0, p1}, Lcom/google/android/gms/ads/internal/client/zzl$5;-><init>(Lcom/google/android/gms/ads/internal/client/zzl;Landroid/content/Context;)V

    const/4 v1, 0x0

    invoke-direct {p0, p1, v1, v0}, Lcom/google/android/gms/ads/internal/client/zzl;->zza(Landroid/content/Context;ZLcom/google/android/gms/ads/internal/client/zzl$zza;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/ads/internal/client/zzz;

    return-object p1
.end method
