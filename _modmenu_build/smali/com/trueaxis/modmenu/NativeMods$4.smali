.class Lcom/trueaxis/modmenu/NativeMods$4;
.super Ljava/lang/Object;
.source "NativeMods.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/modmenu/NativeMods;->numberRow(Landroid/app/Activity;Lcom/trueaxis/modmenu/NativeMods$Spec;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$a:Landroid/app/Activity;

.field final synthetic val$spec:Lcom/trueaxis/modmenu/NativeMods$Spec;

.field final synthetic val$value:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Landroid/widget/EditText;Lcom/trueaxis/modmenu/NativeMods$Spec;Landroid/app/Activity;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 361
    iput-object p1, p0, Lcom/trueaxis/modmenu/NativeMods$4;->val$value:Landroid/widget/EditText;

    iput-object p2, p0, Lcom/trueaxis/modmenu/NativeMods$4;->val$spec:Lcom/trueaxis/modmenu/NativeMods$Spec;

    iput-object p3, p0, Lcom/trueaxis/modmenu/NativeMods$4;->val$a:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 4

    .line 364
    :try_start_0
    iget-object p1, p0, Lcom/trueaxis/modmenu/NativeMods$4;->val$value:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 366
    iget-object v0, p0, Lcom/trueaxis/modmenu/NativeMods$4;->val$spec:Lcom/trueaxis/modmenu/NativeMods$Spec;

    iget v0, v0, Lcom/trueaxis/modmenu/NativeMods$Spec;->type:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_22

    iget-object v0, p0, Lcom/trueaxis/modmenu/NativeMods$4;->val$spec:Lcom/trueaxis/modmenu/NativeMods$Spec;

    iget v0, v0, Lcom/trueaxis/modmenu/NativeMods$Spec;->id:I

    invoke-static {p1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v1

    # invokes: Lcom/trueaxis/modmenu/NativeMods;->setFloat(IF)Z
    invoke-static {v0, v1}, Lcom/trueaxis/modmenu/NativeMods;->access$700(IF)Z

    move-result v0

    goto :goto_42

    .line 367
    :cond_22
    iget-object v0, p0, Lcom/trueaxis/modmenu/NativeMods$4;->val$spec:Lcom/trueaxis/modmenu/NativeMods$Spec;

    iget v0, v0, Lcom/trueaxis/modmenu/NativeMods$Spec;->type:I

    const/4 v1, 0x5

    if-ne v0, v1, :cond_36

    iget-object v0, p0, Lcom/trueaxis/modmenu/NativeMods$4;->val$spec:Lcom/trueaxis/modmenu/NativeMods$Spec;

    iget v0, v0, Lcom/trueaxis/modmenu/NativeMods$Spec;->id:I

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    # invokes: Lcom/trueaxis/modmenu/NativeMods;->callInt(II)Z
    invoke-static {v0, v1}, Lcom/trueaxis/modmenu/NativeMods;->access$800(II)Z

    move-result v0

    goto :goto_42

    .line 368
    :cond_36
    iget-object v0, p0, Lcom/trueaxis/modmenu/NativeMods$4;->val$spec:Lcom/trueaxis/modmenu/NativeMods$Spec;

    iget v0, v0, Lcom/trueaxis/modmenu/NativeMods$Spec;->id:I

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    # invokes: Lcom/trueaxis/modmenu/NativeMods;->setInt(II)Z
    invoke-static {v0, v1}, Lcom/trueaxis/modmenu/NativeMods;->access$900(II)Z

    move-result v0

    .line 369
    :goto_42
    if-eqz v0, :cond_78

    .line 370
    iget-object v0, p0, Lcom/trueaxis/modmenu/NativeMods$4;->val$a:Landroid/app/Activity;

    invoke-static {v0}, Lcom/trueaxis/modmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget-object v1, p0, Lcom/trueaxis/modmenu/NativeMods$4;->val$spec:Lcom/trueaxis/modmenu/NativeMods$Spec;

    # invokes: Lcom/trueaxis/modmenu/NativeMods;->valueKey(Lcom/trueaxis/modmenu/NativeMods$Spec;)Ljava/lang/String;
    invoke-static {v1}, Lcom/trueaxis/modmenu/NativeMods;->access$1000(Lcom/trueaxis/modmenu/NativeMods$Spec;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 371
    iget-object p1, p0, Lcom/trueaxis/modmenu/NativeMods$4;->val$a:Landroid/app/Activity;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/trueaxis/modmenu/NativeMods$4;->val$spec:Lcom/trueaxis/modmenu/NativeMods$Spec;

    iget-object v1, v1, Lcom/trueaxis/modmenu/NativeMods$Spec;->label:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " applied."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    # invokes: Lcom/trueaxis/modmenu/NativeMods;->toast(Landroid/content/Context;Ljava/lang/String;)V
    invoke-static {p1, v0}, Lcom/trueaxis/modmenu/NativeMods;->access$600(Landroid/content/Context;Ljava/lang/String;)V

    .line 374
    goto :goto_a3

    .line 369
    :cond_78
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "unavailable"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_80
    .catchall {:try_start_0 .. :try_end_80} :catchall_80

    .line 372
    :catchall_80
    move-exception p1

    .line 373
    iget-object p1, p0, Lcom/trueaxis/modmenu/NativeMods$4;->val$a:Landroid/app/Activity;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Enter a valid value for "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/trueaxis/modmenu/NativeMods$4;->val$spec:Lcom/trueaxis/modmenu/NativeMods$Spec;

    iget-object v1, v1, Lcom/trueaxis/modmenu/NativeMods$Spec;->label:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    # invokes: Lcom/trueaxis/modmenu/NativeMods;->toast(Landroid/content/Context;Ljava/lang/String;)V
    invoke-static {p1, v0}, Lcom/trueaxis/modmenu/NativeMods;->access$600(Landroid/content/Context;Ljava/lang/String;)V

    .line 375
    :goto_a3
    return-void
.end method
