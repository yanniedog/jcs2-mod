.class Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;
.super Lcom/trueaxis/modmenu/ModMenu$LinkIconDrawable;
.source "ModMenu.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trueaxis/modmenu/ModMenu;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "GitHubIconDrawable"
.end annotation


# direct methods
.method constructor <init>(II)V
    .registers 3

    .line 995
    invoke-direct {p0, p1, p2}, Lcom/trueaxis/modmenu/ModMenu$LinkIconDrawable;-><init>(II)V

    .line 996
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 13

    .line 999
    invoke-virtual {p0}, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    .line 1000
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v1

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    int-to-float v1, v1

    .line 1001
    iget v2, v0, Landroid/graphics/Rect;->left:I

    int-to-float v2, v2

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v3

    int-to-float v3, v3

    sub-float/2addr v3, v1

    const/high16 v4, 0x40000000

    div-float/2addr v3, v4

    add-float/2addr v2, v3

    .line 1002
    iget v3, v0, Landroid/graphics/Rect;->top:I

    int-to-float v3, v3

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    int-to-float v0, v0

    sub-float/2addr v0, v1

    div-float/2addr v0, v4

    add-float/2addr v3, v0

    .line 1003
    const/high16 v0, 0x3f000000

    mul-float v0, v0, v1

    add-float v4, v2, v0

    .line 1004
    add-float/2addr v0, v3

    .line 1006
    iget-object v5, p0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->path:Landroid/graphics/Path;

    invoke-virtual {v5}, Landroid/graphics/Path;->reset()V

    .line 1007
    iget-object v5, p0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->path:Landroid/graphics/Path;

    const v6, 0x3e75c28f

    mul-float v6, v6, v1

    add-float/2addr v6, v2

    const v7, 0x3e99999a

    mul-float v7, v7, v1

    add-float/2addr v7, v3

    invoke-virtual {v5, v6, v7}, Landroid/graphics/Path;->moveTo(FF)V

    .line 1008
    iget-object v5, p0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->path:Landroid/graphics/Path;

    const v6, 0x3e3851ec

    mul-float v6, v6, v1

    add-float/2addr v6, v2

    const v8, 0x3da3d70a

    mul-float v8, v8, v1

    add-float v9, v3, v8

    invoke-virtual {v5, v6, v9}, Landroid/graphics/Path;->lineTo(FF)V

    .line 1009
    iget-object v5, p0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->path:Landroid/graphics/Path;

    const v6, 0x3ec28f5c

    mul-float v6, v6, v1

    add-float/2addr v6, v2

    const v10, 0x3e4ccccd

    mul-float v10, v10, v1

    add-float/2addr v10, v3

    invoke-virtual {v5, v6, v10}, Landroid/graphics/Path;->lineTo(FF)V

    .line 1010
    iget-object v5, p0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->path:Landroid/graphics/Path;

    const v6, 0x3f1eb852

    mul-float v6, v6, v1

    add-float/2addr v6, v2

    invoke-virtual {v5, v6, v10}, Landroid/graphics/Path;->lineTo(FF)V

    .line 1011
    iget-object v5, p0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->path:Landroid/graphics/Path;

    const v6, 0x3f51eb85

    mul-float v6, v6, v1

    add-float/2addr v6, v2

    invoke-virtual {v5, v6, v9}, Landroid/graphics/Path;->lineTo(FF)V

    .line 1012
    iget-object v5, p0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->path:Landroid/graphics/Path;

    const v6, 0x3f428f5c

    mul-float v6, v6, v1

    add-float/2addr v2, v6

    invoke-virtual {v5, v2, v7}, Landroid/graphics/Path;->lineTo(FF)V

    .line 1013
    iget-object v2, p0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->path:Landroid/graphics/Path;

    invoke-virtual {v2}, Landroid/graphics/Path;->close()V

    .line 1014
    iget-object v2, p0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->path:Landroid/graphics/Path;

    iget-object v5, p0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v2, v5}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 1015
    const v2, 0x3eae147b

    mul-float v2, v2, v1

    iget-object v5, p0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v4, v0, v2, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 1016
    new-instance v0, Landroid/graphics/RectF;

    const v2, 0x3e19999a

    mul-float v2, v2, v1

    sub-float v5, v4, v2

    const v6, 0x3f2b851f

    mul-float v6, v6, v1

    add-float/2addr v6, v3

    add-float/2addr v4, v2

    const v2, 0x3f6e147b

    mul-float v1, v1, v2

    add-float/2addr v3, v1

    invoke-direct {v0, v5, v6, v4, v3}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 1018
    iget-object v1, p0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v8, v8, v1}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 1019
    return-void
.end method
