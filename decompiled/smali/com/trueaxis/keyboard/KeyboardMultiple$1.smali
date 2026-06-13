.class Lcom/trueaxis/keyboard/KeyboardMultiple$1;
.super Landroid/widget/EditText;
.source "KeyboardMultiple.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/keyboard/KeyboardMultiple;->createEditBox()Landroid/widget/EditText;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trueaxis/keyboard/KeyboardMultiple;


# direct methods
.method constructor <init>(Lcom/trueaxis/keyboard/KeyboardMultiple;Landroid/content/Context;)V
    .locals 0

    .line 86
    iput-object p1, p0, Lcom/trueaxis/keyboard/KeyboardMultiple$1;->this$0:Lcom/trueaxis/keyboard/KeyboardMultiple;

    invoke-direct {p0, p2}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public onKeyPreIme(ILandroid/view/KeyEvent;)Z
    .locals 3

    .line 90
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_2

    .line 93
    sget-object p1, Lcom/trueaxis/keyboard/KeyboardMultiple;->popUp:Landroid/widget/PopupWindow;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/widget/PopupWindow;->setFocusable(Z)V

    .line 95
    sget-object p1, Lcom/trueaxis/keyboard/KeyboardMultiple;->boxList:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    const/4 v0, 0x0

    :goto_0
    if-ge v0, p1, :cond_1

    .line 98
    sget-object v1, Lcom/trueaxis/keyboard/KeyboardMultiple;->boxList:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trueaxis/keyboard/KeyboardMultiple$MultipleInputBox;

    if-eqz v1, :cond_0

    .line 99
    iget-object v2, v1, Lcom/trueaxis/keyboard/KeyboardMultiple$MultipleInputBox;->editBox:Landroid/widget/EditText;

    if-eqz v2, :cond_0

    .line 101
    iget-object v1, v1, Lcom/trueaxis/keyboard/KeyboardMultiple$MultipleInputBox;->editBox:Landroid/widget/EditText;

    invoke-virtual {v1, p2}, Landroid/widget/EditText;->setCursorVisible(Z)V

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 118
    :cond_1
    invoke-static {p2}, Lcom/trueaxis/keyboard/KeyboardMultiple;->access$002(Z)Z

    .line 119
    sget-object p1, Lcom/trueaxis/keyboard/KeyboardMultiple;->popUp:Landroid/widget/PopupWindow;

    invoke-virtual {p1}, Landroid/widget/PopupWindow;->update()V

    .line 120
    invoke-static {}, Lcom/trueaxis/cLib/TrueaxisLib;->KeyboardExecuteOnEndEditingCallback()V

    const/4 p1, 0x1

    return p1

    .line 124
    :cond_2
    invoke-super {p0, p1, p2}, Landroid/widget/EditText;->onKeyPreIme(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method
