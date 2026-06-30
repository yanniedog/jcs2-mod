.class Lcom/trueaxis/modmenu/ModMenu$SolanaDonateIconDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "ModMenu.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trueaxis/modmenu/ModMenu;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SolanaDonateIconDrawable"
.end annotation


# instance fields
.field private final bar1:Landroid/graphics/Paint;

.field private final bar2:Landroid/graphics/Paint;

.field private final bar3:Landroid/graphics/Paint;

.field private final path:Landroid/graphics/Path;


# direct methods
.method constructor <init>()V
    .registers 5

    .line 1374
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 1369
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$SolanaDonateIconDrawable;->bar1:Landroid/graphics/Paint;

    .line 1370
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$SolanaDonateIconDrawable;->bar2:Landroid/graphics/Paint;

    .line 1371
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$SolanaDonateIconDrawable;->bar3:Landroid/graphics/Paint;

    .line 1372
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$SolanaDonateIconDrawable;->path:Landroid/graphics/Path;

    .line 1375
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$SolanaDonateIconDrawable;->bar1:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 1376
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$SolanaDonateIconDrawable;->bar1:Landroid/graphics/Paint;

    const/16 v1, 0xa3

    const/4 v2, 0x0

    const/16 v3, 0xff

    invoke-static {v2, v3, v1}, Landroid/graphics/Color;->rgb(III)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 1377
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$SolanaDonateIconDrawable;->bar2:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 1378
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$SolanaDonateIconDrawable;->bar2:Landroid/graphics/Paint;

    const/16 v1, 0x99

    const/16 v2, 0x45

    invoke-static {v1, v2, v3}, Landroid/graphics/Color;->rgb(III)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 1379
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$SolanaDonateIconDrawable;->bar3:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 1380
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$SolanaDonateIconDrawable;->bar3:Landroid/graphics/Paint;

    const/16 v1, 0xdc

    const/16 v2, 0x1f

    invoke-static {v1, v2, v3}, Landroid/graphics/Color;->rgb(III)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 1381
    return-void
.end method

.method private drawSolanaBar(Landroid/graphics/Canvas;FFFFFLandroid/graphics/Paint;)V
    .registers 9

    .line 1397
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$SolanaDonateIconDrawable;->path:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 1398
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$SolanaDonateIconDrawable;->path:Landroid/graphics/Path;

    add-float/2addr p5, p3

    invoke-virtual {v0, p2, p5}, Landroid/graphics/Path;->moveTo(FF)V

    .line 1399
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$SolanaDonateIconDrawable;->path:Landroid/graphics/Path;

    add-float/2addr p6, p2

    invoke-virtual {v0, p6, p3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 1400
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$SolanaDonateIconDrawable;->path:Landroid/graphics/Path;

    add-float/2addr p6, p4

    invoke-virtual {v0, p6, p3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 1401
    iget-object p3, p0, Lcom/trueaxis/modmenu/ModMenu$SolanaDonateIconDrawable;->path:Landroid/graphics/Path;

    add-float/2addr p2, p4

    invoke-virtual {p3, p2, p5}, Landroid/graphics/Path;->lineTo(FF)V

    .line 1402
    iget-object p2, p0, Lcom/trueaxis/modmenu/ModMenu$SolanaDonateIconDrawable;->path:Landroid/graphics/Path;

    invoke-virtual {p2}, Landroid/graphics/Path;->close()V

    .line 1403
    iget-object p2, p0, Lcom/trueaxis/modmenu/ModMenu$SolanaDonateIconDrawable;->path:Landroid/graphics/Path;

    invoke-virtual {p1, p2, p7}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 1404
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 17

    .line 1384
    move-object v8, p0

    invoke-virtual {p0}, Lcom/trueaxis/modmenu/ModMenu$SolanaDonateIconDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    .line 1385
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v1

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    int-to-float v1, v1

    .line 1386
    iget v2, v0, Landroid/graphics/Rect;->left:I

    int-to-float v2, v2

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v3

    int-to-float v3, v3

    sub-float/2addr v3, v1

    const/high16 v4, 0x40000000

    div-float/2addr v3, v4

    add-float v9, v2, v3

    .line 1387
    iget v2, v0, Landroid/graphics/Rect;->top:I

    int-to-float v2, v2

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    int-to-float v0, v0

    sub-float/2addr v0, v1

    div-float/2addr v0, v4

    add-float v10, v2, v0

    .line 1388
    const/high16 v0, 0x41c00000

    div-float v11, v1, v0

    .line 1390
    mul-float v4, v4, v11

    add-float v2, v9, v4

    const/high16 v0, 0x40800000

    mul-float v0, v0, v11

    add-float v3, v10, v0

    const/high16 v0, 0x41500000

    mul-float v12, v11, v0

    const v0, 0x404ccccd

    mul-float v13, v11, v0

    const/high16 v0, 0x40600000

    mul-float v14, v11, v0

    iget-object v7, v8, Lcom/trueaxis/modmenu/ModMenu$SolanaDonateIconDrawable;->bar1:Landroid/graphics/Paint;

    move-object v0, p0

    move-object/from16 v1, p1

    move v4, v12

    move v5, v13

    move v6, v14

    invoke-direct/range {v0 .. v7}, Lcom/trueaxis/modmenu/ModMenu$SolanaDonateIconDrawable;->drawSolanaBar(Landroid/graphics/Canvas;FFFFFLandroid/graphics/Paint;)V

    .line 1391
    const/high16 v0, 0x40b00000

    mul-float v0, v0, v11

    add-float v2, v9, v0

    const/high16 v0, 0x41200000

    mul-float v0, v0, v11

    add-float v3, v10, v0

    iget-object v7, v8, Lcom/trueaxis/modmenu/ModMenu$SolanaDonateIconDrawable;->bar2:Landroid/graphics/Paint;

    move-object v0, p0

    invoke-direct/range {v0 .. v7}, Lcom/trueaxis/modmenu/ModMenu$SolanaDonateIconDrawable;->drawSolanaBar(Landroid/graphics/Canvas;FFFFFLandroid/graphics/Paint;)V

    .line 1392
    const/high16 v0, 0x41100000

    mul-float v0, v0, v11

    add-float v2, v9, v0

    const/high16 v0, 0x41800000

    mul-float v11, v11, v0

    add-float v3, v10, v11

    iget-object v7, v8, Lcom/trueaxis/modmenu/ModMenu$SolanaDonateIconDrawable;->bar3:Landroid/graphics/Paint;

    move-object v0, p0

    invoke-direct/range {v0 .. v7}, Lcom/trueaxis/modmenu/ModMenu$SolanaDonateIconDrawable;->drawSolanaBar(Landroid/graphics/Canvas;FFFFFLandroid/graphics/Paint;)V

    .line 1393
    return-void
.end method

.method public getIntrinsicHeight()I
    .registers 2

    .line 1427
    const/16 v0, 0x18

    return v0
.end method

.method public getIntrinsicWidth()I
    .registers 2

    .line 1423
    const/16 v0, 0x18

    return v0
.end method

.method public getOpacity()I
    .registers 2

    .line 1419
    const/4 v0, -0x3

    return v0
.end method

.method public setAlpha(I)V
    .registers 3

    .line 1407
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$SolanaDonateIconDrawable;->bar1:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 1408
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$SolanaDonateIconDrawable;->bar2:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 1409
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$SolanaDonateIconDrawable;->bar3:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 1410
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3

    .line 1413
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$SolanaDonateIconDrawable;->bar1:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 1414
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$SolanaDonateIconDrawable;->bar2:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 1415
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$SolanaDonateIconDrawable;->bar3:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 1416
    return-void
.end method
