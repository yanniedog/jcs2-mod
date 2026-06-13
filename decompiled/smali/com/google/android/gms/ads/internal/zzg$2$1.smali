.class Lcom/google/android/gms/ads/internal/zzg$2$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzla$zzc;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/ads/internal/zzg$2;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/gms/internal/zzla$zzc<",
        "Lcom/google/android/gms/internal/zzft;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic zzalb:Lcom/google/android/gms/ads/internal/zzg$2;


# direct methods
.method constructor <init>(Lcom/google/android/gms/ads/internal/zzg$2;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/ads/internal/zzg$2$1;->zzalb:Lcom/google/android/gms/ads/internal/zzg$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zzb(Lcom/google/android/gms/internal/zzft;)V
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzg$2$1;->zzalb:Lcom/google/android/gms/ads/internal/zzg$2;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzg$2;->zzakv:Lcom/google/android/gms/ads/internal/zzg;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzg;->zzaku:Lcom/google/android/gms/internal/zzep;

    const-string v1, "/appSettingsFetched"

    invoke-interface {p1, v1, v0}, Lcom/google/android/gms/internal/zzft;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzep;)V

    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/zzg$2$1;->zzalb:Lcom/google/android/gms/ads/internal/zzg$2;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/zzg$2;->zzakx:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string v2, "app_id"

    iget-object v3, p0, Lcom/google/android/gms/ads/internal/zzg$2$1;->zzalb:Lcom/google/android/gms/ads/internal/zzg$2;

    iget-object v3, v3, Lcom/google/android/gms/ads/internal/zzg$2;->zzakx:Ljava/lang/String;

    :goto_0
    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_1

    :cond_0
    iget-object v2, p0, Lcom/google/android/gms/ads/internal/zzg$2$1;->zzalb:Lcom/google/android/gms/ads/internal/zzg$2;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/zzg$2;->zzaky:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    const-string v2, "ad_unit_id"

    iget-object v3, p0, Lcom/google/android/gms/ads/internal/zzg$2$1;->zzalb:Lcom/google/android/gms/ads/internal/zzg$2;

    iget-object v3, v3, Lcom/google/android/gms/ads/internal/zzg$2;->zzaky:Ljava/lang/String;

    goto :goto_0

    :cond_1
    :goto_1
    const-string v2, "is_init"

    iget-object v3, p0, Lcom/google/android/gms/ads/internal/zzg$2$1;->zzalb:Lcom/google/android/gms/ads/internal/zzg$2;

    iget-boolean v3, v3, Lcom/google/android/gms/ads/internal/zzg$2;->zzakz:Z

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    const-string v2, "pn"

    iget-object v3, p0, Lcom/google/android/gms/ads/internal/zzg$2$1;->zzalb:Lcom/google/android/gms/ads/internal/zzg$2;

    iget-object v3, v3, Lcom/google/android/gms/ads/internal/zzg$2;->zzala:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "AFMA_fetchAppSettings"

    invoke-interface {p1, v2, v0}, Lcom/google/android/gms/internal/zzft;->zza(Ljava/lang/String;Lorg/json/JSONObject;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception v0

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/zzg$2$1;->zzalb:Lcom/google/android/gms/ads/internal/zzg$2;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/zzg$2;->zzakv:Lcom/google/android/gms/ads/internal/zzg;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/zzg;->zzaku:Lcom/google/android/gms/internal/zzep;

    invoke-interface {p1, v1, v2}, Lcom/google/android/gms/internal/zzft;->zzb(Ljava/lang/String;Lcom/google/android/gms/internal/zzep;)V

    const-string p1, "Error requesting application settings"

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/zzkd;->zzb(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_2
    return-void
.end method

.method public synthetic zzd(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lcom/google/android/gms/internal/zzft;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/ads/internal/zzg$2$1;->zzb(Lcom/google/android/gms/internal/zzft;)V

    return-void
.end method
