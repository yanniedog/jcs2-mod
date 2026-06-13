.class Lcom/trueaxis/facebook/Facebook$2;
.super Lcom/facebook/AccessTokenTracker;
.source "Facebook.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/facebook/Facebook;->initialise(Landroid/os/Bundle;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trueaxis/facebook/Facebook;


# direct methods
.method constructor <init>(Lcom/trueaxis/facebook/Facebook;)V
    .locals 0

    .line 84
    iput-object p1, p0, Lcom/trueaxis/facebook/Facebook$2;->this$0:Lcom/trueaxis/facebook/Facebook;

    invoke-direct {p0}, Lcom/facebook/AccessTokenTracker;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCurrentAccessTokenChanged(Lcom/facebook/AccessToken;Lcom/facebook/AccessToken;)V
    .locals 0

    if-eqz p2, :cond_0

    .line 90
    invoke-static {p2}, Lcom/trueaxis/facebook/Facebook;->access$102(Lcom/facebook/AccessToken;)Lcom/facebook/AccessToken;

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 94
    invoke-static {p1}, Lcom/trueaxis/facebook/Facebook;->access$102(Lcom/facebook/AccessToken;)Lcom/facebook/AccessToken;

    :goto_0
    return-void
.end method
