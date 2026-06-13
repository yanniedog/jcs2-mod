.class Lcom/trueaxis/modmenu/NativeMods$2;
.super Ljava/lang/Object;
.source "NativeMods.java"

# interfaces
.implements Landroid/content/DialogInterface$OnShowListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/modmenu/NativeMods;->show(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$a:Landroid/app/Activity;

.field final synthetic val$dialog:Landroid/app/AlertDialog;


# direct methods
.method constructor <init>(Landroid/app/AlertDialog;Landroid/app/Activity;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 282
    iput-object p1, p0, Lcom/trueaxis/modmenu/NativeMods$2;->val$dialog:Landroid/app/AlertDialog;

    iput-object p2, p0, Lcom/trueaxis/modmenu/NativeMods$2;->val$a:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onShow(Landroid/content/DialogInterface;)V
    .registers 5

    .line 284
    iget-object p1, p0, Lcom/trueaxis/modmenu/NativeMods$2;->val$dialog:Landroid/app/AlertDialog;

    invoke-virtual {p1}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    .line 285
    if-eqz p1, :cond_3b

    .line 286
    iget-object v0, p0, Lcom/trueaxis/modmenu/NativeMods$2;->val$a:Landroid/app/Activity;

    const/16 v1, 0x2f8

    # invokes: Lcom/trueaxis/modmenu/NativeMods;->dp(Landroid/content/Context;I)I
    invoke-static {v0, v1}, Lcom/trueaxis/modmenu/NativeMods;->access$200(Landroid/content/Context;I)I

    move-result v0

    iget-object v1, p0, Lcom/trueaxis/modmenu/NativeMods$2;->val$a:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    iget-object v1, p0, Lcom/trueaxis/modmenu/NativeMods$2;->val$a:Landroid/app/Activity;

    .line 287
    const/16 v2, 0x208

    # invokes: Lcom/trueaxis/modmenu/NativeMods;->dp(Landroid/content/Context;I)I
    invoke-static {v1, v2}, Lcom/trueaxis/modmenu/NativeMods;->access$200(Landroid/content/Context;I)I

    move-result v1

    iget-object v2, p0, Lcom/trueaxis/modmenu/NativeMods$2;->val$a:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 286
    invoke-virtual {p1, v0, v1}, Landroid/view/Window;->setLayout(II)V

    .line 289
    :cond_3b
    return-void
.end method
