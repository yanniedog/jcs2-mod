.class Lcom/trueaxis/modmenu/LiveryDesignerActivity$4;
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

    .line 157
    iput-object p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$4;->this$0:Lcom/trueaxis/modmenu/LiveryDesignerActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 2

    .line 159
    iget-object p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$4;->this$0:Lcom/trueaxis/modmenu/LiveryDesignerActivity;

    # invokes: Lcom/trueaxis/modmenu/LiveryDesignerActivity;->showColorPicker()V
    invoke-static {p1}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->access$500(Lcom/trueaxis/modmenu/LiveryDesignerActivity;)V

    .line 160
    return-void
.end method
