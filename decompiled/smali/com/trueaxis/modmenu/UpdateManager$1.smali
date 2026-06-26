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

    .line 77
    iput-object p1, p0, Lcom/trueaxis/modmenu/UpdateManager$1;->val$activity:Landroid/app/Activity;

    iput-boolean p2, p0, Lcom/trueaxis/modmenu/UpdateManager$1;->val$interactive:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 6

    .line 80
    const/4 v0, 0x0

    :try_start_1
    # invokes: Lcom/trueaxis/modmenu/UpdateManager;->fetchUpdateInfo()Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;
    invoke-static {}, Lcom/trueaxis/modmenu/UpdateManager;->access$000()Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;

    move-result-object v1

    .line 81
    iget-object v2, p0, Lcom/trueaxis/modmenu/UpdateManager$1;->val$activity:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    iget-object v3, p0, Lcom/trueaxis/modmenu/UpdateManager$1;->val$activity:Landroid/app/Activity;

    .line 82
    invoke-virtual {v3}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3, v0}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v2

    .line 83
    iget-object v3, p0, Lcom/trueaxis/modmenu/UpdateManager$1;->val$activity:Landroid/app/Activity;

    invoke-virtual {v3}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v3

    iget-object v4, v1, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_43

    .line 87
    iget v3, v1, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->versionCode:I

    iget v4, v2, Landroid/content/pm/PackageInfo;->versionCode:I

    if-le v3, v4, :cond_34

    .line 88
    iget-object v3, p0, Lcom/trueaxis/modmenu/UpdateManager$1;->val$activity:Landroid/app/Activity;

    new-instance v4, Lcom/trueaxis/modmenu/UpdateManager$1$1;

    invoke-direct {v4, p0, v1, v2}, Lcom/trueaxis/modmenu/UpdateManager$1$1;-><init>(Lcom/trueaxis/modmenu/UpdateManager$1;Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;Landroid/content/pm/PackageInfo;)V

    # invokes: Lcom/trueaxis/modmenu/UpdateManager;->runOnUi(Landroid/app/Activity;Ljava/lang/Runnable;)V
    invoke-static {v3, v4}, Lcom/trueaxis/modmenu/UpdateManager;->access$200(Landroid/app/Activity;Ljava/lang/Runnable;)V

    goto :goto_74

    .line 93
    :cond_34
    iget-boolean v1, p0, Lcom/trueaxis/modmenu/UpdateManager$1;->val$interactive:Z

    if-eqz v1, :cond_74

    .line 94
    iget-object v1, p0, Lcom/trueaxis/modmenu/UpdateManager$1;->val$activity:Landroid/app/Activity;

    new-instance v2, Lcom/trueaxis/modmenu/UpdateManager$1$2;

    invoke-direct {v2, p0}, Lcom/trueaxis/modmenu/UpdateManager$1$2;-><init>(Lcom/trueaxis/modmenu/UpdateManager$1;)V

    # invokes: Lcom/trueaxis/modmenu/UpdateManager;->runOnUi(Landroid/app/Activity;Ljava/lang/Runnable;)V
    invoke-static {v1, v2}, Lcom/trueaxis/modmenu/UpdateManager;->access$200(Landroid/app/Activity;Ljava/lang/Runnable;)V

    goto :goto_74

    .line 84
    :cond_43
    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Update package mismatch: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v1, v1, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_5e
    .catchall {:try_start_1 .. :try_end_5e} :catchall_5e

    .line 100
    :catchall_5e
    move-exception v1

    .line 101
    :try_start_5f
    const-string v2, "update"

    const-string v3, "update check failed"

    invoke-static {v2, v3, v1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 102
    iget-boolean v2, p0, Lcom/trueaxis/modmenu/UpdateManager$1;->val$interactive:Z

    if-eqz v2, :cond_74

    .line 103
    iget-object v2, p0, Lcom/trueaxis/modmenu/UpdateManager$1;->val$activity:Landroid/app/Activity;

    new-instance v3, Lcom/trueaxis/modmenu/UpdateManager$1$3;

    invoke-direct {v3, p0, v1}, Lcom/trueaxis/modmenu/UpdateManager$1$3;-><init>(Lcom/trueaxis/modmenu/UpdateManager$1;Ljava/lang/Throwable;)V

    # invokes: Lcom/trueaxis/modmenu/UpdateManager;->runOnUi(Landroid/app/Activity;Ljava/lang/Runnable;)V
    invoke-static {v2, v3}, Lcom/trueaxis/modmenu/UpdateManager;->access$200(Landroid/app/Activity;Ljava/lang/Runnable;)V
    :try_end_74
    .catchall {:try_start_5f .. :try_end_74} :catchall_79

    .line 110
    :cond_74
    :goto_74
    # setter for: Lcom/trueaxis/modmenu/UpdateManager;->checking:Z
    invoke-static {v0}, Lcom/trueaxis/modmenu/UpdateManager;->access$502(Z)Z

    .line 111
    nop

    .line 112
    return-void

    .line 110
    :catchall_79
    move-exception v1

    # setter for: Lcom/trueaxis/modmenu/UpdateManager;->checking:Z
    invoke-static {v0}, Lcom/trueaxis/modmenu/UpdateManager;->access$502(Z)Z

    .line 111
    throw v1
.end method
