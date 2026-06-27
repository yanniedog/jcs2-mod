.class Lcom/trueaxis/modmenu/UpdateManager$3;
.super Ljava/lang/Object;
.source "UpdateManager.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/modmenu/UpdateManager;->showUpdateAvailable(Landroid/app/Activity;Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;Landroid/content/pm/PackageInfo;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$activity:Landroid/app/Activity;

.field final synthetic val$latest:Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;


# direct methods
.method constructor <init>(Landroid/app/Activity;Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 140
    iput-object p1, p0, Lcom/trueaxis/modmenu/UpdateManager$3;->val$activity:Landroid/app/Activity;

    iput-object p2, p0, Lcom/trueaxis/modmenu/UpdateManager$3;->val$latest:Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 3

    .line 142
    iget-object p1, p0, Lcom/trueaxis/modmenu/UpdateManager$3;->val$activity:Landroid/app/Activity;

    iget-object p2, p0, Lcom/trueaxis/modmenu/UpdateManager$3;->val$latest:Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;

    # invokes: Lcom/trueaxis/modmenu/UpdateManager;->recordUpdateDismissed(Landroid/content/Context;Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;)V
    invoke-static {p1, p2}, Lcom/trueaxis/modmenu/UpdateManager;->access$700(Landroid/content/Context;Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;)V

    .line 143
    return-void
.end method
