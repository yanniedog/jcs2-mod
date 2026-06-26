.class public Lcom/trueaxis/modmenu/ModLauncherActivity;
.super Landroid/app/Activity;
.source "ModLauncherActivity.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 14
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .registers 6

    .line 54
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "activity result request="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " result="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " hasData="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    if-eqz p3, :cond_23

    const/4 v1, 0x1

    goto :goto_24

    :cond_23
    const/4 v1, 0x0

    :goto_24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "launcher"

    invoke-static {v1, v0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    invoke-static {p0, p1, p2, p3}, Lcom/trueaxis/modmenu/ModMenu;->handleActivityResult(Landroid/app/Activity;IILandroid/content/Intent;)Z

    move-result v0

    if-nez v0, :cond_3a

    .line 57
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    .line 59
    :cond_3a
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .registers 5

    .line 17
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 18
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModDebugLog;->install(Landroid/content/Context;)V

    .line 19
    const-string p1, "onCreate launcher entry"

    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/ModDebugLog;->lifecycle(Landroid/app/Activity;Ljava/lang/String;)V

    .line 20
    invoke-virtual {p0}, Lcom/trueaxis/modmenu/ModLauncherActivity;->isTaskRoot()Z

    move-result p1

    if-nez p1, :cond_1c

    .line 21
    const-string p1, "launcher"

    const-string v0, "non-root launcher entry; finishing to reveal existing game task"

    invoke-static {p1, v0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    invoke-virtual {p0}, Lcom/trueaxis/modmenu/ModLauncherActivity;->finish()V

    .line 23
    return-void

    .line 25
    :cond_1c
    new-instance p1, Lcom/trueaxis/modmenu/ModLauncherActivity$1;

    invoke-direct {p1, p0}, Lcom/trueaxis/modmenu/ModLauncherActivity$1;-><init>(Lcom/trueaxis/modmenu/ModLauncherActivity;)V

    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/ModMenu;->showPreLaunchMenu(Landroid/app/Activity;Ljava/lang/Runnable;)V

    .line 40
    new-instance p1, Landroid/os/Handler;

    invoke-direct {p1}, Landroid/os/Handler;-><init>()V

    new-instance v0, Lcom/trueaxis/modmenu/ModLauncherActivity$2;

    invoke-direct {v0, p0}, Lcom/trueaxis/modmenu/ModLauncherActivity$2;-><init>(Lcom/trueaxis/modmenu/ModLauncherActivity;)V

    const-wide/16 v1, 0x1f4

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 45
    new-instance p1, Landroid/os/Handler;

    invoke-direct {p1}, Landroid/os/Handler;-><init>()V

    new-instance v0, Lcom/trueaxis/modmenu/ModLauncherActivity$3;

    invoke-direct {v0, p0}, Lcom/trueaxis/modmenu/ModLauncherActivity$3;-><init>(Lcom/trueaxis/modmenu/ModLauncherActivity;)V

    const-wide/16 v1, 0x5dc

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 50
    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .registers 4

    .line 62
    invoke-static {p0, p1, p2, p3}, Lcom/trueaxis/modmenu/ModDebugLog;->onRequestPermissionsResult(Landroid/app/Activity;I[Ljava/lang/String;[I)V

    .line 63
    return-void
.end method
