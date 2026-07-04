.class Lcom/trueaxis/modmenu/ReplaySwarmOverlay$3;
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

.field final synthetic val$boxes:[Landroid/widget/CheckBox;

.field final synthetic val$count:I

.field final synthetic val$primary:I


# direct methods
.method constructor <init>(II[Landroid/widget/CheckBox;Landroid/app/Activity;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 217
    iput p1, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$3;->val$count:I

    iput p2, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$3;->val$primary:I

    iput-object p3, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$3;->val$boxes:[Landroid/widget/CheckBox;

    iput-object p4, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$3;->val$activity:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 6

    .line 219
    nop

    .line 220
    const/4 p1, 0x0

    const/4 p2, 0x0

    const/4 v0, 0x0

    :goto_4
    iget v1, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$3;->val$count:I

    if-ge p2, v1, :cond_1b

    .line 221
    iget v1, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$3;->val$primary:I

    if-eq p2, v1, :cond_18

    iget-object v1, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$3;->val$boxes:[Landroid/widget/CheckBox;

    aget-object v1, v1, p2

    invoke-virtual {v1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v1

    if-eqz v1, :cond_18

    .line 222
    add-int/lit8 v0, v0, 0x1

    .line 220
    :cond_18
    add-int/lit8 p2, p2, 0x1

    goto :goto_4

    .line 225
    :cond_1b
    const/4 p2, 0x1

    if-ge v0, p2, :cond_26

    .line 226
    iget-object p1, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$3;->val$activity:Landroid/app/Activity;

    const-string p2, "Tick at least one replay to add as a ghost."

    # invokes: Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->toast(Landroid/app/Activity;Ljava/lang/String;)V
    invoke-static {p1, p2}, Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->access$200(Landroid/app/Activity;Ljava/lang/String;)V

    .line 227
    return-void

    .line 229
    :cond_26
    new-array v0, v0, [I

    .line 230
    nop

    .line 231
    const/4 v1, 0x0

    :goto_2a
    iget v2, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$3;->val$count:I

    if-ge p1, v2, :cond_44

    .line 232
    iget v2, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$3;->val$primary:I

    if-eq p1, v2, :cond_41

    iget-object v2, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$3;->val$boxes:[Landroid/widget/CheckBox;

    aget-object v2, v2, p1

    invoke-virtual {v2}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v2

    if-eqz v2, :cond_41

    .line 233
    add-int/lit8 v2, v1, 0x1

    aput p1, v0, v1

    move v1, v2

    .line 231
    :cond_41
    add-int/lit8 p1, p1, 0x1

    goto :goto_2a

    .line 236
    :cond_44
    iget p1, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$3;->val$primary:I

    invoke-static {p1, v0}, Lcom/trueaxis/modmenu/RequiredPatches;->setReplaySwarmSelection(I[I)V

    .line 237
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readReplaySwarmGhostCount()I

    move-result p1

    .line 238
    if-ge p1, p2, :cond_57

    .line 239
    iget-object p1, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$3;->val$activity:Landroid/app/Activity;

    const-string p2, "Could not load the selected replays (files may be missing) \u2014 check the debug log."

    # invokes: Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->toast(Landroid/app/Activity;Ljava/lang/String;)V
    invoke-static {p1, p2}, Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->access$200(Landroid/app/Activity;Ljava/lang/String;)V

    goto :goto_75

    .line 242
    :cond_57
    iget-object p2, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$3;->val$activity:Landroid/app/Activity;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Swarm active: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " ghost replays."

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    # invokes: Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->toast(Landroid/app/Activity;Ljava/lang/String;)V
    invoke-static {p2, p1}, Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->access$200(Landroid/app/Activity;Ljava/lang/String;)V

    .line 244
    :goto_75
    return-void
.end method
