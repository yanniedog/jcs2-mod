.class Lcom/trueaxis/modmenu/UpdateManager$1$2;
.super Ljava/lang/Object;
.source "UpdateManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/modmenu/UpdateManager$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trueaxis/modmenu/UpdateManager$1;


# direct methods
.method constructor <init>(Lcom/trueaxis/modmenu/UpdateManager$1;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 110
    iput-object p1, p0, Lcom/trueaxis/modmenu/UpdateManager$1$2;->this$0:Lcom/trueaxis/modmenu/UpdateManager$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 112
    iget-object v0, p0, Lcom/trueaxis/modmenu/UpdateManager$1$2;->this$0:Lcom/trueaxis/modmenu/UpdateManager$1;

    iget-object v0, v0, Lcom/trueaxis/modmenu/UpdateManager$1;->val$activity:Landroid/app/Activity;

    const-string v1, "You are already on the latest version."

    # invokes: Lcom/trueaxis/modmenu/UpdateManager;->toast(Landroid/content/Context;Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/trueaxis/modmenu/UpdateManager;->access$400(Landroid/content/Context;Ljava/lang/String;)V

    .line 113
    return-void
.end method
