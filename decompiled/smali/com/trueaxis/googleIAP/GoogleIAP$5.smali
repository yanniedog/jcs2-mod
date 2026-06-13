.class final Lcom/trueaxis/googleIAP/GoogleIAP$5;
.super Ljava/lang/Object;
.source "GoogleIAP.java"

# interfaces
.implements Lcom/trueaxis/googleIAP/IabHelper$QueryInventoryFinishedListener;


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

    .line 168
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onQueryInventoryFinished(Lcom/trueaxis/googleIAP/IabResult;Lcom/trueaxis/googleIAP/Inventory;)V
    .locals 2

    .line 171
    sget-object v0, Lcom/trueaxis/googleIAP/GoogleIAP;->mHelper:Lcom/trueaxis/googleIAP/IabHelper;

    if-nez v0, :cond_0

    return-void

    .line 172
    :cond_0
    sget-object v0, Lcom/trueaxis/googleIAP/GoogleIAP;->mHelper:Lcom/trueaxis/googleIAP/IabHelper;

    invoke-virtual {v0}, Lcom/trueaxis/googleIAP/IabHelper;->flagEndAsync()V

    .line 174
    invoke-virtual {p1}, Lcom/trueaxis/googleIAP/IabResult;->isFailure()Z

    move-result p1

    if-eqz p1, :cond_1

    return-void

    .line 179
    :cond_1
    iget-object p1, p2, Lcom/trueaxis/googleIAP/Inventory;->mPurchaseMap:Ljava/util/Map;

    invoke-interface {p1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/trueaxis/googleIAP/Purchase;

    .line 181
    invoke-virtual {p2}, Lcom/trueaxis/googleIAP/Purchase;->getSku()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Lcom/trueaxis/googleIAP/Purchase;->getOriginalJson()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2}, Lcom/trueaxis/googleIAP/Purchase;->getSignature()Ljava/lang/String;

    move-result-object p2

    invoke-static {v0, v1, p2}, Lcom/trueaxis/cLib/TrueaxisLib;->RestoreDLC(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    return-void
.end method
