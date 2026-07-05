.class Lcom/trueaxis/modmenu/ModLauncherActivity$1;
.super Ljava/lang/Object;
.source "ModLauncherActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/modmenu/ModLauncherActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trueaxis/modmenu/ModLauncherActivity;


# direct methods
.method constructor <init>(Lcom/trueaxis/modmenu/ModLauncherActivity;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 26
    iput-object p1, p0, Lcom/trueaxis/modmenu/ModLauncherActivity$1;->this$0:Lcom/trueaxis/modmenu/ModLauncherActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .line 29
    const-string v0, "launcher"

    :try_start_2
    const-string v1, "Start game clicked; launching Jetcarstunts2Activity"

    invoke-static {v0, v1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    iget-object v1, p0, Lcom/trueaxis/modmenu/ModLauncherActivity$1;->this$0:Lcom/trueaxis/modmenu/ModLauncherActivity;

    invoke-static {v1}, Lcom/trueaxis/modmenu/ModMenu;->validateCustomLiveriesForGame(Landroid/content/Context;)V

    .line 31
    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lcom/trueaxis/modmenu/ModLauncherActivity$1;->this$0:Lcom/trueaxis/modmenu/ModLauncherActivity;

    const-class v3, Lcom/trueaxis/jetcarstunts2/Jetcarstunts2Activity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 32
    iget-object v2, p0, Lcom/trueaxis/modmenu/ModLauncherActivity$1;->this$0:Lcom/trueaxis/modmenu/ModLauncherActivity;

    invoke-virtual {v2, v1}, Lcom/trueaxis/modmenu/ModLauncherActivity;->startActivity(Landroid/content/Intent;)V

    .line 33
    const-string v1, "Jetcarstunts2Activity startActivity returned"

    invoke-static {v0, v1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    iget-object v1, p0, Lcom/trueaxis/modmenu/ModLauncherActivity$1;->this$0:Lcom/trueaxis/modmenu/ModLauncherActivity;

    invoke-virtual {v1}, Lcom/trueaxis/modmenu/ModLauncherActivity;->finish()V
    :try_end_24
    .catchall {:try_start_2 .. :try_end_24} :catchall_26

    .line 38
    nop

    .line 39
    return-void

    .line 35
    :catchall_26
    move-exception v1

    .line 36
    const-string v2, "Start game failed"

    invoke-static {v0, v2, v1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 37
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v2, "Could not launch game activity"

    invoke-direct {v0, v2, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method
