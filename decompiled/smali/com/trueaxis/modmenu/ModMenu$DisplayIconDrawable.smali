.class Lcom/trueaxis/modmenu/ModMenu$DisplayIconDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "ModMenu.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trueaxis/modmenu/ModMenu;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DisplayIconDrawable"
.end annotation


# instance fields
.field private final paint:Landroid/graphics/Paint;

.field private final path:Landroid/graphics/Path;


# direct methods
.method constructor <init>(I)V
    .registers 4

    .line 1718
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 1715
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$DisplayIconDrawable;->paint:Landroid/graphics/Paint;

    .line 1716
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$DisplayIconDrawable;->path:Landroid/graphics/Path;

    .line 1719
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$DisplayIconDrawable;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 1720
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$DisplayIconDrawable;->paint:Landroid/graphics/Paint;

    const v1, 0x3fcccccd

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 1721
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$DisplayIconDrawable;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 1722
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$DisplayIconDrawable;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    .line 1723
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$DisplayIconDrawable;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 1724
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 10

    .line 1727
    invoke-virtual {p0}, Lcom/trueaxis/modmenu/ModMenu$DisplayIconDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    .line 1728
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v1

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    int-to-float v1, v1

    .line 1729
    iget v2, v0, Landroid/graphics/Rect;->left:I

    int-to-float v2, v2

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v3

    int-to-float v3, v3

    sub-float/2addr v3, v1

    const/high16 v4, 0x40000000

    div-float/2addr v3, v4

    add-float/2addr v2, v3

    .line 1730
    iget v3, v0, Landroid/graphics/Rect;->top:I

    int-to-float v3, v3

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    int-to-float v0, v0

    sub-float/2addr v0, v1

    div-float/2addr v0, v4

    add-float/2addr v3, v0

    .line 1731
    const/high16 v0, 0x41c00000

    div-float/2addr v1, v0

    .line 1732
    const v0, 0x3fcccccd

    mul-float v0, v0, v1

    .line 1733
    iget-object v4, p0, Lcom/trueaxis/modmenu/ModMenu$DisplayIconDrawable;->paint:Landroid/graphics/Paint;

    invoke-virtual {v4, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 1735
    new-instance v0, Landroid/graphics/RectF;

    const/high16 v4, 0x40400000

    mul-float v4, v4, v1

    add-float/2addr v4, v2

    const/high16 v5, 0x40800000

    mul-float v5, v5, v1

    add-float/2addr v5, v3

    const/high16 v6, 0x41a80000

    mul-float v6, v6, v1

    add-float/2addr v6, v2

    const/high16 v7, 0x41700000

    mul-float v7, v7, v1

    add-float/2addr v7, v3

    invoke-direct {v0, v4, v5, v6, v7}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 1737
    const/high16 v4, 0x3fc00000

    mul-float v4, v4, v1

    iget-object v5, p0, Lcom/trueaxis/modmenu/ModMenu$DisplayIconDrawable;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v4, v4, v5}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 1739
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$DisplayIconDrawable;->path:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 1740
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$DisplayIconDrawable;->path:Landroid/graphics/Path;

    const/high16 v4, 0x41200000

    mul-float v4, v4, v1

    add-float/2addr v4, v2

    invoke-virtual {v0, v4, v7}, Landroid/graphics/Path;->moveTo(FF)V

    .line 1741
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$DisplayIconDrawable;->path:Landroid/graphics/Path;

    const/high16 v4, 0x41000000

    mul-float v4, v4, v1

    add-float/2addr v4, v2

    const/high16 v5, 0x41980000

    mul-float v5, v5, v1

    add-float/2addr v3, v5

    invoke-virtual {v0, v4, v3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 1742
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$DisplayIconDrawable;->path:Landroid/graphics/Path;

    const/high16 v4, 0x41800000

    mul-float v4, v4, v1

    add-float/2addr v4, v2

    invoke-virtual {v0, v4, v3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 1743
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$DisplayIconDrawable;->path:Landroid/graphics/Path;

    const/high16 v4, 0x41600000

    mul-float v4, v4, v1

    add-float/2addr v4, v2

    invoke-virtual {v0, v4, v7}, Landroid/graphics/Path;->lineTo(FF)V

    .line 1744
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$DisplayIconDrawable;->path:Landroid/graphics/Path;

    iget-object v4, p0, Lcom/trueaxis/modmenu/ModMenu$DisplayIconDrawable;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v4}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 1746
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$DisplayIconDrawable;->path:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 1747
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$DisplayIconDrawable;->path:Landroid/graphics/Path;

    const/high16 v4, 0x40e00000

    mul-float v4, v4, v1

    add-float/2addr v4, v2

    invoke-virtual {v0, v4, v3}, Landroid/graphics/Path;->moveTo(FF)V

    .line 1748
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$DisplayIconDrawable;->path:Landroid/graphics/Path;

    const/high16 v4, 0x41880000

    mul-float v1, v1, v4

    add-float/2addr v2, v1

    invoke-virtual {v0, v2, v3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 1749
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$DisplayIconDrawable;->path:Landroid/graphics/Path;

    iget-object v1, p0, Lcom/trueaxis/modmenu/ModMenu$DisplayIconDrawable;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 1750
    return-void
.end method

.method public getIntrinsicHeight()I
    .registers 2

    .line 1769
    const/16 v0, 0x18

    return v0
.end method

.method public getIntrinsicWidth()I
    .registers 2

    .line 1765
    const/16 v0, 0x18

    return v0
.end method

.method public getOpacity()I
    .registers 2

    .line 1761
    const/4 v0, -0x3

    return v0
.end method

.method public setAlpha(I)V
    .registers 3

    .line 1753
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$DisplayIconDrawable;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 1754
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3

    .line 1757
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$DisplayIconDrawable;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 1758
    return-void
.end method
