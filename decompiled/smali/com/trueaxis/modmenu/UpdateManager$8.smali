.class Lcom/trueaxis/modmenu/UpdateManager$8;
.super Ljava/lang/Object;
.source "UpdateManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/modmenu/UpdateManager;->showDownloadProgress(Landroid/app/Activity;J)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$active:[Z

.field final synthetic val$activity:Landroid/app/Activity;

.field final synthetic val$dialog:Landroid/app/AlertDialog;

.field final synthetic val$handler:Landroid/os/Handler;

.field final synthetic val$id:J

.field final synthetic val$manager:Landroid/app/DownloadManager;

.field final synthetic val$progress:Landroid/widget/ProgressBar;

.field final synthetic val$status:Landroid/widget/TextView;


# direct methods
.method constructor <init>([ZLandroid/app/Activity;Landroid/app/DownloadManager;JLandroid/app/AlertDialog;Landroid/widget/TextView;Landroid/widget/ProgressBar;Landroid/os/Handler;)V
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 400
    iput-object p1, p0, Lcom/trueaxis/modmenu/UpdateManager$8;->val$active:[Z

    iput-object p2, p0, Lcom/trueaxis/modmenu/UpdateManager$8;->val$activity:Landroid/app/Activity;

    iput-object p3, p0, Lcom/trueaxis/modmenu/UpdateManager$8;->val$manager:Landroid/app/DownloadManager;

    iput-wide p4, p0, Lcom/trueaxis/modmenu/UpdateManager$8;->val$id:J

    iput-object p6, p0, Lcom/trueaxis/modmenu/UpdateManager$8;->val$dialog:Landroid/app/AlertDialog;

    iput-object p7, p0, Lcom/trueaxis/modmenu/UpdateManager$8;->val$status:Landroid/widget/TextView;

    iput-object p8, p0, Lcom/trueaxis/modmenu/UpdateManager$8;->val$progress:Landroid/widget/ProgressBar;

    iput-object p9, p0, Lcom/trueaxis/modmenu/UpdateManager$8;->val$handler:Landroid/os/Handler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .line 402
    iget-object v0, p0, Lcom/trueaxis/modmenu/UpdateManager$8;->val$active:[Z

    const/4 v1, 0x0

    aget-boolean v0, v0, v1

    if-eqz v0, :cond_81

    iget-object v0, p0, Lcom/trueaxis/modmenu/UpdateManager$8;->val$activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_10

    goto :goto_81

    .line 403
    :cond_10
    iget-object v0, p0, Lcom/trueaxis/modmenu/UpdateManager$8;->val$manager:Landroid/app/DownloadManager;

    iget-wide v2, p0, Lcom/trueaxis/modmenu/UpdateManager$8;->val$id:J

    # invokes: Lcom/trueaxis/modmenu/UpdateManager;->readDownloadProgress(Landroid/app/DownloadManager;J)Lcom/trueaxis/modmenu/UpdateManager$DownloadProgress;
    invoke-static {v0, v2, v3}, Lcom/trueaxis/modmenu/UpdateManager;->access$1200(Landroid/app/DownloadManager;J)Lcom/trueaxis/modmenu/UpdateManager$DownloadProgress;

    move-result-object v0

    .line 404
    iget-boolean v2, v0, Lcom/trueaxis/modmenu/UpdateManager$DownloadProgress;->exists:Z

    if-nez v2, :cond_32

    .line 405
    iget-object v0, p0, Lcom/trueaxis/modmenu/UpdateManager$8;->val$active:[Z

    aput-boolean v1, v0, v1

    .line 406
    iget-object v0, p0, Lcom/trueaxis/modmenu/UpdateManager$8;->val$activity:Landroid/app/Activity;

    # invokes: Lcom/trueaxis/modmenu/UpdateManager;->clearDownload(Landroid/content/Context;)V
    invoke-static {v0}, Lcom/trueaxis/modmenu/UpdateManager;->access$1100(Landroid/content/Context;)V

    .line 407
    iget-object v0, p0, Lcom/trueaxis/modmenu/UpdateManager$8;->val$dialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 408
    iget-object v0, p0, Lcom/trueaxis/modmenu/UpdateManager$8;->val$activity:Landroid/app/Activity;

    const-string v1, "Update download was not found."

    # invokes: Lcom/trueaxis/modmenu/UpdateManager;->toast(Landroid/content/Context;Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/trueaxis/modmenu/UpdateManager;->access$400(Landroid/content/Context;Ljava/lang/String;)V

    .line 409
    return-void

    .line 412
    :cond_32
    iget-object v2, p0, Lcom/trueaxis/modmenu/UpdateManager$8;->val$status:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/trueaxis/modmenu/UpdateManager$8;->val$progress:Landroid/widget/ProgressBar;

    # invokes: Lcom/trueaxis/modmenu/UpdateManager;->updateProgressViews(Landroid/widget/TextView;Landroid/widget/ProgressBar;Lcom/trueaxis/modmenu/UpdateManager$DownloadProgress;)V
    invoke-static {v2, v3, v0}, Lcom/trueaxis/modmenu/UpdateManager;->access$1300(Landroid/widget/TextView;Landroid/widget/ProgressBar;Lcom/trueaxis/modmenu/UpdateManager$DownloadProgress;)V

    .line 413
    iget v2, v0, Lcom/trueaxis/modmenu/UpdateManager$DownloadProgress;->status:I

    const/16 v3, 0x8

    if-ne v2, v3, :cond_5d

    .line 414
    iget-object v0, p0, Lcom/trueaxis/modmenu/UpdateManager$8;->val$active:[Z

    aput-boolean v1, v0, v1

    .line 415
    iget-object v0, p0, Lcom/trueaxis/modmenu/UpdateManager$8;->val$handler:Landroid/os/Handler;

    invoke-virtual {v0, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 416
    iget-object v0, p0, Lcom/trueaxis/modmenu/UpdateManager$8;->val$status:Landroid/widget/TextView;

    const-string v1, "Download complete. Opening installer..."

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 417
    iget-object v0, p0, Lcom/trueaxis/modmenu/UpdateManager$8;->val$dialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 418
    iget-object v0, p0, Lcom/trueaxis/modmenu/UpdateManager$8;->val$activity:Landroid/app/Activity;

    iget-wide v1, p0, Lcom/trueaxis/modmenu/UpdateManager$8;->val$id:J

    const/4 v3, 0x1

    # invokes: Lcom/trueaxis/modmenu/UpdateManager;->installDownloadedApk(Landroid/app/Activity;JZ)Z
    invoke-static {v0, v1, v2, v3}, Lcom/trueaxis/modmenu/UpdateManager;->access$1000(Landroid/app/Activity;JZ)Z

    goto :goto_80

    .line 419
    :cond_5d
    iget v0, v0, Lcom/trueaxis/modmenu/UpdateManager$DownloadProgress;->status:I

    const/16 v2, 0x10

    if-ne v0, v2, :cond_79

    .line 420
    iget-object v0, p0, Lcom/trueaxis/modmenu/UpdateManager$8;->val$active:[Z

    aput-boolean v1, v0, v1

    .line 421
    iget-object v0, p0, Lcom/trueaxis/modmenu/UpdateManager$8;->val$activity:Landroid/app/Activity;

    # invokes: Lcom/trueaxis/modmenu/UpdateManager;->clearDownload(Landroid/content/Context;)V
    invoke-static {v0}, Lcom/trueaxis/modmenu/UpdateManager;->access$1100(Landroid/content/Context;)V

    .line 422
    iget-object v0, p0, Lcom/trueaxis/modmenu/UpdateManager$8;->val$dialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 423
    iget-object v0, p0, Lcom/trueaxis/modmenu/UpdateManager$8;->val$activity:Landroid/app/Activity;

    const-string v1, "Update download failed. Please try again."

    # invokes: Lcom/trueaxis/modmenu/UpdateManager;->toast(Landroid/content/Context;Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/trueaxis/modmenu/UpdateManager;->access$400(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_80

    .line 425
    :cond_79
    iget-object v0, p0, Lcom/trueaxis/modmenu/UpdateManager$8;->val$handler:Landroid/os/Handler;

    const-wide/16 v1, 0x1f4

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 427
    :goto_80
    return-void

    .line 402
    :cond_81
    :goto_81
    return-void
.end method
