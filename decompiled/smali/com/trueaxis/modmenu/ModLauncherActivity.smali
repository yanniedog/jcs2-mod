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

.method private handleAutomationExtras()V
    .registers 9

    .line 56
    const-string v0, "automation_swarm_autoapply"

    const-string v1, "automation_enable_race_swarm"

    const-string v2, "automation_enable_replay_swarm"

    const-string v3, "automation"

    :try_start_8
    invoke-virtual {p0}, Lcom/trueaxis/modmenu/ModLauncherActivity;->getIntent()Landroid/content/Intent;

    move-result-object v4

    .line 57
    if-nez v4, :cond_f

    .line 58
    return-void

    .line 60
    :cond_f
    invoke-virtual {v4, v2}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v5

    const/4 v6, 0x0

    if-eqz v5, :cond_33

    .line 61
    invoke-virtual {v4, v2, v6}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v2

    .line 62
    invoke-static {p0, v2}, Lcom/trueaxis/modmenu/ModMenu;->setReplaySwarmEnabled(Landroid/content/Context;Z)V

    .line 63
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "automation replay_swarm="

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    :cond_33
    invoke-virtual {v4, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_56

    .line 66
    invoke-virtual {v4, v1, v6}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    .line 67
    invoke-static {p0, v1}, Lcom/trueaxis/modmenu/ModMenu;->setRaceSwarmEnabled(Landroid/content/Context;Z)V

    .line 68
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "automation race_swarm="

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    :cond_56
    invoke-virtual {v4, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_79

    .line 71
    invoke-virtual {v4, v0, v6}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    .line 72
    invoke-static {p0, v0}, Lcom/trueaxis/modmenu/ModMenu;->setSwarmAutoApply(Landroid/content/Context;Z)V

    .line 73
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "automation swarm_autoapply="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    :cond_79
    const-string v0, "automation_ghost_pack_all"

    invoke-virtual {v4, v0, v6}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_d6

    .line 76
    invoke-static {p0}, Lcom/trueaxis/modmenu/RequiredPatches;->archiveNewSlotReplays(Landroid/content/Context;)I

    .line 77
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 78
    invoke-static {p0}, Lcom/trueaxis/modmenu/RequiredPatches;->swarmLibraryFiles(Landroid/content/Context;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_91
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_b8

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/io/File;

    .line 79
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "swarm_replays/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 80
    goto :goto_91

    .line 81
    :cond_b8
    invoke-static {p0, v0}, Lcom/trueaxis/modmenu/ModMenu;->setGhostPackPaths(Landroid/content/Context;Ljava/util/List;)V

    .line 82
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "automation ghost_pack entries="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 83
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->ghostPackPaths(Landroid/content/Context;)[Ljava/lang/String;

    move-result-object v1

    array-length v1, v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 82
    invoke-static {v3, v0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_d6
    .catchall {:try_start_8 .. :try_end_d6} :catchall_d7

    .line 87
    :cond_d6
    goto :goto_dd

    .line 85
    :catchall_d7
    move-exception v0

    .line 86
    const-string v1, "automation extras failed"

    invoke-static {v3, v1, v0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 88
    :goto_dd
    return-void
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .registers 6

    .line 92
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

    .line 94
    invoke-static {p0, p1, p2, p3}, Lcom/trueaxis/modmenu/ModMenu;->handleActivityResult(Landroid/app/Activity;IILandroid/content/Intent;)Z

    move-result v0

    if-nez v0, :cond_3a

    .line 95
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    .line 97
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
    invoke-direct {p0}, Lcom/trueaxis/modmenu/ModLauncherActivity;->handleAutomationExtras()V

    .line 26
    new-instance p1, Lcom/trueaxis/modmenu/ModLauncherActivity$1;

    invoke-direct {p1, p0}, Lcom/trueaxis/modmenu/ModLauncherActivity$1;-><init>(Lcom/trueaxis/modmenu/ModLauncherActivity;)V

    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/ModMenu;->showPreLaunchMenu(Landroid/app/Activity;Ljava/lang/Runnable;)V

    .line 41
    new-instance p1, Landroid/os/Handler;

    invoke-direct {p1}, Landroid/os/Handler;-><init>()V

    new-instance v0, Lcom/trueaxis/modmenu/ModLauncherActivity$2;

    invoke-direct {v0, p0}, Lcom/trueaxis/modmenu/ModLauncherActivity$2;-><init>(Lcom/trueaxis/modmenu/ModLauncherActivity;)V

    const-wide/16 v1, 0x1f4

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 46
    new-instance p1, Landroid/os/Handler;

    invoke-direct {p1}, Landroid/os/Handler;-><init>()V

    new-instance v0, Lcom/trueaxis/modmenu/ModLauncherActivity$3;

    invoke-direct {v0, p0}, Lcom/trueaxis/modmenu/ModLauncherActivity$3;-><init>(Lcom/trueaxis/modmenu/ModLauncherActivity;)V

    const-wide/16 v1, 0x5dc

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 51
    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .registers 4

    .line 100
    invoke-static {p0, p1, p2, p3}, Lcom/trueaxis/modmenu/ModDebugLog;->onRequestPermissionsResult(Landroid/app/Activity;I[Ljava/lang/String;[I)V

    .line 101
    return-void
.end method
