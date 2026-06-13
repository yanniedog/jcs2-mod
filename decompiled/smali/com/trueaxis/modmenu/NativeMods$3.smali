.class Lcom/trueaxis/modmenu/NativeMods$3;
.super Ljava/lang/Object;
.source "NativeMods.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/modmenu/NativeMods;->booleanRow(Landroid/app/Activity;Lcom/trueaxis/modmenu/NativeMods$Spec;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$a:Landroid/app/Activity;

.field final synthetic val$spec:Lcom/trueaxis/modmenu/NativeMods$Spec;

.field final synthetic val$status:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Lcom/trueaxis/modmenu/NativeMods$Spec;Landroid/app/Activity;Landroid/widget/TextView;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 314
    iput-object p1, p0, Lcom/trueaxis/modmenu/NativeMods$3;->val$spec:Lcom/trueaxis/modmenu/NativeMods$Spec;

    iput-object p2, p0, Lcom/trueaxis/modmenu/NativeMods$3;->val$a:Landroid/app/Activity;

    iput-object p3, p0, Lcom/trueaxis/modmenu/NativeMods$3;->val$status:Landroid/widget/TextView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 7

    .line 316
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    .line 318
    const/4 v0, 0x1

    const/4 v1, -0x1

    if-ne p1, v1, :cond_11

    iget-object v2, p0, Lcom/trueaxis/modmenu/NativeMods$3;->val$spec:Lcom/trueaxis/modmenu/NativeMods$Spec;

    iget v2, v2, Lcom/trueaxis/modmenu/NativeMods$Spec;->id:I

    # invokes: Lcom/trueaxis/modmenu/NativeMods;->reset(I)Z
    invoke-static {v2}, Lcom/trueaxis/modmenu/NativeMods;->access$300(I)Z

    move-result v2

    goto :goto_1e

    .line 319
    :cond_11
    iget-object v2, p0, Lcom/trueaxis/modmenu/NativeMods$3;->val$spec:Lcom/trueaxis/modmenu/NativeMods$Spec;

    iget v2, v2, Lcom/trueaxis/modmenu/NativeMods$Spec;->id:I

    if-ne p1, v0, :cond_19

    const/4 v3, 0x1

    goto :goto_1a

    :cond_19
    const/4 v3, 0x0

    :goto_1a
    # invokes: Lcom/trueaxis/modmenu/NativeMods;->setBool(IZ)Z
    invoke-static {v2, v3}, Lcom/trueaxis/modmenu/NativeMods;->access$400(IZ)Z

    move-result v2

    .line 320
    :goto_1e
    if-eqz v2, :cond_75

    .line 321
    iget-object v2, p0, Lcom/trueaxis/modmenu/NativeMods$3;->val$a:Landroid/app/Activity;

    invoke-static {v2}, Lcom/trueaxis/modmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    .line 322
    if-ne p1, v1, :cond_36

    iget-object v3, p0, Lcom/trueaxis/modmenu/NativeMods$3;->val$spec:Lcom/trueaxis/modmenu/NativeMods$Spec;

    # invokes: Lcom/trueaxis/modmenu/NativeMods;->modeKey(Lcom/trueaxis/modmenu/NativeMods$Spec;)Ljava/lang/String;
    invoke-static {v3}, Lcom/trueaxis/modmenu/NativeMods;->access$500(Lcom/trueaxis/modmenu/NativeMods$Spec;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    goto :goto_3f

    .line 323
    :cond_36
    iget-object v3, p0, Lcom/trueaxis/modmenu/NativeMods$3;->val$spec:Lcom/trueaxis/modmenu/NativeMods$Spec;

    # invokes: Lcom/trueaxis/modmenu/NativeMods;->modeKey(Lcom/trueaxis/modmenu/NativeMods$Spec;)Ljava/lang/String;
    invoke-static {v3}, Lcom/trueaxis/modmenu/NativeMods;->access$500(Lcom/trueaxis/modmenu/NativeMods$Spec;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 324
    :goto_3f
    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 325
    iget-object v2, p0, Lcom/trueaxis/modmenu/NativeMods$3;->val$status:Landroid/widget/TextView;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/trueaxis/modmenu/NativeMods$3;->val$spec:Lcom/trueaxis/modmenu/NativeMods$Spec;

    iget-object v4, v4, Lcom/trueaxis/modmenu/NativeMods$Spec;->label:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "  ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    if-ne p1, v1, :cond_5c

    const-string p1, "DEFAULT"

    goto :goto_63

    :cond_5c
    if-ne p1, v0, :cond_61

    const-string p1, "ON"

    goto :goto_63

    :cond_61
    const-string p1, "OFF"

    :goto_63
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, "]"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 326
    goto :goto_91

    .line 327
    :cond_75
    iget-object p1, p0, Lcom/trueaxis/modmenu/NativeMods$3;->val$a:Landroid/app/Activity;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/trueaxis/modmenu/NativeMods$3;->val$spec:Lcom/trueaxis/modmenu/NativeMods$Spec;

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

    .line 329
    :goto_91
    return-void
.end method
