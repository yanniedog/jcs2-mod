.class Lcom/trueaxis/admob/AdMob$3;
.super Ljava/lang/Object;
.source "AdMob.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/admob/AdMob;->showAd()V
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

    .line 115
    iput-object p1, p0, Lcom/trueaxis/admob/AdMob$3;->this$0:Lcom/trueaxis/admob/AdMob;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 119
    iget-object v0, p0, Lcom/trueaxis/admob/AdMob$3;->this$0:Lcom/trueaxis/admob/AdMob;

    invoke-static {v0}, Lcom/trueaxis/admob/AdMob;->access$000(Lcom/trueaxis/admob/AdMob;)Lcom/google/android/gms/ads/InterstitialAd;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 121
    iget-object v0, p0, Lcom/trueaxis/admob/AdMob$3;->this$0:Lcom/trueaxis/admob/AdMob;

    invoke-static {v0}, Lcom/trueaxis/admob/AdMob;->access$000(Lcom/trueaxis/admob/AdMob;)Lcom/google/android/gms/ads/InterstitialAd;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/ads/InterstitialAd;->isLoaded()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    .line 123
    sput-boolean v0, Lcom/trueaxis/admob/AdMob;->stopRestoreAsyncInProgress:Z

    .line 124
    iget-object v0, p0, Lcom/trueaxis/admob/AdMob$3;->this$0:Lcom/trueaxis/admob/AdMob;

    invoke-static {v0}, Lcom/trueaxis/admob/AdMob;->access$000(Lcom/trueaxis/admob/AdMob;)Lcom/google/android/gms/ads/InterstitialAd;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/ads/InterstitialAd;->show()V

    :cond_0
    return-void
.end method
