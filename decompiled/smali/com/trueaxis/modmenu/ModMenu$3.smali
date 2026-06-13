.class Lcom/trueaxis/modmenu/ModMenu$3;
.super Ljava/lang/Object;
.source "ModMenu.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/modmenu/ModMenu;->showPreLaunchMenu(Landroid/app/Activity;Ljava/lang/Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$a:Landroid/app/Activity;

.field final synthetic val$autopilot:Landroid/widget/CheckBox;

.field final synthetic val$ballistic:Landroid/widget/CheckBox;

.field final synthetic val$checkpoints:Landroid/widget/CheckBox;

.field final synthetic val$noAds:Landroid/widget/CheckBox;

.field final synthetic val$onPlay:Ljava/lang/Runnable;

.field final synthetic val$smooth:Landroid/widget/CheckBox;

.field final synthetic val$unlock:Landroid/widget/CheckBox;


# direct methods
.method constructor <init>(Landroid/app/Activity;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Ljava/lang/Runnable;)V
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 313
    iput-object p1, p0, Lcom/trueaxis/modmenu/ModMenu$3;->val$a:Landroid/app/Activity;

    iput-object p2, p0, Lcom/trueaxis/modmenu/ModMenu$3;->val$unlock:Landroid/widget/CheckBox;

    iput-object p3, p0, Lcom/trueaxis/modmenu/ModMenu$3;->val$noAds:Landroid/widget/CheckBox;

    iput-object p4, p0, Lcom/trueaxis/modmenu/ModMenu$3;->val$checkpoints:Landroid/widget/CheckBox;

    iput-object p5, p0, Lcom/trueaxis/modmenu/ModMenu$3;->val$ballistic:Landroid/widget/CheckBox;

    iput-object p6, p0, Lcom/trueaxis/modmenu/ModMenu$3;->val$smooth:Landroid/widget/CheckBox;

    iput-object p7, p0, Lcom/trueaxis/modmenu/ModMenu$3;->val$autopilot:Landroid/widget/CheckBox;

    iput-object p8, p0, Lcom/trueaxis/modmenu/ModMenu$3;->val$onPlay:Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 9

    .line 315
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$3;->val$a:Landroid/app/Activity;

    iget-object p1, p0, Lcom/trueaxis/modmenu/ModMenu$3;->val$unlock:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v1

    iget-object p1, p0, Lcom/trueaxis/modmenu/ModMenu$3;->val$noAds:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v2

    iget-object p1, p0, Lcom/trueaxis/modmenu/ModMenu$3;->val$checkpoints:Landroid/widget/CheckBox;

    .line 316
    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v3

    iget-object p1, p0, Lcom/trueaxis/modmenu/ModMenu$3;->val$ballistic:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v4

    iget-object p1, p0, Lcom/trueaxis/modmenu/ModMenu$3;->val$smooth:Landroid/widget/CheckBox;

    .line 317
    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v5

    iget-object p1, p0, Lcom/trueaxis/modmenu/ModMenu$3;->val$autopilot:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v6

    .line 315
    # invokes: Lcom/trueaxis/modmenu/ModMenu;->saveQuickCheats(Landroid/content/Context;ZZZZZZ)V
    invoke-static/range {v0 .. v6}, Lcom/trueaxis/modmenu/ModMenu;->access$000(Landroid/content/Context;ZZZZZZ)V

    .line 318
    iget-object p1, p0, Lcom/trueaxis/modmenu/ModMenu$3;->val$onPlay:Ljava/lang/Runnable;

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 319
    return-void
.end method
