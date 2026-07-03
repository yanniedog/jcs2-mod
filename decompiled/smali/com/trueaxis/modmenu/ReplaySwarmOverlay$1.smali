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

.field private lastCatalog:I

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

    .line 100
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readReplaySwarmActive()I

    move-result v0

    .line 101
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readReplaySwarmCatalogCount()I

    move-result v1

    .line 102
    iget v2, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$1;->lastCatalog:I

    const-string v3, "swarm"

    if-eq v1, v2, :cond_2b

    .line 103
    iput v1, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$1;->lastCatalog:I

    .line 104
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "catalog updated count="

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 105
    iget-object v2, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$1;->val$activity:Landroid/app/Activity;

    # invokes: Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->persistCatalog(Landroid/app/Activity;I)V
    invoke-static {v2, v1}, Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->access$000(Landroid/app/Activity;I)V

    .line 107
    :cond_2b
    iget v2, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$1;->lastState:I

    if-eq v0, v2, :cond_5f

    .line 108
    iput v0, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$1;->lastState:I

    .line 109
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "overlay state="

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, " catalog="

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " ghosts="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 111
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readReplaySwarmGhostCount()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 109
    invoke-static {v3, v1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 114
    :cond_5f
    const-wide/16 v1, 0x1f4

    const/16 v3, 0x8

    if-nez v0, :cond_71

    .line 115
    invoke-virtual {p1, v3}, Landroid/widget/Button;->setVisibility(I)V

    .line 116
    invoke-virtual {p2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 117
    iget-object p1, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$1;->val$handler:Landroid/os/Handler;

    invoke-virtual {p1, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 118
    return-void

    .line 121
    :cond_71
    const/4 v4, 0x0

    invoke-virtual {p1, v4}, Landroid/widget/Button;->setVisibility(I)V

    .line 122
    invoke-virtual {p1}, Landroid/widget/Button;->bringToFront()V

    .line 123
    const/4 p1, 0x2

    if-ne v0, p1, :cond_a2

    .line 124
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Swarm: "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 125
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readReplaySwarmGhostCount()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " ghost replays"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 124
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 127
    invoke-virtual {p2, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 128
    invoke-virtual {p2}, Landroid/widget/TextView;->bringToFront()V

    goto :goto_a5

    .line 130
    :cond_a2
    invoke-virtual {p2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 132
    :goto_a5
    iget-object p1, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$1;->val$handler:Landroid/os/Handler;

    invoke-virtual {p1, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 133
    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .line 86
    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$1;->val$activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_2d

    iget-boolean v0, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$1;->disabled:Z

    if-eqz v0, :cond_d

    goto :goto_2d

    .line 90
    :cond_d
    :try_start_d
    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$1;->val$configure:Landroid/widget/Button;

    iget-object v1, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$1;->val$status:Landroid/widget/TextView;

    invoke-direct {p0, v0, v1}, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$1;->poll(Landroid/widget/Button;Landroid/widget/TextView;)V
    :try_end_14
    .catchall {:try_start_d .. :try_end_14} :catchall_15

    .line 96
    goto :goto_2c

    .line 91
    :catchall_15
    move-exception v0

    .line 92
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$1;->disabled:Z

    .line 93
    iget-object v1, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$1;->val$configure:Landroid/widget/Button;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setVisibility(I)V

    .line 94
    iget-object v1, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$1;->val$status:Landroid/widget/TextView;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 95
    const-string v1, "swarm"

    const-string v2, "overlay poll failed; disabling overlay"

    invoke-static {v1, v2, v0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 97
    :goto_2c
    return-void

    .line 87
    :cond_2d
    :goto_2d
    return-void
.end method
