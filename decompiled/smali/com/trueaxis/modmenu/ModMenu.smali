.class public Lcom/trueaxis/modmenu/ModMenu;
.super Ljava/lang/Object;
.source "ModMenu.java"


# static fields
.field private static final CAR_NAMES:[Ljava/lang/String;

.field private static final CAR_TEXTURES:[Ljava/lang/String;

.field private static final CHECKPOINTS_VALUE:Ljava/lang/String; = "999"

.field private static final K_CAR:Ljava/lang/String; = "livery_car"

.field private static final K_NOADS:Ljava/lang/String; = "disable_ads"

.field private static final K_UNLOCK:Ljava/lang/String; = "unlock_all"

.field private static final PREFS:Ljava/lang/String; = "jcs_mod"

.field private static final REQUEST_EXPORT:I = 0x1c86

.field private static final REQUEST_IMPORT:I = 0x1c85

.field private static final TEXTURE_SIZE:I = 0x200


# direct methods
.method static constructor <clinit>()V
    .registers 10

    .line 51
    const/4 v0, 0x7

    new-array v1, v0, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Buggy"

    aput-object v3, v1, v2

    const/4 v3, 0x1

    const-string v4, "Original jetcar"

    aput-object v4, v1, v3

    const/4 v4, 0x2

    const-string v5, "Jet"

    aput-object v5, v1, v4

    const/4 v5, 0x3

    const-string v6, "Mini"

    aput-object v6, v1, v5

    const/4 v6, 0x4

    const-string v7, "Sports"

    aput-object v7, v1, v6

    const/4 v7, 0x5

    const-string v8, "Stock"

    aput-object v8, v1, v7

    const/4 v8, 0x6

    const-string v9, "Truck"

    aput-object v9, v1, v8

    sput-object v1, Lcom/trueaxis/modmenu/ModMenu;->CAR_NAMES:[Ljava/lang/String;

    .line 54
    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "cars/buggy/buggy1.png"

    aput-object v1, v0, v2

    const-string v1, "cars/original/rocketcar1.png"

    aput-object v1, v0, v3

    const-string v1, "cars/jet/jet1.png"

    aput-object v1, v0, v4

    const-string v1, "cars/mini/mini1.png"

    aput-object v1, v0, v5

    const-string v1, "cars/sports/sportscar1.png"

    aput-object v1, v0, v6

    const-string v1, "cars/stock/stock1.png"

    aput-object v1, v0, v7

    const-string v1, "cars/truck/truck1.png"

    aput-object v1, v0, v8

    sput-object v0, Lcom/trueaxis/modmenu/ModMenu;->CAR_TEXTURES:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Landroid/content/Context;ZZZZZZ)V
    .registers 7

    .line 40
    invoke-static/range {p0 .. p6}, Lcom/trueaxis/modmenu/ModMenu;->saveQuickCheats(Landroid/content/Context;ZZZZZZ)V

    return-void
.end method

.method static synthetic access$100(Landroid/content/Context;Landroid/widget/Spinner;)V
    .registers 2

    .line 40
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/ModMenu;->rememberCar(Landroid/content/Context;Landroid/widget/Spinner;)V

    return-void
.end method

.method static synthetic access$200(Landroid/content/Context;Ljava/lang/String;)V
    .registers 2

    .line 40
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/ModMenu;->toast(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$300(Landroid/content/Context;I)Ljava/io/File;
    .registers 2

    .line 40
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/ModMenu;->customTexture(Landroid/content/Context;I)Ljava/io/File;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$400(Landroid/content/Context;)I
    .registers 1

    .line 40
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->selectedCar(Landroid/content/Context;)I

    move-result p0

    return p0
.end method

.method static synthetic access$500()[Ljava/lang/String;
    .registers 1

    .line 40
    sget-object v0, Lcom/trueaxis/modmenu/ModMenu;->CAR_NAMES:[Ljava/lang/String;

    return-object v0
.end method

.method private static addCheat(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Z)Landroid/widget/CheckBox;
    .registers 8

    .line 108
    new-instance v0, Landroid/widget/CheckBox;

    invoke-direct {v0, p0}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    .line 109
    invoke-virtual {v0, p2}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    .line 110
    const/4 p2, -0x1

    invoke-virtual {v0, p2}, Landroid/widget/CheckBox;->setTextColor(I)V

    .line 111
    const/high16 p2, 0x41500000    # 13.0f

    invoke-virtual {v0, p2}, Landroid/widget/CheckBox;->setTextSize(F)V

    .line 112
    invoke-virtual {v0, p4}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 113
    invoke-virtual {v0}, Landroid/widget/CheckBox;->getPaddingLeft()I

    move-result p2

    const/4 p4, 0x4

    invoke-static {p0, p4}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result p4

    const/4 v1, 0x0

    invoke-virtual {v0, p2, p4, v1, v1}, Landroid/widget/CheckBox;->setPadding(IIII)V

    .line 114
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 115
    const/16 p2, 0x9e

    const/16 p4, 0xa5

    const/16 v2, 0x96

    invoke-static {v2, p2, p4}, Landroid/graphics/Color;->rgb(III)I

    move-result p2

    const/16 p4, 0xa

    invoke-static {p0, p3, p4, p2}, Lcom/trueaxis/modmenu/ModMenu;->label(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object p2

    .line 116
    const/16 p3, 0x26

    invoke-static {p0, p3}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result p3

    const/4 p4, 0x2

    invoke-static {p0, p4}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result p0

    invoke-virtual {p2, p3, v1, v1, p0}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 117
    invoke-virtual {p1, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 118
    return-object v0
.end method

.method public static adsDisabled(Landroid/content/Context;)Z
    .registers 3

    .line 220
    const/4 v0, 0x1

    if-nez p0, :cond_4

    return v0

    .line 221
    :cond_4
    :try_start_4
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v1, "disable_ads"

    invoke-interface {p0, v1, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0
    :try_end_e
    .catchall {:try_start_4 .. :try_end_e} :catchall_f

    return p0

    :catchall_f
    move-exception p0

    return v0
.end method

.method private static background(IF)Landroid/graphics/drawable/GradientDrawable;
    .registers 3

    .line 69
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 70
    invoke-virtual {v0, p0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 71
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 72
    return-object v0
.end method

.method private static button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;
    .registers 6

    .line 84
    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 85
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 86
    const/high16 p1, 0x41300000    # 11.0f

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setTextSize(F)V

    .line 87
    const/4 p1, 0x0

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setAllCaps(Z)V

    .line 88
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinHeight(I)V

    .line 89
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinimumHeight(I)V

    .line 90
    const/16 p1, 0xa

    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v1

    const/4 v2, 0x7

    invoke-static {p0, v2}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v3

    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result p1

    invoke-static {p0, v2}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result p0

    invoke-virtual {v0, v1, v3, p1, p0}, Landroid/widget/Button;->setPadding(IIII)V

    .line 91
    return-object v0
.end method

.method public static carAssetPath(I)Ljava/lang/String;
    .registers 2

    .line 141
    sget-object v0, Lcom/trueaxis/modmenu/ModMenu;->CAR_TEXTURES:[Ljava/lang/String;

    aget-object p0, v0, p0

    return-object p0
.end method

.method public static carCount()I
    .registers 1

    .line 133
    sget-object v0, Lcom/trueaxis/modmenu/ModMenu;->CAR_NAMES:[Ljava/lang/String;

    array-length v0, v0

    return v0
.end method

.method public static carCustomFile(Landroid/content/Context;I)Ljava/io/File;
    .registers 2

    .line 145
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/ModMenu;->customTexture(Landroid/content/Context;I)Ljava/io/File;

    move-result-object p0

    return-object p0
.end method

.method public static carName(I)Ljava/lang/String;
    .registers 2

    .line 137
    if-ltz p0, :cond_c

    sget-object v0, Lcom/trueaxis/modmenu/ModMenu;->CAR_NAMES:[Ljava/lang/String;

    array-length v0, v0

    if-ge p0, v0, :cond_c

    sget-object v0, Lcom/trueaxis/modmenu/ModMenu;->CAR_NAMES:[Ljava/lang/String;

    aget-object p0, v0, p0

    goto :goto_e

    :cond_c
    const-string p0, "Car"

    :goto_e
    return-object p0
.end method

.method private static closeQuietly(Ljava/io/Closeable;)V
    .registers 1

    .line 202
    if-nez p0, :cond_3

    return-void

    .line 204
    :cond_3
    :try_start_3
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_6
    .catchall {:try_start_3 .. :try_end_6} :catchall_7

    .line 206
    goto :goto_8

    .line 205
    :catchall_7
    move-exception p0

    .line 207
    :goto_8
    return-void
.end method

.method private static customTexture(Landroid/content/Context;I)Ljava/io/File;
    .registers 4

    .line 122
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object p0

    sget-object v1, Lcom/trueaxis/modmenu/ModMenu;->CAR_TEXTURES:[Ljava/lang/String;

    aget-object p1, v1, p1

    invoke-direct {v0, p0, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method private static decodeSampled(Landroid/content/Context;Landroid/net/Uri;)Landroid/graphics/Bitmap;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 518
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 519
    const/4 v1, 0x1

    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 520
    nop

    .line 522
    const/4 v2, 0x0

    :try_start_a
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    invoke-virtual {v3, p1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v3
    :try_end_12
    .catchall {:try_start_a .. :try_end_12} :catchall_52

    .line 523
    :try_start_12
    invoke-static {v3, v2, v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    :try_end_15
    .catchall {:try_start_12 .. :try_end_15} :catchall_4f

    .line 525
    invoke-static {v3}, Lcom/trueaxis/modmenu/ModMenu;->closeQuietly(Ljava/io/Closeable;)V

    .line 526
    nop

    .line 527
    nop

    .line 528
    iget v3, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iget v0, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    invoke-static {v3, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 529
    :goto_22
    div-int v3, v0, v1

    const/16 v4, 0x400

    if-le v3, v4, :cond_2b

    mul-int/lit8 v1, v1, 0x2

    goto :goto_22

    .line 531
    :cond_2b
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 532
    iput v1, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 533
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    iput-object v1, v0, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    .line 534
    nop

    .line 536
    :try_start_37
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object p0
    :try_end_3f
    .catchall {:try_start_37 .. :try_end_3f} :catchall_4a

    .line 537
    :try_start_3f
    invoke-static {p0, v2, v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object p1
    :try_end_43
    .catchall {:try_start_3f .. :try_end_43} :catchall_47

    .line 539
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->closeQuietly(Ljava/io/Closeable;)V

    .line 537
    return-object p1

    .line 539
    :catchall_47
    move-exception p1

    move-object v2, p0

    goto :goto_4b

    :catchall_4a
    move-exception p1

    :goto_4b
    invoke-static {v2}, Lcom/trueaxis/modmenu/ModMenu;->closeQuietly(Ljava/io/Closeable;)V

    .line 540
    throw p1

    .line 525
    :catchall_4f
    move-exception p0

    move-object v2, v3

    goto :goto_53

    :catchall_52
    move-exception p0

    :goto_53
    invoke-static {v2}, Lcom/trueaxis/modmenu/ModMenu;->closeQuietly(Ljava/io/Closeable;)V

    .line 526
    goto :goto_58

    :goto_57
    throw p0

    :goto_58
    goto :goto_57
.end method

.method public static deleteCustomLivery(Landroid/content/Context;I)V
    .registers 4

    .line 600
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/ModMenu;->customTexture(Landroid/content/Context;I)Ljava/io/File;

    move-result-object v0

    .line 601
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_d

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 602
    :cond_d
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/ModMenu;->externalTexture(Landroid/content/Context;I)Ljava/io/File;

    move-result-object p0

    .line 603
    if-eqz p0, :cond_1c

    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result p1

    if-eqz p1, :cond_1c

    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    .line 604
    :cond_1c
    return-void
.end method

.method private static dp(Landroid/content/Context;I)I
    .registers 2

    .line 65
    int-to-float p1, p1

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    mul-float p1, p1, p0

    const/high16 p0, 0x3f000000    # 0.5f

    add-float/2addr p1, p0

    float-to-int p0, p1

    return p0
.end method

.method private static exportLivery(Landroid/content/Context;Landroid/net/Uri;I)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 579
    nop

    .line 580
    nop

    .line 582
    const/4 v0, 0x0

    :try_start_3
    invoke-static {p0, p2}, Lcom/trueaxis/modmenu/ModMenu;->customTexture(Landroid/content/Context;I)Ljava/io/File;

    move-result-object v1

    .line 583
    invoke-virtual {v1}, Ljava/io/File;->isFile()Z

    move-result v2

    if-eqz v2, :cond_13

    .line 584
    new-instance p2, Ljava/io/FileInputStream;

    invoke-direct {p2, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    goto :goto_1f

    .line 585
    :cond_13
    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v1

    sget-object v2, Lcom/trueaxis/modmenu/ModMenu;->CAR_TEXTURES:[Ljava/lang/String;

    aget-object p2, v2, p2

    invoke-virtual {v1, p2}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p2
    :try_end_1f
    .catchall {:try_start_3 .. :try_end_1f} :catchall_50

    .line 586
    :goto_1f
    :try_start_1f
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/content/ContentResolver;->openOutputStream(Landroid/net/Uri;)Ljava/io/OutputStream;

    move-result-object v0

    .line 587
    if-eqz v0, :cond_44

    .line 588
    const/16 p0, 0x4000

    new-array p0, p0, [B

    .line 590
    :goto_2d
    invoke-virtual {p2, p0}, Ljava/io/InputStream;->read([B)I

    move-result p1

    const/4 v1, -0x1

    if-eq p1, v1, :cond_39

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1, p1}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_2d

    .line 591
    :cond_39
    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V
    :try_end_3c
    .catchall {:try_start_1f .. :try_end_3c} :catchall_4c

    .line 593
    invoke-static {p2}, Lcom/trueaxis/modmenu/ModMenu;->closeQuietly(Ljava/io/Closeable;)V

    .line 594
    invoke-static {v0}, Lcom/trueaxis/modmenu/ModMenu;->closeQuietly(Ljava/io/Closeable;)V

    .line 595
    nop

    .line 596
    return-void

    .line 587
    :cond_44
    :try_start_44
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Could not open export destination"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_4c
    .catchall {:try_start_44 .. :try_end_4c} :catchall_4c

    .line 593
    :catchall_4c
    move-exception p0

    move-object p1, v0

    move-object v0, p2

    goto :goto_52

    :catchall_50
    move-exception p0

    move-object p1, v0

    :goto_52
    invoke-static {v0}, Lcom/trueaxis/modmenu/ModMenu;->closeQuietly(Ljava/io/Closeable;)V

    .line 594
    invoke-static {p1}, Lcom/trueaxis/modmenu/ModMenu;->closeQuietly(Ljava/io/Closeable;)V

    .line 595
    goto :goto_5a

    :goto_59
    throw p0

    :goto_5a
    goto :goto_59
.end method

.method private static externalTexture(Landroid/content/Context;I)Ljava/io/File;
    .registers 4

    .line 127
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object p0

    .line 128
    if-nez p0, :cond_8

    goto :goto_11

    :cond_8
    new-instance v0, Ljava/io/File;

    sget-object v1, Lcom/trueaxis/modmenu/ModMenu;->CAR_TEXTURES:[Ljava/lang/String;

    aget-object p1, v1, p1

    invoke-direct {v0, p0, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    :goto_11
    return-object v0
.end method

.method private static fill()Landroid/widget/LinearLayout$LayoutParams;
    .registers 3

    .line 101
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    return-object v0
.end method

.method public static handleActivityResult(Landroid/app/Activity;IILandroid/content/Intent;)Z
    .registers 7

    .line 483
    const/16 v0, 0x1c85

    if-eq p1, v0, :cond_a

    const/16 v1, 0x1c86

    if-eq p1, v1, :cond_a

    const/4 p0, 0x0

    return p0

    .line 484
    :cond_a
    const/4 v1, -0x1

    const/4 v2, 0x1

    if-ne p2, v1, :cond_80

    if-eqz p3, :cond_80

    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p2

    if-nez p2, :cond_17

    goto :goto_80

    .line 485
    :cond_17
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p2

    .line 486
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->selectedCar(Landroid/content/Context;)I

    move-result p3

    .line 488
    if-ne p1, v0, :cond_3f

    .line 489
    :try_start_21
    invoke-static {p0, p2, p3}, Lcom/trueaxis/modmenu/ModMenu;->importLivery(Landroid/content/Context;Landroid/net/Uri;I)V

    .line 490
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object p2, Lcom/trueaxis/modmenu/ModMenu;->CAR_NAMES:[Ljava/lang/String;

    aget-object p2, p2, p3

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " livery imported. Restart the game to apply."

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/ModMenu;->toast(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_5c

    .line 492
    :cond_3f
    invoke-static {p0, p2, p3}, Lcom/trueaxis/modmenu/ModMenu;->exportLivery(Landroid/content/Context;Landroid/net/Uri;I)V

    .line 493
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object p2, Lcom/trueaxis/modmenu/ModMenu;->CAR_NAMES:[Ljava/lang/String;

    aget-object p2, p2, p3

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " livery exported for editing."

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/ModMenu;->toast(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_5c
    .catchall {:try_start_21 .. :try_end_5c} :catchall_5d

    .line 498
    :goto_5c
    goto :goto_7f

    .line 495
    :catchall_5d
    move-exception p1

    .line 496
    const-string p2, "MCS2Mod"

    const-string p3, "Livery file operation failed"

    invoke-static {p2, p3, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 497
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "Livery operation failed: "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/ModMenu;->toast(Landroid/content/Context;Ljava/lang/String;)V

    .line 499
    :goto_7f
    return v2

    .line 484
    :cond_80
    :goto_80
    return v2
.end method

.method private static importLivery(Landroid/content/Context;Landroid/net/Uri;I)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 503
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/ModMenu;->decodeSampled(Landroid/content/Context;Landroid/net/Uri;)Landroid/graphics/Bitmap;

    move-result-object p1

    .line 504
    if-eqz p1, :cond_33

    .line 505
    nop

    .line 507
    const/4 v0, 0x1

    const/16 v1, 0x200

    :try_start_a
    invoke-static {p1, v1, v1, v0}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v0
    :try_end_e
    .catchall {:try_start_a .. :try_end_e} :catchall_26

    .line 508
    :try_start_e
    invoke-static {p0, p2}, Lcom/trueaxis/modmenu/ModMenu;->customTexture(Landroid/content/Context;I)Ljava/io/File;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/trueaxis/modmenu/ModMenu;->writeLivery(Ljava/io/File;Landroid/graphics/Bitmap;)V

    .line 509
    invoke-static {p0, p2, v0}, Lcom/trueaxis/modmenu/ModMenu;->mirrorExternal(Landroid/content/Context;ILandroid/graphics/Bitmap;)V
    :try_end_18
    .catchall {:try_start_e .. :try_end_18} :catchall_24

    .line 511
    if-eqz v0, :cond_1f

    if-eq v0, p1, :cond_1f

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 512
    :cond_1f
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    .line 513
    nop

    .line 514
    return-void

    .line 511
    :catchall_24
    move-exception p0

    goto :goto_28

    :catchall_26
    move-exception p0

    const/4 v0, 0x0

    :goto_28
    if-eqz v0, :cond_2f

    if-eq v0, p1, :cond_2f

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 512
    :cond_2f
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    .line 513
    throw p0

    .line 504
    :cond_33
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Unsupported image"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static install(Landroid/app/Activity;)V
    .registers 1

    .line 344
    invoke-static {p0}, Lcom/trueaxis/modmenu/NativeMods;->applySaved(Landroid/content/Context;)V

    .line 345
    return-void
.end method

.method private static label(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/TextView;
    .registers 5

    .line 76
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 77
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 78
    int-to-float p0, p2

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 79
    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 80
    return-object v0
.end method

.method public static loadEditableLivery(Landroid/content/Context;I)Landroid/graphics/Bitmap;
    .registers 6

    .line 154
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/ModMenu;->customTexture(Landroid/content/Context;I)Ljava/io/File;

    move-result-object v0

    .line 155
    nop

    .line 157
    const/4 v1, 0x0

    :try_start_6
    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v2

    if-eqz v2, :cond_12

    .line 158
    new-instance p0, Ljava/io/FileInputStream;

    invoke-direct {p0, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    goto :goto_1e

    .line 159
    :cond_12
    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object p0

    sget-object v0, Lcom/trueaxis/modmenu/ModMenu;->CAR_TEXTURES:[Ljava/lang/String;

    aget-object p1, v0, p1

    invoke-virtual {p0, p1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p0
    :try_end_1e
    .catchall {:try_start_6 .. :try_end_1e} :catchall_47

    .line 160
    :goto_1e
    :try_start_1e
    new-instance p1, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {p1}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 161
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    iput-object v0, p1, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    .line 162
    invoke-static {p0, v1, p1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object p1
    :try_end_2b
    .catchall {:try_start_1e .. :try_end_2b} :catchall_42

    .line 163
    if-nez p1, :cond_31

    .line 171
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->closeQuietly(Ljava/io/Closeable;)V

    .line 163
    return-object v1

    .line 164
    :cond_31
    :try_start_31
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    const/4 v2, 0x1

    invoke-virtual {p1, v0, v2}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 165
    if-eq v0, p1, :cond_3d

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V
    :try_end_3d
    .catchall {:try_start_31 .. :try_end_3d} :catchall_42

    .line 166
    :cond_3d
    nop

    .line 171
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->closeQuietly(Ljava/io/Closeable;)V

    .line 166
    return-object v0

    .line 167
    :catchall_42
    move-exception p1

    move-object v3, p1

    move-object p1, p0

    move-object p0, v3

    goto :goto_49

    :catchall_47
    move-exception p0

    move-object p1, v1

    .line 168
    :goto_49
    :try_start_49
    const-string v0, "MCS2Mod"

    const-string v2, "Could not load livery for editing"

    invoke-static {v0, v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_50
    .catchall {:try_start_49 .. :try_end_50} :catchall_55

    .line 169
    nop

    .line 171
    invoke-static {p1}, Lcom/trueaxis/modmenu/ModMenu;->closeQuietly(Ljava/io/Closeable;)V

    .line 169
    return-object v1

    .line 171
    :catchall_55
    move-exception p0

    invoke-static {p1}, Lcom/trueaxis/modmenu/ModMenu;->closeQuietly(Ljava/io/Closeable;)V

    .line 172
    throw p0
.end method

.method private static mirrorExternal(Landroid/content/Context;ILandroid/graphics/Bitmap;)V
    .registers 3

    .line 572
    :try_start_0
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/ModMenu;->externalTexture(Landroid/content/Context;I)Ljava/io/File;

    move-result-object p0

    .line 573
    if-eqz p0, :cond_9

    invoke-static {p0, p2}, Lcom/trueaxis/modmenu/ModMenu;->writeLivery(Ljava/io/File;Landroid/graphics/Bitmap;)V
    :try_end_9
    .catchall {:try_start_0 .. :try_end_9} :catchall_a

    .line 575
    :cond_9
    goto :goto_b

    .line 574
    :catchall_a
    move-exception p0

    .line 576
    :goto_b
    return-void
.end method

.method public static prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .registers 3

    .line 210
    const-string v0, "jcs_mod"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    return-object p0
.end method

.method private static rememberCar(Landroid/content/Context;Landroid/widget/Spinner;)V
    .registers 3

    .line 194
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "livery_car"

    invoke-virtual {p1}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result p1

    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 195
    return-void
.end method

.method public static resetAllCustomLiveries(Landroid/content/Context;)V
    .registers 3

    .line 607
    const/4 v0, 0x0

    :goto_1
    sget-object v1, Lcom/trueaxis/modmenu/ModMenu;->CAR_TEXTURES:[Ljava/lang/String;

    array-length v1, v1

    if-ge v0, v1, :cond_c

    .line 608
    invoke-static {p0, v0}, Lcom/trueaxis/modmenu/ModMenu;->deleteCustomLivery(Landroid/content/Context;I)V

    .line 607
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 610
    :cond_c
    return-void
.end method

.method public static resetBaseMods(Landroid/content/Context;)V
    .registers 3

    .line 613
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "unlock_all"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "disable_ads"

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 614
    return-void
.end method

.method public static saveDesignedLivery(Landroid/content/Context;ILandroid/graphics/Bitmap;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 177
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    const/16 v1, 0x200

    if-ne v0, v1, :cond_10

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    if-ne v0, v1, :cond_10

    .line 178
    move-object v0, p2

    goto :goto_15

    .line 179
    :cond_10
    const/4 v0, 0x1

    invoke-static {p2, v1, v1, v0}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v0

    :goto_15
    nop

    .line 181
    :try_start_16
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/ModMenu;->customTexture(Landroid/content/Context;I)Ljava/io/File;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/trueaxis/modmenu/ModMenu;->writeLivery(Ljava/io/File;Landroid/graphics/Bitmap;)V

    .line 182
    invoke-static {p0, p1, v0}, Lcom/trueaxis/modmenu/ModMenu;->mirrorExternal(Landroid/content/Context;ILandroid/graphics/Bitmap;)V
    :try_end_20
    .catchall {:try_start_16 .. :try_end_20} :catchall_26

    .line 184
    if-eq v0, p2, :cond_25

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 186
    :cond_25
    return-void

    .line 184
    :catchall_26
    move-exception p0

    if-eq v0, p2, :cond_2c

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 185
    :cond_2c
    throw p0
.end method

.method private static saveQuickCheats(Landroid/content/Context;ZZZZZZ)V
    .registers 9

    .line 334
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "unlock_all"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "disable_ads"

    invoke-interface {v0, v1, p2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p2

    invoke-interface {p2}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 335
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/NativeMods;->setNativeUnlock(Landroid/content/Context;Z)V

    .line 336
    const/16 p1, 0x13

    const-string p2, "999"

    const/4 v0, 0x2

    invoke-static {p0, v0, p1, p2, p3}, Lcom/trueaxis/modmenu/NativeMods;->quickNumber(Landroid/content/Context;IILjava/lang/String;Z)V

    .line 337
    const/4 p1, 0x1

    invoke-static {p0, p1, p1, p4}, Lcom/trueaxis/modmenu/NativeMods;->quickBool(Landroid/content/Context;IIZ)V

    .line 338
    const/16 p2, 0xc

    invoke-static {p0, p1, p2, p5}, Lcom/trueaxis/modmenu/NativeMods;->quickBool(Landroid/content/Context;IIZ)V

    .line 339
    invoke-static {p0, p1, v0, p6}, Lcom/trueaxis/modmenu/NativeMods;->quickBool(Landroid/content/Context;IIZ)V

    .line 340
    return-void
.end method

.method private static sectionHeader(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/TextView;
    .registers 5

    .line 95
    const/16 v0, 0xff

    const/16 v1, 0x80

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    const/16 v1, 0xd

    invoke-static {p0, p1, v1, v0}, Lcom/trueaxis/modmenu/ModMenu;->label(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object p1

    .line 96
    const/16 v0, 0xc

    invoke-static {p0, v0}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v0

    const/4 v1, 0x4

    invoke-static {p0, v1}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result p0

    invoke-virtual {p1, v2, v0, v2, p0}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 97
    return-object p1
.end method

.method private static selectedCar(Landroid/content/Context;)I
    .registers 3

    .line 189
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "livery_car"

    const/4 v1, 0x1

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    .line 190
    if-ltz p0, :cond_13

    sget-object v0, Lcom/trueaxis/modmenu/ModMenu;->CAR_TEXTURES:[Ljava/lang/String;

    array-length v0, v0

    if-ge p0, v0, :cond_13

    move v1, p0

    :cond_13
    return v1
.end method

.method public static showLiveryManager(Landroid/app/Activity;)V
    .registers 12

    .line 349
    :try_start_0
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 350
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 351
    const/16 v1, 0x12

    invoke-static {p0, v1}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v2

    const/4 v3, 0x4

    invoke-static {p0, v3}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-static {p0, v1}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v1

    invoke-static {p0, v3}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v3

    invoke-virtual {v0, v2, v4, v1, v3}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 353
    const-string v1, "Design a livery in the app, upload any PNG/JPG, or export the exact UV texture to edit elsewhere. Liveries are 512x512 PNG and apply after a restart."

    const v2, -0xbbbbbc

    const/16 v3, 0xb

    invoke-static {p0, v1, v3, v2}, Lcom/trueaxis/modmenu/ModMenu;->label(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v1

    .line 357
    const/16 v4, 0x8

    invoke-static {p0, v4}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v5

    const/4 v6, 0x0

    invoke-virtual {v1, v6, v6, v6, v5}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 358
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 360
    new-instance v1, Landroid/widget/Spinner;

    invoke-direct {v1, p0}, Landroid/widget/Spinner;-><init>(Landroid/content/Context;)V

    .line 361
    new-instance v5, Landroid/widget/ArrayAdapter;

    sget-object v7, Lcom/trueaxis/modmenu/ModMenu;->CAR_NAMES:[Ljava/lang/String;

    const v8, 0x1090008

    invoke-direct {v5, p0, v8, v7}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    .line 363
    const v7, 0x1090009

    invoke-virtual {v5, v7}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 364
    invoke-virtual {v1, v5}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 365
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->selectedCar(Landroid/content/Context;)I

    move-result v5

    invoke-virtual {v1, v5}, Landroid/widget/Spinner;->setSelection(I)V

    .line 366
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v7, -0x1

    const/4 v8, -0x2

    invoke-direct {v5, v7, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 369
    const-string v5, ""

    invoke-static {p0, v5, v3, v2}, Lcom/trueaxis/modmenu/ModMenu;->label(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v2

    .line 370
    const/4 v3, 0x5

    invoke-static {p0, v3}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v5

    invoke-static {p0, v3}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v3

    invoke-virtual {v2, v6, v5, v6, v3}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 371
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 373
    const-string v3, "\ud83c\udfa8  Open livery designer"

    invoke-static {p0, v3}, Lcom/trueaxis/modmenu/ModMenu;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v3

    .line 374
    const/high16 v5, 0x41500000    # 13.0f

    invoke-virtual {v3, v5}, Landroid/widget/Button;->setTextSize(F)V

    .line 375
    invoke-virtual {v3, v7}, Landroid/widget/Button;->setTextColor(I)V

    .line 376
    const/16 v5, 0xff

    const/16 v9, 0x80

    invoke-static {v5, v9, v6}, Landroid/graphics/Color;->rgb(III)I

    move-result v5

    invoke-static {p0, v4}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v9

    int-to-float v9, v9

    invoke-static {v5, v9}, Lcom/trueaxis/modmenu/ModMenu;->background(IF)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/widget/Button;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 377
    new-instance v5, Lcom/trueaxis/modmenu/ModMenu$4;

    invoke-direct {v5, p0, v1}, Lcom/trueaxis/modmenu/ModMenu$4;-><init>(Landroid/app/Activity;Landroid/widget/Spinner;)V

    invoke-virtual {v3, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 389
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v5, v7, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 391
    invoke-static {p0, v4}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v4

    iput v4, v5, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 392
    invoke-virtual {v0, v3, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 394
    new-instance v3, Landroid/widget/LinearLayout;

    invoke-direct {v3, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 395
    invoke-virtual {v3, v6}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 396
    const-string v4, "Upload"

    invoke-static {p0, v4}, Lcom/trueaxis/modmenu/ModMenu;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v4

    .line 397
    const-string v5, "Export / edit"

    invoke-static {p0, v5}, Lcom/trueaxis/modmenu/ModMenu;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v5

    .line 398
    const-string v7, "Restore default"

    invoke-static {p0, v7}, Lcom/trueaxis/modmenu/ModMenu;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v7

    .line 399
    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v10, 0x3f800000    # 1.0f

    invoke-direct {v9, v6, v8, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v3, v4, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 401
    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v9, v6, v8, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v3, v5, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 403
    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v9, v6, v8, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v3, v7, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 405
    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 407
    new-instance v3, Lcom/trueaxis/modmenu/ModMenu$5;

    invoke-direct {v3, v1, v2, p0}, Lcom/trueaxis/modmenu/ModMenu$5;-><init>(Landroid/widget/Spinner;Landroid/widget/TextView;Landroid/app/Activity;)V

    .line 415
    new-instance v2, Lcom/trueaxis/modmenu/ModMenu$6;

    invoke-direct {v2, p0, v1, v3}, Lcom/trueaxis/modmenu/ModMenu$6;-><init>(Landroid/app/Activity;Landroid/widget/Spinner;Ljava/lang/Runnable;)V

    invoke-virtual {v1, v2}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 425
    invoke-interface {v3}, Ljava/lang/Runnable;->run()V

    .line 427
    new-instance v2, Lcom/trueaxis/modmenu/ModMenu$7;

    invoke-direct {v2, p0, v1}, Lcom/trueaxis/modmenu/ModMenu$7;-><init>(Landroid/app/Activity;Landroid/widget/Spinner;)V

    invoke-virtual {v4, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 441
    new-instance v2, Lcom/trueaxis/modmenu/ModMenu$8;

    invoke-direct {v2, p0, v1}, Lcom/trueaxis/modmenu/ModMenu$8;-><init>(Landroid/app/Activity;Landroid/widget/Spinner;)V

    invoke-virtual {v5, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 461
    new-instance v2, Lcom/trueaxis/modmenu/ModMenu$9;

    invoke-direct {v2, v1, p0, v3}, Lcom/trueaxis/modmenu/ModMenu$9;-><init>(Landroid/widget/Spinner;Landroid/app/Activity;Ljava/lang/Runnable;)V

    invoke-virtual {v7, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 470
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v2, "Custom liveries - all cars"

    .line 471
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 472
    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "Close"

    .line 473
    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 474
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;
    :try_end_125
    .catchall {:try_start_0 .. :try_end_125} :catchall_126

    .line 478
    goto :goto_133

    .line 475
    :catchall_126
    move-exception v0

    .line 476
    const-string v1, "MCS2Mod"

    const-string v2, "Could not open livery manager"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 477
    const-string v0, "Could not open livery manager."

    invoke-static {p0, v0}, Lcom/trueaxis/modmenu/ModMenu;->toast(Landroid/content/Context;Ljava/lang/String;)V

    .line 479
    :goto_133
    return-void
.end method

.method public static showPreLaunchMenu(Landroid/app/Activity;Ljava/lang/Runnable;)V
    .registers 18

    .line 230
    move-object/from16 v0, p0

    :try_start_2
    invoke-static/range {p0 .. p0}, Lcom/trueaxis/modmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 232
    new-instance v10, Landroid/widget/LinearLayout;

    invoke-direct {v10, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 233
    const/4 v2, 0x1

    invoke-virtual {v10, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 234
    const/16 v3, 0xd

    const/16 v4, 0x17

    const/16 v5, 0x11

    invoke-static {v3, v5, v4}, Landroid/graphics/Color;->rgb(III)I

    move-result v3

    invoke-virtual {v10, v3}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 235
    const/16 v3, 0x14

    invoke-static {v0, v3}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v6

    const/16 v7, 0x10

    invoke-static {v0, v7}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v8

    invoke-static {v0, v3}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v3

    invoke-static {v0, v7}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v9

    invoke-virtual {v10, v6, v8, v3, v9}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 237
    const-string v3, "MCS2 \u2014 MODS & CHEATS"

    const/16 v6, 0x80

    const/16 v8, 0xff

    const/4 v9, 0x0

    invoke-static {v8, v6, v9}, Landroid/graphics/Color;->rgb(III)I

    move-result v11

    invoke-static {v0, v3, v4, v11}, Lcom/trueaxis/modmenu/ModMenu;->label(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v3

    .line 238
    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setGravity(I)V

    .line 239
    const/4 v4, 0x2

    invoke-static {v0, v4}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v11

    invoke-virtual {v3, v9, v9, v9, v11}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 240
    invoke-virtual {v10, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 242
    const-string v3, "Pick your cheats, then start. Choices are saved and re-applied every launch."

    .line 244
    const/16 v11, 0xaa

    const/16 v12, 0xb2

    const/16 v13, 0xb9

    invoke-static {v11, v12, v13}, Landroid/graphics/Color;->rgb(III)I

    move-result v11

    .line 242
    const/16 v12, 0xb

    invoke-static {v0, v3, v12, v11}, Lcom/trueaxis/modmenu/ModMenu;->label(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v3

    .line 245
    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setGravity(I)V

    .line 246
    const/16 v5, 0x8

    invoke-static {v0, v5}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v11

    invoke-virtual {v3, v9, v9, v9, v11}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 247
    invoke-virtual {v10, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 249
    new-instance v3, Landroid/widget/ScrollView;

    invoke-direct {v3, v0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    .line 250
    invoke-virtual {v3, v2}, Landroid/widget/ScrollView;->setFillViewport(Z)V

    .line 251
    new-instance v11, Landroid/widget/LinearLayout;

    invoke-direct {v11, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 252
    invoke-virtual {v11, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 253
    invoke-static {v0, v7}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v12

    const/16 v13, 0xa

    invoke-static {v0, v13}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v14

    invoke-static {v0, v7}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v15

    const/16 v7, 0xe

    invoke-static {v0, v7}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v7

    invoke-virtual {v11, v12, v14, v15, v7}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 254
    const/16 v7, 0x20

    const/16 v12, 0x26

    const/16 v14, 0x1c

    invoke-static {v14, v7, v12}, Landroid/graphics/Color;->rgb(III)I

    move-result v7

    invoke-static {v0, v13}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v12

    int-to-float v12, v12

    invoke-static {v7, v12}, Lcom/trueaxis/modmenu/ModMenu;->background(IF)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v7

    invoke-virtual {v11, v7}, Landroid/widget/LinearLayout;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 256
    const-string v7, "Quick cheats"

    invoke-static {v0, v7}, Lcom/trueaxis/modmenu/ModMenu;->sectionHeader(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v7

    invoke-virtual {v11, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 258
    const-string v7, "Unlock everything"

    const-string v12, "All levels, cars and the level editor"

    const-string v14, "unlock_all"

    .line 259
    invoke-interface {v1, v14, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v14

    .line 258
    invoke-static {v0, v11, v7, v12, v14}, Lcom/trueaxis/modmenu/ModMenu;->addCheat(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Z)Landroid/widget/CheckBox;

    move-result-object v7

    .line 260
    const-string v12, "Disable ads"

    const-string v14, "No banner or interstitial ads"

    const-string v15, "disable_ads"

    .line 261
    invoke-interface {v1, v15, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    .line 260
    invoke-static {v0, v11, v12, v14, v1}, Lcom/trueaxis/modmenu/ModMenu;->addCheat(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Z)Landroid/widget/CheckBox;

    move-result-object v12

    .line 262
    const-string v1, "Unlimited editor checkpoints"

    const-string v14, "Place as many checkpoint times as you like"

    const-string v15, "999"

    .line 264
    const/16 v5, 0x13

    invoke-static {v0, v4, v5, v15}, Lcom/trueaxis/modmenu/NativeMods;->isQuickNumberOn(Landroid/content/Context;IILjava/lang/String;)Z

    move-result v5

    .line 262
    invoke-static {v0, v11, v1, v14, v5}, Lcom/trueaxis/modmenu/ModMenu;->addCheat(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Z)Landroid/widget/CheckBox;

    move-result-object v5

    .line 265
    const-string v1, "Hyper-ballistic physics"

    const-string v14, "Floaty, bouncy car handling"

    .line 267
    invoke-static {v0, v2, v2}, Lcom/trueaxis/modmenu/NativeMods;->isQuickBoolOn(Landroid/content/Context;II)Z

    move-result v15

    .line 265
    invoke-static {v0, v11, v1, v14, v15}, Lcom/trueaxis/modmenu/ModMenu;->addCheat(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Z)Landroid/widget/CheckBox;

    move-result-object v14

    .line 268
    const-string v1, "Smooth 60 FPS"

    const-string v15, "Disable the 30 FPS fallback"

    .line 270
    const/16 v6, 0xc

    invoke-static {v0, v2, v6}, Lcom/trueaxis/modmenu/NativeMods;->isQuickBoolOn(Landroid/content/Context;II)Z

    move-result v8

    .line 268
    invoke-static {v0, v11, v1, v15, v8}, Lcom/trueaxis/modmenu/ModMenu;->addCheat(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Z)Landroid/widget/CheckBox;

    move-result-object v8

    .line 271
    const-string v1, "Autopilot"

    const-string v15, "Let the AI drive your car"

    .line 273
    invoke-static {v0, v2, v4}, Lcom/trueaxis/modmenu/NativeMods;->isQuickBoolOn(Landroid/content/Context;II)Z

    move-result v2

    .line 271
    invoke-static {v0, v11, v1, v15, v2}, Lcom/trueaxis/modmenu/ModMenu;->addCheat(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Z)Landroid/widget/CheckBox;

    move-result-object v15

    .line 275
    const-string v1, "More"

    invoke-static {v0, v1}, Lcom/trueaxis/modmenu/ModMenu;->sectionHeader(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v11, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 277
    const-string v1, "All native options\u2026"

    invoke-static {v0, v1}, Lcom/trueaxis/modmenu/ModMenu;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v1

    .line 278
    new-instance v2, Lcom/trueaxis/modmenu/ModMenu$1;

    invoke-direct {v2, v0}, Lcom/trueaxis/modmenu/ModMenu$1;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 283
    invoke-static {}, Lcom/trueaxis/modmenu/ModMenu;->fill()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v2

    invoke-virtual {v11, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 285
    const-string v1, "Custom liveries\u2026"

    invoke-static {v0, v1}, Lcom/trueaxis/modmenu/ModMenu;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v1

    .line 286
    new-instance v2, Lcom/trueaxis/modmenu/ModMenu$2;

    invoke-direct {v2, v0}, Lcom/trueaxis/modmenu/ModMenu$2;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 291
    invoke-static {}, Lcom/trueaxis/modmenu/ModMenu;->fill()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v2

    invoke-virtual {v11, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 293
    const-string v1, "Blue flame watermark is always on. Changes apply when the game starts."

    .line 295
    const/16 v2, 0x96

    const/16 v4, 0x9e

    const/16 v6, 0xa5

    invoke-static {v2, v4, v6}, Landroid/graphics/Color;->rgb(III)I

    move-result v2

    .line 293
    invoke-static {v0, v1, v13, v2}, Lcom/trueaxis/modmenu/ModMenu;->label(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v1

    .line 296
    invoke-static {v0, v13}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v2

    invoke-virtual {v1, v9, v2, v9, v9}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 297
    invoke-virtual {v11, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 299
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v2, -0x2

    const/4 v4, -0x1

    invoke-direct {v1, v4, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v11, v1}, Landroid/widget/ScrollView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 302
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-direct {v1, v4, v9, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v10, v3, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 305
    const-string v1, "START GAME"

    invoke-static {v0, v1}, Lcom/trueaxis/modmenu/ModMenu;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v11

    .line 306
    const/high16 v1, 0x41600000    # 14.0f

    invoke-virtual {v11, v1}, Landroid/widget/Button;->setTextSize(F)V

    .line 307
    const/high16 v1, -0x1000000

    invoke-virtual {v11, v1}, Landroid/widget/Button;->setTextColor(I)V

    .line 308
    const/16 v1, 0x80

    const/16 v3, 0xff

    invoke-static {v3, v1, v9}, Landroid/graphics/Color;->rgb(III)I

    move-result v1

    const/16 v3, 0x8

    invoke-static {v0, v3}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v3

    int-to-float v3, v3

    invoke-static {v1, v3}, Lcom/trueaxis/modmenu/ModMenu;->background(IF)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v1

    invoke-virtual {v11, v1}, Landroid/widget/Button;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 309
    const/16 v1, 0x10

    invoke-static {v0, v1}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v3

    const/16 v6, 0xc

    invoke-static {v0, v6}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v9

    invoke-static {v0, v1}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v1

    invoke-static {v0, v6}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v13

    invoke-virtual {v11, v3, v9, v1, v13}, Landroid/widget/Button;->setPadding(IIII)V

    .line 310
    new-instance v13, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v13, v4, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 312
    const/16 v1, 0xc

    invoke-static {v0, v1}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v1

    iput v1, v13, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 313
    new-instance v9, Lcom/trueaxis/modmenu/ModMenu$3;

    move-object v1, v9

    move-object/from16 v2, p0

    move-object v3, v7

    move-object v4, v12

    move-object v6, v14

    move-object v7, v8

    move-object v8, v15

    move-object v12, v9

    move-object/from16 v9, p1

    invoke-direct/range {v1 .. v9}, Lcom/trueaxis/modmenu/ModMenu$3;-><init>(Landroid/app/Activity;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Ljava/lang/Runnable;)V

    invoke-virtual {v11, v12}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 321
    invoke-virtual {v10, v11, v13}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 323
    invoke-virtual {v0, v10}, Landroid/app/Activity;->setContentView(Landroid/view/View;)V
    :try_end_1cd
    .catchall {:try_start_2 .. :try_end_1cd} :catchall_1ce

    .line 327
    goto :goto_1d9

    .line 324
    :catchall_1ce
    move-exception v0

    .line 325
    const-string v1, "MCS2Mod"

    const-string v2, "Could not show pre-launch mod menu"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 326
    invoke-interface/range {p1 .. p1}, Ljava/lang/Runnable;->run()V

    .line 328
    :goto_1d9
    return-void
.end method

.method public static textureSize()I
    .registers 1

    .line 149
    const/16 v0, 0x200

    return v0
.end method

.method private static toast(Landroid/content/Context;Ljava/lang/String;)V
    .registers 3

    .line 198
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 199
    return-void
.end method

.method public static unlockAll(Landroid/content/Context;)Z
    .registers 3

    .line 215
    const/4 v0, 0x1

    if-nez p0, :cond_4

    return v0

    .line 216
    :cond_4
    :try_start_4
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v1, "unlock_all"

    invoke-interface {p0, v1, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0
    :try_end_e
    .catchall {:try_start_4 .. :try_end_e} :catchall_f

    return p0

    :catchall_f
    move-exception p0

    return v0
.end method

.method private static writeLivery(Ljava/io/File;Landroid/graphics/Bitmap;)V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 545
    invoke-virtual {p0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    .line 546
    if-eqz v0, :cond_8f

    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-nez v1, :cond_12

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v0

    if-eqz v0, :cond_8f

    .line 549
    :cond_12
    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".tmp"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 550
    nop

    .line 552
    const/4 v1, 0x0

    :try_start_30
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_35
    .catchall {:try_start_30 .. :try_end_35} :catchall_81

    .line 553
    :try_start_35
    sget-object v3, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v4, 0x64

    invoke-virtual {p1, v3, v4, v2}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    move-result p1

    if-eqz p1, :cond_76

    .line 556
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->flush()V

    .line 557
    invoke-static {v2}, Lcom/trueaxis/modmenu/ModMenu;->closeQuietly(Ljava/io/Closeable;)V
    :try_end_45
    .catchall {:try_start_35 .. :try_end_45} :catchall_7e

    .line 558
    nop

    .line 559
    :try_start_46
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result p1

    if-eqz p1, :cond_5b

    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    move-result p1

    if-eqz p1, :cond_53

    goto :goto_5b

    .line 560
    :cond_53
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Could not replace old livery"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 562
    :cond_5b
    :goto_5b
    invoke-virtual {v0, p0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result p0
    :try_end_5f
    .catchall {:try_start_46 .. :try_end_5f} :catchall_81

    if-eqz p0, :cond_6e

    .line 564
    invoke-static {v1}, Lcom/trueaxis/modmenu/ModMenu;->closeQuietly(Ljava/io/Closeable;)V

    .line 565
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result p0

    if-eqz p0, :cond_6d

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 567
    :cond_6d
    return-void

    .line 562
    :cond_6e
    :try_start_6e
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Could not save livery"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_76
    .catchall {:try_start_6e .. :try_end_76} :catchall_81

    .line 554
    :cond_76
    :try_start_76
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Could not encode PNG"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_7e
    .catchall {:try_start_76 .. :try_end_7e} :catchall_7e

    .line 564
    :catchall_7e
    move-exception p0

    move-object v1, v2

    goto :goto_82

    :catchall_81
    move-exception p0

    :goto_82
    invoke-static {v1}, Lcom/trueaxis/modmenu/ModMenu;->closeQuietly(Ljava/io/Closeable;)V

    .line 565
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result p1

    if-eqz p1, :cond_8e

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 566
    :cond_8e
    throw p0

    .line 547
    :cond_8f
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Could not create livery folder"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
