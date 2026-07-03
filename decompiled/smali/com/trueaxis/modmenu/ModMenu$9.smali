.class Lcom/trueaxis/modmenu/ModMenu$9;
.super Ljava/lang/Object;
.source "ModMenu.java"

# interfaces
.implements Ljava/lang/Runnable;


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


# direct methods
.method constructor <init>(Landroid/app/Activity;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 821
    iput-object p1, p0, Lcom/trueaxis/modmenu/ModMenu$9;->val$a:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 6

    .line 824
    :try_start_0
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$9;->val$a:Landroid/app/Activity;

    invoke-static {v0}, Lcom/trueaxis/modmenu/ModMenu;->tracksideSideMode(Landroid/content/Context;)I

    move-result v0

    iget-object v1, p0, Lcom/trueaxis/modmenu/ModMenu$9;->val$a:Landroid/app/Activity;

    .line 825
    invoke-static {v1}, Lcom/trueaxis/modmenu/ModMenu;->tracksideSideDist(Landroid/content/Context;)I

    move-result v1

    iget-object v2, p0, Lcom/trueaxis/modmenu/ModMenu$9;->val$a:Landroid/app/Activity;

    invoke-static {v2}, Lcom/trueaxis/modmenu/ModMenu;->tracksideHeight(Landroid/content/Context;)I

    move-result v2

    iget-object v3, p0, Lcom/trueaxis/modmenu/ModMenu$9;->val$a:Landroid/app/Activity;

    .line 826
    invoke-static {v3}, Lcom/trueaxis/modmenu/ModMenu;->tracksideMinDist(Landroid/content/Context;)I

    move-result v3

    iget-object v4, p0, Lcom/trueaxis/modmenu/ModMenu$9;->val$a:Landroid/app/Activity;

    invoke-static {v4}, Lcom/trueaxis/modmenu/ModMenu;->tracksideMaxDist(Landroid/content/Context;)I

    move-result v4

    .line 824
    invoke-static {v0, v1, v2, v3, v4}, Lcom/trueaxis/modmenu/RequiredPatches;->setReplayTracksideTuning(IIIII)V
    :try_end_21
    .catchall {:try_start_0 .. :try_end_21} :catchall_22

    .line 828
    goto :goto_23

    .line 827
    :catchall_22
    move-exception v0

    .line 829
    :goto_23
    return-void
.end method
