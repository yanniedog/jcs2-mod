.class final Lcom/trueaxis/googleIAP/GoogleIAP$2;
.super Ljava/lang/Object;
.source "GoogleIAP.java"

# interfaces
.implements Lcom/trueaxis/googleIAP/IabHelper$OnIabPurchaseFinishedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trueaxis/googleIAP/GoogleIAP;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 112
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onIabPurchaseFinished(Lcom/trueaxis/googleIAP/IabResult;Lcom/trueaxis/googleIAP/Purchase;)V
    .locals 2

    .line 115
    sget-object v0, Lcom/trueaxis/googleIAP/GoogleIAP;->mHelper:Lcom/trueaxis/googleIAP/IabHelper;

    if-nez v0, :cond_0

    return-void

    .line 117
    :cond_0
    sget-object v0, Lcom/trueaxis/googleIAP/GoogleIAP;->mHelper:Lcom/trueaxis/googleIAP/IabHelper;

    invoke-virtual {v0}, Lcom/trueaxis/googleIAP/IabHelper;->flagEndAsync()V

    .line 119
    invoke-virtual {p1}, Lcom/trueaxis/googleIAP/IabResult;->isFailure()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 122
    sget-object p2, Lcom/trueaxis/googleIAP/GoogleIAP;->skuForError:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/trueaxis/googleIAP/IabResult;->getResponse()I

    move-result p1

    invoke-static {p2, p1}, Lcom/trueaxis/cLib/TrueaxisLib;->purchaseFail(Ljava/lang/String;I)V

    return-void

    .line 125
    :cond_1
    invoke-static {p2}, Lcom/trueaxis/googleIAP/GoogleIAP;->verifyDeveloperPayload(Lcom/trueaxis/googleIAP/Purchase;)Z

    move-result p1

    if-nez p1, :cond_2

    .line 128
    invoke-virtual {p2}, Lcom/trueaxis/googleIAP/Purchase;->getSku()Ljava/lang/String;

    move-result-object p1

    const/16 p2, -0x7d0

    invoke-static {p1, p2}, Lcom/trueaxis/cLib/TrueaxisLib;->purchaseFail(Ljava/lang/String;I)V

    return-void

    .line 132
    :cond_2
    :try_start_0
    invoke-virtual {p2}, Lcom/trueaxis/googleIAP/Purchase;->getSku()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2}, Lcom/trueaxis/googleIAP/Purchase;->getOriginalJson()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Lcom/trueaxis/googleIAP/Purchase;->getSignature()Ljava/lang/String;

    move-result-object p2

    const-string v1, "UTF-8"

    invoke-static {p2, v1}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    const/4 v1, 0x0

    invoke-static {p1, v0, p2, v1}, Lcom/trueaxis/cLib/TrueaxisLib;->purchaseSuccess(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method
