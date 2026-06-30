.class Lcom/trueaxis/modmenu/ReplaySwarmOverlay$1;
.super Ljava/lang/Object;
.source "ReplaySwarmOverlay.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->install(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private disabled:Z

.field private lastState:I

.field final synthetic val$activity:Landroid/app/Activity;

.field final synthetic val$configure:Landroid/widget/Button;

.field final synthetic val$handler:Landroid/os/Handler;

.field final synthetic val$status:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Landroid/app/Activity;Landroid/widget/Button;Landroid/widget/TextView;Landroid/os/Handler;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 80
    iput-object p1, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$1;->val$activity:Landroid/app/Activity;

    iput-object p2, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$1;->val$configure:Landroid/widget/Button;

    iput-object p3, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$1;->val$status:Landroid/widget/TextView;

    iput-object p4, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$1;->val$handler:Landroid/os/Handler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private poll(Landroid/widget/Button;Landroid/widget/TextView;)V
    .registers 8

    .line 99
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readReplaySwarmActive()I

    move-result v0

    .line 100
    iget v1, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$1;->lastState:I

    if-eq v0, v1, :cond_3e

    .line 101
    iput v0, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$1;->lastState:I

    .line 102
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "overlay state="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " catalog="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 103
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readReplaySwarmCatalogCount()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " ghosts="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 104
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readReplaySwarmGhostCount()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 102
    const-string v2, "swarm"

    invoke-static {v2, v1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 107
    :cond_3e
    const-wide/16 v1, 0x1f4

    const/16 v3, 0x8

    if-nez v0, :cond_50

    .line 108
    invoke-virtual {p1, v3}, Landroid/widget/Button;->setVisibility(I)V

    .line 109
    invoke-virtual {p2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 110
    iget-object p1, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$1;->val$handler:Landroid/os/Handler;

    invoke-virtual {p1, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 111
    return-void

    .line 114
    :cond_50
    const/4 v4, 0x0

    invoke-virtual {p1, v4}, Landroid/widget/Button;->setVisibility(I)V

    .line 115
    invoke-virtual {p1}, Landroid/widget/Button;->bringToFront()V

    .line 116
    const/4 p1, 0x2

    if-ne v0, p1, :cond_81

    .line 117
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Swarm: "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 118
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readReplaySwarmGhostCount()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " ghost replays"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 117
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 120
    invoke-virtual {p2, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 121
    invoke-virtual {p2}, Landroid/widget/TextView;->bringToFront()V

    goto :goto_84

    .line 123
    :cond_81
    invoke-virtual {p2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 125
    :goto_84
    iget-object p1, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$1;->val$handler:Landroid/os/Handler;

    invoke-virtual {p1, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 126
    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .line 85
    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$1;->val$activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_2d

    iget-boolean v0, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$1;->disabled:Z

    if-eqz v0, :cond_d

    goto :goto_2d

    .line 89
    :cond_d
    :try_start_d
    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$1;->val$configure:Landroid/widget/Button;

    iget-object v1, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$1;->val$status:Landroid/widget/TextView;

    invoke-direct {p0, v0, v1}, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$1;->poll(Landroid/widget/Button;Landroid/widget/TextView;)V
    :try_end_14
    .catchall {:try_start_d .. :try_end_14} :catchall_15

    .line 95
    goto :goto_2c

    .line 90
    :catchall_15
    move-exception v0

    .line 91
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$1;->disabled:Z

    .line 92
    iget-object v1, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$1;->val$configure:Landroid/widget/Button;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setVisibility(I)V

    .line 93
    iget-object v1, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$1;->val$status:Landroid/widget/TextView;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 94
    const-string v1, "swarm"

    const-string v2, "overlay poll failed; disabling overlay"

    invoke-static {v1, v2, v0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 96
    :goto_2c
    return-void

    .line 86
    :cond_2d
    :goto_2d
    return-void
.end method
