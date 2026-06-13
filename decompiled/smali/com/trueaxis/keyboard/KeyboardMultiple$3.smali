.class Lcom/trueaxis/keyboard/KeyboardMultiple$3;
.super Ljava/lang/Object;
.source "KeyboardMultiple.java"

# interfaces
.implements Landroid/widget/TextView$OnEditorActionListener;


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
.method constructor <init>(Lcom/trueaxis/keyboard/KeyboardMultiple;)V
    .locals 0

    .line 205
    iput-object p1, p0, Lcom/trueaxis/keyboard/KeyboardMultiple$3;->this$0:Lcom/trueaxis/keyboard/KeyboardMultiple;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 2

    const/4 p1, 0x0

    const/4 p3, 0x6

    if-ne p2, p3, :cond_2

    .line 211
    sget-object p2, Lcom/trueaxis/keyboard/KeyboardMultiple;->popUp:Landroid/widget/PopupWindow;

    invoke-virtual {p2, p1}, Landroid/widget/PopupWindow;->setFocusable(Z)V

    .line 226
    sget-object p2, Lcom/trueaxis/keyboard/KeyboardMultiple;->boxList:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p2

    const/4 p3, 0x0

    :goto_0
    if-ge p3, p2, :cond_1

    .line 229
    sget-object v0, Lcom/trueaxis/keyboard/KeyboardMultiple;->boxList:Ljava/util/ArrayList;

    invoke-virtual {v0, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/trueaxis/keyboard/KeyboardMultiple$MultipleInputBox;

    if-eqz v0, :cond_0

    .line 230
    iget-object v1, v0, Lcom/trueaxis/keyboard/KeyboardMultiple$MultipleInputBox;->editBox:Landroid/widget/EditText;

    if-eqz v1, :cond_0

    .line 232
    iget-object v1, v0, Lcom/trueaxis/keyboard/KeyboardMultiple$MultipleInputBox;->editBox:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/trueaxis/keyboard/KeyboardMultiple$MultipleInputBox;->editStr:Ljava/lang/String;

    .line 233
    iget-object v0, v0, Lcom/trueaxis/keyboard/KeyboardMultiple$MultipleInputBox;->editBox:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setCursorVisible(Z)V

    :cond_0
    add-int/lit8 p3, p3, 0x1

    goto :goto_0

    .line 237
    :cond_1
    invoke-static {p1}, Lcom/trueaxis/keyboard/KeyboardMultiple;->access$002(Z)Z

    .line 238
    sget-object p2, Lcom/trueaxis/keyboard/KeyboardMultiple;->popUp:Landroid/widget/PopupWindow;

    invoke-virtual {p2}, Landroid/widget/PopupWindow;->update()V

    .line 239
    invoke-static {}, Lcom/trueaxis/cLib/TrueaxisLib;->KeyboardMultipleExecuteOnEndEditingCallback()V

    :cond_2
    return p1
.end method
