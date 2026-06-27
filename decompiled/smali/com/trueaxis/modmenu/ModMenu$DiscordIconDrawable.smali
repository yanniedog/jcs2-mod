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

    .line 1012
    invoke-direct {p0, p1, p2}, Lcom/trueaxis/modmenu/ModMenu$LinkIconDrawable;-><init>(II)V

    .line 1013
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 34

    .line 1016
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual/range {p0 .. p0}, Lcom/trueaxis/modmenu/ModMenu$DiscordIconDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v2

    .line 1017
    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    move-result v3

    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    int-to-float v3, v3

    .line 1018
    iget v4, v2, Landroid/graphics/Rect;->left:I

    int-to-float v4, v4

    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    move-result v5

    int-to-float v5, v5

    sub-float/2addr v5, v3

    const/high16 v6, 0x40000000

    div-float/2addr v5, v6

    add-float/2addr v4, v5

    .line 1019
    iget v5, v2, Landroid/graphics/Rect;->top:I

    int-to-float v5, v5

    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    move-result v2

    int-to-float v2, v2

    sub-float/2addr v2, v3

    div-float/2addr v2, v6

    add-float/2addr v5, v2

    .line 1021
    iget-object v2, v0, Lcom/trueaxis/modmenu/ModMenu$DiscordIconDrawable;->path:Landroid/graphics/Path;

    invoke-virtual {v2}, Landroid/graphics/Path;->reset()V

    .line 1022
    iget-object v2, v0, Lcom/trueaxis/modmenu/ModMenu$DiscordIconDrawable;->path:Landroid/graphics/Path;

    const v6, 0x3e75c28f

    mul-float v6, v6, v3

    add-float v12, v4, v6

    const v6, 0x3e8a3d71

    mul-float v6, v6, v3

    add-float v11, v5, v6

    invoke-virtual {v2, v12, v11}, Landroid/graphics/Path;->moveTo(FF)V

    .line 1023
    iget-object v13, v0, Lcom/trueaxis/modmenu/ModMenu$DiscordIconDrawable;->path:Landroid/graphics/Path;

    const v2, 0x3eb851ec

    mul-float v2, v2, v3

    add-float v14, v4, v2

    const v2, 0x3e428f5c

    mul-float v2, v2, v3

    add-float v17, v5, v2

    const v2, 0x3f23d70a

    mul-float v2, v2, v3

    add-float v16, v4, v2

    const v2, 0x3f428f5c

    mul-float v2, v2, v3

    add-float v18, v4, v2

    move/from16 v15, v17

    move/from16 v19, v11

    invoke-virtual/range {v13 .. v19}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 1026
    iget-object v2, v0, Lcom/trueaxis/modmenu/ModMenu$DiscordIconDrawable;->path:Landroid/graphics/Path;

    const v7, 0x3f5c28f6

    mul-float v7, v7, v3

    add-float v20, v4, v7

    const v7, 0x3ebd70a4

    mul-float v7, v7, v3

    add-float v13, v5, v7

    const v7, 0x3f666666

    mul-float v7, v7, v3

    add-float v22, v4, v7

    const v7, 0x3f0ccccd

    mul-float v7, v7, v3

    add-float v9, v5, v7

    const v7, 0x3f51eb85

    mul-float v7, v7, v3

    add-float v24, v4, v7

    const v7, 0x3f3851ec

    mul-float v7, v7, v3

    add-float/2addr v7, v5

    move-object/from16 v19, v2

    move/from16 v21, v13

    move/from16 v23, v9

    move/from16 v25, v7

    invoke-virtual/range {v19 .. v25}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 1029
    iget-object v2, v0, Lcom/trueaxis/modmenu/ModMenu$DiscordIconDrawable;->path:Landroid/graphics/Path;

    const v8, 0x3f3ae148

    mul-float v8, v8, v3

    add-float v26, v4, v8

    const v8, 0x3f47ae14

    mul-float v8, v8, v3

    add-float/2addr v8, v5

    const v10, 0x3f1eb852

    mul-float v10, v10, v3

    add-float v28, v4, v10

    const v10, 0x3f11eb85

    mul-float v14, v3, v10

    add-float v15, v4, v14

    const v10, 0x3f28f5c3

    mul-float v10, v10, v3

    add-float/2addr v10, v5

    move-object/from16 v25, v2

    move/from16 v27, v8

    move/from16 v29, v7

    move/from16 v30, v15

    move/from16 v31, v10

    invoke-virtual/range {v25 .. v31}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 1032
    iget-object v2, v0, Lcom/trueaxis/modmenu/ModMenu$DiscordIconDrawable;->path:Landroid/graphics/Path;

    const v16, 0x3edc28f6

    mul-float v16, v16, v3

    move/from16 v17, v15

    add-float v15, v4, v16

    invoke-virtual {v2, v15, v10}, Landroid/graphics/Path;->lineTo(FF)V

    .line 1033
    iget-object v2, v0, Lcom/trueaxis/modmenu/ModMenu$DiscordIconDrawable;->path:Landroid/graphics/Path;

    const v10, 0x3ec28f5c

    mul-float v10, v10, v3

    add-float v26, v4, v10

    add-float v28, v4, v6

    const v6, 0x3e3851ec

    mul-float v6, v6, v3

    add-float v30, v4, v6

    move-object/from16 v25, v2

    move/from16 v27, v7

    move/from16 v29, v8

    move/from16 v31, v7

    invoke-virtual/range {v25 .. v31}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 1036
    iget-object v7, v0, Lcom/trueaxis/modmenu/ModMenu$DiscordIconDrawable;->path:Landroid/graphics/Path;

    const v2, 0x3dcccccd

    mul-float v2, v2, v3

    add-float v8, v4, v2

    const v2, 0x3e0f5c29

    mul-float v2, v2, v3

    add-float v10, v4, v2

    move v6, v11

    move v11, v13

    move v13, v6

    invoke-virtual/range {v7 .. v13}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 1039
    iget-object v2, v0, Lcom/trueaxis/modmenu/ModMenu$DiscordIconDrawable;->path:Landroid/graphics/Path;

    invoke-virtual {v2}, Landroid/graphics/Path;->close()V

    .line 1040
    iget-object v2, v0, Lcom/trueaxis/modmenu/ModMenu$DiscordIconDrawable;->path:Landroid/graphics/Path;

    iget-object v6, v0, Lcom/trueaxis/modmenu/ModMenu$DiscordIconDrawable;->paint:Landroid/graphics/Paint;

    invoke-virtual {v1, v2, v6}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 1041
    const v2, 0x3ec7ae14

    mul-float v2, v2, v3

    add-float/2addr v2, v4

    const/high16 v6, 0x3f000000

    mul-float v6, v6, v3

    add-float/2addr v6, v5

    const v7, 0x3d6147ae

    mul-float v7, v7, v3

    iget-object v8, v0, Lcom/trueaxis/modmenu/ModMenu$DiscordIconDrawable;->cutout:Landroid/graphics/Paint;

    invoke-virtual {v1, v2, v6, v7, v8}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 1042
    const v2, 0x3f1c28f6

    mul-float v2, v2, v3

    add-float/2addr v4, v2

    iget-object v2, v0, Lcom/trueaxis/modmenu/ModMenu$DiscordIconDrawable;->cutout:Landroid/graphics/Paint;

    invoke-virtual {v1, v4, v6, v7, v2}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 1043
    new-instance v2, Landroid/graphics/RectF;

    add-float/2addr v14, v5

    const v4, 0x3f2147ae

    mul-float v4, v4, v3

    add-float/2addr v5, v4

    move/from16 v4, v17

    invoke-direct {v2, v15, v14, v4, v5}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 1045
    const v4, 0x3cf5c28f

    mul-float v3, v3, v4

    iget-object v4, v0, Lcom/trueaxis/modmenu/ModMenu$DiscordIconDrawable;->cutout:Landroid/graphics/Paint;

    invoke-virtual {v1, v2, v3, v3, v4}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 1046
    return-void
.end method
