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

    .line 1547
    invoke-direct {p0, p1, p2}, Lcom/trueaxis/modmenu/ModMenu$LinkIconDrawable;-><init>(II)V

    .line 1548
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 69

    .line 1551
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual/range {p0 .. p0}, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v2

    .line 1552
    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    move-result v3

    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    int-to-float v3, v3

    .line 1553
    iget v4, v2, Landroid/graphics/Rect;->left:I

    int-to-float v4, v4

    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    move-result v5

    int-to-float v5, v5

    sub-float/2addr v5, v3

    const/high16 v6, 0x40000000

    div-float/2addr v5, v6

    add-float/2addr v4, v5

    .line 1554
    iget v5, v2, Landroid/graphics/Rect;->top:I

    int-to-float v5, v5

    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    move-result v2

    int-to-float v2, v2

    sub-float/2addr v2, v3

    div-float/2addr v2, v6

    add-float/2addr v5, v2

    .line 1555
    const/high16 v2, 0x41c00000

    div-float/2addr v3, v2

    .line 1558
    iget-object v2, v0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->path:Landroid/graphics/Path;

    invoke-virtual {v2}, Landroid/graphics/Path;->reset()V

    .line 1559
    iget-object v2, v0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->path:Landroid/graphics/Path;

    const/high16 v7, 0x41400000

    mul-float v7, v7, v3

    add-float/2addr v7, v4

    const v8, 0x400ccccd

    mul-float v8, v8, v3

    add-float/2addr v8, v5

    invoke-virtual {v2, v7, v8}, Landroid/graphics/Path;->moveTo(FF)V

    .line 1560
    iget-object v9, v0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->path:Landroid/graphics/Path;

    const/high16 v2, 0x41000000

    mul-float v2, v2, v3

    add-float v10, v4, v2

    const v11, 0x4099999a

    mul-float v11, v11, v3

    add-float v12, v4, v11

    const/high16 v11, 0x40900000

    mul-float v11, v11, v3

    add-float v15, v5, v11

    const v11, 0x40733333

    mul-float v11, v11, v3

    add-float v14, v4, v11

    add-float v22, v5, v2

    move v11, v8

    move v13, v15

    move v2, v15

    move/from16 v15, v22

    invoke-virtual/range {v9 .. v15}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 1562
    iget-object v15, v0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->path:Landroid/graphics/Path;

    mul-float v6, v6, v3

    add-float v16, v4, v6

    const v6, 0x4104cccd

    mul-float v6, v6, v3

    add-float/2addr v6, v5

    const v9, 0x3f4ccccd

    mul-float v9, v9, v3

    add-float v18, v4, v9

    const/high16 v9, 0x41100000

    mul-float v9, v9, v3

    add-float v23, v5, v9

    const/high16 v10, 0x3f000000

    mul-float v10, v10, v3

    add-float v25, v4, v10

    const/high16 v10, 0x41200000

    mul-float v10, v10, v3

    add-float v32, v5, v10

    move/from16 v17, v6

    move/from16 v19, v23

    move/from16 v20, v25

    move/from16 v21, v32

    invoke-virtual/range {v15 .. v21}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 1564
    iget-object v10, v0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->path:Landroid/graphics/Path;

    const/high16 v11, 0x41480000

    mul-float v11, v11, v3

    add-float v15, v5, v11

    const/high16 v11, 0x40200000

    mul-float v11, v11, v3

    add-float v27, v4, v11

    const v11, 0x416ccccd

    mul-float v11, v11, v3

    add-float v16, v5, v11

    const v11, 0x40a66666

    mul-float v11, v11, v3

    add-float v29, v4, v11

    const/high16 v11, 0x41700000

    mul-float v17, v3, v11

    add-float v39, v5, v17

    move-object/from16 v24, v10

    move/from16 v26, v15

    move/from16 v28, v16

    move/from16 v30, v39

    invoke-virtual/range {v24 .. v30}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 1566
    iget-object v10, v0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->path:Landroid/graphics/Path;

    const v11, 0x40b9999a

    mul-float v11, v11, v3

    add-float v41, v4, v11

    const/high16 v11, 0x41800000

    mul-float v24, v3, v11

    add-float v37, v5, v24

    const v11, 0x40d9999a

    mul-float v11, v11, v3

    add-float v43, v4, v11

    const/high16 v11, 0x41880000

    mul-float v18, v3, v11

    add-float v35, v5, v18

    const v11, 0x41033333

    mul-float v11, v11, v3

    add-float v45, v4, v11

    const/high16 v11, 0x418c0000

    mul-float v11, v11, v3

    add-float v31, v5, v11

    move-object/from16 v40, v10

    move/from16 v42, v37

    move/from16 v44, v35

    move/from16 v46, v31

    invoke-virtual/range {v40 .. v46}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 1568
    iget-object v10, v0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->path:Landroid/graphics/Path;

    const v11, 0x40f9999a

    mul-float v11, v11, v3

    add-float v47, v4, v11

    const v11, 0x4191999a

    mul-float v19, v3, v11

    add-float v29, v5, v19

    const/high16 v11, 0x40e00000

    mul-float v11, v11, v3

    add-float v49, v4, v11

    const/high16 v11, 0x41980000

    mul-float v40, v3, v11

    add-float v27, v5, v40

    const/high16 v11, 0x40c00000

    mul-float v11, v11, v3

    add-float v51, v4, v11

    const/high16 v11, 0x419c0000

    mul-float v11, v11, v3

    add-float v58, v5, v11

    move-object/from16 v46, v10

    move/from16 v48, v29

    move/from16 v50, v27

    move/from16 v52, v58

    invoke-virtual/range {v46 .. v52}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 1570
    iget-object v10, v0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->path:Landroid/graphics/Path;

    const/high16 v11, 0x40f00000

    mul-float v11, v11, v3

    add-float v14, v4, v11

    const v11, 0x419e6666

    mul-float v11, v11, v3

    add-float v56, v5, v11

    add-float v62, v4, v9

    const v9, 0x4199999a

    mul-float v41, v3, v9

    add-float v54, v5, v41

    const v9, 0x41233333

    mul-float v9, v9, v3

    add-float v64, v4, v9

    const/high16 v9, 0x41940000

    mul-float v9, v9, v3

    add-float v48, v5, v9

    move-object/from16 v59, v10

    move/from16 v60, v14

    move/from16 v61, v56

    move/from16 v63, v54

    move/from16 v65, v48

    invoke-virtual/range {v59 .. v65}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 1572
    iget-object v9, v0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->path:Landroid/graphics/Path;

    const/high16 v10, 0x41300000

    mul-float v10, v10, v3

    add-float/2addr v10, v4

    const v11, 0x4195999a

    mul-float v11, v11, v3

    add-float v46, v5, v11

    const v11, 0x413ccccd

    mul-float v11, v11, v3

    add-float/2addr v11, v4

    const v12, 0x41966666

    mul-float v20, v3, v12

    add-float v44, v5, v20

    move/from16 v49, v8

    move-object v8, v9

    move v9, v10

    move/from16 v10, v46

    move/from16 v12, v44

    move v13, v7

    move/from16 v66, v14

    move/from16 v14, v44

    invoke-virtual/range {v8 .. v14}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 1574
    iget-object v8, v0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->path:Landroid/graphics/Path;

    const v9, 0x41433333

    mul-float v9, v9, v3

    add-float v43, v4, v9

    const/high16 v9, 0x41500000

    mul-float v9, v9, v3

    add-float v45, v4, v9

    const v9, 0x415ccccd

    mul-float v9, v9, v3

    add-float v47, v4, v9

    move-object/from16 v42, v8

    invoke-virtual/range {v42 .. v48}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 1576
    iget-object v8, v0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->path:Landroid/graphics/Path;

    add-float v53, v4, v17

    const/high16 v9, 0x41840000

    mul-float v9, v9, v3

    add-float v14, v4, v9

    const/high16 v9, 0x41900000

    mul-float v9, v9, v3

    add-float v57, v4, v9

    move-object/from16 v52, v8

    move/from16 v55, v14

    invoke-virtual/range {v52 .. v58}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 1578
    iget-object v8, v0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->path:Landroid/graphics/Path;

    add-float v26, v4, v18

    const v9, 0x4181999a

    mul-float v9, v9, v3

    add-float v28, v4, v9

    const v9, 0x417ccccd

    mul-float v9, v9, v3

    add-float v30, v4, v9

    move-object/from16 v25, v8

    invoke-virtual/range {v25 .. v31}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 1580
    iget-object v8, v0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->path:Landroid/graphics/Path;

    const v9, 0x4189999a

    mul-float v9, v9, v3

    add-float v34, v4, v9

    add-float v36, v4, v19

    add-float v38, v4, v20

    move-object/from16 v33, v8

    invoke-virtual/range {v33 .. v39}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 1582
    iget-object v8, v0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->path:Landroid/graphics/Path;

    const/high16 v9, 0x41ac0000

    mul-float v9, v9, v3

    add-float v27, v4, v9

    const/high16 v9, 0x41bc0000

    mul-float v9, v9, v3

    add-float v31, v4, v9

    move-object/from16 v26, v8

    move/from16 v28, v16

    move/from16 v29, v31

    move/from16 v30, v15

    invoke-virtual/range {v26 .. v32}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 1584
    iget-object v8, v0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->path:Landroid/graphics/Path;

    const v9, 0x41b9999a

    mul-float v9, v9, v3

    add-float v17, v4, v9

    const/high16 v9, 0x41b00000

    mul-float v9, v9, v3

    add-float v19, v4, v9

    const v9, 0x41a1999a

    mul-float v9, v9, v3

    add-float v21, v4, v9

    move-object/from16 v16, v8

    move/from16 v18, v23

    move/from16 v20, v6

    invoke-virtual/range {v16 .. v22}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 1586
    iget-object v8, v0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->path:Landroid/graphics/Path;

    add-float v9, v4, v41

    add-float v11, v4, v24

    move v10, v2

    move/from16 v12, v49

    move v6, v14

    move/from16 v14, v49

    invoke-virtual/range {v8 .. v14}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 1588
    iget-object v7, v0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->path:Landroid/graphics/Path;

    invoke-virtual {v7}, Landroid/graphics/Path;->close()V

    .line 1589
    iget-object v7, v0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->path:Landroid/graphics/Path;

    iget-object v8, v0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->paint:Landroid/graphics/Paint;

    invoke-virtual {v1, v7, v8}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 1591
    iget-object v7, v0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->path:Landroid/graphics/Path;

    invoke-virtual {v7}, Landroid/graphics/Path;->reset()V

    .line 1592
    iget-object v7, v0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->path:Landroid/graphics/Path;

    const/high16 v8, 0x3f800000

    mul-float v8, v8, v3

    add-float/2addr v8, v5

    move/from16 v11, v66

    invoke-virtual {v7, v11, v8}, Landroid/graphics/Path;->moveTo(FF)V

    .line 1593
    iget-object v7, v0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->path:Landroid/graphics/Path;

    const/high16 v9, 0x40a00000

    mul-float v9, v9, v3

    add-float/2addr v9, v4

    invoke-virtual {v7, v9, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 1594
    iget-object v7, v0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->path:Landroid/graphics/Path;

    const/high16 v9, 0x41080000

    mul-float v9, v9, v3

    add-float/2addr v9, v4

    const/high16 v10, 0x40b00000

    mul-float v10, v10, v3

    add-float/2addr v5, v10

    invoke-virtual {v7, v9, v5}, Landroid/graphics/Path;->lineTo(FF)V

    .line 1595
    iget-object v7, v0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->path:Landroid/graphics/Path;

    invoke-virtual {v7}, Landroid/graphics/Path;->close()V

    .line 1596
    iget-object v7, v0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->path:Landroid/graphics/Path;

    iget-object v9, v0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->paint:Landroid/graphics/Paint;

    invoke-virtual {v1, v7, v9}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 1598
    iget-object v7, v0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->path:Landroid/graphics/Path;

    invoke-virtual {v7}, Landroid/graphics/Path;->reset()V

    .line 1599
    iget-object v7, v0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->path:Landroid/graphics/Path;

    invoke-virtual {v7, v6, v8}, Landroid/graphics/Path;->moveTo(FF)V

    .line 1600
    iget-object v6, v0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->path:Landroid/graphics/Path;

    add-float v7, v4, v40

    invoke-virtual {v6, v7, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 1601
    iget-object v2, v0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->path:Landroid/graphics/Path;

    const/high16 v6, 0x41780000

    mul-float v3, v3, v6

    add-float/2addr v4, v3

    invoke-virtual {v2, v4, v5}, Landroid/graphics/Path;->lineTo(FF)V

    .line 1602
    iget-object v2, v0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->path:Landroid/graphics/Path;

    invoke-virtual {v2}, Landroid/graphics/Path;->close()V

    .line 1603
    iget-object v2, v0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->path:Landroid/graphics/Path;

    iget-object v3, v0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->paint:Landroid/graphics/Paint;

    invoke-virtual {v1, v2, v3}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 1604
    return-void
.end method
