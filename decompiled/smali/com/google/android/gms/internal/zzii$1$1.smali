.class Lcom/google/android/gms/internal/zzii$1$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzep;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzii$1;->zze(Lcom/google/android/gms/internal/zzft;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzbgl:Lcom/google/android/gms/internal/zzft;

.field final synthetic zzbzl:Lcom/google/android/gms/internal/zzii$1;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzii$1;Lcom/google/android/gms/internal/zzft;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzii$1$1;->zzbzl:Lcom/google/android/gms/internal/zzii$1;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzii$1$1;->zzbgl:Lcom/google/android/gms/internal/zzft;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/internal/zzlh;Ljava/util/Map;)V
    .locals 2
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

    iget-object p1, p0, Lcom/google/android/gms/internal/zzii$1$1;->zzbgl:Lcom/google/android/gms/internal/zzft;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzii$1$1;->zzbzl:Lcom/google/android/gms/internal/zzii$1;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzii$1;->zzbzh:Lcom/google/android/gms/internal/zzii$zzb;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzii$zzb;->zzbzz:Lcom/google/android/gms/internal/zzep;

    const-string v1, "/nativeAdPreProcess"

    invoke-interface {p1, v1, v0}, Lcom/google/android/gms/internal/zzft;->zzb(Ljava/lang/String;Lcom/google/android/gms/internal/zzep;)V

    const/4 p1, 0x0

    :try_start_0
    const-string v0, "success"

    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzii$1$1;->zzbzl:Lcom/google/android/gms/internal/zzii$1;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzii$1;->zzbzi:Lcom/google/android/gms/internal/zzkv;

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p2, "ads"

    invoke-virtual {v1, p2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p2

    invoke-virtual {p2, p1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object p2

    invoke-virtual {v0, p2}, Lcom/google/android/gms/internal/zzkv;->zzh(Ljava/lang/Object;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p2

    const-string v0, "Malformed native JSON response."

    invoke-static {v0, p2}, Lcom/google/android/gms/internal/zzkd;->zzb(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    iget-object p2, p0, Lcom/google/android/gms/internal/zzii$1$1;->zzbzl:Lcom/google/android/gms/internal/zzii$1;

    iget-object p2, p2, Lcom/google/android/gms/internal/zzii$1;->zzbzk:Lcom/google/android/gms/internal/zzii;

    invoke-virtual {p2, p1}, Lcom/google/android/gms/internal/zzii;->zzan(I)V

    iget-object p1, p0, Lcom/google/android/gms/internal/zzii$1$1;->zzbzl:Lcom/google/android/gms/internal/zzii$1;

    iget-object p1, p1, Lcom/google/android/gms/internal/zzii$1;->zzbzk:Lcom/google/android/gms/internal/zzii;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzii;->zzqs()Z

    move-result p1

    const-string p2, "Unable to set the ad state error!"

    invoke-static {p1, p2}, Lcom/google/android/gms/common/internal/zzab;->zza(ZLjava/lang/Object;)V

    iget-object p1, p0, Lcom/google/android/gms/internal/zzii$1$1;->zzbzl:Lcom/google/android/gms/internal/zzii$1;

    iget-object p1, p1, Lcom/google/android/gms/internal/zzii$1;->zzbzi:Lcom/google/android/gms/internal/zzkv;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lcom/google/android/gms/internal/zzkv;->zzh(Ljava/lang/Object;)V

    return-void
.end method
