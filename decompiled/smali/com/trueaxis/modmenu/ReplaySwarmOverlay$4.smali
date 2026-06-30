.class Lcom/trueaxis/modmenu/ReplaySwarmOverlay$4;
.super Ljava/lang/Object;
.source "ReplaySwarmOverlay.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->showPicker(Landroid/app/Activity;Landroid/widget/TextView;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$activity:Landroid/app/Activity;

.field final synthetic val$status:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Landroid/widget/TextView;Landroid/app/Activity;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 201
    iput-object p1, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$4;->val$status:Landroid/widget/TextView;

    iput-object p2, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$4;->val$activity:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 3

    .line 203
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->clearReplaySwarm()V

    .line 204
    iget-object p1, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$4;->val$status:Landroid/widget/TextView;

    const/16 p2, 0x8

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 205
    iget-object p1, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$4;->val$activity:Landroid/app/Activity;

    const-string p2, "Replay swarm cleared."

    # invokes: Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->toast(Landroid/app/Activity;Ljava/lang/String;)V
    invoke-static {p1, p2}, Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->access$100(Landroid/app/Activity;Ljava/lang/String;)V

    .line 206
    return-void
.end method
