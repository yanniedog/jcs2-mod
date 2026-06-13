.class final Lcom/trueaxis/googleMessageHandler/GoogleMessageHandler$1;
.super Landroid/os/Handler;
.source "GoogleMessageHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/googleMessageHandler/GoogleMessageHandler;->startMessageHandler()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 34
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 7

    .line 37
    invoke-static {}, Lcom/trueaxis/game/Interface;->getContext()Landroid/content/Context;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Landroid/app/Activity;

    .line 38
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x1

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_1

    .line 130
    :pswitch_0
    sget-object v0, Lcom/trueaxis/googleIAP/GoogleIAP;->mHelper:Lcom/trueaxis/googleIAP/IabHelper;

    if-eqz v0, :cond_0

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    if-eqz v0, :cond_0

    .line 132
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    .line 134
    sget-boolean v0, Lcom/trueaxis/googleIAP/GoogleIAP;->inventoryAsyncInProgress:Z

    if-nez v0, :cond_0

    if-eqz p1, :cond_0

    .line 136
    sget-object v0, Lcom/trueaxis/googleIAP/GoogleIAP;->mHelper:Lcom/trueaxis/googleIAP/IabHelper;

    invoke-virtual {v0}, Lcom/trueaxis/googleIAP/IabHelper;->flagEndAsync()V

    .line 137
    sput-boolean v1, Lcom/trueaxis/googleIAP/GoogleIAP;->inventoryAsyncInProgress:Z

    .line 140
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 141
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 142
    sget-object p1, Lcom/trueaxis/googleIAP/GoogleIAP;->mHelper:Lcom/trueaxis/googleIAP/IabHelper;

    sget-object v2, Lcom/trueaxis/googleIAP/GoogleIAP;->mGotInventoryListener:Lcom/trueaxis/googleIAP/IabHelper$QueryInventoryFinishedListener;

    invoke-virtual {p1, v1, v0, v2}, Lcom/trueaxis/googleIAP/IabHelper;->queryInventoryAsync(ZLjava/util/List;Lcom/trueaxis/googleIAP/IabHelper$QueryInventoryFinishedListener;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_1

    .line 146
    :catch_0
    sget-object p1, Lcom/trueaxis/googleIAP/GoogleIAP;->mHelper:Lcom/trueaxis/googleIAP/IabHelper;

    invoke-virtual {p1}, Lcom/trueaxis/googleIAP/IabHelper;->flagEndAsync()V

    goto/16 :goto_1

    .line 125
    :pswitch_1
    sput-boolean v1, Lcom/trueaxis/googleIAP/GoogleIAP;->stopRestoreAsyncInProgress:Z

    .line 126
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    .line 127
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {v2, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_1

    .line 119
    :pswitch_2
    sput-boolean v1, Lcom/trueaxis/googleIAP/GoogleIAP;->stopRestoreAsyncInProgress:Z

    .line 120
    new-instance p1, Landroid/content/Intent;

    sget-object v0, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    const-string v3, "android.intent.action.PICK"

    invoke-direct {p1, v3, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const-string v0, "image/*"

    .line 121
    invoke-virtual {p1, v0}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 122
    invoke-virtual {v2, p1, v1}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    goto/16 :goto_1

    .line 99
    :pswitch_3
    sget-object v0, Lcom/trueaxis/googleIAP/GoogleIAP;->mHelper:Lcom/trueaxis/googleIAP/IabHelper;

    if-eqz v0, :cond_0

    const-wide/16 v3, 0x190

    .line 102
    :try_start_1
    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    :catch_1
    move-exception v0

    .line 104
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    :goto_0
    const-string v6, ""

    .line 107
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    sput-object v0, Lcom/trueaxis/googleIAP/GoogleIAP;->skuForError:Ljava/lang/String;

    .line 108
    sput-boolean v1, Lcom/trueaxis/googleIAP/GoogleIAP;->stopViewFromDisappearingOnPurchase:Z

    .line 112
    :try_start_2
    sget-object v1, Lcom/trueaxis/googleIAP/GoogleIAP;->mHelper:Lcom/trueaxis/googleIAP/IabHelper;

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object v3, p1

    check-cast v3, Ljava/lang/String;

    const/16 v4, 0x2711

    sget-object v5, Lcom/trueaxis/googleIAP/GoogleIAP;->mPurchaseFinishedListener:Lcom/trueaxis/googleIAP/IabHelper$OnIabPurchaseFinishedListener;

    invoke-virtual/range {v1 .. v6}, Lcom/trueaxis/googleIAP/IabHelper;->launchPurchaseFlow(Landroid/app/Activity;Ljava/lang/String;ILcom/trueaxis/googleIAP/IabHelper$OnIabPurchaseFinishedListener;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/IllegalStateException; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_1

    .line 114
    :catch_2
    sget-object p1, Lcom/trueaxis/googleIAP/GoogleIAP;->mHelper:Lcom/trueaxis/googleIAP/IabHelper;

    invoke-virtual {p1}, Lcom/trueaxis/googleIAP/IabHelper;->flagEndAsync()V

    goto :goto_1

    .line 83
    :pswitch_4
    sget-object p1, Lcom/trueaxis/googleIAP/GoogleIAP;->mHelper:Lcom/trueaxis/googleIAP/IabHelper;

    if-eqz p1, :cond_0

    .line 85
    sget-boolean p1, Lcom/trueaxis/googleIAP/GoogleIAP;->inventoryAsyncInProgress:Z

    if-nez p1, :cond_0

    .line 87
    sget-object p1, Lcom/trueaxis/googleIAP/GoogleIAP;->mHelper:Lcom/trueaxis/googleIAP/IabHelper;

    invoke-virtual {p1}, Lcom/trueaxis/googleIAP/IabHelper;->flagEndAsync()V

    .line 88
    sput-boolean v1, Lcom/trueaxis/googleIAP/GoogleIAP;->inventoryAsyncInProgress:Z

    .line 91
    :try_start_3
    sget-object p1, Lcom/trueaxis/googleIAP/GoogleIAP;->mHelper:Lcom/trueaxis/googleIAP/IabHelper;

    sget-object v0, Lcom/trueaxis/game/Interface;->moreSkus:Ljava/util/ArrayList;

    sget-object v2, Lcom/trueaxis/googleIAP/GoogleIAP;->mGotInventoryListener:Lcom/trueaxis/googleIAP/IabHelper$QueryInventoryFinishedListener;

    invoke-virtual {p1, v1, v0, v2}, Lcom/trueaxis/googleIAP/IabHelper;->queryInventoryAsync(ZLjava/util/List;Lcom/trueaxis/googleIAP/IabHelper$QueryInventoryFinishedListener;)V
    :try_end_3
    .catch Ljava/lang/IllegalStateException; {:try_start_3 .. :try_end_3} :catch_3

    goto :goto_1

    .line 93
    :catch_3
    sget-object p1, Lcom/trueaxis/googleIAP/GoogleIAP;->mHelper:Lcom/trueaxis/googleIAP/IabHelper;

    invoke-virtual {p1}, Lcom/trueaxis/googleIAP/IabHelper;->flagEndAsync()V

    goto :goto_1

    .line 76
    :pswitch_5
    sget-object p1, Lcom/trueaxis/googleIAP/GoogleIAP;->mHelper:Lcom/trueaxis/googleIAP/IabHelper;

    if-eqz p1, :cond_0

    .line 78
    sget-object p1, Lcom/trueaxis/googleIAP/GoogleIAP;->mHelper:Lcom/trueaxis/googleIAP/IabHelper;

    invoke-virtual {p1}, Lcom/trueaxis/googleIAP/IabHelper;->dispose()V

    const/4 p1, 0x0

    .line 79
    sput-object p1, Lcom/trueaxis/googleIAP/GoogleIAP;->mHelper:Lcom/trueaxis/googleIAP/IabHelper;

    goto :goto_1

    .line 41
    :pswitch_6
    new-instance p1, Lcom/trueaxis/googleIAP/IabHelper;

    sget-object v0, Lcom/trueaxis/game/Interface;->base64EncodedPublicKey:Ljava/lang/String;

    invoke-direct {p1, v2, v0}, Lcom/trueaxis/googleIAP/IabHelper;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    sput-object p1, Lcom/trueaxis/googleIAP/GoogleIAP;->mHelper:Lcom/trueaxis/googleIAP/IabHelper;

    .line 42
    sget-object p1, Lcom/trueaxis/googleIAP/GoogleIAP;->mHelper:Lcom/trueaxis/googleIAP/IabHelper;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/trueaxis/googleIAP/IabHelper;->enableDebugLogging(Z)V

    .line 43
    sget-object p1, Lcom/trueaxis/googleIAP/GoogleIAP;->mHelper:Lcom/trueaxis/googleIAP/IabHelper;

    new-instance v0, Lcom/trueaxis/googleMessageHandler/GoogleMessageHandler$1$1;

    invoke-direct {v0, p0}, Lcom/trueaxis/googleMessageHandler/GoogleMessageHandler$1$1;-><init>(Lcom/trueaxis/googleMessageHandler/GoogleMessageHandler$1;)V

    invoke-virtual {p1, v0}, Lcom/trueaxis/googleIAP/IabHelper;->startSetup(Lcom/trueaxis/googleIAP/IabHelper$OnIabSetupFinishedListener;)V

    :cond_0
    :goto_1
    return-void

    :pswitch_data_0
    .packed-switch 0x101
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
