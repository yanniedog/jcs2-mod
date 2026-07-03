.class Lcom/trueaxis/modmenu/ModMenu$DiscordIconDrawable;
.super Lcom/trueaxis/modmenu/ModMenu$LinkIconDrawable;
.source "ModMenu.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trueaxis/modmenu/ModMenu;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DiscordIconDrawable"
.end annotation


# direct methods
.method constructor <init>(II)V
    .registers 3

    .line 1607
    invoke-direct {p0, p1, p2}, Lcom/trueaxis/modmenu/ModMenu$LinkIconDrawable;-><init>(II)V

    .line 1608
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 43

    .line 1611
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual/range {p0 .. p0}, Lcom/trueaxis/modmenu/ModMenu$DiscordIconDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v2

    .line 1612
    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    move-result v3

    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    int-to-float v3, v3

    .line 1613
    iget v4, v2, Landroid/graphics/Rect;->left:I

    int-to-float v4, v4

    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    move-result v5

    int-to-float v5, v5

    sub-float/2addr v5, v3

    const/high16 v6, 0x40000000

    div-float/2addr v5, v6

    add-float/2addr v4, v5

    .line 1614
    iget v5, v2, Landroid/graphics/Rect;->top:I

    int-to-float v5, v5

    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    move-result v2

    int-to-float v2, v2

    sub-float/2addr v2, v3

    div-float/2addr v2, v6

    add-float/2addr v5, v2

    .line 1615
    const/high16 v2, 0x41c00000

    div-float/2addr v3, v2

    .line 1618
    iget-object v2, v0, Lcom/trueaxis/modmenu/ModMenu$DiscordIconDrawable;->path:Landroid/graphics/Path;

    invoke-virtual {v2}, Landroid/graphics/Path;->reset()V

    .line 1619
    iget-object v2, v0, Lcom/trueaxis/modmenu/ModMenu$DiscordIconDrawable;->path:Landroid/graphics/Path;

    const/high16 v6, 0x40800000

    mul-float v6, v6, v3

    add-float v14, v4, v6

    const/high16 v7, 0x40d00000

    mul-float v7, v7, v3

    add-float v15, v5, v7

    invoke-virtual {v2, v14, v15}, Landroid/graphics/Path;->moveTo(FF)V

    .line 1620
    iget-object v2, v0, Lcom/trueaxis/modmenu/ModMenu$DiscordIconDrawable;->path:Landroid/graphics/Path;

    add-float v19, v5, v6

    add-float v10, v4, v7

    const/high16 v6, 0x40200000

    mul-float v6, v6, v3

    add-float v17, v5, v6

    const/high16 v6, 0x41100000

    mul-float v6, v6, v3

    add-float v12, v4, v6

    move-object v7, v2

    move v8, v14

    move/from16 v9, v19

    move/from16 v11, v17

    move/from16 v13, v17

    invoke-virtual/range {v7 .. v13}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 1622
    iget-object v2, v0, Lcom/trueaxis/modmenu/ModMenu$DiscordIconDrawable;->path:Landroid/graphics/Path;

    const/high16 v7, 0x41200000

    mul-float v7, v7, v3

    add-float v21, v4, v7

    const/high16 v7, 0x3fc00000

    mul-float v7, v7, v3

    add-float/2addr v7, v5

    const/high16 v8, 0x41380000

    mul-float v8, v8, v3

    add-float v23, v4, v8

    const/high16 v8, 0x3f800000

    mul-float v8, v8, v3

    add-float/2addr v8, v5

    const/high16 v9, 0x41400000

    mul-float v9, v9, v3

    add-float v27, v4, v9

    move-object/from16 v20, v2

    move/from16 v22, v7

    move/from16 v24, v8

    move/from16 v25, v27

    move/from16 v26, v8

    invoke-virtual/range {v20 .. v26}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 1624
    iget-object v2, v0, Lcom/trueaxis/modmenu/ModMenu$DiscordIconDrawable;->path:Landroid/graphics/Path;

    const/high16 v9, 0x41480000

    mul-float v9, v9, v3

    add-float v21, v4, v9

    const/high16 v10, 0x41600000

    mul-float v10, v10, v3

    add-float v23, v4, v10

    const/high16 v11, 0x41700000

    mul-float v11, v11, v3

    add-float v12, v4, v11

    move-object/from16 v20, v2

    move/from16 v22, v8

    move/from16 v24, v7

    move/from16 v25, v12

    move/from16 v26, v17

    invoke-virtual/range {v20 .. v26}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 1626
    iget-object v2, v0, Lcom/trueaxis/modmenu/ModMenu$DiscordIconDrawable;->path:Landroid/graphics/Path;

    const/high16 v7, 0x418c0000

    mul-float v7, v7, v3

    add-float v16, v4, v7

    const/high16 v7, 0x41a00000

    mul-float v7, v7, v3

    add-float v20, v4, v7

    move v13, v15

    move-object v15, v2

    move/from16 v18, v20

    move/from16 v21, v13

    invoke-virtual/range {v15 .. v21}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 1628
    iget-object v2, v0, Lcom/trueaxis/modmenu/ModMenu$DiscordIconDrawable;->path:Landroid/graphics/Path;

    const/high16 v7, 0x41a80000

    mul-float v7, v7, v3

    add-float v33, v4, v7

    const/high16 v7, 0x41080000

    mul-float v7, v7, v3

    add-float v15, v5, v7

    const/high16 v7, 0x41ac0000

    mul-float v7, v7, v3

    add-float v31, v4, v7

    const/high16 v7, 0x41280000

    mul-float v7, v7, v3

    add-float v16, v5, v7

    add-float v23, v5, v9

    move-object/from16 v28, v2

    move/from16 v29, v33

    move/from16 v30, v15

    move/from16 v32, v16

    move/from16 v34, v23

    invoke-virtual/range {v28 .. v34}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 1630
    iget-object v2, v0, Lcom/trueaxis/modmenu/ModMenu$DiscordIconDrawable;->path:Landroid/graphics/Path;

    const/high16 v7, 0x419c0000

    mul-float v7, v7, v3

    add-float v35, v4, v7

    const/high16 v7, 0x41580000

    mul-float v7, v7, v3

    add-float v8, v5, v7

    const/high16 v9, 0x41900000

    mul-float v9, v9, v3

    add-float v37, v4, v9

    add-float v19, v5, v10

    const/high16 v9, 0x41840000

    mul-float v9, v9, v3

    add-float v39, v4, v9

    move-object/from16 v34, v2

    move/from16 v36, v8

    move/from16 v38, v19

    move/from16 v40, v8

    invoke-virtual/range {v34 .. v40}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 1632
    iget-object v2, v0, Lcom/trueaxis/modmenu/ModMenu$DiscordIconDrawable;->path:Landroid/graphics/Path;

    add-float/2addr v11, v5

    invoke-virtual {v2, v12, v11}, Landroid/graphics/Path;->lineTo(FF)V

    .line 1633
    iget-object v2, v0, Lcom/trueaxis/modmenu/ModMenu$DiscordIconDrawable;->path:Landroid/graphics/Path;

    add-float/2addr v7, v4

    const v9, 0x415ccccd

    mul-float v9, v9, v3

    add-float/2addr v9, v5

    invoke-virtual {v2, v7, v9}, Landroid/graphics/Path;->lineTo(FF)V

    .line 1634
    iget-object v2, v0, Lcom/trueaxis/modmenu/ModMenu$DiscordIconDrawable;->path:Landroid/graphics/Path;

    const v7, 0x414e6666

    mul-float v7, v7, v3

    add-float v25, v4, v7

    const v7, 0x4131999a

    mul-float v7, v7, v3

    add-float v29, v4, v7

    move-object/from16 v24, v2

    move/from16 v26, v19

    move/from16 v28, v19

    move/from16 v30, v9

    invoke-virtual/range {v24 .. v30}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 1636
    iget-object v2, v0, Lcom/trueaxis/modmenu/ModMenu$DiscordIconDrawable;->path:Landroid/graphics/Path;

    const v7, 0x4119999a

    mul-float v7, v7, v3

    add-float/2addr v7, v4

    invoke-virtual {v2, v7, v11}, Landroid/graphics/Path;->lineTo(FF)V

    .line 1637
    iget-object v2, v0, Lcom/trueaxis/modmenu/ModMenu$DiscordIconDrawable;->path:Landroid/graphics/Path;

    const v7, 0x4101999a

    mul-float v7, v7, v3

    add-float/2addr v7, v4

    invoke-virtual {v2, v7, v8}, Landroid/graphics/Path;->lineTo(FF)V

    .line 1638
    iget-object v2, v0, Lcom/trueaxis/modmenu/ModMenu$DiscordIconDrawable;->path:Landroid/graphics/Path;

    const v7, 0x40d33333

    mul-float v7, v7, v3

    add-float v18, v4, v7

    const v7, 0x40a33333

    mul-float v7, v7, v3

    add-float v20, v4, v7

    const v7, 0x40666666

    mul-float v7, v7, v3

    add-float v10, v4, v7

    move-object/from16 v17, v2

    move/from16 v21, v8

    move/from16 v22, v10

    invoke-virtual/range {v17 .. v23}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 1640
    iget-object v7, v0, Lcom/trueaxis/modmenu/ModMenu$DiscordIconDrawable;->path:Landroid/graphics/Path;

    const v2, 0x40466666

    mul-float v2, v2, v3

    add-float v8, v4, v2

    move/from16 v9, v16

    move v11, v15

    move v12, v14

    invoke-virtual/range {v7 .. v13}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 1642
    iget-object v2, v0, Lcom/trueaxis/modmenu/ModMenu$DiscordIconDrawable;->path:Landroid/graphics/Path;

    invoke-virtual {v2}, Landroid/graphics/Path;->close()V

    .line 1643
    iget-object v2, v0, Lcom/trueaxis/modmenu/ModMenu$DiscordIconDrawable;->path:Landroid/graphics/Path;

    iget-object v7, v0, Lcom/trueaxis/modmenu/ModMenu$DiscordIconDrawable;->paint:Landroid/graphics/Paint;

    invoke-virtual {v1, v2, v7}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 1644
    const v2, 0x410ccccd

    mul-float v2, v2, v3

    add-float/2addr v2, v4

    add-float/2addr v5, v6

    const v6, 0x3fcccccd

    mul-float v6, v6, v3

    iget-object v7, v0, Lcom/trueaxis/modmenu/ModMenu$DiscordIconDrawable;->cutout:Landroid/graphics/Paint;

    invoke-virtual {v1, v2, v5, v6, v7}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 1645
    const v2, 0x41733333

    mul-float v3, v3, v2

    add-float/2addr v4, v3

    iget-object v2, v0, Lcom/trueaxis/modmenu/ModMenu$DiscordIconDrawable;->cutout:Landroid/graphics/Paint;

    invoke-virtual {v1, v4, v5, v6, v2}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 1646
    return-void
.end method
