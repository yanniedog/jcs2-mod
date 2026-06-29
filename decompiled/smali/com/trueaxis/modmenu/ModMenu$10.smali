.class Lcom/trueaxis/modmenu/ModMenu$10;
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

    .line 707
    iput-object p1, p0, Lcom/trueaxis/modmenu/ModMenu$10;->val$a:Landroid/app/Activity;

    iput-object p2, p0, Lcom/trueaxis/modmenu/ModMenu$10;->val$cars:Landroid/widget/Spinner;

    iput-object p3, p0, Lcom/trueaxis/modmenu/ModMenu$10;->val$refresh:Ljava/lang/Runnable;

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

    .line 710
    iget-object p1, p0, Lcom/trueaxis/modmenu/ModMenu$10;->val$a:Landroid/app/Activity;

    iget-object p2, p0, Lcom/trueaxis/modmenu/ModMenu$10;->val$cars:Landroid/widget/Spinner;

    # invokes: Lcom/trueaxis/modmenu/ModMenu;->rememberCar(Landroid/content/Context;Landroid/widget/Spinner;)V
    invoke-static {p1, p2}, Lcom/trueaxis/modmenu/ModMenu;->access$200(Landroid/content/Context;Landroid/widget/Spinner;)V

    .line 711
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "manager selected car="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-static {p3}, Lcom/trueaxis/modmenu/ModMenu;->carName(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " customExists="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-object p2, p0, Lcom/trueaxis/modmenu/ModMenu$10;->val$a:Landroid/app/Activity;

    .line 712
    # invokes: Lcom/trueaxis/modmenu/ModMenu;->customTexture(Landroid/content/Context;I)Ljava/io/File;
    invoke-static {p2, p3}, Lcom/trueaxis/modmenu/ModMenu;->access$400(Landroid/content/Context;I)Ljava/io/File;

    move-result-object p2

    invoke-virtual {p2}, Ljava/io/File;->isFile()Z

    move-result p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 711
    const-string p2, "livery"

    invoke-static {p2, p1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 713
    iget-object p1, p0, Lcom/trueaxis/modmenu/ModMenu$10;->val$refresh:Ljava/lang/Runnable;

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 714
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

    .line 717
    return-void
.end method
