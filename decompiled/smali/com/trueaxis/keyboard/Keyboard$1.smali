.class final Lcom/trueaxis/keyboard/Keyboard$1;
.super Landroid/widget/EditText;
.source "Keyboard.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/keyboard/Keyboard;->createEditBox()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 55
    invoke-direct {p0, p1}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public onKeyPreIme(ILandroid/view/KeyEvent;)Z
    .locals 2

    .line 59
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_1

    .line 61
    sget-object p1, Lcom/trueaxis/keyboard/Keyboard;->popUp:Landroid/widget/PopupWindow;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/widget/PopupWindow;->setFocusable(Z)V

    .line 62
    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$000()Ljava/lang/String;

    move-result-object p1

    const-string v0, ""

    if-ne p1, v0, :cond_0

    .line 64
    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$200()Landroid/widget/EditText;

    move-result-object p1

    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$100()I

    move-result v0

    shl-int/lit8 v0, v0, 0x18

    or-int/2addr v0, p2

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setTextColor(I)V

    .line 65
    invoke-static {p2}, Lcom/trueaxis/keyboard/Keyboard;->access$302(I)I

    .line 66
    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$200()Landroid/widget/EditText;

    move-result-object p1

    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$400()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 70
    :cond_0
    invoke-static {v0}, Lcom/trueaxis/keyboard/Keyboard;->access$402(Ljava/lang/String;)Ljava/lang/String;

    .line 71
    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$200()Landroid/widget/EditText;

    move-result-object p1

    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$100()I

    move-result v0

    shl-int/lit8 v0, v0, 0x18

    const v1, 0xa0a0a0

    or-int/2addr v0, v1

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setTextColor(I)V

    .line 72
    invoke-static {v1}, Lcom/trueaxis/keyboard/Keyboard;->access$302(I)I

    .line 73
    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$200()Landroid/widget/EditText;

    move-result-object p1

    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$000()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 75
    :goto_0
    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$200()Landroid/widget/EditText;

    move-result-object p1

    invoke-virtual {p1, p2}, Landroid/widget/EditText;->setCursorVisible(Z)V

    .line 76
    invoke-static {p2}, Lcom/trueaxis/keyboard/Keyboard;->access$502(Z)Z

    .line 77
    sget-object p1, Lcom/trueaxis/keyboard/Keyboard;->popUp:Landroid/widget/PopupWindow;

    invoke-virtual {p1}, Landroid/widget/PopupWindow;->update()V

    .line 78
    invoke-static {}, Lcom/trueaxis/cLib/TrueaxisLib;->KeyboardExecuteOnEndEditingCallback()V

    const/4 p1, 0x1

    return p1

    .line 82
    :cond_1
    invoke-super {p0, p1, p2}, Landroid/widget/EditText;->onKeyPreIme(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method
