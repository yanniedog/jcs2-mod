.class Lcom/trueaxis/modmenu/ModMenu$6;
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


# direct methods
.method constructor <init>(Landroid/app/Activity;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 691
    iput-object p1, p0, Lcom/trueaxis/modmenu/ModMenu$6;->val$a:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 3

    .line 693
    const-string p1, "launcher"

    const-string v0, "custom livery editor clicked"

    invoke-static {p1, v0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 694
    iget-object p1, p0, Lcom/trueaxis/modmenu/ModMenu$6;->val$a:Landroid/app/Activity;

    invoke-static {p1}, Lcom/trueaxis/modmenu/ModMenu;->showLiveryManager(Landroid/app/Activity;)V

    .line 695
    return-void
.end method
