.class Lcom/trueaxis/keyboard/Keyboard$9;
.super Ljava/lang/Object;
.source "Keyboard.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/keyboard/Keyboard;->setTextboxBounds(IIIIFF)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trueaxis/keyboard/Keyboard;

.field final synthetic val$Height:I

.field final synthetic val$Width:I

.field final synthetic val$X:I

.field final synthetic val$Y:I

.field final synthetic val$fAngleDegrees:F

.field final synthetic val$fScale:F


# direct methods
.method constructor <init>(Lcom/trueaxis/keyboard/Keyboard;IIIIFF)V
    .locals 0

    .line 384
    iput-object p1, p0, Lcom/trueaxis/keyboard/Keyboard$9;->this$0:Lcom/trueaxis/keyboard/Keyboard;

    iput p2, p0, Lcom/trueaxis/keyboard/Keyboard$9;->val$Width:I

    iput p3, p0, Lcom/trueaxis/keyboard/Keyboard$9;->val$Height:I

    iput p4, p0, Lcom/trueaxis/keyboard/Keyboard$9;->val$X:I

    iput p5, p0, Lcom/trueaxis/keyboard/Keyboard$9;->val$Y:I

    iput p6, p0, Lcom/trueaxis/keyboard/Keyboard$9;->val$fAngleDegrees:F

    iput p7, p0, Lcom/trueaxis/keyboard/Keyboard$9;->val$fScale:F

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 11

    .line 388
    sget-object v0, Lcom/trueaxis/keyboard/Keyboard;->popUp:Landroid/widget/PopupWindow;

    if-eqz v0, :cond_3

    .line 390
    sget v0, Lcom/trueaxis/util/Util;->mWidth:I

    int-to-float v0, v0

    sget v1, Lcom/trueaxis/util/Util;->mWidthScale:I

    int-to-float v1, v1

    div-float/2addr v0, v1

    const v1, 0x3f7d70a4

    mul-float v0, v0, v1

    .line 392
    sget v2, Lcom/trueaxis/util/Util;->mHeight:I

    int-to-float v2, v2

    sget v3, Lcom/trueaxis/util/Util;->mHeightScale:I

    int-to-float v3, v3

    div-float/2addr v2, v3

    mul-float v2, v2, v1

    .line 395
    iget v1, p0, Lcom/trueaxis/keyboard/Keyboard$9;->val$Width:I

    int-to-float v1, v1

    .line 396
    iget v3, p0, Lcom/trueaxis/keyboard/Keyboard$9;->val$Height:I

    int-to-float v3, v3

    mul-float v1, v1, v0

    mul-float v3, v3, v2

    float-to-int v7, v1

    float-to-int v8, v3

    .line 402
    iget v4, p0, Lcom/trueaxis/keyboard/Keyboard$9;->val$X:I

    int-to-float v4, v4

    .line 403
    iget v5, p0, Lcom/trueaxis/keyboard/Keyboard$9;->val$Y:I

    int-to-float v5, v5

    mul-float v4, v4, v0

    mul-float v5, v5, v2

    float-to-int v0, v4

    .line 406
    invoke-static {v0}, Lcom/trueaxis/keyboard/Keyboard;->access$702(I)I

    float-to-int v0, v5

    .line 407
    invoke-static {v0}, Lcom/trueaxis/keyboard/Keyboard;->access$802(I)I

    .line 409
    invoke-static {v1}, Lcom/trueaxis/keyboard/Keyboard;->access$1602(F)F

    .line 410
    invoke-static {v3}, Lcom/trueaxis/keyboard/Keyboard;->access$1702(F)F

    .line 412
    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$200()Landroid/widget/EditText;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 414
    iget v0, p0, Lcom/trueaxis/keyboard/Keyboard$9;->val$fAngleDegrees:F

    invoke-static {v0}, Lcom/trueaxis/keyboard/Keyboard;->access$1502(F)F

    .line 415
    iget v0, p0, Lcom/trueaxis/keyboard/Keyboard$9;->val$fScale:F

    invoke-static {v0}, Lcom/trueaxis/keyboard/Keyboard;->access$1402(F)F

    .line 419
    sget v0, Lcom/trueaxis/util/Util;->mHeight:I

    sget v2, Lcom/trueaxis/util/Util;->mWidth:I

    const/high16 v4, 0x44480000    # 800.0f

    const/high16 v5, 0x43f00000    # 480.0f

    if-le v0, v2, :cond_0

    .line 420
    sget v0, Lcom/trueaxis/util/Util;->mHeight:I

    int-to-float v0, v0

    div-float/2addr v0, v4

    goto :goto_0

    .line 422
    :cond_0
    sget v0, Lcom/trueaxis/util/Util;->mHeight:I

    int-to-float v0, v0

    div-float/2addr v0, v5

    .line 424
    :goto_0
    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$200()Landroid/widget/EditText;

    move-result-object v2

    const/4 v6, 0x0

    const/high16 v9, 0x41b40000    # 22.5f

    iget v10, p0, Lcom/trueaxis/keyboard/Keyboard$9;->val$fScale:F

    mul-float v10, v10, v9

    mul-float v10, v10, v0

    invoke-virtual {v2, v6, v10}, Landroid/widget/EditText;->setTextSize(IF)V

    .line 426
    new-instance v2, Landroid/view/animation/RotateAnimation;

    iget v6, p0, Lcom/trueaxis/keyboard/Keyboard$9;->val$fAngleDegrees:F

    const/high16 v9, 0x3f000000    # 0.5f

    mul-float v1, v1, v9

    mul-float v3, v3, v9

    invoke-direct {v2, v6, v6, v1, v3}, Landroid/view/animation/RotateAnimation;-><init>(FFFF)V

    const/4 v1, -0x1

    .line 428
    invoke-virtual {v2, v1}, Landroid/view/animation/RotateAnimation;->setRepeatCount(I)V

    const/4 v1, 0x1

    .line 429
    invoke-virtual {v2, v1}, Landroid/view/animation/RotateAnimation;->setFillAfter(Z)V

    .line 430
    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$200()Landroid/widget/EditText;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->startAnimation(Landroid/view/animation/Animation;)V

    const/high16 v1, 0x41400000    # 12.0f

    mul-float v0, v0, v1

    .line 435
    sget v1, Lcom/trueaxis/util/Util;->mHeight:I

    sget v2, Lcom/trueaxis/util/Util;->mWidth:I

    const/high16 v3, 0x41600000    # 14.0f

    if-le v1, v2, :cond_1

    .line 436
    sget v1, Lcom/trueaxis/util/Util;->mWidth:I

    int-to-float v1, v1

    div-float/2addr v1, v5

    goto :goto_1

    .line 438
    :cond_1
    sget v1, Lcom/trueaxis/util/Util;->mWidth:I

    int-to-float v1, v1

    div-float/2addr v1, v4

    :goto_1
    mul-float v1, v1, v3

    .line 440
    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$200()Landroid/widget/EditText;

    move-result-object v2

    float-to-int v1, v1

    float-to-int v0, v0

    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$200()Landroid/widget/EditText;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/EditText;->getPaddingRight()I

    move-result v3

    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$200()Landroid/widget/EditText;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/EditText;->getPaddingBottom()I

    move-result v4

    invoke-virtual {v2, v1, v0, v3, v4}, Landroid/widget/EditText;->setPadding(IIII)V

    .line 442
    :cond_2
    sget-object v4, Lcom/trueaxis/keyboard/Keyboard;->popUp:Landroid/widget/PopupWindow;

    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$700()I

    move-result v5

    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$800()I

    move-result v6

    const/4 v9, 0x1

    invoke-virtual/range {v4 .. v9}, Landroid/widget/PopupWindow;->update(IIIIZ)V

    :cond_3
    return-void
.end method
