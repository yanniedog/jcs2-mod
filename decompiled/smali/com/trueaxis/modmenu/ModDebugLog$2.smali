.class Lcom/trueaxis/modmenu/ModDebugLog$2;
.super Ljava/lang/Object;
.source "ModDebugLog.java"

# interfaces
.implements Landroid/app/Application$ActivityLifecycleCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/modmenu/ModDebugLog;->installLifecycleLocked(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 441
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 5

    .line 443
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "created savedState="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    if-eqz p2, :cond_f

    const/4 p2, 0x1

    goto :goto_10

    :cond_f
    const/4 p2, 0x0

    :goto_10
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/trueaxis/modmenu/ModDebugLog;->lifecycle(Landroid/app/Activity;Ljava/lang/String;)V

    .line 444
    return-void
.end method

.method public onActivityDestroyed(Landroid/app/Activity;)V
    .registers 3

    .line 468
    const-string v0, "destroyed"

    invoke-static {p1, v0}, Lcom/trueaxis/modmenu/ModDebugLog;->lifecycle(Landroid/app/Activity;Ljava/lang/String;)V

    .line 469
    return-void
.end method

.method public onActivityPaused(Landroid/app/Activity;)V
    .registers 3

    .line 456
    const-string v0, "paused"

    invoke-static {p1, v0}, Lcom/trueaxis/modmenu/ModDebugLog;->lifecycle(Landroid/app/Activity;Ljava/lang/String;)V

    .line 457
    return-void
.end method

.method public onActivityResumed(Landroid/app/Activity;)V
    .registers 4

    .line 451
    const-string v0, "resumed"

    invoke-static {p1, v0}, Lcom/trueaxis/modmenu/ModDebugLog;->lifecycle(Landroid/app/Activity;Ljava/lang/String;)V

    .line 452
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "resume "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/trueaxis/modmenu/ModDebugLog;->logRuntime(Ljava/lang/String;)V

    .line 453
    return-void
.end method

.method public onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3

    .line 464
    const-string p2, "saveInstanceState"

    invoke-static {p1, p2}, Lcom/trueaxis/modmenu/ModDebugLog;->lifecycle(Landroid/app/Activity;Ljava/lang/String;)V

    .line 465
    return-void
.end method

.method public onActivityStarted(Landroid/app/Activity;)V
    .registers 3

    .line 447
    const-string v0, "started"

    invoke-static {p1, v0}, Lcom/trueaxis/modmenu/ModDebugLog;->lifecycle(Landroid/app/Activity;Ljava/lang/String;)V

    .line 448
    return-void
.end method

.method public onActivityStopped(Landroid/app/Activity;)V
    .registers 3

    .line 460
    const-string v0, "stopped"

    invoke-static {p1, v0}, Lcom/trueaxis/modmenu/ModDebugLog;->lifecycle(Landroid/app/Activity;Ljava/lang/String;)V

    .line 461
    return-void
.end method
