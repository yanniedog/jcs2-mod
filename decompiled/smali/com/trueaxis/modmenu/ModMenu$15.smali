.class Lcom/trueaxis/modmenu/ModMenu$15;
.super Ljava/lang/Object;
.source "ModMenu.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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

.field final synthetic val$packButton:Landroid/widget/Button;


# direct methods
.method constructor <init>(Landroid/app/Activity;Landroid/widget/Button;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1012
    iput-object p1, p0, Lcom/trueaxis/modmenu/ModMenu$15;->val$a:Landroid/app/Activity;

    iput-object p2, p0, Lcom/trueaxis/modmenu/ModMenu$15;->val$packButton:Landroid/widget/Button;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 3

    .line 1014
    iget-object p1, p0, Lcom/trueaxis/modmenu/ModMenu$15;->val$a:Landroid/app/Activity;

    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$15;->val$packButton:Landroid/widget/Button;

    # invokes: Lcom/trueaxis/modmenu/ModMenu;->showGhostPackPicker(Landroid/app/Activity;Landroid/widget/Button;)V
    invoke-static {p1, v0}, Lcom/trueaxis/modmenu/ModMenu;->access$200(Landroid/app/Activity;Landroid/widget/Button;)V

    .line 1015
    return-void
.end method
