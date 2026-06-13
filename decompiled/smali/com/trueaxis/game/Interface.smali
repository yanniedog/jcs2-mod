.class public Lcom/trueaxis/game/Interface;
.super Lcom/trueaxis/game/InterfaceShared;
.source "Interface.java"


# static fields
.field public static base64EncodedPublicKey:Ljava/lang/String;

.field public static moreSkus:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 30
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/trueaxis/game/Interface;->moreSkus:Ljava/util/ArrayList;

    const-string v0, "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAkHR0FjysHof5clF+L+QZlVDm2QdlLY9yRgntQvKsNpmeLDfHE+UGm8uCIj8ZmbMoe3db2GaI/IyAmOYxhuvVh62+YA3RAcCsov9UOeDqF87YPDUkX4inmJ2nh4bTWVCQr3FQFyeNu451rZgll3UtCBOK2NmOXfqS8c0e74tnxUf8+qixhgj6yeNDft6YCIPB5RCKhH/3TTWMB3K4gzz7qJJVV4i3kmff01n7/HGoWh+ksZ7jjjllYdnd6Jn9qyJLaGsJhLnaCRdww3EQYPGmwdfC9VW2ioiWoCaoYMtCr87+Y35jNmXrFaaho98jsaEATPrxssdKk238OzKvt9MEuwIDAQAB"

    .line 31
    sput-object v0, Lcom/trueaxis/game/Interface;->base64EncodedPublicKey:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 28
    invoke-direct {p0}, Lcom/trueaxis/game/InterfaceShared;-><init>()V

    return-void
.end method

.method public static addSkuToList(Ljava/lang/String;)V
    .locals 2

    .line 35
    sget-object v0, Lcom/trueaxis/game/Interface;->moreSkus:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 37
    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-void

    .line 41
    :cond_1
    sget-object v0, Lcom/trueaxis/game/Interface;->moreSkus:Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public static initialiseExtra(Landroid/content/Context;)V
    .locals 0

    return-void
.end method

.method public static onPauseExtra()V
    .locals 2

    .line 142
    sget-boolean v0, Lcom/trueaxis/googleIAP/GoogleIAP;->stopViewFromDisappearingOnPurchase:Z

    if-nez v0, :cond_0

    .line 143
    sget-object v0, Lcom/trueaxis/util/Util;->mySurface:Landroid/view/SurfaceView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/SurfaceView;->setVisibility(I)V

    :cond_0
    return-void
.end method

.method public static onQueryInventoryConsume(Lcom/trueaxis/googleIAP/IabResult;Lcom/trueaxis/googleIAP/Inventory;)V
    .locals 2

    .line 46
    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    const/4 v0, 0x0

    .line 48
    :goto_0
    sget-object v1, Lcom/trueaxis/game/Interface;->moreSkus:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 50
    sget-object v1, Lcom/trueaxis/game/Interface;->moreSkus:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p1, v1}, Lcom/trueaxis/googleIAP/Inventory;->hasPurchase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 52
    sget-object v1, Lcom/trueaxis/game/Interface;->moreSkus:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p1, v1}, Lcom/trueaxis/googleIAP/Inventory;->getPurchase(Ljava/lang/String;)Lcom/trueaxis/googleIAP/Purchase;

    move-result-object v1

    invoke-interface {p0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 56
    :cond_1
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_2

    .line 58
    sget-object p1, Lcom/trueaxis/googleIAP/GoogleIAP;->mHelper:Lcom/trueaxis/googleIAP/IabHelper;

    const/4 v0, 0x0

    invoke-virtual {p1, p0, v0}, Lcom/trueaxis/googleIAP/IabHelper;->consumeAsync(Ljava/util/List;Lcom/trueaxis/googleIAP/IabHelper$OnConsumeMultiFinishedListener;)V

    :cond_2
    return-void
.end method

.method public static onQueryInventoryFinished(Lcom/trueaxis/googleIAP/IabResult;Lcom/trueaxis/googleIAP/Inventory;)V
    .locals 7

    const/4 v0, 0x0

    if-eqz p1, :cond_6

    .line 66
    sget-object v1, Lcom/trueaxis/game/Interface;->moreSkus:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 68
    invoke-virtual {p1, v2}, Lcom/trueaxis/googleIAP/Inventory;->hasDetails(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 70
    invoke-virtual {p1, v2}, Lcom/trueaxis/googleIAP/Inventory;->getSkuDetails(Ljava/lang/String;)Lcom/trueaxis/googleIAP/SkuDetails;

    move-result-object v3

    .line 71
    invoke-virtual {v3}, Lcom/trueaxis/googleIAP/SkuDetails;->getTitle()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3}, Lcom/trueaxis/googleIAP/SkuDetails;->getDescription()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3}, Lcom/trueaxis/googleIAP/SkuDetails;->getPrice()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v4, v5, v3}, Lcom/trueaxis/cLib/TrueaxisLib;->populateStore(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 74
    :cond_1
    invoke-static {}, Lcom/trueaxis/cLib/TrueaxisLib;->VerifyCompleted()V

    .line 75
    sget-boolean v1, Lcom/trueaxis/googleIAP/GoogleIAP;->doCompleteRestore:Z

    if-eqz v1, :cond_7

    .line 77
    sget-object v1, Lcom/trueaxis/game/Interface;->moreSkus:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_7

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 79
    invoke-virtual {p1, v2}, Lcom/trueaxis/googleIAP/Inventory;->hasPurchase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 81
    invoke-virtual {p1, v2}, Lcom/trueaxis/googleIAP/Inventory;->getPurchase(Ljava/lang/String;)Lcom/trueaxis/googleIAP/Purchase;

    move-result-object v3

    .line 83
    invoke-virtual {v3}, Lcom/trueaxis/googleIAP/Purchase;->getPurchaseState()I

    move-result v4

    if-eqz v4, :cond_3

    invoke-virtual {v3}, Lcom/trueaxis/googleIAP/Purchase;->getPurchaseState()I

    move-result v4

    const/4 v5, 0x2

    if-ne v4, v5, :cond_2

    goto :goto_2

    .line 105
    :cond_2
    invoke-virtual {p0}, Lcom/trueaxis/googleIAP/IabResult;->getResponse()I

    move-result v3

    invoke-static {v2, v3}, Lcom/trueaxis/cLib/TrueaxisLib;->purchaseFail(Ljava/lang/String;I)V

    goto :goto_1

    .line 85
    :cond_3
    :goto_2
    invoke-static {v3}, Lcom/trueaxis/googleIAP/GoogleIAP;->verifyDeveloperPayload(Lcom/trueaxis/googleIAP/Purchase;)Z

    move-result v4

    const/16 v5, -0x7d0

    if-eqz v4, :cond_4

    .line 90
    :try_start_0
    invoke-virtual {v3}, Lcom/trueaxis/googleIAP/Purchase;->getOriginalJson()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3}, Lcom/trueaxis/googleIAP/Purchase;->getSignature()Ljava/lang/String;

    move-result-object v3

    const-string v6, "UTF-8"

    invoke-static {v3, v6}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v4, v3, v0}, Lcom/trueaxis/cLib/TrueaxisLib;->purchaseSuccess(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 94
    :catch_0
    invoke-static {v2, v5}, Lcom/trueaxis/cLib/TrueaxisLib;->purchaseFail(Ljava/lang/String;I)V

    goto :goto_1

    .line 100
    :cond_4
    invoke-static {v2, v5}, Lcom/trueaxis/cLib/TrueaxisLib;->purchaseFail(Ljava/lang/String;I)V

    goto :goto_1

    .line 110
    :cond_5
    invoke-virtual {p0}, Lcom/trueaxis/googleIAP/IabResult;->getResponse()I

    move-result v3

    invoke-static {v2, v3}, Lcom/trueaxis/cLib/TrueaxisLib;->purchaseFail(Ljava/lang/String;I)V

    goto :goto_1

    .line 119
    :cond_6
    sget-object p1, Lcom/trueaxis/game/Interface;->moreSkus:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_3
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_7

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 120
    invoke-virtual {p0}, Lcom/trueaxis/googleIAP/IabResult;->getResponse()I

    move-result v2

    invoke-static {v1, v2}, Lcom/trueaxis/cLib/TrueaxisLib;->purchaseFail(Ljava/lang/String;I)V

    goto :goto_3

    .line 123
    :cond_7
    invoke-static {}, Lcom/trueaxis/server/Stub;->ownAll()V

    sput-boolean v0, Lcom/trueaxis/googleIAP/GoogleIAP;->inventoryAsyncInProgress:Z

    return-void
.end method

.method public static onResumeExtra()V
    .locals 2

    .line 148
    sget-boolean v0, Lcom/trueaxis/googleIAP/GoogleIAP;->stopViewFromDisappearingOnPurchase:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 149
    sget-object v0, Lcom/trueaxis/util/Util;->mySurface:Landroid/view/SurfaceView;

    invoke-virtual {v0, v1}, Landroid/view/SurfaceView;->setVisibility(I)V

    .line 151
    :cond_0
    sput-boolean v1, Lcom/trueaxis/googleIAP/GoogleIAP;->stopViewFromDisappearingOnPurchase:Z

    .line 153
    sget-boolean v0, Lcom/trueaxis/googleIAP/GoogleIAP;->storeActive:Z

    if-eqz v0, :cond_2

    .line 155
    sget-boolean v0, Lcom/trueaxis/googleIAP/GoogleIAP;->stopRestoreAsyncInProgress:Z

    if-nez v0, :cond_1

    sget-boolean v0, Lcom/trueaxis/facebook/Facebook;->stopRestoreAsyncInProgress:Z

    if-nez v0, :cond_1

    sget-boolean v0, Lcom/trueaxis/admob/AdMob;->stopRestoreAsyncInProgress:Z

    if-nez v0, :cond_1

    .line 157
    invoke-static {}, Lcom/trueaxis/cLib/TrueaxisLib;->ResetIAPMessages()V

    .line 158
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    const/16 v1, 0x103

    .line 159
    iput v1, v0, Landroid/os/Message;->what:I

    .line 160
    sget-object v1, Lcom/trueaxis/messageHandler/MessageHandler;->ApiHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_0

    .line 162
    :cond_1
    sput-boolean v1, Lcom/trueaxis/googleIAP/GoogleIAP;->stopRestoreAsyncInProgress:Z

    .line 163
    sput-boolean v1, Lcom/trueaxis/facebook/Facebook;->stopRestoreAsyncInProgress:Z

    .line 164
    sput-boolean v1, Lcom/trueaxis/admob/AdMob;->stopRestoreAsyncInProgress:Z

    :cond_2
    :goto_0
    return-void
.end method


# virtual methods
.method public onActivityResultExtra(IILandroid/content/Intent;)Z
    .locals 1

    .line 171
    sget-object v0, Lcom/trueaxis/googleIAP/GoogleIAP;->mHelper:Lcom/trueaxis/googleIAP/IabHelper;

    if-eqz v0, :cond_0

    .line 173
    sget-object v0, Lcom/trueaxis/googleIAP/GoogleIAP;->mHelper:Lcom/trueaxis/googleIAP/IabHelper;

    invoke-virtual {v0, p1, p2, p3}, Lcom/trueaxis/googleIAP/IabHelper;->handleActivityResult(IILandroid/content/Intent;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public onDestroy()V
    .locals 1

    .line 133
    sget-object v0, Lcom/trueaxis/googleIAP/GoogleIAP;->mHelper:Lcom/trueaxis/googleIAP/IabHelper;

    if-eqz v0, :cond_0

    .line 135
    sget-object v0, Lcom/trueaxis/googleIAP/GoogleIAP;->mHelper:Lcom/trueaxis/googleIAP/IabHelper;

    invoke-virtual {v0}, Lcom/trueaxis/googleIAP/IabHelper;->dispose()V

    const/4 v0, 0x0

    .line 136
    sput-object v0, Lcom/trueaxis/googleIAP/GoogleIAP;->mHelper:Lcom/trueaxis/googleIAP/IabHelper;

    :cond_0
    return-void
.end method
