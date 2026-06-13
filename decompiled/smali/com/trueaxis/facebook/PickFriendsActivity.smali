.class public Lcom/trueaxis/facebook/PickFriendsActivity;
.super Landroid/support/v4/app/FragmentActivity;
.source "PickFriendsActivity.java"


# instance fields
.field Context:Lcom/trueaxis/facebook/PickFriendsActivity;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 43
    invoke-direct {p0}, Landroid/support/v4/app/FragmentActivity;-><init>()V

    return-void
.end method

.method private onError(Ljava/lang/Exception;)V
    .locals 1

    const-string p1, "Error: You are offline!"

    const/4 v0, 0x0

    .line 154
    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    .line 155
    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method public static populateParameters(Landroid/content/Intent;Ljava/lang/String;ZZ)V
    .locals 0

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    .line 64
    invoke-super {p0, p1}, Landroid/support/v4/app/FragmentActivity;->onCreate(Landroid/os/Bundle;)V

    return-void
.end method

.method protected onStart()V
    .locals 0

    .line 160
    invoke-super {p0}, Landroid/support/v4/app/FragmentActivity;->onStart()V

    return-void
.end method
