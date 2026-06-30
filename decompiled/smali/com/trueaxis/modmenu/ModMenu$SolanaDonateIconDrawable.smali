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

    .line 1323
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 1318
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$SolanaDonateIconDrawable;->bar1:Landroid/graphics/Paint;

    .line 1319
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$SolanaDonateIconDrawable;->bar2:Landroid/graphics/Paint;

    .line 1320
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$SolanaDonateIconDrawable;->bar3:Landroid/graphics/Paint;

    .line 1321
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$SolanaDonateIconDrawable;->path:Landroid/graphics/Path;

    .line 1324
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$SolanaDonateIconDrawable;->bar1:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 1325
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$SolanaDonateIconDrawable;->bar1:Landroid/graphics/Paint;

    const/16 v1, 0xa3

    const/4 v2, 0x0

    const/16 v3, 0xff

    invoke-static {v2, v3, v1}, Landroid/graphics/Color;->rgb(III)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 1326
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$SolanaDonateIconDrawable;->bar2:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 1327
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$SolanaDonateIconDrawable;->bar2:Landroid/graphics/Paint;

    const/16 v1, 0x99

    const/16 v2, 0x45

    invoke-static {v1, v2, v3}, Landroid/graphics/Color;->rgb(III)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 1328
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$SolanaDonateIconDrawable;->bar3:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 1329
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$SolanaDonateIconDrawable;->bar3:Landroid/graphics/Paint;

    const/16 v1, 0xdc

    const/16 v2, 0x1f

    invoke-static {v1, v2, v3}, Landroid/graphics/Color;->rgb(III)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 1330
    return-void
.end method

.method private drawBar(Landroid/graphics/Canvas;FFFFFLandroid/graphics/Paint;)V
    .registers 9

    .line 1345
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$SolanaDonateIconDrawable;->path:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 1346
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$SolanaDonateIconDrawable;->path:Landroid/graphics/Path;

    invoke-virtual {v0, p2, p3}, Landroid/graphics/Path;->moveTo(FF)V

    .line 1347
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$SolanaDonateIconDrawable;->path:Landroid/graphics/Path;

    add-float/2addr p4, p2

    sub-float p6, p3, p6

    invoke-virtual {v0, p4, p6}, Landroid/graphics/Path;->lineTo(FF)V

    .line 1348
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$SolanaDonateIconDrawable;->path:Landroid/graphics/Path;

    sub-float/2addr p6, p5

    invoke-virtual {v0, p4, p6}, Landroid/graphics/Path;->lineTo(FF)V

    .line 1349
    iget-object p4, p0, Lcom/trueaxis/modmenu/ModMenu$SolanaDonateIconDrawable;->path:Landroid/graphics/Path;

    sub-float/2addr p3, p5

    invoke-virtual {p4, p2, p3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 1350
    iget-object p2, p0, Lcom/trueaxis/modmenu/ModMenu$SolanaDonateIconDrawable;->path:Landroid/graphics/Path;

    invoke-virtual {p2}, Landroid/graphics/Path;->close()V

    .line 1351
    iget-object p2, p0, Lcom/trueaxis/modmenu/ModMenu$SolanaDonateIconDrawable;->path:Landroid/graphics/Path;

    invoke-virtual {p1, p2, p7}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 1352
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 18

    .line 1333
    move-object/from16 v8, p0

    invoke-virtual/range {p0 .. p0}, Lcom/trueaxis/modmenu/ModMenu$SolanaDonateIconDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    .line 1334
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v1

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    int-to-float v1, v1

    .line 1335
    iget v2, v0, Landroid/graphics/Rect;->left:I

    int-to-float v2, v2

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v3

    int-to-float v3, v3

    sub-float/2addr v3, v1

    const/high16 v4, 0x40000000

    div-float/2addr v3, v4

    add-float v9, v2, v3

    .line 1336
    iget v2, v0, Landroid/graphics/Rect;->top:I

    int-to-float v2, v2

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    int-to-float v0, v0

    sub-float/2addr v0, v1

    div-float/2addr v0, v4

    add-float v10, v2, v0

    .line 1337
    const/high16 v0, 0x41c00000

    div-float v11, v1, v0

    .line 1338
    const/high16 v0, 0x40600000

    mul-float v12, v11, v0

    add-float v2, v9, v12

    const/high16 v0, 0x41600000

    mul-float v0, v0, v11

    add-float v3, v10, v0

    const/high16 v0, 0x41000000

    mul-float v5, v11, v0

    const v0, 0x400ccccd

    mul-float v13, v11, v0

    iget-object v7, v8, Lcom/trueaxis/modmenu/ModMenu$SolanaDonateIconDrawable;->bar1:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move v4, v12

    move v6, v13

    invoke-direct/range {v0 .. v7}, Lcom/trueaxis/modmenu/ModMenu$SolanaDonateIconDrawable;->drawBar(Landroid/graphics/Canvas;FFFFFLandroid/graphics/Paint;)V

    .line 1339
    const/high16 v0, 0x41180000

    mul-float v0, v0, v11

    add-float v2, v9, v0

    const/high16 v0, 0x41400000

    mul-float v14, v11, v0

    add-float v3, v10, v14

    const/high16 v0, 0x41200000

    mul-float v15, v11, v0

    iget-object v7, v8, Lcom/trueaxis/modmenu/ModMenu$SolanaDonateIconDrawable;->bar2:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    move v5, v15

    invoke-direct/range {v0 .. v7}, Lcom/trueaxis/modmenu/ModMenu$SolanaDonateIconDrawable;->drawBar(Landroid/graphics/Canvas;FFFFFLandroid/graphics/Paint;)V

    .line 1340
    const/high16 v0, 0x41780000

    mul-float v11, v11, v0

    add-float v2, v9, v11

    add-float v3, v10, v15

    iget-object v7, v8, Lcom/trueaxis/modmenu/ModMenu$SolanaDonateIconDrawable;->bar3:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    move v5, v14

    invoke-direct/range {v0 .. v7}, Lcom/trueaxis/modmenu/ModMenu$SolanaDonateIconDrawable;->drawBar(Landroid/graphics/Canvas;FFFFFLandroid/graphics/Paint;)V

    .line 1341
    return-void
.end method

.method public getIntrinsicHeight()I
    .registers 2

    .line 1375
    const/16 v0, 0x18

    return v0
.end method

.method public getIntrinsicWidth()I
    .registers 2

    .line 1371
    const/16 v0, 0x18

    return v0
.end method

.method public getOpacity()I
    .registers 2

    .line 1367
    const/4 v0, -0x3

    return v0
.end method

.method public setAlpha(I)V
    .registers 3

    .line 1355
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$SolanaDonateIconDrawable;->bar1:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 1356
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$SolanaDonateIconDrawable;->bar2:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 1357
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$SolanaDonateIconDrawable;->bar3:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 1358
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3

    .line 1361
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$SolanaDonateIconDrawable;->bar1:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 1362
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$SolanaDonateIconDrawable;->bar2:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 1363
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$SolanaDonateIconDrawable;->bar3:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 1364
    return-void
.end method
