.class Lcom/trueaxis/modmenu/ModMenu$7;
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

    .line 427
    iput-object p1, p0, Lcom/trueaxis/modmenu/ModMenu$7;->val$a:Landroid/app/Activity;

    iput-object p2, p0, Lcom/trueaxis/modmenu/ModMenu$7;->val$cars:Landroid/widget/Spinner;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 4

    .line 429
    iget-object p1, p0, Lcom/trueaxis/modmenu/ModMenu$7;->val$a:Landroid/app/Activity;

    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$7;->val$cars:Landroid/widget/Spinner;

    # invokes: Lcom/trueaxis/modmenu/ModMenu;->rememberCar(Landroid/content/Context;Landroid/widget/Spinner;)V
    invoke-static {p1, v0}, Lcom/trueaxis/modmenu/ModMenu;->access$100(Landroid/content/Context;Landroid/widget/Spinner;)V

    .line 431
    :try_start_7
    new-instance p1, Landroid/content/Intent;

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_12

    .line 432
    const-string v0, "android.intent.action.OPEN_DOCUMENT"

    goto :goto_14

    :cond_12
    const-string v0, "android.intent.action.GET_CONTENT"

    :goto_14
    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 433
    const-string v0, "android.intent.category.OPENABLE"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 434
    const-string v0, "image/*"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 435
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$7;->val$a:Landroid/app/Activity;

    const/16 v1, 0x1c85

    invoke-virtual {v0, p1, v1}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_28
    .catchall {:try_start_7 .. :try_end_28} :catchall_29

    .line 438
    goto :goto_31

    .line 436
    :catchall_29
    move-exception p1

    .line 437
    iget-object p1, p0, Lcom/trueaxis/modmenu/ModMenu$7;->val$a:Landroid/app/Activity;

    const-string v0, "No file picker available on this device."

    # invokes: Lcom/trueaxis/modmenu/ModMenu;->toast(Landroid/content/Context;Ljava/lang/String;)V
    invoke-static {p1, v0}, Lcom/trueaxis/modmenu/ModMenu;->access$200(Landroid/content/Context;Ljava/lang/String;)V

    .line 439
    :goto_31
    return-void
.end method
