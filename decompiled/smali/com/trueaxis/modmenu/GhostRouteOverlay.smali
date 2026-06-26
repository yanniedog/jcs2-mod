.class final Lcom/trueaxis/modmenu/GhostRouteOverlay;
.super Landroid/view/View;
.source "GhostRouteOverlay.java"


# static fields
.field private static final CLASS_ACCEL:I = 0x0

.field private static final CLASS_BOOST:I = 0x1

.field private static final CLASS_BRAKE:I = 0x3

.field private static final CLASS_COAST:I = 0x2

.field private static final COLOR_ACCEL:I

.field private static final COLOR_BOOST:I

.field private static final COLOR_BRAKE:I

.field private static final COLOR_COAST:I

.field private static final MAX_DRAW_POINTS:I = 0x2bc

.field private static final POLL_MS:I = 0x3e8

.field private static final ROUTE_STRIDE:I = 0x4


# instance fields
.field private final activity:Landroid/app/Activity;

.field private disabled:Z

.field private final handler:Landroid/os/Handler;

.field private haveMatrices:Z

.field private loadedCount:I

.field private loggedFirstDraw:Z

.field private loggedProjectionFallback:Z

.field private final matrices:[F

.field private needsDraw:Z

.field private onScreen:[Z

.field private final paints:[Landroid/graphics/Paint;

.field private final pollRunnable:Ljava/lang/Runnable;

.field private projectionBrokenFallback:Z

.field private route:[F

.field private routePoints:I

.field private screenX:[F

.field private screenY:[F

.field private segmentBatch:[[F

.field private segmentClass:[I

.field private final segmentCount:[I

.field private final underlayPaint:Landroid/graphics/Paint;

.field private usingTopDownFallback:Z

.field private final viewProjection:[F


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .line 27
    const/16 v0, 0xdc

    const/16 v1, 0x50

    const/4 v2, 0x0

    invoke-static {v2, v0, v1}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    sput v0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->COLOR_ACCEL:I

    .line 28
    const/16 v0, 0x28

    const/16 v1, 0xc8

    const/16 v3, 0xff

    invoke-static {v0, v1, v3}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    sput v0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->COLOR_BOOST:I

    .line 29
    const/16 v0, 0xd2

    invoke-static {v3, v0, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    sput v0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->COLOR_COAST:I

    .line 30
    const/16 v0, 0x46

    invoke-static {v3, v0, v0}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    sput v0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->COLOR_BRAKE:I

    return-void
.end method

.method private constructor <init>(Landroid/app/Activity;)V
    .registers 6

    .line 64
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 40
    const/4 v0, 0x4

    new-array v1, v0, [Landroid/graphics/Paint;

    iput-object v1, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->paints:[Landroid/graphics/Paint;

    .line 41
    new-instance v1, Landroid/graphics/Paint;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v1, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->underlayPaint:Landroid/graphics/Paint;

    .line 42
    const/16 v1, 0x23

    new-array v1, v1, [F

    iput-object v1, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->matrices:[F

    .line 43
    const/16 v1, 0x10

    new-array v1, v1, [F

    iput-object v1, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->viewProjection:[F

    .line 47
    const/4 v1, -0x1

    iput v1, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->loadedCount:I

    .line 53
    new-array v0, v0, [I

    iput-object v0, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->segmentCount:[I

    .line 54
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->handler:Landroid/os/Handler;

    .line 103
    new-instance v0, Lcom/trueaxis/modmenu/GhostRouteOverlay$1;

    invoke-direct {v0, p0}, Lcom/trueaxis/modmenu/GhostRouteOverlay$1;-><init>(Lcom/trueaxis/modmenu/GhostRouteOverlay;)V

    iput-object v0, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->pollRunnable:Ljava/lang/Runnable;

    .line 65
    iput-object p1, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->activity:Landroid/app/Activity;

    .line 66
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/trueaxis/modmenu/GhostRouteOverlay;->setWillNotDraw(Z)V

    .line 67
    invoke-virtual {p0, p1}, Lcom/trueaxis/modmenu/GhostRouteOverlay;->setClickable(Z)V

    .line 68
    invoke-virtual {p0, p1}, Lcom/trueaxis/modmenu/GhostRouteOverlay;->setFocusable(Z)V

    .line 69
    const/4 v0, 0x0

    :goto_42
    iget-object v1, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->paints:[Landroid/graphics/Paint;

    array-length v1, v1

    if-ge v0, v1, :cond_62

    .line 70
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1, v2}, Landroid/graphics/Paint;-><init>(I)V

    .line 71
    sget-object v3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 72
    sget-object v3, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 73
    sget-object v3, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    .line 74
    iget-object v3, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->paints:[Landroid/graphics/Paint;

    aput-object v1, v3, v0

    .line 69
    add-int/lit8 v0, v0, 0x1

    goto :goto_42

    .line 76
    :cond_62
    iget-object v0, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->underlayPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 77
    iget-object v0, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->underlayPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 78
    iget-object v0, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->underlayPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    .line 79
    iget-object v0, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->underlayPaint:Landroid/graphics/Paint;

    const/high16 v1, -0x1000000

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 80
    iget-object v0, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->paints:[Landroid/graphics/Paint;

    aget-object p1, v0, p1

    sget v0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->COLOR_ACCEL:I

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 81
    iget-object p1, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->paints:[Landroid/graphics/Paint;

    aget-object p1, p1, v2

    sget v0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->COLOR_BOOST:I

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 82
    iget-object p1, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->paints:[Landroid/graphics/Paint;

    const/4 v0, 0x2

    aget-object p1, p1, v0

    sget v0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->COLOR_COAST:I

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 83
    iget-object p1, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->paints:[Landroid/graphics/Paint;

    const/4 v0, 0x3

    aget-object p1, p1, v0

    sget v0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->COLOR_BRAKE:I

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 84
    return-void
.end method

.method static synthetic access$000(Lcom/trueaxis/modmenu/GhostRouteOverlay;)Landroid/app/Activity;
    .registers 1

    .line 26
    iget-object p0, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->activity:Landroid/app/Activity;

    return-object p0
.end method

.method static synthetic access$100(Lcom/trueaxis/modmenu/GhostRouteOverlay;)Z
    .registers 1

    .line 26
    iget-boolean p0, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->disabled:Z

    return p0
.end method

.method static synthetic access$102(Lcom/trueaxis/modmenu/GhostRouteOverlay;Z)Z
    .registers 2

    .line 26
    iput-boolean p1, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->disabled:Z

    return p1
.end method

.method static synthetic access$200(Lcom/trueaxis/modmenu/GhostRouteOverlay;)V
    .registers 1

    .line 26
    invoke-direct {p0}, Lcom/trueaxis/modmenu/GhostRouteOverlay;->tick()V

    return-void
.end method

.method static synthetic access$300(Lcom/trueaxis/modmenu/GhostRouteOverlay;)Landroid/os/Handler;
    .registers 1

    .line 26
    iget-object p0, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->handler:Landroid/os/Handler;

    return-object p0
.end method

.method private buildViewProjection()V
    .registers 10

    .line 296
    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_2
    const/4 v2, 0x4

    if-ge v1, v2, :cond_30

    .line 297
    const/4 v3, 0x0

    :goto_6
    if-ge v3, v2, :cond_2d

    .line 298
    nop

    .line 299
    const/4 v4, 0x0

    const/4 v5, 0x0

    :goto_b
    if-ge v5, v2, :cond_23

    .line 300
    iget-object v6, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->matrices:[F

    mul-int/lit8 v7, v5, 0x4

    add-int/lit8 v7, v7, 0x10

    add-int/2addr v7, v3

    aget v6, v6, v7

    iget-object v7, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->matrices:[F

    mul-int/lit8 v8, v1, 0x4

    add-int/2addr v8, v5

    aget v7, v7, v8

    mul-float v6, v6, v7

    add-float/2addr v4, v6

    .line 299
    add-int/lit8 v5, v5, 0x1

    goto :goto_b

    .line 302
    :cond_23
    iget-object v5, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->viewProjection:[F

    mul-int/lit8 v6, v1, 0x4

    add-int/2addr v6, v3

    aput v4, v5, v6

    .line 297
    add-int/lit8 v3, v3, 0x1

    goto :goto_6

    .line 296
    :cond_2d
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 305
    :cond_30
    return-void
.end method

.method private classifySegmentsFromRoute()V
    .registers 12

    .line 195
    nop

    .line 196
    nop

    .line 197
    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_6
    add-int/lit8 v4, v2, 0x1

    iget v5, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->routePoints:I

    if-ge v4, v5, :cond_17

    .line 198
    invoke-direct {p0, v2}, Lcom/trueaxis/modmenu/GhostRouteOverlay;->segmentSpeed(I)F

    move-result v2

    .line 199
    cmpl-float v5, v2, v3

    if-lez v5, :cond_15

    move v3, v2

    .line 197
    :cond_15
    move v2, v4

    goto :goto_6

    .line 201
    :cond_17
    const v2, 0x3c23d70a

    mul-float v2, v2, v3

    const v4, 0x38d1b717

    invoke-static {v2, v4}, Ljava/lang/Math;->max(FF)F

    move-result v2

    .line 202
    const v4, 0x3f59999a

    mul-float v4, v4, v3

    .line 203
    const/4 v5, 0x0

    const/4 v6, 0x0

    :goto_2a
    add-int/lit8 v7, v5, 0x1

    iget v8, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->routePoints:I

    if-ge v7, v8, :cond_6e

    .line 204
    iget-object v8, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->route:[F

    mul-int/lit8 v9, v5, 0x4

    const/4 v10, 0x3

    add-int/2addr v9, v10

    aget v8, v8, v9

    invoke-static {v8}, Ljava/lang/Math;->round(F)I

    move-result v8

    .line 205
    if-ltz v8, :cond_4a

    if-gt v8, v10, :cond_4a

    .line 206
    iget-object v6, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->segmentClass:[I

    aput v8, v6, v5

    .line 207
    invoke-direct {p0, v5}, Lcom/trueaxis/modmenu/GhostRouteOverlay;->segmentSpeed(I)F

    move-result v5

    .line 208
    move v6, v5

    goto :goto_6c

    .line 210
    :cond_4a
    invoke-direct {p0, v5}, Lcom/trueaxis/modmenu/GhostRouteOverlay;->segmentSpeed(I)F

    move-result v8

    .line 211
    sub-float v6, v8, v6

    .line 213
    cmpl-float v9, v3, v0

    if-lez v9, :cond_5a

    cmpl-float v9, v8, v4

    if-ltz v9, :cond_5a

    .line 214
    const/4 v10, 0x1

    goto :goto_67

    .line 215
    :cond_5a
    cmpl-float v9, v6, v2

    if-lez v9, :cond_60

    .line 216
    const/4 v10, 0x0

    goto :goto_67

    .line 217
    :cond_60
    neg-float v9, v2

    cmpg-float v6, v6, v9

    if-gez v6, :cond_66

    .line 218
    goto :goto_67

    .line 220
    :cond_66
    const/4 v10, 0x2

    .line 222
    :goto_67
    iget-object v6, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->segmentClass:[I

    aput v10, v6, v5

    .line 223
    move v6, v8

    .line 203
    :goto_6c
    move v5, v7

    goto :goto_2a

    .line 225
    :cond_6e
    return-void
.end method

.method static install(Landroid/app/Activity;)V
    .registers 4

    .line 87
    const v0, 0x1020002

    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 88
    if-nez v0, :cond_c

    return-void

    .line 90
    :cond_c
    new-instance v1, Lcom/trueaxis/modmenu/GhostRouteOverlay;

    invoke-direct {v1, p0}, Lcom/trueaxis/modmenu/GhostRouteOverlay;-><init>(Landroid/app/Activity;)V

    .line 91
    new-instance p0, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v2, -0x1

    invoke-direct {p0, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 93
    const/16 v2, 0x33

    iput v2, p0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 94
    invoke-virtual {v0, v1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 95
    invoke-virtual {v1}, Lcom/trueaxis/modmenu/GhostRouteOverlay;->bringToFront()V

    .line 96
    sget p0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x15

    if-lt p0, v0, :cond_2d

    .line 97
    const p0, 0x4479c000    # 999.0f

    invoke-virtual {v1, p0}, Lcom/trueaxis/modmenu/GhostRouteOverlay;->setTranslationZ(F)V

    .line 99
    :cond_2d
    const-string p0, "ghost route overlay installed"

    invoke-static {p0}, Lcom/trueaxis/modmenu/ModDebugLog;->log(Ljava/lang/String;)V

    .line 100
    iget-object p0, v1, Lcom/trueaxis/modmenu/GhostRouteOverlay;->handler:Landroid/os/Handler;

    iget-object v0, v1, Lcom/trueaxis/modmenu/GhostRouteOverlay;->pollRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 101
    return-void
.end method

.method private loadRoute(I)V
    .registers 11

    .line 155
    mul-int/lit8 v0, p1, 0x4

    new-array v0, v0, [F

    .line 156
    invoke-static {v0}, Lcom/trueaxis/modmenu/RequiredPatches;->readGhostRoute([F)I

    move-result v1

    .line 157
    const/4 v2, 0x2

    const/4 v3, 0x0

    if-ge v1, v2, :cond_12

    .line 158
    iput v3, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->routePoints:I

    .line 159
    const/4 p1, -0x1

    iput p1, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->loadedCount:I

    .line 160
    return-void

    .line 162
    :cond_12
    const/16 v2, 0x2bc

    const/4 v4, 0x4

    if-le v1, v2, :cond_3b

    .line 163
    nop

    .line 164
    const/16 v5, 0xaf0

    new-array v5, v5, [F

    .line 165
    const/4 v6, 0x0

    :goto_1d
    if-ge v6, v2, :cond_36

    .line 166
    add-int/lit8 v7, v1, -0x1

    mul-int v7, v7, v6

    int-to-float v7, v7

    const/16 v8, 0x2bb

    int-to-float v8, v8

    div-float/2addr v7, v8

    invoke-static {v7}, Ljava/lang/Math;->round(F)I

    move-result v7

    .line 167
    mul-int/lit8 v7, v7, 0x4

    mul-int/lit8 v8, v6, 0x4

    invoke-static {v0, v7, v5, v8, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 165
    add-int/lit8 v6, v6, 0x1

    goto :goto_1d

    .line 170
    :cond_36
    iput-object v5, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->route:[F

    .line 171
    iput v2, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->routePoints:I

    .line 172
    goto :goto_3f

    .line 173
    :cond_3b
    iput-object v0, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->route:[F

    .line 174
    iput v1, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->routePoints:I

    .line 176
    :goto_3f
    iput p1, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->loadedCount:I

    .line 177
    iget v0, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->routePoints:I

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->screenX:[F

    .line 178
    iget v0, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->routePoints:I

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->screenY:[F

    .line 179
    iget v0, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->routePoints:I

    new-array v0, v0, [Z

    iput-object v0, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->onScreen:[Z

    .line 180
    iget v0, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->routePoints:I

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->segmentClass:[I

    .line 181
    new-array v0, v4, [[F

    iput-object v0, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->segmentBatch:[[F

    .line 182
    const/4 v0, 0x0

    :goto_5e
    const/4 v2, 0x1

    if-ge v0, v4, :cond_6f

    .line 183
    iget-object v5, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->segmentBatch:[[F

    iget v6, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->routePoints:I

    sub-int/2addr v6, v2

    mul-int/lit8 v6, v6, 0x4

    new-array v2, v6, [F

    aput-object v2, v5, v0

    .line 182
    add-int/lit8 v0, v0, 0x1

    goto :goto_5e

    .line 185
    :cond_6f
    invoke-direct {p0}, Lcom/trueaxis/modmenu/GhostRouteOverlay;->classifySegmentsFromRoute()V

    .line 186
    iput-boolean v3, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->loggedFirstDraw:Z

    .line 187
    iput-boolean v3, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->loggedProjectionFallback:Z

    .line 188
    iput-boolean v3, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->projectionBrokenFallback:Z

    .line 189
    iput-boolean v2, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->needsDraw:Z

    .line 190
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ghost route reconstructed points="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " draw_points="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->routePoints:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " nodes="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/trueaxis/modmenu/ModDebugLog;->log(Ljava/lang/String;)V

    .line 192
    return-void
.end method

.method private projectRoute(II)V
    .registers 26

    .line 308
    move-object/from16 v0, p0

    move/from16 v1, p1

    move/from16 v2, p2

    iget-object v3, v0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->viewProjection:[F

    const/4 v4, 0x0

    aget v3, v3, v4

    iget-object v5, v0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->viewProjection:[F

    const/4 v6, 0x4

    aget v5, v5, v6

    iget-object v6, v0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->viewProjection:[F

    const/16 v7, 0x8

    aget v6, v6, v7

    iget-object v7, v0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->viewProjection:[F

    const/16 v8, 0xc

    aget v7, v7, v8

    .line 309
    iget-object v8, v0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->viewProjection:[F

    const/4 v9, 0x1

    aget v8, v8, v9

    iget-object v10, v0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->viewProjection:[F

    const/4 v11, 0x5

    aget v10, v10, v11

    iget-object v11, v0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->viewProjection:[F

    const/16 v12, 0x9

    aget v11, v11, v12

    iget-object v12, v0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->viewProjection:[F

    const/16 v13, 0xd

    aget v12, v12, v13

    .line 310
    iget-object v13, v0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->viewProjection:[F

    const/4 v14, 0x3

    aget v13, v13, v14

    iget-object v14, v0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->viewProjection:[F

    const/4 v15, 0x7

    aget v14, v14, v15

    iget-object v15, v0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->viewProjection:[F

    const/16 v16, 0xb

    aget v15, v15, v16

    iget-object v9, v0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->viewProjection:[F

    const/16 v17, 0xf

    aget v9, v9, v17

    .line 311
    nop

    :goto_49
    iget v2, v0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->routePoints:I

    if-ge v4, v2, :cond_f3

    .line 312
    iget-object v2, v0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->route:[F

    mul-int/lit8 v18, v4, 0x4

    aget v2, v2, v18

    .line 313
    iget-object v1, v0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->route:[F

    add-int/lit8 v19, v18, 0x1

    aget v1, v1, v19

    .line 314
    move/from16 v19, v12

    iget-object v12, v0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->route:[F

    add-int/lit8 v18, v18, 0x2

    aget v12, v12, v18

    .line 315
    mul-float v18, v13, v2

    mul-float v20, v14, v1

    add-float v18, v18, v20

    mul-float v20, v15, v12

    add-float v18, v18, v20

    add-float v18, v18, v9

    .line 316
    const v20, 0x38d1b717

    cmpg-float v20, v18, v20

    if-gtz v20, :cond_83

    .line 317
    iget-object v1, v0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->onScreen:[Z

    const/16 v17, 0x0

    aput-boolean v17, v1, v4

    .line 318
    move/from16 v12, p1

    move/from16 v2, p2

    move/from16 v21, v3

    move/from16 v22, v5

    goto :goto_e6

    .line 320
    :cond_83
    const/16 v17, 0x0

    mul-float v20, v3, v2

    mul-float v21, v5, v1

    add-float v20, v20, v21

    mul-float v21, v6, v12

    add-float v20, v20, v21

    add-float v20, v20, v7

    .line 321
    mul-float v2, v2, v8

    mul-float v1, v1, v10

    add-float/2addr v2, v1

    mul-float v12, v12, v11

    add-float/2addr v2, v12

    add-float v2, v2, v19

    .line 322
    div-float v20, v20, v18

    .line 323
    div-float v2, v2, v18

    .line 324
    const/high16 v1, 0x3f000000    # 0.5f

    mul-float v20, v20, v1

    add-float v20, v20, v1

    move/from16 v12, p1

    int-to-float v1, v12

    mul-float v20, v20, v1

    .line 325
    const/high16 v18, 0x3f000000    # 0.5f

    mul-float v2, v2, v18

    add-float v2, v2, v18

    const/high16 v18, 0x3f800000    # 1.0f

    sub-float v18, v18, v2

    move/from16 v2, p2

    move/from16 v21, v3

    int-to-float v3, v2

    mul-float v18, v18, v3

    .line 326
    move/from16 v22, v5

    iget-object v5, v0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->screenX:[F

    aput v20, v5, v4

    .line 327
    iget-object v5, v0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->screenY:[F

    aput v18, v5, v4

    .line 328
    iget-object v5, v0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->onScreen:[Z

    neg-int v0, v12

    int-to-float v0, v0

    cmpl-float v0, v20, v0

    if-lez v0, :cond_e3

    const/high16 v0, 0x40000000    # 2.0f

    mul-float v1, v1, v0

    cmpg-float v1, v20, v1

    if-gez v1, :cond_e3

    neg-int v1, v2

    int-to-float v1, v1

    cmpl-float v1, v18, v1

    if-lez v1, :cond_e3

    mul-float v3, v3, v0

    cmpg-float v0, v18, v3

    if-gez v0, :cond_e3

    const/4 v0, 0x1

    goto :goto_e4

    :cond_e3
    const/4 v0, 0x0

    :goto_e4
    aput-boolean v0, v5, v4

    .line 311
    :goto_e6
    add-int/lit8 v4, v4, 0x1

    move-object/from16 v0, p0

    move v1, v12

    move/from16 v12, v19

    move/from16 v3, v21

    move/from16 v5, v22

    goto/16 :goto_49

    .line 330
    :cond_f3
    return-void
.end method

.method private projectRouteForwardFallback(II)V
    .registers 23

    .line 333
    move-object/from16 v0, p0

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->usingTopDownFallback:Z

    .line 334
    iget-object v2, v0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->route:[F

    const/4 v3, 0x0

    aget v2, v2, v3

    .line 335
    iget-object v4, v0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->route:[F

    const/4 v5, 0x2

    aget v4, v4, v5

    .line 336
    iget v6, v0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->routePoints:I

    sub-int/2addr v6, v1

    mul-int/lit8 v6, v6, 0x4

    .line 337
    iget-object v7, v0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->route:[F

    aget v7, v7, v6

    .line 338
    iget-object v8, v0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->route:[F

    add-int/2addr v6, v5

    aget v6, v8, v6

    .line 339
    sub-float/2addr v7, v2

    .line 340
    sub-float/2addr v6, v4

    .line 341
    mul-float v8, v7, v7

    mul-float v9, v6, v6

    add-float/2addr v8, v9

    float-to-double v8, v8

    invoke-static {v8, v9}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v8

    double-to-float v8, v8

    .line 342
    const v9, 0x38d1b717

    const/4 v10, 0x0

    const/high16 v11, 0x3f800000    # 1.0f

    cmpg-float v9, v8, v9

    if-gez v9, :cond_39

    .line 343
    nop

    .line 344
    const/high16 v6, 0x3f800000    # 1.0f

    const/4 v7, 0x0

    goto :goto_3b

    .line 346
    :cond_39
    div-float/2addr v7, v8

    .line 347
    div-float/2addr v6, v8

    .line 349
    :goto_3b
    neg-float v6, v6

    .line 350
    nop

    .line 351
    nop

    .line 352
    nop

    .line 353
    iget-object v8, v0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->screenY:[F

    aput v10, v8, v3

    .line 354
    const/4 v8, 0x0

    const/4 v9, 0x0

    const/high16 v12, 0x3f800000    # 1.0f

    :goto_47
    iget v13, v0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->routePoints:I

    if-ge v8, v13, :cond_9f

    .line 355
    iget-object v13, v0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->route:[F

    mul-int/lit8 v14, v8, 0x4

    aget v13, v13, v14

    .line 356
    iget-object v15, v0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->route:[F

    add-int/lit8 v16, v14, 0x1

    aget v15, v15, v16

    .line 357
    iget-object v3, v0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->route:[F

    add-int/2addr v14, v5

    aget v3, v3, v14

    .line 358
    sub-float v14, v13, v2

    .line 359
    sub-float v17, v3, v4

    .line 360
    mul-float v14, v14, v6

    mul-float v17, v17, v7

    add-float v14, v14, v17

    .line 361
    invoke-static {v14}, Ljava/lang/Math;->abs(F)F

    move-result v14

    .line 362
    cmpl-float v17, v14, v12

    if-lez v17, :cond_6f

    move v12, v14

    .line 363
    :cond_6f
    if-lez v8, :cond_9a

    .line 364
    add-int/lit8 v14, v8, -0x1

    mul-int/lit8 v14, v14, 0x4

    .line 365
    iget-object v1, v0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->route:[F

    aget v1, v1, v14

    sub-float/2addr v13, v1

    .line 366
    iget-object v1, v0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->route:[F

    add-int/lit8 v18, v14, 0x1

    aget v1, v1, v18

    sub-float/2addr v15, v1

    .line 367
    iget-object v1, v0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->route:[F

    add-int/2addr v14, v5

    aget v1, v1, v14

    sub-float/2addr v3, v1

    .line 368
    mul-float v13, v13, v13

    mul-float v15, v15, v15

    add-float/2addr v13, v15

    mul-float v3, v3, v3

    add-float/2addr v13, v3

    float-to-double v13, v13

    invoke-static {v13, v14}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v13

    double-to-float v1, v13

    add-float/2addr v9, v1

    .line 369
    iget-object v1, v0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->screenY:[F

    aput v9, v1, v8

    .line 354
    :cond_9a
    add-int/lit8 v8, v8, 0x1

    const/4 v1, 0x1

    const/4 v3, 0x0

    goto :goto_47

    .line 372
    :cond_9f
    invoke-static {v9, v11}, Ljava/lang/Math;->max(FF)F

    move-result v1

    .line 373
    move/from16 v3, p1

    int-to-float v3, v3

    const/high16 v8, 0x3f000000    # 0.5f

    mul-float v8, v8, v3

    .line 374
    move/from16 v9, p2

    int-to-float v9, v9

    const v13, 0x3e6147ae

    mul-float v13, v13, v9

    .line 375
    const v14, 0x3f6147ae

    mul-float v9, v9, v14

    .line 376
    const v14, 0x3ed70a3d

    mul-float v3, v3, v14

    .line 377
    const/4 v14, 0x0

    :goto_bd
    iget v15, v0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->routePoints:I

    if-ge v14, v15, :cond_10f

    .line 378
    iget-object v15, v0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->route:[F

    mul-int/lit8 v16, v14, 0x4

    aget v15, v15, v16

    .line 379
    iget-object v11, v0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->route:[F

    add-int/lit8 v16, v16, 0x2

    aget v11, v11, v16

    .line 380
    sub-float/2addr v15, v2

    .line 381
    sub-float/2addr v11, v4

    .line 382
    iget-object v5, v0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->screenY:[F

    aget v5, v5, v14

    div-float/2addr v5, v1

    .line 383
    cmpg-float v19, v5, v10

    if-gez v19, :cond_d9

    const/4 v5, 0x0

    .line 384
    :cond_d9
    const/high16 v18, 0x3f800000    # 1.0f

    cmpl-float v19, v5, v18

    if-lez v19, :cond_e1

    const/high16 v5, 0x3f800000    # 1.0f

    .line 385
    :cond_e1
    mul-float v15, v15, v6

    mul-float v11, v11, v7

    add-float/2addr v15, v11

    div-float/2addr v15, v12

    .line 386
    const v11, 0x3f3851ec

    mul-float v11, v11, v5

    const/high16 v18, 0x3f800000    # 1.0f

    sub-float v11, v18, v11

    .line 387
    iget-object v10, v0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->screenX:[F

    mul-float v15, v15, v3

    mul-float v15, v15, v11

    add-float/2addr v15, v8

    aput v15, v10, v14

    .line 388
    iget-object v10, v0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->screenY:[F

    sub-float v11, v9, v13

    mul-float v5, v5, v11

    sub-float v5, v9, v5

    aput v5, v10, v14

    .line 389
    iget-object v5, v0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->onScreen:[Z

    const/4 v10, 0x1

    aput-boolean v10, v5, v14

    .line 377
    add-int/lit8 v14, v14, 0x1

    const/4 v5, 0x2

    const/4 v10, 0x0

    const/high16 v11, 0x3f800000    # 1.0f

    goto :goto_bd

    .line 391
    :cond_10f
    const/4 v10, 0x1

    iget-boolean v1, v0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->loggedProjectionFallback:Z

    if-nez v1, :cond_11d

    .line 392
    iput-boolean v10, v0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->loggedProjectionFallback:Z

    .line 393
    const-string v1, "ghost"

    const-string v2, "using forward ghost route fallback; projection matrices unavailable"

    invoke-static {v1, v2}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 395
    :cond_11d
    return-void
.end method

.method private segmentSpeed(I)F
    .registers 7

    .line 228
    mul-int/lit8 v0, p1, 0x4

    .line 229
    add-int/lit8 p1, p1, 0x1

    mul-int/lit8 p1, p1, 0x4

    .line 230
    iget-object v1, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->route:[F

    aget v1, v1, p1

    iget-object v2, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->route:[F

    aget v2, v2, v0

    sub-float/2addr v1, v2

    .line 231
    iget-object v2, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->route:[F

    add-int/lit8 v3, p1, 0x1

    aget v2, v2, v3

    iget-object v3, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->route:[F

    add-int/lit8 v4, v0, 0x1

    aget v3, v3, v4

    sub-float/2addr v2, v3

    .line 232
    iget-object v3, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->route:[F

    add-int/lit8 p1, p1, 0x2

    aget p1, v3, p1

    iget-object v3, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->route:[F

    add-int/lit8 v0, v0, 0x2

    aget v0, v3, v0

    sub-float/2addr p1, v0

    .line 233
    mul-float v1, v1, v1

    mul-float v2, v2, v2

    add-float/2addr v1, v2

    mul-float p1, p1, p1

    add-float/2addr v1, p1

    float-to-double v0, v1

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    double-to-float p1, v0

    return p1
.end method

.method private tick()V
    .registers 8

    .line 119
    iget-object v0, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->activity:Landroid/app/Activity;

    invoke-static {v0}, Lcom/trueaxis/modmenu/ModMenu;->ghostRouteEnabled(Landroid/content/Context;)Z

    move-result v0

    const/16 v1, 0x8

    if-nez v0, :cond_14

    .line 120
    invoke-virtual {p0}, Lcom/trueaxis/modmenu/GhostRouteOverlay;->getVisibility()I

    move-result v0

    if-eq v0, v1, :cond_13

    invoke-virtual {p0, v1}, Lcom/trueaxis/modmenu/GhostRouteOverlay;->setVisibility(I)V

    .line 121
    :cond_13
    return-void

    .line 123
    :cond_14
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readGhostRoutePointCount()I

    move-result v0

    .line 124
    const/4 v2, 0x2

    const/4 v3, 0x0

    if-ge v0, v2, :cond_2b

    .line 125
    iput v3, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->routePoints:I

    .line 126
    const/4 v0, -0x1

    iput v0, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->loadedCount:I

    .line 127
    invoke-virtual {p0}, Lcom/trueaxis/modmenu/GhostRouteOverlay;->getVisibility()I

    move-result v0

    if-eq v0, v1, :cond_2a

    invoke-virtual {p0, v1}, Lcom/trueaxis/modmenu/GhostRouteOverlay;->setVisibility(I)V

    .line 128
    :cond_2a
    return-void

    .line 130
    :cond_2b
    iget v4, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->loadedCount:I

    if-eq v0, v4, :cond_32

    .line 131
    invoke-direct {p0, v0}, Lcom/trueaxis/modmenu/GhostRouteOverlay;->loadRoute(I)V

    .line 133
    :cond_32
    iget v0, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->routePoints:I

    if-ge v0, v2, :cond_40

    .line 134
    invoke-virtual {p0}, Lcom/trueaxis/modmenu/GhostRouteOverlay;->getVisibility()I

    move-result v0

    if-eq v0, v1, :cond_3f

    invoke-virtual {p0, v1}, Lcom/trueaxis/modmenu/GhostRouteOverlay;->setVisibility(I)V

    .line 135
    :cond_3f
    return-void

    .line 137
    :cond_40
    iget-object v0, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->activity:Landroid/app/Activity;

    invoke-static {v0}, Lcom/trueaxis/modmenu/ModMenu;->ghostRouteAlphaPercent(Landroid/content/Context;)I

    move-result v0

    mul-int/lit16 v0, v0, 0xff

    div-int/lit8 v0, v0, 0x64

    .line 138
    iget-object v1, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->activity:Landroid/app/Activity;

    invoke-static {v1}, Lcom/trueaxis/modmenu/ModMenu;->ghostRouteThicknessDp(Landroid/content/Context;)I

    move-result v1

    int-to-float v1, v1

    iget-object v2, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->activity:Landroid/app/Activity;

    .line 139
    invoke-virtual {v2}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->density:F

    mul-float v1, v1, v2

    .line 140
    iget-object v2, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->underlayPaint:Landroid/graphics/Paint;

    add-int/lit8 v4, v0, 0x46

    const/16 v5, 0x6e

    invoke-static {v5, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    const/16 v5, 0xdc

    invoke-static {v5, v4}, Ljava/lang/Math;->min(II)I

    move-result v4

    invoke-virtual {v2, v4}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 141
    iget-object v2, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->underlayPaint:Landroid/graphics/Paint;

    iget-object v4, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->activity:Landroid/app/Activity;

    invoke-virtual {v4}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v4

    iget v4, v4, Landroid/util/DisplayMetrics;->density:F

    const/high16 v5, 0x40400000    # 3.0f

    mul-float v4, v4, v5

    add-float/2addr v4, v1

    invoke-virtual {v2, v4}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 142
    iget-object v2, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->paints:[Landroid/graphics/Paint;

    array-length v4, v2

    const/4 v5, 0x0

    :goto_8c
    if-ge v5, v4, :cond_99

    aget-object v6, v2, v5

    .line 143
    invoke-virtual {v6, v0}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 144
    invoke-virtual {v6, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 142
    add-int/lit8 v5, v5, 0x1

    goto :goto_8c

    .line 146
    :cond_99
    iget-object v0, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->matrices:[F

    invoke-static {v0}, Lcom/trueaxis/modmenu/RequiredPatches;->readGhostViewMatrices([F)I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_a3

    goto :goto_a4

    :cond_a3
    const/4 v1, 0x0

    :goto_a4
    iput-boolean v1, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->haveMatrices:Z

    .line 147
    invoke-virtual {p0}, Lcom/trueaxis/modmenu/GhostRouteOverlay;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_af

    invoke-virtual {p0, v3}, Lcom/trueaxis/modmenu/GhostRouteOverlay;->setVisibility(I)V

    .line 148
    :cond_af
    iget-boolean v0, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->needsDraw:Z

    if-nez v0, :cond_bb

    iget-boolean v0, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->haveMatrices:Z

    if-eqz v0, :cond_c0

    iget-boolean v0, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->projectionBrokenFallback:Z

    if-nez v0, :cond_c0

    .line 149
    :cond_bb
    iput-boolean v3, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->needsDraw:Z

    .line 150
    invoke-virtual {p0}, Lcom/trueaxis/modmenu/GhostRouteOverlay;->invalidate()V

    .line 152
    :cond_c0
    return-void
.end method

.method private visibleSegmentCount()I
    .registers 5

    .line 398
    nop

    .line 399
    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_3
    add-int/lit8 v2, v0, 0x1

    iget v3, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->routePoints:I

    if-ge v2, v3, :cond_19

    .line 400
    iget-object v3, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->onScreen:[Z

    aget-boolean v0, v3, v0

    if-eqz v0, :cond_17

    iget-object v0, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->onScreen:[Z

    aget-boolean v0, v0, v2

    if-eqz v0, :cond_17

    add-int/lit8 v1, v1, 0x1

    .line 399
    :cond_17
    move v0, v2

    goto :goto_3

    .line 402
    :cond_19
    return v1
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 15

    .line 237
    iget-boolean v0, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->disabled:Z

    if-nez v0, :cond_125

    iget-object v0, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->route:[F

    if-eqz v0, :cond_125

    iget v0, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->routePoints:I

    const/4 v1, 0x2

    if-ge v0, v1, :cond_f

    goto/16 :goto_125

    .line 238
    :cond_f
    invoke-virtual {p0}, Lcom/trueaxis/modmenu/GhostRouteOverlay;->getWidth()I

    move-result v0

    .line 239
    invoke-virtual {p0}, Lcom/trueaxis/modmenu/GhostRouteOverlay;->getHeight()I

    move-result v1

    .line 240
    if-lez v0, :cond_124

    if-gtz v1, :cond_1d

    goto/16 :goto_124

    .line 242
    :cond_1d
    iget-boolean v2, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->haveMatrices:Z

    const-string v3, "ghost"

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-eqz v2, :cond_44

    .line 243
    invoke-direct {p0}, Lcom/trueaxis/modmenu/GhostRouteOverlay;->buildViewProjection()V

    .line 244
    invoke-direct {p0, v0, v1}, Lcom/trueaxis/modmenu/GhostRouteOverlay;->projectRoute(II)V

    .line 245
    iput-boolean v4, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->usingTopDownFallback:Z

    .line 246
    invoke-direct {p0}, Lcom/trueaxis/modmenu/GhostRouteOverlay;->visibleSegmentCount()I

    move-result v2

    if-nez v2, :cond_49

    .line 247
    invoke-direct {p0, v0, v1}, Lcom/trueaxis/modmenu/GhostRouteOverlay;->projectRouteForwardFallback(II)V

    .line 248
    iget-boolean v2, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->loggedProjectionFallback:Z

    if-nez v2, :cond_41

    .line 249
    iput-boolean v5, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->loggedProjectionFallback:Z

    .line 250
    const-string v2, "using forward ghost route fallback; camera projection produced no visible segments"

    invoke-static {v3, v2}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 253
    :cond_41
    iput-boolean v5, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->projectionBrokenFallback:Z

    goto :goto_49

    .line 256
    :cond_44
    invoke-direct {p0, v0, v1}, Lcom/trueaxis/modmenu/GhostRouteOverlay;->projectRouteForwardFallback(II)V

    .line 257
    iput-boolean v5, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->projectionBrokenFallback:Z

    .line 260
    :cond_49
    :goto_49
    const/4 v2, 0x0

    :goto_4a
    const/4 v6, 0x4

    if-ge v2, v6, :cond_54

    iget-object v6, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->segmentCount:[I

    aput v4, v6, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_4a

    .line 261
    :cond_54
    const/4 v2, 0x0

    :goto_55
    add-int/lit8 v7, v2, 0x1

    iget v8, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->routePoints:I

    if-ge v7, v8, :cond_99

    .line 262
    iget-object v8, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->onScreen:[Z

    aget-boolean v8, v8, v2

    if-eqz v8, :cond_97

    iget-object v8, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->onScreen:[Z

    aget-boolean v8, v8, v7

    if-nez v8, :cond_68

    goto :goto_97

    .line 263
    :cond_68
    iget-object v8, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->segmentClass:[I

    aget v8, v8, v2

    .line 264
    iget-object v9, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->segmentBatch:[[F

    aget-object v9, v9, v8

    .line 265
    iget-object v10, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->segmentCount:[I

    aget v10, v10, v8

    .line 266
    iget-object v11, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->screenX:[F

    aget v11, v11, v2

    aput v11, v9, v10

    .line 267
    add-int/lit8 v11, v10, 0x1

    iget-object v12, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->screenY:[F

    aget v2, v12, v2

    aput v2, v9, v11

    .line 268
    add-int/lit8 v2, v10, 0x2

    iget-object v11, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->screenX:[F

    aget v11, v11, v7

    aput v11, v9, v2

    .line 269
    add-int/lit8 v2, v10, 0x3

    iget-object v11, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->screenY:[F

    aget v11, v11, v7

    aput v11, v9, v2

    .line 270
    iget-object v2, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->segmentCount:[I

    add-int/2addr v10, v6

    aput v10, v2, v8

    .line 261
    :cond_97
    :goto_97
    move v2, v7

    goto :goto_55

    .line 272
    :cond_99
    nop

    .line 273
    const/4 v2, 0x0

    const/4 v7, 0x0

    :goto_9c
    if-ge v2, v6, :cond_a7

    iget-object v8, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->segmentCount:[I

    aget v8, v8, v2

    div-int/2addr v8, v6

    add-int/2addr v7, v8

    add-int/lit8 v2, v2, 0x1

    goto :goto_9c

    .line 274
    :cond_a7
    iget-boolean v2, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->loggedFirstDraw:Z

    if-nez v2, :cond_fb

    .line 275
    iput-boolean v5, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->loggedFirstDraw:Z

    .line 276
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "ghost route draw segments="

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v5, " points="

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v5, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->routePoints:I

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v5, " fallback="

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-boolean v5, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->usingTopDownFallback:Z

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v5, " matrices="

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-boolean v5, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->haveMatrices:Z

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v5, " width="

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " height="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 284
    :cond_fb
    const/4 v0, 0x0

    :goto_fc
    if-ge v0, v6, :cond_123

    .line 285
    iget-object v1, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->segmentCount:[I

    aget v1, v1, v0

    if-lez v1, :cond_120

    .line 286
    iget-object v1, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->segmentBatch:[[F

    aget-object v1, v1, v0

    iget-object v2, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->segmentCount:[I

    aget v2, v2, v0

    iget-object v3, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->underlayPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v4, v2, v3}, Landroid/graphics/Canvas;->drawLines([FIILandroid/graphics/Paint;)V

    .line 287
    iget-object v1, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->segmentBatch:[[F

    aget-object v1, v1, v0

    iget-object v2, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->segmentCount:[I

    aget v2, v2, v0

    iget-object v3, p0, Lcom/trueaxis/modmenu/GhostRouteOverlay;->paints:[Landroid/graphics/Paint;

    aget-object v3, v3, v0

    invoke-virtual {p1, v1, v4, v2, v3}, Landroid/graphics/Canvas;->drawLines([FIILandroid/graphics/Paint;)V

    .line 284
    :cond_120
    add-int/lit8 v0, v0, 0x1

    goto :goto_fc

    .line 290
    :cond_123
    return-void

    .line 240
    :cond_124
    :goto_124
    return-void

    .line 237
    :cond_125
    :goto_125
    return-void
.end method
