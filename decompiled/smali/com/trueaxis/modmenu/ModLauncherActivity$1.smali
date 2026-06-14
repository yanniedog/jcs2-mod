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

    .line 17
    iput-object p1, p0, Lcom/trueaxis/modmenu/ModLauncherActivity$1;->this$0:Lcom/trueaxis/modmenu/ModLauncherActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .line 19
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->apply()V

    .line 20
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/trueaxis/modmenu/ModLauncherActivity$1;->this$0:Lcom/trueaxis/modmenu/ModLauncherActivity;

    const-class v2, Lcom/trueaxis/jetcarstunts2/Jetcarstunts2Activity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 21
    iget-object v1, p0, Lcom/trueaxis/modmenu/ModLauncherActivity$1;->this$0:Lcom/trueaxis/modmenu/ModLauncherActivity;

    invoke-virtual {v1, v0}, Lcom/trueaxis/modmenu/ModLauncherActivity;->startActivity(Landroid/content/Intent;)V

    .line 22
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModLauncherActivity$1;->this$0:Lcom/trueaxis/modmenu/ModLauncherActivity;

    invoke-virtual {v0}, Lcom/trueaxis/modmenu/ModLauncherActivity;->finish()V

    .line 23
    return-void
.end method
