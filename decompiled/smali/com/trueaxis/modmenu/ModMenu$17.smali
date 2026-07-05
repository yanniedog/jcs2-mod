.class Lcom/trueaxis/modmenu/ModMenu$17;
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

.field final synthetic val$displaySliders:Landroid/widget/LinearLayout;

.field final synthetic val$displayToggle:Landroid/widget/Button;

.field final synthetic val$splitOptions:Landroid/widget/LinearLayout;


# direct methods
.method constructor <init>(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/LinearLayout;Landroid/widget/Button;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1067
    iput-object p1, p0, Lcom/trueaxis/modmenu/ModMenu$17;->val$a:Landroid/app/Activity;

    iput-object p2, p0, Lcom/trueaxis/modmenu/ModMenu$17;->val$splitOptions:Landroid/widget/LinearLayout;

    iput-object p3, p0, Lcom/trueaxis/modmenu/ModMenu$17;->val$displaySliders:Landroid/widget/LinearLayout;

    iput-object p4, p0, Lcom/trueaxis/modmenu/ModMenu$17;->val$displayToggle:Landroid/widget/Button;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .line 1069
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$17;->val$a:Landroid/app/Activity;

    iget-object v1, p0, Lcom/trueaxis/modmenu/ModMenu$17;->val$splitOptions:Landroid/widget/LinearLayout;

    iget-object v2, p0, Lcom/trueaxis/modmenu/ModMenu$17;->val$displaySliders:Landroid/widget/LinearLayout;

    iget-object v3, p0, Lcom/trueaxis/modmenu/ModMenu$17;->val$displayToggle:Landroid/widget/Button;

    # invokes: Lcom/trueaxis/modmenu/ModMenu;->updateSplitOptionsVisibility(Landroid/content/Context;Landroid/view/View;Landroid/view/View;Landroid/view/View;)V
    invoke-static {v0, v1, v2, v3}, Lcom/trueaxis/modmenu/ModMenu;->access$300(Landroid/content/Context;Landroid/view/View;Landroid/view/View;Landroid/view/View;)V

    .line 1071
    return-void
.end method
