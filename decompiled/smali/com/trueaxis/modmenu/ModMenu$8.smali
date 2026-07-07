.class Lcom/trueaxis/modmenu/ModMenu$8;
.super Ljava/lang/Object;
.source "ModMenu.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/modmenu/ModMenu;->showPreLaunchMenu(Landroid/app/Activity;Ljava/lang/Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$a:Landroid/app/Activity;


# direct methods
.method constructor <init>(Landroid/app/Activity;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 854
    iput-object p1, p0, Lcom/trueaxis/modmenu/ModMenu$8;->val$a:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .line 857
    :try_start_0
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$8;->val$a:Landroid/app/Activity;

    .line 858
    invoke-static {v0}, Lcom/trueaxis/modmenu/ModMenu;->orbitRadius(Landroid/content/Context;)I

    move-result v0

    iget-object v1, p0, Lcom/trueaxis/modmenu/ModMenu$8;->val$a:Landroid/app/Activity;

    invoke-static {v1}, Lcom/trueaxis/modmenu/ModMenu;->orbitSpeed(Landroid/content/Context;)I

    move-result v1

    iget-object v2, p0, Lcom/trueaxis/modmenu/ModMenu$8;->val$a:Landroid/app/Activity;

    invoke-static {v2}, Lcom/trueaxis/modmenu/ModMenu;->orbitHeight(Landroid/content/Context;)I

    move-result v2

    .line 857
    invoke-static {v0, v1, v2}, Lcom/trueaxis/modmenu/RequiredPatches;->setReplayOrbitTuning(III)V
    :try_end_15
    .catchall {:try_start_0 .. :try_end_15} :catchall_16

    .line 860
    goto :goto_17

    .line 859
    :catchall_16
    move-exception v0

    .line 861
    :goto_17
    return-void
.end method
