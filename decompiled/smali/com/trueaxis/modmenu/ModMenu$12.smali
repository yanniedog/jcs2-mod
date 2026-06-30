.class Lcom/trueaxis/modmenu/ModMenu$12;
.super Ljava/lang/Object;
.source "ModMenu.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/modmenu/ModMenu;->addCheckBox(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/Runnable;)Landroid/widget/CheckBox;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$afterChange:Ljava/lang/Runnable;

.field final synthetic val$c:Landroid/content/Context;

.field final synthetic val$checkBox:Landroid/widget/CheckBox;

.field final synthetic val$key:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/lang/String;Landroid/widget/CheckBox;Ljava/lang/Runnable;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 767
    iput-object p1, p0, Lcom/trueaxis/modmenu/ModMenu$12;->val$c:Landroid/content/Context;

    iput-object p2, p0, Lcom/trueaxis/modmenu/ModMenu$12;->val$key:Ljava/lang/String;

    iput-object p3, p0, Lcom/trueaxis/modmenu/ModMenu$12;->val$checkBox:Landroid/widget/CheckBox;

    iput-object p4, p0, Lcom/trueaxis/modmenu/ModMenu$12;->val$afterChange:Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 4

    .line 769
    iget-object p1, p0, Lcom/trueaxis/modmenu/ModMenu$12;->val$c:Landroid/content/Context;

    invoke-static {p1}, Lcom/trueaxis/modmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$12;->val$key:Ljava/lang/String;

    iget-object v1, p0, Lcom/trueaxis/modmenu/ModMenu$12;->val$checkBox:Landroid/widget/CheckBox;

    invoke-virtual {v1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v1

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 770
    iget-object p1, p0, Lcom/trueaxis/modmenu/ModMenu$12;->val$afterChange:Ljava/lang/Runnable;

    if-eqz p1, :cond_22

    .line 771
    iget-object p1, p0, Lcom/trueaxis/modmenu/ModMenu$12;->val$afterChange:Ljava/lang/Runnable;

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 773
    :cond_22
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "option toggled key="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$12;->val$key:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " value="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$12;->val$checkBox:Landroid/widget/CheckBox;

    .line 774
    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 773
    const-string v0, "launcher"

    invoke-static {v0, p1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 775
    return-void
.end method
