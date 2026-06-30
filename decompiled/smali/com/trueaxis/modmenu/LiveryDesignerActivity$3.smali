.class Lcom/trueaxis/modmenu/LiveryDesignerActivity$3;
.super Ljava/lang/Object;
.source "LiveryDesignerActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/modmenu/LiveryDesignerActivity;->buildColorRow()Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trueaxis/modmenu/LiveryDesignerActivity;

.field final synthetic val$color:I


# direct methods
.method constructor <init>(Lcom/trueaxis/modmenu/LiveryDesignerActivity;I)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 154
    iput-object p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$3;->this$0:Lcom/trueaxis/modmenu/LiveryDesignerActivity;

    iput p2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$3;->val$color:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 3

    .line 156
    iget-object p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$3;->this$0:Lcom/trueaxis/modmenu/LiveryDesignerActivity;

    iget v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$3;->val$color:I

    # invokes: Lcom/trueaxis/modmenu/LiveryDesignerActivity;->setColor(I)V
    invoke-static {p1, v0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->access$000(Lcom/trueaxis/modmenu/LiveryDesignerActivity;I)V

    .line 157
    return-void
.end method
