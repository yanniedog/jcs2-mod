.class Lcom/trueaxis/modmenu/ModMenu$BugIconDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "ModMenu.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trueaxis/modmenu/ModMenu;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "BugIconDrawable"
.end annotation


# instance fields
.field private final paint:Landroid/graphics/Paint;

.field private final path:Landroid/graphics/Path;


# direct methods
.method constructor <init>(I)V
    .registers 4

    .line 1908
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 1905
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$BugIconDrawable;->paint:Landroid/graphics/Paint;

    .line 1906
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$BugIconDrawable;->path:Landroid/graphics/Path;

    .line 1909
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$BugIconDrawable;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 1910
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$BugIconDrawable;->paint:Landroid/graphics/Paint;

    const/high16 v1, 0x3fc00000

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 1911
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$BugIconDrawable;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 1912
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$BugIconDrawable;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 1913
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 13

    .line 1916
    invoke-virtual {p0}, Lcom/trueaxis/modmenu/ModMenu$BugIconDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    .line 1917
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v1

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    int-to-float v1, v1

    .line 1918
    iget v2, v0, Landroid/graphics/Rect;->left:I

    int-to-float v2, v2

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v3

    int-to-float v3, v3

    sub-float/2addr v3, v1

    const/high16 v4, 0x40000000

    div-float/2addr v3, v4

    add-float/2addr v2, v3

    .line 1919
    iget v3, v0, Landroid/graphics/Rect;->top:I

    int-to-float v3, v3

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    int-to-float v0, v0

    sub-float/2addr v0, v1

    div-float/2addr v0, v4

    add-float/2addr v3, v0

    .line 1920
    const/high16 v0, 0x41c00000

    div-float/2addr v1, v0

    .line 1921
    const/high16 v0, 0x3fc00000

    mul-float v0, v0, v1

    .line 1922
    iget-object v5, p0, Lcom/trueaxis/modmenu/ModMenu$BugIconDrawable;->paint:Landroid/graphics/Paint;

    invoke-virtual {v5, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 1924
    const/high16 v0, 0x41400000

    mul-float v0, v0, v1

    add-float/2addr v0, v2

    const/high16 v5, 0x41500000

    mul-float v5, v5, v1

    add-float/2addr v5, v3

    const/high16 v6, 0x40900000

    mul-float v6, v6, v1

    iget-object v7, p0, Lcom/trueaxis/modmenu/ModMenu$BugIconDrawable;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v5, v6, v7}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 1925
    const/high16 v5, 0x40d00000

    mul-float v5, v5, v1

    add-float/2addr v5, v3

    const v7, 0x400ccccd

    mul-float v7, v7, v1

    iget-object v8, p0, Lcom/trueaxis/modmenu/ModMenu$BugIconDrawable;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v5, v7, v8}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 1927
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$BugIconDrawable;->path:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 1928
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$BugIconDrawable;->path:Landroid/graphics/Path;

    const/high16 v5, 0x41280000

    mul-float v5, v5, v1

    add-float/2addr v5, v2

    add-float v7, v3, v6

    invoke-virtual {v0, v5, v7}, Landroid/graphics/Path;->moveTo(FF)V

    .line 1929
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$BugIconDrawable;->path:Landroid/graphics/Path;

    const/high16 v5, 0x41100000

    mul-float v5, v5, v1

    add-float v8, v2, v5

    mul-float v4, v4, v1

    add-float/2addr v4, v3

    invoke-virtual {v0, v8, v4}, Landroid/graphics/Path;->lineTo(FF)V

    .line 1930
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$BugIconDrawable;->path:Landroid/graphics/Path;

    const/high16 v8, 0x41580000

    mul-float v8, v8, v1

    add-float v9, v2, v8

    invoke-virtual {v0, v9, v7}, Landroid/graphics/Path;->moveTo(FF)V

    .line 1931
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$BugIconDrawable;->path:Landroid/graphics/Path;

    const/high16 v7, 0x41700000

    mul-float v7, v7, v1

    add-float/2addr v7, v2

    invoke-virtual {v0, v7, v4}, Landroid/graphics/Path;->lineTo(FF)V

    .line 1932
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$BugIconDrawable;->path:Landroid/graphics/Path;

    iget-object v4, p0, Lcom/trueaxis/modmenu/ModMenu$BugIconDrawable;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v4}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 1934
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$BugIconDrawable;->path:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 1935
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$BugIconDrawable;->path:Landroid/graphics/Path;

    const/high16 v4, 0x41000000

    mul-float v4, v4, v1

    add-float/2addr v4, v2

    const/high16 v7, 0x41300000

    mul-float v7, v7, v1

    add-float/2addr v7, v3

    invoke-virtual {v0, v4, v7}, Landroid/graphics/Path;->moveTo(FF)V

    .line 1936
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$BugIconDrawable;->path:Landroid/graphics/Path;

    add-float/2addr v6, v2

    add-float/2addr v5, v3

    invoke-virtual {v0, v6, v5}, Landroid/graphics/Path;->lineTo(FF)V

    .line 1937
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$BugIconDrawable;->path:Landroid/graphics/Path;

    add-float/2addr v8, v3

    invoke-virtual {v0, v4, v8}, Landroid/graphics/Path;->moveTo(FF)V

    .line 1938
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$BugIconDrawable;->path:Landroid/graphics/Path;

    const/high16 v9, 0x40800000

    mul-float v9, v9, v1

    add-float/2addr v9, v2

    invoke-virtual {v0, v9, v8}, Landroid/graphics/Path;->lineTo(FF)V

    .line 1939
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$BugIconDrawable;->path:Landroid/graphics/Path;

    const/high16 v9, 0x41800000

    mul-float v9, v9, v1

    add-float v10, v3, v9

    invoke-virtual {v0, v4, v10}, Landroid/graphics/Path;->moveTo(FF)V

    .line 1940
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$BugIconDrawable;->path:Landroid/graphics/Path;

    const/high16 v4, 0x41900000

    mul-float v4, v4, v1

    add-float/2addr v3, v4

    invoke-virtual {v0, v6, v3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 1941
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$BugIconDrawable;->path:Landroid/graphics/Path;

    add-float/2addr v9, v2

    invoke-virtual {v0, v9, v7}, Landroid/graphics/Path;->moveTo(FF)V

    .line 1942
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$BugIconDrawable;->path:Landroid/graphics/Path;

    const/high16 v4, 0x419c0000

    mul-float v4, v4, v1

    add-float/2addr v4, v2

    invoke-virtual {v0, v4, v5}, Landroid/graphics/Path;->lineTo(FF)V

    .line 1943
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$BugIconDrawable;->path:Landroid/graphics/Path;

    invoke-virtual {v0, v9, v8}, Landroid/graphics/Path;->moveTo(FF)V

    .line 1944
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$BugIconDrawable;->path:Landroid/graphics/Path;

    const/high16 v5, 0x41a00000

    mul-float v1, v1, v5

    add-float/2addr v2, v1

    invoke-virtual {v0, v2, v8}, Landroid/graphics/Path;->lineTo(FF)V

    .line 1945
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$BugIconDrawable;->path:Landroid/graphics/Path;

    invoke-virtual {v0, v9, v10}, Landroid/graphics/Path;->moveTo(FF)V

    .line 1946
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$BugIconDrawable;->path:Landroid/graphics/Path;

    invoke-virtual {v0, v4, v3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 1947
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$BugIconDrawable;->path:Landroid/graphics/Path;

    iget-object v1, p0, Lcom/trueaxis/modmenu/ModMenu$BugIconDrawable;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 1948
    return-void
.end method

.method public getIntrinsicHeight()I
    .registers 2

    .line 1967
    const/16 v0, 0x18

    return v0
.end method

.method public getIntrinsicWidth()I
    .registers 2

    .line 1963
    const/16 v0, 0x18

    return v0
.end method

.method public getOpacity()I
    .registers 2

    .line 1959
    const/4 v0, -0x3

    return v0
.end method

.method public setAlpha(I)V
    .registers 3

    .line 1951
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$BugIconDrawable;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 1952
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3

    .line 1955
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$BugIconDrawable;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 1956
    return-void
.end method
