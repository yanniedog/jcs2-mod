.class Lcom/trueaxis/modmenu/ModMenu$6;
.super Ljava/lang/Object;
.source "ModMenu.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/modmenu/ModMenu;->showLiveryManager(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$a:Landroid/app/Activity;

.field final synthetic val$cars:Landroid/widget/Spinner;

.field final synthetic val$refresh:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Landroid/app/Activity;Landroid/widget/Spinner;Ljava/lang/Runnable;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 415
    iput-object p1, p0, Lcom/trueaxis/modmenu/ModMenu$6;->val$a:Landroid/app/Activity;

    iput-object p2, p0, Lcom/trueaxis/modmenu/ModMenu$6;->val$cars:Landroid/widget/Spinner;

    iput-object p3, p0, Lcom/trueaxis/modmenu/ModMenu$6;->val$refresh:Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .line 418
    iget-object p1, p0, Lcom/trueaxis/modmenu/ModMenu$6;->val$a:Landroid/app/Activity;

    iget-object p2, p0, Lcom/trueaxis/modmenu/ModMenu$6;->val$cars:Landroid/widget/Spinner;

    # invokes: Lcom/trueaxis/modmenu/ModMenu;->rememberCar(Landroid/content/Context;Landroid/widget/Spinner;)V
    invoke-static {p1, p2}, Lcom/trueaxis/modmenu/ModMenu;->access$100(Landroid/content/Context;Landroid/widget/Spinner;)V

    .line 419
    iget-object p1, p0, Lcom/trueaxis/modmenu/ModMenu$6;->val$refresh:Ljava/lang/Runnable;

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 420
    return-void
.end method

.method public onNothingSelected(Landroid/widget/AdapterView;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;)V"
        }
    .end annotation

    .line 423
    return-void
.end method
