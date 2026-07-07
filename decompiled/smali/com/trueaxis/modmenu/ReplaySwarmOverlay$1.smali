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
.field private autoApplied:Z

.field private disabled:Z

.field private lastCatalog:I

.field private lastState:I

.field private pollCount:I

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

    .line 78
    iput-object p1, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$1;->val$activity:Landroid/app/Activity;

    iput-object p2, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$1;->val$configure:Landroid/widget/Button;

    iput-object p3, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$1;->val$status:Landroid/widget/TextView;

    iput-object p4, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$1;->val$handler:Landroid/os/Handler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private poll(Landroid/widget/Button;Landroid/widget/TextView;)V
    .registers 20

    .line 102
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    iget v3, v0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$1;->pollCount:I

    const/4 v4, 0x1

    add-int/2addr v3, v4

    iput v3, v0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$1;->pollCount:I

    rem-int/lit8 v3, v3, 0x14

    if-nez v3, :cond_15

    .line 103
    iget-object v3, v0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$1;->val$activity:Landroid/app/Activity;

    invoke-static {v3}, Lcom/trueaxis/modmenu/RequiredPatches;->archiveNewSlotReplays(Landroid/content/Context;)I

    .line 105
    :cond_15
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readReplaySwarmActive()I

    move-result v3

    .line 106
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readReplaySwarmCatalogCount()I

    move-result v5

    .line 107
    iget v6, v0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$1;->lastCatalog:I

    const-string v7, "swarm"

    if-eq v5, v6, :cond_40

    .line 108
    iput v5, v0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$1;->lastCatalog:I

    .line 109
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "catalog updated count="

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v7, v6}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 110
    iget-object v6, v0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$1;->val$activity:Landroid/app/Activity;

    # invokes: Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->persistCatalog(Landroid/app/Activity;I)V
    invoke-static {v6, v5}, Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->access$000(Landroid/app/Activity;I)V

    .line 112
    :cond_40
    iget v6, v0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$1;->lastState:I

    const-string v8, " ghosts="

    if-eq v3, v6, :cond_74

    .line 113
    iput v3, v0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$1;->lastState:I

    .line 114
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "overlay state="

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v9, " catalog="

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 116
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readReplaySwarmGhostCount()I

    move-result v9

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 114
    invoke-static {v7, v6}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 119
    :cond_74
    const-wide/16 v9, 0x1f4

    const/16 v6, 0x8

    if-nez v3, :cond_86

    .line 120
    invoke-virtual {v1, v6}, Landroid/widget/Button;->setVisibility(I)V

    .line 121
    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 122
    iget-object v1, v0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$1;->val$handler:Landroid/os/Handler;

    invoke-virtual {v1, v0, v9, v10}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 123
    return-void

    .line 128
    :cond_86
    const/4 v11, 0x0

    if-ne v3, v4, :cond_de

    iget-boolean v12, v0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$1;->autoApplied:Z

    if-nez v12, :cond_de

    iget-object v12, v0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$1;->val$activity:Landroid/app/Activity;

    invoke-static {v12}, Lcom/trueaxis/modmenu/ModMenu;->swarmAutoApplyEnabled(Landroid/content/Context;)Z

    move-result v12

    if-eqz v12, :cond_de

    .line 129
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readReplaySwarmPrimaryIndex()I

    move-result v12

    .line 130
    if-ltz v12, :cond_de

    if-lez v5, :cond_de

    .line 131
    iput-boolean v4, v0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$1;->autoApplied:Z

    .line 132
    add-int/lit8 v4, v5, -0x1

    invoke-static {v11, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    new-array v13, v4, [I

    .line 133
    nop

    .line 134
    const/4 v14, 0x0

    const/4 v15, 0x0

    :goto_aa
    if-ge v14, v5, :cond_b9

    .line 135
    if-eq v14, v12, :cond_b6

    if-ge v15, v4, :cond_b6

    .line 136
    add-int/lit8 v16, v15, 0x1

    aput v14, v13, v15

    move/from16 v15, v16

    .line 134
    :cond_b6
    add-int/lit8 v14, v14, 0x1

    goto :goto_aa

    .line 139
    :cond_b9
    invoke-static {v12, v13}, Lcom/trueaxis/modmenu/RequiredPatches;->setReplaySwarmSelection(I[I)V

    .line 140
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "autoapply primary="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 141
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readReplaySwarmGhostCount()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 140
    invoke-static {v7, v4}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 145
    :cond_de
    invoke-virtual {v1, v11}, Landroid/widget/Button;->setVisibility(I)V

    .line 146
    invoke-virtual/range {p1 .. p1}, Landroid/widget/Button;->bringToFront()V

    .line 147
    const/4 v1, 0x2

    if-ne v3, v1, :cond_10e

    .line 148
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Swarm: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 149
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readReplaySwarmGhostCount()I

    move-result v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, " ghost replays"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 148
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 151
    invoke-virtual {v2, v11}, Landroid/widget/TextView;->setVisibility(I)V

    .line 152
    invoke-virtual/range {p2 .. p2}, Landroid/widget/TextView;->bringToFront()V

    goto :goto_111

    .line 154
    :cond_10e
    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 156
    :goto_111
    iget-object v1, v0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$1;->val$handler:Landroid/os/Handler;

    invoke-virtual {v1, v0, v9, v10}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 157
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
