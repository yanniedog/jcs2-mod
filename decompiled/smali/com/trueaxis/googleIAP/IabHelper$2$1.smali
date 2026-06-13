.class Lcom/trueaxis/googleIAP/IabHelper$2$1;
.super Ljava/lang/Object;
.source "IabHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/googleIAP/IabHelper$2;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/trueaxis/googleIAP/IabHelper$2;

.field final synthetic val$inv_f:Lcom/trueaxis/googleIAP/Inventory;

.field final synthetic val$result_f:Lcom/trueaxis/googleIAP/IabResult;


# direct methods
.method constructor <init>(Lcom/trueaxis/googleIAP/IabHelper$2;Lcom/trueaxis/googleIAP/IabResult;Lcom/trueaxis/googleIAP/Inventory;)V
    .locals 0

    .line 637
    iput-object p1, p0, Lcom/trueaxis/googleIAP/IabHelper$2$1;->this$1:Lcom/trueaxis/googleIAP/IabHelper$2;

    iput-object p2, p0, Lcom/trueaxis/googleIAP/IabHelper$2$1;->val$result_f:Lcom/trueaxis/googleIAP/IabResult;

    iput-object p3, p0, Lcom/trueaxis/googleIAP/IabHelper$2$1;->val$inv_f:Lcom/trueaxis/googleIAP/Inventory;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 639
    iget-object v0, p0, Lcom/trueaxis/googleIAP/IabHelper$2$1;->this$1:Lcom/trueaxis/googleIAP/IabHelper$2;

    iget-object v0, v0, Lcom/trueaxis/googleIAP/IabHelper$2;->val$listener:Lcom/trueaxis/googleIAP/IabHelper$QueryInventoryFinishedListener;

    iget-object v1, p0, Lcom/trueaxis/googleIAP/IabHelper$2$1;->val$result_f:Lcom/trueaxis/googleIAP/IabResult;

    iget-object v2, p0, Lcom/trueaxis/googleIAP/IabHelper$2$1;->val$inv_f:Lcom/trueaxis/googleIAP/Inventory;

    invoke-interface {v0, v1, v2}, Lcom/trueaxis/googleIAP/IabHelper$QueryInventoryFinishedListener;->onQueryInventoryFinished(Lcom/trueaxis/googleIAP/IabResult;Lcom/trueaxis/googleIAP/Inventory;)V

    return-void
.end method
