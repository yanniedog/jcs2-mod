.class Lcom/trueaxis/modmenu/NativeMods$5;
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
.method constructor <init>(Lcom/trueaxis/modmenu/NativeMods$Spec;Landroid/widget/EditText;Landroid/app/Activity;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 377
    iput-object p1, p0, Lcom/trueaxis/modmenu/NativeMods$5;->val$spec:Lcom/trueaxis/modmenu/NativeMods$Spec;

    iput-object p2, p0, Lcom/trueaxis/modmenu/NativeMods$5;->val$value:Landroid/widget/EditText;

    iput-object p3, p0, Lcom/trueaxis/modmenu/NativeMods$5;->val$a:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 4

    .line 379
    iget-object p1, p0, Lcom/trueaxis/modmenu/NativeMods$5;->val$spec:Lcom/trueaxis/modmenu/NativeMods$Spec;

    iget p1, p1, Lcom/trueaxis/modmenu/NativeMods$Spec;->type:I

    const/4 v0, 0x5

    if-ne p1, v0, :cond_10

    iget-object p1, p0, Lcom/trueaxis/modmenu/NativeMods$5;->val$spec:Lcom/trueaxis/modmenu/NativeMods$Spec;

    iget p1, p1, Lcom/trueaxis/modmenu/NativeMods$Spec;->id:I

    # invokes: Lcom/trueaxis/modmenu/NativeMods;->resetCall(I)Z
    invoke-static {p1}, Lcom/trueaxis/modmenu/NativeMods;->access$1100(I)Z

    move-result p1

    goto :goto_18

    :cond_10
    iget-object p1, p0, Lcom/trueaxis/modmenu/NativeMods$5;->val$spec:Lcom/trueaxis/modmenu/NativeMods$Spec;

    iget p1, p1, Lcom/trueaxis/modmenu/NativeMods$Spec;->id:I

    # invokes: Lcom/trueaxis/modmenu/NativeMods;->reset(I)Z
    invoke-static {p1}, Lcom/trueaxis/modmenu/NativeMods;->access$300(I)Z

    move-result p1

    .line 380
    :goto_18
    if-eqz p1, :cond_55

    .line 381
    iget-object p1, p0, Lcom/trueaxis/modmenu/NativeMods$5;->val$value:Landroid/widget/EditText;

    const-string v0, ""

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 382
    iget-object p1, p0, Lcom/trueaxis/modmenu/NativeMods$5;->val$a:Landroid/app/Activity;

    invoke-static {p1}, Lcom/trueaxis/modmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    iget-object v0, p0, Lcom/trueaxis/modmenu/NativeMods$5;->val$spec:Lcom/trueaxis/modmenu/NativeMods$Spec;

    # invokes: Lcom/trueaxis/modmenu/NativeMods;->valueKey(Lcom/trueaxis/modmenu/NativeMods$Spec;)Ljava/lang/String;
    invoke-static {v0}, Lcom/trueaxis/modmenu/NativeMods;->access$1000(Lcom/trueaxis/modmenu/NativeMods$Spec;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 383
    iget-object p1, p0, Lcom/trueaxis/modmenu/NativeMods$5;->val$a:Landroid/app/Activity;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/trueaxis/modmenu/NativeMods$5;->val$spec:Lcom/trueaxis/modmenu/NativeMods$Spec;

    iget-object v1, v1, Lcom/trueaxis/modmenu/NativeMods$Spec;->label:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " restored."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    # invokes: Lcom/trueaxis/modmenu/NativeMods;->toast(Landroid/content/Context;Ljava/lang/String;)V
    invoke-static {p1, v0}, Lcom/trueaxis/modmenu/NativeMods;->access$600(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_71

    .line 385
    :cond_55
    iget-object p1, p0, Lcom/trueaxis/modmenu/NativeMods$5;->val$a:Landroid/app/Activity;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/trueaxis/modmenu/NativeMods$5;->val$spec:Lcom/trueaxis/modmenu/NativeMods$Spec;

    iget-object v1, v1, Lcom/trueaxis/modmenu/NativeMods$Spec;->label:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " is unavailable."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    # invokes: Lcom/trueaxis/modmenu/NativeMods;->toast(Landroid/content/Context;Ljava/lang/String;)V
    invoke-static {p1, v0}, Lcom/trueaxis/modmenu/NativeMods;->access$600(Landroid/content/Context;Ljava/lang/String;)V

    .line 387
    :goto_71
    return-void
.end method
