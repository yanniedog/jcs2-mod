.class Lcom/trueaxis/keyboard/KeyboardMultiple$9;
.super Ljava/lang/Object;
.source "KeyboardMultiple.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/keyboard/KeyboardMultiple;->setTextboxBounds(IIIIFF)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trueaxis/keyboard/KeyboardMultiple;

.field final synthetic val$Height:I

.field final synthetic val$Width:I

.field final synthetic val$X:I

.field final synthetic val$Y:I


# direct methods
.method constructor <init>(Lcom/trueaxis/keyboard/KeyboardMultiple;IIII)V
    .locals 0

    .line 644
    iput-object p1, p0, Lcom/trueaxis/keyboard/KeyboardMultiple$9;->this$0:Lcom/trueaxis/keyboard/KeyboardMultiple;

    iput p2, p0, Lcom/trueaxis/keyboard/KeyboardMultiple$9;->val$Width:I

    iput p3, p0, Lcom/trueaxis/keyboard/KeyboardMultiple$9;->val$Height:I

    iput p4, p0, Lcom/trueaxis/keyboard/KeyboardMultiple$9;->val$X:I

    iput p5, p0, Lcom/trueaxis/keyboard/KeyboardMultiple$9;->val$Y:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 648
    sget-object v0, Lcom/trueaxis/keyboard/KeyboardMultiple;->popUp:Landroid/widget/PopupWindow;

    if-eqz v0, :cond_0

    .line 650
    sget v0, Lcom/trueaxis/util/Util;->mWidth:I

    int-to-float v0, v0

    sget v1, Lcom/trueaxis/util/Util;->mWidthScale:I

    int-to-float v1, v1

    div-float/2addr v0, v1

    const v1, 0x3f7d70a4

    mul-float v0, v0, v1

    .line 652
    sget v2, Lcom/trueaxis/util/Util;->mHeight:I

    int-to-float v2, v2

    sget v3, Lcom/trueaxis/util/Util;->mHeightScale:I

    int-to-float v3, v3

    div-float/2addr v2, v3

    mul-float v2, v2, v1

    .line 655
    iget v1, p0, Lcom/trueaxis/keyboard/KeyboardMultiple$9;->val$Width:I

    int-to-float v1, v1

    .line 656
    iget v3, p0, Lcom/trueaxis/keyboard/KeyboardMultiple$9;->val$Height:I

    int-to-float v3, v3

    mul-float v1, v1, v0

    mul-float v3, v3, v2

    .line 662
    iget v4, p0, Lcom/trueaxis/keyboard/KeyboardMultiple$9;->val$X:I

    int-to-float v4, v4

    .line 663
    iget v5, p0, Lcom/trueaxis/keyboard/KeyboardMultiple$9;->val$Y:I

    int-to-float v5, v5

    mul-float v4, v4, v0

    mul-float v5, v5, v2

    float-to-int v0, v4

    .line 666
    invoke-static {v0}, Lcom/trueaxis/keyboard/KeyboardMultiple;->access$102(I)I

    float-to-int v0, v5

    .line 667
    invoke-static {v0}, Lcom/trueaxis/keyboard/KeyboardMultiple;->access$202(I)I

    .line 669
    invoke-static {v1}, Lcom/trueaxis/keyboard/KeyboardMultiple;->access$902(F)F

    .line 670
    invoke-static {v3}, Lcom/trueaxis/keyboard/KeyboardMultiple;->access$1002(F)F

    :cond_0
    return-void
.end method
