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

    .line 1226
    invoke-direct {p0, p1, p2}, Lcom/trueaxis/modmenu/ModMenu$LinkIconDrawable;-><init>(II)V

    .line 1227
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 24

    .line 1230
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual/range {p0 .. p0}, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v2

    .line 1231
    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    move-result v3

    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    int-to-float v3, v3

    .line 1232
    iget v4, v2, Landroid/graphics/Rect;->left:I

    int-to-float v4, v4

    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    move-result v5

    int-to-float v5, v5

    sub-float/2addr v5, v3

    const/high16 v6, 0x40000000

    div-float/2addr v5, v6

    add-float/2addr v4, v5

    .line 1233
    iget v5, v2, Landroid/graphics/Rect;->top:I

    int-to-float v5, v5

    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    move-result v2

    int-to-float v2, v2

    sub-float/2addr v2, v3

    div-float/2addr v2, v6

    add-float/2addr v5, v2

    .line 1234
    const/high16 v2, 0x41c00000

    div-float/2addr v3, v2

    .line 1236
    iget-object v2, v0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->path:Landroid/graphics/Path;

    invoke-virtual {v2}, Landroid/graphics/Path;->reset()V

    .line 1237
    iget-object v2, v0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->path:Landroid/graphics/Path;

    const/high16 v6, 0x41400000

    mul-float v6, v6, v3

    add-float/2addr v6, v4

    const/high16 v7, 0x41380000

    mul-float v7, v7, v3

    add-float/2addr v7, v5

    const/high16 v8, 0x41100000

    mul-float v8, v8, v3

    sget-object v9, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    invoke-virtual {v2, v6, v7, v8, v9}, Landroid/graphics/Path;->addCircle(FFFLandroid/graphics/Path$Direction;)V

    .line 1238
    iget-object v2, v0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->path:Landroid/graphics/Path;

    iget-object v6, v0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->paint:Landroid/graphics/Paint;

    invoke-virtual {v1, v2, v6}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 1240
    iget-object v2, v0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->path:Landroid/graphics/Path;

    invoke-virtual {v2}, Landroid/graphics/Path;->reset()V

    .line 1241
    iget-object v2, v0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->path:Landroid/graphics/Path;

    const/high16 v6, 0x40d00000

    mul-float v6, v6, v3

    add-float/2addr v6, v4

    const/high16 v7, 0x40b00000

    mul-float v7, v7, v3

    add-float v8, v5, v7

    invoke-virtual {v2, v6, v8}, Landroid/graphics/Path;->moveTo(FF)V

    .line 1242
    iget-object v2, v0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->path:Landroid/graphics/Path;

    const/high16 v6, 0x40600000

    mul-float v6, v6, v3

    add-float/2addr v6, v4

    const/high16 v9, 0x3fc00000

    mul-float v9, v9, v3

    add-float v10, v5, v9

    invoke-virtual {v2, v6, v10}, Landroid/graphics/Path;->lineTo(FF)V

    .line 1243
    iget-object v2, v0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->path:Landroid/graphics/Path;

    const/high16 v6, 0x41200000

    mul-float v6, v6, v3

    add-float/2addr v6, v4

    const/high16 v11, 0x40800000

    mul-float v11, v11, v3

    add-float/2addr v11, v5

    invoke-virtual {v2, v6, v11}, Landroid/graphics/Path;->lineTo(FF)V

    .line 1244
    iget-object v2, v0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->path:Landroid/graphics/Path;

    invoke-virtual {v2}, Landroid/graphics/Path;->close()V

    .line 1245
    iget-object v2, v0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->path:Landroid/graphics/Path;

    iget-object v6, v0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->paint:Landroid/graphics/Paint;

    invoke-virtual {v1, v2, v6}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 1247
    iget-object v2, v0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->path:Landroid/graphics/Path;

    invoke-virtual {v2}, Landroid/graphics/Path;->reset()V

    .line 1248
    iget-object v2, v0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->path:Landroid/graphics/Path;

    const/high16 v6, 0x418c0000

    mul-float v6, v6, v3

    add-float/2addr v6, v4

    invoke-virtual {v2, v6, v8}, Landroid/graphics/Path;->moveTo(FF)V

    .line 1249
    iget-object v2, v0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->path:Landroid/graphics/Path;

    const/high16 v6, 0x41a40000

    mul-float v6, v6, v3

    add-float v8, v4, v6

    invoke-virtual {v2, v8, v10}, Landroid/graphics/Path;->lineTo(FF)V

    .line 1250
    iget-object v2, v0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->path:Landroid/graphics/Path;

    const/high16 v8, 0x41600000

    mul-float v8, v8, v3

    add-float/2addr v8, v4

    invoke-virtual {v2, v8, v11}, Landroid/graphics/Path;->lineTo(FF)V

    .line 1251
    iget-object v2, v0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->path:Landroid/graphics/Path;

    invoke-virtual {v2}, Landroid/graphics/Path;->close()V

    .line 1252
    iget-object v2, v0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->path:Landroid/graphics/Path;

    iget-object v8, v0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->paint:Landroid/graphics/Paint;

    invoke-virtual {v1, v2, v8}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 1254
    iget-object v2, v0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->path:Landroid/graphics/Path;

    invoke-virtual {v2}, Landroid/graphics/Path;->reset()V

    .line 1255
    iget-object v2, v0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->path:Landroid/graphics/Path;

    const/high16 v8, 0x40900000

    mul-float v8, v8, v3

    add-float/2addr v8, v4

    const/high16 v10, 0x41680000

    mul-float v10, v10, v3

    add-float/2addr v10, v5

    invoke-virtual {v2, v8, v10}, Landroid/graphics/Path;->moveTo(FF)V

    .line 1256
    iget-object v11, v0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->path:Landroid/graphics/Path;

    add-float v14, v4, v9

    const/high16 v2, 0x41840000

    mul-float v2, v2, v3

    add-float/2addr v2, v5

    add-float v19, v5, v6

    const/high16 v6, 0x40a00000

    mul-float v6, v6, v3

    add-float v16, v4, v6

    const/high16 v6, 0x41ac0000

    mul-float v6, v6, v3

    add-float v21, v5, v6

    move v12, v14

    move v13, v2

    move/from16 v15, v19

    move/from16 v17, v21

    invoke-virtual/range {v11 .. v17}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 1258
    iget-object v11, v0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->path:Landroid/graphics/Path;

    const/high16 v6, 0x40e00000

    mul-float v6, v6, v3

    add-float v14, v4, v6

    const/high16 v6, 0x41980000

    mul-float v6, v6, v3

    add-float v8, v5, v6

    const/high16 v9, 0x41800000

    mul-float v9, v9, v3

    add-float/2addr v5, v9

    add-float v16, v4, v7

    move v12, v14

    move v13, v8

    move v15, v5

    move/from16 v17, v10

    invoke-virtual/range {v11 .. v17}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 1260
    iget-object v7, v0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->path:Landroid/graphics/Path;

    invoke-virtual {v7}, Landroid/graphics/Path;->close()V

    .line 1261
    iget-object v7, v0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->path:Landroid/graphics/Path;

    iget-object v9, v0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->paint:Landroid/graphics/Paint;

    invoke-virtual {v1, v7, v9}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 1263
    iget-object v7, v0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->path:Landroid/graphics/Path;

    invoke-virtual {v7}, Landroid/graphics/Path;->reset()V

    .line 1264
    iget-object v7, v0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->path:Landroid/graphics/Path;

    const/high16 v9, 0x419c0000

    mul-float v9, v9, v3

    add-float/2addr v9, v4

    invoke-virtual {v7, v9, v10}, Landroid/graphics/Path;->moveTo(FF)V

    .line 1265
    iget-object v15, v0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->path:Landroid/graphics/Path;

    const/high16 v7, 0x41b40000

    mul-float v7, v7, v3

    add-float v18, v4, v7

    add-float v20, v4, v6

    move/from16 v16, v18

    move/from16 v17, v2

    invoke-virtual/range {v15 .. v21}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 1267
    iget-object v11, v0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->path:Landroid/graphics/Path;

    const/high16 v2, 0x41880000

    mul-float v2, v2, v3

    add-float v14, v4, v2

    const/high16 v2, 0x41940000

    mul-float v3, v3, v2

    add-float v16, v4, v3

    move v12, v14

    move v15, v5

    move/from16 v17, v10

    invoke-virtual/range {v11 .. v17}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 1269
    iget-object v2, v0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->path:Landroid/graphics/Path;

    invoke-virtual {v2}, Landroid/graphics/Path;->close()V

    .line 1270
    iget-object v2, v0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->path:Landroid/graphics/Path;

    iget-object v3, v0, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;->paint:Landroid/graphics/Paint;

    invoke-virtual {v1, v2, v3}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 1271
    return-void
.end method
