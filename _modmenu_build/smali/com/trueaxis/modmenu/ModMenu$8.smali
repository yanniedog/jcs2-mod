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

    .line 441
    iput-object p1, p0, Lcom/trueaxis/modmenu/ModMenu$8;->val$a:Landroid/app/Activity;

    iput-object p2, p0, Lcom/trueaxis/modmenu/ModMenu$8;->val$cars:Landroid/widget/Spinner;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 7

    .line 443
    iget-object p1, p0, Lcom/trueaxis/modmenu/ModMenu$8;->val$a:Landroid/app/Activity;

    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$8;->val$cars:Landroid/widget/Spinner;

    # invokes: Lcom/trueaxis/modmenu/ModMenu;->rememberCar(Landroid/content/Context;Landroid/widget/Spinner;)V
    invoke-static {p1, v0}, Lcom/trueaxis/modmenu/ModMenu;->access$100(Landroid/content/Context;Landroid/widget/Spinner;)V

    .line 444
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x13

    if-ge p1, v0, :cond_15

    .line 445
    iget-object p1, p0, Lcom/trueaxis/modmenu/ModMenu$8;->val$a:Landroid/app/Activity;

    const-string v0, "Export requires Android 4.4 or newer."

    # invokes: Lcom/trueaxis/modmenu/ModMenu;->toast(Landroid/content/Context;Ljava/lang/String;)V
    invoke-static {p1, v0}, Lcom/trueaxis/modmenu/ModMenu;->access$200(Landroid/content/Context;Ljava/lang/String;)V

    .line 446
    return-void

    .line 448
    :cond_15
    iget-object p1, p0, Lcom/trueaxis/modmenu/ModMenu$8;->val$a:Landroid/app/Activity;

    # invokes: Lcom/trueaxis/modmenu/ModMenu;->selectedCar(Landroid/content/Context;)I
    invoke-static {p1}, Lcom/trueaxis/modmenu/ModMenu;->access$400(Landroid/content/Context;)I

    move-result p1

    .line 450
    :try_start_1b
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.CREATE_DOCUMENT"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 451
    const-string v1, "android.intent.category.OPENABLE"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 452
    const-string v1, "image/png"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 453
    const-string v1, "android.intent.extra.TITLE"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "jcs2-"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 454
    # getter for: Lcom/trueaxis/modmenu/ModMenu;->CAR_NAMES:[Ljava/lang/String;
    invoke-static {}, Lcom/trueaxis/modmenu/ModMenu;->access$500()[Ljava/lang/String;

    move-result-object v3

    aget-object p1, v3, p1

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    const/16 v3, 0x20

    const/16 v4, 0x2d

    invoke-virtual {p1, v3, v4}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v2, "-livery.png"

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 453
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 455
    iget-object p1, p0, Lcom/trueaxis/modmenu/ModMenu$8;->val$a:Landroid/app/Activity;

    const/16 v1, 0x1c86

    invoke-virtual {p1, v0, v1}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_63
    .catchall {:try_start_1b .. :try_end_63} :catchall_64

    .line 458
    goto :goto_6c

    .line 456
    :catchall_64
    move-exception p1

    .line 457
    iget-object p1, p0, Lcom/trueaxis/modmenu/ModMenu$8;->val$a:Landroid/app/Activity;

    const-string v0, "No file picker available on this device."

    # invokes: Lcom/trueaxis/modmenu/ModMenu;->toast(Landroid/content/Context;Ljava/lang/String;)V
    invoke-static {p1, v0}, Lcom/trueaxis/modmenu/ModMenu;->access$200(Landroid/content/Context;Ljava/lang/String;)V

    .line 459
    :goto_6c
    return-void
.end method
