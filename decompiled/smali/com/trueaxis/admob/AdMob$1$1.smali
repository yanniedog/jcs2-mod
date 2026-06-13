.class Lcom/trueaxis/admob/AdMob$1$1;
.super Lcom/google/android/gms/ads/AdListener;
.source "AdMob.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/admob/AdMob$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/trueaxis/admob/AdMob$1;


# direct methods
.method constructor <init>(Lcom/trueaxis/admob/AdMob$1;)V
    .locals 0

    .line 38
    iput-object p1, p0, Lcom/trueaxis/admob/AdMob$1$1;->this$1:Lcom/trueaxis/admob/AdMob$1;

    invoke-direct {p0}, Lcom/google/android/gms/ads/AdListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onAdClosed()V
    .locals 0

    .line 41
    invoke-static {}, Lcom/trueaxis/cLib/TrueaxisLib;->AdMobNotifyAdFinished()V

    return-void
.end method

.method public onAdFailedToLoad(I)V
    .locals 0

    return-void
.end method

.method public onAdLeftApplication()V
    .locals 0

    return-void
.end method

.method public onAdLoaded()V
    .locals 0

    .line 56
    invoke-static {}, Lcom/trueaxis/cLib/TrueaxisLib;->AdMobNotifyAdLoaded()V

    return-void
.end method

.method public onAdOpened()V
    .locals 0

    return-void
.end method
