.class public Lcom/google/android/gms/internal/zzhd;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzin;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/zzhd$zza;
    }
.end annotation


# instance fields
.field private final zzbqx:Z

.field private final zzbqy:Z

.field private final zzbqz:Z

.field private final zzbra:Z

.field private final zzbrb:Z


# direct methods
.method private constructor <init>(Lcom/google/android/gms/internal/zzhd$zza;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Lcom/google/android/gms/internal/zzhd$zza;->zza(Lcom/google/android/gms/internal/zzhd$zza;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzhd;->zzbqx:Z

    invoke-static {p1}, Lcom/google/android/gms/internal/zzhd$zza;->zzb(Lcom/google/android/gms/internal/zzhd$zza;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzhd;->zzbqy:Z

    invoke-static {p1}, Lcom/google/android/gms/internal/zzhd$zza;->zzc(Lcom/google/android/gms/internal/zzhd$zza;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzhd;->zzbqz:Z

    invoke-static {p1}, Lcom/google/android/gms/internal/zzhd$zza;->zzd(Lcom/google/android/gms/internal/zzhd$zza;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzhd;->zzbra:Z

    invoke-static {p1}, Lcom/google/android/gms/internal/zzhd$zza;->zze(Lcom/google/android/gms/internal/zzhd$zza;)Z

    move-result p1

    iput-boolean p1, p0, Lcom/google/android/gms/internal/zzhd;->zzbrb:Z

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/gms/internal/zzhd$zza;Lcom/google/android/gms/internal/zzhd$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzhd;-><init>(Lcom/google/android/gms/internal/zzhd$zza;)V

    return-void
.end method


# virtual methods
.method public toJson()Lorg/json/JSONObject;
    .locals 3

    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "sms"

    iget-boolean v2, p0, Lcom/google/android/gms/internal/zzhd;->zzbqx:Z

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "tel"

    iget-boolean v2, p0, Lcom/google/android/gms/internal/zzhd;->zzbqy:Z

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "calendar"

    iget-boolean v2, p0, Lcom/google/android/gms/internal/zzhd;->zzbqz:Z

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "storePicture"

    iget-boolean v2, p0, Lcom/google/android/gms/internal/zzhd;->zzbra:Z

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "inlineVideo"

    iget-boolean v2, p0, Lcom/google/android/gms/internal/zzhd;->zzbrb:Z

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object v0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    const-string v1, "Error occured while obtaining the MRAID capabilities."

    invoke-static {v1, v0}, Lcom/google/android/gms/internal/zzkd;->zzb(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 v0, 0x0

    return-object v0
.end method
