.class Lcom/trueaxis/modmenu/UpdateManager$5;
.super Landroid/content/BroadcastReceiver;
.source "UpdateManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/modmenu/UpdateManager;->registerDownloadReceiver(Landroid/app/Activity;J)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$activity:Landroid/app/Activity;

.field final synthetic val$id:J


# direct methods
.method constructor <init>(JLandroid/app/Activity;)V
    .registers 4

    .line 249
    iput-wide p1, p0, Lcom/trueaxis/modmenu/UpdateManager$5;->val$id:J

    iput-object p3, p0, Lcom/trueaxis/modmenu/UpdateManager$5;->val$activity:Landroid/app/Activity;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 6

    .line 251
    const-wide/16 v0, -0x1

    if-nez p2, :cond_5

    goto :goto_b

    .line 252
    :cond_5
    const-string p1, "extra_download_id"

    invoke-virtual {p2, p1, v0, v1}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v0

    .line 253
    :goto_b
    iget-wide p1, p0, Lcom/trueaxis/modmenu/UpdateManager$5;->val$id:J

    cmp-long v2, v0, p1

    if-eqz v2, :cond_12

    return-void

    .line 255
    :cond_12
    :try_start_12
    iget-object p1, p0, Lcom/trueaxis/modmenu/UpdateManager$5;->val$activity:Landroid/app/Activity;

    invoke-virtual {p1, p0}, Landroid/app/Activity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_17
    .catchall {:try_start_12 .. :try_end_17} :catchall_18

    .line 257
    goto :goto_19

    .line 256
    :catchall_18
    move-exception p1

    .line 258
    :goto_19
    iget-object p1, p0, Lcom/trueaxis/modmenu/UpdateManager$5;->val$activity:Landroid/app/Activity;

    iget-wide v0, p0, Lcom/trueaxis/modmenu/UpdateManager$5;->val$id:J

    const/4 p2, 0x0

    # invokes: Lcom/trueaxis/modmenu/UpdateManager;->installDownloadedApk(Landroid/app/Activity;JZ)Z
    invoke-static {p1, v0, v1, p2}, Lcom/trueaxis/modmenu/UpdateManager;->access$1000(Landroid/app/Activity;JZ)Z

    .line 259
    return-void
.end method
