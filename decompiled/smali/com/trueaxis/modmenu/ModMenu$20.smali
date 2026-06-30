.class Lcom/trueaxis/modmenu/ModMenu$20;
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

.field final synthetic val$refresh:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Landroid/widget/Spinner;Landroid/app/Activity;Ljava/lang/Runnable;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 991
    iput-object p1, p0, Lcom/trueaxis/modmenu/ModMenu$20;->val$cars:Landroid/widget/Spinner;

    iput-object p2, p0, Lcom/trueaxis/modmenu/ModMenu$20;->val$a:Landroid/app/Activity;

    iput-object p3, p0, Lcom/trueaxis/modmenu/ModMenu$20;->val$refresh:Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 5

    .line 993
    iget-object p1, p0, Lcom/trueaxis/modmenu/ModMenu$20;->val$cars:Landroid/widget/Spinner;

    invoke-virtual {p1}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result p1

    .line 994
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "restore default car="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p1}, Lcom/trueaxis/modmenu/ModMenu;->carName(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "livery"

    invoke-static {v1, v0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 995
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$20;->val$a:Landroid/app/Activity;

    invoke-static {v0, p1}, Lcom/trueaxis/modmenu/ModMenu;->deleteCustomLivery(Landroid/content/Context;I)V

    .line 996
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$20;->val$refresh:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 997
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$20;->val$a:Landroid/app/Activity;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    # getter for: Lcom/trueaxis/modmenu/ModMenu;->CAR_NAMES:[Ljava/lang/String;
    invoke-static {}, Lcom/trueaxis/modmenu/ModMenu;->access$700()[Ljava/lang/String;

    move-result-object v2

    aget-object p1, v2, p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, " restored. Restart the game to apply."

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    # invokes: Lcom/trueaxis/modmenu/ModMenu;->toast(Landroid/content/Context;Ljava/lang/String;)V
    invoke-static {v0, p1}, Lcom/trueaxis/modmenu/ModMenu;->access$400(Landroid/content/Context;Ljava/lang/String;)V

    .line 998
    return-void
.end method
