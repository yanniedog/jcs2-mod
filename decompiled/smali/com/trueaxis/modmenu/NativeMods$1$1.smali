.class Lcom/trueaxis/modmenu/NativeMods$1$1;
.super Ljava/lang/Object;
.source "NativeMods.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/modmenu/NativeMods$1;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trueaxis/modmenu/NativeMods$1;


# direct methods
.method constructor <init>(Lcom/trueaxis/modmenu/NativeMods$1;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 262
    iput-object p1, p0, Lcom/trueaxis/modmenu/NativeMods$1$1;->this$0:Lcom/trueaxis/modmenu/NativeMods$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 4

    .line 264
    # invokes: Lcom/trueaxis/modmenu/NativeMods;->resetAll()V
    invoke-static {}, Lcom/trueaxis/modmenu/NativeMods;->access$000()V

    .line 265
    iget-object p1, p0, Lcom/trueaxis/modmenu/NativeMods$1$1;->this$0:Lcom/trueaxis/modmenu/NativeMods$1;

    iget-object p1, p1, Lcom/trueaxis/modmenu/NativeMods$1;->val$a:Landroid/app/Activity;

    # invokes: Lcom/trueaxis/modmenu/NativeMods;->clearSaved(Landroid/content/Context;)V
    invoke-static {p1}, Lcom/trueaxis/modmenu/NativeMods;->access$100(Landroid/content/Context;)V

    .line 266
    iget-object p1, p0, Lcom/trueaxis/modmenu/NativeMods$1$1;->this$0:Lcom/trueaxis/modmenu/NativeMods$1;

    iget-object p1, p1, Lcom/trueaxis/modmenu/NativeMods$1;->val$a:Landroid/app/Activity;

    invoke-static {p1}, Lcom/trueaxis/modmenu/ModMenu;->resetAllCustomLiveries(Landroid/content/Context;)V

    .line 267
    iget-object p1, p0, Lcom/trueaxis/modmenu/NativeMods$1$1;->this$0:Lcom/trueaxis/modmenu/NativeMods$1;

    iget-object p1, p1, Lcom/trueaxis/modmenu/NativeMods$1;->val$a:Landroid/app/Activity;

    invoke-static {p1}, Lcom/trueaxis/modmenu/ModMenu;->resetBaseMods(Landroid/content/Context;)V

    .line 268
    iget-object p1, p0, Lcom/trueaxis/modmenu/NativeMods$1$1;->this$0:Lcom/trueaxis/modmenu/NativeMods$1;

    iget-object p1, p1, Lcom/trueaxis/modmenu/NativeMods$1;->val$a:Landroid/app/Activity;

    const-string p2, "Defaults restored. Restart the game."

    const/4 v0, 0x1

    invoke-static {p1, p2, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 269
    return-void
.end method
