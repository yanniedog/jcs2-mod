.class Lcom/trueaxis/facebook/Facebook$3;
.super Ljava/lang/Object;
.source "Facebook.java"

# interfaces
.implements Lcom/facebook/FacebookCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/facebook/Facebook;->initialise(Landroid/os/Bundle;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/facebook/FacebookCallback<",
        "Lcom/facebook/login/LoginResult;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trueaxis/facebook/Facebook;


# direct methods
.method constructor <init>(Lcom/trueaxis/facebook/Facebook;)V
    .locals 0

    .line 101
    iput-object p1, p0, Lcom/trueaxis/facebook/Facebook$3;->this$0:Lcom/trueaxis/facebook/Facebook;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel()V
    .locals 0

    .line 121
    invoke-static {}, Lcom/trueaxis/cLib/TrueaxisLib;->fbDidNotLogin()V

    return-void
.end method

.method public onError(Lcom/facebook/FacebookException;)V
    .locals 0

    .line 127
    invoke-static {}, Lcom/trueaxis/cLib/TrueaxisLib;->fbDidNotLogin()V

    return-void
.end method

.method public onSuccess(Lcom/facebook/login/LoginResult;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 107
    invoke-virtual {p1}, Lcom/facebook/login/LoginResult;->getAccessToken()Lcom/facebook/AccessToken;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 110
    invoke-virtual {p1}, Lcom/facebook/AccessToken;->getUserId()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/trueaxis/facebook/Facebook;->access$002(Ljava/lang/String;)Ljava/lang/String;

    .line 111
    invoke-static {p1}, Lcom/trueaxis/facebook/Facebook;->access$102(Lcom/facebook/AccessToken;)Lcom/facebook/AccessToken;

    .line 115
    :cond_0
    invoke-static {}, Lcom/trueaxis/cLib/TrueaxisLib;->fbDidLogin()V

    return-void
.end method

.method public bridge synthetic onSuccess(Ljava/lang/Object;)V
    .locals 0

    .line 101
    check-cast p1, Lcom/facebook/login/LoginResult;

    invoke-virtual {p0, p1}, Lcom/trueaxis/facebook/Facebook$3;->onSuccess(Lcom/facebook/login/LoginResult;)V

    return-void
.end method
