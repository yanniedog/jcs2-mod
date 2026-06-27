.class Lcom/trueaxis/modmenu/ModMenu$12;
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

    .line 726
    iput-object p1, p0, Lcom/trueaxis/modmenu/ModMenu$12;->val$a:Landroid/app/Activity;

    iput-object p2, p0, Lcom/trueaxis/modmenu/ModMenu$12;->val$cars:Landroid/widget/Spinner;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 8

    .line 728
    const-string p1, "livery"

    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$12;->val$a:Landroid/app/Activity;

    iget-object v1, p0, Lcom/trueaxis/modmenu/ModMenu$12;->val$cars:Landroid/widget/Spinner;

    # invokes: Lcom/trueaxis/modmenu/ModMenu;->rememberCar(Landroid/content/Context;Landroid/widget/Spinner;)V
    invoke-static {v0, v1}, Lcom/trueaxis/modmenu/ModMenu;->access$200(Landroid/content/Context;Landroid/widget/Spinner;)V

    .line 729
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-ge v0, v1, :cond_17

    .line 730
    iget-object p1, p0, Lcom/trueaxis/modmenu/ModMenu$12;->val$a:Landroid/app/Activity;

    const-string v0, "Export requires Android 4.4 or newer."

    # invokes: Lcom/trueaxis/modmenu/ModMenu;->toast(Landroid/content/Context;Ljava/lang/String;)V
    invoke-static {p1, v0}, Lcom/trueaxis/modmenu/ModMenu;->access$300(Landroid/content/Context;Ljava/lang/String;)V

    .line 731
    return-void

    .line 733
    :cond_17
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$12;->val$a:Landroid/app/Activity;

    # invokes: Lcom/trueaxis/modmenu/ModMenu;->selectedCar(Landroid/content/Context;)I
    invoke-static {v0}, Lcom/trueaxis/modmenu/ModMenu;->access$500(Landroid/content/Context;)I

    move-result v0

    .line 735
    :try_start_1d
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "launch export picker car="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {v0}, Lcom/trueaxis/modmenu/ModMenu;->carName(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 736
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.CREATE_DOCUMENT"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 737
    const-string v2, "android.intent.category.OPENABLE"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 738
    const-string v2, "image/png"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 739
    const-string v2, "android.intent.extra.TITLE"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "jcs2-"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 740
    # getter for: Lcom/trueaxis/modmenu/ModMenu;->CAR_NAMES:[Ljava/lang/String;
    invoke-static {}, Lcom/trueaxis/modmenu/ModMenu;->access$600()[Ljava/lang/String;

    move-result-object v4

    aget-object v0, v4, v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const/16 v4, 0x20

    const/16 v5, 0x2d

    invoke-virtual {v0, v4, v5}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, "-livery.png"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 739
    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 741
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$12;->val$a:Landroid/app/Activity;

    const/16 v2, 0x1c86

    invoke-virtual {v0, v1, v2}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_7f
    .catchall {:try_start_1d .. :try_end_7f} :catchall_80

    .line 745
    goto :goto_8d

    .line 742
    :catchall_80
    move-exception v0

    .line 743
    const-string v1, "launch export picker failed"

    invoke-static {p1, v1, v0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 744
    iget-object p1, p0, Lcom/trueaxis/modmenu/ModMenu$12;->val$a:Landroid/app/Activity;

    const-string v0, "No file picker available on this device."

    # invokes: Lcom/trueaxis/modmenu/ModMenu;->toast(Landroid/content/Context;Ljava/lang/String;)V
    invoke-static {p1, v0}, Lcom/trueaxis/modmenu/ModMenu;->access$300(Landroid/content/Context;Ljava/lang/String;)V

    .line 746
    :goto_8d
    return-void
.end method
