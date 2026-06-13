.class Lcom/trueaxis/googleMessageHandler/GoogleMessageHandler$1$1;
.super Ljava/lang/Object;
.source "GoogleMessageHandler.java"

# interfaces
.implements Lcom/trueaxis/googleIAP/IabHelper$OnIabSetupFinishedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/googleMessageHandler/GoogleMessageHandler$1;->handleMessage(Landroid/os/Message;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trueaxis/googleMessageHandler/GoogleMessageHandler$1;


# direct methods
.method constructor <init>(Lcom/trueaxis/googleMessageHandler/GoogleMessageHandler$1;)V
    .locals 0

    .line 44
    iput-object p1, p0, Lcom/trueaxis/googleMessageHandler/GoogleMessageHandler$1$1;->this$0:Lcom/trueaxis/googleMessageHandler/GoogleMessageHandler$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onIabSetupFinished(Lcom/trueaxis/googleIAP/IabResult;)V
    .locals 3

    .line 47
    invoke-virtual {p1}, Lcom/trueaxis/googleIAP/IabResult;->isSuccess()Z

    move-result p1

    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 49
    invoke-static {v0}, Lcom/trueaxis/cLib/TrueaxisLib;->initStore(Z)V

    goto :goto_0

    .line 53
    :cond_0
    sget-object p1, Lcom/trueaxis/googleIAP/GoogleIAP;->mHelper:Lcom/trueaxis/googleIAP/IabHelper;

    if-nez p1, :cond_1

    .line 55
    invoke-static {v0}, Lcom/trueaxis/cLib/TrueaxisLib;->initStore(Z)V

    return-void

    :cond_1
    const/4 p1, 0x1

    .line 59
    sput-boolean p1, Lcom/trueaxis/googleIAP/GoogleIAP;->storeActive:Z

    .line 60
    invoke-static {p1}, Lcom/trueaxis/cLib/TrueaxisLib;->initStore(Z)V

    .line 61
    sget-boolean v0, Lcom/trueaxis/googleIAP/GoogleIAP;->inventoryAsyncInProgress:Z

    if-nez v0, :cond_2

    .line 63
    sput-boolean p1, Lcom/trueaxis/googleIAP/GoogleIAP;->inventoryAsyncInProgress:Z

    .line 66
    :try_start_0
    sget-object v0, Lcom/trueaxis/googleIAP/GoogleIAP;->mHelper:Lcom/trueaxis/googleIAP/IabHelper;

    sget-object v1, Lcom/trueaxis/game/Interface;->moreSkus:Ljava/util/ArrayList;

    sget-object v2, Lcom/trueaxis/googleIAP/GoogleIAP;->mGotInventoryListener:Lcom/trueaxis/googleIAP/IabHelper$QueryInventoryFinishedListener;

    invoke-virtual {v0, p1, v1, v2}, Lcom/trueaxis/googleIAP/IabHelper;->queryInventoryAsync(ZLjava/util/List;Lcom/trueaxis/googleIAP/IabHelper$QueryInventoryFinishedListener;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 68
    :catch_0
    sget-object p1, Lcom/trueaxis/googleIAP/GoogleIAP;->mHelper:Lcom/trueaxis/googleIAP/IabHelper;

    invoke-virtual {p1}, Lcom/trueaxis/googleIAP/IabHelper;->flagEndAsync()V

    :cond_2
    :goto_0
    return-void
.end method
