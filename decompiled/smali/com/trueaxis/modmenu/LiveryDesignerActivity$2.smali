.class Lcom/trueaxis/modmenu/LiveryDesignerActivity$2;
.super Ljava/lang/Object;
.source "LiveryDesignerActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/modmenu/LiveryDesignerActivity;->buildToolRow()Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trueaxis/modmenu/LiveryDesignerActivity;

.field final synthetic val$buttons:[Landroid/widget/Button;

.field final synthetic val$index:I

.field final synthetic val$tool:I


# direct methods
.method constructor <init>(Lcom/trueaxis/modmenu/LiveryDesignerActivity;I[Landroid/widget/Button;I)V
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

    .line 111
    iput-object p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$2;->this$0:Lcom/trueaxis/modmenu/LiveryDesignerActivity;

    iput p2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$2;->val$tool:I

    iput-object p3, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$2;->val$buttons:[Landroid/widget/Button;

    iput p4, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$2;->val$index:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 4

    .line 113
    iget-object p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$2;->this$0:Lcom/trueaxis/modmenu/LiveryDesignerActivity;

    # getter for: Lcom/trueaxis/modmenu/LiveryDesignerActivity;->canvas:Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;
    invoke-static {p1}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->access$100(Lcom/trueaxis/modmenu/LiveryDesignerActivity;)Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;

    move-result-object p1

    iget v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$2;->val$tool:I

    invoke-virtual {p1, v0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->setTool(I)V

    .line 114
    const/4 p1, 0x0

    :goto_c
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$2;->val$buttons:[Landroid/widget/Button;

    array-length v0, v0

    if-ge p1, v0, :cond_3b

    .line 115
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$2;->val$buttons:[Landroid/widget/Button;

    aget-object v0, v0, p1

    iget v1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$2;->val$index:I

    if-ne p1, v1, :cond_1e

    # getter for: Lcom/trueaxis/modmenu/LiveryDesignerActivity;->ACCENT:I
    invoke-static {}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->access$200()I

    move-result v1

    goto :goto_22

    :cond_1e
    # getter for: Lcom/trueaxis/modmenu/LiveryDesignerActivity;->PANEL:I
    invoke-static {}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->access$300()I

    move-result v1

    :goto_22
    # invokes: Lcom/trueaxis/modmenu/LiveryDesignerActivity;->pill(I)Landroid/graphics/drawable/GradientDrawable;
    invoke-static {v1}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->access$400(I)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 116
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$2;->val$buttons:[Landroid/widget/Button;

    aget-object v0, v0, p1

    iget v1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$2;->val$index:I

    if-ne p1, v1, :cond_34

    const/high16 v1, -0x1000000

    goto :goto_35

    :cond_34
    const/4 v1, -0x1

    :goto_35
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTextColor(I)V

    .line 114
    add-int/lit8 p1, p1, 0x1

    goto :goto_c

    .line 118
    :cond_3b
    return-void
.end method
