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


# direct methods
.method constructor <init>(Landroid/app/Activity;Landroid/widget/Spinner;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1095
    iput-object p1, p0, Lcom/trueaxis/modmenu/ModMenu$20;->val$a:Landroid/app/Activity;

    iput-object p2, p0, Lcom/trueaxis/modmenu/ModMenu$20;->val$cars:Landroid/widget/Spinner;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 5

    .line 1097
    const-string p1, "livery"

    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$20;->val$a:Landroid/app/Activity;

    iget-object v1, p0, Lcom/trueaxis/modmenu/ModMenu$20;->val$cars:Landroid/widget/Spinner;

    # invokes: Lcom/trueaxis/modmenu/ModMenu;->rememberCar(Landroid/content/Context;Landroid/widget/Spinner;)V
    invoke-static {v0, v1}, Lcom/trueaxis/modmenu/ModMenu;->access$300(Landroid/content/Context;Landroid/widget/Spinner;)V

    .line 1099
    :try_start_9
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "launch import picker car="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/trueaxis/modmenu/ModMenu$20;->val$a:Landroid/app/Activity;

    .line 1100
    # invokes: Lcom/trueaxis/modmenu/ModMenu;->selectedCar(Landroid/content/Context;)I
    invoke-static {v1}, Lcom/trueaxis/modmenu/ModMenu;->access$600(Landroid/content/Context;)I

    move-result v1

    invoke-static {v1}, Lcom/trueaxis/modmenu/ModMenu;->carName(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1099
    invoke-static {p1, v0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 1101
    new-instance v0, Landroid/content/Intent;

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x13

    if-lt v1, v2, :cond_34

    .line 1102
    const-string v1, "android.intent.action.OPEN_DOCUMENT"

    goto :goto_36

    :cond_34
    const-string v1, "android.intent.action.GET_CONTENT"

    :goto_36
    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1103
    const-string v1, "android.intent.category.OPENABLE"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 1104
    const-string v1, "image/*"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 1105
    iget-object v1, p0, Lcom/trueaxis/modmenu/ModMenu$20;->val$a:Landroid/app/Activity;

    const/16 v2, 0x1c85

    invoke-virtual {v1, v0, v2}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_4a
    .catchall {:try_start_9 .. :try_end_4a} :catchall_4b

    .line 1109
    goto :goto_58

    .line 1106
    :catchall_4b
    move-exception v0

    .line 1107
    const-string v1, "launch import picker failed"

    invoke-static {p1, v1, v0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1108
    iget-object p1, p0, Lcom/trueaxis/modmenu/ModMenu$20;->val$a:Landroid/app/Activity;

    const-string v0, "No file picker available on this device."

    # invokes: Lcom/trueaxis/modmenu/ModMenu;->toast(Landroid/content/Context;Ljava/lang/String;)V
    invoke-static {p1, v0}, Lcom/trueaxis/modmenu/ModMenu;->access$400(Landroid/content/Context;Ljava/lang/String;)V

    .line 1110
    :goto_58
    return-void
.end method
