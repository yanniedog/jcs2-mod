.class Lcom/trueaxis/modmenu/ModMenu$13;
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

.field final synthetic val$swarmExtras:Landroid/widget/LinearLayout;


# direct methods
.method constructor <init>(Landroid/widget/LinearLayout;Landroid/app/Activity;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 943
    iput-object p1, p0, Lcom/trueaxis/modmenu/ModMenu$13;->val$swarmExtras:Landroid/widget/LinearLayout;

    iput-object p2, p0, Lcom/trueaxis/modmenu/ModMenu$13;->val$a:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 945
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$13;->val$swarmExtras:Landroid/widget/LinearLayout;

    .line 946
    iget-object v1, p0, Lcom/trueaxis/modmenu/ModMenu$13;->val$a:Landroid/app/Activity;

    invoke-static {v1}, Lcom/trueaxis/modmenu/ModMenu;->replaySwarmEnabled(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_c

    const/4 v1, 0x0

    goto :goto_e

    :cond_c
    const/16 v1, 0x8

    .line 945
    :goto_e
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 947
    return-void
.end method
