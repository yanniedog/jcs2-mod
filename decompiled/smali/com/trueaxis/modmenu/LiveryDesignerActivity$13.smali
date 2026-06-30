.class Lcom/trueaxis/modmenu/LiveryDesignerActivity$13;
.super Ljava/lang/Object;
.source "LiveryDesignerActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


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

.field final synthetic val$rgb:[I


# direct methods
.method constructor <init>(Lcom/trueaxis/modmenu/LiveryDesignerActivity;[I)V
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

    .line 344
    iput-object p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$13;->this$0:Lcom/trueaxis/modmenu/LiveryDesignerActivity;

    iput-object p2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$13;->val$rgb:[I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 6

    .line 346
    iget-object p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$13;->this$0:Lcom/trueaxis/modmenu/LiveryDesignerActivity;

    iget-object p2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$13;->val$rgb:[I

    const/4 v0, 0x0

    aget p2, p2, v0

    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$13;->val$rgb:[I

    const/4 v1, 0x1

    aget v0, v0, v1

    iget-object v1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$13;->val$rgb:[I

    const/4 v2, 0x2

    aget v1, v1, v2

    invoke-static {p2, v0, v1}, Landroid/graphics/Color;->rgb(III)I

    move-result p2

    # invokes: Lcom/trueaxis/modmenu/LiveryDesignerActivity;->setColor(I)V
    invoke-static {p1, p2}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->access$000(Lcom/trueaxis/modmenu/LiveryDesignerActivity;I)V

    .line 347
    return-void
.end method
