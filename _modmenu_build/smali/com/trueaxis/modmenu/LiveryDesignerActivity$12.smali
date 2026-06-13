.class Lcom/trueaxis/modmenu/LiveryDesignerActivity$12;
.super Ljava/lang/Object;
.source "LiveryDesignerActivity.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/modmenu/LiveryDesignerActivity;->showColorPicker()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trueaxis/modmenu/LiveryDesignerActivity;

.field final synthetic val$channel:I

.field final synthetic val$preview:Landroid/view/View;

.field final synthetic val$rgb:[I


# direct methods
.method constructor <init>(Lcom/trueaxis/modmenu/LiveryDesignerActivity;[IILandroid/view/View;)V
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 301
    iput-object p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$12;->this$0:Lcom/trueaxis/modmenu/LiveryDesignerActivity;

    iput-object p2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$12;->val$rgb:[I

    iput p3, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$12;->val$channel:I

    iput-object p4, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$12;->val$preview:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .registers 6

    .line 303
    iget-object p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$12;->val$rgb:[I

    iget p3, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$12;->val$channel:I

    aput p2, p1, p3

    .line 304
    iget-object p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$12;->val$preview:Landroid/view/View;

    iget-object p2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$12;->val$rgb:[I

    const/4 p3, 0x0

    aget p2, p2, p3

    iget-object p3, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$12;->val$rgb:[I

    const/4 v0, 0x1

    aget p3, p3, v0

    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$12;->val$rgb:[I

    const/4 v1, 0x2

    aget v0, v0, v1

    invoke-static {p2, p3, v0}, Landroid/graphics/Color;->rgb(III)I

    move-result p2

    # invokes: Lcom/trueaxis/modmenu/LiveryDesignerActivity;->pill(I)Landroid/graphics/drawable/GradientDrawable;
    invoke-static {p2}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->access$400(I)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 305
    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .registers 2

    .line 308
    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .registers 2

    .line 311
    return-void
.end method
