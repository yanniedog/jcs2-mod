.class final Lcom/trueaxis/keyboard/Keyboard$6;
.super Ljava/lang/Object;
.source "Keyboard.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/keyboard/Keyboard;->restorePopUpWindow()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 276
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 11

    const/4 v0, 0x0

    .line 281
    sput-boolean v0, Lcom/trueaxis/keyboard/Keyboard;->restorePopup:Z

    .line 282
    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$900()V

    .line 284
    new-instance v1, Landroid/widget/PopupWindow;

    invoke-static {}, Lcom/trueaxis/game/Interface;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/widget/PopupWindow;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/trueaxis/keyboard/Keyboard;->popUp:Landroid/widget/PopupWindow;

    .line 285
    sget-object v1, Lcom/trueaxis/keyboard/Keyboard;->popUp:Landroid/widget/PopupWindow;

    const/16 v2, 0x140

    invoke-virtual {v1, v2}, Landroid/widget/PopupWindow;->setWidth(I)V

    .line 286
    sget-object v1, Lcom/trueaxis/keyboard/Keyboard;->popUp:Landroid/widget/PopupWindow;

    const/16 v2, 0x64

    invoke-virtual {v1, v2}, Landroid/widget/PopupWindow;->setHeight(I)V

    .line 287
    sget-object v1, Lcom/trueaxis/keyboard/Keyboard;->popUp:Landroid/widget/PopupWindow;

    invoke-virtual {v1, v0}, Landroid/widget/PopupWindow;->setClippingEnabled(Z)V

    .line 289
    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$200()Landroid/widget/EditText;

    move-result-object v1

    if-eqz v1, :cond_5

    .line 291
    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$1100()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    .line 293
    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$1200()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 294
    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$200()Landroid/widget/EditText;

    move-result-object v1

    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$1200()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 298
    :cond_0
    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$200()Landroid/widget/EditText;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/widget/EditText;->setBackgroundColor(I)V

    .line 301
    :cond_1
    :goto_0
    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$200()Landroid/widget/EditText;

    move-result-object v1

    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$1300()I

    move-result v3

    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setGravity(I)V

    .line 303
    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$000()Ljava/lang/String;

    move-result-object v1

    const-string v3, ""

    if-ne v1, v3, :cond_2

    .line 305
    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$200()Landroid/widget/EditText;

    move-result-object v1

    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$400()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 306
    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$200()Landroid/widget/EditText;

    move-result-object v1

    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$100()I

    move-result v3

    shl-int/lit8 v3, v3, 0x18

    or-int/2addr v3, v0

    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setTextColor(I)V

    goto :goto_1

    .line 310
    :cond_2
    invoke-static {v3}, Lcom/trueaxis/keyboard/Keyboard;->access$402(Ljava/lang/String;)Ljava/lang/String;

    .line 311
    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$200()Landroid/widget/EditText;

    move-result-object v1

    const v3, 0xa0a0a0

    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$100()I

    move-result v4

    shl-int/lit8 v4, v4, 0x18

    or-int/2addr v3, v4

    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setTextColor(I)V

    .line 312
    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$200()Landroid/widget/EditText;

    move-result-object v1

    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$000()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 315
    :goto_1
    sget v1, Lcom/trueaxis/util/Util;->mHeight:I

    sget v3, Lcom/trueaxis/util/Util;->mWidth:I

    const/high16 v4, 0x44480000    # 800.0f

    const/high16 v5, 0x43f00000    # 480.0f

    if-le v1, v3, :cond_3

    .line 316
    sget v1, Lcom/trueaxis/util/Util;->mHeight:I

    int-to-float v1, v1

    div-float/2addr v1, v4

    goto :goto_2

    .line 318
    :cond_3
    sget v1, Lcom/trueaxis/util/Util;->mHeight:I

    int-to-float v1, v1

    div-float/2addr v1, v5

    .line 320
    :goto_2
    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$200()Landroid/widget/EditText;

    move-result-object v3

    const/high16 v6, 0x41b40000    # 22.5f

    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$1400()F

    move-result v7

    mul-float v7, v7, v6

    mul-float v7, v7, v1

    invoke-virtual {v3, v0, v7}, Landroid/widget/EditText;->setTextSize(IF)V

    .line 322
    new-instance v3, Landroid/view/animation/RotateAnimation;

    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$1500()F

    move-result v6

    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$1500()F

    move-result v7

    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$1600()F

    move-result v8

    const/high16 v9, 0x3f000000    # 0.5f

    mul-float v8, v8, v9

    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$1700()F

    move-result v10

    mul-float v10, v10, v9

    invoke-direct {v3, v6, v7, v8, v10}, Landroid/view/animation/RotateAnimation;-><init>(FFFF)V

    const/4 v6, -0x1

    .line 323
    invoke-virtual {v3, v6}, Landroid/view/animation/RotateAnimation;->setRepeatCount(I)V

    .line 324
    invoke-virtual {v3, v2}, Landroid/view/animation/RotateAnimation;->setFillAfter(Z)V

    .line 325
    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$200()Landroid/widget/EditText;

    move-result-object v2

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->startAnimation(Landroid/view/animation/Animation;)V

    const/high16 v2, 0x41400000    # 12.0f

    mul-float v1, v1, v2

    .line 330
    sget v2, Lcom/trueaxis/util/Util;->mHeight:I

    sget v3, Lcom/trueaxis/util/Util;->mWidth:I

    const/high16 v6, 0x41600000    # 14.0f

    if-le v2, v3, :cond_4

    .line 331
    sget v2, Lcom/trueaxis/util/Util;->mWidth:I

    int-to-float v2, v2

    div-float/2addr v2, v5

    goto :goto_3

    .line 333
    :cond_4
    sget v2, Lcom/trueaxis/util/Util;->mWidth:I

    int-to-float v2, v2

    div-float/2addr v2, v4

    :goto_3
    mul-float v2, v2, v6

    .line 335
    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$200()Landroid/widget/EditText;

    move-result-object v3

    float-to-int v2, v2

    float-to-int v1, v1

    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$200()Landroid/widget/EditText;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/EditText;->getPaddingRight()I

    move-result v4

    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$200()Landroid/widget/EditText;

    move-result-object v5

    invoke-virtual {v5}, Landroid/widget/EditText;->getPaddingBottom()I

    move-result v5

    invoke-virtual {v3, v2, v1, v4, v5}, Landroid/widget/EditText;->setPadding(IIII)V

    .line 337
    sget-object v1, Lcom/trueaxis/keyboard/Keyboard;->popUp:Landroid/widget/PopupWindow;

    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$200()Landroid/widget/EditText;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/PopupWindow;->setContentView(Landroid/view/View;)V

    .line 339
    :cond_5
    sget-object v1, Lcom/trueaxis/keyboard/Keyboard;->popUp:Landroid/widget/PopupWindow;

    sget-object v2, Lcom/trueaxis/keyboard/Keyboard;->customPopUpTouchListenr:Landroid/view/View$OnTouchListener;

    invoke-virtual {v1, v2}, Landroid/widget/PopupWindow;->setTouchInterceptor(Landroid/view/View$OnTouchListener;)V

    .line 340
    sget-object v1, Lcom/trueaxis/keyboard/Keyboard;->popUp:Landroid/widget/PopupWindow;

    new-instance v2, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {v2}, Landroid/graphics/drawable/BitmapDrawable;-><init>()V

    invoke-virtual {v1, v2}, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 341
    sget-object v1, Lcom/trueaxis/keyboard/Keyboard;->popUp:Landroid/widget/PopupWindow;

    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$1000()Landroid/widget/LinearLayout;

    move-result-object v2

    invoke-virtual {v1, v2, v0, v0, v0}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    .line 342
    sget-object v3, Lcom/trueaxis/keyboard/Keyboard;->popUp:Landroid/widget/PopupWindow;

    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$700()I

    move-result v4

    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$800()I

    move-result v5

    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$1600()F

    move-result v1

    float-to-int v6, v1

    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$1700()F

    move-result v1

    float-to-int v7, v1

    const/4 v8, 0x1

    invoke-virtual/range {v3 .. v8}, Landroid/widget/PopupWindow;->update(IIIIZ)V

    .line 344
    invoke-static {v0}, Lcom/trueaxis/keyboard/Keyboard;->access$502(Z)Z

    return-void
.end method
