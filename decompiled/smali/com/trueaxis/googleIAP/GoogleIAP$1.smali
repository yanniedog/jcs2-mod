.class Lcom/trueaxis/googleIAP/GoogleIAP$1;
.super Ljava/lang/Object;
.source "GoogleIAP.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/googleIAP/GoogleIAP;->consumePurchase()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trueaxis/googleIAP/GoogleIAP;


# direct methods
.method constructor <init>(Lcom/trueaxis/googleIAP/GoogleIAP;)V
    .locals 0

    .line 92
    iput-object p1, p0, Lcom/trueaxis/googleIAP/GoogleIAP$1;->this$0:Lcom/trueaxis/googleIAP/GoogleIAP;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 97
    sget-object v0, Lcom/trueaxis/googleIAP/GoogleIAP;->mHelper:Lcom/trueaxis/googleIAP/IabHelper;

    invoke-virtual {v0}, Lcom/trueaxis/googleIAP/IabHelper;->flagEndAsync()V

    const/4 v0, 0x1

    .line 98
    sput-boolean v0, Lcom/trueaxis/googleIAP/GoogleIAP;->stopRestoreAsyncInProgress:Z

    .line 99
    sget-object v0, Lcom/trueaxis/googleIAP/GoogleIAP;->mHelper:Lcom/trueaxis/googleIAP/IabHelper;

    sget-object v1, Lcom/trueaxis/googleIAP/GoogleIAP;->mConsumeListener:Lcom/trueaxis/googleIAP/IabHelper$QueryInventoryFinishedListener;

    invoke-virtual {v0, v1}, Lcom/trueaxis/googleIAP/IabHelper;->queryInventoryAsync(Lcom/trueaxis/googleIAP/IabHelper$QueryInventoryFinishedListener;)V

    return-void
.end method
