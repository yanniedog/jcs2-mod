.class Lcom/trueaxis/modmenu/UpdateManager$6$1;
.super Ljava/lang/Object;
.source "UpdateManager.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/modmenu/UpdateManager$6;->onShow(Landroid/content/DialogInterface;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trueaxis/modmenu/UpdateManager$6;


# direct methods
.method constructor <init>(Lcom/trueaxis/modmenu/UpdateManager$6;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 380
    iput-object p1, p0, Lcom/trueaxis/modmenu/UpdateManager$6$1;->this$0:Lcom/trueaxis/modmenu/UpdateManager$6;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 6

    .line 382
    iget-object p1, p0, Lcom/trueaxis/modmenu/UpdateManager$6$1;->this$0:Lcom/trueaxis/modmenu/UpdateManager$6;

    iget-object p1, p1, Lcom/trueaxis/modmenu/UpdateManager$6;->val$active:[Z

    const/4 v0, 0x0

    aput-boolean v0, p1, v0

    .line 383
    iget-object p1, p0, Lcom/trueaxis/modmenu/UpdateManager$6$1;->this$0:Lcom/trueaxis/modmenu/UpdateManager$6;

    iget-object p1, p1, Lcom/trueaxis/modmenu/UpdateManager$6;->val$handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/trueaxis/modmenu/UpdateManager$6$1;->this$0:Lcom/trueaxis/modmenu/UpdateManager$6;

    iget-object v1, v1, Lcom/trueaxis/modmenu/UpdateManager$6;->val$poller:[Ljava/lang/Runnable;

    aget-object v1, v1, v0

    invoke-virtual {p1, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 384
    iget-object p1, p0, Lcom/trueaxis/modmenu/UpdateManager$6$1;->this$0:Lcom/trueaxis/modmenu/UpdateManager$6;

    iget-object p1, p1, Lcom/trueaxis/modmenu/UpdateManager$6;->val$manager:Landroid/app/DownloadManager;

    iget-object v1, p0, Lcom/trueaxis/modmenu/UpdateManager$6$1;->this$0:Lcom/trueaxis/modmenu/UpdateManager$6;

    iget-wide v1, v1, Lcom/trueaxis/modmenu/UpdateManager$6;->val$id:J

    const/4 v3, 0x1

    new-array v3, v3, [J

    aput-wide v1, v3, v0

    invoke-virtual {p1, v3}, Landroid/app/DownloadManager;->remove([J)I

    .line 385
    iget-object p1, p0, Lcom/trueaxis/modmenu/UpdateManager$6$1;->this$0:Lcom/trueaxis/modmenu/UpdateManager$6;

    iget-object p1, p1, Lcom/trueaxis/modmenu/UpdateManager$6;->val$activity:Landroid/app/Activity;

    # invokes: Lcom/trueaxis/modmenu/UpdateManager;->clearDownload(Landroid/content/Context;)V
    invoke-static {p1}, Lcom/trueaxis/modmenu/UpdateManager;->access$1100(Landroid/content/Context;)V

    .line 386
    iget-object p1, p0, Lcom/trueaxis/modmenu/UpdateManager$6$1;->this$0:Lcom/trueaxis/modmenu/UpdateManager$6;

    iget-object p1, p1, Lcom/trueaxis/modmenu/UpdateManager$6;->val$dialog:Landroid/app/AlertDialog;

    invoke-virtual {p1}, Landroid/app/AlertDialog;->dismiss()V

    .line 387
    iget-object p1, p0, Lcom/trueaxis/modmenu/UpdateManager$6$1;->this$0:Lcom/trueaxis/modmenu/UpdateManager$6;

    iget-object p1, p1, Lcom/trueaxis/modmenu/UpdateManager$6;->val$activity:Landroid/app/Activity;

    const-string v0, "Update download cancelled."

    # invokes: Lcom/trueaxis/modmenu/UpdateManager;->toast(Landroid/content/Context;Ljava/lang/String;)V
    invoke-static {p1, v0}, Lcom/trueaxis/modmenu/UpdateManager;->access$400(Landroid/content/Context;Ljava/lang/String;)V

    .line 388
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "download cancelled id="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-object v0, p0, Lcom/trueaxis/modmenu/UpdateManager$6$1;->this$0:Lcom/trueaxis/modmenu/UpdateManager$6;

    iget-wide v0, v0, Lcom/trueaxis/modmenu/UpdateManager$6;->val$id:J

    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "update"

    invoke-static {v0, p1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 389
    return-void
.end method
