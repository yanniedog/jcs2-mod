.class Lcom/trueaxis/modmenu/LiveryDesignerActivity$5;
.super Ljava/lang/Object;
.source "LiveryDesignerActivity.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/modmenu/LiveryDesignerActivity;->buildSizeRow()Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trueaxis/modmenu/LiveryDesignerActivity;


# direct methods
.method constructor <init>(Lcom/trueaxis/modmenu/LiveryDesignerActivity;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 183
    iput-object p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$5;->this$0:Lcom/trueaxis/modmenu/LiveryDesignerActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .registers 4

    .line 185
    iget-object p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$5;->this$0:Lcom/trueaxis/modmenu/LiveryDesignerActivity;

    # getter for: Lcom/trueaxis/modmenu/LiveryDesignerActivity;->canvas:Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;
    invoke-static {p1}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->access$100(Lcom/trueaxis/modmenu/LiveryDesignerActivity;)Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;

    move-result-object p1

    const/4 p3, 0x1

    invoke-static {p3, p2}, Ljava/lang/Math;->max(II)I

    move-result p2

    int-to-float p2, p2

    invoke-virtual {p1, p2}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->setStrokeWidth(F)V

    .line 186
    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .registers 2

    .line 189
    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .registers 2

    .line 192
    return-void
.end method
