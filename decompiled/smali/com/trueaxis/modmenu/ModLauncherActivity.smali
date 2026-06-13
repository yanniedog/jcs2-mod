.class public Lcom/trueaxis/modmenu/ModLauncherActivity;
.super Landroid/app/Activity;
.source "ModLauncherActivity.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 13
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .registers 5

    .line 29
    invoke-static {p0, p1, p2, p3}, Lcom/trueaxis/modmenu/ModMenu;->handleActivityResult(Landroid/app/Activity;IILandroid/content/Intent;)Z

    move-result v0

    if-nez v0, :cond_9

    .line 30
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    .line 32
    :cond_9
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .registers 2

    .line 16
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 17
    new-instance p1, Lcom/trueaxis/modmenu/ModLauncherActivity$1;

    invoke-direct {p1, p0}, Lcom/trueaxis/modmenu/ModLauncherActivity$1;-><init>(Lcom/trueaxis/modmenu/ModLauncherActivity;)V

    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/ModMenu;->showPreLaunchMenu(Landroid/app/Activity;Ljava/lang/Runnable;)V

    .line 25
    return-void
.end method
