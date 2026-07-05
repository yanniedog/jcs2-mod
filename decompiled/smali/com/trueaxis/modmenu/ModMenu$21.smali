.class Lcom/trueaxis/modmenu/ModMenu$21;
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

.field final synthetic val$checks:[Z

.field final synthetic val$library:Ljava/util/List;

.field final synthetic val$packButton:Landroid/widget/Button;


# direct methods
.method constructor <init>([ZLjava/util/List;Landroid/app/Activity;Landroid/widget/Button;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1238
    iput-object p1, p0, Lcom/trueaxis/modmenu/ModMenu$21;->val$checks:[Z

    iput-object p2, p0, Lcom/trueaxis/modmenu/ModMenu$21;->val$library:Ljava/util/List;

    iput-object p3, p0, Lcom/trueaxis/modmenu/ModMenu$21;->val$a:Landroid/app/Activity;

    iput-object p4, p0, Lcom/trueaxis/modmenu/ModMenu$21;->val$packButton:Landroid/widget/Button;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 6

    .line 1240
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 1241
    const/4 p2, 0x0

    :goto_6
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$21;->val$checks:[Z

    array-length v0, v0

    if-ge p2, v0, :cond_36

    .line 1242
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$21;->val$checks:[Z

    aget-boolean v0, v0, p2

    if-eqz v0, :cond_33

    .line 1243
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "swarm_replays/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/trueaxis/modmenu/ModMenu$21;->val$library:Ljava/util/List;

    invoke-interface {v1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1241
    :cond_33
    add-int/lit8 p2, p2, 0x1

    goto :goto_6

    .line 1246
    :cond_36
    iget-object p2, p0, Lcom/trueaxis/modmenu/ModMenu$21;->val$a:Landroid/app/Activity;

    invoke-static {p2, p1}, Lcom/trueaxis/modmenu/ModMenu;->setGhostPackPaths(Landroid/content/Context;Ljava/util/List;)V

    .line 1248
    :try_start_3b
    iget-object p2, p0, Lcom/trueaxis/modmenu/ModMenu$21;->val$a:Landroid/app/Activity;

    invoke-static {p2}, Lcom/trueaxis/modmenu/RequiredPatches;->applyGhostPack(Landroid/content/Context;)V
    :try_end_40
    .catchall {:try_start_3b .. :try_end_40} :catchall_41

    .line 1250
    goto :goto_42

    .line 1249
    :catchall_41
    move-exception p2

    .line 1251
    :goto_42
    iget-object p2, p0, Lcom/trueaxis/modmenu/ModMenu$21;->val$a:Landroid/app/Activity;

    invoke-static {p2}, Lcom/trueaxis/modmenu/ModMenu;->ghostPackPaths(Landroid/content/Context;)[Ljava/lang/String;

    move-result-object p2

    array-length p2, p2

    .line 1252
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$21;->val$packButton:Landroid/widget/Button;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Choose ghost pack ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v1, " selected)"

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 1253
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    const/4 p2, 0x7

    if-le p1, p2, :cond_7a

    .line 1254
    iget-object p1, p0, Lcom/trueaxis/modmenu/ModMenu$21;->val$a:Landroid/app/Activity;

    const-string p2, "Only the first 7 picks are used."

    const/4 v0, 0x1

    invoke-static {p1, p2, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    .line 1255
    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 1257
    :cond_7a
    return-void
.end method
