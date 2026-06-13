.class final Lcom/trueaxis/keyboard/Keyboard$4;
.super Ljava/lang/Object;
.source "Keyboard.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trueaxis/keyboard/Keyboard;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 184
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 5

    .line 188
    new-instance p1, Landroid/graphics/Rect;

    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$200()Landroid/widget/EditText;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/EditText;->getLeft()I

    move-result v0

    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$700()I

    move-result v1

    add-int/2addr v0, v1

    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$200()Landroid/widget/EditText;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/EditText;->getTop()I

    move-result v1

    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$800()I

    move-result v2

    add-int/2addr v1, v2

    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$200()Landroid/widget/EditText;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/EditText;->getRight()I

    move-result v2

    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$700()I

    move-result v3

    add-int/2addr v2, v3

    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$200()Landroid/widget/EditText;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/EditText;->getBottom()I

    move-result v3

    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$800()I

    move-result v4

    add-int/2addr v3, v4

    invoke-direct {p1, v0, v1, v2, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 189
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v0

    float-to-int v0, v0

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result p2

    float-to-int p2, p2

    invoke-virtual {p1, v0, p2}, Landroid/graphics/Rect;->contains(II)Z

    move-result p1

    const p2, 0xa0a0a0

    const/4 v0, 0x1

    const-string v1, ""

    const/4 v2, 0x0

    if-nez p1, :cond_1

    .line 191
    sget-object p1, Lcom/trueaxis/keyboard/Keyboard;->popUp:Landroid/widget/PopupWindow;

    invoke-virtual {p1, v2}, Landroid/widget/PopupWindow;->setFocusable(Z)V

    .line 192
    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$000()Ljava/lang/String;

    move-result-object p1

    if-ne p1, v1, :cond_0

    .line 194
    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$200()Landroid/widget/EditText;

    move-result-object p1

    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$100()I

    move-result p2

    shl-int/lit8 p2, p2, 0x18

    or-int/2addr p2, v2

    invoke-virtual {p1, p2}, Landroid/widget/EditText;->setTextColor(I)V

    .line 195
    invoke-static {v2}, Lcom/trueaxis/keyboard/Keyboard;->access$302(I)I

    .line 196
    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$200()Landroid/widget/EditText;

    move-result-object p1

    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$400()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 200
    :cond_0
    invoke-static {v1}, Lcom/trueaxis/keyboard/Keyboard;->access$402(Ljava/lang/String;)Ljava/lang/String;

    .line 201
    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$200()Landroid/widget/EditText;

    move-result-object p1

    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$100()I

    move-result v1

    shl-int/lit8 v1, v1, 0x18

    or-int/2addr v1, p2

    invoke-virtual {p1, v1}, Landroid/widget/EditText;->setTextColor(I)V

    .line 202
    invoke-static {p2}, Lcom/trueaxis/keyboard/Keyboard;->access$302(I)I

    .line 203
    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$200()Landroid/widget/EditText;

    move-result-object p1

    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$000()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 205
    :goto_0
    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$200()Landroid/widget/EditText;

    move-result-object p1

    invoke-virtual {p1, v2}, Landroid/widget/EditText;->setCursorVisible(Z)V

    .line 206
    invoke-static {v2}, Lcom/trueaxis/keyboard/Keyboard;->access$502(Z)Z

    .line 207
    sget-object p1, Lcom/trueaxis/keyboard/Keyboard;->popUp:Landroid/widget/PopupWindow;

    invoke-virtual {p1}, Landroid/widget/PopupWindow;->update()V

    .line 208
    invoke-static {}, Lcom/trueaxis/cLib/TrueaxisLib;->KeyboardExecuteOnEndEditingCallback()V

    .line 209
    invoke-static {}, Lcom/trueaxis/util/Util;->resumeSoftkeys()V

    return v0

    .line 214
    :cond_1
    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$100()I

    move-result p1

    const/16 v3, 0xff

    if-ne p1, v3, :cond_3

    .line 216
    sget-object p1, Lcom/trueaxis/keyboard/Keyboard;->popUp:Landroid/widget/PopupWindow;

    invoke-virtual {p1, v0}, Landroid/widget/PopupWindow;->setFocusable(Z)V

    .line 218
    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$200()Landroid/widget/EditText;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setCursorVisible(Z)V

    .line 219
    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$400()Ljava/lang/String;

    move-result-object p1

    if-ne p1, v1, :cond_2

    .line 221
    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$000()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_2

    .line 223
    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$200()Landroid/widget/EditText;

    move-result-object p1

    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$000()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 224
    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$200()Landroid/widget/EditText;

    move-result-object p1

    const v1, -0x5f5f60

    invoke-virtual {p1, v1}, Landroid/widget/EditText;->setTextColor(I)V

    .line 225
    invoke-static {p2}, Lcom/trueaxis/keyboard/Keyboard;->access$302(I)I

    .line 228
    :cond_2
    invoke-static {v0}, Lcom/trueaxis/keyboard/Keyboard;->access$502(Z)Z

    .line 229
    sget-object p1, Lcom/trueaxis/keyboard/Keyboard;->popUp:Landroid/widget/PopupWindow;

    invoke-virtual {p1}, Landroid/widget/PopupWindow;->update()V

    .line 230
    invoke-static {}, Lcom/trueaxis/cLib/TrueaxisLib;->KeyboardExecuteOnStartEditingCallback()V

    :cond_3
    return v2
.end method
