.class Lcom/trueaxis/modmenu/ModMenu$4;
.super Ljava/lang/Object;
.source "ModMenu.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/modmenu/ModMenu;->showPreLaunchMenu(Landroid/app/Activity;Ljava/lang/Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$a:Landroid/app/Activity;

.field final synthetic val$experimental:Landroid/widget/LinearLayout;

.field final synthetic val$showExperimental:Landroid/widget/CheckBox;


# direct methods
.method constructor <init>(Landroid/app/Activity;Landroid/widget/CheckBox;Landroid/widget/LinearLayout;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 427
    iput-object p1, p0, Lcom/trueaxis/modmenu/ModMenu$4;->val$a:Landroid/app/Activity;

    iput-object p2, p0, Lcom/trueaxis/modmenu/ModMenu$4;->val$showExperimental:Landroid/widget/CheckBox;

    iput-object p3, p0, Lcom/trueaxis/modmenu/ModMenu$4;->val$experimental:Landroid/widget/LinearLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 4

    .line 429
    iget-object p1, p0, Lcom/trueaxis/modmenu/ModMenu$4;->val$a:Landroid/app/Activity;

    invoke-static {p1}, Lcom/trueaxis/modmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$4;->val$showExperimental:Landroid/widget/CheckBox;

    .line 430
    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    .line 429
    const-string v1, "experimental_visible"

    invoke-interface {p1, v1, v0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    .line 430
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 431
    iget-object p1, p0, Lcom/trueaxis/modmenu/ModMenu$4;->val$a:Landroid/app/Activity;

    invoke-static {p1}, Lcom/trueaxis/modmenu/ModIdentity;->configure(Landroid/content/Context;)V

    .line 432
    iget-object p1, p0, Lcom/trueaxis/modmenu/ModMenu$4;->val$a:Landroid/app/Activity;

    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$4;->val$experimental:Landroid/widget/LinearLayout;

    # invokes: Lcom/trueaxis/modmenu/ModMenu;->updateExperimentalVisibility(Landroid/content/Context;Landroid/view/View;)V
    invoke-static {p1, v0}, Lcom/trueaxis/modmenu/ModMenu;->access$000(Landroid/content/Context;Landroid/view/View;)V

    .line 433
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "experimental section visible="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$4;->val$showExperimental:Landroid/widget/CheckBox;

    .line 434
    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 433
    const-string v0, "launcher"

    invoke-static {v0, p1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 435
    return-void
.end method
