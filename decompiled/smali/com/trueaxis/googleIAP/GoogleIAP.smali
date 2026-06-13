.class public Lcom/trueaxis/googleIAP/GoogleIAP;
.super Ljava/lang/Object;
.source "GoogleIAP.java"


# static fields
.field public static final RC_REQUEST:I = 0x2711

.field public static doCompleteRestore:Z

.field public static inventoryAsyncInProgress:Z

.field public static mConsumeListener:Lcom/trueaxis/googleIAP/IabHelper$QueryInventoryFinishedListener;

.field public static mGotInventoryListener:Lcom/trueaxis/googleIAP/IabHelper$QueryInventoryFinishedListener;

.field public static mHelper:Lcom/trueaxis/googleIAP/IabHelper;

.field public static mPurchaseFinishedListener:Lcom/trueaxis/googleIAP/IabHelper$OnIabPurchaseFinishedListener;

.field public static mRestoreDLCListener:Lcom/trueaxis/googleIAP/IabHelper$QueryInventoryFinishedListener;

.field public static skuForError:Ljava/lang/String;

.field public static stopRestoreAsyncInProgress:Z

.field public static stopViewFromDisappearingOnPurchase:Z

.field public static storeActive:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 111
    new-instance v0, Lcom/trueaxis/googleIAP/GoogleIAP$2;

    invoke-direct {v0}, Lcom/trueaxis/googleIAP/GoogleIAP$2;-><init>()V

    sput-object v0, Lcom/trueaxis/googleIAP/GoogleIAP;->mPurchaseFinishedListener:Lcom/trueaxis/googleIAP/IabHelper$OnIabPurchaseFinishedListener;

    .line 139
    new-instance v0, Lcom/trueaxis/googleIAP/GoogleIAP$3;

    invoke-direct {v0}, Lcom/trueaxis/googleIAP/GoogleIAP$3;-><init>()V

    sput-object v0, Lcom/trueaxis/googleIAP/GoogleIAP;->mGotInventoryListener:Lcom/trueaxis/googleIAP/IabHelper$QueryInventoryFinishedListener;

    .line 154
    new-instance v0, Lcom/trueaxis/googleIAP/GoogleIAP$4;

    invoke-direct {v0}, Lcom/trueaxis/googleIAP/GoogleIAP$4;-><init>()V

    sput-object v0, Lcom/trueaxis/googleIAP/GoogleIAP;->mConsumeListener:Lcom/trueaxis/googleIAP/IabHelper$QueryInventoryFinishedListener;

    .line 167
    new-instance v0, Lcom/trueaxis/googleIAP/GoogleIAP$5;

    invoke-direct {v0}, Lcom/trueaxis/googleIAP/GoogleIAP$5;-><init>()V

    sput-object v0, Lcom/trueaxis/googleIAP/GoogleIAP;->mRestoreDLCListener:Lcom/trueaxis/googleIAP/IabHelper$QueryInventoryFinishedListener;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static verifyDeveloperPayload(Lcom/trueaxis/googleIAP/Purchase;)Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method


# virtual methods
.method public addSku(Ljava/lang/String;)V
    .locals 0

    .line 44
    invoke-static {p1}, Lcom/trueaxis/game/Interface;->addSkuToList(Ljava/lang/String;)V

    return-void
.end method

.method public consumePurchase()V
    .locals 2

    .line 87
    sget-boolean v0, Lcom/trueaxis/googleIAP/GoogleIAP;->storeActive:Z

    if-eqz v0, :cond_0

    .line 89
    sget-object v0, Lcom/trueaxis/googleIAP/GoogleIAP;->mHelper:Lcom/trueaxis/googleIAP/IabHelper;

    if-eqz v0, :cond_0

    .line 91
    invoke-static {}, Lcom/trueaxis/game/Interface;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/trueaxis/googleIAP/GoogleIAP$1;

    invoke-direct {v1, p0}, Lcom/trueaxis/googleIAP/GoogleIAP$1;-><init>(Lcom/trueaxis/googleIAP/GoogleIAP;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method public onPurchase(Ljava/lang/String;)V
    .locals 2

    .line 76
    sget-boolean v0, Lcom/trueaxis/googleIAP/GoogleIAP;->storeActive:Z

    if-eqz v0, :cond_0

    .line 78
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    const/16 v1, 0x104

    .line 79
    iput v1, v0, Landroid/os/Message;->what:I

    .line 80
    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 81
    sget-object p1, Lcom/trueaxis/messageHandler/MessageHandler;->ApiHandler:Landroid/os/Handler;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    :cond_0
    return-void
.end method

.method public restoreDLC(Ljava/lang/String;)V
    .locals 2

    .line 64
    sget-boolean v0, Lcom/trueaxis/googleIAP/GoogleIAP;->storeActive:Z

    if-eqz v0, :cond_0

    .line 66
    invoke-static {}, Lcom/trueaxis/cLib/TrueaxisLib;->ResetIAPMessages()V

    .line 67
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    const/16 v1, 0x107

    .line 68
    iput v1, v0, Landroid/os/Message;->what:I

    .line 69
    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 70
    sget-object p1, Lcom/trueaxis/messageHandler/MessageHandler;->ApiHandler:Landroid/os/Handler;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    :cond_0
    return-void
.end method

.method public restorePurchases(I)V
    .locals 1

    .line 49
    sget-boolean v0, Lcom/trueaxis/googleIAP/GoogleIAP;->storeActive:Z

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    .line 53
    sput-boolean v0, Lcom/trueaxis/googleIAP/GoogleIAP;->doCompleteRestore:Z

    .line 55
    :cond_0
    invoke-static {}, Lcom/trueaxis/cLib/TrueaxisLib;->ResetIAPMessages()V

    .line 56
    new-instance p1, Landroid/os/Message;

    invoke-direct {p1}, Landroid/os/Message;-><init>()V

    const/16 v0, 0x103

    .line 57
    iput v0, p1, Landroid/os/Message;->what:I

    .line 58
    sget-object v0, Lcom/trueaxis/messageHandler/MessageHandler;->ApiHandler:Landroid/os/Handler;

    invoke-virtual {v0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    :cond_1
    return-void
.end method

.method public storeFinalise()V
    .locals 2

    .line 37
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    const/16 v1, 0x102

    .line 38
    iput v1, v0, Landroid/os/Message;->what:I

    .line 39
    sget-object v1, Lcom/trueaxis/messageHandler/MessageHandler;->ApiHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method public storeInitialise()V
    .locals 2

    .line 30
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    const/16 v1, 0x101

    .line 31
    iput v1, v0, Landroid/os/Message;->what:I

    .line 32
    sget-object v1, Lcom/trueaxis/messageHandler/MessageHandler;->ApiHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method
