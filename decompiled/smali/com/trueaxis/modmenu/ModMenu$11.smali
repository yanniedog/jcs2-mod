.class Lcom/trueaxis/modmenu/ModMenu$11;
.super Ljava/lang/Object;
.source "ModMenu.java"

# interfaces
.implements Ljava/lang/Runnable;


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

.field final synthetic val$status:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Landroid/widget/Spinner;Landroid/widget/TextView;Landroid/app/Activity;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 753
    iput-object p1, p0, Lcom/trueaxis/modmenu/ModMenu$11;->val$cars:Landroid/widget/Spinner;

    iput-object p2, p0, Lcom/trueaxis/modmenu/ModMenu$11;->val$status:Landroid/widget/TextView;

    iput-object p3, p0, Lcom/trueaxis/modmenu/ModMenu$11;->val$a:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .line 755
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$11;->val$cars:Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v0

    .line 756
    iget-object v1, p0, Lcom/trueaxis/modmenu/ModMenu$11;->val$status:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/trueaxis/modmenu/ModMenu$11;->val$a:Landroid/app/Activity;

    # invokes: Lcom/trueaxis/modmenu/ModMenu;->customTexture(Landroid/content/Context;I)Ljava/io/File;
    invoke-static {v2, v0}, Lcom/trueaxis/modmenu/ModMenu;->access$400(Landroid/content/Context;I)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v0

    if-eqz v0, :cond_17

    .line 757
    const-string v0, "Active livery: custom"

    goto :goto_19

    .line 758
    :cond_17
    const-string v0, "Active livery: bundled default"

    .line 756
    :goto_19
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 759
    return-void
.end method
