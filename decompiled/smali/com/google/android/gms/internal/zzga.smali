.class public final Lcom/google/android/gms/internal/zzga;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzin;
.end annotation


# instance fields
.field public final zzbnk:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/android/gms/internal/zzfz;",
            ">;"
        }
    .end annotation
.end field

.field public final zzbnl:J

.field public final zzbnm:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final zzbnn:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final zzbno:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final zzbnp:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final zzbnq:Z

.field public final zzbnr:Ljava/lang/String;

.field public final zzbns:J

.field public final zzbnt:Ljava/lang/String;

.field public final zzbnu:I

.field public final zzbnv:I

.field public final zzbnw:J

.field public final zzbnx:Z

.field public zzbny:I

.field public zzbnz:I


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const/4 p1, 0x2

    invoke-static {p1}, Lcom/google/android/gms/internal/zzkd;->zzaz(I)Z

    move-result v1

    if-eqz v1, :cond_1

    const-string v1, "Mediation Response JSON: "

    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v1, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    new-instance p1, Ljava/lang/String;

    invoke-direct {p1, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    :goto_0
    invoke-static {p1}, Lcom/google/android/gms/internal/zzkd;->v(Ljava/lang/String;)V

    :cond_1
    const-string p1, "ad_networks"

    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p1

    new-instance v1, Ljava/util/ArrayList;

    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v2, -0x1

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, -0x1

    :goto_1
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-ge v4, v6, :cond_3

    new-instance v6, Lcom/google/android/gms/internal/zzfz;

    invoke-virtual {p1, v4}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v7

    invoke-direct {v6, v7}, Lcom/google/android/gms/internal/zzfz;-><init>(Lorg/json/JSONObject;)V

    invoke-interface {v1, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    if-gez v5, :cond_2

    invoke-direct {p0, v6}, Lcom/google/android/gms/internal/zzga;->zza(Lcom/google/android/gms/internal/zzfz;)Z

    move-result v6

    if-eqz v6, :cond_2

    move v5, v4

    :cond_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    :cond_3
    iput v5, p0, Lcom/google/android/gms/internal/zzga;->zzbny:I

    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result p1

    iput p1, p0, Lcom/google/android/gms/internal/zzga;->zzbnz:I

    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/gms/internal/zzga;->zzbnk:Ljava/util/List;

    const-string p1, "qdata"

    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/gms/internal/zzga;->zzbnr:Ljava/lang/String;

    const-string p1, "fs_model_type"

    invoke-virtual {v0, p1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result p1

    iput p1, p0, Lcom/google/android/gms/internal/zzga;->zzbnv:I

    const-wide/16 v1, -0x1

    const-string p1, "timeout_ms"

    invoke-virtual {v0, p1, v1, v2}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v4

    iput-wide v4, p0, Lcom/google/android/gms/internal/zzga;->zzbnw:J

    const-string p1, "settings"

    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    const/4 v0, 0x0

    if-eqz p1, :cond_6

    const-string v4, "ad_network_timeout_millis"

    invoke-virtual {p1, v4, v1, v2}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v4

    iput-wide v4, p0, Lcom/google/android/gms/internal/zzga;->zzbnl:J

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzgf()Lcom/google/android/gms/internal/zzgf;

    move-result-object v4

    const-string v5, "click_urls"

    invoke-virtual {v4, p1, v5}, Lcom/google/android/gms/internal/zzgf;->zza(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/util/List;

    move-result-object v4

    iput-object v4, p0, Lcom/google/android/gms/internal/zzga;->zzbnm:Ljava/util/List;

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzgf()Lcom/google/android/gms/internal/zzgf;

    move-result-object v4

    const-string v5, "imp_urls"

    invoke-virtual {v4, p1, v5}, Lcom/google/android/gms/internal/zzgf;->zza(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/util/List;

    move-result-object v4

    iput-object v4, p0, Lcom/google/android/gms/internal/zzga;->zzbnn:Ljava/util/List;

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzgf()Lcom/google/android/gms/internal/zzgf;

    move-result-object v4

    const-string v5, "nofill_urls"

    invoke-virtual {v4, p1, v5}, Lcom/google/android/gms/internal/zzgf;->zza(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/util/List;

    move-result-object v4

    iput-object v4, p0, Lcom/google/android/gms/internal/zzga;->zzbno:Ljava/util/List;

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzgf()Lcom/google/android/gms/internal/zzgf;

    move-result-object v4

    const-string v5, "remote_ping_urls"

    invoke-virtual {v4, p1, v5}, Lcom/google/android/gms/internal/zzgf;->zza(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/util/List;

    move-result-object v4

    iput-object v4, p0, Lcom/google/android/gms/internal/zzga;->zzbnp:Ljava/util/List;

    const-string v4, "render_in_browser"

    invoke-virtual {p1, v4, v3}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v4

    iput-boolean v4, p0, Lcom/google/android/gms/internal/zzga;->zzbnq:Z

    const-string v4, "refresh"

    invoke-virtual {p1, v4, v1, v2}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v4

    const-wide/16 v6, 0x0

    cmp-long v8, v4, v6

    if-lez v8, :cond_4

    const-wide/16 v1, 0x3e8

    mul-long v1, v1, v4

    :cond_4
    iput-wide v1, p0, Lcom/google/android/gms/internal/zzga;->zzbns:J

    const-string v1, "rewards"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    invoke-static {v1}, Lcom/google/android/gms/ads/internal/reward/mediation/client/RewardItemParcel;->zza(Lorg/json/JSONArray;)Lcom/google/android/gms/ads/internal/reward/mediation/client/RewardItemParcel;

    move-result-object v1

    if-nez v1, :cond_5

    iput-object v0, p0, Lcom/google/android/gms/internal/zzga;->zzbnt:Ljava/lang/String;

    iput v3, p0, Lcom/google/android/gms/internal/zzga;->zzbnu:I

    goto :goto_2

    :cond_5
    iget-object v0, v1, Lcom/google/android/gms/ads/internal/reward/mediation/client/RewardItemParcel;->type:Ljava/lang/String;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzga;->zzbnt:Ljava/lang/String;

    iget v0, v1, Lcom/google/android/gms/ads/internal/reward/mediation/client/RewardItemParcel;->zzcid:I

    iput v0, p0, Lcom/google/android/gms/internal/zzga;->zzbnu:I

    :goto_2
    const-string v0, "use_displayed_impression"

    invoke-virtual {p1, v0, v3}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result p1

    iput-boolean p1, p0, Lcom/google/android/gms/internal/zzga;->zzbnx:Z

    goto :goto_3

    :cond_6
    iput-wide v1, p0, Lcom/google/android/gms/internal/zzga;->zzbnl:J

    iput-object v0, p0, Lcom/google/android/gms/internal/zzga;->zzbnm:Ljava/util/List;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzga;->zzbnn:Ljava/util/List;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzga;->zzbno:Ljava/util/List;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzga;->zzbnp:Ljava/util/List;

    iput-wide v1, p0, Lcom/google/android/gms/internal/zzga;->zzbns:J

    iput-object v0, p0, Lcom/google/android/gms/internal/zzga;->zzbnt:Ljava/lang/String;

    iput v3, p0, Lcom/google/android/gms/internal/zzga;->zzbnu:I

    iput-boolean v3, p0, Lcom/google/android/gms/internal/zzga;->zzbnx:Z

    iput-boolean v3, p0, Lcom/google/android/gms/internal/zzga;->zzbnq:Z

    :goto_3
    return-void
.end method

.method public constructor <init>(Ljava/util/List;JLjava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;ZLjava/lang/String;JIILjava/lang/String;IIJZ)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/android/gms/internal/zzfz;",
            ">;J",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;Z",
            "Ljava/lang/String;",
            "JII",
            "Ljava/lang/String;",
            "IIJZ)V"
        }
    .end annotation

    move-object v0, p0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    move-object v1, p1

    iput-object v1, v0, Lcom/google/android/gms/internal/zzga;->zzbnk:Ljava/util/List;

    move-wide v1, p2

    iput-wide v1, v0, Lcom/google/android/gms/internal/zzga;->zzbnl:J

    move-object v1, p4

    iput-object v1, v0, Lcom/google/android/gms/internal/zzga;->zzbnm:Ljava/util/List;

    move-object v1, p5

    iput-object v1, v0, Lcom/google/android/gms/internal/zzga;->zzbnn:Ljava/util/List;

    move-object v1, p6

    iput-object v1, v0, Lcom/google/android/gms/internal/zzga;->zzbno:Ljava/util/List;

    move-object v1, p7

    iput-object v1, v0, Lcom/google/android/gms/internal/zzga;->zzbnp:Ljava/util/List;

    move v1, p8

    iput-boolean v1, v0, Lcom/google/android/gms/internal/zzga;->zzbnq:Z

    move-object v1, p9

    iput-object v1, v0, Lcom/google/android/gms/internal/zzga;->zzbnr:Ljava/lang/String;

    move-wide v1, p10

    iput-wide v1, v0, Lcom/google/android/gms/internal/zzga;->zzbns:J

    move v1, p12

    iput v1, v0, Lcom/google/android/gms/internal/zzga;->zzbny:I

    move/from16 v1, p13

    iput v1, v0, Lcom/google/android/gms/internal/zzga;->zzbnz:I

    move-object/from16 v1, p14

    iput-object v1, v0, Lcom/google/android/gms/internal/zzga;->zzbnt:Ljava/lang/String;

    move/from16 v1, p15

    iput v1, v0, Lcom/google/android/gms/internal/zzga;->zzbnu:I

    move/from16 v1, p16

    iput v1, v0, Lcom/google/android/gms/internal/zzga;->zzbnv:I

    move-wide/from16 v1, p17

    iput-wide v1, v0, Lcom/google/android/gms/internal/zzga;->zzbnw:J

    move/from16 v1, p19

    iput-boolean v1, v0, Lcom/google/android/gms/internal/zzga;->zzbnx:Z

    return-void
.end method

.method private zza(Lcom/google/android/gms/internal/zzfz;)Z
    .locals 2

    iget-object p1, p1, Lcom/google/android/gms/internal/zzfz;->zzbmw:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const-string v1, "com.google.ads.mediation.admob.AdMobAdapter"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_1
    const/4 p1, 0x0

    return p1
.end method
