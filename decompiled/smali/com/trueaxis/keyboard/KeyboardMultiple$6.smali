.class Lcom/trueaxis/keyboard/KeyboardMultiple$6;
.super Ljava/lang/Object;
.source "KeyboardMultiple.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/keyboard/KeyboardMultiple;->createPopUpWindow(IIIIII)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trueaxis/keyboard/KeyboardMultiple;

.field final synthetic val$boxCount:I

.field final synthetic val$maxHeight:I

.field final synthetic val$maxWidth:I

.field final synthetic val$vDistance:I

.field final synthetic val$x:I

.field final synthetic val$y:I


# direct methods
.method constructor <init>(Lcom/trueaxis/keyboard/KeyboardMultiple;IIIIII)V
    .locals 0

    .line 423
    iput-object p1, p0, Lcom/trueaxis/keyboard/KeyboardMultiple$6;->this$0:Lcom/trueaxis/keyboard/KeyboardMultiple;

    iput p2, p0, Lcom/trueaxis/keyboard/KeyboardMultiple$6;->val$maxWidth:I

    iput p3, p0, Lcom/trueaxis/keyboard/KeyboardMultiple$6;->val$maxHeight:I

    iput p4, p0, Lcom/trueaxis/keyboard/KeyboardMultiple$6;->val$x:I

    iput p5, p0, Lcom/trueaxis/keyboard/KeyboardMultiple$6;->val$y:I

    iput p6, p0, Lcom/trueaxis/keyboard/KeyboardMultiple$6;->val$vDistance:I

    iput p7, p0, Lcom/trueaxis/keyboard/KeyboardMultiple$6;->val$boxCount:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 11

    .line 429
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-static {}, Lcom/trueaxis/game/Interface;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-static {v0}, Lcom/trueaxis/keyboard/KeyboardMultiple;->access$802(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;

    .line 430
    invoke-static {}, Lcom/trueaxis/keyboard/KeyboardMultiple;->access$800()Landroid/widget/LinearLayout;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 434
    sget v0, Lcom/trueaxis/util/Util;->mWidth:I

    int-to-float v0, v0

    sget v1, Lcom/trueaxis/util/Util;->mWidthScale:I

    int-to-float v1, v1

    div-float/2addr v0, v1

    const v1, 0x3f7d70a4

    mul-float v0, v0, v1

    .line 436
    sget v2, Lcom/trueaxis/util/Util;->mHeight:I

    int-to-float v2, v2

    sget v3, Lcom/trueaxis/util/Util;->mHeightScale:I

    int-to-float v3, v3

    div-float/2addr v2, v3

    mul-float v2, v2, v1

    .line 439
    iget v1, p0, Lcom/trueaxis/keyboard/KeyboardMultiple$6;->val$maxWidth:I

    int-to-float v1, v1

    .line 440
    iget v3, p0, Lcom/trueaxis/keyboard/KeyboardMultiple$6;->val$maxHeight:I

    int-to-float v3, v3

    mul-float v1, v1, v0

    mul-float v3, v3, v2

    float-to-int v4, v1

    float-to-int v5, v3

    .line 446
    iget v6, p0, Lcom/trueaxis/keyboard/KeyboardMultiple$6;->val$x:I

    int-to-float v6, v6

    .line 447
    iget v7, p0, Lcom/trueaxis/keyboard/KeyboardMultiple$6;->val$y:I

    int-to-float v7, v7

    mul-float v6, v6, v0

    mul-float v7, v7, v2

    float-to-int v0, v6

    .line 450
    invoke-static {v0}, Lcom/trueaxis/keyboard/KeyboardMultiple;->access$102(I)I

    float-to-int v0, v7

    .line 451
    invoke-static {v0}, Lcom/trueaxis/keyboard/KeyboardMultiple;->access$202(I)I

    .line 453
    invoke-static {v1}, Lcom/trueaxis/keyboard/KeyboardMultiple;->access$902(F)F

    .line 454
    invoke-static {v3}, Lcom/trueaxis/keyboard/KeyboardMultiple;->access$1002(F)F

    .line 456
    iget v0, p0, Lcom/trueaxis/keyboard/KeyboardMultiple$6;->val$vDistance:I

    int-to-float v0, v0

    mul-float v0, v0, v2

    float-to-int v0, v0

    .line 463
    new-instance v1, Landroid/widget/PopupWindow;

    invoke-static {}, Lcom/trueaxis/game/Interface;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/widget/PopupWindow;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/trueaxis/keyboard/KeyboardMultiple;->popUp:Landroid/widget/PopupWindow;

    .line 464
    sget-object v1, Lcom/trueaxis/keyboard/KeyboardMultiple;->popUp:Landroid/widget/PopupWindow;

    const/16 v2, 0x140

    invoke-virtual {v1, v2}, Landroid/widget/PopupWindow;->setWidth(I)V

    .line 465
    sget-object v1, Lcom/trueaxis/keyboard/KeyboardMultiple;->popUp:Landroid/widget/PopupWindow;

    const/16 v2, 0x190

    invoke-virtual {v1, v2}, Landroid/widget/PopupWindow;->setHeight(I)V

    .line 466
    sget-object v1, Lcom/trueaxis/keyboard/KeyboardMultiple;->popUp:Landroid/widget/PopupWindow;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/PopupWindow;->setClippingEnabled(Z)V

    const/4 v1, 0x0

    .line 503
    :goto_0
    iget v3, p0, Lcom/trueaxis/keyboard/KeyboardMultiple$6;->val$boxCount:I

    if-ge v1, v3, :cond_1

    .line 504
    iget-object v3, p0, Lcom/trueaxis/keyboard/KeyboardMultiple$6;->this$0:Lcom/trueaxis/keyboard/KeyboardMultiple;

    invoke-static {v3}, Lcom/trueaxis/keyboard/KeyboardMultiple;->access$1100(Lcom/trueaxis/keyboard/KeyboardMultiple;)Landroid/widget/EditText;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 506
    invoke-virtual {v3, v4}, Landroid/widget/EditText;->setWidth(I)V

    .line 507
    invoke-virtual {v3, v5}, Landroid/widget/EditText;->setHeight(I)V

    .line 508
    invoke-virtual {v3}, Landroid/widget/EditText;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    check-cast v6, Landroid/widget/LinearLayout$LayoutParams;

    sub-int v7, v0, v5

    .line 509
    invoke-virtual {v6, v2, v2, v2, v7}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 511
    invoke-static {}, Lcom/trueaxis/keyboard/KeyboardMultiple;->access$800()Landroid/widget/LinearLayout;

    move-result-object v6

    invoke-virtual {v6, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 515
    :cond_1
    sget-object v1, Lcom/trueaxis/keyboard/KeyboardMultiple;->popUp:Landroid/widget/PopupWindow;

    invoke-static {}, Lcom/trueaxis/keyboard/KeyboardMultiple;->access$800()Landroid/widget/LinearLayout;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/PopupWindow;->setContentView(Landroid/view/View;)V

    .line 520
    sget-object v1, Lcom/trueaxis/keyboard/KeyboardMultiple;->popUp:Landroid/widget/PopupWindow;

    sget-object v3, Lcom/trueaxis/keyboard/KeyboardMultiple;->customPopUpTouchListenr:Landroid/view/View$OnTouchListener;

    invoke-virtual {v1, v3}, Landroid/widget/PopupWindow;->setTouchInterceptor(Landroid/view/View$OnTouchListener;)V

    .line 521
    sget-object v1, Lcom/trueaxis/keyboard/KeyboardMultiple;->popUp:Landroid/widget/PopupWindow;

    new-instance v3, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {v3}, Landroid/graphics/drawable/BitmapDrawable;-><init>()V

    invoke-virtual {v1, v3}, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 522
    sget-object v1, Lcom/trueaxis/keyboard/KeyboardMultiple;->popUp:Landroid/widget/PopupWindow;

    invoke-static {}, Lcom/trueaxis/keyboard/KeyboardMultiple;->access$800()Landroid/widget/LinearLayout;

    move-result-object v3

    invoke-virtual {v1, v3, v2, v2, v2}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    .line 524
    sget-object v5, Lcom/trueaxis/keyboard/KeyboardMultiple;->popUp:Landroid/widget/PopupWindow;

    invoke-static {}, Lcom/trueaxis/keyboard/KeyboardMultiple;->access$100()I

    move-result v6

    invoke-static {}, Lcom/trueaxis/keyboard/KeyboardMultiple;->access$200()I

    move-result v7

    invoke-static {}, Lcom/trueaxis/keyboard/KeyboardMultiple;->access$100()I

    move-result v1

    add-int v8, v1, v4

    invoke-static {}, Lcom/trueaxis/keyboard/KeyboardMultiple;->access$200()I

    move-result v1

    iget v3, p0, Lcom/trueaxis/keyboard/KeyboardMultiple$6;->val$boxCount:I

    mul-int v3, v3, v0

    add-int/2addr v1, v3

    add-int/lit8 v9, v1, 0x32

    const/4 v10, 0x1

    invoke-virtual/range {v5 .. v10}, Landroid/widget/PopupWindow;->update(IIIIZ)V

    const/16 v0, 0xff

    .line 526
    invoke-static {v0}, Lcom/trueaxis/keyboard/KeyboardMultiple;->access$302(I)I

    .line 527
    invoke-static {v2}, Lcom/trueaxis/keyboard/KeyboardMultiple;->access$002(Z)Z

    return-void
.end method
