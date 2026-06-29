.class final Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;
.super Ljava/lang/Object;
.source "ReplayFreeCameraOverlay.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$Step;
    }
.end annotation


# static fields
.field private static final DRAG_ROTATE_SCALE:F = 0.004f

.field private static final FAST_STEP:F = 55.0f

.field private static final NORMAL_STEP:F = 18.0f

.field private static final POLL_MS:I = 0x64

.field private static final REPEAT_MS:I = 0x2d

.field private static final ROTATE_STEP:F = 0.045f

.field private static final STATUS_ACTIVE:I = 0x4

.field private static final STATUS_ENABLED:I = 0x1

.field private static final STATUS_IN_LEVEL_INTRO:I = 0x2


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    return-void
.end method

.method private static background(IF)Landroid/graphics/drawable/GradientDrawable;
    .registers 3

    .line 348
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 349
    invoke-virtual {v0, p0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 350
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 351
    return-object v0
.end method

.method private static button(Landroid/app/Activity;Ljava/lang/String;)Landroid/widget/Button;
    .registers 6

    .line 324
    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 325
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 326
    const/high16 p1, 0x41100000

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setTextSize(F)V

    .line 327
    const/4 p1, 0x0

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setAllCaps(Z)V

    .line 328
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinHeight(I)V

    .line 329
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinimumHeight(I)V

    .line 330
    const/4 p1, 0x3

    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->dp(Landroid/content/Context;I)I

    move-result v1

    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->dp(Landroid/content/Context;I)I

    move-result v2

    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->dp(Landroid/content/Context;I)I

    move-result v3

    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->dp(Landroid/content/Context;I)I

    move-result p0

    invoke-virtual {v0, v1, v2, v3, p0}, Landroid/widget/Button;->setPadding(IIII)V

    .line 331
    return-object v0
.end method

.method private static dp(Landroid/content/Context;I)I
    .registers 2

    .line 355
    int-to-float p1, p1

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

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

.method private static fill()Landroid/widget/LinearLayout$LayoutParams;
    .registers 3

    .line 343
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    return-object v0
.end method

.method static install(Landroid/app/Activity;)V
    .registers 21

    .line 40
    move-object/from16 v10, p0

    const-string v0, "window"

    invoke-virtual {v10, v0}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    move-object v11, v0

    check-cast v11, Landroid/view/WindowManager;

    .line 41
    if-nez v11, :cond_e

    return-void

    .line 43
    :cond_e
    new-instance v12, Landroid/widget/LinearLayout;

    invoke-direct {v12, v10}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 44
    const/4 v0, 0x1

    invoke-virtual {v12, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 45
    const/16 v1, 0x8

    invoke-static {v10, v1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->dp(Landroid/content/Context;I)I

    move-result v2

    const/4 v3, 0x7

    invoke-static {v10, v3}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-static {v10, v1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->dp(Landroid/content/Context;I)I

    move-result v5

    invoke-static {v10, v3}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->dp(Landroid/content/Context;I)I

    move-result v3

    invoke-virtual {v12, v2, v4, v5, v3}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 46
    const/16 v2, 0xaa

    const/16 v3, 0xe

    const/16 v4, 0xa

    invoke-static {v2, v1, v4, v3}, Landroid/graphics/Color;->argb(IIII)I

    move-result v2

    invoke-static {v10, v1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->dp(Landroid/content/Context;I)I

    move-result v3

    int-to-float v3, v3

    invoke-static {v2, v3}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->background(IF)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v2

    invoke-virtual {v12, v2}, Landroid/widget/LinearLayout;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 47
    invoke-virtual {v12, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 49
    const/16 v1, 0xdc

    const/16 v2, 0xff

    const/4 v3, 0x0

    invoke-static {v2, v1, v3}, Landroid/graphics/Color;->rgb(III)I

    move-result v1

    const-string v5, "FREE CAM"

    const/16 v6, 0xb

    invoke-static {v10, v5, v6, v1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->label(Landroid/app/Activity;Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v8

    .line 50
    sget-object v1, Landroid/graphics/Typeface;->SANS_SERIF:Landroid/graphics/Typeface;

    invoke-static {v1, v0}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    move-result-object v1

    invoke-virtual {v8, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 51
    const/16 v1, 0x11

    invoke-virtual {v8, v1}, Landroid/widget/TextView;->setGravity(I)V

    .line 52
    invoke-static {}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->fill()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v5

    invoke-virtual {v12, v8, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 54
    new-instance v13, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v5

    invoke-direct {v13, v5}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 55
    new-array v5, v0, [F

    const/high16 v6, 0x41900000

    aput v6, v5, v3

    .line 57
    const-string v6, "Lock"

    invoke-static {v10, v6}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->button(Landroid/app/Activity;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v7

    .line 58
    const-string v6, "Reset"

    invoke-static {v10, v6}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->button(Landroid/app/Activity;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v6

    .line 59
    const-string v9, "Fast"

    invoke-static {v10, v9}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->button(Landroid/app/Activity;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v9

    .line 60
    new-instance v14, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;

    invoke-direct {v14}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$1;-><init>()V

    invoke-virtual {v7, v14}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 68
    new-instance v14, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$2;

    invoke-direct {v14}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$2;-><init>()V

    invoke-virtual {v6, v14}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 74
    new-instance v14, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$3;

    invoke-direct {v14, v5, v9}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$3;-><init>([FLandroid/widget/Button;)V

    invoke-virtual {v9, v14}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 81
    const/4 v14, 0x3

    new-array v15, v14, [Landroid/view/View;

    aput-object v7, v15, v3

    aput-object v6, v15, v0

    const/4 v6, 0x2

    aput-object v9, v15, v6

    invoke-static {v15}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->row([Landroid/view/View;)Landroid/widget/LinearLayout;

    move-result-object v9

    invoke-static {}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->fill()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v15

    invoke-virtual {v12, v9, v15}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 83
    const-string v9, "FWD"

    invoke-static {v10, v9}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->button(Landroid/app/Activity;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v9

    .line 84
    const-string v15, "BACK"

    invoke-static {v10, v15}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->button(Landroid/app/Activity;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v15

    .line 85
    const-string v2, "UP"

    invoke-static {v10, v2}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->button(Landroid/app/Activity;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v2

    .line 86
    const-string v1, "DOWN"

    invoke-static {v10, v1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->button(Landroid/app/Activity;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v1

    .line 87
    new-instance v4, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$4;

    invoke-direct {v4, v5}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$4;-><init>([F)V

    invoke-static {v9, v13, v4}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->repeatButton(Landroid/widget/Button;Landroid/os/Handler;Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$Step;)V

    .line 92
    new-instance v4, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$5;

    invoke-direct {v4, v5}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$5;-><init>([F)V

    invoke-static {v15, v13, v4}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->repeatButton(Landroid/widget/Button;Landroid/os/Handler;Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$Step;)V

    .line 97
    new-instance v4, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$6;

    invoke-direct {v4, v5}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$6;-><init>([F)V

    invoke-static {v2, v13, v4}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->repeatButton(Landroid/widget/Button;Landroid/os/Handler;Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$Step;)V

    .line 102
    new-instance v4, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$7;

    invoke-direct {v4, v5}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$7;-><init>([F)V

    invoke-static {v1, v13, v4}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->repeatButton(Landroid/widget/Button;Landroid/os/Handler;Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$Step;)V

    .line 107
    const/4 v4, 0x4

    new-array v14, v4, [Landroid/view/View;

    aput-object v9, v14, v3

    aput-object v15, v14, v0

    aput-object v2, v14, v6

    const/4 v2, 0x3

    aput-object v1, v14, v2

    invoke-static {v14}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->row([Landroid/view/View;)Landroid/widget/LinearLayout;

    move-result-object v1

    invoke-static {}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->fill()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v2

    invoke-virtual {v12, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 109
    const-string v1, "LEFT"

    invoke-static {v10, v1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->button(Landroid/app/Activity;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v1

    .line 110
    const-string v2, "RIGHT"

    invoke-static {v10, v2}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->button(Landroid/app/Activity;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v2

    .line 111
    const-string v9, "LOOK <"

    invoke-static {v10, v9}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->button(Landroid/app/Activity;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v9

    .line 112
    const-string v14, "LOOK >"

    invoke-static {v10, v14}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->button(Landroid/app/Activity;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v14

    .line 113
    new-instance v15, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$8;

    invoke-direct {v15, v5}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$8;-><init>([F)V

    invoke-static {v1, v13, v15}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->repeatButton(Landroid/widget/Button;Landroid/os/Handler;Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$Step;)V

    .line 118
    new-instance v15, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$9;

    invoke-direct {v15, v5}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$9;-><init>([F)V

    invoke-static {v2, v13, v15}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->repeatButton(Landroid/widget/Button;Landroid/os/Handler;Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$Step;)V

    .line 123
    new-instance v5, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$10;

    invoke-direct {v5}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$10;-><init>()V

    invoke-static {v9, v13, v5}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->repeatButton(Landroid/widget/Button;Landroid/os/Handler;Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$Step;)V

    .line 128
    new-instance v5, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$11;

    invoke-direct {v5}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$11;-><init>()V

    invoke-static {v14, v13, v5}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->repeatButton(Landroid/widget/Button;Landroid/os/Handler;Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$Step;)V

    .line 133
    new-array v5, v4, [Landroid/view/View;

    aput-object v1, v5, v3

    aput-object v2, v5, v0

    aput-object v9, v5, v6

    const/4 v1, 0x3

    aput-object v14, v5, v1

    invoke-static {v5}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->row([Landroid/view/View;)Landroid/widget/LinearLayout;

    move-result-object v1

    invoke-static {}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->fill()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v2

    invoke-virtual {v12, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 135
    const-string v1, "LOOK ^"

    invoke-static {v10, v1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->button(Landroid/app/Activity;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v1

    .line 136
    const-string v2, "LOOK v"

    invoke-static {v10, v2}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->button(Landroid/app/Activity;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v2

    .line 137
    new-instance v5, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$12;

    invoke-direct {v5}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$12;-><init>()V

    invoke-static {v1, v13, v5}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->repeatButton(Landroid/widget/Button;Landroid/os/Handler;Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$Step;)V

    .line 142
    new-instance v5, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$13;

    invoke-direct {v5}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$13;-><init>()V

    invoke-static {v2, v13, v5}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->repeatButton(Landroid/widget/Button;Landroid/os/Handler;Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$Step;)V

    .line 147
    new-array v5, v6, [Landroid/view/View;

    aput-object v1, v5, v3

    aput-object v2, v5, v0

    invoke-static {v5}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->row([Landroid/view/View;)Landroid/widget/LinearLayout;

    move-result-object v1

    invoke-static {}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->fill()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v2

    invoke-virtual {v12, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 149
    const/16 v1, 0xd8

    const/16 v2, 0xde

    const/16 v5, 0xd2

    invoke-static {v5, v1, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v1

    const-string v2, "LOOK"

    const/16 v5, 0xa

    invoke-static {v10, v2, v5, v1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->label(Landroid/app/Activity;Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v1

    .line 150
    const/16 v2, 0x11

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setGravity(I)V

    .line 151
    sget-object v2, Landroid/graphics/Typeface;->SANS_SERIF:Landroid/graphics/Typeface;

    invoke-static {v2, v0}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 152
    const/16 v2, 0x6e

    const/16 v5, 0xff

    invoke-static {v2, v5, v5, v5}, Landroid/graphics/Color;->argb(IIII)I

    move-result v2

    const/4 v5, 0x5

    invoke-static {v10, v5}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->dp(Landroid/content/Context;I)I

    move-result v5

    int-to-float v5, v5

    invoke-static {v2, v5}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->background(IF)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 153
    new-instance v2, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$14;

    invoke-direct {v2}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$14;-><init>()V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 183
    invoke-static {}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->fill()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v2

    .line 184
    invoke-static {v10, v4}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->dp(Landroid/content/Context;I)I

    move-result v4

    iput v4, v2, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 185
    invoke-virtual {v12, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 190
    new-instance v9, Landroid/view/WindowManager$LayoutParams;

    .line 191
    const/16 v1, 0xee

    invoke-static {v10, v1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->dp(Landroid/content/Context;I)I

    move-result v15

    const/16 v18, 0x138

    const/16 v19, -0x3

    const/16 v16, -0x2

    const/16 v17, 0x3e8

    move-object v14, v9

    invoke-direct/range {v14 .. v19}, Landroid/view/WindowManager$LayoutParams;-><init>(IIIII)V

    .line 196
    const/16 v1, 0x35

    iput v1, v9, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 197
    const/16 v1, 0xc

    invoke-static {v10, v1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->dp(Landroid/content/Context;I)I

    move-result v2

    iput v2, v9, Landroid/view/WindowManager$LayoutParams;->x:I

    .line 198
    invoke-static {v10, v1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->dp(Landroid/content/Context;I)I

    move-result v1

    iput v1, v9, Landroid/view/WindowManager$LayoutParams;->y:I

    .line 199
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-lt v1, v2, :cond_1ff

    .line 200
    const/high16 v1, 0x44960000

    invoke-virtual {v12, v1}, Landroid/widget/LinearLayout;->setTranslationZ(F)V

    .line 203
    :cond_1ff
    new-array v14, v0, [Z

    aput-boolean v3, v14, v3

    .line 204
    new-array v5, v0, [Z

    aput-boolean v3, v5, v3

    .line 205
    new-instance v15, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$15;

    move-object v0, v15

    move-object/from16 v1, p0

    move-object v2, v14

    move-object v3, v11

    move-object v4, v12

    move-object v6, v9

    move-object/from16 v16, v9

    move-object v9, v13

    invoke-direct/range {v0 .. v9}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$15;-><init>(Landroid/app/Activity;[ZLandroid/view/WindowManager;Landroid/widget/LinearLayout;[ZLandroid/view/WindowManager$LayoutParams;Landroid/widget/Button;Landroid/widget/TextView;Landroid/os/Handler;)V

    .line 254
    new-instance v8, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$16;

    move-object v0, v8

    move-object/from16 v3, v16

    move-object v4, v13

    move-object v5, v11

    move-object v6, v12

    move-object v7, v15

    invoke-direct/range {v0 .. v7}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$16;-><init>(Landroid/app/Activity;[ZLandroid/view/WindowManager$LayoutParams;Landroid/os/Handler;Landroid/view/WindowManager;Landroid/widget/LinearLayout;Ljava/lang/Runnable;)V

    invoke-virtual {v13, v8}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 278
    return-void
.end method

.method private static label(Landroid/app/Activity;Ljava/lang/String;II)Landroid/widget/TextView;
    .registers 5

    .line 335
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 336
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 337
    int-to-float p0, p2

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 338
    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 339
    return-object v0
.end method

.method private static repeatButton(Landroid/widget/Button;Landroid/os/Handler;Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$Step;)V
    .registers 4

    .line 281
    new-instance v0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$17;

    invoke-direct {v0, p2, p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$17;-><init>(Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$Step;Landroid/os/Handler;)V

    invoke-virtual {p0, v0}, Landroid/widget/Button;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 308
    return-void
.end method

.method private static varargs row([Landroid/view/View;)Landroid/widget/LinearLayout;
    .registers 7

    .line 311
    new-instance v0, Landroid/widget/LinearLayout;

    const/4 v1, 0x0

    aget-object v2, p0, v1

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v0, v2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 312
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 313
    const/16 v2, 0x11

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 314
    const/4 v2, 0x0

    :goto_15
    array-length v3, p0

    if-ge v2, v3, :cond_37

    .line 315
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x2

    const/high16 v5, 0x3f800000

    invoke-direct {v3, v1, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 317
    if-lez v2, :cond_2f

    aget-object v4, p0, v1

    invoke-virtual {v4}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    const/4 v5, 0x4

    invoke-static {v4, v5}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->dp(Landroid/content/Context;I)I

    move-result v4

    iput v4, v3, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 318
    :cond_2f
    aget-object v4, p0, v2

    invoke-virtual {v0, v4, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 314
    add-int/lit8 v2, v2, 0x1

    goto :goto_15

    .line 320
    :cond_37
    return-object v0
.end method
