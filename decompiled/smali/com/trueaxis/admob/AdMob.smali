.class public Lcom/trueaxis/admob/AdMob;
.super Ljava/lang/Object;
.source "AdMob.java"


# static fields
.field public static bEuropean:Z = false

.field public static bPersonelised:Z = true

.field public static stopRestoreAsyncInProgress:Z


# instance fields
.field private interstitial:Lcom/google/android/gms/ads/InterstitialAd;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 18
    iput-object v0, p0, Lcom/trueaxis/admob/AdMob;->interstitial:Lcom/google/android/gms/ads/InterstitialAd;

    return-void
.end method

.method static synthetic access$000(Lcom/trueaxis/admob/AdMob;)Lcom/google/android/gms/ads/InterstitialAd;
    .locals 0

    .line 16
    iget-object p0, p0, Lcom/trueaxis/admob/AdMob;->interstitial:Lcom/google/android/gms/ads/InterstitialAd;

    return-object p0
.end method

.method static synthetic access$002(Lcom/trueaxis/admob/AdMob;Lcom/google/android/gms/ads/InterstitialAd;)Lcom/google/android/gms/ads/InterstitialAd;
    .locals 0

    .line 16
    iput-object p1, p0, Lcom/trueaxis/admob/AdMob;->interstitial:Lcom/google/android/gms/ads/InterstitialAd;

    return-object p1
.end method


# virtual methods
.method public initAdMob()V
    .locals 2

    .line 26
    invoke-static {}, Lcom/trueaxis/game/Interface;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/trueaxis/admob/AdMob$1;

    invoke-direct {v1, p0}, Lcom/trueaxis/admob/AdMob$1;-><init>(Lcom/trueaxis/admob/AdMob;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public isEurope()Z
    .locals 1

    .line 133
    sget-boolean v0, Lcom/trueaxis/admob/AdMob;->bEuropean:Z

    return v0
.end method

.method public requestAd()V
    .locals 2

    .line 71
    invoke-static {}, Lcom/trueaxis/game/Interface;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/trueaxis/admob/AdMob$2;

    invoke-direct {v1, p0}, Lcom/trueaxis/admob/AdMob$2;-><init>(Lcom/trueaxis/admob/AdMob;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public showAd()V
    .locals 2

    # honor the in-game "Disable ads" toggle
    invoke-static {}, Lcom/trueaxis/game/Interface;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/trueaxis/modmenu/ModMenu;->adsDisabled(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :ads_ok

    return-void

    :ads_ok
    .line 114
    invoke-static {}, Lcom/trueaxis/game/Interface;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/trueaxis/admob/AdMob$3;

    invoke-direct {v1, p0}, Lcom/trueaxis/admob/AdMob$3;-><init>(Lcom/trueaxis/admob/AdMob;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method
