.class final Lcom/trueaxis/googleIAP/GoogleIAP$4;
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

    .line 155
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onQueryInventoryFinished(Lcom/trueaxis/googleIAP/IabResult;Lcom/trueaxis/googleIAP/Inventory;)V
    .locals 1

    .line 158
    sget-object v0, Lcom/trueaxis/googleIAP/GoogleIAP;->mHelper:Lcom/trueaxis/googleIAP/IabHelper;

    if-nez v0, :cond_0

    return-void

    .line 159
    :cond_0
    sget-object v0, Lcom/trueaxis/googleIAP/GoogleIAP;->mHelper:Lcom/trueaxis/googleIAP/IabHelper;

    invoke-virtual {v0}, Lcom/trueaxis/googleIAP/IabHelper;->flagEndAsync()V

    .line 161
    invoke-virtual {p1}, Lcom/trueaxis/googleIAP/IabResult;->isFailure()Z

    move-result v0

    if-eqz v0, :cond_1

    return-void

    .line 163
    :cond_1
    invoke-static {p1, p2}, Lcom/trueaxis/game/Interface;->onQueryInventoryConsume(Lcom/trueaxis/googleIAP/IabResult;Lcom/trueaxis/googleIAP/Inventory;)V

    return-void
.end method
