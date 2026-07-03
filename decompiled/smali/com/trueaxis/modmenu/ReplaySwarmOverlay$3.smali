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

.field final synthetic val$primaryGroup:Landroid/widget/RadioGroup;


# direct methods
.method constructor <init>(Landroid/widget/RadioGroup;Landroid/app/Activity;I[Landroid/widget/CheckBox;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 223
    iput-object p1, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$3;->val$primaryGroup:Landroid/widget/RadioGroup;

    iput-object p2, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$3;->val$activity:Landroid/app/Activity;

    iput p3, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$3;->val$count:I

    iput-object p4, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$3;->val$boxes:[Landroid/widget/CheckBox;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 6

    .line 225
    iget-object p1, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$3;->val$primaryGroup:Landroid/widget/RadioGroup;

    invoke-virtual {p1}, Landroid/widget/RadioGroup;->getCheckedRadioButtonId()I

    move-result p1

    .line 226
    if-gez p1, :cond_10

    .line 227
    iget-object p1, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$3;->val$activity:Landroid/app/Activity;

    const-string p2, "Choose a primary replay."

    # invokes: Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->toast(Landroid/app/Activity;Ljava/lang/String;)V
    invoke-static {p1, p2}, Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->access$200(Landroid/app/Activity;Ljava/lang/String;)V

    .line 228
    return-void

    .line 230
    :cond_10
    nop

    .line 231
    const/4 p2, 0x0

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_14
    iget v2, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$3;->val$count:I

    if-ge v0, v2, :cond_29

    .line 232
    if-eq v0, p1, :cond_26

    iget-object v2, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$3;->val$boxes:[Landroid/widget/CheckBox;

    aget-object v2, v2, v0

    invoke-virtual {v2}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v2

    if-eqz v2, :cond_26

    .line 233
    add-int/lit8 v1, v1, 0x1

    .line 231
    :cond_26
    add-int/lit8 v0, v0, 0x1

    goto :goto_14

    .line 236
    :cond_29
    const/4 v0, 0x1

    if-ge v1, v0, :cond_34

    .line 237
    iget-object p1, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$3;->val$activity:Landroid/app/Activity;

    const-string p2, "Select at least one ghost replay."

    # invokes: Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->toast(Landroid/app/Activity;Ljava/lang/String;)V
    invoke-static {p1, p2}, Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->access$200(Landroid/app/Activity;Ljava/lang/String;)V

    .line 238
    return-void

    .line 240
    :cond_34
    new-array v0, v1, [I

    .line 241
    nop

    .line 242
    const/4 v1, 0x0

    :goto_38
    iget v2, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$3;->val$count:I

    if-ge p2, v2, :cond_50

    .line 243
    if-eq p2, p1, :cond_4d

    iget-object v2, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$3;->val$boxes:[Landroid/widget/CheckBox;

    aget-object v2, v2, p2

    invoke-virtual {v2}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v2

    if-eqz v2, :cond_4d

    .line 244
    add-int/lit8 v2, v1, 0x1

    aput p2, v0, v1

    move v1, v2

    .line 242
    :cond_4d
    add-int/lit8 p2, p2, 0x1

    goto :goto_38

    .line 247
    :cond_50
    invoke-static {p1, v0}, Lcom/trueaxis/modmenu/RequiredPatches;->setReplaySwarmSelection(I[I)V

    .line 248
    iget-object p1, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$3;->val$activity:Landroid/app/Activity;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Replay swarm active with "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    .line 249
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readReplaySwarmGhostCount()I

    move-result v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v0, " ghost replays."

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 248
    # invokes: Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->toast(Landroid/app/Activity;Ljava/lang/String;)V
    invoke-static {p1, p2}, Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->access$200(Landroid/app/Activity;Ljava/lang/String;)V

    .line 251
    return-void
.end method
