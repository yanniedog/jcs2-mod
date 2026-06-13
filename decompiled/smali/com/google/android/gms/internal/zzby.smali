.class public final Lcom/google/android/gms/internal/zzby;
.super Lcom/google/android/gms/internal/zzca$zza;


# instance fields
.field private final zzaiq:Lcom/google/android/gms/internal/zzar;

.field private final zzair:Lcom/google/android/gms/internal/zzas;

.field private final zzais:Lcom/google/android/gms/internal/zzap;

.field private zzait:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;Landroid/content/Context;Z)V
    .locals 1

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzca$zza;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzby;->zzait:Z

    invoke-static {p1, p2, p3}, Lcom/google/android/gms/internal/zzar;->zza(Ljava/lang/String;Landroid/content/Context;Z)Lcom/google/android/gms/internal/zzar;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/gms/internal/zzby;->zzaiq:Lcom/google/android/gms/internal/zzar;

    new-instance p1, Lcom/google/android/gms/internal/zzas;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzby;->zzaiq:Lcom/google/android/gms/internal/zzar;

    invoke-direct {p1, v0}, Lcom/google/android/gms/internal/zzas;-><init>(Lcom/google/android/gms/internal/zzan;)V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzby;->zzair:Lcom/google/android/gms/internal/zzas;

    if-eqz p3, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    invoke-static {p2}, Lcom/google/android/gms/internal/zzap;->zze(Landroid/content/Context;)Lcom/google/android/gms/internal/zzap;

    move-result-object p1

    :goto_0
    iput-object p1, p0, Lcom/google/android/gms/internal/zzby;->zzais:Lcom/google/android/gms/internal/zzap;

    return-void
.end method

.method private zza(Lcom/google/android/gms/dynamic/zzd;Lcom/google/android/gms/dynamic/zzd;Z)Lcom/google/android/gms/dynamic/zzd;
    .locals 0

    :try_start_0
    invoke-static {p1}, Lcom/google/android/gms/dynamic/zze;->zzad(Lcom/google/android/gms/dynamic/zzd;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/net/Uri;

    invoke-static {p2}, Lcom/google/android/gms/dynamic/zze;->zzad(Lcom/google/android/gms/dynamic/zzd;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/content/Context;

    if-eqz p3, :cond_0

    iget-object p3, p0, Lcom/google/android/gms/internal/zzby;->zzair:Lcom/google/android/gms/internal/zzas;

    invoke-virtual {p3, p1, p2}, Lcom/google/android/gms/internal/zzas;->zza(Landroid/net/Uri;Landroid/content/Context;)Landroid/net/Uri;

    move-result-object p1

    goto :goto_0

    :cond_0
    iget-object p3, p0, Lcom/google/android/gms/internal/zzby;->zzair:Lcom/google/android/gms/internal/zzas;

    invoke-virtual {p3, p1, p2}, Lcom/google/android/gms/internal/zzas;->zzb(Landroid/net/Uri;Landroid/content/Context;)Landroid/net/Uri;

    move-result-object p1

    :goto_0
    invoke-static {p1}, Lcom/google/android/gms/dynamic/zze;->zzac(Ljava/lang/Object;)Lcom/google/android/gms/dynamic/zzd;

    move-result-object p1
    :try_end_0
    .catch Lcom/google/android/gms/internal/zzat; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    const/4 p1, 0x0

    return-object p1
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/dynamic/zzd;Lcom/google/android/gms/dynamic/zzd;)Lcom/google/android/gms/dynamic/zzd;
    .locals 1

    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/gms/internal/zzby;->zza(Lcom/google/android/gms/dynamic/zzd;Lcom/google/android/gms/dynamic/zzd;Z)Lcom/google/android/gms/dynamic/zzd;

    move-result-object p1

    return-object p1
.end method

.method public zza(Lcom/google/android/gms/dynamic/zzd;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    invoke-static {p1}, Lcom/google/android/gms/dynamic/zze;->zzad(Lcom/google/android/gms/dynamic/zzd;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/content/Context;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzby;->zzaiq:Lcom/google/android/gms/internal/zzar;

    invoke-virtual {v0, p1, p2}, Lcom/google/android/gms/internal/zzar;->zzb(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public zza(Lcom/google/android/gms/dynamic/zzd;)Z
    .locals 1

    invoke-static {p1}, Lcom/google/android/gms/dynamic/zze;->zzad(Lcom/google/android/gms/dynamic/zzd;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/net/Uri;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzby;->zzair:Lcom/google/android/gms/internal/zzas;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzas;->zza(Landroid/net/Uri;)Z

    move-result p1

    return p1
.end method

.method public zzb(Lcom/google/android/gms/dynamic/zzd;Lcom/google/android/gms/dynamic/zzd;)Lcom/google/android/gms/dynamic/zzd;
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/gms/internal/zzby;->zza(Lcom/google/android/gms/dynamic/zzd;Lcom/google/android/gms/dynamic/zzd;Z)Lcom/google/android/gms/dynamic/zzd;

    move-result-object p1

    return-object p1
.end method

.method public zzb(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzby;->zzair:Lcom/google/android/gms/internal/zzas;

    invoke-virtual {v0, p1, p2}, Lcom/google/android/gms/internal/zzas;->zzb(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public zzb(Lcom/google/android/gms/dynamic/zzd;)Z
    .locals 1

    invoke-static {p1}, Lcom/google/android/gms/dynamic/zze;->zzad(Lcom/google/android/gms/dynamic/zzd;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/net/Uri;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzby;->zzair:Lcom/google/android/gms/internal/zzas;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzas;->zzc(Landroid/net/Uri;)Z

    move-result p1

    return p1
.end method

.method public zzb(Ljava/lang/String;Z)Z
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzby;->zzais:Lcom/google/android/gms/internal/zzap;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    new-instance v0, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;

    invoke-direct {v0, p1, p2}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;-><init>(Ljava/lang/String;Z)V

    iget-object p1, p0, Lcom/google/android/gms/internal/zzby;->zzais:Lcom/google/android/gms/internal/zzap;

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzap;->zza(Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/google/android/gms/internal/zzby;->zzait:Z

    return p1
.end method

.method public zzc(Lcom/google/android/gms/dynamic/zzd;)Ljava/lang/String;
    .locals 3

    invoke-static {p1}, Lcom/google/android/gms/dynamic/zze;->zzad(Lcom/google/android/gms/dynamic/zzd;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/content/Context;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzby;->zzaiq:Lcom/google/android/gms/internal/zzar;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzar;->zzb(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzby;->zzais:Lcom/google/android/gms/internal/zzap;

    if-eqz v1, :cond_0

    iget-boolean v2, p0, Lcom/google/android/gms/internal/zzby;->zzait:Z

    if-eqz v2, :cond_0

    invoke-virtual {v1, p1}, Lcom/google/android/gms/internal/zzap;->zzb(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    iget-object v1, p0, Lcom/google/android/gms/internal/zzby;->zzais:Lcom/google/android/gms/internal/zzap;

    invoke-virtual {v1, v0, p1}, Lcom/google/android/gms/internal/zzap;->zza(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/google/android/gms/internal/zzby;->zzait:Z

    :cond_0
    return-object v0
.end method

.method public zzd(Lcom/google/android/gms/dynamic/zzd;)V
    .locals 1

    invoke-static {p1}, Lcom/google/android/gms/dynamic/zze;->zzad(Lcom/google/android/gms/dynamic/zzd;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/MotionEvent;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzby;->zzair:Lcom/google/android/gms/internal/zzas;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzas;->zza(Landroid/view/MotionEvent;)V

    return-void
.end method

.method public zzdf()Ljava/lang/String;
    .locals 1

    const-string v0, "ms"

    return-object v0
.end method

.method public zzk(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzby;->zzair:Lcom/google/android/gms/internal/zzas;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzas;->zzk(Ljava/lang/String;)V

    return-void
.end method
