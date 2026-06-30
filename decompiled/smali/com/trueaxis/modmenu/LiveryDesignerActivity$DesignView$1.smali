.class Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView$1;
.super Landroid/view/ScaleGestureDetector$SimpleOnScaleGestureListener;
.source "LiveryDesignerActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;-><init>(Landroid/content/Context;Landroid/graphics/Bitmap;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;


# direct methods
.method constructor <init>(Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 452
    iput-object p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView$1;->this$0:Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;

    invoke-direct {p0}, Landroid/view/ScaleGestureDetector$SimpleOnScaleGestureListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onScale(Landroid/view/ScaleGestureDetector;)Z
    .registers 5

    .line 455
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView$1;->this$0:Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;

    # getter for: Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->zoom:F
    invoke-static {v0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->access$900(Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;)F

    move-result v0

    .line 456
    iget-object v1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView$1;->this$0:Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;

    .line 457
    # getter for: Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->zoom:F
    invoke-static {v1}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->access$900(Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;)F

    move-result v1

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getScaleFactor()F

    move-result v2

    mul-float v1, v1, v2

    const/high16 v2, 0x41000000

    invoke-static {v2, v1}, Ljava/lang/Math;->min(FF)F

    move-result v1

    .line 456
    const/high16 v2, 0x3f800000

    invoke-static {v2, v1}, Ljava/lang/Math;->max(FF)F

    move-result v1

    .line 458
    cmpl-float v0, v1, v0

    if-eqz v0, :cond_34

    .line 459
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView$1;->this$0:Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getFocusX()F

    move-result v2

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getFocusY()F

    move-result p1

    # invokes: Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->applyZoomAt(FFF)V
    invoke-static {v0, v1, v2, p1}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->access$1000(Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;FFF)V

    .line 460
    iget-object p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView$1;->this$0:Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;

    invoke-virtual {p1}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->invalidate()V

    .line 462
    :cond_34
    const/4 p1, 0x1

    return p1
.end method
