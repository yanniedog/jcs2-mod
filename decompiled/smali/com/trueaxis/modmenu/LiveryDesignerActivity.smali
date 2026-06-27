.class public Lcom/trueaxis/modmenu/LiveryDesignerActivity;
.super Landroid/app/Activity;
.source "LiveryDesignerActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;
    }
.end annotation


# static fields
.field private static final ACCENT:I

.field private static final BG:I

.field public static final EXTRA_CAR:Ljava/lang/String; = "car"

.field private static final PANEL:I

.field private static final SWATCHES:[I


# instance fields
.field private canvas:Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;

.field private car:I

.field private colorPreview:Landroid/view/View;


# direct methods
.method static constructor <clinit>()V
    .registers 15

    .line 42
    const/16 v0, 0x11

    const/16 v1, 0x17

    const/16 v2, 0xd

    invoke-static {v2, v0, v1}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    sput v0, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->BG:I

    .line 43
    const/16 v0, 0x20

    const/16 v1, 0x26

    const/16 v2, 0x1c

    invoke-static {v2, v0, v1}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    sput v0, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->PANEL:I

    .line 44
    const/16 v0, 0xff

    const/16 v1, 0x80

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    sput v0, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->ACCENT:I

    .line 45
    nop

    .line 46
    const/16 v0, 0x78

    invoke-static {v0, v0, v0}, Landroid/graphics/Color;->rgb(III)I

    move-result v5

    .line 47
    const/16 v1, 0xdc

    const/16 v3, 0x28

    invoke-static {v1, v3, v3}, Landroid/graphics/Color;->rgb(III)I

    move-result v6

    sget v7, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->ACCENT:I

    const/16 v1, 0xf5

    const/16 v4, 0xd2

    invoke-static {v1, v4, v3}, Landroid/graphics/Color;->rgb(III)I

    move-result v8

    .line 48
    const/16 v1, 0xb4

    const/16 v9, 0x46

    invoke-static {v3, v1, v9}, Landroid/graphics/Color;->rgb(III)I

    move-result v10

    const/16 v11, 0xe6

    invoke-static {v3, v0, v11}, Landroid/graphics/Color;->rgb(III)I

    move-result v11

    const/16 v3, 0x96

    const/16 v12, 0x3c

    invoke-static {v3, v12, v4}, Landroid/graphics/Color;->rgb(III)I

    move-result v12

    .line 49
    const/16 v3, 0xf0

    invoke-static {v3, v0, v1}, Landroid/graphics/Color;->rgb(III)I

    move-result v1

    const/16 v3, 0x1e

    invoke-static {v0, v9, v3}, Landroid/graphics/Color;->rgb(III)I

    move-result v13

    const/16 v0, 0xc8

    invoke-static {v2, v0, v0}, Landroid/graphics/Color;->rgb(III)I

    move-result v14

    const/high16 v3, -0x1000000

    const/4 v4, -0x1

    move v9, v10

    move v10, v11

    move v11, v12

    move v12, v1

    filled-new-array/range {v3 .. v14}, [I

    move-result-object v0

    sput-object v0, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->SWATCHES:[I

    .line 45
    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 39
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/trueaxis/modmenu/LiveryDesignerActivity;I)V
    .registers 2

    .line 39
    invoke-direct {p0, p1}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->setColor(I)V

    return-void
.end method

.method static synthetic access$100(Lcom/trueaxis/modmenu/LiveryDesignerActivity;)Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;
    .registers 1

    .line 39
    iget-object p0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->canvas:Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;

    return-object p0
.end method

.method static synthetic access$200()I
    .registers 1

    .line 39
    sget v0, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->ACCENT:I

    return v0
.end method

.method static synthetic access$300()I
    .registers 1

    .line 39
    sget v0, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->PANEL:I

    return v0
.end method

.method static synthetic access$400(I)Landroid/graphics/drawable/GradientDrawable;
    .registers 1

    .line 39
    invoke-static {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->pill(I)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$500(Lcom/trueaxis/modmenu/LiveryDesignerActivity;)V
    .registers 1

    .line 39
    invoke-direct {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->showColorPicker()V

    return-void
.end method

.method static synthetic access$600(Lcom/trueaxis/modmenu/LiveryDesignerActivity;)V
    .registers 1

    .line 39
    invoke-direct {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->confirmRevert()V

    return-void
.end method

.method static synthetic access$700(Lcom/trueaxis/modmenu/LiveryDesignerActivity;)V
    .registers 1

    .line 39
    invoke-direct {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->save()V

    return-void
.end method

.method static synthetic access$800(Lcom/trueaxis/modmenu/LiveryDesignerActivity;)I
    .registers 1

    .line 39
    iget p0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->car:I

    return p0
.end method

.method private buildBottomBar()Landroid/view/View;
    .registers 8

    .line 208
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 209
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 210
    const/4 v2, 0x4

    invoke-direct {p0, v2}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->dp(I)I

    move-result v2

    invoke-virtual {v0, v1, v2, v1, v1}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 212
    const-string v1, "Undo"

    invoke-direct {p0, v1}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->toolButton(Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v1

    .line 213
    new-instance v2, Lcom/trueaxis/modmenu/LiveryDesignerActivity$6;

    invoke-direct {v2, p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$6;-><init>(Lcom/trueaxis/modmenu/LiveryDesignerActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 218
    const-string v2, "Redo"

    invoke-direct {p0, v2}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->toolButton(Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v2

    .line 219
    new-instance v3, Lcom/trueaxis/modmenu/LiveryDesignerActivity$7;

    invoke-direct {v3, p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$7;-><init>(Lcom/trueaxis/modmenu/LiveryDesignerActivity;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 224
    const-string v3, "Revert"

    invoke-direct {p0, v3}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->toolButton(Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v3

    .line 225
    new-instance v4, Lcom/trueaxis/modmenu/LiveryDesignerActivity$8;

    invoke-direct {v4, p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$8;-><init>(Lcom/trueaxis/modmenu/LiveryDesignerActivity;)V

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 230
    const-string v4, "Cancel"

    invoke-direct {p0, v4}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->toolButton(Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v4

    .line 231
    new-instance v5, Lcom/trueaxis/modmenu/LiveryDesignerActivity$9;

    invoke-direct {v5, p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$9;-><init>(Lcom/trueaxis/modmenu/LiveryDesignerActivity;)V

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 236
    const-string v5, "SAVE"

    invoke-direct {p0, v5}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->toolButton(Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v5

    .line 237
    sget v6, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->ACCENT:I

    invoke-static {v6}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->pill(I)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/Button;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 238
    const/high16 v6, -0x1000000

    invoke-virtual {v5, v6}, Landroid/widget/Button;->setTextColor(I)V

    .line 239
    new-instance v6, Lcom/trueaxis/modmenu/LiveryDesignerActivity$10;

    invoke-direct {v6, p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$10;-><init>(Lcom/trueaxis/modmenu/LiveryDesignerActivity;)V

    invoke-virtual {v5, v6}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 245
    invoke-direct {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->even()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v6

    invoke-virtual {v0, v1, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 246
    invoke-direct {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->even()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 247
    invoke-direct {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->even()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v1

    invoke-virtual {v0, v3, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 248
    invoke-direct {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->even()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v1

    invoke-virtual {v0, v4, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 249
    invoke-direct {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->even()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v1

    invoke-virtual {v0, v5, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 250
    return-object v0
.end method

.method private buildColorRow()Landroid/view/View;
    .registers 10

    .line 138
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 139
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 140
    const/16 v2, 0x10

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 141
    const/4 v2, 0x2

    invoke-direct {p0, v2}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->dp(I)I

    move-result v3

    const/4 v4, 0x4

    invoke-direct {p0, v4}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->dp(I)I

    move-result v5

    invoke-direct {p0, v2}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->dp(I)I

    move-result v6

    invoke-direct {p0, v2}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->dp(I)I

    move-result v2

    invoke-virtual {v0, v3, v5, v6, v2}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 143
    new-instance v2, Landroid/view/View;

    invoke-direct {v2, p0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->colorPreview:Landroid/view/View;

    .line 144
    iget-object v2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->colorPreview:Landroid/view/View;

    const/4 v3, -0x1

    invoke-static {v3}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->pill(I)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 145
    iget-object v2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->colorPreview:Landroid/view/View;

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v5, 0x1c

    invoke-direct {p0, v5}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->dp(I)I

    move-result v5

    const/16 v6, 0x14

    invoke-direct {p0, v6}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->dp(I)I

    move-result v6

    invoke-direct {v3, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 147
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 148
    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 149
    const/4 v3, 0x0

    :goto_53
    sget-object v5, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->SWATCHES:[I

    array-length v5, v5

    if-ge v3, v5, :cond_8b

    .line 150
    sget-object v5, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->SWATCHES:[I

    aget v5, v5, v3

    .line 151
    new-instance v6, Landroid/view/View;

    invoke-direct {v6, p0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 152
    invoke-static {v5}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->pill(I)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 153
    new-instance v7, Lcom/trueaxis/modmenu/LiveryDesignerActivity$3;

    invoke-direct {v7, p0, v5}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$3;-><init>(Lcom/trueaxis/modmenu/LiveryDesignerActivity;I)V

    invoke-virtual {v6, v7}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 158
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v7, 0x16

    invoke-direct {p0, v7}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->dp(I)I

    move-result v8

    invoke-direct {p0, v7}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->dp(I)I

    move-result v7

    invoke-direct {v5, v8, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 159
    invoke-direct {p0, v4}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->dp(I)I

    move-result v7

    iput v7, v5, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 160
    invoke-virtual {v2, v6, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 149
    add-int/lit8 v3, v3, 0x1

    goto :goto_53

    .line 162
    :cond_8b
    const-string v3, "RGB"

    invoke-direct {p0, v3}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->toolButton(Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v3

    .line 163
    new-instance v4, Lcom/trueaxis/modmenu/LiveryDesignerActivity$4;

    invoke-direct {v4, p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$4;-><init>(Lcom/trueaxis/modmenu/LiveryDesignerActivity;)V

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 168
    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 170
    new-instance v3, Landroid/widget/HorizontalScrollView;

    invoke-direct {v3, p0}, Landroid/widget/HorizontalScrollView;-><init>(Landroid/content/Context;)V

    .line 171
    invoke-virtual {v3, v1}, Landroid/widget/HorizontalScrollView;->setHorizontalScrollBarEnabled(Z)V

    .line 172
    invoke-virtual {v3, v2}, Landroid/widget/HorizontalScrollView;->addView(Landroid/view/View;)V

    .line 173
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x2

    const/high16 v5, 0x3f800000

    invoke-direct {v2, v1, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 175
    const/16 v1, 0x8

    invoke-direct {p0, v1}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->dp(I)I

    move-result v1

    iput v1, v2, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 176
    invoke-virtual {v0, v3, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 177
    return-object v0
.end method

.method private buildSizeRow()Landroid/view/View;
    .registers 7

    .line 181
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 182
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 183
    const/16 v2, 0x10

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 184
    const/16 v2, 0xb2

    const/16 v3, 0xb9

    const/16 v4, 0xaa

    invoke-static {v4, v2, v3}, Landroid/graphics/Color;->rgb(III)I

    move-result v2

    const-string v3, "Size"

    const/16 v4, 0xc

    invoke-direct {p0, v3, v4, v2}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 185
    new-instance v2, Landroid/widget/SeekBar;

    invoke-direct {v2, p0}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;)V

    .line 186
    const/16 v3, 0x50

    invoke-virtual {v2, v3}, Landroid/widget/SeekBar;->setMax(I)V

    .line 187
    const/16 v3, 0xa

    invoke-virtual {v2, v3}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 188
    iget-object v3, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->canvas:Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;

    const/high16 v4, 0x41200000

    invoke-virtual {v3, v4}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->setStrokeWidth(F)V

    .line 189
    new-instance v3, Lcom/trueaxis/modmenu/LiveryDesignerActivity$5;

    invoke-direct {v3, p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$5;-><init>(Lcom/trueaxis/modmenu/LiveryDesignerActivity;)V

    invoke-virtual {v2, v3}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 200
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x2

    const/high16 v5, 0x3f800000

    invoke-direct {v3, v1, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 202
    const/16 v1, 0x8

    invoke-direct {p0, v1}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->dp(I)I

    move-result v1

    iput v1, v3, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 203
    invoke-virtual {v0, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 204
    return-object v0
.end method

.method private buildToolRow()Landroid/view/View;
    .registers 11

    .line 107
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 108
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 109
    const/4 v2, 0x7

    new-array v3, v2, [Ljava/lang/String;

    const-string v4, "Brush"

    aput-object v4, v3, v1

    const-string v4, "Eraser"

    const/4 v5, 0x1

    aput-object v4, v3, v5

    const-string v4, "Fill"

    const/4 v5, 0x2

    aput-object v4, v3, v5

    const-string v4, "Line"

    const/4 v5, 0x3

    aput-object v4, v3, v5

    const-string v4, "Rect"

    const/4 v5, 0x4

    aput-object v4, v3, v5

    const-string v4, "Pick"

    const/4 v5, 0x5

    aput-object v4, v3, v5

    const-string v4, "Text"

    const/4 v5, 0x6

    aput-object v4, v3, v5

    .line 110
    new-array v4, v2, [I

    fill-array-data v4, :array_70

    .line 112
    new-array v5, v2, [Landroid/widget/Button;

    .line 113
    const/4 v6, 0x0

    :goto_36
    if-ge v6, v2, :cond_51

    .line 114
    aget v7, v4, v6

    .line 115
    nop

    .line 116
    aget-object v8, v3, v6

    invoke-direct {p0, v8}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->toolButton(Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v8

    .line 117
    new-instance v9, Lcom/trueaxis/modmenu/LiveryDesignerActivity$2;

    invoke-direct {v9, p0, v7, v5, v6}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$2;-><init>(Lcom/trueaxis/modmenu/LiveryDesignerActivity;I[Landroid/widget/Button;I)V

    invoke-virtual {v8, v9}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 126
    aput-object v8, v5, v6

    .line 127
    invoke-virtual {v0, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 113
    add-int/lit8 v6, v6, 0x1

    goto :goto_36

    .line 129
    :cond_51
    aget-object v2, v5, v1

    sget v3, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->ACCENT:I

    invoke-static {v3}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->pill(I)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 130
    aget-object v2, v5, v1

    const/high16 v3, -0x1000000

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setTextColor(I)V

    .line 131
    new-instance v2, Landroid/widget/HorizontalScrollView;

    invoke-direct {v2, p0}, Landroid/widget/HorizontalScrollView;-><init>(Landroid/content/Context;)V

    .line 132
    invoke-virtual {v2, v1}, Landroid/widget/HorizontalScrollView;->setHorizontalScrollBarEnabled(Z)V

    .line 133
    invoke-virtual {v2, v0}, Landroid/widget/HorizontalScrollView;->addView(Landroid/view/View;)V

    .line 134
    return-object v2

    nop

    :array_70
    .array-data 4
        0x0
        0x1
        0x2
        0x3
        0x4
        0x5
        0x6
    .end array-data
.end method

.method private confirmRevert()V
    .registers 4

    .line 254
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "confirm revert car="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->car:I

    invoke-static {v1}, Lcom/trueaxis/modmenu/ModMenu;->carName(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "designer"

    invoke-static {v1, v0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 255
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 256
    const-string v1, "Revert to bundled livery?"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 257
    const-string v1, "Discards your edits and starts again from the original car texture."

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lcom/trueaxis/modmenu/LiveryDesignerActivity$11;

    invoke-direct {v1, p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$11;-><init>(Lcom/trueaxis/modmenu/LiveryDesignerActivity;)V

    .line 258
    const-string v2, "Revert"

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 272
    const-string v1, "Keep editing"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 273
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 274
    return-void
.end method

.method private dp(I)I
    .registers 3

    .line 355
    int-to-float p1, p1

    invoke-virtual {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    mul-float p1, p1, v0

    const/high16 v0, 0x3f000000

    add-float/2addr p1, v0

    float-to-int p1, p1

    return p1
.end method

.method private even()Landroid/widget/LinearLayout$LayoutParams;
    .registers 5

    .line 386
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x2

    const/high16 v2, 0x3f800000

    const/4 v3, 0x0

    invoke-direct {v0, v3, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 388
    const/4 v1, 0x4

    invoke-direct {p0, v1}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->dp(I)I

    move-result v1

    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 389
    return-object v0
.end method

.method private static pill(I)Landroid/graphics/drawable/GradientDrawable;
    .registers 3

    .line 393
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 394
    invoke-virtual {v0, p0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 395
    const/high16 p0, 0x41400000

    invoke-virtual {v0, p0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 396
    const/16 p0, 0x3c

    const/16 v1, 0xff

    invoke-static {p0, v1, v1, v1}, Landroid/graphics/Color;->argb(IIII)I

    move-result p0

    const/4 v1, 0x2

    invoke-virtual {v0, v1, p0}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 397
    return-object v0
.end method

.method private save()V
    .registers 6

    .line 278
    const-string v0, "designer"

    const/4 v1, 0x1

    :try_start_3
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "save clicked car="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->car:I

    invoke-static {v3}, Lcom/trueaxis/modmenu/ModMenu;->carName(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " bitmap="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->canvas:Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;

    .line 279
    invoke-virtual {v3}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v3

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "x"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->canvas:Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;

    .line 280
    invoke-virtual {v3}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v3

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 278
    invoke-static {v0, v2}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 281
    iget v2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->car:I

    iget-object v3, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->canvas:Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;

    invoke-virtual {v3}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v3

    invoke-static {p0, v2, v3}, Lcom/trueaxis/modmenu/ModMenu;->saveDesignedLivery(Landroid/content/Context;ILandroid/graphics/Bitmap;)V

    .line 282
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget v3, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->car:I

    invoke-static {v3}, Lcom/trueaxis/modmenu/ModMenu;->carName(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " livery saved. Restart the game to see it."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    .line 283
    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 284
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "save complete car="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->car:I

    invoke-static {v3}, Lcom/trueaxis/modmenu/ModMenu;->carName(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 285
    invoke-virtual {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->finish()V
    :try_end_91
    .catchall {:try_start_3 .. :try_end_91} :catchall_92

    .line 290
    goto :goto_bb

    .line 286
    :catchall_92
    move-exception v2

    .line 287
    const-string v3, "YCS2Mod"

    const-string v4, "Could not save designed livery"

    invoke-static {v3, v4, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 288
    invoke-static {v0, v4, v2}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 289
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Could not save livery: "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 291
    :goto_bb
    return-void
.end method

.method private setColor(I)V
    .registers 3

    .line 294
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->canvas:Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;

    invoke-virtual {v0, p1}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->setColor(I)V

    .line 295
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->colorPreview:Landroid/view/View;

    if-eqz v0, :cond_12

    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->colorPreview:Landroid/view/View;

    invoke-static {p1}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->pill(I)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 296
    :cond_12
    return-void
.end method

.method private showColorPicker()V
    .registers 15

    .line 299
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->canvas:Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;

    invoke-virtual {v0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->getColor()I

    move-result v0

    .line 300
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "open color picker start="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "designer"

    invoke-static {v2, v1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 301
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 302
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 303
    const/16 v3, 0x10

    invoke-direct {p0, v3}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->dp(I)I

    move-result v4

    const/16 v5, 0xc

    invoke-direct {p0, v5}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->dp(I)I

    move-result v5

    invoke-direct {p0, v3}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->dp(I)I

    move-result v6

    const/4 v7, 0x4

    invoke-direct {p0, v7}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->dp(I)I

    move-result v7

    invoke-virtual {v1, v4, v5, v6, v7}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 304
    new-instance v4, Landroid/view/View;

    invoke-direct {v4, p0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 305
    invoke-static {v0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->pill(I)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 306
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    .line 307
    const/16 v6, 0x1e

    invoke-direct {p0, v6}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->dp(I)I

    move-result v6

    const/4 v7, -0x1

    invoke-direct {v5, v7, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 306
    invoke-virtual {v1, v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 309
    invoke-static {v0}, Landroid/graphics/Color;->red(I)I

    move-result v5

    invoke-static {v0}, Landroid/graphics/Color;->green(I)I

    move-result v6

    invoke-static {v0}, Landroid/graphics/Color;->blue(I)I

    move-result v0

    filled-new-array {v5, v6, v0}, [I

    move-result-object v0

    .line 310
    const/4 v5, 0x3

    new-array v6, v5, [Ljava/lang/String;

    const/4 v7, 0x0

    const-string v8, "R"

    aput-object v8, v6, v7

    const-string v8, "G"

    aput-object v8, v6, v2

    const-string v2, "B"

    const/4 v8, 0x2

    aput-object v2, v6, v8

    .line 311
    new-array v2, v5, [Landroid/widget/SeekBar;

    .line 312
    const/4 v8, 0x0

    :goto_7e
    if-ge v8, v5, :cond_cc

    .line 313
    nop

    .line 314
    new-instance v9, Landroid/widget/LinearLayout;

    invoke-direct {v9, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 315
    invoke-virtual {v9, v7}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 316
    invoke-virtual {v9, v3}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 317
    aget-object v10, v6, v8

    const/16 v11, 0xd

    const v12, -0xbbbbbc

    invoke-direct {p0, v10, v11, v12}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 318
    new-instance v10, Landroid/widget/SeekBar;

    invoke-direct {v10, p0}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;)V

    .line 319
    const/16 v11, 0xff

    invoke-virtual {v10, v11}, Landroid/widget/SeekBar;->setMax(I)V

    .line 320
    aget v11, v0, v8

    invoke-virtual {v10, v11}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 321
    new-instance v11, Lcom/trueaxis/modmenu/LiveryDesignerActivity$12;

    invoke-direct {v11, p0, v0, v8, v4}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$12;-><init>(Lcom/trueaxis/modmenu/LiveryDesignerActivity;[IILandroid/view/View;)V

    invoke-virtual {v10, v11}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 333
    aput-object v10, v2, v8

    .line 334
    new-instance v11, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v12, -0x2

    const/high16 v13, 0x3f800000

    invoke-direct {v11, v7, v12, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 336
    const/16 v12, 0x8

    invoke-direct {p0, v12}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->dp(I)I

    move-result v12

    iput v12, v11, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 337
    invoke-virtual {v9, v10, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 338
    invoke-virtual {v1, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 312
    add-int/lit8 v8, v8, 0x1

    goto :goto_7e

    .line 340
    :cond_cc
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 341
    const-string v3, "Custom colour"

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 342
    invoke-virtual {v2, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Lcom/trueaxis/modmenu/LiveryDesignerActivity$13;

    invoke-direct {v2, p0, v0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$13;-><init>(Lcom/trueaxis/modmenu/LiveryDesignerActivity;[I)V

    .line 343
    const-string v0, "Use"

    invoke-virtual {v1, v0, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 348
    const-string v1, "Cancel"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 349
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 350
    return-void
.end method

.method private text(Ljava/lang/String;II)Landroid/widget/TextView;
    .registers 5

    .line 359
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 360
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 361
    int-to-float p1, p2

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 362
    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 363
    return-object v0
.end method

.method private toolButton(Ljava/lang/String;)Landroid/widget/Button;
    .registers 6

    .line 367
    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 368
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 369
    const/4 p1, 0x0

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setAllCaps(Z)V

    .line 370
    const/high16 v1, 0x41400000

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTextSize(F)V

    .line 371
    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTextColor(I)V

    .line 372
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinHeight(I)V

    .line 373
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinimumHeight(I)V

    .line 374
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinWidth(I)V

    .line 375
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinimumWidth(I)V

    .line 376
    const/16 p1, 0xa

    invoke-direct {p0, p1}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->dp(I)I

    move-result v1

    const/4 v2, 0x6

    invoke-direct {p0, v2}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->dp(I)I

    move-result v3

    invoke-direct {p0, p1}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->dp(I)I

    move-result p1

    invoke-direct {p0, v2}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->dp(I)I

    move-result v2

    invoke-virtual {v0, v1, v3, p1, v2}, Landroid/widget/Button;->setPadding(IIII)V

    .line 377
    sget p1, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->PANEL:I

    invoke-static {p1}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->pill(I)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 378
    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x2

    invoke-direct {p1, v1, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 380
    const/4 v1, 0x4

    invoke-direct {p0, v1}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->dp(I)I

    move-result v1

    iput v1, p1, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 381
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 382
    return-object v0
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .registers 8

    .line 58
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 59
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModDebugLog;->install(Landroid/content/Context;)V

    .line 60
    invoke-virtual {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_18

    invoke-virtual {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v2, "car"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    goto :goto_19

    :cond_18
    const/4 v0, 0x0

    :goto_19
    iput v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->car:I

    .line 61
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onCreate car="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->car:I

    invoke-static {v2}, Lcom/trueaxis/modmenu/ModMenu;->carName(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " savedState="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/4 v2, 0x1

    if-eqz p1, :cond_3b

    const/4 p1, 0x1

    goto :goto_3c

    :cond_3b
    const/4 p1, 0x0

    :goto_3c
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "designer"

    invoke-static {v0, p1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    iget p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->car:I

    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/ModMenu;->loadEditableLivery(Landroid/content/Context;I)Landroid/graphics/Bitmap;

    move-result-object p1

    .line 65
    if-nez p1, :cond_64

    .line 66
    const-string p1, "editable livery unavailable; creating blank texture"

    invoke-static {v0, p1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    invoke-static {}, Lcom/trueaxis/modmenu/ModMenu;->textureSize()I

    move-result p1

    invoke-static {}, Lcom/trueaxis/modmenu/ModMenu;->textureSize()I

    move-result v0

    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {p1, v0, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p1

    .line 71
    :cond_64
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 72
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 73
    sget v2, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->BG:I

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 74
    const/16 v2, 0x8

    invoke-direct {p0, v2}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->dp(I)I

    move-result v3

    const/4 v4, 0x6

    invoke-direct {p0, v4}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->dp(I)I

    move-result v5

    invoke-direct {p0, v2}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->dp(I)I

    move-result v2

    invoke-direct {p0, v4}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->dp(I)I

    move-result v4

    invoke-virtual {v0, v3, v5, v2, v4}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 76
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget v3, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->car:I

    invoke-static {v3}, Lcom/trueaxis/modmenu/ModMenu;->carName(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " \u00c3\u00a2\u00e2\u201a\u00ac\u00e2\u20ac\u009d livery designer"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x10

    sget v4, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->ACCENT:I

    invoke-direct {p0, v2, v3, v4}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v2

    .line 77
    const/4 v3, 0x4

    invoke-direct {p0, v3}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->dp(I)I

    move-result v4

    invoke-direct {p0, v3}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->dp(I)I

    move-result v5

    invoke-virtual {v2, v4, v1, v1, v5}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 78
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 80
    new-instance v2, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;

    invoke-direct {v2, p0, p1}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;-><init>(Landroid/content/Context;Landroid/graphics/Bitmap;)V

    iput-object v2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->canvas:Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;

    .line 82
    invoke-direct {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->buildToolRow()Landroid/view/View;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 83
    invoke-direct {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->buildColorRow()Landroid/view/View;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 84
    invoke-direct {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->buildSizeRow()Landroid/view/View;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 86
    new-instance p1, Landroid/widget/FrameLayout;

    invoke-direct {p1, p0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 87
    const/4 v2, 0x2

    invoke-direct {p0, v2}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->dp(I)I

    move-result v4

    invoke-direct {p0, v3}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->dp(I)I

    move-result v5

    invoke-direct {p0, v2}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->dp(I)I

    move-result v2

    invoke-direct {p0, v3}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->dp(I)I

    move-result v3

    invoke-virtual {p1, v4, v5, v2, v3}, Landroid/widget/FrameLayout;->setPadding(IIII)V

    .line 88
    iget-object v2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->canvas:Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;

    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v4, -0x1

    invoke-direct {v3, v4, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v2, v3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 90
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v3, 0x3f800000

    invoke-direct {v2, v4, v1, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, p1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 93
    invoke-direct {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->buildBottomBar()Landroid/view/View;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 95
    invoke-virtual {p0, v0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->setContentView(Landroid/view/View;)V

    .line 96
    iget-object p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->canvas:Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;

    new-instance v0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$1;

    invoke-direct {v0, p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$1;-><init>(Lcom/trueaxis/modmenu/LiveryDesignerActivity;)V

    invoke-virtual {p1, v0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->setColorListener(Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView$ColorListener;)V

    .line 102
    sget-object p1, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->SWATCHES:[I

    const/4 v0, 0x3

    aget p1, p1, v0

    invoke-direct {p0, p1}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->setColor(I)V

    .line 103
    const-string p1, "designer ready"

    invoke-static {p1}, Lcom/trueaxis/modmenu/ModDebugLog;->logRuntime(Ljava/lang/String;)V

    .line 104
    return-void
.end method
