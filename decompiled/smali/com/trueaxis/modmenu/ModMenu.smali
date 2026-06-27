.class public Lcom/trueaxis/modmenu/ModMenu;
.super Ljava/lang/Object;
.source "ModMenu.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;,
        Lcom/trueaxis/modmenu/ModMenu$DiscordIconDrawable;,
        Lcom/trueaxis/modmenu/ModMenu$LinkIconDrawable;
    }
.end annotation


# static fields
.field private static final CAR_NAMES:[Ljava/lang/String;

.field private static final CAR_TEXTURES:[Ljava/lang/String;

.field private static final DEFAULT_SPLIT_ALPHA:I = 0x5a

.field private static final DEFAULT_SPLIT_X:I = 0x58

.field private static final DEFAULT_SPLIT_Y:I = 0x27

.field private static final DISCORD_URL:Ljava/lang/String; = "https://discord.gg/stBdE2Tfs2"

.field private static final DISPLAY_NAME:Ljava/lang/String; = "JCS2 Community Mod"

.field private static final K_CAR:Ljava/lang/String; = "livery_car"

.field private static final K_CHECKPOINT_SPLITS:Ljava/lang/String; = "checkpoint_splits"

.field private static final K_MENU_DEFAULTS_VERSION:Ljava/lang/String; = "menu_defaults_version"

.field private static final K_SPLIT_ALPHA:Ljava/lang/String; = "split_alpha"

.field private static final K_SPLIT_LIST:Ljava/lang/String; = "split_list"

.field private static final K_SPLIT_SECTOR_DELTA:Ljava/lang/String; = "split_sector_delta"

.field private static final K_SPLIT_X:Ljava/lang/String; = "split_x"

.field private static final K_SPLIT_Y:Ljava/lang/String; = "split_y"

.field private static final MENU_DEFAULTS_VERSION:I = 0x3

.field private static final PREFS:Ljava/lang/String; = "jcs_mod"

.field private static final REPO_URL:Ljava/lang/String; = "https://github.com/yanniedog/jcs2-mod"

.field private static final REQUEST_EXPORT:I = 0x1c86

.field private static final REQUEST_IMPORT:I = 0x1c85

.field private static final TEXTURE_SIZE:I = 0x200


# direct methods
.method static constructor <clinit>()V
    .registers 10

    .line 69
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

    .line 72
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

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Landroid/content/Context;Landroid/view/View;)V
    .registers 2

    .line 48
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/ModMenu;->updateSplitOptionsVisibility(Landroid/content/Context;Landroid/view/View;)V

    return-void
.end method

.method static synthetic access$100(Landroid/widget/TextView;Ljava/lang/String;ILjava/lang/String;)V
    .registers 4

    .line 48
    invoke-static {p0, p1, p2, p3}, Lcom/trueaxis/modmenu/ModMenu;->updateSeekLabel(Landroid/widget/TextView;Ljava/lang/String;ILjava/lang/String;)V

    return-void
.end method

.method static synthetic access$200(Landroid/content/Context;Landroid/widget/Spinner;)V
    .registers 2

    .line 48
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/ModMenu;->rememberCar(Landroid/content/Context;Landroid/widget/Spinner;)V

    return-void
.end method

.method static synthetic access$300(Landroid/content/Context;Ljava/lang/String;)V
    .registers 2

    .line 48
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/ModMenu;->toast(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$400(Landroid/content/Context;I)Ljava/io/File;
    .registers 2

    .line 48
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/ModMenu;->customTexture(Landroid/content/Context;I)Ljava/io/File;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$500(Landroid/content/Context;)I
    .registers 1

    .line 48
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->selectedCar(Landroid/content/Context;)I

    move-result p0

    return p0
.end method

.method static synthetic access$600()[Ljava/lang/String;
    .registers 1

    .line 48
    sget-object v0, Lcom/trueaxis/modmenu/ModMenu;->CAR_NAMES:[Ljava/lang/String;

    return-object v0
.end method

.method private static addCheckBox(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Z)Landroid/widget/CheckBox;
    .registers 11

    .line 558
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    invoke-static/range {v0 .. v5}, Lcom/trueaxis/modmenu/ModMenu;->addCheckBox(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/Runnable;)Landroid/widget/CheckBox;

    move-result-object p0

    return-object p0
.end method

.method private static addCheckBox(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/Runnable;)Landroid/widget/CheckBox;
    .registers 7

    .line 564
    new-instance v0, Landroid/widget/CheckBox;

    invoke-direct {v0, p0}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    .line 565
    invoke-virtual {v0, p2}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    .line 566
    const/4 p2, -0x1

    invoke-virtual {v0, p2}, Landroid/widget/CheckBox;->setTextColor(I)V

    .line 567
    const/high16 p2, 0x41300000    # 11.0f

    invoke-virtual {v0, p2}, Landroid/widget/CheckBox;->setTextSize(F)V

    .line 568
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p2

    invoke-interface {p2, p3, p4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p2

    invoke-virtual {v0, p2}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 569
    const/4 p2, 0x4

    invoke-static {p0, p2}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result p2

    const/4 p4, 0x0

    invoke-virtual {v0, p4, p2, p4, p4}, Landroid/widget/CheckBox;->setPadding(IIII)V

    .line 570
    new-instance p2, Lcom/trueaxis/modmenu/ModMenu$6;

    invoke-direct {p2, p0, p3, v0, p5}, Lcom/trueaxis/modmenu/ModMenu$6;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/widget/CheckBox;Ljava/lang/Runnable;)V

    invoke-virtual {v0, p2}, Landroid/widget/CheckBox;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 580
    invoke-static {}, Lcom/trueaxis/modmenu/ModMenu;->fill()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object p0

    invoke-virtual {p1, v0, p0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 581
    return-object v0
.end method

.method private static addSeek(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;IIILjava/lang/String;)Landroid/widget/LinearLayout;
    .registers 20

    .line 593
    move-object v7, p0

    move/from16 v1, p5

    move/from16 v0, p6

    new-instance v8, Landroid/widget/LinearLayout;

    invoke-direct {v8, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 594
    const/4 v2, 0x1

    invoke-virtual {v8, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 595
    const/16 v2, 0xd8

    const/16 v3, 0xde

    const/16 v4, 0xd2

    invoke-static {v4, v2, v3}, Landroid/graphics/Color;->rgb(III)I

    move-result v2

    const-string v3, ""

    const/16 v4, 0xa

    invoke-static {p0, v3, v4, v2}, Lcom/trueaxis/modmenu/ModMenu;->label(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v9

    .line 596
    new-instance v10, Landroid/widget/SeekBar;

    invoke-direct {v10, p0}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;)V

    .line 597
    sub-int v2, v0, v1

    invoke-virtual {v10, v2}, Landroid/widget/SeekBar;->setMax(I)V

    .line 598
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    move-object v3, p3

    move/from16 v4, p4

    invoke-interface {v2, p3, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    invoke-static {v2, v1, v0}, Lcom/trueaxis/modmenu/ModMenu;->clamp(III)I

    move-result v0

    sub-int/2addr v0, v1

    invoke-virtual {v10, v0}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 599
    invoke-virtual {v10}, Landroid/widget/SeekBar;->getProgress()I

    move-result v0

    add-int/2addr v0, v1

    move-object v5, p2

    move-object/from16 v6, p7

    invoke-static {v9, p2, v0, v6}, Lcom/trueaxis/modmenu/ModMenu;->updateSeekLabel(Landroid/widget/TextView;Ljava/lang/String;ILjava/lang/String;)V

    .line 600
    new-instance v11, Lcom/trueaxis/modmenu/ModMenu$7;

    move-object v0, v11

    move-object v2, p0

    move-object v4, v9

    invoke-direct/range {v0 .. v6}, Lcom/trueaxis/modmenu/ModMenu$7;-><init>(ILandroid/content/Context;Ljava/lang/String;Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v10, v11}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 614
    const/4 v0, 0x4

    invoke-static {p0, v0}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v0

    const/4 v1, 0x0

    invoke-virtual {v9, v1, v0, v1, v1}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 615
    invoke-static {}, Lcom/trueaxis/modmenu/ModMenu;->fill()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v0

    invoke-virtual {v8, v9, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 616
    invoke-static {}, Lcom/trueaxis/modmenu/ModMenu;->fill()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v0

    invoke-virtual {v8, v10, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 617
    invoke-static {}, Lcom/trueaxis/modmenu/ModMenu;->fill()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v0

    move-object v1, p1

    invoke-virtual {p1, v8, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 618
    return-object v8
.end method

.method private static applyMenuDefaults(Landroid/content/Context;)V
    .registers 7

    .line 256
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 257
    const-string v0, "menu_defaults_version"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    const/4 v3, 0x3

    if-lt v2, v3, :cond_f

    .line 258
    return-void

    .line 260
    :cond_f
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    .line 261
    const-string v4, "checkpoint_splits"

    const/4 v5, 0x1

    invoke-interface {v2, v4, v5}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    .line 262
    const-string v4, "split_list"

    invoke-interface {v2, v4, v5}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    .line 263
    const-string v4, "split_sector_delta"

    invoke-interface {v2, v4, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 264
    const-string v2, "split_realtime"

    invoke-interface {v1, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 265
    const-string v2, "ghost_route"

    invoke-interface {v1, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 266
    const-string v2, "ghost_route_alpha"

    invoke-interface {v1, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 267
    const-string v2, "ghost_route_thickness"

    invoke-interface {v1, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 268
    const-string v2, "ycs2_prefix"

    invoke-interface {v1, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 269
    const-string v2, "experimental_visible"

    invoke-interface {v1, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 270
    const-string v2, "experimental_ack"

    invoke-interface {v1, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 271
    invoke-interface {v1, v0, v3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 272
    const-string v1, "split_alpha"

    invoke-interface {p0, v1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_61

    .line 273
    const/16 v2, 0x5a

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 275
    :cond_61
    const-string v1, "split_x"

    invoke-interface {p0, v1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_6e

    .line 276
    const/16 v2, 0x58

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 278
    :cond_6e
    const-string v1, "split_y"

    invoke-interface {p0, v1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_7b

    .line 279
    const/16 p0, 0x27

    invoke-interface {v0, v1, p0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 281
    :cond_7b
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 282
    return-void
.end method

.method private static background(IF)Landroid/graphics/drawable/GradientDrawable;
    .registers 3

    .line 87
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 88
    invoke-virtual {v0, p0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 89
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 90
    return-object v0
.end method

.method private static buildDateUtc(Landroid/content/Context;)Ljava/lang/String;
    .registers 4

    .line 543
    const-string v0, ""

    .line 545
    const/4 v1, 0x0

    :try_start_3
    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object p0

    const-string v2, "ycs2-build-info.properties"

    invoke-virtual {p0, v2}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1

    .line 546
    new-instance p0, Ljava/util/Properties;

    invoke-direct {p0}, Ljava/util/Properties;-><init>()V

    .line 547
    invoke-virtual {p0, v1}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V

    .line 548
    const-string v2, "build_date_utc"

    invoke-virtual {p0, v2, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0
    :try_end_1f
    .catchall {:try_start_3 .. :try_end_1f} :catchall_23

    .line 552
    invoke-static {v1}, Lcom/trueaxis/modmenu/ModMenu;->closeQuietly(Ljava/io/Closeable;)V

    .line 548
    return-object p0

    .line 549
    :catchall_23
    move-exception p0

    .line 550
    nop

    .line 552
    invoke-static {v1}, Lcom/trueaxis/modmenu/ModMenu;->closeQuietly(Ljava/io/Closeable;)V

    .line 550
    return-object v0
.end method

.method private static buildSummary(Landroid/content/Context;)Ljava/lang/String;
    .registers 4

    .line 529
    nop

    .line 530
    :try_start_1
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    .line 531
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Version "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, v0, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " | Build "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v0, v0, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 532
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->buildDateUtc(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    .line 533
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_50

    .line 534
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " | Built "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_50
    .catchall {:try_start_1 .. :try_end_50} :catchall_51

    .line 536
    :cond_50
    return-object v0

    .line 537
    :catchall_51
    move-exception p0

    .line 538
    const-string p0, "Version unknown"

    return-object p0
.end method

.method private static button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;
    .registers 6

    .line 102
    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 103
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 104
    const/high16 p1, 0x41300000    # 11.0f

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setTextSize(F)V

    .line 105
    const/4 p1, 0x0

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setAllCaps(Z)V

    .line 106
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinHeight(I)V

    .line 107
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinimumHeight(I)V

    .line 108
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

    .line 109
    return-object v0
.end method

.method public static carAssetPath(I)Ljava/lang/String;
    .registers 2

    .line 169
    sget-object v0, Lcom/trueaxis/modmenu/ModMenu;->CAR_TEXTURES:[Ljava/lang/String;

    aget-object p0, v0, p0

    return-object p0
.end method

.method public static carCount()I
    .registers 1

    .line 161
    sget-object v0, Lcom/trueaxis/modmenu/ModMenu;->CAR_NAMES:[Ljava/lang/String;

    array-length v0, v0

    return v0
.end method

.method public static carCustomFile(Landroid/content/Context;I)Ljava/io/File;
    .registers 2

    .line 173
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/ModMenu;->customTexture(Landroid/content/Context;I)Ljava/io/File;

    move-result-object p0

    return-object p0
.end method

.method public static carName(I)Ljava/lang/String;
    .registers 2

    .line 165
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

.method public static checkpointSplitsEnabled(Landroid/content/Context;)Z
    .registers 3

    .line 285
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->applyMenuDefaults(Landroid/content/Context;)V

    .line 286
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "checkpoint_splits"

    const/4 v1, 0x1

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method private static clamp(III)I
    .registers 3

    .line 319
    invoke-static {p2, p0}, Ljava/lang/Math;->min(II)I

    move-result p0

    invoke-static {p1, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    return p0
.end method

.method private static closeQuietly(Ljava/io/Closeable;)V
    .registers 1

    .line 244
    if-nez p0, :cond_3

    return-void

    .line 246
    :cond_3
    :try_start_3
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_6
    .catchall {:try_start_3 .. :try_end_6} :catchall_7

    .line 248
    goto :goto_8

    .line 247
    :catchall_7
    move-exception p0

    .line 249
    :goto_8
    return-void
.end method

.method private static customTexture(Landroid/content/Context;I)Ljava/io/File;
    .registers 4

    .line 150
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object p0

    sget-object v1, Lcom/trueaxis/modmenu/ModMenu;->CAR_TEXTURES:[Ljava/lang/String;

    aget-object p1, v1, p1

    invoke-direct {v0, p0, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method private static decodeSampled(Landroid/content/Context;Landroid/net/Uri;)Landroid/graphics/Bitmap;
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 820
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "decode probe uri="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "livery"

    invoke-static {v1, v0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 821
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 822
    const/4 v2, 0x1

    iput-boolean v2, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 823
    nop

    .line 825
    const/4 v3, 0x0

    :try_start_22
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    invoke-virtual {v4, p1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v4
    :try_end_2a
    .catchall {:try_start_22 .. :try_end_2a} :catchall_98

    .line 826
    :try_start_2a
    invoke-static {v4, v3, v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    :try_end_2d
    .catchall {:try_start_2a .. :try_end_2d} :catchall_95

    .line 828
    invoke-static {v4}, Lcom/trueaxis/modmenu/ModMenu;->closeQuietly(Ljava/io/Closeable;)V

    .line 829
    nop

    .line 830
    nop

    .line 831
    iget v4, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iget v5, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    invoke-static {v4, v5}, Ljava/lang/Math;->max(II)I

    move-result v4

    .line 832
    :goto_3a
    div-int v5, v4, v2

    const/16 v6, 0x400

    if-le v5, v6, :cond_43

    mul-int/lit8 v2, v2, 0x2

    goto :goto_3a

    .line 833
    :cond_43
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "decode bounds width="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " height="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v0, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, " sample="

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 836
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 837
    iput v2, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 838
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    iput-object v1, v0, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    .line 839
    nop

    .line 841
    :try_start_7d
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object p0
    :try_end_85
    .catchall {:try_start_7d .. :try_end_85} :catchall_90

    .line 842
    :try_start_85
    invoke-static {p0, v3, v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object p1
    :try_end_89
    .catchall {:try_start_85 .. :try_end_89} :catchall_8d

    .line 844
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->closeQuietly(Ljava/io/Closeable;)V

    .line 842
    return-object p1

    .line 844
    :catchall_8d
    move-exception p1

    move-object v3, p0

    goto :goto_91

    :catchall_90
    move-exception p1

    :goto_91
    invoke-static {v3}, Lcom/trueaxis/modmenu/ModMenu;->closeQuietly(Ljava/io/Closeable;)V

    .line 845
    throw p1

    .line 828
    :catchall_95
    move-exception p0

    move-object v3, v4

    goto :goto_99

    :catchall_98
    move-exception p0

    :goto_99
    invoke-static {v3}, Lcom/trueaxis/modmenu/ModMenu;->closeQuietly(Ljava/io/Closeable;)V

    .line 829
    goto :goto_9e

    :goto_9d
    throw p0

    :goto_9e
    goto :goto_9d
.end method

.method public static deleteCustomLivery(Landroid/content/Context;I)V
    .registers 9

    .line 923
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModDebugLog;->install(Landroid/content/Context;)V

    .line 924
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/ModMenu;->customTexture(Landroid/content/Context;I)Ljava/io/File;

    move-result-object v0

    .line 925
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    const-string v2, " deleted="

    const-string v3, " path="

    const-string v4, "livery"

    if-eqz v1, :cond_45

    .line 926
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result v1

    .line 927
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "delete internal car="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {p1}, Lcom/trueaxis/modmenu/ModMenu;->carName(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 928
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 927
    invoke-static {v4, v0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 930
    :cond_45
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/ModMenu;->externalTexture(Landroid/content/Context;I)Ljava/io/File;

    move-result-object p0

    .line 931
    if-eqz p0, :cond_83

    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_83

    .line 932
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    move-result v0

    .line 933
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "delete external car="

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p1}, Lcom/trueaxis/modmenu/ModMenu;->carName(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 934
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 933
    invoke-static {v4, p0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 936
    :cond_83
    return-void
.end method

.method private static dp(Landroid/content/Context;I)I
    .registers 2

    .line 83
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
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 895
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "export start car="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p2}, Lcom/trueaxis/modmenu/ModMenu;->carName(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " uri="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "livery"

    invoke-static {v1, v0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 896
    nop

    .line 897
    nop

    .line 898
    nop

    .line 900
    const/4 v0, 0x0

    :try_start_2a
    invoke-static {p0, p2}, Lcom/trueaxis/modmenu/ModMenu;->customTexture(Landroid/content/Context;I)Ljava/io/File;

    move-result-object v2

    .line 901
    invoke-virtual {v2}, Ljava/io/File;->isFile()Z

    move-result v3

    if-eqz v3, :cond_3a

    .line 902
    new-instance v3, Ljava/io/FileInputStream;

    invoke-direct {v3, v2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    goto :goto_46

    .line 903
    :cond_3a
    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v3

    sget-object v4, Lcom/trueaxis/modmenu/ModMenu;->CAR_TEXTURES:[Ljava/lang/String;

    aget-object v4, v4, p2

    invoke-virtual {v3, v4}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v3
    :try_end_46
    .catchall {:try_start_2a .. :try_end_46} :catchall_ab

    .line 904
    :goto_46
    :try_start_46
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/content/ContentResolver;->openOutputStream(Landroid/net/Uri;)Ljava/io/OutputStream;

    move-result-object v0

    .line 905
    if-eqz v0, :cond_9f

    .line 906
    const/16 p0, 0x4000

    new-array p0, p0, [B

    const/4 p1, 0x0

    const/4 v4, 0x0

    .line 908
    :goto_56
    invoke-virtual {v3, p0}, Ljava/io/InputStream;->read([B)I

    move-result v5

    const/4 v6, -0x1

    if-eq v5, v6, :cond_62

    .line 909
    invoke-virtual {v0, p0, p1, v5}, Ljava/io/OutputStream;->write([BII)V

    .line 910
    add-int/2addr v4, v5

    goto :goto_56

    .line 912
    :cond_62
    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 913
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string p1, "export complete car="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-static {p2}, Lcom/trueaxis/modmenu/ModMenu;->carName(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " bytes="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " custom="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    .line 914
    invoke-virtual {v2}, Ljava/io/File;->isFile()Z

    move-result p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 913
    invoke-static {v1, p0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_97
    .catchall {:try_start_46 .. :try_end_97} :catchall_a7

    .line 916
    invoke-static {v3}, Lcom/trueaxis/modmenu/ModMenu;->closeQuietly(Ljava/io/Closeable;)V

    .line 917
    invoke-static {v0}, Lcom/trueaxis/modmenu/ModMenu;->closeQuietly(Ljava/io/Closeable;)V

    .line 918
    nop

    .line 919
    return-void

    .line 905
    :cond_9f
    :try_start_9f
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Could not open export destination"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_a7
    .catchall {:try_start_9f .. :try_end_a7} :catchall_a7

    .line 916
    :catchall_a7
    move-exception p0

    move-object p1, v0

    move-object v0, v3

    goto :goto_ad

    :catchall_ab
    move-exception p0

    move-object p1, v0

    :goto_ad
    invoke-static {v0}, Lcom/trueaxis/modmenu/ModMenu;->closeQuietly(Ljava/io/Closeable;)V

    .line 917
    invoke-static {p1}, Lcom/trueaxis/modmenu/ModMenu;->closeQuietly(Ljava/io/Closeable;)V

    .line 918
    goto :goto_b5

    :goto_b4
    throw p0

    :goto_b5
    goto :goto_b4
.end method

.method private static externalTexture(Landroid/content/Context;I)Ljava/io/File;
    .registers 4

    .line 155
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object p0

    .line 156
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

    .line 144
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    return-object v0
.end method

.method public static handleActivityResult(Landroid/app/Activity;IILandroid/content/Intent;)Z
    .registers 9

    .line 772
    const/4 v0, 0x0

    const/16 v1, 0x1c85

    if-eq p1, v1, :cond_a

    const/16 v2, 0x1c86

    if-eq p1, v2, :cond_a

    return v0

    .line 773
    :cond_a
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModDebugLog;->install(Landroid/content/Context;)V

    .line 774
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "handle result request="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " result="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " hasData="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/4 v3, 0x1

    if-eqz p3, :cond_31

    const/4 v4, 0x1

    goto :goto_32

    :cond_31
    const/4 v4, 0x0

    :goto_32
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, " hasUri="

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    if-eqz p3, :cond_46

    .line 777
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v4

    if-eqz v4, :cond_46

    const/4 v0, 0x1

    goto :goto_47

    :cond_46
    nop

    :goto_47
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 774
    const-string v2, "livery"

    invoke-static {v2, v0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 778
    const/4 v0, -0x1

    if-ne p2, v0, :cond_129

    if-eqz p3, :cond_129

    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p2

    if-nez p2, :cond_61

    goto/16 :goto_129

    .line 779
    :cond_61
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p2

    .line 780
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->selectedCar(Landroid/content/Context;)I

    move-result p3

    .line 782
    const-string v0, " car="

    if-ne p1, v1, :cond_ad

    .line 783
    :try_start_6d
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "import result uri="

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p3}, Lcom/trueaxis/modmenu/ModMenu;->carName(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 784
    invoke-static {p0, p2, p3}, Lcom/trueaxis/modmenu/ModMenu;->importLivery(Landroid/content/Context;Landroid/net/Uri;I)V

    .line 785
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v0, Lcom/trueaxis/modmenu/ModMenu;->CAR_NAMES:[Ljava/lang/String;

    aget-object p3, v0, p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string p3, " livery imported. Restart the game to apply."

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p0, p2}, Lcom/trueaxis/modmenu/ModMenu;->toast(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_ec

    .line 787
    :cond_ad
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "export result uri="

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p3}, Lcom/trueaxis/modmenu/ModMenu;->carName(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 788
    invoke-static {p0, p2, p3}, Lcom/trueaxis/modmenu/ModMenu;->exportLivery(Landroid/content/Context;Landroid/net/Uri;I)V

    .line 789
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v0, Lcom/trueaxis/modmenu/ModMenu;->CAR_NAMES:[Ljava/lang/String;

    aget-object p3, v0, p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string p3, " livery exported for editing."

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p0, p2}, Lcom/trueaxis/modmenu/ModMenu;->toast(Landroid/content/Context;Ljava/lang/String;)V

    .line 791
    :goto_ec
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "activity result handled successfully request="

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_102
    .catchall {:try_start_6d .. :try_end_102} :catchall_103

    .line 796
    goto :goto_128

    .line 792
    :catchall_103
    move-exception p1

    .line 793
    const-string p2, "YCS2Mod"

    const-string p3, "Livery file operation failed"

    invoke-static {p2, p3, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 794
    invoke-static {v2, p3, p1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 795
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

    .line 797
    :goto_128
    return v3

    .line 778
    :cond_129
    :goto_129
    return v3
.end method

.method private static importLivery(Landroid/content/Context;Landroid/net/Uri;I)V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 801
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "import start car="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p2}, Lcom/trueaxis/modmenu/ModMenu;->carName(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " uri="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "livery"

    invoke-static {v1, v0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 802
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/ModMenu;->decodeSampled(Landroid/content/Context;Landroid/net/Uri;)Landroid/graphics/Bitmap;

    move-result-object p1

    .line 803
    if-eqz p1, :cond_99

    .line 804
    nop

    .line 806
    const/4 v0, 0x0

    :try_start_2e
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "import decoded source="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 807
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "x"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 806
    invoke-static {v1, v2}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 808
    const/4 v2, 0x1

    const/16 v3, 0x200

    invoke-static {p1, v3, v3, v2}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 809
    invoke-static {p0, p2}, Lcom/trueaxis/modmenu/ModMenu;->customTexture(Landroid/content/Context;I)Ljava/io/File;

    move-result-object v2

    invoke-static {v2, v0}, Lcom/trueaxis/modmenu/ModMenu;->writeLivery(Ljava/io/File;Landroid/graphics/Bitmap;)V

    .line 810
    invoke-static {p0, p2, v0}, Lcom/trueaxis/modmenu/ModMenu;->mirrorExternal(Landroid/content/Context;ILandroid/graphics/Bitmap;)V

    .line 811
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "import complete car="

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-static {p2}, Lcom/trueaxis/modmenu/ModMenu;->carName(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_81
    .catchall {:try_start_2e .. :try_end_81} :catchall_8d

    .line 813
    if-eqz v0, :cond_88

    if-eq v0, p1, :cond_88

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 814
    :cond_88
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    .line 815
    nop

    .line 816
    return-void

    .line 813
    :catchall_8d
    move-exception p0

    if-eqz v0, :cond_95

    if-eq v0, p1, :cond_95

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 814
    :cond_95
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    .line 815
    throw p0

    .line 803
    :cond_99
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Unsupported image"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static label(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/TextView;
    .registers 5

    .line 94
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 95
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 96
    int-to-float p0, p2

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 97
    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 98
    return-object v0
.end method

.method private static linkButton(Landroid/app/Activity;Ljava/lang/String;ILandroid/graphics/drawable/Drawable;Ljava/lang/String;)Landroid/widget/Button;
    .registers 6

    .line 114
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/ModMenu;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object p1

    .line 115
    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setTextColor(I)V

    .line 116
    const/high16 v0, 0x41400000    # 12.0f

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setTextSize(F)V

    .line 117
    const/16 v0, 0x11

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setGravity(I)V

    .line 118
    const/16 v0, 0x8

    invoke-static {p0, v0}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v0

    int-to-float v0, v0

    invoke-static {p2, v0}, Lcom/trueaxis/modmenu/ModMenu;->background(IF)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/Button;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 119
    const/16 p2, 0x12

    invoke-static {p0, p2}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result p2

    .line 120
    const/4 v0, 0x0

    invoke-virtual {p3, v0, v0, p2, p2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 121
    const/4 p2, 0x0

    invoke-virtual {p1, p3, p2, p2, p2}, Landroid/widget/Button;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 122
    const/4 p2, 0x7

    invoke-static {p0, p2}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/widget/Button;->setCompoundDrawablePadding(I)V

    .line 123
    new-instance p2, Lcom/trueaxis/modmenu/ModMenu$1;

    invoke-direct {p2, p4, p0}, Lcom/trueaxis/modmenu/ModMenu$1;-><init>(Ljava/lang/String;Landroid/app/Activity;)V

    invoke-virtual {p1, p2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 134
    return-object p1
.end method

.method public static loadEditableLivery(Landroid/content/Context;I)Landroid/graphics/Bitmap;
    .registers 8

    .line 182
    const-string v0, "livery"

    invoke-static {p0}, Lcom/trueaxis/modmenu/ModDebugLog;->install(Landroid/content/Context;)V

    .line 183
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/ModMenu;->customTexture(Landroid/content/Context;I)Ljava/io/File;

    move-result-object v1

    .line 184
    nop

    .line 186
    const/4 v2, 0x0

    :try_start_b
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "load editable car="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {p1}, Lcom/trueaxis/modmenu/ModMenu;->carName(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " customExists="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 187
    invoke-virtual {v1}, Ljava/io/File;->isFile()Z

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " asset="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Lcom/trueaxis/modmenu/ModMenu;->CAR_TEXTURES:[Ljava/lang/String;

    aget-object v4, v4, p1

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 186
    invoke-static {v0, v3}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 189
    invoke-virtual {v1}, Ljava/io/File;->isFile()Z

    move-result v3

    if-eqz v3, :cond_4d

    .line 190
    new-instance p0, Ljava/io/FileInputStream;

    invoke-direct {p0, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    goto :goto_59

    .line 191
    :cond_4d
    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object p0

    sget-object v1, Lcom/trueaxis/modmenu/ModMenu;->CAR_TEXTURES:[Ljava/lang/String;

    aget-object v1, v1, p1

    invoke-virtual {p0, v1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p0
    :try_end_59
    .catchall {:try_start_b .. :try_end_59} :catchall_d3

    .line 192
    :goto_59
    :try_start_59
    new-instance v1, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v1}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 193
    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    iput-object v3, v1, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    .line 194
    invoke-static {p0, v2, v1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 195
    if-nez v1, :cond_87

    .line 196
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "decode returned null car="

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p1}, Lcom/trueaxis/modmenu/ModMenu;->carName(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_82
    .catchall {:try_start_59 .. :try_end_82} :catchall_ce

    .line 197
    nop

    .line 209
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->closeQuietly(Ljava/io/Closeable;)V

    .line 197
    return-object v2

    .line 199
    :cond_87
    :try_start_87
    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    const/4 v4, 0x1

    invoke-virtual {v1, v3, v4}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    move-result-object v3

    .line 200
    if-eq v3, v1, :cond_93

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    .line 201
    :cond_93
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "loaded editable car="

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p1}, Lcom/trueaxis/modmenu/ModMenu;->carName(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, " size="

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 202
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "x"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 201
    invoke-static {v0, v1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_c9
    .catchall {:try_start_87 .. :try_end_c9} :catchall_ce

    .line 203
    nop

    .line 209
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->closeQuietly(Ljava/io/Closeable;)V

    .line 203
    return-object v3

    .line 204
    :catchall_ce
    move-exception v1

    move-object v5, v1

    move-object v1, p0

    move-object p0, v5

    goto :goto_d5

    :catchall_d3
    move-exception p0

    move-object v1, v2

    .line 205
    :goto_d5
    :try_start_d5
    const-string v3, "YCS2Mod"

    const-string v4, "Could not load livery for editing"

    invoke-static {v3, v4, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 206
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Could not load livery for editing car="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {p1}, Lcom/trueaxis/modmenu/ModMenu;->carName(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1, p0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_f6
    .catchall {:try_start_d5 .. :try_end_f6} :catchall_fb

    .line 207
    nop

    .line 209
    invoke-static {v1}, Lcom/trueaxis/modmenu/ModMenu;->closeQuietly(Ljava/io/Closeable;)V

    .line 207
    return-object v2

    .line 209
    :catchall_fb
    move-exception p0

    invoke-static {v1}, Lcom/trueaxis/modmenu/ModMenu;->closeQuietly(Ljava/io/Closeable;)V

    .line 210
    throw p0
.end method

.method private static mirrorExternal(Landroid/content/Context;ILandroid/graphics/Bitmap;)V
    .registers 6

    .line 881
    const-string v0, "livery"

    :try_start_2
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/ModMenu;->externalTexture(Landroid/content/Context;I)Ljava/io/File;

    move-result-object p0

    .line 882
    if-eqz p0, :cond_34

    .line 883
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mirror external car="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p1}, Lcom/trueaxis/modmenu/ModMenu;->carName(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " target="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 884
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 883
    invoke-static {v0, v1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 885
    invoke-static {p0, p2}, Lcom/trueaxis/modmenu/ModMenu;->writeLivery(Ljava/io/File;Landroid/graphics/Bitmap;)V

    goto :goto_39

    .line 887
    :cond_34
    const-string p0, "mirror external skipped; no external files dir"

    invoke-static {v0, p0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_39
    .catchall {:try_start_2 .. :try_end_39} :catchall_3a

    .line 891
    :goto_39
    goto :goto_55

    .line 889
    :catchall_3a
    move-exception p0

    .line 890
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "mirror external failed car="

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-static {p1}, Lcom/trueaxis/modmenu/ModMenu;->carName(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1, p0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 892
    :goto_55
    return-void
.end method

.method public static prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .registers 3

    .line 252
    const-string v0, "jcs_mod"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    return-object p0
.end method

.method private static quarantineLivery(Ljava/io/File;ILjava/lang/String;Ljava/lang/String;)V
    .registers 13

    .line 353
    const-string v0, " path="

    const-string v1, " reason="

    const-string v2, " car="

    const-string v3, "livery"

    new-instance v4, Ljava/io/File;

    invoke-virtual {p0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 354
    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ".bad-"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 355
    nop

    .line 357
    :try_start_31
    invoke-virtual {p0, v4}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v5

    .line 358
    if-nez v5, :cond_3b

    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    move-result v5
    :try_end_3b
    .catchall {:try_start_31 .. :try_end_3b} :catchall_8b

    .line 365
    :cond_3b
    nop

    .line 366
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "quarantined "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    .line 367
    invoke-static {p1}, Lcom/trueaxis/modmenu/ModMenu;->carName(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 369
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " target="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    .line 370
    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " success="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 366
    invoke-static {v3, p0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 372
    return-void

    .line 359
    :catchall_8b
    move-exception v4

    .line 360
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "quarantine failed "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    .line 361
    invoke-static {p1}, Lcom/trueaxis/modmenu/ModMenu;->carName(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 363
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 360
    invoke-static {v3, p0, v4}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 364
    return-void
.end method

.method private static rememberCar(Landroid/content/Context;Landroid/widget/Spinner;)V
    .registers 3

    .line 236
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

    .line 237
    return-void
.end method

.method public static resetAllCustomLiveries(Landroid/content/Context;)V
    .registers 3

    .line 939
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModDebugLog;->install(Landroid/content/Context;)V

    .line 940
    const-string v0, "livery"

    const-string v1, "reset all custom liveries"

    invoke-static {v0, v1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 941
    const/4 v0, 0x0

    :goto_b
    sget-object v1, Lcom/trueaxis/modmenu/ModMenu;->CAR_TEXTURES:[Ljava/lang/String;

    array-length v1, v1

    if-ge v0, v1, :cond_16

    .line 942
    invoke-static {p0, v0}, Lcom/trueaxis/modmenu/ModMenu;->deleteCustomLivery(Landroid/content/Context;I)V

    .line 941
    add-int/lit8 v0, v0, 0x1

    goto :goto_b

    .line 944
    :cond_16
    return-void
.end method

.method public static saveDesignedLivery(Landroid/content/Context;ILandroid/graphics/Bitmap;)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 215
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModDebugLog;->install(Landroid/content/Context;)V

    .line 216
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "save designed car="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p1}, Lcom/trueaxis/modmenu/ModMenu;->carName(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " bitmap="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 217
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "x"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 216
    const-string v1, "livery"

    invoke-static {v1, v0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 218
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    const/16 v2, 0x200

    if-ne v0, v2, :cond_4b

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    if-ne v0, v2, :cond_4b

    .line 219
    move-object v0, p2

    goto :goto_50

    .line 220
    :cond_4b
    const/4 v0, 0x1

    invoke-static {p2, v2, v2, v0}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v0

    :goto_50
    nop

    .line 222
    :try_start_51
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/ModMenu;->customTexture(Landroid/content/Context;I)Ljava/io/File;

    move-result-object v2

    invoke-static {v2, v0}, Lcom/trueaxis/modmenu/ModMenu;->writeLivery(Ljava/io/File;Landroid/graphics/Bitmap;)V

    .line 223
    invoke-static {p0, p1, v0}, Lcom/trueaxis/modmenu/ModMenu;->mirrorExternal(Landroid/content/Context;ILandroid/graphics/Bitmap;)V

    .line 224
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "save designed complete car="

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-static {p1}, Lcom/trueaxis/modmenu/ModMenu;->carName(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_75
    .catchall {:try_start_51 .. :try_end_75} :catchall_7b

    .line 226
    if-eq v0, p2, :cond_7a

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 228
    :cond_7a
    return-void

    .line 226
    :catchall_7b
    move-exception p0

    if-eq v0, p2, :cond_81

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 227
    :cond_81
    throw p0
.end method

.method private static sectionHeader(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/TextView;
    .registers 5

    .line 138
    const/16 v0, 0xff

    const/16 v1, 0x80

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    const/16 v1, 0xd

    invoke-static {p0, p1, v1, v0}, Lcom/trueaxis/modmenu/ModMenu;->label(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object p1

    .line 139
    const/16 v0, 0xc

    invoke-static {p0, v0}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v0

    const/4 v1, 0x4

    invoke-static {p0, v1}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result p0

    invoke-virtual {p1, v2, v0, v2, p0}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 140
    return-object p1
.end method

.method public static sectorSplitsEnabled(Landroid/content/Context;)Z
    .registers 3

    .line 295
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->applyMenuDefaults(Landroid/content/Context;)V

    .line 296
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->checkpointSplitsEnabled(Landroid/content/Context;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_17

    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "split_sector_delta"

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    if-eqz p0, :cond_17

    const/4 v1, 0x1

    :cond_17
    return v1
.end method

.method private static selectedCar(Landroid/content/Context;)I
    .registers 3

    .line 231
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "livery_car"

    const/4 v1, 0x1

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    .line 232
    if-ltz p0, :cond_13

    sget-object v0, Lcom/trueaxis/modmenu/ModMenu;->CAR_TEXTURES:[Ljava/lang/String;

    array-length v0, v0

    if-ge p0, v0, :cond_13

    move v1, p0

    :cond_13
    return v1
.end method

.method public static showLiveryManager(Landroid/app/Activity;)V
    .registers 13

    .line 626
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModDebugLog;->install(Landroid/content/Context;)V

    .line 627
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "open manager selectedCar="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->selectedCar(Landroid/content/Context;)I

    move-result v1

    invoke-static {v1}, Lcom/trueaxis/modmenu/ModMenu;->carName(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "livery"

    invoke-static {v1, v0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 629
    :try_start_23
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 630
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 631
    const/16 v2, 0x12

    invoke-static {p0, v2}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v3

    const/4 v4, 0x4

    invoke-static {p0, v4}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v5

    invoke-static {p0, v2}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v2

    invoke-static {p0, v4}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-virtual {v0, v3, v5, v2, v4}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 633
    const-string v2, "Design a livery in the app, upload any PNG/JPG, or export the exact UV texture to edit elsewhere. Liveries are 512x512 PNG and apply after a restart."

    const v3, -0xbbbbbc

    const/16 v4, 0xb

    invoke-static {p0, v2, v4, v3}, Lcom/trueaxis/modmenu/ModMenu;->label(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v2

    .line 637
    const/16 v5, 0x8

    invoke-static {p0, v5}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v6

    const/4 v7, 0x0

    invoke-virtual {v2, v7, v7, v7, v6}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 638
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 640
    new-instance v2, Landroid/widget/Spinner;

    invoke-direct {v2, p0}, Landroid/widget/Spinner;-><init>(Landroid/content/Context;)V

    .line 641
    new-instance v6, Landroid/widget/ArrayAdapter;

    sget-object v8, Lcom/trueaxis/modmenu/ModMenu;->CAR_NAMES:[Ljava/lang/String;

    const v9, 0x1090008

    invoke-direct {v6, p0, v9, v8}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    .line 643
    const v8, 0x1090009

    invoke-virtual {v6, v8}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 644
    invoke-virtual {v2, v6}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 645
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->selectedCar(Landroid/content/Context;)I

    move-result v6

    invoke-virtual {v2, v6}, Landroid/widget/Spinner;->setSelection(I)V

    .line 646
    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v8, -0x1

    const/4 v9, -0x2

    invoke-direct {v6, v8, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v2, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 649
    const-string v6, ""

    invoke-static {p0, v6, v4, v3}, Lcom/trueaxis/modmenu/ModMenu;->label(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v3

    .line 650
    const/4 v4, 0x5

    invoke-static {p0, v4}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v6

    invoke-static {p0, v4}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-virtual {v3, v7, v6, v7, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 651
    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 653
    const-string v4, "\u00c3\u00b0\u00c5\u00b8\u00c5\u00bd\u00c2\u00a8  Open livery designer"

    invoke-static {p0, v4}, Lcom/trueaxis/modmenu/ModMenu;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v4

    .line 654
    const/high16 v6, 0x41500000    # 13.0f

    invoke-virtual {v4, v6}, Landroid/widget/Button;->setTextSize(F)V

    .line 655
    invoke-virtual {v4, v8}, Landroid/widget/Button;->setTextColor(I)V

    .line 656
    const/16 v6, 0xff

    const/16 v10, 0x80

    invoke-static {v6, v10, v7}, Landroid/graphics/Color;->rgb(III)I

    move-result v6

    invoke-static {p0, v5}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v10

    int-to-float v10, v10

    invoke-static {v6, v10}, Lcom/trueaxis/modmenu/ModMenu;->background(IF)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v6

    invoke-virtual {v4, v6}, Landroid/widget/Button;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 657
    new-instance v6, Lcom/trueaxis/modmenu/ModMenu$8;

    invoke-direct {v6, p0, v2}, Lcom/trueaxis/modmenu/ModMenu$8;-><init>(Landroid/app/Activity;Landroid/widget/Spinner;)V

    invoke-virtual {v4, v6}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 669
    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v6, v8, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 671
    invoke-static {p0, v5}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v5

    iput v5, v6, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 672
    invoke-virtual {v0, v4, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 674
    new-instance v4, Landroid/widget/LinearLayout;

    invoke-direct {v4, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 675
    invoke-virtual {v4, v7}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 676
    const-string v5, "Upload"

    invoke-static {p0, v5}, Lcom/trueaxis/modmenu/ModMenu;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v5

    .line 677
    const-string v6, "Export / edit"

    invoke-static {p0, v6}, Lcom/trueaxis/modmenu/ModMenu;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v6

    .line 678
    const-string v8, "Restore default"

    invoke-static {p0, v8}, Lcom/trueaxis/modmenu/ModMenu;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v8

    .line 679
    new-instance v10, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v11, 0x3f800000    # 1.0f

    invoke-direct {v10, v7, v9, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v4, v5, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 681
    new-instance v10, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v10, v7, v9, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v4, v6, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 683
    new-instance v10, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v10, v7, v9, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v4, v8, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 685
    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 687
    new-instance v4, Lcom/trueaxis/modmenu/ModMenu$9;

    invoke-direct {v4, v2, v3, p0}, Lcom/trueaxis/modmenu/ModMenu$9;-><init>(Landroid/widget/Spinner;Landroid/widget/TextView;Landroid/app/Activity;)V

    .line 695
    new-instance v3, Lcom/trueaxis/modmenu/ModMenu$10;

    invoke-direct {v3, p0, v2, v4}, Lcom/trueaxis/modmenu/ModMenu$10;-><init>(Landroid/app/Activity;Landroid/widget/Spinner;Ljava/lang/Runnable;)V

    invoke-virtual {v2, v3}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 707
    invoke-interface {v4}, Ljava/lang/Runnable;->run()V

    .line 709
    new-instance v3, Lcom/trueaxis/modmenu/ModMenu$11;

    invoke-direct {v3, p0, v2}, Lcom/trueaxis/modmenu/ModMenu$11;-><init>(Landroid/app/Activity;Landroid/widget/Spinner;)V

    invoke-virtual {v5, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 726
    new-instance v3, Lcom/trueaxis/modmenu/ModMenu$12;

    invoke-direct {v3, p0, v2}, Lcom/trueaxis/modmenu/ModMenu$12;-><init>(Landroid/app/Activity;Landroid/widget/Spinner;)V

    invoke-virtual {v6, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 748
    new-instance v3, Lcom/trueaxis/modmenu/ModMenu$13;

    invoke-direct {v3, v2, p0, v4}, Lcom/trueaxis/modmenu/ModMenu$13;-><init>(Landroid/widget/Spinner;Landroid/app/Activity;Ljava/lang/Runnable;)V

    invoke-virtual {v8, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 758
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v3, "Custom liveries - all cars"

    .line 759
    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 760
    invoke-virtual {v2, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v2, "Close"

    .line 761
    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 762
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;
    :try_end_148
    .catchall {:try_start_23 .. :try_end_148} :catchall_149

    .line 767
    goto :goto_159

    .line 763
    :catchall_149
    move-exception v0

    .line 764
    const-string v2, "YCS2Mod"

    const-string v3, "Could not open livery manager"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 765
    invoke-static {v1, v3, v0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 766
    const-string v0, "Could not open livery manager."

    invoke-static {p0, v0}, Lcom/trueaxis/modmenu/ModMenu;->toast(Landroid/content/Context;Ljava/lang/String;)V

    .line 768
    :goto_159
    return-void
.end method

.method public static showPreLaunchMenu(Landroid/app/Activity;Ljava/lang/Runnable;)V
    .registers 18

    .line 379
    move-object/from16 v0, p0

    invoke-static/range {p0 .. p0}, Lcom/trueaxis/modmenu/ModDebugLog;->install(Landroid/content/Context;)V

    .line 380
    invoke-static/range {p0 .. p0}, Lcom/trueaxis/modmenu/ModMenu;->applyMenuDefaults(Landroid/content/Context;)V

    .line 381
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "show pre-launch menu checkpointSplits="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 382
    invoke-static/range {p0 .. p0}, Lcom/trueaxis/modmenu/ModMenu;->checkpointSplitsEnabled(Landroid/content/Context;)Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 381
    const-string v9, "launcher"

    invoke-static {v9, v1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 383
    invoke-static/range {p0 .. p0}, Lcom/trueaxis/modmenu/ModIdentity;->configure(Landroid/content/Context;)V

    .line 385
    :try_start_27
    new-instance v10, Landroid/widget/LinearLayout;

    invoke-direct {v10, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 386
    const/4 v7, 0x1

    invoke-virtual {v10, v7}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 387
    const/16 v1, 0xd

    const/16 v2, 0x17

    const/16 v3, 0x11

    invoke-static {v1, v3, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v1

    invoke-virtual {v10, v1}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 388
    const/16 v1, 0x14

    invoke-static {v0, v1}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v4

    const/16 v11, 0x10

    invoke-static {v0, v11}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v5

    invoke-static {v0, v1}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v1

    invoke-static {v0, v11}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v6

    invoke-virtual {v10, v4, v5, v1, v6}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 390
    const-string v1, "JCS2 Community Mod"

    const/16 v12, 0x80

    const/16 v13, 0xff

    const/4 v14, 0x0

    invoke-static {v13, v12, v14}, Landroid/graphics/Color;->rgb(III)I

    move-result v4

    invoke-static {v0, v1, v2, v4}, Lcom/trueaxis/modmenu/ModMenu;->label(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v1

    .line 391
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setGravity(I)V

    .line 392
    const/4 v2, 0x2

    invoke-static {v0, v2}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-virtual {v1, v14, v14, v14, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 393
    invoke-virtual {v10, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 395
    invoke-static/range {p0 .. p0}, Lcom/trueaxis/modmenu/ModMenu;->buildSummary(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    const/16 v8, 0xde

    const/16 v15, 0xd8

    const/16 v6, 0xd2

    invoke-static {v6, v15, v8}, Landroid/graphics/Color;->rgb(III)I

    move-result v4

    const/16 v5, 0xb

    invoke-static {v0, v1, v5, v4}, Lcom/trueaxis/modmenu/ModMenu;->label(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v1

    .line 396
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setGravity(I)V

    .line 397
    const/4 v4, 0x3

    invoke-static {v0, v4}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-virtual {v1, v14, v14, v14, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 398
    invoke-virtual {v10, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 400
    const-string v1, "A community mod for Jet Car Stunts 2 with updates, custom liveries, and replay split tools before launch."

    .line 402
    const/16 v4, 0xb2

    const/16 v6, 0xaa

    const/16 v12, 0xb9

    invoke-static {v6, v4, v12}, Landroid/graphics/Color;->rgb(III)I

    move-result v12

    .line 400
    invoke-static {v0, v1, v5, v12}, Lcom/trueaxis/modmenu/ModMenu;->label(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v1

    .line 403
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setGravity(I)V

    .line 404
    const/16 v12, 0x8

    invoke-static {v0, v12}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v12

    invoke-virtual {v1, v14, v14, v14, v12}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 405
    invoke-virtual {v10, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 407
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 408
    invoke-virtual {v1, v14}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 409
    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 410
    const/16 v3, 0xa

    invoke-static {v0, v3}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v12

    invoke-virtual {v1, v14, v14, v14, v12}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 411
    new-instance v12, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v13, 0x3f800000    # 1.0f

    const/4 v8, -0x2

    invoke-direct {v12, v14, v8, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 413
    const/4 v5, 0x4

    invoke-static {v0, v5}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v15

    invoke-static {v0, v5}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-virtual {v12, v15, v14, v4, v14}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 414
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v4, v14, v8, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 416
    invoke-static {v0, v5}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v15

    invoke-static {v0, v5}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v5

    invoke-virtual {v4, v15, v14, v5, v14}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 417
    const-string v5, "GitHub"

    const/16 v15, 0x29

    const/16 v8, 0x2e

    const/16 v13, 0x24

    invoke-static {v13, v15, v8}, Landroid/graphics/Color;->rgb(III)I

    move-result v8

    new-instance v13, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;

    .line 418
    const/16 v15, 0x24

    const/16 v6, 0x29

    const/16 v14, 0x2e

    invoke-static {v15, v6, v14}, Landroid/graphics/Color;->rgb(III)I

    move-result v6

    const/4 v14, -0x1

    invoke-direct {v13, v14, v6}, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;-><init>(II)V

    const-string v6, "https://github.com/yanniedog/jcs2-mod"

    .line 417
    invoke-static {v0, v5, v8, v13, v6}, Lcom/trueaxis/modmenu/ModMenu;->linkButton(Landroid/app/Activity;Ljava/lang/String;ILandroid/graphics/drawable/Drawable;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v5

    invoke-virtual {v1, v5, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 420
    const-string v5, "Discord"

    const/16 v6, 0x65

    const/16 v8, 0xf2

    const/16 v12, 0x58

    invoke-static {v12, v6, v8}, Landroid/graphics/Color;->rgb(III)I

    move-result v6

    new-instance v8, Lcom/trueaxis/modmenu/ModMenu$DiscordIconDrawable;

    .line 421
    const/16 v12, 0x58

    const/16 v13, 0x65

    const/16 v15, 0xf2

    invoke-static {v12, v13, v15}, Landroid/graphics/Color;->rgb(III)I

    move-result v12

    invoke-direct {v8, v14, v12}, Lcom/trueaxis/modmenu/ModMenu$DiscordIconDrawable;-><init>(II)V

    const-string v12, "https://discord.gg/stBdE2Tfs2"

    .line 420
    invoke-static {v0, v5, v6, v8, v12}, Lcom/trueaxis/modmenu/ModMenu;->linkButton(Landroid/app/Activity;Ljava/lang/String;ILandroid/graphics/drawable/Drawable;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v5

    invoke-virtual {v1, v5, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 423
    invoke-virtual {v10, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 425
    new-instance v12, Landroid/widget/ScrollView;

    invoke-direct {v12, v0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    .line 426
    invoke-virtual {v12, v7}, Landroid/widget/ScrollView;->setFillViewport(Z)V

    .line 427
    new-instance v13, Landroid/widget/LinearLayout;

    invoke-direct {v13, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 428
    invoke-virtual {v13, v7}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 429
    invoke-static {v0, v11}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v1

    invoke-static {v0, v3}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-static {v0, v11}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v5

    const/16 v6, 0xe

    invoke-static {v0, v6}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v6

    invoke-virtual {v13, v1, v4, v5, v6}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 430
    const/16 v1, 0x20

    const/16 v4, 0x26

    const/16 v5, 0x1c

    invoke-static {v5, v1, v4}, Landroid/graphics/Color;->rgb(III)I

    move-result v1

    invoke-static {v0, v3}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v4

    int-to-float v4, v4

    invoke-static {v1, v4}, Lcom/trueaxis/modmenu/ModMenu;->background(IF)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v1

    invoke-virtual {v13, v1}, Landroid/widget/LinearLayout;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 432
    const-string v1, "Mod tools"

    invoke-static {v0, v1}, Lcom/trueaxis/modmenu/ModMenu;->sectionHeader(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v13, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 434
    const-string v1, "Custom liveries"

    invoke-static {v0, v1}, Lcom/trueaxis/modmenu/ModMenu;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v1

    .line 435
    new-instance v4, Lcom/trueaxis/modmenu/ModMenu$2;

    invoke-direct {v4, v0}, Lcom/trueaxis/modmenu/ModMenu$2;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v1, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 441
    invoke-static {}, Lcom/trueaxis/modmenu/ModMenu;->fill()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v4

    invoke-virtual {v13, v1, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 443
    const-string v1, "Check for updates"

    invoke-static {v0, v1}, Lcom/trueaxis/modmenu/ModMenu;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v1

    .line 444
    new-instance v4, Lcom/trueaxis/modmenu/ModMenu$3;

    invoke-direct {v4, v0}, Lcom/trueaxis/modmenu/ModMenu$3;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v1, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 450
    invoke-static {}, Lcom/trueaxis/modmenu/ModMenu;->fill()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v4

    invoke-virtual {v13, v1, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 452
    const-string v1, "Always on: purchase compatibility, expanded checkpoint capacity, and blue flame identification. Replay files are not rewritten."

    .line 454
    const/16 v4, 0x96

    const/16 v5, 0x9e

    const/16 v6, 0xa5

    invoke-static {v4, v5, v6}, Landroid/graphics/Color;->rgb(III)I

    move-result v4

    .line 452
    invoke-static {v0, v1, v3, v4}, Lcom/trueaxis/modmenu/ModMenu;->label(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v1

    .line 455
    const/16 v4, 0x9

    invoke-static {v0, v4}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-static {v0, v2}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v5

    const/4 v6, 0x0

    invoke-virtual {v1, v6, v4, v6, v5}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 456
    invoke-virtual {v13, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 458
    const-string v1, "Replay split HUD"

    invoke-static {v0, v1}, Lcom/trueaxis/modmenu/ModMenu;->sectionHeader(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v13, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 459
    const-string v1, "Compares your run with the saved replay ghost when checkpoint timing is available."

    .line 461
    const/16 v4, 0xb9

    const/16 v5, 0xb2

    const/16 v6, 0xaa

    invoke-static {v6, v5, v4}, Landroid/graphics/Color;->rgb(III)I

    move-result v4

    .line 459
    invoke-static {v0, v1, v3, v4}, Lcom/trueaxis/modmenu/ModMenu;->label(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v1

    .line 462
    invoke-static {v0, v2}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v2

    const/4 v3, 0x0

    invoke-virtual {v1, v3, v3, v3, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 463
    invoke-virtual {v13, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 465
    new-instance v15, Landroid/widget/LinearLayout;

    invoke-direct {v15, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 466
    invoke-virtual {v15, v7}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 467
    const/16 v8, 0xc

    invoke-static {v0, v8}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {v15, v1, v2, v2, v2}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 469
    const-string v3, "Enable checkpoint/sector deltas vs saved replay ghost"

    const-string v4, "checkpoint_splits"

    new-instance v6, Lcom/trueaxis/modmenu/ModMenu$4;

    invoke-direct {v6, v0, v15}, Lcom/trueaxis/modmenu/ModMenu$4;-><init>(Landroid/app/Activity;Landroid/widget/LinearLayout;)V

    const/4 v5, 0x1

    move-object/from16 v1, p0

    move-object v2, v13

    const/16 v8, 0xb

    const/16 v11, 0xd2

    invoke-static/range {v1 .. v6}, Lcom/trueaxis/modmenu/ModMenu;->addCheckBox(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/Runnable;)Landroid/widget/CheckBox;

    .line 477
    const-string v1, "Show consecutive splits as an on-screen list"

    const-string v2, "split_list"

    invoke-static {v0, v15, v1, v2, v7}, Lcom/trueaxis/modmenu/ModMenu;->addCheckBox(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Z)Landroid/widget/CheckBox;

    .line 480
    const-string v1, "Use sector deltas instead of checkpoint deltas"

    const-string v2, "split_sector_delta"

    const/4 v3, 0x0

    invoke-static {v0, v15, v1, v2, v3}, Lcom/trueaxis/modmenu/ModMenu;->addCheckBox(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Z)Landroid/widget/CheckBox;

    .line 484
    const-string v1, "Display"

    const/16 v2, 0xde

    const/16 v3, 0xd8

    invoke-static {v11, v3, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v2

    invoke-static {v0, v1, v8, v2}, Lcom/trueaxis/modmenu/ModMenu;->label(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v1

    .line 485
    const/4 v2, 0x6

    invoke-static {v0, v2}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v2

    const/4 v3, 0x0

    invoke-virtual {v1, v3, v2, v3, v3}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 486
    invoke-static {}, Lcom/trueaxis/modmenu/ModMenu;->fill()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v2

    invoke-virtual {v15, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 487
    const-string v3, "Text transparency"

    const-string v4, "split_alpha"

    const-string v8, "%"

    const/16 v5, 0x5a

    const/16 v6, 0xa

    const/16 v7, 0x64

    move-object/from16 v1, p0

    move-object v2, v15

    const/4 v11, -0x2

    invoke-static/range {v1 .. v8}, Lcom/trueaxis/modmenu/ModMenu;->addSeek(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;IIILjava/lang/String;)Landroid/widget/LinearLayout;

    .line 489
    const-string v3, "Horizontal position"

    const-string v4, "split_x"

    const-string v8, " dp"

    const/16 v5, 0x58

    const/4 v6, 0x0

    const/16 v7, 0x168

    move-object/from16 v1, p0

    move-object v2, v15

    invoke-static/range {v1 .. v8}, Lcom/trueaxis/modmenu/ModMenu;->addSeek(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;IIILjava/lang/String;)Landroid/widget/LinearLayout;

    .line 491
    const-string v3, "Vertical position"

    const-string v4, "split_y"

    const-string v8, " dp"

    const/16 v5, 0x27

    const/4 v6, 0x0

    const/16 v7, 0xb4

    move-object/from16 v1, p0

    move-object v2, v15

    invoke-static/range {v1 .. v8}, Lcom/trueaxis/modmenu/ModMenu;->addSeek(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;IIILjava/lang/String;)Landroid/widget/LinearLayout;

    .line 494
    invoke-static {v0, v15}, Lcom/trueaxis/modmenu/ModMenu;->updateSplitOptionsVisibility(Landroid/content/Context;Landroid/view/View;)V

    .line 495
    invoke-static {}, Lcom/trueaxis/modmenu/ModMenu;->fill()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v1

    invoke-virtual {v13, v15, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 497
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v1, v14, v11}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v12, v13, v1}, Landroid/widget/ScrollView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 500
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v3, 0x0

    invoke-direct {v1, v14, v3, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v10, v12, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 503
    const-string v1, "Start game"

    invoke-static {v0, v1}, Lcom/trueaxis/modmenu/ModMenu;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v1

    .line 504
    const/high16 v2, 0x41600000    # 14.0f

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setTextSize(F)V

    .line 505
    const/high16 v2, -0x1000000

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setTextColor(I)V

    .line 506
    const/16 v2, 0x80

    const/16 v3, 0xff

    const/4 v4, 0x0

    invoke-static {v3, v2, v4}, Landroid/graphics/Color;->rgb(III)I

    move-result v2

    const/16 v3, 0x8

    invoke-static {v0, v3}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v3

    int-to-float v3, v3

    invoke-static {v2, v3}, Lcom/trueaxis/modmenu/ModMenu;->background(IF)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 507
    const/16 v2, 0x10

    invoke-static {v0, v2}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v3

    const/16 v4, 0xc

    invoke-static {v0, v4}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v5

    invoke-static {v0, v2}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v2

    invoke-static {v0, v4}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v6

    invoke-virtual {v1, v3, v5, v2, v6}, Landroid/widget/Button;->setPadding(IIII)V

    .line 508
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v2, v14, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 510
    const/16 v3, 0xc

    invoke-static {v0, v3}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v3

    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 511
    new-instance v3, Lcom/trueaxis/modmenu/ModMenu$5;
    :try_end_2db
    .catchall {:try_start_27 .. :try_end_2db} :catchall_2ec

    move-object/from16 v4, p1

    :try_start_2dd
    invoke-direct {v3, v4}, Lcom/trueaxis/modmenu/ModMenu$5;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v1, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 517
    invoke-virtual {v10, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 519
    invoke-virtual {v0, v10}, Landroid/app/Activity;->setContentView(Landroid/view/View;)V
    :try_end_2e9
    .catchall {:try_start_2dd .. :try_end_2e9} :catchall_2ea

    .line 524
    goto :goto_2fe

    .line 520
    :catchall_2ea
    move-exception v0

    goto :goto_2ef

    :catchall_2ec
    move-exception v0

    move-object/from16 v4, p1

    .line 521
    :goto_2ef
    const-string v1, "YCS2Mod"

    const-string v2, "Could not show pre-launch mod menu"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 522
    const-string v1, "Could not show pre-launch mod menu; falling back to game"

    invoke-static {v9, v1, v0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 523
    invoke-interface/range {p1 .. p1}, Ljava/lang/Runnable;->run()V

    .line 525
    :goto_2fe
    return-void
.end method

.method public static splitAlphaPercent(Landroid/content/Context;)I
    .registers 3

    .line 300
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->applyMenuDefaults(Landroid/content/Context;)V

    .line 301
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "split_alpha"

    const/16 v1, 0x5a

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    const/16 v0, 0xa

    const/16 v1, 0x64

    invoke-static {p0, v0, v1}, Lcom/trueaxis/modmenu/ModMenu;->clamp(III)I

    move-result p0

    return p0
.end method

.method public static splitListEnabled(Landroid/content/Context;)Z
    .registers 3

    .line 290
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->applyMenuDefaults(Landroid/content/Context;)V

    .line 291
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "split_list"

    const/4 v1, 0x1

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method public static splitXdp(Landroid/content/Context;)I
    .registers 3

    .line 305
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->applyMenuDefaults(Landroid/content/Context;)V

    .line 306
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "split_x"

    const/16 v1, 0x58

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    const/4 v0, 0x0

    const/16 v1, 0x168

    invoke-static {p0, v0, v1}, Lcom/trueaxis/modmenu/ModMenu;->clamp(III)I

    move-result p0

    return p0
.end method

.method public static splitYdp(Landroid/content/Context;)I
    .registers 3

    .line 310
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->applyMenuDefaults(Landroid/content/Context;)V

    .line 311
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "split_y"

    const/16 v1, 0x27

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    const/4 v0, 0x0

    const/16 v1, 0xb4

    invoke-static {p0, v0, v1}, Lcom/trueaxis/modmenu/ModMenu;->clamp(III)I

    move-result p0

    return p0
.end method

.method public static textureSize()I
    .registers 1

    .line 177
    const/16 v0, 0x200

    return v0
.end method

.method private static toast(Landroid/content/Context;Ljava/lang/String;)V
    .registers 3

    .line 240
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 241
    return-void
.end method

.method private static updateSeekLabel(Landroid/widget/TextView;Ljava/lang/String;ILjava/lang/String;)V
    .registers 5

    .line 622
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, ": "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 623
    return-void
.end method

.method private static updateSplitOptionsVisibility(Landroid/content/Context;Landroid/view/View;)V
    .registers 4

    .line 585
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->applyMenuDefaults(Landroid/content/Context;)V

    .line 586
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "checkpoint_splits"

    const/4 v1, 0x1

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    if-eqz p0, :cond_12

    .line 587
    const/4 p0, 0x0

    goto :goto_14

    :cond_12
    const/16 p0, 0x8

    .line 586
    :goto_14
    invoke-virtual {p1, p0}, Landroid/view/View;->setVisibility(I)V

    .line 588
    return-void
.end method

.method public static validateCustomLiveriesForGame(Landroid/content/Context;)V
    .registers 4

    .line 323
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModDebugLog;->install(Landroid/content/Context;)V

    .line 324
    const/4 v0, 0x0

    :goto_4
    sget-object v1, Lcom/trueaxis/modmenu/ModMenu;->CAR_TEXTURES:[Ljava/lang/String;

    array-length v1, v1

    if-ge v0, v1, :cond_20

    .line 325
    invoke-static {p0, v0}, Lcom/trueaxis/modmenu/ModMenu;->customTexture(Landroid/content/Context;I)Ljava/io/File;

    move-result-object v1

    const-string v2, "internal"

    invoke-static {v1, v0, v2}, Lcom/trueaxis/modmenu/ModMenu;->validateCustomLiveryFile(Ljava/io/File;ILjava/lang/String;)V

    .line 326
    invoke-static {p0, v0}, Lcom/trueaxis/modmenu/ModMenu;->externalTexture(Landroid/content/Context;I)Ljava/io/File;

    move-result-object v1

    .line 327
    if-eqz v1, :cond_1d

    const-string v2, "external"

    invoke-static {v1, v0, v2}, Lcom/trueaxis/modmenu/ModMenu;->validateCustomLiveryFile(Ljava/io/File;ILjava/lang/String;)V

    .line 324
    :cond_1d
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 329
    :cond_20
    return-void
.end method

.method private static validateCustomLiveryFile(Ljava/io/File;ILjava/lang/String;)V
    .registers 10

    .line 332
    const-string v0, " path="

    const-string v1, " car="

    const-string v2, "livery"

    if-eqz p0, :cond_c6

    invoke-virtual {p0}, Ljava/io/File;->isFile()Z

    move-result v3

    if-nez v3, :cond_10

    goto/16 :goto_c6

    .line 334
    :cond_10
    :try_start_10
    new-instance v3, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v3}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 335
    const/4 v4, 0x1

    iput-boolean v4, v3, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 336
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5, v3}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 337
    iget v5, v3, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    const/16 v6, 0x200

    if-ne v5, v6, :cond_2a

    iget v5, v3, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    if-ne v5, v6, :cond_2a

    goto :goto_2b

    :cond_2a
    const/4 v4, 0x0

    .line 338
    :goto_2b
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "validate "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 339
    invoke-static {p1}, Lcom/trueaxis/modmenu/ModMenu;->carName(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 340
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " size="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, v3, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "x"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v3, v3, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, " bytes="

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 342
    invoke-virtual {p0}, Ljava/io/File;->length()J

    move-result-wide v5

    invoke-virtual {v3, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, " valid="

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 338
    invoke-static {v2, v3}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 344
    if-nez v4, :cond_90

    const-string v3, "invalid-size-or-decode"

    invoke-static {p0, p1, p2, v3}, Lcom/trueaxis/modmenu/ModMenu;->quarantineLivery(Ljava/io/File;ILjava/lang/String;Ljava/lang/String;)V
    :try_end_90
    .catchall {:try_start_10 .. :try_end_90} :catchall_91

    .line 349
    :cond_90
    goto :goto_c5

    .line 345
    :catchall_91
    move-exception v3

    .line 346
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "validate failed "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 347
    invoke-static {p1}, Lcom/trueaxis/modmenu/ModMenu;->carName(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 346
    invoke-static {v2, v0, v3}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 348
    const-string v0, "exception"

    invoke-static {p0, p1, p2, v0}, Lcom/trueaxis/modmenu/ModMenu;->quarantineLivery(Ljava/io/File;ILjava/lang/String;Ljava/lang/String;)V

    .line 350
    :goto_c5
    return-void

    .line 332
    :cond_c6
    :goto_c6
    return-void
.end method

.method private static writeLivery(Ljava/io/File;Landroid/graphics/Bitmap;)V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 850
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "write livery target="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " bitmap="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 851
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "x"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 850
    const-string v1, "livery"

    invoke-static {v1, v0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 852
    invoke-virtual {p0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    .line 853
    if-eqz v0, :cond_ef

    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v2

    if-nez v2, :cond_4a

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v0

    if-eqz v0, :cond_ef

    .line 856
    :cond_4a
    new-instance v0, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".tmp"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 857
    nop

    .line 859
    const/4 v2, 0x0

    :try_start_68
    new-instance v3, Ljava/io/FileOutputStream;

    invoke-direct {v3, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_6d
    .catchall {:try_start_68 .. :try_end_6d} :catchall_e1

    .line 860
    :try_start_6d
    sget-object v4, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v5, 0x64

    invoke-virtual {p1, v4, v5, v3}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    move-result p1

    if-eqz p1, :cond_d6

    .line 863
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->flush()V

    .line 864
    invoke-static {v3}, Lcom/trueaxis/modmenu/ModMenu;->closeQuietly(Ljava/io/Closeable;)V
    :try_end_7d
    .catchall {:try_start_6d .. :try_end_7d} :catchall_de

    .line 865
    nop

    .line 866
    :try_start_7e
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result p1

    if-eqz p1, :cond_93

    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    move-result p1

    if-eqz p1, :cond_8b

    goto :goto_93

    .line 867
    :cond_8b
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Could not replace old livery"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 869
    :cond_93
    :goto_93
    invoke-virtual {v0, p0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result p1

    if-eqz p1, :cond_ce

    .line 870
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "write livery complete target="

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v3, " bytes="

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 871
    invoke-virtual {p0}, Ljava/io/File;->length()J

    move-result-wide v3

    invoke-virtual {p1, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 870
    invoke-static {v1, p0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_c1
    .catchall {:try_start_7e .. :try_end_c1} :catchall_e1

    .line 873
    invoke-static {v2}, Lcom/trueaxis/modmenu/ModMenu;->closeQuietly(Ljava/io/Closeable;)V

    .line 874
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result p0

    if-eqz p0, :cond_cd

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 876
    :cond_cd
    return-void

    .line 869
    :cond_ce
    :try_start_ce
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Could not save livery"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_d6
    .catchall {:try_start_ce .. :try_end_d6} :catchall_e1

    .line 861
    :cond_d6
    :try_start_d6
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Could not encode PNG"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_de
    .catchall {:try_start_d6 .. :try_end_de} :catchall_de

    .line 873
    :catchall_de
    move-exception p0

    move-object v2, v3

    goto :goto_e2

    :catchall_e1
    move-exception p0

    :goto_e2
    invoke-static {v2}, Lcom/trueaxis/modmenu/ModMenu;->closeQuietly(Ljava/io/Closeable;)V

    .line 874
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result p1

    if-eqz p1, :cond_ee

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 875
    :cond_ee
    throw p0

    .line 854
    :cond_ef
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Could not create livery folder"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static ycs2PrefixEnabled(Landroid/content/Context;)Z
    .registers 1

    .line 315
    const/4 p0, 0x0

    return p0
.end method
