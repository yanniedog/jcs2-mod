.class public abstract Lcom/google/android/gms/internal/zzhy;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzkj;
.implements Lcom/google/android/gms/internal/zzli$zza;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzin;
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/gms/internal/zzkj<",
        "Ljava/lang/Void;",
        ">;",
        "Lcom/google/android/gms/internal/zzli$zza;"
    }
.end annotation


# instance fields
.field protected final mContext:Landroid/content/Context;

.field protected final zzbgf:Lcom/google/android/gms/internal/zzlh;

.field protected final zzbxq:Lcom/google/android/gms/internal/zzic$zza;

.field protected final zzbxr:Lcom/google/android/gms/internal/zzju$zza;

.field protected zzbxs:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

.field private zzbxt:Ljava/lang/Runnable;

.field protected final zzbxu:Ljava/lang/Object;

.field private zzbxv:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method protected constructor <init>(Landroid/content/Context;Lcom/google/android/gms/internal/zzju$zza;Lcom/google/android/gms/internal/zzlh;Lcom/google/android/gms/internal/zzic$zza;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzhy;->zzbxu:Ljava/lang/Object;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzhy;->zzbxv:Ljava/util/concurrent/atomic/AtomicBoolean;

    iput-object p1, p0, Lcom/google/android/gms/internal/zzhy;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzhy;->zzbxr:Lcom/google/android/gms/internal/zzju$zza;

    iget-object p1, p0, Lcom/google/android/gms/internal/zzhy;->zzbxr:Lcom/google/android/gms/internal/zzju$zza;

    iget-object p1, p1, Lcom/google/android/gms/internal/zzju$zza;->zzciq:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iput-object p1, p0, Lcom/google/android/gms/internal/zzhy;->zzbxs:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzhy;->zzbgf:Lcom/google/android/gms/internal/zzlh;

    iput-object p4, p0, Lcom/google/android/gms/internal/zzhy;->zzbxq:Lcom/google/android/gms/internal/zzic$zza;

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzhy;)Ljava/util/concurrent/atomic/AtomicBoolean;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/zzhy;->zzbxv:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-object p0
.end method

.method private zzak(I)Lcom/google/android/gms/internal/zzju;
    .locals 38

    move-object/from16 v0, p0

    move/from16 v5, p1

    iget-object v1, v0, Lcom/google/android/gms/internal/zzhy;->zzbxr:Lcom/google/android/gms/internal/zzju$zza;

    iget-object v11, v1, Lcom/google/android/gms/internal/zzju$zza;->zzcip:Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;

    new-instance v37, Lcom/google/android/gms/internal/zzju;

    move-object/from16 v1, v37

    iget-object v2, v11, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzcar:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

    iget-object v3, v0, Lcom/google/android/gms/internal/zzhy;->zzbgf:Lcom/google/android/gms/internal/zzlh;

    iget-object v4, v0, Lcom/google/android/gms/internal/zzhy;->zzbxs:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-object v4, v4, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzbnm:Ljava/util/List;

    iget-object v6, v0, Lcom/google/android/gms/internal/zzhy;->zzbxs:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-object v6, v6, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzbnn:Ljava/util/List;

    iget-object v7, v0, Lcom/google/android/gms/internal/zzhy;->zzbxs:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-object v7, v7, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzcca:Ljava/util/List;

    iget-object v8, v0, Lcom/google/android/gms/internal/zzhy;->zzbxs:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget v8, v8, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->orientation:I

    iget-object v9, v0, Lcom/google/android/gms/internal/zzhy;->zzbxs:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-wide v9, v9, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzbns:J

    iget-object v11, v11, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzcau:Ljava/lang/String;

    iget-object v12, v0, Lcom/google/android/gms/internal/zzhy;->zzbxs:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-boolean v12, v12, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzcby:Z

    iget-object v13, v0, Lcom/google/android/gms/internal/zzhy;->zzbxs:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-wide v13, v13, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzcbz:J

    move-wide/from16 v18, v13

    iget-object v13, v0, Lcom/google/android/gms/internal/zzhy;->zzbxr:Lcom/google/android/gms/internal/zzju$zza;

    iget-object v13, v13, Lcom/google/android/gms/internal/zzju$zza;->zzapa:Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    move-object/from16 v20, v13

    iget-object v13, v0, Lcom/google/android/gms/internal/zzhy;->zzbxs:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-wide v13, v13, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzcbx:J

    move-wide/from16 v21, v13

    iget-object v13, v0, Lcom/google/android/gms/internal/zzhy;->zzbxr:Lcom/google/android/gms/internal/zzju$zza;

    iget-wide v13, v13, Lcom/google/android/gms/internal/zzju$zza;->zzcik:J

    move-wide/from16 v23, v13

    iget-object v13, v0, Lcom/google/android/gms/internal/zzhy;->zzbxs:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-wide v13, v13, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzccc:J

    move-wide/from16 v25, v13

    iget-object v13, v0, Lcom/google/android/gms/internal/zzhy;->zzbxs:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-object v13, v13, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzccd:Ljava/lang/String;

    move-object/from16 v27, v13

    iget-object v13, v0, Lcom/google/android/gms/internal/zzhy;->zzbxr:Lcom/google/android/gms/internal/zzju$zza;

    iget-object v13, v13, Lcom/google/android/gms/internal/zzju$zza;->zzcie:Lorg/json/JSONObject;

    move-object/from16 v28, v13

    iget-object v13, v0, Lcom/google/android/gms/internal/zzhy;->zzbxs:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-object v13, v13, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzccn:Lcom/google/android/gms/ads/internal/reward/mediation/client/RewardItemParcel;

    move-object/from16 v30, v13

    iget-object v13, v0, Lcom/google/android/gms/internal/zzhy;->zzbxs:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-object v13, v13, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzcco:Ljava/util/List;

    move-object/from16 v31, v13

    iget-object v13, v0, Lcom/google/android/gms/internal/zzhy;->zzbxs:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-object v13, v13, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzccp:Ljava/util/List;

    move-object/from16 v32, v13

    iget-object v13, v0, Lcom/google/android/gms/internal/zzhy;->zzbxs:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-boolean v13, v13, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzccq:Z

    move/from16 v33, v13

    iget-object v13, v0, Lcom/google/android/gms/internal/zzhy;->zzbxs:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-object v13, v13, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzccr:Lcom/google/android/gms/ads/internal/request/AutoClickProtectionConfigurationParcel;

    move-object/from16 v34, v13

    iget-object v13, v0, Lcom/google/android/gms/internal/zzhy;->zzbxs:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-object v13, v13, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzbnp:Ljava/util/List;

    move-object/from16 v36, v13

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v29, 0x0

    const/16 v35, 0x0

    invoke-direct/range {v1 .. v36}, Lcom/google/android/gms/internal/zzju;-><init>(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;Lcom/google/android/gms/internal/zzlh;Ljava/util/List;ILjava/util/List;Ljava/util/List;IJLjava/lang/String;ZLcom/google/android/gms/internal/zzfz;Lcom/google/android/gms/internal/zzgk;Ljava/lang/String;Lcom/google/android/gms/internal/zzga;Lcom/google/android/gms/internal/zzgc;JLcom/google/android/gms/ads/internal/client/AdSizeParcel;JJJLjava/lang/String;Lorg/json/JSONObject;Lcom/google/android/gms/ads/internal/formats/zzh$zza;Lcom/google/android/gms/ads/internal/reward/mediation/client/RewardItemParcel;Ljava/util/List;Ljava/util/List;ZLcom/google/android/gms/ads/internal/request/AutoClickProtectionConfigurationParcel;Ljava/lang/String;Ljava/util/List;)V

    return-object v37
.end method


# virtual methods
.method public cancel()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzhy;->zzbxv:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzhy;->zzbgf:Lcom/google/android/gms/internal/zzlh;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzlh;->stopLoading()V

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzfs()Lcom/google/android/gms/internal/zzki;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzhy;->zzbgf:Lcom/google/android/gms/internal/zzlh;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzki;->zzi(Lcom/google/android/gms/internal/zzlh;)Z

    const/4 v0, -0x1

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzhy;->zzaj(I)V

    sget-object v0, Lcom/google/android/gms/internal/zzkh;->zzclc:Landroid/os/Handler;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzhy;->zzbxt:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    return-void
.end method

.method public zza(Lcom/google/android/gms/internal/zzlh;Z)V
    .locals 1

    const-string p1, "WebView finished loading."

    invoke-static {p1}, Lcom/google/android/gms/internal/zzkd;->zzcv(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/google/android/gms/internal/zzhy;->zzbxv:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result p1

    if-nez p1, :cond_0

    return-void

    :cond_0
    if-eqz p2, :cond_1

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzhy;->zzpx()I

    move-result v0

    :cond_1
    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzhy;->zzaj(I)V

    sget-object p1, Lcom/google/android/gms/internal/zzkh;->zzclc:Landroid/os/Handler;

    iget-object p2, p0, Lcom/google/android/gms/internal/zzhy;->zzbxt:Ljava/lang/Runnable;

    invoke-virtual {p1, p2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    return-void
.end method

.method protected zzaj(I)V
    .locals 3

    const/4 v0, -0x2

    if-eq p1, v0, :cond_0

    new-instance v0, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzhy;->zzbxs:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-wide v1, v1, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzbns:J

    invoke-direct {v0, p1, v1, v2}, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;-><init>(IJ)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzhy;->zzbxs:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzhy;->zzbgf:Lcom/google/android/gms/internal/zzlh;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzlh;->zzud()V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzhy;->zzbxq:Lcom/google/android/gms/internal/zzic$zza;

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzhy;->zzak(I)Lcom/google/android/gms/internal/zzju;

    move-result-object p1

    invoke-interface {v0, p1}, Lcom/google/android/gms/internal/zzic$zza;->zzb(Lcom/google/android/gms/internal/zzju;)V

    return-void
.end method

.method public final zzpv()Ljava/lang/Void;
    .locals 4

    const-string v0, "Webview render task needs to be called on UI thread."

    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzab;->zzhi(Ljava/lang/String;)V

    new-instance v0, Lcom/google/android/gms/internal/zzhy$1;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/zzhy$1;-><init>(Lcom/google/android/gms/internal/zzhy;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzhy;->zzbxt:Ljava/lang/Runnable;

    sget-object v0, Lcom/google/android/gms/internal/zzkh;->zzclc:Landroid/os/Handler;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzhy;->zzbxt:Ljava/lang/Runnable;

    sget-object v2, Lcom/google/android/gms/internal/zzdc;->zzbbh:Lcom/google/android/gms/internal/zzcy;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzcy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzhy;->zzpw()V

    const/4 v0, 0x0

    return-object v0
.end method

.method protected abstract zzpw()V
.end method

.method protected zzpx()I
    .locals 1

    const/4 v0, -0x2

    return v0
.end method

.method public synthetic zzpy()Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzhy;->zzpv()Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method
