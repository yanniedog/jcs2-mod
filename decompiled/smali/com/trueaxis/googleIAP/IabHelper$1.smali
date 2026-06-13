.class Lcom/trueaxis/googleIAP/IabHelper$1;
.super Ljava/lang/Object;
.source "IabHelper.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/googleIAP/IabHelper;->startSetup(Lcom/trueaxis/googleIAP/IabHelper$OnIabSetupFinishedListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trueaxis/googleIAP/IabHelper;

.field final synthetic val$listener:Lcom/trueaxis/googleIAP/IabHelper$OnIabSetupFinishedListener;


# direct methods
.method constructor <init>(Lcom/trueaxis/googleIAP/IabHelper;Lcom/trueaxis/googleIAP/IabHelper$OnIabSetupFinishedListener;)V
    .locals 0

    .line 211
    iput-object p1, p0, Lcom/trueaxis/googleIAP/IabHelper$1;->this$0:Lcom/trueaxis/googleIAP/IabHelper;

    iput-object p2, p0, Lcom/trueaxis/googleIAP/IabHelper$1;->val$listener:Lcom/trueaxis/googleIAP/IabHelper$OnIabSetupFinishedListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 4

    .line 220
    iget-object p1, p0, Lcom/trueaxis/googleIAP/IabHelper$1;->this$0:Lcom/trueaxis/googleIAP/IabHelper;

    iget-boolean p1, p1, Lcom/trueaxis/googleIAP/IabHelper;->mDisposed:Z

    if-eqz p1, :cond_0

    return-void

    .line 221
    :cond_0
    iget-object p1, p0, Lcom/trueaxis/googleIAP/IabHelper$1;->this$0:Lcom/trueaxis/googleIAP/IabHelper;

    const-string v0, "Billing service connected."

    invoke-virtual {p1, v0}, Lcom/trueaxis/googleIAP/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 222
    iget-object p1, p0, Lcom/trueaxis/googleIAP/IabHelper$1;->this$0:Lcom/trueaxis/googleIAP/IabHelper;

    invoke-static {p2}, Lcom/android/vending/billing/IInAppBillingService$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/vending/billing/IInAppBillingService;

    move-result-object p2

    iput-object p2, p1, Lcom/trueaxis/googleIAP/IabHelper;->mService:Lcom/android/vending/billing/IInAppBillingService;

    .line 223
    iget-object p1, p0, Lcom/trueaxis/googleIAP/IabHelper$1;->this$0:Lcom/trueaxis/googleIAP/IabHelper;

    iget-object p1, p1, Lcom/trueaxis/googleIAP/IabHelper;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p1

    .line 225
    :try_start_0
    iget-object p2, p0, Lcom/trueaxis/googleIAP/IabHelper$1;->this$0:Lcom/trueaxis/googleIAP/IabHelper;

    const-string v0, "Checking for in-app billing 3 support."

    invoke-virtual {p2, v0}, Lcom/trueaxis/googleIAP/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 228
    iget-object p2, p0, Lcom/trueaxis/googleIAP/IabHelper$1;->this$0:Lcom/trueaxis/googleIAP/IabHelper;

    iget-object p2, p2, Lcom/trueaxis/googleIAP/IabHelper;->mService:Lcom/android/vending/billing/IInAppBillingService;

    const-string v0, "inapp"

    const/4 v1, 0x3

    invoke-interface {p2, v1, p1, v0}, Lcom/android/vending/billing/IInAppBillingService;->isBillingSupported(ILjava/lang/String;Ljava/lang/String;)I

    move-result p2

    const/4 v0, 0x0

    if-eqz p2, :cond_2

    .line 230
    iget-object p1, p0, Lcom/trueaxis/googleIAP/IabHelper$1;->val$listener:Lcom/trueaxis/googleIAP/IabHelper$OnIabSetupFinishedListener;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/trueaxis/googleIAP/IabHelper$1;->val$listener:Lcom/trueaxis/googleIAP/IabHelper$OnIabSetupFinishedListener;

    new-instance v1, Lcom/trueaxis/googleIAP/IabResult;

    const-string v2, "Error checking for billing v3 support."

    invoke-direct {v1, p2, v2}, Lcom/trueaxis/googleIAP/IabResult;-><init>(ILjava/lang/String;)V

    invoke-interface {p1, v1}, Lcom/trueaxis/googleIAP/IabHelper$OnIabSetupFinishedListener;->onIabSetupFinished(Lcom/trueaxis/googleIAP/IabResult;)V

    .line 234
    :cond_1
    iget-object p1, p0, Lcom/trueaxis/googleIAP/IabHelper$1;->this$0:Lcom/trueaxis/googleIAP/IabHelper;

    iput-boolean v0, p1, Lcom/trueaxis/googleIAP/IabHelper;->mSubscriptionsSupported:Z

    return-void

    .line 237
    :cond_2
    iget-object p2, p0, Lcom/trueaxis/googleIAP/IabHelper$1;->this$0:Lcom/trueaxis/googleIAP/IabHelper;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "In-app billing version 3 supported for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v2}, Lcom/trueaxis/googleIAP/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 240
    iget-object p2, p0, Lcom/trueaxis/googleIAP/IabHelper$1;->this$0:Lcom/trueaxis/googleIAP/IabHelper;

    iget-object p2, p2, Lcom/trueaxis/googleIAP/IabHelper;->mService:Lcom/android/vending/billing/IInAppBillingService;

    const-string v2, "subs"

    invoke-interface {p2, v1, p1, v2}, Lcom/android/vending/billing/IInAppBillingService;->isBillingSupported(ILjava/lang/String;Ljava/lang/String;)I

    move-result p1

    const/4 p2, 0x1

    if-nez p1, :cond_3

    .line 242
    iget-object p1, p0, Lcom/trueaxis/googleIAP/IabHelper$1;->this$0:Lcom/trueaxis/googleIAP/IabHelper;

    const-string v1, "Subscriptions AVAILABLE."

    invoke-virtual {p1, v1}, Lcom/trueaxis/googleIAP/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 243
    iget-object p1, p0, Lcom/trueaxis/googleIAP/IabHelper$1;->this$0:Lcom/trueaxis/googleIAP/IabHelper;

    iput-boolean p2, p1, Lcom/trueaxis/googleIAP/IabHelper;->mSubscriptionsSupported:Z

    goto :goto_0

    .line 246
    :cond_3
    iget-object v1, p0, Lcom/trueaxis/googleIAP/IabHelper$1;->this$0:Lcom/trueaxis/googleIAP/IabHelper;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Subscriptions NOT AVAILABLE. Response: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Lcom/trueaxis/googleIAP/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 249
    :goto_0
    iget-object p1, p0, Lcom/trueaxis/googleIAP/IabHelper$1;->this$0:Lcom/trueaxis/googleIAP/IabHelper;

    iput-boolean p2, p1, Lcom/trueaxis/googleIAP/IabHelper;->mSetupDone:Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 260
    iget-object p1, p0, Lcom/trueaxis/googleIAP/IabHelper$1;->val$listener:Lcom/trueaxis/googleIAP/IabHelper$OnIabSetupFinishedListener;

    if-eqz p1, :cond_4

    .line 261
    new-instance p2, Lcom/trueaxis/googleIAP/IabResult;

    const-string v1, "Setup successful."

    invoke-direct {p2, v0, v1}, Lcom/trueaxis/googleIAP/IabResult;-><init>(ILjava/lang/String;)V

    invoke-interface {p1, p2}, Lcom/trueaxis/googleIAP/IabHelper$OnIabSetupFinishedListener;->onIabSetupFinished(Lcom/trueaxis/googleIAP/IabResult;)V

    :cond_4
    return-void

    :catch_0
    move-exception p1

    .line 252
    iget-object p2, p0, Lcom/trueaxis/googleIAP/IabHelper$1;->val$listener:Lcom/trueaxis/googleIAP/IabHelper$OnIabSetupFinishedListener;

    if-eqz p2, :cond_5

    .line 253
    new-instance v0, Lcom/trueaxis/googleIAP/IabResult;

    const/16 v1, -0x3e9

    const-string v2, "RemoteException while setting up in-app billing."

    invoke-direct {v0, v1, v2}, Lcom/trueaxis/googleIAP/IabResult;-><init>(ILjava/lang/String;)V

    invoke-interface {p2, v0}, Lcom/trueaxis/googleIAP/IabHelper$OnIabSetupFinishedListener;->onIabSetupFinished(Lcom/trueaxis/googleIAP/IabResult;)V

    .line 256
    :cond_5
    invoke-virtual {p1}, Landroid/os/RemoteException;->printStackTrace()V

    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 1

    .line 214
    iget-object p1, p0, Lcom/trueaxis/googleIAP/IabHelper$1;->this$0:Lcom/trueaxis/googleIAP/IabHelper;

    const-string v0, "Billing service disconnected."

    invoke-virtual {p1, v0}, Lcom/trueaxis/googleIAP/IabHelper;->logDebug(Ljava/lang/String;)V

    .line 215
    iget-object p1, p0, Lcom/trueaxis/googleIAP/IabHelper$1;->this$0:Lcom/trueaxis/googleIAP/IabHelper;

    const/4 v0, 0x0

    iput-object v0, p1, Lcom/trueaxis/googleIAP/IabHelper;->mService:Lcom/android/vending/billing/IInAppBillingService;

    return-void
.end method
