.class Lcom/trueaxis/modmenu/UpdateManager$1$1;
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

.field final synthetic val$current:Landroid/content/pm/PackageInfo;

.field final synthetic val$latest:Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;


# direct methods
.method constructor <init>(Lcom/trueaxis/modmenu/UpdateManager$1;Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;Landroid/content/pm/PackageInfo;)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 104
    iput-object p1, p0, Lcom/trueaxis/modmenu/UpdateManager$1$1;->this$0:Lcom/trueaxis/modmenu/UpdateManager$1;

    iput-object p2, p0, Lcom/trueaxis/modmenu/UpdateManager$1$1;->val$latest:Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;

    iput-object p3, p0, Lcom/trueaxis/modmenu/UpdateManager$1$1;->val$current:Landroid/content/pm/PackageInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .line 106
    iget-object v0, p0, Lcom/trueaxis/modmenu/UpdateManager$1$1;->this$0:Lcom/trueaxis/modmenu/UpdateManager$1;

    iget-object v0, v0, Lcom/trueaxis/modmenu/UpdateManager$1;->val$activity:Landroid/app/Activity;

    iget-object v1, p0, Lcom/trueaxis/modmenu/UpdateManager$1$1;->val$latest:Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;

    iget-object v2, p0, Lcom/trueaxis/modmenu/UpdateManager$1$1;->val$current:Landroid/content/pm/PackageInfo;

    # invokes: Lcom/trueaxis/modmenu/UpdateManager;->showUpdateAvailable(Landroid/app/Activity;Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;Landroid/content/pm/PackageInfo;)V
    invoke-static {v0, v1, v2}, Lcom/trueaxis/modmenu/UpdateManager;->access$200(Landroid/app/Activity;Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;Landroid/content/pm/PackageInfo;)V

    .line 107
    return-void
.end method
