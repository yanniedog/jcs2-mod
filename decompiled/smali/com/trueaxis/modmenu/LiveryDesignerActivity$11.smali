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

    .line 258
    iput-object p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$11;->this$0:Lcom/trueaxis/modmenu/LiveryDesignerActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 5

    .line 260
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "revert confirmed car="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-object p2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$11;->this$0:Lcom/trueaxis/modmenu/LiveryDesignerActivity;

    # getter for: Lcom/trueaxis/modmenu/LiveryDesignerActivity;->car:I
    invoke-static {p2}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->access$800(Lcom/trueaxis/modmenu/LiveryDesignerActivity;)I

    move-result p2

    invoke-static {p2}, Lcom/trueaxis/modmenu/ModMenu;->carName(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "designer"

    invoke-static {p2, p1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 261
    iget-object p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$11;->this$0:Lcom/trueaxis/modmenu/LiveryDesignerActivity;

    .line 262
    invoke-static {}, Lcom/trueaxis/modmenu/ModMenu;->carCount()I

    move-result v0

    iget-object v1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$11;->this$0:Lcom/trueaxis/modmenu/LiveryDesignerActivity;

    # getter for: Lcom/trueaxis/modmenu/LiveryDesignerActivity;->car:I
    invoke-static {v1}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->access$800(Lcom/trueaxis/modmenu/LiveryDesignerActivity;)I

    move-result v1

    if-le v0, v1, :cond_37

    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$11;->this$0:Lcom/trueaxis/modmenu/LiveryDesignerActivity;

    # getter for: Lcom/trueaxis/modmenu/LiveryDesignerActivity;->car:I
    invoke-static {v0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->access$800(Lcom/trueaxis/modmenu/LiveryDesignerActivity;)I

    move-result v0

    goto :goto_38

    :cond_37
    const/4 v0, 0x0

    .line 261
    :goto_38
    invoke-static {p1, v0}, Lcom/trueaxis/modmenu/ModMenu;->loadEditableLivery(Landroid/content/Context;I)Landroid/graphics/Bitmap;

    move-result-object p1

    .line 263
    if-eqz p1, :cond_68

    .line 264
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$11;->this$0:Lcom/trueaxis/modmenu/LiveryDesignerActivity;

    # getter for: Lcom/trueaxis/modmenu/LiveryDesignerActivity;->canvas:Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;
    invoke-static {v0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->access$100(Lcom/trueaxis/modmenu/LiveryDesignerActivity;)Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->replaceBitmap(Landroid/graphics/Bitmap;)V

    .line 265
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "revert loaded original car="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$11;->this$0:Lcom/trueaxis/modmenu/LiveryDesignerActivity;

    # getter for: Lcom/trueaxis/modmenu/LiveryDesignerActivity;->car:I
    invoke-static {v0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->access$800(Lcom/trueaxis/modmenu/LiveryDesignerActivity;)I

    move-result v0

    invoke-static {v0}, Lcom/trueaxis/modmenu/ModMenu;->carName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_88

    .line 267
    :cond_68
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "revert original load returned null car="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$11;->this$0:Lcom/trueaxis/modmenu/LiveryDesignerActivity;

    .line 268
    # getter for: Lcom/trueaxis/modmenu/LiveryDesignerActivity;->car:I
    invoke-static {v0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->access$800(Lcom/trueaxis/modmenu/LiveryDesignerActivity;)I

    move-result v0

    invoke-static {v0}, Lcom/trueaxis/modmenu/ModMenu;->carName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 267
    invoke-static {p2, p1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 270
    :goto_88
    return-void
.end method
