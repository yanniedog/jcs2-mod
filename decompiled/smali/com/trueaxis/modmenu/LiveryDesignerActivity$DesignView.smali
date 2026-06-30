.class final Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;
.super Landroid/view/View;
.source "LiveryDesignerActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trueaxis/modmenu/LiveryDesignerActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "DesignView"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView$ColorListener;
    }
.end annotation


# static fields
.field static final BRUSH:I = 0x0

.field static final ERASER:I = 0x1

.field static final FILL:I = 0x2

.field static final LINE:I = 0x3

.field private static final MAX_UNDO:I = 0xc

.field private static final MAX_ZOOM:F = 8.0f

.field private static final MIN_ZOOM:F = 1.0f

.field static final PICK:I = 0x5

.field static final RECT:I = 0x4

.field static final TEXT:I = 0x6


# instance fields
.field private bitmap:Landroid/graphics/Bitmap;

.field private bitmapCanvas:Landroid/graphics/Canvas;

.field private final blit:Landroid/graphics/Paint;

.field private final checker:Landroid/graphics/Bitmap;

.field private final clear:Landroid/graphics/PorterDuffXfermode;

.field private color:I

.field private colorListener:Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView$ColorListener;

.field private curX:F

.field private curY:F

.field private dragging:Z

.field private final dst:Landroid/graphics/RectF;

.field private fitScale:F

.field private lastMidX:F

.field private lastMidY:F

.field private multiTouchActive:Z

.field private final paint:Landroid/graphics/Paint;

.field private panX:F

.field private panY:F

.field private final redo:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field private final scaleDetector:Landroid/view/ScaleGestureDetector;

.field private startX:F

.field private startY:F

.field private final stroke:Landroid/graphics/Path;

.field private strokeWidth:F

.field private tool:I

.field private final undo:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field private viewH:I

.field private viewW:I

.field private zoom:F


# direct methods
.method constructor <init>(Landroid/content/Context;Landroid/graphics/Bitmap;)V
    .registers 6

    .line 443
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 412
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->paint:Landroid/graphics/Paint;

    .line 413
    new-instance v0, Landroid/graphics/Paint;

    const/4 v2, 0x2

    invoke-direct {v0, v2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->blit:Landroid/graphics/Paint;

    .line 414
    new-instance v0, Landroid/graphics/PorterDuffXfermode;

    sget-object v2, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v0, v2}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    iput-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->clear:Landroid/graphics/PorterDuffXfermode;

    .line 416
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->undo:Ljava/util/ArrayList;

    .line 417
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->redo:Ljava/util/ArrayList;

    .line 420
    const/4 v0, 0x0

    iput v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->tool:I

    .line 421
    const/high16 v0, -0x10000

    iput v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->color:I

    .line 422
    const/high16 v0, 0x41200000

    iput v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->strokeWidth:F

    .line 424
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->dst:Landroid/graphics/RectF;

    .line 425
    const/high16 v0, 0x3f800000

    iput v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->fitScale:F

    .line 426
    iput v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->zoom:F

    .line 433
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->stroke:Landroid/graphics/Path;

    .line 444
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->isMutable()Z

    move-result v0

    if-eqz v0, :cond_50

    goto :goto_56

    .line 445
    :cond_50
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-virtual {p2, v0, v1}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    move-result-object p2

    :goto_56
    iput-object p2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->bitmap:Landroid/graphics/Bitmap;

    .line 446
    new-instance p2, Landroid/graphics/Canvas;

    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->bitmap:Landroid/graphics/Bitmap;

    invoke-direct {p2, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    iput-object p2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->bitmapCanvas:Landroid/graphics/Canvas;

    .line 447
    iget-object p2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->paint:Landroid/graphics/Paint;

    sget-object v0, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 448
    iget-object p2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->paint:Landroid/graphics/Paint;

    sget-object v0, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 449
    iget-object p2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->paint:Landroid/graphics/Paint;

    sget-object v0, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    .line 450
    invoke-direct {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->makeChecker()Landroid/graphics/Bitmap;

    move-result-object p2

    iput-object p2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->checker:Landroid/graphics/Bitmap;

    .line 451
    new-instance p2, Landroid/view/ScaleGestureDetector;

    new-instance v0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView$1;

    invoke-direct {v0, p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView$1;-><init>(Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;)V

    invoke-direct {p2, p1, v0}, Landroid/view/ScaleGestureDetector;-><init>(Landroid/content/Context;Landroid/view/ScaleGestureDetector$OnScaleGestureListener;)V

    iput-object p2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->scaleDetector:Landroid/view/ScaleGestureDetector;

    .line 465
    return-void
.end method

.method static synthetic access$1000(Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;FFF)V
    .registers 4

    .line 402
    invoke-direct {p0, p1, p2, p3}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->applyZoomAt(FFF)V

    return-void
.end method

.method static synthetic access$1100(Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;)V
    .registers 1

    .line 402
    invoke-direct {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->pushUndo()V

    return-void
.end method

.method static synthetic access$1200(Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;)I
    .registers 1

    .line 402
    iget p0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->color:I

    return p0
.end method

.method static synthetic access$1300(Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;)F
    .registers 1

    .line 402
    iget p0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->strokeWidth:F

    return p0
.end method

.method static synthetic access$1400(Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;)Landroid/graphics/Canvas;
    .registers 1

    .line 402
    iget-object p0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->bitmapCanvas:Landroid/graphics/Canvas;

    return-object p0
.end method

.method static synthetic access$900(Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;)F
    .registers 1

    .line 402
    iget p0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->zoom:F

    return p0
.end method

.method private applyStrokePaint()V
    .registers 3

    .line 740
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->paint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->strokeWidth:F

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 741
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 742
    iget v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->tool:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_21

    .line 743
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->paint:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->clear:Landroid/graphics/PorterDuffXfermode;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 744
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->paint:Landroid/graphics/Paint;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    goto :goto_2e

    .line 746
    :cond_21
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->paint:Landroid/graphics/Paint;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 747
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->paint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->color:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 749
    :goto_2e
    return-void
.end method

.method private applyZoomAt(FFF)V
    .registers 8

    .line 548
    invoke-direct {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->effectiveScale()F

    move-result v0

    .line 549
    iget-object v1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->dst:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->left:F

    sub-float v1, p2, v1

    div-float/2addr v1, v0

    .line 550
    iget-object v2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->dst:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->top:F

    sub-float v2, p3, v2

    div-float/2addr v2, v0

    .line 551
    iput p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->zoom:F

    .line 552
    iget p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->zoom:F

    const/high16 v0, 0x3f800000

    cmpg-float p1, p1, v0

    if-gtz p1, :cond_27

    .line 553
    iput v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->zoom:F

    .line 554
    const/4 p1, 0x0

    iput p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->panX:F

    .line 555
    iput p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->panY:F

    .line 556
    invoke-direct {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->updateDst()V

    .line 557
    return-void

    .line 559
    :cond_27
    invoke-direct {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->effectiveScale()F

    move-result p1

    .line 560
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    int-to-float v0, v0

    mul-float v0, v0, p1

    .line 561
    mul-float v1, v1, p1

    sub-float/2addr p2, v1

    iget v1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->viewW:I

    int-to-float v1, v1

    const/high16 v3, 0x40000000

    div-float/2addr v1, v3

    sub-float/2addr p2, v1

    div-float/2addr v0, v3

    add-float/2addr p2, v0

    iput p2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->panX:F

    .line 562
    mul-float v2, v2, p1

    sub-float/2addr p3, v2

    iget p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->viewH:I

    int-to-float p1, p1

    div-float/2addr p1, v3

    sub-float/2addr p3, p1

    add-float/2addr p3, v0

    iput p3, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->panY:F

    .line 563
    invoke-direct {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->clampPan()V

    .line 564
    invoke-direct {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->updateDst()V

    .line 565
    return-void
.end method

.method private bmpX(F)F
    .registers 3

    .line 607
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->dst:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->left:F

    sub-float/2addr p1, v0

    invoke-direct {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->effectiveScale()F

    move-result v0

    div-float/2addr p1, v0

    return p1
.end method

.method private bmpY(F)F
    .registers 3

    .line 611
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->dst:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->top:F

    sub-float/2addr p1, v0

    invoke-direct {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->effectiveScale()F

    move-result v0

    div-float/2addr p1, v0

    return p1
.end method

.method private clampPan()V
    .registers 6

    .line 568
    iget v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->zoom:F

    const/high16 v1, 0x3f800000

    const/4 v2, 0x0

    cmpg-float v0, v0, v1

    if-gtz v0, :cond_e

    .line 569
    iput v2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->panX:F

    .line 570
    iput v2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->panY:F

    .line 571
    return-void

    .line 573
    :cond_e
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    int-to-float v0, v0

    invoke-direct {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->effectiveScale()F

    move-result v1

    mul-float v0, v0, v1

    .line 574
    iget v1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->viewW:I

    int-to-float v1, v1

    sub-float v1, v0, v1

    const/high16 v3, 0x40000000

    div-float/2addr v1, v3

    invoke-static {v2, v1}, Ljava/lang/Math;->max(FF)F

    move-result v1

    .line 575
    iget v4, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->viewH:I

    int-to-float v4, v4

    sub-float/2addr v0, v4

    div-float/2addr v0, v3

    invoke-static {v2, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    .line 576
    neg-float v2, v1

    iget v3, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->panX:F

    invoke-static {v1, v3}, Ljava/lang/Math;->min(FF)F

    move-result v1

    invoke-static {v2, v1}, Ljava/lang/Math;->max(FF)F

    move-result v1

    iput v1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->panX:F

    .line 577
    neg-float v1, v0

    iget v2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->panY:F

    invoke-static {v0, v2}, Ljava/lang/Math;->min(FF)F

    move-result v0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    iput v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->panY:F

    .line 578
    return-void
.end method

.method private clampX(I)I
    .registers 3

    .line 784
    if-gez p1, :cond_4

    const/4 p1, 0x0

    goto :goto_14

    :cond_4
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    if-lt p1, v0, :cond_14

    iget-object p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p1

    add-int/lit8 p1, p1, -0x1

    :cond_14
    :goto_14
    return p1
.end method

.method private clampY(I)I
    .registers 3

    .line 788
    if-gez p1, :cond_4

    const/4 p1, 0x0

    goto :goto_14

    :cond_4
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    if-lt p1, v0, :cond_14

    iget-object p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p1

    add-int/lit8 p1, p1, -0x1

    :cond_14
    :goto_14
    return p1
.end method

.method private static copy(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .registers 3

    .line 525
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0
.end method

.method private effectiveScale()F
    .registers 3

    .line 537
    iget v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->fitScale:F

    iget v1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->zoom:F

    mul-float v0, v0, v1

    return v0
.end method

.method private floodFill(III)V
    .registers 16

    .line 793
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    .line 794
    iget-object v1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v9

    .line 795
    if-ltz p1, :cond_92

    if-ltz p2, :cond_92

    if-ge p1, v0, :cond_92

    if-lt p2, v9, :cond_16

    goto/16 :goto_92

    .line 796
    :cond_16
    mul-int v10, v0, v9

    new-array v11, v10, [I

    .line 797
    iget-object v1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->bitmap:Landroid/graphics/Bitmap;

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v3, 0x0

    move-object v2, v11

    move v4, v0

    move v7, v0

    move v8, v9

    invoke-virtual/range {v1 .. v8}, Landroid/graphics/Bitmap;->getPixels([IIIIIII)V

    .line 798
    mul-int p2, p2, v0

    add-int/2addr p2, p1

    aget p1, v11, p2

    .line 799
    if-ne p1, p3, :cond_2e

    return-void

    .line 800
    :cond_2e
    new-array v1, v10, [I

    .line 801
    nop

    .line 802
    const/4 v2, 0x0

    aput p2, v1, v2

    const/4 p2, 0x1

    const/4 v2, 0x1

    .line 803
    :goto_36
    if-lez v2, :cond_85

    .line 804
    add-int/lit8 v2, v2, -0x1

    aget v3, v1, v2

    .line 805
    aget v4, v11, v3

    if-eq v4, p1, :cond_41

    goto :goto_36

    .line 806
    :cond_41
    rem-int v4, v3, v0

    .line 807
    nop

    .line 808
    nop

    .line 809
    sub-int/2addr v3, v4

    move v5, v4

    .line 810
    :goto_47
    if-lez v5, :cond_53

    add-int v6, v3, v5

    sub-int/2addr v6, p2

    aget v6, v11, v6

    if-ne v6, p1, :cond_53

    add-int/lit8 v5, v5, -0x1

    goto :goto_47

    .line 811
    :cond_53
    :goto_53
    add-int/lit8 v6, v0, -0x1

    if-ge v4, v6, :cond_61

    add-int v6, v3, v4

    add-int/2addr v6, p2

    aget v6, v11, v6

    if-ne v6, p1, :cond_61

    add-int/lit8 v4, v4, 0x1

    goto :goto_53

    .line 812
    :cond_61
    nop

    :goto_62
    if-gt v5, v4, :cond_84

    .line 813
    add-int v6, v3, v5

    .line 814
    aput p3, v11, v6

    .line 815
    sub-int v7, v6, v0

    if-ltz v7, :cond_75

    aget v8, v11, v7

    if-ne v8, p1, :cond_75

    add-int/lit8 v8, v2, 0x1

    aput v7, v1, v2

    move v2, v8

    .line 816
    :cond_75
    add-int/2addr v6, v0

    if-ge v6, v10, :cond_81

    aget v7, v11, v6

    if-ne v7, p1, :cond_81

    add-int/lit8 v7, v2, 0x1

    aput v6, v1, v2

    move v2, v7

    .line 812
    :cond_81
    add-int/lit8 v5, v5, 0x1

    goto :goto_62

    .line 818
    :cond_84
    goto :goto_36

    .line 819
    :cond_85
    iget-object v1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->bitmap:Landroid/graphics/Bitmap;

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v3, 0x0

    move-object v2, v11

    move v4, v0

    move v7, v0

    move v8, v9

    invoke-virtual/range {v1 .. v8}, Landroid/graphics/Bitmap;->setPixels([IIIIIII)V

    .line 820
    return-void

    .line 795
    :cond_92
    :goto_92
    return-void
.end method

.method private makeChecker()Landroid/graphics/Bitmap;
    .registers 12

    .line 823
    nop

    .line 824
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    const/16 v1, 0x20

    invoke-static {v1, v1, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 825
    new-instance v8, Landroid/graphics/Canvas;

    invoke-direct {v8, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 826
    new-instance v9, Landroid/graphics/Paint;

    invoke-direct {v9}, Landroid/graphics/Paint;-><init>()V

    .line 827
    const/16 v2, 0x4c

    const/16 v3, 0x54

    const/16 v4, 0x46

    invoke-static {v4, v2, v3}, Landroid/graphics/Color;->rgb(III)I

    move-result v2

    invoke-virtual {v9, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 828
    int-to-float v1, v1

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v2, v8

    move v5, v1

    move v6, v1

    move-object v7, v9

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 829
    const/16 v2, 0x3c

    const/16 v3, 0x44

    const/16 v4, 0x36

    invoke-static {v4, v2, v3}, Landroid/graphics/Color;->rgb(III)I

    move-result v2

    invoke-virtual {v9, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 830
    const/16 v2, 0x10

    int-to-float v10, v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v2, v8

    move v5, v10

    move v6, v10

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 831
    move v3, v10

    move v4, v10

    move v5, v1

    move v6, v1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 832
    return-object v0
.end method

.method private onDown(FF)V
    .registers 5

    .line 679
    iput p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->curX:F

    iput p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->startX:F

    .line 680
    iput p2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->curY:F

    iput p2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->startY:F

    .line 681
    iget v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->tool:I

    const/4 v1, 0x5

    if-ne v0, v1, :cond_11

    .line 682
    invoke-direct {p0, p1, p2}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->pickColor(FF)V

    .line 683
    return-void

    .line 685
    :cond_11
    iget v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->tool:I

    const/4 v1, 0x6

    if-ne v0, v1, :cond_1a

    .line 686
    invoke-direct {p0, p1, p2}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->promptText(FF)V

    .line 687
    return-void

    .line 689
    :cond_1a
    iget v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->tool:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_33

    .line 690
    invoke-direct {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->pushUndo()V

    .line 691
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result p2

    iget v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->color:I

    invoke-direct {p0, p1, p2, v0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->floodFill(III)V

    .line 692
    invoke-virtual {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->invalidate()V

    .line 693
    return-void

    .line 695
    :cond_33
    invoke-direct {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->pushUndo()V

    .line 696
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->dragging:Z

    .line 697
    iget v1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->tool:I

    if-eqz v1, :cond_41

    iget v1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->tool:I

    if-ne v1, v0, :cond_58

    .line 698
    :cond_41
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->stroke:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 699
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->stroke:Landroid/graphics/Path;

    invoke-virtual {v0, p1, p2}, Landroid/graphics/Path;->moveTo(FF)V

    .line 700
    invoke-direct {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->applyStrokePaint()V

    .line 701
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->bitmapCanvas:Landroid/graphics/Canvas;

    iget-object v1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1, p2, v1}, Landroid/graphics/Canvas;->drawPoint(FFLandroid/graphics/Paint;)V

    .line 702
    invoke-virtual {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->invalidate()V

    .line 704
    :cond_58
    return-void
.end method

.method private onMove(FF)V
    .registers 11

    .line 707
    iget-boolean v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->dragging:Z

    if-nez v0, :cond_5

    return-void

    .line 708
    :cond_5
    iput p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->curX:F

    .line 709
    iput p2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->curY:F

    .line 710
    iget v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->tool:I

    if-eqz v0, :cond_12

    iget v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->tool:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_26

    .line 711
    :cond_12
    invoke-direct {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->applyStrokePaint()V

    .line 712
    iget-object v2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->bitmapCanvas:Landroid/graphics/Canvas;

    iget v3, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->startX:F

    iget v4, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->startY:F

    iget-object v7, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->paint:Landroid/graphics/Paint;

    move v5, p1

    move v6, p2

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 713
    iput p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->startX:F

    .line 714
    iput p2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->startY:F

    .line 716
    :cond_26
    invoke-virtual {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->invalidate()V

    .line 717
    return-void
.end method

.method private onUp(FF)V
    .registers 11

    .line 720
    iget-boolean v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->dragging:Z

    if-nez v0, :cond_5

    return-void

    .line 721
    :cond_5
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->dragging:Z

    .line 723
    iget v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->tool:I

    const/4 v1, 0x3

    const/4 v2, 0x0

    if-ne v0, v1, :cond_36

    .line 724
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 725
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->paint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->color:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 726
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->paint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->strokeWidth:F

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 727
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 728
    iget-object v2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->bitmapCanvas:Landroid/graphics/Canvas;

    iget v3, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->startX:F

    iget v4, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->startY:F

    iget-object v7, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->paint:Landroid/graphics/Paint;

    move v5, p1

    move v6, p2

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto :goto_6d

    .line 729
    :cond_36
    iget v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->tool:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_6d

    .line 730
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 731
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->paint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->color:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 732
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 733
    iget-object v2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->bitmapCanvas:Landroid/graphics/Canvas;

    iget v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->startX:F

    invoke-static {v0, p1}, Ljava/lang/Math;->min(FF)F

    move-result v3

    iget v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->startY:F

    invoke-static {v0, p2}, Ljava/lang/Math;->min(FF)F

    move-result v4

    iget v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->startX:F

    .line 734
    invoke-static {v0, p1}, Ljava/lang/Math;->max(FF)F

    move-result v5

    iget p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->startY:F

    invoke-static {p1, p2}, Ljava/lang/Math;->max(FF)F

    move-result v6

    iget-object v7, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->paint:Landroid/graphics/Paint;

    .line 733
    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 736
    :cond_6d
    :goto_6d
    invoke-virtual {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->invalidate()V

    .line 737
    return-void
.end method

.method private pickColor(FF)V
    .registers 4

    .line 752
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    invoke-direct {p0, p1}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->clampX(I)I

    move-result p1

    .line 753
    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result p2

    invoke-direct {p0, p2}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->clampY(I)I

    move-result p2

    .line 754
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0, p1, p2}, Landroid/graphics/Bitmap;->getPixel(II)I

    move-result p1

    .line 755
    iput p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->color:I

    .line 756
    iget-object p2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->colorListener:Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView$ColorListener;

    if-eqz p2, :cond_21

    iget-object p2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->colorListener:Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView$ColorListener;

    invoke-interface {p2, p1}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView$ColorListener;->onColorPicked(I)V

    .line 757
    :cond_21
    return-void
.end method

.method private promptText(FF)V
    .registers 6

    .line 760
    new-instance v0, Landroid/widget/EditText;

    invoke-virtual {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 761
    const-string v1, "Text / number"

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 762
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 763
    const-string v2, "Add text"

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 764
    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView$2;

    invoke-direct {v2, p0, v0, p1, p2}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView$2;-><init>(Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;Landroid/widget/EditText;FF)V

    .line 765
    const-string p1, "Place"

    invoke-virtual {v1, p1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    .line 779
    const-string p2, "Cancel"

    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    .line 780
    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 781
    return-void
.end method

.method private pushUndo()V
    .registers 4

    .line 515
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->undo:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->bitmap:Landroid/graphics/Bitmap;

    invoke-static {v1}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->copy(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 516
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->undo:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/16 v1, 0xc

    const/4 v2, 0x0

    if-le v0, v1, :cond_21

    .line 517
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->undo:Ljava/util/ArrayList;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    .line 518
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 520
    :cond_21
    nop

    :goto_22
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->redo:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v2, v0, :cond_38

    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->redo:Ljava/util/ArrayList;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    add-int/lit8 v2, v2, 0x1

    goto :goto_22

    .line 521
    :cond_38
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->redo:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 522
    return-void
.end method

.method private updateDst()V
    .registers 6

    .line 541
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    int-to-float v0, v0

    invoke-direct {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->effectiveScale()F

    move-result v1

    mul-float v0, v0, v1

    .line 542
    iget v1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->viewW:I

    int-to-float v1, v1

    const/high16 v2, 0x40000000

    div-float/2addr v1, v2

    iget v3, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->panX:F

    add-float/2addr v1, v3

    div-float v3, v0, v2

    sub-float/2addr v1, v3

    .line 543
    iget v4, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->viewH:I

    int-to-float v4, v4

    div-float/2addr v4, v2

    iget v2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->panY:F

    add-float/2addr v4, v2

    sub-float/2addr v4, v3

    .line 544
    iget-object v2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->dst:Landroid/graphics/RectF;

    add-float v3, v1, v0

    add-float/2addr v0, v4

    invoke-virtual {v2, v1, v4, v3, v0}, Landroid/graphics/RectF;->set(FFFF)V

    .line 545
    return-void
.end method

.method private viewX(F)F
    .registers 4

    .line 599
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->dst:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->left:F

    invoke-direct {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->effectiveScale()F

    move-result v1

    mul-float p1, p1, v1

    add-float/2addr v0, p1

    return v0
.end method

.method private viewY(F)F
    .registers 4

    .line 603
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->dst:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->top:F

    invoke-direct {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->effectiveScale()F

    move-result v1

    mul-float p1, p1, v1

    add-float/2addr v0, p1

    return v0
.end method


# virtual methods
.method getBitmap()Landroid/graphics/Bitmap;
    .registers 2

    .line 488
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->bitmap:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method getColor()I
    .registers 2

    .line 480
    iget v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->color:I

    return v0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 10

    .line 582
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->checker:Landroid/graphics/Bitmap;

    iget-object v1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->dst:Landroid/graphics/RectF;

    const/4 v2, 0x0

    invoke-virtual {p1, v0, v2, v1, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 583
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->bitmap:Landroid/graphics/Bitmap;

    iget-object v1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->dst:Landroid/graphics/RectF;

    iget-object v3, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->blit:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v2, v1, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 584
    iget-boolean v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->dragging:Z

    if-eqz v0, :cond_af

    iget v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->tool:I

    const/4 v1, 0x4

    const/4 v3, 0x3

    if-eq v0, v3, :cond_1f

    iget v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->tool:I

    if-ne v0, v1, :cond_af

    .line 585
    :cond_1f
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 586
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->paint:Landroid/graphics/Paint;

    iget v2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->color:I

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 587
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->paint:Landroid/graphics/Paint;

    iget v2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->strokeWidth:F

    invoke-direct {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->effectiveScale()F

    move-result v4

    mul-float v2, v2, v4

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 588
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->paint:Landroid/graphics/Paint;

    iget v2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->tool:I

    if-ne v2, v1, :cond_41

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    goto :goto_43

    :cond_41
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    :goto_43
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 589
    iget v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->tool:I

    if-ne v0, v3, :cond_69

    .line 590
    iget v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->startX:F

    invoke-direct {p0, v0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->viewX(F)F

    move-result v2

    iget v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->startY:F

    invoke-direct {p0, v0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->viewY(F)F

    move-result v3

    iget v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->curX:F

    invoke-direct {p0, v0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->viewX(F)F

    move-result v4

    iget v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->curY:F

    invoke-direct {p0, v0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->viewY(F)F

    move-result v5

    iget-object v6, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->paint:Landroid/graphics/Paint;

    move-object v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto :goto_af

    .line 592
    :cond_69
    iget v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->startX:F

    invoke-direct {p0, v0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->viewX(F)F

    move-result v0

    iget v1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->curX:F

    invoke-direct {p0, v1}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->viewX(F)F

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v3

    iget v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->startY:F

    invoke-direct {p0, v0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->viewY(F)F

    move-result v0

    iget v1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->curY:F

    invoke-direct {p0, v1}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->viewY(F)F

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v4

    iget v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->startX:F

    .line 593
    invoke-direct {p0, v0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->viewX(F)F

    move-result v0

    iget v1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->curX:F

    invoke-direct {p0, v1}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->viewX(F)F

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v5

    iget v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->startY:F

    invoke-direct {p0, v0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->viewY(F)F

    move-result v0

    iget v1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->curY:F

    invoke-direct {p0, v1}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->viewY(F)F

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v6

    iget-object v7, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->paint:Landroid/graphics/Paint;

    .line 592
    move-object v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 596
    :cond_af
    :goto_af
    return-void
.end method

.method protected onSizeChanged(IIII)V
    .registers 5

    .line 530
    iput p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->viewW:I

    .line 531
    iput p2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->viewH:I

    .line 532
    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    move-result p1

    int-to-float p1, p1

    iget-object p2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p2

    int-to-float p2, p2

    div-float/2addr p1, p2

    iput p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->fitScale:F

    .line 533
    invoke-direct {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->updateDst()V

    .line 534
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 10

    .line 616
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->scaleDetector:Landroid/view/ScaleGestureDetector;

    invoke-virtual {v0, p1}, Landroid/view/ScaleGestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 617
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    .line 618
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v1

    .line 620
    const/4 v2, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x2

    if-lt v1, v4, :cond_60

    .line 621
    iput-boolean v2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->dragging:Z

    .line 622
    const/4 v5, 0x6

    if-ne v0, v5, :cond_1a

    .line 623
    iput-boolean v2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->multiTouchActive:Z

    .line 624
    return v3

    .line 626
    :cond_1a
    nop

    .line 627
    nop

    .line 628
    const/4 v5, 0x0

    const/4 v6, 0x0

    :goto_1e
    if-ge v2, v1, :cond_2d

    .line 629
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getX(I)F

    move-result v7

    add-float/2addr v5, v7

    .line 630
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getY(I)F

    move-result v7

    add-float/2addr v6, v7

    .line 628
    add-int/lit8 v2, v2, 0x1

    goto :goto_1e

    .line 632
    :cond_2d
    int-to-float p1, v1

    div-float/2addr v5, p1

    .line 633
    div-float/2addr v6, p1

    .line 635
    const/4 p1, 0x5

    if-ne v0, p1, :cond_3a

    .line 636
    iput v5, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->lastMidX:F

    .line 637
    iput v6, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->lastMidY:F

    .line 638
    iput-boolean v3, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->multiTouchActive:Z

    goto :goto_5f

    .line 639
    :cond_3a
    if-ne v0, v4, :cond_5f

    iget-boolean p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->multiTouchActive:Z

    if-eqz p1, :cond_5f

    .line 640
    iget p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->panX:F

    iget v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->lastMidX:F

    sub-float v0, v5, v0

    add-float/2addr p1, v0

    iput p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->panX:F

    .line 641
    iget p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->panY:F

    iget v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->lastMidY:F

    sub-float v0, v6, v0

    add-float/2addr p1, v0

    iput p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->panY:F

    .line 642
    iput v5, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->lastMidX:F

    .line 643
    iput v6, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->lastMidY:F

    .line 644
    invoke-direct {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->clampPan()V

    .line 645
    invoke-direct {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->updateDst()V

    .line 646
    invoke-virtual {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->invalidate()V

    .line 648
    :cond_5f
    :goto_5f
    return v3

    .line 651
    :cond_60
    if-eq v0, v3, :cond_65

    const/4 v1, 0x3

    if-ne v0, v1, :cond_69

    .line 652
    :cond_65
    iput-boolean v2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->multiTouchActive:Z

    .line 653
    iput-boolean v2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->dragging:Z

    .line 656
    :cond_69
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->scaleDetector:Landroid/view/ScaleGestureDetector;

    invoke-virtual {v0}, Landroid/view/ScaleGestureDetector;->isInProgress()Z

    move-result v0

    if-eqz v0, :cond_72

    .line 657
    return v3

    .line 660
    :cond_72
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    invoke-direct {p0, v0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->bmpX(F)F

    move-result v0

    .line 661
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    invoke-direct {p0, v1}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->bmpY(F)F

    move-result v1

    .line 662
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    packed-switch p1, :pswitch_data_98

    .line 673
    return v2

    .line 667
    :pswitch_8a
    invoke-direct {p0, v0, v1}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->onMove(FF)V

    .line 668
    goto :goto_96

    .line 670
    :pswitch_8e
    invoke-direct {p0, v0, v1}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->onUp(FF)V

    .line 671
    goto :goto_96

    .line 664
    :pswitch_92
    invoke-direct {p0, v0, v1}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->onDown(FF)V

    .line 665
    nop

    .line 675
    :goto_96
    return v3

    nop

    :pswitch_data_98
    .packed-switch 0x0
        :pswitch_92
        :pswitch_8e
        :pswitch_8a
    .end packed-switch
.end method

.method redo()V
    .registers 3

    .line 507
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->redo:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_9

    return-void

    .line 508
    :cond_9
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->undo:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->bitmap:Landroid/graphics/Bitmap;

    invoke-static {v1}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->copy(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 509
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->redo:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->redo:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    iput-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->bitmap:Landroid/graphics/Bitmap;

    .line 510
    new-instance v0, Landroid/graphics/Canvas;

    iget-object v1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->bitmap:Landroid/graphics/Bitmap;

    invoke-direct {v0, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    iput-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->bitmapCanvas:Landroid/graphics/Canvas;

    .line 511
    invoke-virtual {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->invalidate()V

    .line 512
    return-void
.end method

.method replaceBitmap(Landroid/graphics/Bitmap;)V
    .registers 4

    .line 492
    invoke-direct {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->pushUndo()V

    .line 493
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isMutable()Z

    move-result v0

    if-eqz v0, :cond_a

    goto :goto_11

    :cond_a
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    move-result-object p1

    :goto_11
    iput-object p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->bitmap:Landroid/graphics/Bitmap;

    .line 494
    new-instance p1, Landroid/graphics/Canvas;

    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->bitmap:Landroid/graphics/Bitmap;

    invoke-direct {p1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    iput-object p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->bitmapCanvas:Landroid/graphics/Canvas;

    .line 495
    invoke-virtual {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->invalidate()V

    .line 496
    return-void
.end method

.method setColor(I)V
    .registers 2

    .line 476
    iput p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->color:I

    .line 477
    return-void
.end method

.method setColorListener(Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView$ColorListener;)V
    .registers 2

    .line 468
    iput-object p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->colorListener:Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView$ColorListener;

    .line 469
    return-void
.end method

.method setStrokeWidth(F)V
    .registers 2

    .line 484
    iput p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->strokeWidth:F

    .line 485
    return-void
.end method

.method setTool(I)V
    .registers 2

    .line 472
    iput p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->tool:I

    .line 473
    return-void
.end method

.method undo()V
    .registers 3

    .line 499
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->undo:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_9

    return-void

    .line 500
    :cond_9
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->redo:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->bitmap:Landroid/graphics/Bitmap;

    invoke-static {v1}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->copy(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 501
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->undo:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->undo:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    iput-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->bitmap:Landroid/graphics/Bitmap;

    .line 502
    new-instance v0, Landroid/graphics/Canvas;

    iget-object v1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->bitmap:Landroid/graphics/Bitmap;

    invoke-direct {v0, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    iput-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->bitmapCanvas:Landroid/graphics/Canvas;

    .line 503
    invoke-virtual {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->invalidate()V

    .line 504
    return-void
.end method
