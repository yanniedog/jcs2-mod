.class Lcom/trueaxis/modmenu/ModLauncherActivity$3;
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

    .line 45
    iput-object p1, p0, Lcom/trueaxis/modmenu/ModLauncherActivity$3;->this$0:Lcom/trueaxis/modmenu/ModLauncherActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .line 47
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModLauncherActivity$3;->this$0:Lcom/trueaxis/modmenu/ModLauncherActivity;

    invoke-static {v0}, Lcom/trueaxis/modmenu/UpdateManager;->checkSilently(Landroid/app/Activity;)V

    .line 48
    return-void
.end method
