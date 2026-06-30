.class Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView$2;
.super Ljava/lang/Object;
.source "LiveryDesignerActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->promptText(FF)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;

.field final synthetic val$bx:F

.field final synthetic val$by:F

.field final synthetic val$input:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;Landroid/widget/EditText;FF)V
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

    .line 765
    iput-object p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView$2;->this$0:Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;

    iput-object p2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView$2;->val$input:Landroid/widget/EditText;

    iput p3, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView$2;->val$bx:F

    iput p4, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView$2;->val$by:F

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 6

    .line 767
    iget-object p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView$2;->val$input:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    .line 768
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p2

    if-nez p2, :cond_11

    return-void

    .line 769
    :cond_11
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "place text length="

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const-string v0, "designer"

    invoke-static {v0, p2}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 770
    iget-object p2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView$2;->this$0:Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;

    # invokes: Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->pushUndo()V
    invoke-static {p2}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->access$1100(Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;)V

    .line 771
    new-instance p2, Landroid/graphics/Paint;

    const/4 v0, 0x1

    invoke-direct {p2, v0}, Landroid/graphics/Paint;-><init>(I)V

    .line 772
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView$2;->this$0:Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;

    # getter for: Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->color:I
    invoke-static {v0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->access$1200(Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;)I

    move-result v0

    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 773
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView$2;->this$0:Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;

    # getter for: Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->strokeWidth:F
    invoke-static {v0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->access$1300(Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;)F

    move-result v0

    const/high16 v1, 0x40400000

    mul-float v0, v0, v1

    const/high16 v1, 0x41800000

    invoke-static {v1, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 774
    sget-object v0, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 775
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView$2;->this$0:Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;

    # getter for: Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->bitmapCanvas:Landroid/graphics/Canvas;
    invoke-static {v0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->access$1400(Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;)Landroid/graphics/Canvas;

    move-result-object v0

    iget v1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView$2;->val$bx:F

    iget v2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView$2;->val$by:F

    invoke-virtual {v0, p1, v1, v2, p2}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 776
    iget-object p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView$2;->this$0:Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;

    invoke-virtual {p1}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->invalidate()V

    .line 777
    return-void
.end method
