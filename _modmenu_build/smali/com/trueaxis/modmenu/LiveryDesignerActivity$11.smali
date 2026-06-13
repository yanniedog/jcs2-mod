.class Lcom/trueaxis/modmenu/LiveryDesignerActivity$11;
.super Ljava/lang/Object;
.source "LiveryDesignerActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/modmenu/LiveryDesignerActivity;->confirmRevert()V
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

    .line 251
    iput-object p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$11;->this$0:Lcom/trueaxis/modmenu/LiveryDesignerActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 4

    .line 253
    iget-object p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$11;->this$0:Lcom/trueaxis/modmenu/LiveryDesignerActivity;

    .line 254
    invoke-static {}, Lcom/trueaxis/modmenu/ModMenu;->carCount()I

    move-result p2

    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$11;->this$0:Lcom/trueaxis/modmenu/LiveryDesignerActivity;

    # getter for: Lcom/trueaxis/modmenu/LiveryDesignerActivity;->car:I
    invoke-static {v0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->access$800(Lcom/trueaxis/modmenu/LiveryDesignerActivity;)I

    move-result v0

    if-le p2, v0, :cond_15

    iget-object p2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$11;->this$0:Lcom/trueaxis/modmenu/LiveryDesignerActivity;

    # getter for: Lcom/trueaxis/modmenu/LiveryDesignerActivity;->car:I
    invoke-static {p2}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->access$800(Lcom/trueaxis/modmenu/LiveryDesignerActivity;)I

    move-result p2

    goto :goto_16

    :cond_15
    const/4 p2, 0x0

    .line 253
    :goto_16
    invoke-static {p1, p2}, Lcom/trueaxis/modmenu/ModMenu;->loadEditableLivery(Landroid/content/Context;I)Landroid/graphics/Bitmap;

    move-result-object p1

    .line 255
    if-eqz p1, :cond_25

    iget-object p2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$11;->this$0:Lcom/trueaxis/modmenu/LiveryDesignerActivity;

    # getter for: Lcom/trueaxis/modmenu/LiveryDesignerActivity;->canvas:Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;
    invoke-static {p2}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->access$100(Lcom/trueaxis/modmenu/LiveryDesignerActivity;)Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;

    move-result-object p2

    invoke-virtual {p2, p1}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->replaceBitmap(Landroid/graphics/Bitmap;)V

    .line 256
    :cond_25
    return-void
.end method
