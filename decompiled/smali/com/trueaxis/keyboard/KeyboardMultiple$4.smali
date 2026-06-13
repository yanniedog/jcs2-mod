.class final Lcom/trueaxis/keyboard/KeyboardMultiple$4;
.super Ljava/lang/Object;
.source "KeyboardMultiple.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trueaxis/keyboard/KeyboardMultiple;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 268
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 10

    .line 272
    sget-object p1, Lcom/trueaxis/keyboard/KeyboardMultiple;->boxList:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_0
    const/4 v2, 0x1

    if-ge v1, p1, :cond_3

    .line 275
    sget-object v3, Lcom/trueaxis/keyboard/KeyboardMultiple;->boxList:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/trueaxis/keyboard/KeyboardMultiple$MultipleInputBox;

    if-eqz v3, :cond_2

    .line 276
    iget-object v4, v3, Lcom/trueaxis/keyboard/KeyboardMultiple$MultipleInputBox;->editBox:Landroid/widget/EditText;

    if-eqz v4, :cond_2

    .line 278
    new-instance v4, Landroid/graphics/Rect;

    iget-object v5, v3, Lcom/trueaxis/keyboard/KeyboardMultiple$MultipleInputBox;->editBox:Landroid/widget/EditText;

    invoke-virtual {v5}, Landroid/widget/EditText;->getLeft()I

    move-result v5

    invoke-static {}, Lcom/trueaxis/keyboard/KeyboardMultiple;->access$100()I

    move-result v6

    add-int/2addr v5, v6

    iget-object v6, v3, Lcom/trueaxis/keyboard/KeyboardMultiple$MultipleInputBox;->editBox:Landroid/widget/EditText;

    .line 279
    invoke-virtual {v6}, Landroid/widget/EditText;->getTop()I

    move-result v6

    invoke-static {}, Lcom/trueaxis/keyboard/KeyboardMultiple;->access$200()I

    move-result v7

    add-int/2addr v6, v7

    iget-object v7, v3, Lcom/trueaxis/keyboard/KeyboardMultiple$MultipleInputBox;->editBox:Landroid/widget/EditText;

    .line 280
    invoke-virtual {v7}, Landroid/widget/EditText;->getRight()I

    move-result v7

    invoke-static {}, Lcom/trueaxis/keyboard/KeyboardMultiple;->access$100()I

    move-result v8

    add-int/2addr v7, v8

    iget-object v8, v3, Lcom/trueaxis/keyboard/KeyboardMultiple$MultipleInputBox;->editBox:Landroid/widget/EditText;

    .line 281
    invoke-virtual {v8}, Landroid/widget/EditText;->getBottom()I

    move-result v8

    invoke-static {}, Lcom/trueaxis/keyboard/KeyboardMultiple;->access$200()I

    move-result v9

    add-int/2addr v8, v9

    invoke-direct {v4, v5, v6, v7, v8}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 282
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v5

    float-to-int v5, v5

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result v6

    float-to-int v6, v6

    invoke-virtual {v4, v5, v6}, Landroid/graphics/Rect;->contains(II)Z

    move-result v4

    if-nez v4, :cond_0

    .line 302
    iget-object v2, v3, Lcom/trueaxis/keyboard/KeyboardMultiple$MultipleInputBox;->editBox:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v3, Lcom/trueaxis/keyboard/KeyboardMultiple$MultipleInputBox;->editStr:Ljava/lang/String;

    .line 304
    iget-object v2, v3, Lcom/trueaxis/keyboard/KeyboardMultiple$MultipleInputBox;->editBox:Landroid/widget/EditText;

    invoke-virtual {v2, v0}, Landroid/widget/EditText;->setCursorVisible(Z)V

    goto :goto_1

    .line 309
    :cond_0
    invoke-static {}, Lcom/trueaxis/keyboard/KeyboardMultiple;->access$300()I

    move-result p1

    const/16 p2, 0xff

    if-ne p1, p2, :cond_1

    .line 311
    sget-object p1, Lcom/trueaxis/keyboard/KeyboardMultiple;->popUp:Landroid/widget/PopupWindow;

    invoke-virtual {p1, v2}, Landroid/widget/PopupWindow;->setFocusable(Z)V

    .line 313
    iget-object p1, v3, Lcom/trueaxis/keyboard/KeyboardMultiple$MultipleInputBox;->editBox:Landroid/widget/EditText;

    invoke-virtual {p1, v2}, Landroid/widget/EditText;->setCursorVisible(Z)V

    .line 322
    invoke-static {v2}, Lcom/trueaxis/keyboard/KeyboardMultiple;->access$002(Z)Z

    .line 323
    sget-object p1, Lcom/trueaxis/keyboard/KeyboardMultiple;->popUp:Landroid/widget/PopupWindow;

    invoke-virtual {p1}, Landroid/widget/PopupWindow;->update()V

    .line 324
    invoke-static {}, Lcom/trueaxis/cLib/TrueaxisLib;->KeyboardMultipleExecuteOnStartEditingCallback()V

    .line 326
    invoke-static {v1}, Lcom/trueaxis/keyboard/KeyboardMultiple;->access$402(I)I

    :cond_1
    return v0

    :cond_2
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_0

    .line 333
    :cond_3
    sget-object p2, Lcom/trueaxis/keyboard/KeyboardMultiple;->popUp:Landroid/widget/PopupWindow;

    invoke-virtual {p2, v0}, Landroid/widget/PopupWindow;->setFocusable(Z)V

    .line 334
    invoke-static {}, Lcom/trueaxis/keyboard/KeyboardMultiple;->access$500()Ljava/lang/String;

    move-result-object p2

    const-string v1, ""

    if-ne p2, v1, :cond_4

    .line 336
    invoke-static {v0}, Lcom/trueaxis/keyboard/KeyboardMultiple;->access$602(I)I

    goto :goto_2

    .line 339
    :cond_4
    invoke-static {v1}, Lcom/trueaxis/keyboard/KeyboardMultiple;->access$702(Ljava/lang/String;)Ljava/lang/String;

    const p2, 0xa0a0a0

    .line 341
    invoke-static {p2}, Lcom/trueaxis/keyboard/KeyboardMultiple;->access$602(I)I

    :goto_2
    const/4 p2, 0x0

    :goto_3
    if-ge p2, p1, :cond_6

    .line 348
    sget-object v1, Lcom/trueaxis/keyboard/KeyboardMultiple;->boxList:Ljava/util/ArrayList;

    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trueaxis/keyboard/KeyboardMultiple$MultipleInputBox;

    iget-object v1, v1, Lcom/trueaxis/keyboard/KeyboardMultiple$MultipleInputBox;->editBox:Landroid/widget/EditText;

    if-eqz v1, :cond_5

    .line 351
    invoke-virtual {v1, v0}, Landroid/widget/EditText;->setCursorVisible(Z)V

    :cond_5
    add-int/lit8 p2, p2, 0x1

    goto :goto_3

    .line 355
    :cond_6
    invoke-static {v0}, Lcom/trueaxis/keyboard/KeyboardMultiple;->access$002(Z)Z

    .line 356
    sget-object p1, Lcom/trueaxis/keyboard/KeyboardMultiple;->popUp:Landroid/widget/PopupWindow;

    invoke-virtual {p1}, Landroid/widget/PopupWindow;->update()V

    .line 357
    invoke-static {}, Lcom/trueaxis/cLib/TrueaxisLib;->KeyboardMultipleExecuteOnEndEditingCallback()V

    .line 358
    invoke-static {}, Lcom/trueaxis/util/Util;->resumeSoftkeys()V

    return v2
.end method
