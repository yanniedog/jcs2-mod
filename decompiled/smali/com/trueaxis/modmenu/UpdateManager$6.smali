.class Lcom/trueaxis/modmenu/UpdateManager$6;
.super Ljava/lang/Object;
.source "UpdateManager.java"

# interfaces
.implements Landroid/content/DialogInterface$OnShowListener;


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

.field final synthetic val$poller:[Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Landroid/app/AlertDialog;[ZLandroid/os/Handler;[Ljava/lang/Runnable;Landroid/app/DownloadManager;JLandroid/app/Activity;)V
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 377
    iput-object p1, p0, Lcom/trueaxis/modmenu/UpdateManager$6;->val$dialog:Landroid/app/AlertDialog;

    iput-object p2, p0, Lcom/trueaxis/modmenu/UpdateManager$6;->val$active:[Z

    iput-object p3, p0, Lcom/trueaxis/modmenu/UpdateManager$6;->val$handler:Landroid/os/Handler;

    iput-object p4, p0, Lcom/trueaxis/modmenu/UpdateManager$6;->val$poller:[Ljava/lang/Runnable;

    iput-object p5, p0, Lcom/trueaxis/modmenu/UpdateManager$6;->val$manager:Landroid/app/DownloadManager;

    iput-wide p6, p0, Lcom/trueaxis/modmenu/UpdateManager$6;->val$id:J

    iput-object p8, p0, Lcom/trueaxis/modmenu/UpdateManager$6;->val$activity:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onShow(Landroid/content/DialogInterface;)V
    .registers 3

    .line 379
    iget-object p1, p0, Lcom/trueaxis/modmenu/UpdateManager$6;->val$dialog:Landroid/app/AlertDialog;

    const/4 v0, -0x3

    invoke-virtual {p1, v0}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object p1

    new-instance v0, Lcom/trueaxis/modmenu/UpdateManager$6$1;

    invoke-direct {v0, p0}, Lcom/trueaxis/modmenu/UpdateManager$6$1;-><init>(Lcom/trueaxis/modmenu/UpdateManager$6;)V

    .line 380
    invoke-virtual {p1, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 391
    return-void
.end method
