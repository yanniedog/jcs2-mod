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

    .line 1230
    invoke-direct {p0, p1, p2}, Lcom/trueaxis/modmenu/ModMenu$LinkIconDrawable;-><init>(II)V

    .line 1231
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 47

    .line 1234
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual/range {p0 .. p0}, Lcom/trueaxis/modmenu/ModMenu$DiscordIconDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v2

    .line 1235
    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    move-result v3

    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    int-to-float v3, v3

    .line 1236
    iget v4, v2, Landroid/graphics/Rect;->left:I

    int-to-float v4, v4

    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    move-result v5

    int-to-float v5, v5

    sub-float/2addr v5, v3

    const/high16 v6, 0x40000000

    div-float/2addr v5, v6

    add-float/2addr v4, v5

    .line 1237
    iget v5, v2, Landroid/graphics/Rect;->top:I

    int-to-float v5, v5

    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    move-result v2

    int-to-float v2, v2

    sub-float/2addr v2, v3

    div-float/2addr v2, v6

    add-float/2addr v5, v2

    .line 1238
    const/high16 v2, 0x41c00000

    div-float/2addr v3, v2

    .line 1240
    iget-object v2, v0, Lcom/trueaxis/modmenu/ModMenu$DiscordIconDrawable;->path:Landroid/graphics/Path;

    invoke-virtual {v2}, Landroid/graphics/Path;->reset()V

    .line 1241
    iget-object v2, v0, Lcom/trueaxis/modmenu/ModMenu$DiscordIconDrawable;->path:Landroid/graphics/Path;

    const/high16 v7, 0x40900000

    mul-float v7, v7, v3

    add-float v15, v4, v7

    const/high16 v8, 0x40d00000

    mul-float v16, v3, v8

    add-float v14, v5, v16

    invoke-virtual {v2, v15, v14}, Landroid/graphics/Path;->moveTo(FF)V

    .line 1242
    iget-object v8, v0, Lcom/trueaxis/modmenu/ModMenu$DiscordIconDrawable;->path:Landroid/graphics/Path;

    add-float v2, v5, v7

    const/high16 v7, 0x40c00000

    mul-float v7, v7, v3

    add-float v11, v4, v7

    const/high16 v7, 0x40400000

    mul-float v7, v7, v3

    add-float v24, v5, v7

    const/high16 v9, 0x41080000

    mul-float v9, v9, v3

    add-float v13, v4, v9

    move v9, v15

    move v10, v2

    move/from16 v12, v24

    move/from16 v25, v14

    move/from16 v14, v24

    invoke-virtual/range {v8 .. v14}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 1244
    iget-object v8, v0, Lcom/trueaxis/modmenu/ModMenu$DiscordIconDrawable;->path:Landroid/graphics/Path;

    const/high16 v9, 0x41180000

    mul-float v26, v3, v9

    add-float v14, v4, v26

    mul-float v6, v6, v3

    add-float/2addr v6, v5

    const/high16 v9, 0x41300000

    mul-float v9, v9, v3

    add-float v27, v4, v9

    const/high16 v9, 0x3fc00000

    mul-float v9, v9, v3

    add-float/2addr v9, v5

    const/high16 v10, 0x41400000

    mul-float v28, v3, v10

    add-float v22, v4, v28

    move-object/from16 v17, v8

    move/from16 v18, v14

    move/from16 v19, v6

    move/from16 v20, v27

    move/from16 v21, v9

    move/from16 v23, v9

    invoke-virtual/range {v17 .. v23}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 1246
    iget-object v8, v0, Lcom/trueaxis/modmenu/ModMenu$DiscordIconDrawable;->path:Landroid/graphics/Path;

    const/high16 v10, 0x41500000

    mul-float v29, v3, v10

    add-float v13, v4, v29

    const/high16 v10, 0x41680000

    mul-float v30, v3, v10

    add-float v12, v4, v30

    const/high16 v10, 0x41780000

    mul-float v10, v10, v3

    add-float v22, v4, v10

    move-object/from16 v17, v8

    move/from16 v18, v13

    move/from16 v19, v9

    move/from16 v20, v12

    move/from16 v21, v6

    move/from16 v23, v24

    invoke-virtual/range {v17 .. v23}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 1248
    iget-object v8, v0, Lcom/trueaxis/modmenu/ModMenu$DiscordIconDrawable;->path:Landroid/graphics/Path;

    const/high16 v6, 0x41900000

    mul-float v6, v6, v3

    add-float v9, v4, v6

    const/high16 v6, 0x419c0000

    mul-float v6, v6, v3

    add-float/2addr v6, v4

    move/from16 v10, v24

    move v11, v6

    move v1, v12

    move v12, v2

    move v2, v13

    move v13, v6

    move v6, v14

    move/from16 v14, v25

    invoke-virtual/range {v8 .. v14}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 1250
    iget-object v8, v0, Lcom/trueaxis/modmenu/ModMenu$DiscordIconDrawable;->path:Landroid/graphics/Path;

    const/high16 v9, 0x41a40000

    mul-float v9, v9, v3

    add-float v22, v4, v9

    const/high16 v9, 0x41000000

    mul-float v9, v9, v3

    add-float v12, v5, v9

    const/high16 v10, 0x41a80000

    mul-float v10, v10, v3

    add-float v20, v4, v10

    const/high16 v10, 0x41200000

    mul-float v10, v10, v3

    add-float/2addr v10, v5

    add-float v37, v5, v28

    move-object/from16 v17, v8

    move/from16 v18, v22

    move/from16 v19, v12

    move/from16 v21, v10

    move/from16 v23, v37

    invoke-virtual/range {v17 .. v23}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 1252
    iget-object v8, v0, Lcom/trueaxis/modmenu/ModMenu$DiscordIconDrawable;->path:Landroid/graphics/Path;

    const/high16 v11, 0x41980000

    mul-float v11, v11, v3

    add-float v39, v4, v11

    add-float v11, v5, v29

    const/high16 v13, 0x418c0000

    mul-float v13, v13, v3

    add-float v41, v4, v13

    const/high16 v13, 0x41580000

    mul-float v13, v13, v3

    add-float/2addr v13, v5

    const/high16 v14, 0x41800000

    mul-float v14, v14, v3

    add-float v43, v4, v14

    move-object/from16 v38, v8

    move/from16 v40, v11

    move/from16 v42, v13

    move/from16 v44, v11

    invoke-virtual/range {v38 .. v44}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 1254
    iget-object v8, v0, Lcom/trueaxis/modmenu/ModMenu$DiscordIconDrawable;->path:Landroid/graphics/Path;

    add-float v14, v5, v30

    invoke-virtual {v8, v1, v14}, Landroid/graphics/Path;->lineTo(FF)V

    .line 1255
    iget-object v1, v0, Lcom/trueaxis/modmenu/ModMenu$DiscordIconDrawable;->path:Landroid/graphics/Path;

    invoke-virtual {v1, v2, v13}, Landroid/graphics/Path;->lineTo(FF)V

    .line 1256
    iget-object v1, v0, Lcom/trueaxis/modmenu/ModMenu$DiscordIconDrawable;->path:Landroid/graphics/Path;

    const/high16 v2, 0x41480000

    mul-float v2, v2, v3

    add-float v18, v4, v2

    const v2, 0x415b3333

    mul-float v2, v2, v3

    add-float v21, v5, v2

    const/high16 v2, 0x41380000

    mul-float v2, v2, v3

    add-float v20, v4, v2

    move-object/from16 v17, v1

    move/from16 v19, v21

    move/from16 v22, v27

    move/from16 v23, v13

    invoke-virtual/range {v17 .. v23}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 1258
    iget-object v1, v0, Lcom/trueaxis/modmenu/ModMenu$DiscordIconDrawable;->path:Landroid/graphics/Path;

    invoke-virtual {v1, v6, v14}, Landroid/graphics/Path;->lineTo(FF)V

    .line 1259
    iget-object v1, v0, Lcom/trueaxis/modmenu/ModMenu$DiscordIconDrawable;->path:Landroid/graphics/Path;

    add-float/2addr v9, v4

    invoke-virtual {v1, v9, v11}, Landroid/graphics/Path;->lineTo(FF)V

    .line 1260
    iget-object v1, v0, Lcom/trueaxis/modmenu/ModMenu$DiscordIconDrawable;->path:Landroid/graphics/Path;

    add-float v32, v4, v16

    const/high16 v2, 0x40a00000

    mul-float v2, v2, v3

    add-float v34, v4, v2

    const/high16 v2, 0x40600000

    mul-float v2, v2, v3

    add-float/2addr v2, v4

    move-object/from16 v31, v1

    move/from16 v33, v13

    move/from16 v35, v11

    move/from16 v36, v2

    invoke-virtual/range {v31 .. v37}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 1262
    iget-object v8, v0, Lcom/trueaxis/modmenu/ModMenu$DiscordIconDrawable;->path:Landroid/graphics/Path;

    add-float v9, v4, v7

    move v11, v2

    move v13, v15

    move/from16 v14, v25

    invoke-virtual/range {v8 .. v14}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 1264
    iget-object v1, v0, Lcom/trueaxis/modmenu/ModMenu$DiscordIconDrawable;->path:Landroid/graphics/Path;

    invoke-virtual {v1}, Landroid/graphics/Path;->close()V

    .line 1265
    iget-object v1, v0, Lcom/trueaxis/modmenu/ModMenu$DiscordIconDrawable;->path:Landroid/graphics/Path;

    iget-object v2, v0, Lcom/trueaxis/modmenu/ModMenu$DiscordIconDrawable;->paint:Landroid/graphics/Paint;

    move-object/from16 v6, p1

    invoke-virtual {v6, v1, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 1266
    const/high16 v1, 0x41100000

    mul-float v1, v1, v3

    add-float/2addr v1, v4

    add-float v5, v5, v26

    const v2, 0x3fb33333

    mul-float v2, v2, v3

    iget-object v7, v0, Lcom/trueaxis/modmenu/ModMenu$DiscordIconDrawable;->cutout:Landroid/graphics/Paint;

    invoke-virtual {v6, v1, v5, v2, v7}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 1267
    const/high16 v1, 0x41700000

    mul-float v3, v3, v1

    add-float/2addr v4, v3

    iget-object v1, v0, Lcom/trueaxis/modmenu/ModMenu$DiscordIconDrawable;->cutout:Landroid/graphics/Paint;

    invoke-virtual {v6, v4, v5, v2, v1}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 1268
    return-void
.end method
