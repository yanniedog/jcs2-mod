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

    .line 202
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 203
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 204
    const/4 v2, 0x4

    invoke-direct {p0, v2}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->dp(I)I

    move-result v2

    invoke-virtual {v0, v1, v2, v1, v1}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 206
    const-string v1, "Undo"

    invoke-direct {p0, v1}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->toolButton(Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v1

    .line 207
    new-instance v2, Lcom/trueaxis/modmenu/LiveryDesignerActivity$6;

    invoke-direct {v2, p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$6;-><init>(Lcom/trueaxis/modmenu/LiveryDesignerActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 212
    const-string v2, "Redo"

    invoke-direct {p0, v2}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->toolButton(Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v2

    .line 213
    new-instance v3, Lcom/trueaxis/modmenu/LiveryDesignerActivity$7;

    invoke-direct {v3, p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$7;-><init>(Lcom/trueaxis/modmenu/LiveryDesignerActivity;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 218
    const-string v3, "Revert"

    invoke-direct {p0, v3}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->toolButton(Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v3

    .line 219
    new-instance v4, Lcom/trueaxis/modmenu/LiveryDesignerActivity$8;

    invoke-direct {v4, p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$8;-><init>(Lcom/trueaxis/modmenu/LiveryDesignerActivity;)V

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 224
    const-string v4, "Cancel"

    invoke-direct {p0, v4}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->toolButton(Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v4

    .line 225
    new-instance v5, Lcom/trueaxis/modmenu/LiveryDesignerActivity$9;

    invoke-direct {v5, p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$9;-><init>(Lcom/trueaxis/modmenu/LiveryDesignerActivity;)V

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 230
    const-string v5, "SAVE"

    invoke-direct {p0, v5}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->toolButton(Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v5

    .line 231
    sget v6, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->ACCENT:I

    invoke-static {v6}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->pill(I)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/Button;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 232
    const/high16 v6, -0x1000000

    invoke-virtual {v5, v6}, Landroid/widget/Button;->setTextColor(I)V

    .line 233
    new-instance v6, Lcom/trueaxis/modmenu/LiveryDesignerActivity$10;

    invoke-direct {v6, p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$10;-><init>(Lcom/trueaxis/modmenu/LiveryDesignerActivity;)V

    invoke-virtual {v5, v6}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 239
    invoke-direct {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->even()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v6

    invoke-virtual {v0, v1, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 240
    invoke-direct {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->even()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 241
    invoke-direct {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->even()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v1

    invoke-virtual {v0, v3, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 242
    invoke-direct {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->even()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v1

    invoke-virtual {v0, v4, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 243
    invoke-direct {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->even()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v1

    invoke-virtual {v0, v5, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 244
    return-object v0
.end method

.method private buildColorRow()Landroid/view/View;
    .registers 10

    .line 132
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 133
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 134
    const/16 v2, 0x10

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 135
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

    .line 137
    new-instance v2, Landroid/view/View;

    invoke-direct {v2, p0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->colorPreview:Landroid/view/View;

    .line 138
    iget-object v2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->colorPreview:Landroid/view/View;

    const/4 v3, -0x1

    invoke-static {v3}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->pill(I)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 139
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

    .line 141
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 142
    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 143
    const/4 v3, 0x0

    :goto_53
    sget-object v5, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->SWATCHES:[I

    array-length v5, v5

    if-ge v3, v5, :cond_8b

    .line 144
    sget-object v5, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->SWATCHES:[I

    aget v5, v5, v3

    .line 145
    new-instance v6, Landroid/view/View;

    invoke-direct {v6, p0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 146
    invoke-static {v5}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->pill(I)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 147
    new-instance v7, Lcom/trueaxis/modmenu/LiveryDesignerActivity$3;

    invoke-direct {v7, p0, v5}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$3;-><init>(Lcom/trueaxis/modmenu/LiveryDesignerActivity;I)V

    invoke-virtual {v6, v7}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 152
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v7, 0x16

    invoke-direct {p0, v7}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->dp(I)I

    move-result v8

    invoke-direct {p0, v7}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->dp(I)I

    move-result v7

    invoke-direct {v5, v8, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 153
    invoke-direct {p0, v4}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->dp(I)I

    move-result v7

    iput v7, v5, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 154
    invoke-virtual {v2, v6, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 143
    add-int/lit8 v3, v3, 0x1

    goto :goto_53

    .line 156
    :cond_8b
    const-string v3, "RGB"

    invoke-direct {p0, v3}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->toolButton(Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v3

    .line 157
    new-instance v4, Lcom/trueaxis/modmenu/LiveryDesignerActivity$4;

    invoke-direct {v4, p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$4;-><init>(Lcom/trueaxis/modmenu/LiveryDesignerActivity;)V

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 162
    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 164
    new-instance v3, Landroid/widget/HorizontalScrollView;

    invoke-direct {v3, p0}, Landroid/widget/HorizontalScrollView;-><init>(Landroid/content/Context;)V

    .line 165
    invoke-virtual {v3, v1}, Landroid/widget/HorizontalScrollView;->setHorizontalScrollBarEnabled(Z)V

    .line 166
    invoke-virtual {v3, v2}, Landroid/widget/HorizontalScrollView;->addView(Landroid/view/View;)V

    .line 167
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x2

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-direct {v2, v1, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 169
    const/16 v1, 0x8

    invoke-direct {p0, v1}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->dp(I)I

    move-result v1

    iput v1, v2, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 170
    invoke-virtual {v0, v3, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 171
    return-object v0
.end method

.method private buildSizeRow()Landroid/view/View;
    .registers 7

    .line 175
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 176
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 177
    const/16 v2, 0x10

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 178
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

    .line 179
    new-instance v2, Landroid/widget/SeekBar;

    invoke-direct {v2, p0}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;)V

    .line 180
    const/16 v3, 0x50

    invoke-virtual {v2, v3}, Landroid/widget/SeekBar;->setMax(I)V

    .line 181
    const/16 v3, 0xa

    invoke-virtual {v2, v3}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 182
    iget-object v3, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->canvas:Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;

    const/high16 v4, 0x41200000    # 10.0f

    invoke-virtual {v3, v4}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->setStrokeWidth(F)V

    .line 183
    new-instance v3, Lcom/trueaxis/modmenu/LiveryDesignerActivity$5;

    invoke-direct {v3, p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$5;-><init>(Lcom/trueaxis/modmenu/LiveryDesignerActivity;)V

    invoke-virtual {v2, v3}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 194
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x2

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-direct {v3, v1, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 196
    const/16 v1, 0x8

    invoke-direct {p0, v1}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->dp(I)I

    move-result v1

    iput v1, v3, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 197
    invoke-virtual {v0, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 198
    return-object v0
.end method

.method private buildToolRow()Landroid/view/View;
    .registers 11

    .line 101
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 102
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 103
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

    .line 104
    new-array v4, v2, [I

    fill-array-data v4, :array_70

    .line 106
    new-array v5, v2, [Landroid/widget/Button;

    .line 107
    const/4 v6, 0x0

    :goto_36
    if-ge v6, v2, :cond_51

    .line 108
    aget v7, v4, v6

    .line 109
    nop

    .line 110
    aget-object v8, v3, v6

    invoke-direct {p0, v8}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->toolButton(Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v8

    .line 111
    new-instance v9, Lcom/trueaxis/modmenu/LiveryDesignerActivity$2;

    invoke-direct {v9, p0, v7, v5, v6}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$2;-><init>(Lcom/trueaxis/modmenu/LiveryDesignerActivity;I[Landroid/widget/Button;I)V

    invoke-virtual {v8, v9}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 120
    aput-object v8, v5, v6

    .line 121
    invoke-virtual {v0, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 107
    add-int/lit8 v6, v6, 0x1

    goto :goto_36

    .line 123
    :cond_51
    aget-object v2, v5, v1

    sget v3, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->ACCENT:I

    invoke-static {v3}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->pill(I)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 124
    aget-object v2, v5, v1

    const/high16 v3, -0x1000000

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setTextColor(I)V

    .line 125
    new-instance v2, Landroid/widget/HorizontalScrollView;

    invoke-direct {v2, p0}, Landroid/widget/HorizontalScrollView;-><init>(Landroid/content/Context;)V

    .line 126
    invoke-virtual {v2, v1}, Landroid/widget/HorizontalScrollView;->setHorizontalScrollBarEnabled(Z)V

    .line 127
    invoke-virtual {v2, v0}, Landroid/widget/HorizontalScrollView;->addView(Landroid/view/View;)V

    .line 128
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

    .line 248
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 249
    const-string v1, "Revert to bundled livery?"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 250
    const-string v1, "Discards your edits and starts again from the original car texture."

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lcom/trueaxis/modmenu/LiveryDesignerActivity$11;

    invoke-direct {v1, p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$11;-><init>(Lcom/trueaxis/modmenu/LiveryDesignerActivity;)V

    .line 251
    const-string v2, "Revert"

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 258
    const-string v1, "Keep editing"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 259
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 260
    return-void
.end method

.method private dp(I)I
    .registers 3

    .line 335
    int-to-float p1, p1

    invoke-virtual {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    mul-float p1, p1, v0

    const/high16 v0, 0x3f000000    # 0.5f

    add-float/2addr p1, v0

    float-to-int p1, p1

    return p1
.end method

.method private even()Landroid/widget/LinearLayout$LayoutParams;
    .registers 5

    .line 366
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x2

    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v3, 0x0

    invoke-direct {v0, v3, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 368
    const/4 v1, 0x4

    invoke-direct {p0, v1}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->dp(I)I

    move-result v1

    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 369
    return-object v0
.end method

.method private static pill(I)Landroid/graphics/drawable/GradientDrawable;
    .registers 3

    .line 373
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 374
    invoke-virtual {v0, p0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 375
    const/high16 p0, 0x41400000    # 12.0f

    invoke-virtual {v0, p0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 376
    const/16 p0, 0x3c

    const/16 v1, 0xff

    invoke-static {p0, v1, v1, v1}, Landroid/graphics/Color;->argb(IIII)I

    move-result p0

    const/4 v1, 0x2

    invoke-virtual {v0, v1, p0}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 377
    return-object v0
.end method

.method private save()V
    .registers 5

    .line 264
    const/4 v0, 0x1

    :try_start_1
    iget v1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->car:I

    iget-object v2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->canvas:Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;

    invoke-virtual {v2}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v2

    invoke-static {p0, v1, v2}, Lcom/trueaxis/modmenu/ModMenu;->saveDesignedLivery(Landroid/content/Context;ILandroid/graphics/Bitmap;)V

    .line 265
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget v2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->car:I

    invoke-static {v2}, Lcom/trueaxis/modmenu/ModMenu;->carName(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " livery saved. Restart the game to see it."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    .line 266
    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 267
    invoke-virtual {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->finish()V
    :try_end_2f
    .catchall {:try_start_1 .. :try_end_2f} :catchall_30

    .line 271
    goto :goto_56

    .line 268
    :catchall_30
    move-exception v1

    .line 269
    const-string v2, "MCS2Mod"

    const-string v3, "Could not save designed livery"

    invoke-static {v2, v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 270
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Could not save livery: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 272
    :goto_56
    return-void
.end method

.method private setColor(I)V
    .registers 3

    .line 275
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->canvas:Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;

    invoke-virtual {v0, p1}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->setColor(I)V

    .line 276
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->colorPreview:Landroid/view/View;

    if-eqz v0, :cond_12

    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->colorPreview:Landroid/view/View;

    invoke-static {p1}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->pill(I)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 277
    :cond_12
    return-void
.end method

.method private showColorPicker()V
    .registers 15

    .line 280
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->canvas:Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;

    invoke-virtual {v0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->getColor()I

    move-result v0

    .line 281
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 282
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 283
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

    .line 284
    new-instance v4, Landroid/view/View;

    invoke-direct {v4, p0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 285
    invoke-static {v0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->pill(I)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 286
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    .line 287
    const/16 v6, 0x1e

    invoke-direct {p0, v6}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->dp(I)I

    move-result v6

    const/4 v7, -0x1

    invoke-direct {v5, v7, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 286
    invoke-virtual {v1, v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 289
    invoke-static {v0}, Landroid/graphics/Color;->red(I)I

    move-result v5

    invoke-static {v0}, Landroid/graphics/Color;->green(I)I

    move-result v6

    invoke-static {v0}, Landroid/graphics/Color;->blue(I)I

    move-result v0

    filled-new-array {v5, v6, v0}, [I

    move-result-object v0

    .line 290
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

    .line 291
    new-array v2, v5, [Landroid/widget/SeekBar;

    .line 292
    const/4 v8, 0x0

    :goto_66
    if-ge v8, v5, :cond_b4

    .line 293
    nop

    .line 294
    new-instance v9, Landroid/widget/LinearLayout;

    invoke-direct {v9, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 295
    invoke-virtual {v9, v7}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 296
    invoke-virtual {v9, v3}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 297
    aget-object v10, v6, v8

    const/16 v11, 0xd

    const v12, -0xbbbbbc

    invoke-direct {p0, v10, v11, v12}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 298
    new-instance v10, Landroid/widget/SeekBar;

    invoke-direct {v10, p0}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;)V

    .line 299
    const/16 v11, 0xff

    invoke-virtual {v10, v11}, Landroid/widget/SeekBar;->setMax(I)V

    .line 300
    aget v11, v0, v8

    invoke-virtual {v10, v11}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 301
    new-instance v11, Lcom/trueaxis/modmenu/LiveryDesignerActivity$12;

    invoke-direct {v11, p0, v0, v8, v4}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$12;-><init>(Lcom/trueaxis/modmenu/LiveryDesignerActivity;[IILandroid/view/View;)V

    invoke-virtual {v10, v11}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 313
    aput-object v10, v2, v8

    .line 314
    new-instance v11, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v12, -0x2

    const/high16 v13, 0x3f800000    # 1.0f

    invoke-direct {v11, v7, v12, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 316
    const/16 v12, 0x8

    invoke-direct {p0, v12}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->dp(I)I

    move-result v12

    iput v12, v11, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 317
    invoke-virtual {v9, v10, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 318
    invoke-virtual {v1, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 292
    add-int/lit8 v8, v8, 0x1

    goto :goto_66

    .line 320
    :cond_b4
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 321
    const-string v3, "Custom colour"

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 322
    invoke-virtual {v2, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Lcom/trueaxis/modmenu/LiveryDesignerActivity$13;

    invoke-direct {v2, p0, v0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$13;-><init>(Lcom/trueaxis/modmenu/LiveryDesignerActivity;[I)V

    .line 323
    const-string v0, "Use"

    invoke-virtual {v1, v0, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 328
    const-string v1, "Cancel"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 329
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 330
    return-void
.end method

.method private text(Ljava/lang/String;II)Landroid/widget/TextView;
    .registers 5

    .line 339
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 340
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 341
    int-to-float p1, p2

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 342
    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 343
    return-object v0
.end method

.method private toolButton(Ljava/lang/String;)Landroid/widget/Button;
    .registers 6

    .line 347
    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 348
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 349
    const/4 p1, 0x0

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setAllCaps(Z)V

    .line 350
    const/high16 v1, 0x41400000    # 12.0f

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTextSize(F)V

    .line 351
    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTextColor(I)V

    .line 352
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinHeight(I)V

    .line 353
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinimumHeight(I)V

    .line 354
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinWidth(I)V

    .line 355
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinimumWidth(I)V

    .line 356
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

    .line 357
    sget p1, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->PANEL:I

    invoke-static {p1}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->pill(I)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 358
    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x2

    invoke-direct {p1, v1, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 360
    const/4 v1, 0x4

    invoke-direct {p0, v1}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->dp(I)I

    move-result v1

    iput v1, p1, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 361
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 362
    return-object v0
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .registers 8

    .line 58
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 59
    invoke-virtual {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const/4 v0, 0x0

    if-eqz p1, :cond_15

    invoke-virtual {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v1, "car"

    invoke-virtual {p1, v1, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    goto :goto_16

    :cond_15
    const/4 p1, 0x0

    :goto_16
    iput p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->car:I

    .line 61
    iget p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->car:I

    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/ModMenu;->loadEditableLivery(Landroid/content/Context;I)Landroid/graphics/Bitmap;

    move-result-object p1

    .line 62
    if-nez p1, :cond_2e

    .line 63
    invoke-static {}, Lcom/trueaxis/modmenu/ModMenu;->textureSize()I

    move-result p1

    invoke-static {}, Lcom/trueaxis/modmenu/ModMenu;->textureSize()I

    move-result v1

    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {p1, v1, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p1

    .line 67
    :cond_2e
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 68
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 69
    sget v2, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->BG:I

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 70
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

    invoke-virtual {v1, v3, v5, v2, v4}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 72
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget v3, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->car:I

    invoke-static {v3}, Lcom/trueaxis/modmenu/ModMenu;->carName(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " \u2014 livery designer"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x10

    sget v4, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->ACCENT:I

    invoke-direct {p0, v2, v3, v4}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->text(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v2

    .line 73
    const/4 v3, 0x4

    invoke-direct {p0, v3}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->dp(I)I

    move-result v4

    invoke-direct {p0, v3}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->dp(I)I

    move-result v5

    invoke-virtual {v2, v4, v0, v0, v5}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 74
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 76
    new-instance v2, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;

    invoke-direct {v2, p0, p1}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;-><init>(Landroid/content/Context;Landroid/graphics/Bitmap;)V

    iput-object v2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->canvas:Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;

    .line 78
    invoke-direct {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->buildToolRow()Landroid/view/View;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 79
    invoke-direct {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->buildColorRow()Landroid/view/View;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 80
    invoke-direct {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->buildSizeRow()Landroid/view/View;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 82
    new-instance p1, Landroid/widget/FrameLayout;

    invoke-direct {p1, p0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 83
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

    .line 84
    iget-object v2, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->canvas:Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;

    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v4, -0x1

    invoke-direct {v3, v4, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v2, v3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 86
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-direct {v2, v4, v0, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, p1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 89
    invoke-direct {p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->buildBottomBar()Landroid/view/View;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 91
    invoke-virtual {p0, v1}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->setContentView(Landroid/view/View;)V

    .line 92
    iget-object p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->canvas:Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;

    new-instance v0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$1;

    invoke-direct {v0, p0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$1;-><init>(Lcom/trueaxis/modmenu/LiveryDesignerActivity;)V

    invoke-virtual {p1, v0}, Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView;->setColorListener(Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView$ColorListener;)V

    .line 97
    sget-object p1, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->SWATCHES:[I

    const/4 v0, 0x3

    aget p1, p1, v0

    invoke-direct {p0, p1}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->setColor(I)V

    .line 98
    return-void
.end method
