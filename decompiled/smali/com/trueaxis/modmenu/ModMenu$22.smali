.class Lcom/trueaxis/modmenu/ModMenu$22;
.super Ljava/lang/Object;
.source "ModMenu.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/modmenu/ModMenu;->showGhostPackPicker(Landroid/app/Activity;Landroid/widget/Button;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$a:Landroid/app/Activity;

.field final synthetic val$packButton:Landroid/widget/Button;


# direct methods
.method constructor <init>(Landroid/app/Activity;Landroid/widget/Button;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1228
    iput-object p1, p0, Lcom/trueaxis/modmenu/ModMenu$22;->val$a:Landroid/app/Activity;

    iput-object p2, p0, Lcom/trueaxis/modmenu/ModMenu$22;->val$packButton:Landroid/widget/Button;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 3

    .line 1230
    iget-object p1, p0, Lcom/trueaxis/modmenu/ModMenu$22;->val$a:Landroid/app/Activity;

    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    invoke-static {p1, p2}, Lcom/trueaxis/modmenu/ModMenu;->setGhostPackPaths(Landroid/content/Context;Ljava/util/List;)V

    .line 1232
    :try_start_a
    iget-object p1, p0, Lcom/trueaxis/modmenu/ModMenu$22;->val$a:Landroid/app/Activity;

    invoke-static {p1}, Lcom/trueaxis/modmenu/RequiredPatches;->applyGhostPack(Landroid/content/Context;)V
    :try_end_f
    .catchall {:try_start_a .. :try_end_f} :catchall_10

    .line 1234
    goto :goto_11

    .line 1233
    :catchall_10
    move-exception p1

    .line 1235
    :goto_11
    iget-object p1, p0, Lcom/trueaxis/modmenu/ModMenu$22;->val$packButton:Landroid/widget/Button;

    const-string p2, "Choose ghost pack (0 selected)"

    invoke-virtual {p1, p2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 1236
    return-void
.end method
