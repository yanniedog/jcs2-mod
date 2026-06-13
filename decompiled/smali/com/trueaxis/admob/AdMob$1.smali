.class Lcom/trueaxis/admob/AdMob$1;
.super Ljava/lang/Object;
.source "AdMob.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/admob/AdMob;->initAdMob()V
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

    .line 27
    iput-object p1, p0, Lcom/trueaxis/admob/AdMob$1;->this$0:Lcom/trueaxis/admob/AdMob;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 31
    invoke-static {}, Lcom/trueaxis/game/Interface;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    .line 32
    iget-object v1, p0, Lcom/trueaxis/admob/AdMob$1;->this$0:Lcom/trueaxis/admob/AdMob;

    new-instance v2, Lcom/google/android/gms/ads/InterstitialAd;

    invoke-direct {v2, v0}, Lcom/google/android/gms/ads/InterstitialAd;-><init>(Landroid/content/Context;)V

    invoke-static {v1, v2}, Lcom/trueaxis/admob/AdMob;->access$002(Lcom/trueaxis/admob/AdMob;Lcom/google/android/gms/ads/InterstitialAd;)Lcom/google/android/gms/ads/InterstitialAd;

    .line 33
    iget-object v0, p0, Lcom/trueaxis/admob/AdMob$1;->this$0:Lcom/trueaxis/admob/AdMob;

    invoke-static {v0}, Lcom/trueaxis/admob/AdMob;->access$000(Lcom/trueaxis/admob/AdMob;)Lcom/google/android/gms/ads/InterstitialAd;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 35
    iget-object v0, p0, Lcom/trueaxis/admob/AdMob$1;->this$0:Lcom/trueaxis/admob/AdMob;

    invoke-static {v0}, Lcom/trueaxis/admob/AdMob;->access$000(Lcom/trueaxis/admob/AdMob;)Lcom/google/android/gms/ads/InterstitialAd;

    move-result-object v0

    sget-object v1, Lcom/trueaxis/game/InterfaceShared;->AMKey:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/ads/InterstitialAd;->setAdUnitId(Ljava/lang/String;)V

    .line 37
    iget-object v0, p0, Lcom/trueaxis/admob/AdMob$1;->this$0:Lcom/trueaxis/admob/AdMob;

    invoke-static {v0}, Lcom/trueaxis/admob/AdMob;->access$000(Lcom/trueaxis/admob/AdMob;)Lcom/google/android/gms/ads/InterstitialAd;

    move-result-object v0

    new-instance v1, Lcom/trueaxis/admob/AdMob$1$1;

    invoke-direct {v1, p0}, Lcom/trueaxis/admob/AdMob$1$1;-><init>(Lcom/trueaxis/admob/AdMob$1;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/ads/InterstitialAd;->setAdListener(Lcom/google/android/gms/ads/AdListener;)V

    :cond_0
    return-void
.end method
