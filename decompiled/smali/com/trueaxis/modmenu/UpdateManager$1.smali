.class Lcom/trueaxis/modmenu/UpdateManager$1;
.super Ljava/lang/Object;
.source "UpdateManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/modmenu/UpdateManager;->checkForUpdates(Landroid/app/Activity;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$activity:Landroid/app/Activity;

.field final synthetic val$interactive:Z


# direct methods
.method constructor <init>(Landroid/app/Activity;Z)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 88
    iput-object p1, p0, Lcom/trueaxis/modmenu/UpdateManager$1;->val$activity:Landroid/app/Activity;

    iput-boolean p2, p0, Lcom/trueaxis/modmenu/UpdateManager$1;->val$interactive:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 7

    .line 91
    const-string v0, "update"

    const/4 v1, 0x0

    :try_start_3
    # invokes: Lcom/trueaxis/modmenu/UpdateManager;->fetchUpdateInfo()Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;
    invoke-static {}, Lcom/trueaxis/modmenu/UpdateManager;->access$000()Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;

    move-result-object v2

    .line 92
    iget-object v3, p0, Lcom/trueaxis/modmenu/UpdateManager$1;->val$activity:Landroid/app/Activity;

    invoke-virtual {v3}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    iget-object v4, p0, Lcom/trueaxis/modmenu/UpdateManager$1;->val$activity:Landroid/app/Activity;

    .line 93
    invoke-virtual {v4}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4, v1}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v3

    .line 94
    iget-object v4, p0, Lcom/trueaxis/modmenu/UpdateManager$1;->val$activity:Landroid/app/Activity;

    invoke-virtual {v4}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v4

    iget-object v5, v2, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_79

    .line 98
    iget v4, v2, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->versionCode:I

    iget v5, v3, Landroid/content/pm/PackageInfo;->versionCode:I

    if-le v4, v5, :cond_6a

    .line 99
    iget-boolean v4, p0, Lcom/trueaxis/modmenu/UpdateManager$1;->val$interactive:Z

    if-nez v4, :cond_5f

    iget-object v4, p0, Lcom/trueaxis/modmenu/UpdateManager$1;->val$activity:Landroid/app/Activity;

    # invokes: Lcom/trueaxis/modmenu/UpdateManager;->shouldSuppressUpdatePrompt(Landroid/content/Context;Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;)Z
    invoke-static {v4, v2}, Lcom/trueaxis/modmenu/UpdateManager;->access$100(Landroid/content/Context;Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;)Z

    move-result v4

    if-eqz v4, :cond_5f

    .line 100
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "silent update prompt suppressed version="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v2, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->versionName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " code="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v2, v2, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->versionCode:I

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_5b
    .catchall {:try_start_3 .. :try_end_5b} :catchall_94

    .line 126
    # setter for: Lcom/trueaxis/modmenu/UpdateManager;->checking:Z
    invoke-static {v1}, Lcom/trueaxis/modmenu/UpdateManager;->access$602(Z)Z

    .line 102
    return-void

    .line 104
    :cond_5f
    :try_start_5f
    iget-object v4, p0, Lcom/trueaxis/modmenu/UpdateManager$1;->val$activity:Landroid/app/Activity;

    new-instance v5, Lcom/trueaxis/modmenu/UpdateManager$1$1;

    invoke-direct {v5, p0, v2, v3}, Lcom/trueaxis/modmenu/UpdateManager$1$1;-><init>(Lcom/trueaxis/modmenu/UpdateManager$1;Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;Landroid/content/pm/PackageInfo;)V

    # invokes: Lcom/trueaxis/modmenu/UpdateManager;->runOnUi(Landroid/app/Activity;Ljava/lang/Runnable;)V
    invoke-static {v4, v5}, Lcom/trueaxis/modmenu/UpdateManager;->access$300(Landroid/app/Activity;Ljava/lang/Runnable;)V

    goto :goto_a8

    .line 109
    :cond_6a
    iget-boolean v2, p0, Lcom/trueaxis/modmenu/UpdateManager$1;->val$interactive:Z

    if-eqz v2, :cond_a8

    .line 110
    iget-object v2, p0, Lcom/trueaxis/modmenu/UpdateManager$1;->val$activity:Landroid/app/Activity;

    new-instance v3, Lcom/trueaxis/modmenu/UpdateManager$1$2;

    invoke-direct {v3, p0}, Lcom/trueaxis/modmenu/UpdateManager$1$2;-><init>(Lcom/trueaxis/modmenu/UpdateManager$1;)V

    # invokes: Lcom/trueaxis/modmenu/UpdateManager;->runOnUi(Landroid/app/Activity;Ljava/lang/Runnable;)V
    invoke-static {v2, v3}, Lcom/trueaxis/modmenu/UpdateManager;->access$300(Landroid/app/Activity;Ljava/lang/Runnable;)V

    goto :goto_a8

    .line 95
    :cond_79
    new-instance v3, Ljava/lang/IllegalStateException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Update package mismatch: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v2, v2, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_94
    .catchall {:try_start_5f .. :try_end_94} :catchall_94

    .line 116
    :catchall_94
    move-exception v2

    .line 117
    :try_start_95
    const-string v3, "update check failed"

    invoke-static {v0, v3, v2}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 118
    iget-boolean v0, p0, Lcom/trueaxis/modmenu/UpdateManager$1;->val$interactive:Z

    if-eqz v0, :cond_a8

    .line 119
    iget-object v0, p0, Lcom/trueaxis/modmenu/UpdateManager$1;->val$activity:Landroid/app/Activity;

    new-instance v3, Lcom/trueaxis/modmenu/UpdateManager$1$3;

    invoke-direct {v3, p0, v2}, Lcom/trueaxis/modmenu/UpdateManager$1$3;-><init>(Lcom/trueaxis/modmenu/UpdateManager$1;Ljava/lang/Throwable;)V

    # invokes: Lcom/trueaxis/modmenu/UpdateManager;->runOnUi(Landroid/app/Activity;Ljava/lang/Runnable;)V
    invoke-static {v0, v3}, Lcom/trueaxis/modmenu/UpdateManager;->access$300(Landroid/app/Activity;Ljava/lang/Runnable;)V
    :try_end_a8
    .catchall {:try_start_95 .. :try_end_a8} :catchall_ad

    .line 126
    :cond_a8
    :goto_a8
    # setter for: Lcom/trueaxis/modmenu/UpdateManager;->checking:Z
    invoke-static {v1}, Lcom/trueaxis/modmenu/UpdateManager;->access$602(Z)Z

    .line 127
    nop

    .line 128
    return-void

    .line 126
    :catchall_ad
    move-exception v0

    # setter for: Lcom/trueaxis/modmenu/UpdateManager;->checking:Z
    invoke-static {v1}, Lcom/trueaxis/modmenu/UpdateManager;->access$602(Z)Z

    .line 127
    throw v0
.end method
