.class Lcom/trueaxis/modmenu/ModMenu$4;
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

.field final synthetic val$splitOptions:Landroid/widget/LinearLayout;


# direct methods
.method constructor <init>(Landroid/app/Activity;Landroid/widget/LinearLayout;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 471
    iput-object p1, p0, Lcom/trueaxis/modmenu/ModMenu$4;->val$a:Landroid/app/Activity;

    iput-object p2, p0, Lcom/trueaxis/modmenu/ModMenu$4;->val$splitOptions:Landroid/widget/LinearLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 473
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$4;->val$a:Landroid/app/Activity;

    iget-object v1, p0, Lcom/trueaxis/modmenu/ModMenu$4;->val$splitOptions:Landroid/widget/LinearLayout;

    # invokes: Lcom/trueaxis/modmenu/ModMenu;->updateSplitOptionsVisibility(Landroid/content/Context;Landroid/view/View;)V
    invoke-static {v0, v1}, Lcom/trueaxis/modmenu/ModMenu;->access$000(Landroid/content/Context;Landroid/view/View;)V

    .line 474
    return-void
.end method
