.class final Lcom/trueaxis/keyboard/Keyboard$3;
.super Ljava/lang/Object;
.source "Keyboard.java"

# interfaces
.implements Landroid/widget/TextView$OnEditorActionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/keyboard/Keyboard;->createEditBox()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 153
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 0

    const/4 p1, 0x0

    const/4 p3, 0x6

    if-ne p2, p3, :cond_1

    .line 159
    sget-object p2, Lcom/trueaxis/keyboard/Keyboard;->popUp:Landroid/widget/PopupWindow;

    invoke-virtual {p2, p1}, Landroid/widget/PopupWindow;->setFocusable(Z)V

    .line 161
    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$200()Landroid/widget/EditText;

    move-result-object p2

    invoke-virtual {p2}, Landroid/widget/EditText;->getCurrentTextColor()I

    move-result p2

    const p3, 0xffffff

    and-int/2addr p2, p3

    const p3, 0xa0a0a0

    if-ne p2, p3, :cond_0

    const-string p2, ""

    .line 165
    invoke-static {p2}, Lcom/trueaxis/keyboard/Keyboard;->access$402(Ljava/lang/String;)Ljava/lang/String;

    goto :goto_0

    .line 169
    :cond_0
    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$200()Landroid/widget/EditText;

    move-result-object p2

    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lcom/trueaxis/keyboard/Keyboard;->access$402(Ljava/lang/String;)Ljava/lang/String;

    .line 171
    :goto_0
    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$200()Landroid/widget/EditText;

    move-result-object p2

    invoke-virtual {p2, p1}, Landroid/widget/EditText;->setCursorVisible(Z)V

    .line 172
    invoke-static {p1}, Lcom/trueaxis/keyboard/Keyboard;->access$502(Z)Z

    .line 173
    sget-object p2, Lcom/trueaxis/keyboard/Keyboard;->popUp:Landroid/widget/PopupWindow;

    invoke-virtual {p2}, Landroid/widget/PopupWindow;->update()V

    .line 174
    invoke-static {}, Lcom/trueaxis/cLib/TrueaxisLib;->KeyboardExecuteOnEndEditingCallback()V

    :cond_1
    return p1
.end method
