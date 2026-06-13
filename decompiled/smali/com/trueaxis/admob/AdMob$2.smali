.class Lcom/trueaxis/admob/AdMob$2;
.super Ljava/lang/Object;
.source "AdMob.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/admob/AdMob;->requestAd()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trueaxis/admob/AdMob;


# direct methods
.method constructor <init>(Lcom/trueaxis/admob/AdMob;)V
    .locals 0

    .line 72
    iput-object p1, p0, Lcom/trueaxis/admob/AdMob$2;->this$0:Lcom/trueaxis/admob/AdMob;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 76
    iget-object v0, p0, Lcom/trueaxis/admob/AdMob$2;->this$0:Lcom/trueaxis/admob/AdMob;

    invoke-static {v0}, Lcom/trueaxis/admob/AdMob;->access$000(Lcom/trueaxis/admob/AdMob;)Lcom/google/android/gms/ads/InterstitialAd;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 78
    iget-object v0, p0, Lcom/trueaxis/admob/AdMob$2;->this$0:Lcom/trueaxis/admob/AdMob;

    invoke-static {v0}, Lcom/trueaxis/admob/AdMob;->access$000(Lcom/trueaxis/admob/AdMob;)Lcom/google/android/gms/ads/InterstitialAd;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/ads/InterstitialAd;->isLoaded()Z

    move-result v0

    if-nez v0, :cond_2

    .line 81
    sget-boolean v0, Lcom/trueaxis/admob/AdMob;->bEuropean:Z

    if-eqz v0, :cond_1

    .line 83
    sget-boolean v0, Lcom/trueaxis/admob/AdMob;->bPersonelised:Z

    if-eqz v0, :cond_0

    .line 85
    new-instance v0, Lcom/google/android/gms/ads/AdRequest$Builder;

    invoke-direct {v0}, Lcom/google/android/gms/ads/AdRequest$Builder;-><init>()V

    invoke-virtual {v0}, Lcom/google/android/gms/ads/AdRequest$Builder;->build()Lcom/google/android/gms/ads/AdRequest;

    move-result-object v0

    goto :goto_0

    .line 90
    :cond_0
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "npa"

    const-string v2, "1"

    .line 91
    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    new-instance v1, Lcom/google/android/gms/ads/AdRequest$Builder;

    invoke-direct {v1}, Lcom/google/android/gms/ads/AdRequest$Builder;-><init>()V

    const-class v2, Lcom/google/ads/mediation/admob/AdMobAdapter;

    invoke-virtual {v1, v2, v0}, Lcom/google/android/gms/ads/AdRequest$Builder;->addNetworkExtrasBundle(Ljava/lang/Class;Landroid/os/Bundle;)Lcom/google/android/gms/ads/AdRequest$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/ads/AdRequest$Builder;->build()Lcom/google/android/gms/ads/AdRequest;

    move-result-object v0

    goto :goto_0

    .line 98
    :cond_1
    new-instance v0, Lcom/google/android/gms/ads/AdRequest$Builder;

    invoke-direct {v0}, Lcom/google/android/gms/ads/AdRequest$Builder;-><init>()V

    invoke-virtual {v0}, Lcom/google/android/gms/ads/AdRequest$Builder;->build()Lcom/google/android/gms/ads/AdRequest;

    move-result-object v0

    .line 101
    :goto_0
    iget-object v1, p0, Lcom/trueaxis/admob/AdMob$2;->this$0:Lcom/trueaxis/admob/AdMob;

    invoke-static {v1}, Lcom/trueaxis/admob/AdMob;->access$000(Lcom/trueaxis/admob/AdMob;)Lcom/google/android/gms/ads/InterstitialAd;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/google/android/gms/ads/InterstitialAd;->loadAd(Lcom/google/android/gms/ads/AdRequest;)V

    goto :goto_1

    .line 105
    :cond_2
    invoke-static {}, Lcom/trueaxis/cLib/TrueaxisLib;->AdMobNotifyAdLoaded()V

    :cond_3
    :goto_1
    return-void
.end method
