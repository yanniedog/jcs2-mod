.class Lcom/trueaxis/modmenu/ReplaySwarmOverlay$2;
.super Ljava/lang/Object;
.source "ReplaySwarmOverlay.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->install(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$activity:Landroid/app/Activity;

.field final synthetic val$status:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Landroid/app/Activity;Landroid/widget/TextView;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 136
    iput-object p1, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$2;->val$activity:Landroid/app/Activity;

    iput-object p2, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$2;->val$status:Landroid/widget/TextView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 5

    .line 138
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "swarm button tapped catalog="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 139
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readReplaySwarmCatalogCount()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 138
    const-string v0, "swarm"

    invoke-static {v0, p1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 141
    :try_start_1c
    iget-object p1, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$2;->val$activity:Landroid/app/Activity;

    iget-object v1, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$2;->val$status:Landroid/widget/TextView;

    # invokes: Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->showPicker(Landroid/app/Activity;Landroid/widget/TextView;)V
    invoke-static {p1, v1}, Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->access$100(Landroid/app/Activity;Landroid/widget/TextView;)V
    :try_end_23
    .catchall {:try_start_1c .. :try_end_23} :catchall_24

    .line 145
    goto :goto_42

    .line 142
    :catchall_24
    move-exception p1

    .line 143
    const-string v1, "picker failed"

    invoke-static {v0, v1, p1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 144
    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$2;->val$activity:Landroid/app/Activity;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Swarm picker failed: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    # invokes: Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->toast(Landroid/app/Activity;Ljava/lang/String;)V
    invoke-static {v0, p1}, Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->access$200(Landroid/app/Activity;Ljava/lang/String;)V

    .line 146
    :goto_42
    return-void
.end method
