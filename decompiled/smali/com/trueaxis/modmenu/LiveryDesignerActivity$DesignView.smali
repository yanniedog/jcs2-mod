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

.field private final paint:Landroid/graphics/Paint;

.field private final redo:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field private scale:F

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


# direct methods
.method constructor <init>(Landroid/content/Context;Landroid/graphics/Bitmap;)V
    .registers 5

    .line 431
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 411
    new-instance p1, Landroid/graphics/Paint;

    const/4 v0, 0x1

    invoke-direct {p1, v0}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->paint:Landroid/graphics/Paint;

    .line 412
    new-instance p1, Landroid/graphics/Paint;

    const/4 v1, 0x2

    invoke-direct {p1, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->blit:Landroid/graphics/Paint;

    .line 413
    new-instance p1, Landroid/graphics/PorterDuffXfermode;

    sget-object v1, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {p1, v1}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    iput-object p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->clear:Landroid/graphics/PorterDuffXfermode;

    .line 415
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->undo:Ljava/util/ArrayList;

    .line 416
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->redo:Ljava/util/ArrayList;

    .line 419
    const/4 p1, 0x0

    iput p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->tool:I

    .line 420
    const/high16 p1, -0x10000

    iput p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->color:I

    .line 421
    const/high16 p1, 0x41200000    # 10.0f

    iput p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->strokeWidth:F

    .line 423
    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->dst:Landroid/graphics/RectF;

    .line 424
    const/high16 p1, 0x3f800000    # 1.0f

    iput p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->scale:F

    .line 425
    new-instance p1, Landroid/graphics/Path;

    invoke-direct {p1}, Landroid/graphics/Path;-><init>()V

    iput-object p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->stroke:Landroid/graphics/Path;

    .line 432
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->isMutable()Z

    move-result p1

    if-eqz p1, :cond_4e

    goto :goto_54

    .line 433
    :cond_4e
    sget-object p1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-virtual {p2, p1, v0}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    move-result-object p2

    :goto_54
    iput-object p2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->bitmap:Landroid/graphics/Bitmap;

    .line 434
    new-instance p1, Landroid/graphics/Canvas;

    iget-object p2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->bitmap:Landroid/graphics/Bitmap;

    invoke-direct {p1, p2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    iput-object p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->bitmapCanvas:Landroid/graphics/Canvas;

    .line 435
    iget-object p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->paint:Landroid/graphics/Paint;

    sget-object p2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 436
    iget-object p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->paint:Landroid/graphics/Paint;

    sget-object p2, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 437
    iget-object p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->paint:Landroid/graphics/Paint;

    sget-object p2, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    .line 438
    invoke-direct {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->makeChecker()Landroid/graphics/Bitmap;

    move-result-object p1

    iput-object p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->checker:Landroid/graphics/Bitmap;

    .line 439
    return-void
.end method

.method static synthetic access$1000(Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;)I
    .registers 1

    .line 401
    iget p0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->color:I

    return p0
.end method

.method static synthetic access$1100(Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;)F
    .registers 1

    .line 401
    iget p0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->strokeWidth:F

    return p0
.end method

.method static synthetic access$1200(Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;)Landroid/graphics/Canvas;
    .registers 1

    .line 401
    iget-object p0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->bitmapCanvas:Landroid/graphics/Canvas;

    return-object p0
.end method

.method static synthetic access$900(Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;)V
    .registers 1

    .line 401
    invoke-direct {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->pushUndo()V

    return-void
.end method

.method private applyStrokePaint()V
    .registers 3

    .line 627
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->paint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->strokeWidth:F

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 628
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 629
    iget v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->tool:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_21

    .line 630
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->paint:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->clear:Landroid/graphics/PorterDuffXfermode;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 631
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->paint:Landroid/graphics/Paint;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    goto :goto_2e

    .line 633
    :cond_21
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->paint:Landroid/graphics/Paint;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 634
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->paint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->color:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 636
    :goto_2e
    return-void
.end method

.method private bmpX(F)F
    .registers 3

    .line 538
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->dst:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->left:F

    sub-float/2addr p1, v0

    iget v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->scale:F

    div-float/2addr p1, v0

    return p1
.end method

.method private bmpY(F)F
    .registers 3

    .line 542
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->dst:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->top:F

    sub-float/2addr p1, v0

    iget v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->scale:F

    div-float/2addr p1, v0

    return p1
.end method

.method private clampX(I)I
    .registers 3

    .line 671
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

    .line 675
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

    .line 499
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0
.end method

.method private floodFill(III)V
    .registers 16

    .line 680
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    .line 681
    iget-object v1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v9

    .line 682
    if-ltz p1, :cond_92

    if-ltz p2, :cond_92

    if-ge p1, v0, :cond_92

    if-lt p2, v9, :cond_16

    goto/16 :goto_92

    .line 683
    :cond_16
    mul-int v10, v0, v9

    new-array v11, v10, [I

    .line 684
    iget-object v1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->bitmap:Landroid/graphics/Bitmap;

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v3, 0x0

    move-object v2, v11

    move v4, v0

    move v7, v0

    move v8, v9

    invoke-virtual/range {v1 .. v8}, Landroid/graphics/Bitmap;->getPixels([IIIIIII)V

    .line 685
    mul-int p2, p2, v0

    add-int/2addr p2, p1

    aget p1, v11, p2

    .line 686
    if-ne p1, p3, :cond_2e

    return-void

    .line 687
    :cond_2e
    new-array v1, v10, [I

    .line 688
    nop

    .line 689
    const/4 v2, 0x0

    aput p2, v1, v2

    const/4 p2, 0x1

    const/4 v2, 0x1

    .line 690
    :goto_36
    if-lez v2, :cond_85

    .line 691
    add-int/lit8 v2, v2, -0x1

    aget v3, v1, v2

    .line 692
    aget v4, v11, v3

    if-eq v4, p1, :cond_41

    goto :goto_36

    .line 693
    :cond_41
    rem-int v4, v3, v0

    .line 694
    nop

    .line 695
    nop

    .line 696
    sub-int/2addr v3, v4

    move v5, v4

    .line 697
    :goto_47
    if-lez v5, :cond_53

    add-int v6, v3, v5

    sub-int/2addr v6, p2

    aget v6, v11, v6

    if-ne v6, p1, :cond_53

    add-int/lit8 v5, v5, -0x1

    goto :goto_47

    .line 698
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

    .line 699
    :cond_61
    nop

    :goto_62
    if-gt v5, v4, :cond_84

    .line 700
    add-int v6, v3, v5

    .line 701
    aput p3, v11, v6

    .line 702
    sub-int v7, v6, v0

    if-ltz v7, :cond_75

    aget v8, v11, v7

    if-ne v8, p1, :cond_75

    add-int/lit8 v8, v2, 0x1

    aput v7, v1, v2

    move v2, v8

    .line 703
    :cond_75
    add-int/2addr v6, v0

    if-ge v6, v10, :cond_81

    aget v7, v11, v6

    if-ne v7, p1, :cond_81

    add-int/lit8 v7, v2, 0x1

    aput v6, v1, v2

    move v2, v7

    .line 699
    :cond_81
    add-int/lit8 v5, v5, 0x1

    goto :goto_62

    .line 705
    :cond_84
    goto :goto_36

    .line 706
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

    .line 707
    return-void

    .line 682
    :cond_92
    :goto_92
    return-void
.end method

.method private makeChecker()Landroid/graphics/Bitmap;
    .registers 12

    .line 710
    nop

    .line 711
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    const/16 v1, 0x20

    invoke-static {v1, v1, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 712
    new-instance v8, Landroid/graphics/Canvas;

    invoke-direct {v8, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 713
    new-instance v9, Landroid/graphics/Paint;

    invoke-direct {v9}, Landroid/graphics/Paint;-><init>()V

    .line 714
    const/16 v2, 0x4c

    const/16 v3, 0x54

    const/16 v4, 0x46

    invoke-static {v4, v2, v3}, Landroid/graphics/Color;->rgb(III)I

    move-result v2

    invoke-virtual {v9, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 715
    int-to-float v1, v1

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v2, v8

    move v5, v1

    move v6, v1

    move-object v7, v9

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 716
    const/16 v2, 0x3c

    const/16 v3, 0x44

    const/16 v4, 0x36

    invoke-static {v4, v2, v3}, Landroid/graphics/Color;->rgb(III)I

    move-result v2

    invoke-virtual {v9, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 717
    const/16 v2, 0x10

    int-to-float v10, v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v2, v8

    move v5, v10

    move v6, v10

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 718
    move v3, v10

    move v4, v10

    move v5, v1

    move v6, v1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 719
    return-object v0
.end method

.method private onDown(FF)V
    .registers 5

    .line 566
    iput p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->curX:F

    iput p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->startX:F

    .line 567
    iput p2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->curY:F

    iput p2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->startY:F

    .line 568
    iget v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->tool:I

    const/4 v1, 0x5

    if-ne v0, v1, :cond_11

    .line 569
    invoke-direct {p0, p1, p2}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->pickColor(FF)V

    .line 570
    return-void

    .line 572
    :cond_11
    iget v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->tool:I

    const/4 v1, 0x6

    if-ne v0, v1, :cond_1a

    .line 573
    invoke-direct {p0, p1, p2}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->promptText(FF)V

    .line 574
    return-void

    .line 576
    :cond_1a
    iget v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->tool:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_33

    .line 577
    invoke-direct {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->pushUndo()V

    .line 578
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result p2

    iget v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->color:I

    invoke-direct {p0, p1, p2, v0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->floodFill(III)V

    .line 579
    invoke-virtual {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->invalidate()V

    .line 580
    return-void

    .line 582
    :cond_33
    invoke-direct {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->pushUndo()V

    .line 583
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->dragging:Z

    .line 584
    iget v1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->tool:I

    if-eqz v1, :cond_41

    iget v1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->tool:I

    if-ne v1, v0, :cond_58

    .line 585
    :cond_41
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->stroke:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 586
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->stroke:Landroid/graphics/Path;

    invoke-virtual {v0, p1, p2}, Landroid/graphics/Path;->moveTo(FF)V

    .line 587
    invoke-direct {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->applyStrokePaint()V

    .line 588
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->bitmapCanvas:Landroid/graphics/Canvas;

    iget-object v1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1, p2, v1}, Landroid/graphics/Canvas;->drawPoint(FFLandroid/graphics/Paint;)V

    .line 589
    invoke-virtual {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->invalidate()V

    .line 591
    :cond_58
    return-void
.end method

.method private onMove(FF)V
    .registers 11

    .line 594
    iget-boolean v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->dragging:Z

    if-nez v0, :cond_5

    return-void

    .line 595
    :cond_5
    iput p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->curX:F

    .line 596
    iput p2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->curY:F

    .line 597
    iget v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->tool:I

    if-eqz v0, :cond_12

    iget v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->tool:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_26

    .line 598
    :cond_12
    invoke-direct {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->applyStrokePaint()V

    .line 599
    iget-object v2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->bitmapCanvas:Landroid/graphics/Canvas;

    iget v3, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->startX:F

    iget v4, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->startY:F

    iget-object v7, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->paint:Landroid/graphics/Paint;

    move v5, p1

    move v6, p2

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 600
    iput p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->startX:F

    .line 601
    iput p2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->startY:F

    .line 603
    :cond_26
    invoke-virtual {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->invalidate()V

    .line 604
    return-void
.end method

.method private onUp(FF)V
    .registers 11

    .line 607
    iget-boolean v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->dragging:Z

    if-nez v0, :cond_5

    return-void

    .line 608
    :cond_5
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->dragging:Z

    .line 610
    iget v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->tool:I

    const/4 v1, 0x3

    const/4 v2, 0x0

    if-ne v0, v1, :cond_36

    .line 611
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 612
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->paint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->color:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 613
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->paint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->strokeWidth:F

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 614
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 615
    iget-object v2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->bitmapCanvas:Landroid/graphics/Canvas;

    iget v3, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->startX:F

    iget v4, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->startY:F

    iget-object v7, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->paint:Landroid/graphics/Paint;

    move v5, p1

    move v6, p2

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto :goto_6d

    .line 616
    :cond_36
    iget v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->tool:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_6d

    .line 617
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 618
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->paint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->color:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 619
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 620
    iget-object v2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->bitmapCanvas:Landroid/graphics/Canvas;

    iget v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->startX:F

    invoke-static {v0, p1}, Ljava/lang/Math;->min(FF)F

    move-result v3

    iget v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->startY:F

    invoke-static {v0, p2}, Ljava/lang/Math;->min(FF)F

    move-result v4

    iget v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->startX:F

    .line 621
    invoke-static {v0, p1}, Ljava/lang/Math;->max(FF)F

    move-result v5

    iget p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->startY:F

    invoke-static {p1, p2}, Ljava/lang/Math;->max(FF)F

    move-result v6

    iget-object v7, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->paint:Landroid/graphics/Paint;

    .line 620
    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 623
    :cond_6d
    :goto_6d
    invoke-virtual {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->invalidate()V

    .line 624
    return-void
.end method

.method private pickColor(FF)V
    .registers 4

    .line 639
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    invoke-direct {p0, p1}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->clampX(I)I

    move-result p1

    .line 640
    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result p2

    invoke-direct {p0, p2}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->clampY(I)I

    move-result p2

    .line 641
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0, p1, p2}, Landroid/graphics/Bitmap;->getPixel(II)I

    move-result p1

    .line 642
    iput p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->color:I

    .line 643
    iget-object p2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->colorListener:Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView$ColorListener;

    if-eqz p2, :cond_21

    iget-object p2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->colorListener:Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView$ColorListener;

    invoke-interface {p2, p1}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView$ColorListener;->onColorPicked(I)V

    .line 644
    :cond_21
    return-void
.end method

.method private promptText(FF)V
    .registers 6

    .line 647
    new-instance v0, Landroid/widget/EditText;

    invoke-virtual {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 648
    const-string v1, "Text / number"

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 649
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 650
    const-string v2, "Add text"

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 651
    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView$1;

    invoke-direct {v2, p0, v0, p1, p2}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView$1;-><init>(Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;Landroid/widget/EditText;FF)V

    .line 652
    const-string p1, "Place"

    invoke-virtual {v1, p1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    .line 666
    const-string p2, "Cancel"

    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    .line 667
    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 668
    return-void
.end method

.method private pushUndo()V
    .registers 4

    .line 489
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->undo:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->bitmap:Landroid/graphics/Bitmap;

    invoke-static {v1}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->copy(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 490
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->undo:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/16 v1, 0xc

    const/4 v2, 0x0

    if-le v0, v1, :cond_21

    .line 491
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->undo:Ljava/util/ArrayList;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    .line 492
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 494
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

    .line 495
    :cond_38
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->redo:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 496
    return-void
.end method

.method private viewX(F)F
    .registers 4

    .line 530
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->dst:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->left:F

    iget v1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->scale:F

    mul-float p1, p1, v1

    add-float/2addr v0, p1

    return v0
.end method

.method private viewY(F)F
    .registers 4

    .line 534
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->dst:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->top:F

    iget v1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->scale:F

    mul-float p1, p1, v1

    add-float/2addr v0, p1

    return v0
.end method


# virtual methods
.method getBitmap()Landroid/graphics/Bitmap;
    .registers 2

    .line 462
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->bitmap:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method getColor()I
    .registers 2

    .line 454
    iget v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->color:I

    return v0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 10

    .line 513
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->checker:Landroid/graphics/Bitmap;

    iget-object v1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->dst:Landroid/graphics/RectF;

    const/4 v2, 0x0

    invoke-virtual {p1, v0, v2, v1, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 514
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->bitmap:Landroid/graphics/Bitmap;

    iget-object v1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->dst:Landroid/graphics/RectF;

    iget-object v3, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->blit:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v2, v1, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 515
    iget-boolean v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->dragging:Z

    if-eqz v0, :cond_ad

    iget v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->tool:I

    const/4 v1, 0x4

    const/4 v3, 0x3

    if-eq v0, v3, :cond_1f

    iget v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->tool:I

    if-ne v0, v1, :cond_ad

    .line 516
    :cond_1f
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 517
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->paint:Landroid/graphics/Paint;

    iget v2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->color:I

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 518
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->paint:Landroid/graphics/Paint;

    iget v2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->strokeWidth:F

    iget v4, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->scale:F

    mul-float v2, v2, v4

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 519
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->paint:Landroid/graphics/Paint;

    iget v2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->tool:I

    if-ne v2, v1, :cond_3f

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    goto :goto_41

    :cond_3f
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    :goto_41
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 520
    iget v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->tool:I

    if-ne v0, v3, :cond_67

    .line 521
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

    goto :goto_ad

    .line 523
    :cond_67
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

    .line 524
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

    .line 523
    move-object v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 527
    :cond_ad
    :goto_ad
    return-void
.end method

.method protected onSizeChanged(IIII)V
    .registers 6

    .line 504
    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    move-result p3

    int-to-float p3, p3

    .line 505
    iget-object p4, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {p4}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p4

    int-to-float p4, p4

    div-float p4, p3, p4

    iput p4, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->scale:F

    .line 506
    int-to-float p1, p1

    sub-float/2addr p1, p3

    const/high16 p4, 0x40000000    # 2.0f

    div-float/2addr p1, p4

    .line 507
    int-to-float p2, p2

    sub-float/2addr p2, p3

    div-float/2addr p2, p4

    .line 508
    iget-object p4, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->dst:Landroid/graphics/RectF;

    add-float v0, p1, p3

    add-float/2addr p3, p2

    invoke-virtual {p4, p1, p2, v0, p3}, Landroid/graphics/RectF;->set(FFFF)V

    .line 509
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 4

    .line 547
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    invoke-direct {p0, v0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->bmpX(F)F

    move-result v0

    .line 548
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    invoke-direct {p0, v1}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->bmpY(F)F

    move-result v1

    .line 549
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    packed-switch p1, :pswitch_data_28

    .line 560
    const/4 p1, 0x0

    return p1

    .line 554
    :pswitch_19
    invoke-direct {p0, v0, v1}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->onMove(FF)V

    .line 555
    goto :goto_25

    .line 557
    :pswitch_1d
    invoke-direct {p0, v0, v1}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->onUp(FF)V

    .line 558
    goto :goto_25

    .line 551
    :pswitch_21
    invoke-direct {p0, v0, v1}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->onDown(FF)V

    .line 552
    nop

    .line 562
    :goto_25
    const/4 p1, 0x1

    return p1

    nop

    :pswitch_data_28
    .packed-switch 0x0
        :pswitch_21
        :pswitch_1d
        :pswitch_19
    .end packed-switch
.end method

.method redo()V
    .registers 3

    .line 481
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->redo:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_9

    return-void

    .line 482
    :cond_9
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->undo:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->bitmap:Landroid/graphics/Bitmap;

    invoke-static {v1}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->copy(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 483
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->redo:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->redo:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    iput-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->bitmap:Landroid/graphics/Bitmap;

    .line 484
    new-instance v0, Landroid/graphics/Canvas;

    iget-object v1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->bitmap:Landroid/graphics/Bitmap;

    invoke-direct {v0, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    iput-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->bitmapCanvas:Landroid/graphics/Canvas;

    .line 485
    invoke-virtual {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->invalidate()V

    .line 486
    return-void
.end method

.method replaceBitmap(Landroid/graphics/Bitmap;)V
    .registers 4

    .line 466
    invoke-direct {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->pushUndo()V

    .line 467
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

    .line 468
    new-instance p1, Landroid/graphics/Canvas;

    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->bitmap:Landroid/graphics/Bitmap;

    invoke-direct {p1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    iput-object p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->bitmapCanvas:Landroid/graphics/Canvas;

    .line 469
    invoke-virtual {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->invalidate()V

    .line 470
    return-void
.end method

.method setColor(I)V
    .registers 2

    .line 450
    iput p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->color:I

    .line 451
    return-void
.end method

.method setColorListener(Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView$ColorListener;)V
    .registers 2

    .line 442
    iput-object p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->colorListener:Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView$ColorListener;

    .line 443
    return-void
.end method

.method setStrokeWidth(F)V
    .registers 2

    .line 458
    iput p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->strokeWidth:F

    .line 459
    return-void
.end method

.method setTool(I)V
    .registers 2

    .line 446
    iput p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->tool:I

    .line 447
    return-void
.end method

.method undo()V
    .registers 3

    .line 473
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->undo:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_9

    return-void

    .line 474
    :cond_9
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->redo:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->bitmap:Landroid/graphics/Bitmap;

    invoke-static {v1}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->copy(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 475
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->undo:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->undo:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    iput-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->bitmap:Landroid/graphics/Bitmap;

    .line 476
    new-instance v0, Landroid/graphics/Canvas;

    iget-object v1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->bitmap:Landroid/graphics/Bitmap;

    invoke-direct {v0, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    iput-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->bitmapCanvas:Landroid/graphics/Canvas;

    .line 477
    invoke-virtual {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->invalidate()V

    .line 478
    return-void
.end method
