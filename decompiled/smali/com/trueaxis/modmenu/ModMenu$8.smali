.class Lcom/trueaxis/modmenu/ModMenu$8;
.super Ljava/lang/Object;
.source "ModMenu.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/modmenu/ModMenu;->showLiveryManager(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$a:Landroid/app/Activity;

.field final synthetic val$cars:Landroid/widget/Spinner;


# direct methods
.method constructor <init>(Landroid/app/Activity;Landroid/widget/Spinner;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 621
    iput-object p1, p0, Lcom/trueaxis/modmenu/ModMenu$8;->val$a:Landroid/app/Activity;

    iput-object p2, p0, Lcom/trueaxis/modmenu/ModMenu$8;->val$cars:Landroid/widget/Spinner;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 4

    .line 623
    iget-object p1, p0, Lcom/trueaxis/modmenu/ModMenu$8;->val$a:Landroid/app/Activity;

    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$8;->val$cars:Landroid/widget/Spinner;

    # invokes: Lcom/trueaxis/modmenu/ModMenu;->rememberCar(Landroid/content/Context;Landroid/widget/Spinner;)V
    invoke-static {p1, v0}, Lcom/trueaxis/modmenu/ModMenu;->access$200(Landroid/content/Context;Landroid/widget/Spinner;)V

    .line 625
    :try_start_7
    new-instance p1, Landroid/content/Intent;

    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$8;->val$a:Landroid/app/Activity;

    const-class v1, Lcom/trueaxis/modmenu/LiveryDesignerActivity;

    invoke-direct {p1, v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 626
    const-string v0, "car"

    iget-object v1, p0, Lcom/trueaxis/modmenu/ModMenu$8;->val$cars:Landroid/widget/Spinner;

    invoke-virtual {v1}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 627
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$8;->val$a:Landroid/app/Activity;

    invoke-virtual {v0, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
    :try_end_20
    .catchall {:try_start_7 .. :try_end_20} :catchall_21

    .line 630
    goto :goto_29

    .line 628
    :catchall_21
    move-exception p1

    .line 629
    iget-object p1, p0, Lcom/trueaxis/modmenu/ModMenu$8;->val$a:Landroid/app/Activity;

    const-string v0, "Could not open the designer."

    # invokes: Lcom/trueaxis/modmenu/ModMenu;->toast(Landroid/content/Context;Ljava/lang/String;)V
    invoke-static {p1, v0}, Lcom/trueaxis/modmenu/ModMenu;->access$300(Landroid/content/Context;Ljava/lang/String;)V

    .line 631
    :goto_29
    return-void
.end method
