.class final Lcom/trueaxis/modmenu/SplitTimeHud;
.super Ljava/lang/Object;
.source "SplitTimeHud.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trueaxis/modmenu/SplitTimeHud$SplitEntry;
    }
.end annotation


# static fields
.field private static final POLL_MS:I = 0xc8

.field private static final SPLIT_FAST:I

.field private static final SPLIT_READY:I

.field private static final SPLIT_SLOW:I


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .line 23
    const/16 v0, 0xff

    const/16 v1, 0xdc

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v3

    sput v3, Lcom/trueaxis/modmenu/SplitTimeHud;->SPLIT_READY:I

    .line 24
    const/16 v3, 0x50

    invoke-static {v2, v1, v3}, Landroid/graphics/Color;->rgb(III)I

    move-result v1

    sput v1, Lcom/trueaxis/modmenu/SplitTimeHud;->SPLIT_FAST:I

    .line 25
    const/16 v1, 0x46

    invoke-static {v0, v1, v1}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    sput v0, Lcom/trueaxis/modmenu/SplitTimeHud;->SPLIT_SLOW:I

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    return-void
.end method

.method static synthetic access$000()I
    .registers 1

    .line 21
    sget v0, Lcom/trueaxis/modmenu/SplitTimeHud;->SPLIT_READY:I

    return v0
.end method

.method static synthetic access$100(Landroid/app/Activity;I)I
    .registers 2

    .line 21
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/SplitTimeHud;->dp(Landroid/app/Activity;I)I

    move-result p0

    return p0
.end method

.method static synthetic access$200()I
    .registers 1

    .line 21
    sget v0, Lcom/trueaxis/modmenu/SplitTimeHud;->SPLIT_FAST:I

    return v0
.end method

.method static synthetic access$300()I
    .registers 1

    .line 21
    sget v0, Lcom/trueaxis/modmenu/SplitTimeHud;->SPLIT_SLOW:I

    return v0
.end method

.method private static dp(Landroid/app/Activity;I)I
    .registers 2

    .line 334
    int-to-float p1, p1

    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    mul-float p1, p1, p0

    const/high16 p0, 0x3f000000

    add-float/2addr p1, p0

    float-to-int p0, p1

    return p0
.end method

.method static install(Landroid/app/Activity;)V
    .registers 6

    .line 45
    const v0, 0x1020002

    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 46
    if-nez v0, :cond_c

    return-void

    .line 48
    :cond_c
    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 49
    const/high16 v2, 0x41800000

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 50
    sget-object v2, Landroid/graphics/Typeface;->SANS_SERIF:Landroid/graphics/Typeface;

    const/4 v3, 0x1

    invoke-static {v2, v3}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 51
    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setGravity(I)V

    .line 52
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setIncludeFontPadding(Z)V

    .line 53
    const/high16 v2, 0x40000000

    const/high16 v3, -0x1000000

    const/high16 v4, 0x3f800000

    invoke-virtual {v1, v2, v4, v4, v3}, Landroid/widget/TextView;->setShadowLayer(FFFI)V

    .line 54
    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 56
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v3, -0x2

    invoke-direct {v2, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 58
    const/16 v3, 0x33

    iput v3, v2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 59
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->splitXdp(Landroid/content/Context;)I

    move-result v3

    invoke-static {p0, v3}, Lcom/trueaxis/modmenu/SplitTimeHud;->dp(Landroid/app/Activity;I)I

    move-result v3

    iput v3, v2, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 60
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->splitYdp(Landroid/content/Context;)I

    move-result v3

    invoke-static {p0, v3}, Lcom/trueaxis/modmenu/SplitTimeHud;->dp(Landroid/app/Activity;I)I

    move-result v3

    iput v3, v2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 61
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 62
    invoke-virtual {v1}, Landroid/widget/TextView;->bringToFront()V

    .line 63
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->splitAlphaPercent(Landroid/content/Context;)I

    move-result v0

    int-to-float v0, v0

    const/high16 v2, 0x42c80000

    div-float/2addr v0, v2

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setAlpha(F)V

    .line 64
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-lt v0, v2, :cond_70

    .line 65
    const/high16 v0, 0x447a0000

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTranslationZ(F)V

    .line 68
    :cond_70
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v0, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 69
    const-string v2, "split HUD installed"

    invoke-static {v2}, Lcom/trueaxis/modmenu/ModDebugLog;->log(Ljava/lang/String;)V

    .line 70
    new-instance v2, Lcom/trueaxis/modmenu/SplitTimeHud$1;

    invoke-direct {v2, p0, v1, v0}, Lcom/trueaxis/modmenu/SplitTimeHud$1;-><init>(Landroid/app/Activity;Landroid/widget/TextView;Landroid/os/Handler;)V

    invoke-virtual {v0, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 331
    return-void
.end method
