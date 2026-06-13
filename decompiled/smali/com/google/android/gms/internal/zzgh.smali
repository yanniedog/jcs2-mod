.class public Lcom/google/android/gms/internal/zzgh;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzfy;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzin;
.end annotation


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final zzail:Ljava/lang/Object;

.field private final zzajn:Lcom/google/android/gms/internal/zzdk;

.field private final zzajz:Lcom/google/android/gms/internal/zzgj;

.field private final zzarl:Z

.field private final zzawn:Z

.field private final zzboe:Lcom/google/android/gms/internal/zzga;

.field private final zzbot:Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;

.field private final zzbou:J

.field private final zzbov:J

.field private zzbox:Z

.field private zzboz:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/android/gms/internal/zzge;",
            ">;"
        }
    .end annotation
.end field

.field private zzbpd:Lcom/google/android/gms/internal/zzgd;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;Lcom/google/android/gms/internal/zzgj;Lcom/google/android/gms/internal/zzga;ZZJJLcom/google/android/gms/internal/zzdk;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzgh;->zzail:Ljava/lang/Object;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzgh;->zzbox:Z

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzgh;->zzboz:Ljava/util/List;

    iput-object p1, p0, Lcom/google/android/gms/internal/zzgh;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzgh;->zzbot:Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzgh;->zzajz:Lcom/google/android/gms/internal/zzgj;

    iput-object p4, p0, Lcom/google/android/gms/internal/zzgh;->zzboe:Lcom/google/android/gms/internal/zzga;

    iput-boolean p5, p0, Lcom/google/android/gms/internal/zzgh;->zzarl:Z

    iput-boolean p6, p0, Lcom/google/android/gms/internal/zzgh;->zzawn:Z

    iput-wide p7, p0, Lcom/google/android/gms/internal/zzgh;->zzbou:J

    iput-wide p9, p0, Lcom/google/android/gms/internal/zzgh;->zzbov:J

    iput-object p11, p0, Lcom/google/android/gms/internal/zzgh;->zzajn:Lcom/google/android/gms/internal/zzdk;

    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgh;->zzail:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x1

    :try_start_0
    iput-boolean v1, p0, Lcom/google/android/gms/internal/zzgh;->zzbox:Z

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgh;->zzbpd:Lcom/google/android/gms/internal/zzgd;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgh;->zzbpd:Lcom/google/android/gms/internal/zzgd;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzgd;->cancel()V

    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public zzd(Ljava/util/List;)Lcom/google/android/gms/internal/zzge;
    .locals 25
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/android/gms/internal/zzfz;",
            ">;)",
            "Lcom/google/android/gms/internal/zzge;"
        }
    .end annotation

    move-object/from16 v1, p0

    const-string v0, "Starting mediation."

    invoke-static {v0}, Lcom/google/android/gms/internal/zzkd;->zzcv(Ljava/lang/String;)V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v2, v1, Lcom/google/android/gms/internal/zzgh;->zzajn:Lcom/google/android/gms/internal/zzdk;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzdk;->zzkg()Lcom/google/android/gms/internal/zzdi;

    move-result-object v2

    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_6

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/android/gms/internal/zzfz;

    const-string v6, "Trying mediation network: "

    iget-object v7, v4, Lcom/google/android/gms/internal/zzfz;->zzbmv:Ljava/lang/String;

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v8

    if-eqz v8, :cond_1

    invoke-virtual {v6, v7}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    goto :goto_0

    :cond_1
    new-instance v7, Ljava/lang/String;

    invoke-direct {v7, v6}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    move-object v6, v7

    :goto_0
    invoke-static {v6}, Lcom/google/android/gms/internal/zzkd;->zzcw(Ljava/lang/String;)V

    iget-object v6, v4, Lcom/google/android/gms/internal/zzfz;->zzbmw:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v19

    :goto_1
    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    move-object v15, v6

    check-cast v15, Ljava/lang/String;

    iget-object v6, v1, Lcom/google/android/gms/internal/zzgh;->zzajn:Lcom/google/android/gms/internal/zzdk;

    invoke-virtual {v6}, Lcom/google/android/gms/internal/zzdk;->zzkg()Lcom/google/android/gms/internal/zzdi;

    move-result-object v14

    iget-object v13, v1, Lcom/google/android/gms/internal/zzgh;->zzail:Ljava/lang/Object;

    monitor-enter v13

    :try_start_0
    iget-boolean v6, v1, Lcom/google/android/gms/internal/zzgh;->zzbox:Z

    if-eqz v6, :cond_2

    new-instance v0, Lcom/google/android/gms/internal/zzge;

    const/4 v2, -0x1

    invoke-direct {v0, v2}, Lcom/google/android/gms/internal/zzge;-><init>(I)V

    monitor-exit v13

    return-object v0

    :cond_2
    new-instance v12, Lcom/google/android/gms/internal/zzgd;

    iget-object v7, v1, Lcom/google/android/gms/internal/zzgh;->mContext:Landroid/content/Context;

    iget-object v9, v1, Lcom/google/android/gms/internal/zzgh;->zzajz:Lcom/google/android/gms/internal/zzgj;

    iget-object v10, v1, Lcom/google/android/gms/internal/zzgh;->zzboe:Lcom/google/android/gms/internal/zzga;

    iget-object v6, v1, Lcom/google/android/gms/internal/zzgh;->zzbot:Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;

    iget-object v11, v6, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzcar:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

    iget-object v6, v1, Lcom/google/android/gms/internal/zzgh;->zzbot:Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;

    iget-object v8, v6, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzapa:Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    iget-object v6, v1, Lcom/google/android/gms/internal/zzgh;->zzbot:Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;

    iget-object v6, v6, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzaow:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    iget-boolean v5, v1, Lcom/google/android/gms/internal/zzgh;->zzarl:Z

    move-object/from16 v20, v3

    iget-boolean v3, v1, Lcom/google/android/gms/internal/zzgh;->zzawn:Z

    move-object/from16 v16, v6

    iget-object v6, v1, Lcom/google/android/gms/internal/zzgh;->zzbot:Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;

    iget-object v6, v6, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzapo:Lcom/google/android/gms/ads/internal/formats/NativeAdOptionsParcel;

    move-object/from16 v17, v6

    iget-object v6, v1, Lcom/google/android/gms/internal/zzgh;->zzbot:Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;

    iget-object v6, v6, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzaps:Ljava/util/List;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object/from16 v18, v6

    move-object v6, v12

    move-object/from16 v21, v8

    move-object v8, v15

    move-object/from16 v22, v11

    move-object v11, v4

    move-object/from16 v23, v4

    move-object v4, v12

    move-object/from16 v12, v22

    move-object/from16 v22, v13

    move-object/from16 v13, v21

    move-object/from16 v21, v2

    move-object v2, v14

    move-object/from16 v14, v16

    move-object/from16 v24, v2

    move-object v2, v15

    move v15, v5

    move/from16 v16, v3

    :try_start_1
    invoke-direct/range {v6 .. v18}, Lcom/google/android/gms/internal/zzgd;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/google/android/gms/internal/zzgj;Lcom/google/android/gms/internal/zzga;Lcom/google/android/gms/internal/zzfz;Lcom/google/android/gms/ads/internal/client/AdRequestParcel;Lcom/google/android/gms/ads/internal/client/AdSizeParcel;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;ZZLcom/google/android/gms/ads/internal/formats/NativeAdOptionsParcel;Ljava/util/List;)V

    iput-object v4, v1, Lcom/google/android/gms/internal/zzgh;->zzbpd:Lcom/google/android/gms/internal/zzgd;

    monitor-exit v22
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    iget-object v3, v1, Lcom/google/android/gms/internal/zzgh;->zzbpd:Lcom/google/android/gms/internal/zzgd;

    iget-wide v4, v1, Lcom/google/android/gms/internal/zzgh;->zzbou:J

    iget-wide v6, v1, Lcom/google/android/gms/internal/zzgh;->zzbov:J

    invoke-virtual {v3, v4, v5, v6, v7}, Lcom/google/android/gms/internal/zzgd;->zza(JJ)Lcom/google/android/gms/internal/zzge;

    move-result-object v3

    iget-object v4, v1, Lcom/google/android/gms/internal/zzgh;->zzboz:Ljava/util/List;

    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget v4, v3, Lcom/google/android/gms/internal/zzge;->zzbom:I

    const/4 v5, 0x0

    if-nez v4, :cond_4

    const-string v4, "Adapter succeeded."

    invoke-static {v4}, Lcom/google/android/gms/internal/zzkd;->zzcv(Ljava/lang/String;)V

    iget-object v4, v1, Lcom/google/android/gms/internal/zzgh;->zzajn:Lcom/google/android/gms/internal/zzdk;

    const-string v6, "mediation_network_succeed"

    invoke-virtual {v4, v6, v2}, Lcom/google/android/gms/internal/zzdk;->zzh(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_3

    iget-object v2, v1, Lcom/google/android/gms/internal/zzgh;->zzajn:Lcom/google/android/gms/internal/zzdk;

    const-string v4, ","

    invoke-static {v4, v0}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v0

    const-string v4, "mediation_networks_fail"

    invoke-virtual {v2, v4, v0}, Lcom/google/android/gms/internal/zzdk;->zzh(Ljava/lang/String;Ljava/lang/String;)V

    :cond_3
    iget-object v0, v1, Lcom/google/android/gms/internal/zzgh;->zzajn:Lcom/google/android/gms/internal/zzdk;

    const/4 v4, 0x1

    new-array v2, v4, [Ljava/lang/String;

    const-string v6, "mls"

    aput-object v6, v2, v5

    move-object/from16 v6, v24

    invoke-virtual {v0, v6, v2}, Lcom/google/android/gms/internal/zzdk;->zza(Lcom/google/android/gms/internal/zzdi;[Ljava/lang/String;)Z

    iget-object v0, v1, Lcom/google/android/gms/internal/zzgh;->zzajn:Lcom/google/android/gms/internal/zzdk;

    new-array v2, v4, [Ljava/lang/String;

    const-string v4, "ttm"

    aput-object v4, v2, v5

    move-object/from16 v7, v21

    invoke-virtual {v0, v7, v2}, Lcom/google/android/gms/internal/zzdk;->zza(Lcom/google/android/gms/internal/zzdi;[Ljava/lang/String;)Z

    return-object v3

    :cond_4
    move-object/from16 v7, v21

    move-object/from16 v6, v24

    const/4 v4, 0x1

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v2, v1, Lcom/google/android/gms/internal/zzgh;->zzajn:Lcom/google/android/gms/internal/zzdk;

    new-array v8, v4, [Ljava/lang/String;

    const-string v4, "mlf"

    aput-object v4, v8, v5

    invoke-virtual {v2, v6, v8}, Lcom/google/android/gms/internal/zzdk;->zza(Lcom/google/android/gms/internal/zzdi;[Ljava/lang/String;)Z

    iget-object v2, v3, Lcom/google/android/gms/internal/zzge;->zzboo:Lcom/google/android/gms/internal/zzgk;

    if-eqz v2, :cond_5

    sget-object v2, Lcom/google/android/gms/internal/zzkh;->zzclc:Landroid/os/Handler;

    new-instance v4, Lcom/google/android/gms/internal/zzgh$1;

    invoke-direct {v4, v1, v3}, Lcom/google/android/gms/internal/zzgh$1;-><init>(Lcom/google/android/gms/internal/zzgh;Lcom/google/android/gms/internal/zzge;)V

    invoke-virtual {v2, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_5
    move-object v2, v7

    move-object/from16 v3, v20

    move-object/from16 v4, v23

    goto/16 :goto_1

    :catchall_0
    move-exception v0

    move-object/from16 v22, v13

    :goto_2
    :try_start_2
    monitor-exit v22
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v0

    :catchall_1
    move-exception v0

    goto :goto_2

    :cond_6
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_7

    iget-object v2, v1, Lcom/google/android/gms/internal/zzgh;->zzajn:Lcom/google/android/gms/internal/zzdk;

    const-string v3, ","

    invoke-static {v3, v0}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v0

    const-string v3, "mediation_networks_fail"

    invoke-virtual {v2, v3, v0}, Lcom/google/android/gms/internal/zzdk;->zzh(Ljava/lang/String;Ljava/lang/String;)V

    :cond_7
    new-instance v0, Lcom/google/android/gms/internal/zzge;

    const/4 v2, 0x1

    invoke-direct {v0, v2}, Lcom/google/android/gms/internal/zzge;-><init>(I)V

    return-object v0
.end method

.method public zzmg()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/android/gms/internal/zzge;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgh;->zzboz:Ljava/util/List;

    return-object v0
.end method
