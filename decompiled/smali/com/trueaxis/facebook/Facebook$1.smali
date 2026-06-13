.class Lcom/trueaxis/facebook/Facebook$1;
.super Lcom/facebook/ProfileTracker;
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

    .line 65
    iput-object p1, p0, Lcom/trueaxis/facebook/Facebook$1;->this$0:Lcom/trueaxis/facebook/Facebook;

    invoke-direct {p0}, Lcom/facebook/ProfileTracker;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCurrentProfileChanged(Lcom/facebook/Profile;Lcom/facebook/Profile;)V
    .locals 0

    if-nez p2, :cond_0

    const-string p1, ""

    .line 71
    invoke-static {p1}, Lcom/trueaxis/facebook/Facebook;->access$002(Ljava/lang/String;)Ljava/lang/String;

    .line 72
    invoke-static {p1, p1}, Lcom/trueaxis/cLib/TrueaxisLib;->fbSetUserInfo(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 76
    :cond_0
    invoke-virtual {p2}, Lcom/facebook/Profile;->getId()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/trueaxis/facebook/Facebook;->access$002(Ljava/lang/String;)Ljava/lang/String;

    .line 77
    invoke-virtual {p2}, Lcom/facebook/Profile;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-static {}, Lcom/trueaxis/facebook/Facebook;->access$000()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/trueaxis/cLib/TrueaxisLib;->fbSetUserInfo(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method
