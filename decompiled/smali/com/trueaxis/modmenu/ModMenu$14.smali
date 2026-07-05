.class Lcom/trueaxis/modmenu/ModMenu$14;
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

    .line 992
    iput-object p1, p0, Lcom/trueaxis/modmenu/ModMenu$14;->val$a:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .line 995
    :try_start_0
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$14;->val$a:Landroid/app/Activity;

    invoke-static {v0}, Lcom/trueaxis/modmenu/ModMenu;->raceSwarmEnabled(Landroid/content/Context;)Z

    move-result v0

    invoke-static {v0}, Lcom/trueaxis/modmenu/RequiredPatches;->setReplayRaceSwarmEnabled(Z)V
    :try_end_9
    .catchall {:try_start_0 .. :try_end_9} :catchall_a

    .line 997
    goto :goto_b

    .line 996
    :catchall_a
    move-exception v0

    .line 998
    :goto_b
    return-void
.end method
