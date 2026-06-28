.class Lcom/trueaxis/modmenu/UpdateManager$7;
.super Ljava/lang/Object;
.source "UpdateManager.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


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

.field final synthetic val$handler:Landroid/os/Handler;

.field final synthetic val$poller:[Ljava/lang/Runnable;


# direct methods
.method constructor <init>([ZLandroid/os/Handler;[Ljava/lang/Runnable;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 393
    iput-object p1, p0, Lcom/trueaxis/modmenu/UpdateManager$7;->val$active:[Z

    iput-object p2, p0, Lcom/trueaxis/modmenu/UpdateManager$7;->val$handler:Landroid/os/Handler;

    iput-object p3, p0, Lcom/trueaxis/modmenu/UpdateManager$7;->val$poller:[Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .registers 4

    .line 395
    iget-object p1, p0, Lcom/trueaxis/modmenu/UpdateManager$7;->val$active:[Z

    const/4 v0, 0x0

    aput-boolean v0, p1, v0

    .line 396
    iget-object p1, p0, Lcom/trueaxis/modmenu/UpdateManager$7;->val$handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/trueaxis/modmenu/UpdateManager$7;->val$poller:[Ljava/lang/Runnable;

    aget-object v0, v1, v0

    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 397
    return-void
.end method
