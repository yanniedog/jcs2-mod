.class public Lcom/trueaxis/modmenu/ModMenu;
.super Ljava/lang/Object;
.source "ModMenu.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;,
        Lcom/trueaxis/modmenu/ModMenu$SolanaDonateIconDrawable;,
        Lcom/trueaxis/modmenu/ModMenu$DiscordIconDrawable;,
        Lcom/trueaxis/modmenu/ModMenu$DisplayIconDrawable;,
        Lcom/trueaxis/modmenu/ModMenu$BugIconDrawable;,
        Lcom/trueaxis/modmenu/ModMenu$LinkIconDrawable;
    }
.end annotation


# static fields
.field private static final CAR_NAMES:[Ljava/lang/String;

.field private static final CAR_TEXTURES:[Ljava/lang/String;

.field private static final DEFAULT_CAMERA_CYCLE_SECONDS:I = 0xa

.field private static final DEFAULT_ORBIT_HEIGHT:I = 0x2a

.field private static final DEFAULT_ORBIT_RADIUS:I = 0x8

.field private static final DEFAULT_ORBIT_SPEED:I = 0x48

.field private static final DEFAULT_SPLIT_ALPHA:I = 0x5a

.field private static final DEFAULT_SPLIT_X:I = 0x58

.field private static final DEFAULT_SPLIT_Y:I = 0x27

.field private static final DEFAULT_TRACKSIDE_HEIGHT:I = 0x7

.field private static final DEFAULT_TRACKSIDE_MAX_DIST:I = 0x37

.field private static final DEFAULT_TRACKSIDE_MIN_DIST:I = 0x23

.field private static final DEFAULT_TRACKSIDE_SIDE_DIST:I = 0xb

.field private static final DISCORD_URL:Ljava/lang/String; = "https://discord.gg/stBdE2Tfs2"

.field private static final DISPLAY_NAME:Ljava/lang/String; = "JCS2 Community Mod"

.field private static final DONATE_SOLANA_ADDRESS:Ljava/lang/String; = "F6mjNXKBKzjmKTK1Z9cWabFHZYtxMg8rojuNuppX2EG1"

.field private static final K_CAMERA_CYCLE:Ljava/lang/String; = "camera_cycle"

.field private static final K_CAMERA_CYCLE_SECONDS:Ljava/lang/String; = "camera_cycle_seconds"

.field private static final K_CAR:Ljava/lang/String; = "livery_car"

.field private static final K_CHECKPOINT_SPLITS:Ljava/lang/String; = "checkpoint_splits"

.field private static final K_MENU_DEFAULTS_VERSION:Ljava/lang/String; = "menu_defaults_version"

.field private static final K_ORBIT_HEIGHT:Ljava/lang/String; = "orbit_height"

.field private static final K_ORBIT_RADIUS:Ljava/lang/String; = "orbit_radius"

.field private static final K_ORBIT_SPEED:Ljava/lang/String; = "orbit_speed"

.field private static final K_RACE_SWARM:Ljava/lang/String; = "race_ghost_swarm"

.field private static final K_REPLAY_CAMERA_MODE:Ljava/lang/String; = "replay_camera_mode"

.field private static final K_REPLAY_FREE_CAMERA:Ljava/lang/String; = "replay_free_camera"

.field private static final K_REPLAY_SWARM:Ljava/lang/String; = "replay_swarm"

.field private static final K_SPLIT_ALPHA:Ljava/lang/String; = "split_alpha"

.field private static final K_SPLIT_LIST:Ljava/lang/String; = "split_list"

.field private static final K_SPLIT_SECTOR_DELTA:Ljava/lang/String; = "split_sector_delta"

.field private static final K_SPLIT_X:Ljava/lang/String; = "split_x"

.field private static final K_SPLIT_Y:Ljava/lang/String; = "split_y"

.field private static final K_SWARM_CATALOG:Ljava/lang/String; = "swarm_catalog_paths"

.field private static final K_TRACKSIDE_HEIGHT:Ljava/lang/String; = "trackside_height"

.field private static final K_TRACKSIDE_MAX_DIST:Ljava/lang/String; = "trackside_max_dist"

.field private static final K_TRACKSIDE_MIN_DIST:Ljava/lang/String; = "trackside_min_dist"

.field private static final K_TRACKSIDE_SIDE_DIST:Ljava/lang/String; = "trackside_side_dist"

.field private static final K_TRACKSIDE_SIDE_MODE:Ljava/lang/String; = "trackside_side_mode"

.field private static final MENU_DEFAULTS_VERSION:I = 0x5

.field private static final PREFS:Ljava/lang/String; = "jcs_mod"

.field private static final REPLAY_CAMERA_MODE_FIRST:I = 0x1

.field private static final REPLAY_CAMERA_MODE_NAMES:[Ljava/lang/String;

.field private static final REPO_URL:Ljava/lang/String; = "https://github.com/yanniedog/jcs2-mod"

.field private static final REQUEST_EXPORT:I = 0x1c86

.field private static final REQUEST_IMPORT:I = 0x1c85

.field private static final SWARM_CATALOG_MAX:I = 0x20

.field private static final TEXTURE_SIZE:I = 0x200

.field private static final TRACKSIDE_SIDE_NAMES:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 10

    .line 65
    const/4 v0, 0x4

    new-array v1, v0, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Orbit"

    aput-object v3, v1, v2

    const/4 v3, 0x1

    const-string v4, "Helicopter (track-locked)"

    aput-object v4, v1, v3

    const/4 v4, 0x2

    const-string v5, "GoPro (car-locked)"

    aput-object v5, v1, v4

    const/4 v5, 0x3

    const-string v6, "Trackside (static cameras)"

    aput-object v6, v1, v5

    sput-object v1, Lcom/trueaxis/modmenu/ModMenu;->REPLAY_CAMERA_MODE_NAMES:[Ljava/lang/String;

    .line 79
    new-array v1, v5, [Ljava/lang/String;

    const-string v6, "Alternate sides"

    aput-object v6, v1, v2

    const-string v6, "Left side only"

    aput-object v6, v1, v3

    const-string v6, "Right side only"

    aput-object v6, v1, v4

    sput-object v1, Lcom/trueaxis/modmenu/ModMenu;->TRACKSIDE_SIDE_NAMES:[Ljava/lang/String;

    .line 108
    const/4 v1, 0x7

    new-array v6, v1, [Ljava/lang/String;

    const-string v7, "Buggy"

    aput-object v7, v6, v2

    const-string v7, "Original jetcar"

    aput-object v7, v6, v3

    const-string v7, "Jet"

    aput-object v7, v6, v4

    const-string v7, "Mini"

    aput-object v7, v6, v5

    const-string v7, "Sports"

    aput-object v7, v6, v0

    const/4 v7, 0x5

    const-string v8, "Stock"

    aput-object v8, v6, v7

    const/4 v8, 0x6

    const-string v9, "Truck"

    aput-object v9, v6, v8

    sput-object v6, Lcom/trueaxis/modmenu/ModMenu;->CAR_NAMES:[Ljava/lang/String;

    .line 111
    new-array v1, v1, [Ljava/lang/String;

    const-string v6, "cars/buggy/buggy1.png"

    aput-object v6, v1, v2

    const-string v2, "cars/original/rocketcar1.png"

    aput-object v2, v1, v3

    const-string v2, "cars/jet/jet1.png"

    aput-object v2, v1, v4

    const-string v2, "cars/mini/mini1.png"

    aput-object v2, v1, v5

    const-string v2, "cars/sports/sportscar1.png"

    aput-object v2, v1, v0

    const-string v0, "cars/stock/stock1.png"

    aput-object v0, v1, v7

    const-string v0, "cars/truck/truck1.png"

    aput-object v0, v1, v8

    sput-object v1, Lcom/trueaxis/modmenu/ModMenu;->CAR_TEXTURES:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Landroid/app/Activity;)V
    .registers 1

    .line 53
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->showDonateDialog(Landroid/app/Activity;)V

    return-void
.end method

.method static synthetic access$100()[Ljava/lang/String;
    .registers 1

    .line 53
    sget-object v0, Lcom/trueaxis/modmenu/ModMenu;->REPLAY_CAMERA_MODE_NAMES:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200(Landroid/content/Context;Landroid/view/View;Landroid/view/View;Landroid/view/View;)V
    .registers 4

    .line 53
    invoke-static {p0, p1, p2, p3}, Lcom/trueaxis/modmenu/ModMenu;->updateSplitOptionsVisibility(Landroid/content/Context;Landroid/view/View;Landroid/view/View;Landroid/view/View;)V

    return-void
.end method

.method static synthetic access$300(Landroid/widget/TextView;Ljava/lang/String;ILjava/lang/String;)V
    .registers 4

    .line 53
    invoke-static {p0, p1, p2, p3}, Lcom/trueaxis/modmenu/ModMenu;->updateSeekLabel(Landroid/widget/TextView;Ljava/lang/String;ILjava/lang/String;)V

    return-void
.end method

.method static synthetic access$400(Landroid/content/Context;Landroid/widget/Spinner;)V
    .registers 2

    .line 53
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/ModMenu;->rememberCar(Landroid/content/Context;Landroid/widget/Spinner;)V

    return-void
.end method

.method static synthetic access$500(Landroid/content/Context;Ljava/lang/String;)V
    .registers 2

    .line 53
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/ModMenu;->toast(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$600(Landroid/content/Context;I)Ljava/io/File;
    .registers 2

    .line 53
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/ModMenu;->customTexture(Landroid/content/Context;I)Ljava/io/File;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$700(Landroid/content/Context;)I
    .registers 1

    .line 53
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->selectedCar(Landroid/content/Context;)I

    move-result p0

    return p0
.end method

.method static synthetic access$800()[Ljava/lang/String;
    .registers 1

    .line 53
    sget-object v0, Lcom/trueaxis/modmenu/ModMenu;->CAR_NAMES:[Ljava/lang/String;

    return-object v0
.end method

.method private static addButtonRow(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;Landroid/widget/Button;)V
    .registers 9

    .line 219
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 220
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 221
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x2

    const/high16 v4, 0x3f800000

    invoke-direct {v2, v1, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 223
    const/4 v3, 0x2

    invoke-static {p0, v3}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-static {p0, v3}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result p0

    invoke-virtual {v2, v1, v4, v1, p0}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 224
    if-eqz p2, :cond_22

    .line 225
    invoke-virtual {v0, p2, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 227
    :cond_22
    if-eqz p3, :cond_27

    .line 228
    invoke-virtual {v0, p3, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 230
    :cond_27
    invoke-static {}, Lcom/trueaxis/modmenu/ModMenu;->fill()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object p0

    invoke-virtual {p1, v0, p0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 231
    return-void
.end method

.method private static addCheckBox(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Z)Landroid/widget/CheckBox;
    .registers 11

    .line 1105
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

    .line 1111
    new-instance v0, Landroid/widget/CheckBox;

    invoke-direct {v0, p0}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    .line 1112
    invoke-virtual {v0, p2}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    .line 1113
    const/4 p2, -0x1

    invoke-virtual {v0, p2}, Landroid/widget/CheckBox;->setTextColor(I)V

    .line 1114
    const/high16 p2, 0x41300000

    invoke-virtual {v0, p2}, Landroid/widget/CheckBox;->setTextSize(F)V

    .line 1115
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p2

    invoke-interface {p2, p3, p4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p2

    invoke-virtual {v0, p2}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 1116
    const/4 p2, 0x2

    invoke-static {p0, p2}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result p2

    const/4 p4, 0x0

    invoke-virtual {v0, p4, p2, p4, p4}, Landroid/widget/CheckBox;->setPadding(IIII)V

    .line 1117
    new-instance p2, Lcom/trueaxis/modmenu/ModMenu$19;

    invoke-direct {p2, p0, p3, v0, p5}, Lcom/trueaxis/modmenu/ModMenu$19;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/widget/CheckBox;Ljava/lang/Runnable;)V

    invoke-virtual {v0, p2}, Landroid/widget/CheckBox;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1127
    invoke-static {}, Lcom/trueaxis/modmenu/ModMenu;->fill()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object p0

    invoke-virtual {p1, v0, p0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1128
    return-object v0
.end method

.method private static addSeek(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;IIILjava/lang/String;)Landroid/widget/LinearLayout;
    .registers 17

    .line 1147
    const/4 v8, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    move-object/from16 v7, p7

    invoke-static/range {v0 .. v8}, Lcom/trueaxis/modmenu/ModMenu;->addSeek(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;IIILjava/lang/String;Ljava/lang/Runnable;)Landroid/widget/LinearLayout;

    move-result-object v0

    return-object v0
.end method

.method private static addSeek(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;IIILjava/lang/String;Ljava/lang/Runnable;)Landroid/widget/LinearLayout;
    .registers 22

    .line 1154
    move-object v8, p0

    move/from16 v1, p5

    move/from16 v0, p6

    new-instance v9, Landroid/widget/LinearLayout;

    invoke-direct {v9, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 1155
    const/4 v2, 0x1

    invoke-virtual {v9, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 1156
    const/16 v2, 0xd8

    const/16 v3, 0xde

    const/16 v4, 0xd2

    invoke-static {v4, v2, v3}, Landroid/graphics/Color;->rgb(III)I

    move-result v2

    const-string v3, ""

    const/16 v4, 0xa

    invoke-static {p0, v3, v4, v2}, Lcom/trueaxis/modmenu/ModMenu;->label(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v10

    .line 1157
    new-instance v11, Landroid/widget/SeekBar;

    invoke-direct {v11, p0}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;)V

    .line 1158
    sub-int v2, v0, v1

    invoke-virtual {v11, v2}, Landroid/widget/SeekBar;->setMax(I)V

    .line 1159
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    move-object/from16 v3, p3

    move/from16 v4, p4

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    invoke-static {v2, v1, v0}, Lcom/trueaxis/modmenu/ModMenu;->clamp(III)I

    move-result v0

    sub-int/2addr v0, v1

    invoke-virtual {v11, v0}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 1160
    invoke-virtual {v11}, Landroid/widget/SeekBar;->getProgress()I

    move-result v0

    add-int/2addr v0, v1

    move-object v5, p2

    move-object/from16 v6, p7

    invoke-static {v10, p2, v0, v6}, Lcom/trueaxis/modmenu/ModMenu;->updateSeekLabel(Landroid/widget/TextView;Ljava/lang/String;ILjava/lang/String;)V

    .line 1161
    new-instance v12, Lcom/trueaxis/modmenu/ModMenu$20;

    move-object v0, v12

    move-object v2, p0

    move-object v4, v10

    move-object/from16 v7, p8

    invoke-direct/range {v0 .. v7}, Lcom/trueaxis/modmenu/ModMenu$20;-><init>(ILandroid/content/Context;Ljava/lang/String;Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V

    invoke-virtual {v11, v12}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 1178
    const/4 v0, 0x4

    invoke-static {p0, v0}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v0

    const/4 v1, 0x0

    invoke-virtual {v10, v1, v0, v1, v1}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 1179
    invoke-static {}, Lcom/trueaxis/modmenu/ModMenu;->fill()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v0

    invoke-virtual {v9, v10, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1180
    invoke-static {}, Lcom/trueaxis/modmenu/ModMenu;->fill()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v0

    invoke-virtual {v9, v11, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1181
    invoke-static {}, Lcom/trueaxis/modmenu/ModMenu;->fill()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v0

    move-object v1, p1

    invoke-virtual {p1, v9, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1182
    return-object v9
.end method

.method private static addSubCard(Landroid/content/Context;Landroid/widget/LinearLayout;Landroid/widget/LinearLayout;)V
    .registers 5

    .line 330
    invoke-static {}, Lcom/trueaxis/modmenu/ModMenu;->fill()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v0

    .line 331
    const/16 v1, 0x8

    invoke-static {p0, v1}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result p0

    iput p0, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 332
    invoke-virtual {p1, p2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 333
    return-void
.end method

.method private static applyMenuDefaults(Landroid/content/Context;)V
    .registers 7

    .line 448
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 449
    const-string v0, "menu_defaults_version"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    const/4 v3, 0x5

    if-lt v2, v3, :cond_f

    .line 450
    return-void

    .line 452
    :cond_f
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    .line 453
    const-string v4, "checkpoint_splits"

    const/4 v5, 0x1

    invoke-interface {v2, v4, v5}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    .line 454
    const-string v4, "split_list"

    invoke-interface {v2, v4, v5}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    .line 455
    const-string v4, "split_sector_delta"

    invoke-interface {v2, v4, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 456
    const-string v2, "replay_free_camera"

    invoke-interface {v1, v2, v5}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 457
    const-string v2, "split_realtime"

    invoke-interface {v1, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 458
    const-string v2, "ghost_route"

    invoke-interface {v1, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 459
    const-string v2, "ghost_route_alpha"

    invoke-interface {v1, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 460
    const-string v2, "ghost_route_thickness"

    invoke-interface {v1, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 461
    const-string v2, "ycs2_prefix"

    invoke-interface {v1, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 462
    const-string v2, "experimental_visible"

    invoke-interface {v1, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 463
    const-string v2, "experimental_ack"

    invoke-interface {v1, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 464
    invoke-interface {v1, v0, v3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 465
    const-string v1, "split_alpha"

    invoke-interface {p0, v1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_67

    .line 466
    const/16 v2, 0x5a

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 468
    :cond_67
    const-string v1, "split_x"

    invoke-interface {p0, v1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_74

    .line 469
    const/16 v2, 0x58

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 471
    :cond_74
    const-string v1, "split_y"

    invoke-interface {p0, v1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_81

    .line 472
    const/16 p0, 0x27

    invoke-interface {v0, v1, p0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 474
    :cond_81
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 475
    return-void
.end method

.method private static background(IF)Landroid/graphics/drawable/GradientDrawable;
    .registers 3

    .line 126
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 127
    invoke-virtual {v0, p0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 128
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 129
    return-object v0
.end method

.method private static buildDateUtc(Landroid/content/Context;)Ljava/lang/String;
    .registers 4

    .line 1090
    const-string v0, ""

    .line 1092
    const/4 v1, 0x0

    :try_start_3
    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object p0

    const-string v2, "ycs2-build-info.properties"

    invoke-virtual {p0, v2}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1

    .line 1093
    new-instance p0, Ljava/util/Properties;

    invoke-direct {p0}, Ljava/util/Properties;-><init>()V

    .line 1094
    invoke-virtual {p0, v1}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V

    .line 1095
    const-string v2, "build_date_utc"

    invoke-virtual {p0, v2, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0
    :try_end_1f
    .catchall {:try_start_3 .. :try_end_1f} :catchall_23

    .line 1099
    invoke-static {v1}, Lcom/trueaxis/modmenu/ModMenu;->closeQuietly(Ljava/io/Closeable;)V

    .line 1095
    return-object p0

    .line 1096
    :catchall_23
    move-exception p0

    .line 1097
    nop

    .line 1099
    invoke-static {v1}, Lcom/trueaxis/modmenu/ModMenu;->closeQuietly(Ljava/io/Closeable;)V

    .line 1097
    return-object v0
.end method

.method private static buildSummary(Landroid/content/Context;)Ljava/lang/String;
    .registers 4

    .line 1076
    nop

    .line 1077
    :try_start_1
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    .line 1078
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

    .line 1079
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->buildDateUtc(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    .line 1080
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_50

    .line 1081
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

    .line 1083
    :cond_50
    return-object v0

    .line 1084
    :catchall_51
    move-exception p0

    .line 1085
    const-string p0, "Version unknown"

    return-object p0
.end method

.method private static button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;
    .registers 6

    .line 141
    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 142
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 143
    const/high16 p1, 0x41300000

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setTextSize(F)V

    .line 144
    const/4 p1, 0x0

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setAllCaps(Z)V

    .line 145
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinHeight(I)V

    .line 146
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinimumHeight(I)V

    .line 147
    const/4 p1, -0x1

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setTextColor(I)V

    .line 148
    const/16 p1, 0x38

    const/16 v1, 0x44

    const/16 v2, 0x30

    invoke-static {v2, p1, v1}, Landroid/graphics/Color;->rgb(III)I

    move-result p1

    const/16 v1, 0xa

    invoke-static {p0, v1}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v1

    int-to-float v1, v1

    invoke-static {p1, v1}, Lcom/trueaxis/modmenu/ModMenu;->background(IF)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 149
    const/16 p1, 0xc

    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v1

    const/16 v2, 0x8

    invoke-static {p0, v2}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v3

    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result p1

    invoke-static {p0, v2}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result p0

    invoke-virtual {v0, v1, v3, p1, p0}, Landroid/widget/Button;->setPadding(IIII)V

    .line 150
    return-object v0
.end method

.method public static cameraCycleEnabled(Landroid/content/Context;)Z
    .registers 3

    .line 558
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "camera_cycle"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method public static cameraCycleSeconds(Landroid/content/Context;)I
    .registers 3

    .line 562
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "camera_cycle_seconds"

    const/16 v1, 0xa

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    const/4 v0, 0x3

    const/16 v1, 0x3c

    invoke-static {p0, v0, v1}, Lcom/trueaxis/modmenu/ModMenu;->clamp(III)I

    move-result p0

    return p0
.end method

.method public static carAssetPath(I)Ljava/lang/String;
    .registers 2

    .line 361
    sget-object v0, Lcom/trueaxis/modmenu/ModMenu;->CAR_TEXTURES:[Ljava/lang/String;

    aget-object p0, v0, p0

    return-object p0
.end method

.method public static carCount()I
    .registers 1

    .line 353
    sget-object v0, Lcom/trueaxis/modmenu/ModMenu;->CAR_NAMES:[Ljava/lang/String;

    array-length v0, v0

    return v0
.end method

.method public static carCustomFile(Landroid/content/Context;I)Ljava/io/File;
    .registers 2

    .line 365
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/ModMenu;->customTexture(Landroid/content/Context;I)Ljava/io/File;

    move-result-object p0

    return-object p0
.end method

.method public static carName(I)Ljava/lang/String;
    .registers 2

    .line 357
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

    .line 478
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->applyMenuDefaults(Landroid/content/Context;)V

    .line 479
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

    .line 619
    invoke-static {p2, p0}, Ljava/lang/Math;->min(II)I

    move-result p0

    invoke-static {p1, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    return p0
.end method

.method private static closeQuietly(Ljava/io/Closeable;)V
    .registers 1

    .line 436
    if-nez p0, :cond_3

    return-void

    .line 438
    :cond_3
    :try_start_3
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_6
    .catchall {:try_start_3 .. :try_end_6} :catchall_7

    .line 440
    goto :goto_8

    .line 439
    :catchall_7
    move-exception p0

    .line 441
    :goto_8
    return-void
.end method

.method private static customTexture(Landroid/content/Context;I)Ljava/io/File;
    .registers 4

    .line 342
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

    .line 1384
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

    .line 1385
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 1386
    const/4 v2, 0x1

    iput-boolean v2, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 1387
    nop

    .line 1389
    const/4 v3, 0x0

    :try_start_22
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    invoke-virtual {v4, p1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v4
    :try_end_2a
    .catchall {:try_start_22 .. :try_end_2a} :catchall_98

    .line 1390
    :try_start_2a
    invoke-static {v4, v3, v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    :try_end_2d
    .catchall {:try_start_2a .. :try_end_2d} :catchall_95

    .line 1392
    invoke-static {v4}, Lcom/trueaxis/modmenu/ModMenu;->closeQuietly(Ljava/io/Closeable;)V

    .line 1393
    nop

    .line 1394
    nop

    .line 1395
    iget v4, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iget v5, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    invoke-static {v4, v5}, Ljava/lang/Math;->max(II)I

    move-result v4

    .line 1396
    :goto_3a
    div-int v5, v4, v2

    const/16 v6, 0x400

    if-le v5, v6, :cond_43

    mul-int/lit8 v2, v2, 0x2

    goto :goto_3a

    .line 1397
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

    .line 1400
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 1401
    iput v2, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 1402
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    iput-object v1, v0, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    .line 1403
    nop

    .line 1405
    :try_start_7d
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object p0
    :try_end_85
    .catchall {:try_start_7d .. :try_end_85} :catchall_90

    .line 1406
    :try_start_85
    invoke-static {p0, v3, v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object p1
    :try_end_89
    .catchall {:try_start_85 .. :try_end_89} :catchall_8d

    .line 1408
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->closeQuietly(Ljava/io/Closeable;)V

    .line 1406
    return-object p1

    .line 1408
    :catchall_8d
    move-exception p1

    move-object v3, p0

    goto :goto_91

    :catchall_90
    move-exception p1

    :goto_91
    invoke-static {v3}, Lcom/trueaxis/modmenu/ModMenu;->closeQuietly(Ljava/io/Closeable;)V

    .line 1409
    throw p1

    .line 1392
    :catchall_95
    move-exception p0

    move-object v3, v4

    goto :goto_99

    :catchall_98
    move-exception p0

    :goto_99
    invoke-static {v3}, Lcom/trueaxis/modmenu/ModMenu;->closeQuietly(Ljava/io/Closeable;)V

    .line 1393
    goto :goto_9e

    :goto_9d
    throw p0

    :goto_9e
    goto :goto_9d
.end method

.method public static deleteCustomLivery(Landroid/content/Context;I)V
    .registers 9

    .line 1487
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModDebugLog;->install(Landroid/content/Context;)V

    .line 1488
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/ModMenu;->customTexture(Landroid/content/Context;I)Ljava/io/File;

    move-result-object v0

    .line 1489
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    const-string v2, " deleted="

    const-string v3, " path="

    const-string v4, "livery"

    if-eqz v1, :cond_45

    .line 1490
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result v1

    .line 1491
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

    .line 1492
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

    .line 1491
    invoke-static {v4, v0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 1494
    :cond_45
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/ModMenu;->externalTexture(Landroid/content/Context;I)Ljava/io/File;

    move-result-object p0

    .line 1495
    if-eqz p0, :cond_83

    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_83

    .line 1496
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    move-result v0

    .line 1497
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

    .line 1498
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

    .line 1497
    invoke-static {v4, p0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 1500
    :cond_83
    return-void
.end method

.method private static dp(Landroid/content/Context;I)I
    .registers 2

    .line 122
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

.method private static exportLivery(Landroid/content/Context;Landroid/net/Uri;I)V
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1459
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

    .line 1460
    nop

    .line 1461
    nop

    .line 1462
    nop

    .line 1464
    const/4 v0, 0x0

    :try_start_2a
    invoke-static {p0, p2}, Lcom/trueaxis/modmenu/ModMenu;->customTexture(Landroid/content/Context;I)Ljava/io/File;

    move-result-object v2

    .line 1465
    invoke-virtual {v2}, Ljava/io/File;->isFile()Z

    move-result v3

    if-eqz v3, :cond_3a

    .line 1466
    new-instance v3, Ljava/io/FileInputStream;

    invoke-direct {v3, v2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    goto :goto_46

    .line 1467
    :cond_3a
    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v3

    sget-object v4, Lcom/trueaxis/modmenu/ModMenu;->CAR_TEXTURES:[Ljava/lang/String;

    aget-object v4, v4, p2

    invoke-virtual {v3, v4}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v3
    :try_end_46
    .catchall {:try_start_2a .. :try_end_46} :catchall_ab

    .line 1468
    :goto_46
    :try_start_46
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/content/ContentResolver;->openOutputStream(Landroid/net/Uri;)Ljava/io/OutputStream;

    move-result-object v0

    .line 1469
    if-eqz v0, :cond_9f

    .line 1470
    const/16 p0, 0x4000

    new-array p0, p0, [B

    const/4 p1, 0x0

    const/4 v4, 0x0

    .line 1472
    :goto_56
    invoke-virtual {v3, p0}, Ljava/io/InputStream;->read([B)I

    move-result v5

    const/4 v6, -0x1

    if-eq v5, v6, :cond_62

    .line 1473
    invoke-virtual {v0, p0, p1, v5}, Ljava/io/OutputStream;->write([BII)V

    .line 1474
    add-int/2addr v4, v5

    goto :goto_56

    .line 1476
    :cond_62
    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 1477
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

    .line 1478
    invoke-virtual {v2}, Ljava/io/File;->isFile()Z

    move-result p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 1477
    invoke-static {v1, p0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_97
    .catchall {:try_start_46 .. :try_end_97} :catchall_a7

    .line 1480
    invoke-static {v3}, Lcom/trueaxis/modmenu/ModMenu;->closeQuietly(Ljava/io/Closeable;)V

    .line 1481
    invoke-static {v0}, Lcom/trueaxis/modmenu/ModMenu;->closeQuietly(Ljava/io/Closeable;)V

    .line 1482
    nop

    .line 1483
    return-void

    .line 1469
    :cond_9f
    :try_start_9f
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Could not open export destination"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_a7
    .catchall {:try_start_9f .. :try_end_a7} :catchall_a7

    .line 1480
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

    .line 1481
    invoke-static {p1}, Lcom/trueaxis/modmenu/ModMenu;->closeQuietly(Ljava/io/Closeable;)V

    .line 1482
    goto :goto_b5

    :goto_b4
    throw p0

    :goto_b5
    goto :goto_b4
.end method

.method private static externalTexture(Landroid/content/Context;I)Ljava/io/File;
    .registers 4

    .line 347
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object p0

    .line 348
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

    .line 336
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    return-object v0
.end method

.method public static handleActivityResult(Landroid/app/Activity;IILandroid/content/Intent;)Z
    .registers 9

    .line 1336
    const/4 v0, 0x0

    const/16 v1, 0x1c85

    if-eq p1, v1, :cond_a

    const/16 v2, 0x1c86

    if-eq p1, v2, :cond_a

    return v0

    .line 1337
    :cond_a
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModDebugLog;->install(Landroid/content/Context;)V

    .line 1338
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

    .line 1341
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

    .line 1338
    const-string v2, "livery"

    invoke-static {v2, v0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 1342
    const/4 v0, -0x1

    if-ne p2, v0, :cond_129

    if-eqz p3, :cond_129

    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p2

    if-nez p2, :cond_61

    goto/16 :goto_129

    .line 1343
    :cond_61
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p2

    .line 1344
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->selectedCar(Landroid/content/Context;)I

    move-result p3

    .line 1346
    const-string v0, " car="

    if-ne p1, v1, :cond_ad

    .line 1347
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

    .line 1348
    invoke-static {p0, p2, p3}, Lcom/trueaxis/modmenu/ModMenu;->importLivery(Landroid/content/Context;Landroid/net/Uri;I)V

    .line 1349
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

    .line 1351
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

    .line 1352
    invoke-static {p0, p2, p3}, Lcom/trueaxis/modmenu/ModMenu;->exportLivery(Landroid/content/Context;Landroid/net/Uri;I)V

    .line 1353
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

    .line 1355
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

    .line 1360
    goto :goto_128

    .line 1356
    :catchall_103
    move-exception p1

    .line 1357
    const-string p2, "YCS2Mod"

    const-string p3, "Livery file operation failed"

    invoke-static {p2, p3, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1358
    invoke-static {v2, p3, p1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1359
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

    .line 1361
    :goto_128
    return v3

    .line 1342
    :cond_129
    :goto_129
    return v3
.end method

.method private static iconLinkButton(Landroid/app/Activity;ILandroid/graphics/drawable/Drawable;Ljava/lang/String;Landroid/view/View$OnClickListener;)Landroid/widget/Button;
    .registers 7

    .line 180
    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 181
    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 182
    invoke-virtual {v0, p3}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 183
    const/16 p3, 0x11

    invoke-virtual {v0, p3}, Landroid/widget/Button;->setGravity(I)V

    .line 184
    const/4 p3, 0x0

    invoke-virtual {v0, p3}, Landroid/widget/Button;->setMinHeight(I)V

    .line 185
    invoke-virtual {v0, p3}, Landroid/widget/Button;->setMinimumHeight(I)V

    .line 186
    invoke-virtual {v0, p3}, Landroid/widget/Button;->setMinWidth(I)V

    .line 187
    invoke-virtual {v0, p3}, Landroid/widget/Button;->setMinimumWidth(I)V

    .line 188
    const/16 v1, 0x9

    invoke-static {p0, v1}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v1

    .line 189
    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/widget/Button;->setPadding(IIII)V

    .line 190
    const/16 v1, 0xa

    invoke-static {p0, v1}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v1

    int-to-float v1, v1

    invoke-static {p1, v1}, Lcom/trueaxis/modmenu/ModMenu;->background(IF)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 191
    const/16 p1, 0x16

    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result p0

    .line 192
    invoke-virtual {p2, p3, p3, p0, p0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 193
    const/4 p0, 0x0

    invoke-virtual {v0, p2, p0, p0, p0}, Landroid/widget/Button;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 194
    invoke-virtual {v0, p4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 195
    return-object v0
.end method

.method private static importLivery(Landroid/content/Context;Landroid/net/Uri;I)V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1365
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

    .line 1366
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/ModMenu;->decodeSampled(Landroid/content/Context;Landroid/net/Uri;)Landroid/graphics/Bitmap;

    move-result-object p1

    .line 1367
    if-eqz p1, :cond_99

    .line 1368
    nop

    .line 1370
    const/4 v0, 0x0

    :try_start_2e
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "import decoded source="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 1371
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

    .line 1370
    invoke-static {v1, v2}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 1372
    const/4 v2, 0x1

    const/16 v3, 0x200

    invoke-static {p1, v3, v3, v2}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 1373
    invoke-static {p0, p2}, Lcom/trueaxis/modmenu/ModMenu;->customTexture(Landroid/content/Context;I)Ljava/io/File;

    move-result-object v2

    invoke-static {v2, v0}, Lcom/trueaxis/modmenu/ModMenu;->writeLivery(Ljava/io/File;Landroid/graphics/Bitmap;)V

    .line 1374
    invoke-static {p0, p2, v0}, Lcom/trueaxis/modmenu/ModMenu;->mirrorExternal(Landroid/content/Context;ILandroid/graphics/Bitmap;)V

    .line 1375
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

    .line 1377
    if-eqz v0, :cond_88

    if-eq v0, p1, :cond_88

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 1378
    :cond_88
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    .line 1379
    nop

    .line 1380
    return-void

    .line 1377
    :catchall_8d
    move-exception p0

    if-eqz v0, :cond_95

    if-eq v0, p1, :cond_95

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 1378
    :cond_95
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    .line 1379
    throw p0

    .line 1367
    :cond_99
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Unsupported image"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static label(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/TextView;
    .registers 5

    .line 133
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 134
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 135
    int-to-float p0, p2

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 136
    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 137
    return-object v0
.end method

.method private static linkButton(Landroid/app/Activity;Ljava/lang/String;ILandroid/graphics/drawable/Drawable;Ljava/lang/String;)Landroid/widget/Button;
    .registers 6

    .line 155
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/ModMenu;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object p1

    .line 156
    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setTextColor(I)V

    .line 157
    const/high16 v0, 0x41400000

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setTextSize(F)V

    .line 158
    const/16 v0, 0x11

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setGravity(I)V

    .line 159
    const/16 v0, 0x8

    invoke-static {p0, v0}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v0

    int-to-float v0, v0

    invoke-static {p2, v0}, Lcom/trueaxis/modmenu/ModMenu;->background(IF)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/Button;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 160
    const/16 p2, 0x12

    invoke-static {p0, p2}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result p2

    .line 161
    const/4 v0, 0x0

    invoke-virtual {p3, v0, v0, p2, p2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 162
    const/4 p2, 0x0

    invoke-virtual {p1, p3, p2, p2, p2}, Landroid/widget/Button;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 163
    const/4 p2, 0x7

    invoke-static {p0, p2}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/widget/Button;->setCompoundDrawablePadding(I)V

    .line 164
    new-instance p2, Lcom/trueaxis/modmenu/ModMenu$1;

    invoke-direct {p2, p4, p0}, Lcom/trueaxis/modmenu/ModMenu$1;-><init>(Ljava/lang/String;Landroid/app/Activity;)V

    invoke-virtual {p1, p2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 175
    return-object p1
.end method

.method public static loadEditableLivery(Landroid/content/Context;I)Landroid/graphics/Bitmap;
    .registers 8

    .line 374
    const-string v0, "livery"

    invoke-static {p0}, Lcom/trueaxis/modmenu/ModDebugLog;->install(Landroid/content/Context;)V

    .line 375
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/ModMenu;->customTexture(Landroid/content/Context;I)Ljava/io/File;

    move-result-object v1

    .line 376
    nop

    .line 378
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

    .line 379
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

    .line 378
    invoke-static {v0, v3}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 381
    invoke-virtual {v1}, Ljava/io/File;->isFile()Z

    move-result v3

    if-eqz v3, :cond_4d

    .line 382
    new-instance p0, Ljava/io/FileInputStream;

    invoke-direct {p0, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    goto :goto_59

    .line 383
    :cond_4d
    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object p0

    sget-object v1, Lcom/trueaxis/modmenu/ModMenu;->CAR_TEXTURES:[Ljava/lang/String;

    aget-object v1, v1, p1

    invoke-virtual {p0, v1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p0
    :try_end_59
    .catchall {:try_start_b .. :try_end_59} :catchall_d3

    .line 384
    :goto_59
    :try_start_59
    new-instance v1, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v1}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 385
    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    iput-object v3, v1, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    .line 386
    invoke-static {p0, v2, v1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 387
    if-nez v1, :cond_87

    .line 388
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

    .line 389
    nop

    .line 401
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->closeQuietly(Ljava/io/Closeable;)V

    .line 389
    return-object v2

    .line 391
    :cond_87
    :try_start_87
    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    const/4 v4, 0x1

    invoke-virtual {v1, v3, v4}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    move-result-object v3

    .line 392
    if-eq v3, v1, :cond_93

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    .line 393
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

    .line 394
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

    .line 393
    invoke-static {v0, v1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_c9
    .catchall {:try_start_87 .. :try_end_c9} :catchall_ce

    .line 395
    nop

    .line 401
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->closeQuietly(Ljava/io/Closeable;)V

    .line 395
    return-object v3

    .line 396
    :catchall_ce
    move-exception v1

    move-object v5, v1

    move-object v1, p0

    move-object p0, v5

    goto :goto_d5

    :catchall_d3
    move-exception p0

    move-object v1, v2

    .line 397
    :goto_d5
    :try_start_d5
    const-string v3, "YCS2Mod"

    const-string v4, "Could not load livery for editing"

    invoke-static {v3, v4, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 398
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

    .line 399
    nop

    .line 401
    invoke-static {v1}, Lcom/trueaxis/modmenu/ModMenu;->closeQuietly(Ljava/io/Closeable;)V

    .line 399
    return-object v2

    .line 401
    :catchall_fb
    move-exception p0

    invoke-static {v1}, Lcom/trueaxis/modmenu/ModMenu;->closeQuietly(Ljava/io/Closeable;)V

    .line 402
    throw p0
.end method

.method private static miniIconButton(Landroid/app/Activity;Landroid/graphics/drawable/Drawable;Ljava/lang/String;Landroid/view/View$OnClickListener;)Landroid/widget/Button;
    .registers 8

    .line 200
    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 201
    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 202
    invoke-virtual {v0, p2}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 203
    const/16 p2, 0x11

    invoke-virtual {v0, p2}, Landroid/widget/Button;->setGravity(I)V

    .line 204
    const/4 p2, 0x0

    invoke-virtual {v0, p2}, Landroid/widget/Button;->setMinHeight(I)V

    .line 205
    invoke-virtual {v0, p2}, Landroid/widget/Button;->setMinimumHeight(I)V

    .line 206
    invoke-virtual {v0, p2}, Landroid/widget/Button;->setMinWidth(I)V

    .line 207
    invoke-virtual {v0, p2}, Landroid/widget/Button;->setMinimumWidth(I)V

    .line 208
    const/4 v1, 0x4

    invoke-static {p0, v1}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v1

    .line 209
    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/widget/Button;->setPadding(IIII)V

    .line 210
    const/16 v1, 0x2e

    const/16 v2, 0x36

    const/16 v3, 0x28

    invoke-static {v3, v1, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v1

    const/4 v2, 0x6

    invoke-static {p0, v2}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v2

    int-to-float v2, v2

    invoke-static {v1, v2}, Lcom/trueaxis/modmenu/ModMenu;->background(IF)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 211
    const/16 v1, 0x10

    invoke-static {p0, v1}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result p0

    .line 212
    invoke-virtual {p1, p2, p2, p0, p0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 213
    const/4 p0, 0x0

    invoke-virtual {v0, p1, p0, p0, p0}, Landroid/widget/Button;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 214
    invoke-virtual {v0, p3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 215
    return-object v0
.end method

.method private static mirrorExternal(Landroid/content/Context;ILandroid/graphics/Bitmap;)V
    .registers 6

    .line 1445
    const-string v0, "livery"

    :try_start_2
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/ModMenu;->externalTexture(Landroid/content/Context;I)Ljava/io/File;

    move-result-object p0

    .line 1446
    if-eqz p0, :cond_34

    .line 1447
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

    .line 1448
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1447
    invoke-static {v0, v1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 1449
    invoke-static {p0, p2}, Lcom/trueaxis/modmenu/ModMenu;->writeLivery(Ljava/io/File;Landroid/graphics/Bitmap;)V

    goto :goto_39

    .line 1451
    :cond_34
    const-string p0, "mirror external skipped; no external files dir"

    invoke-static {v0, p0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_39
    .catchall {:try_start_2 .. :try_end_39} :catchall_3a

    .line 1455
    :goto_39
    goto :goto_55

    .line 1453
    :catchall_3a
    move-exception p0

    .line 1454
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

    .line 1456
    :goto_55
    return-void
.end method

.method public static orbitHeight(Landroid/content/Context;)I
    .registers 3

    .line 529
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "orbit_height"

    const/16 v1, 0x2a

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    const/16 v0, 0xa

    const/16 v1, 0x50

    invoke-static {p0, v0, v1}, Lcom/trueaxis/modmenu/ModMenu;->clamp(III)I

    move-result p0

    return p0
.end method

.method public static orbitRadius(Landroid/content/Context;)I
    .registers 3

    .line 519
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "orbit_radius"

    const/16 v1, 0x8

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    const/4 v0, 0x4

    const/16 v1, 0x28

    invoke-static {p0, v0, v1}, Lcom/trueaxis/modmenu/ModMenu;->clamp(III)I

    move-result p0

    return p0
.end method

.method public static orbitSpeed(Landroid/content/Context;)I
    .registers 3

    .line 524
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "orbit_speed"

    const/16 v1, 0x48

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    const/4 v0, 0x5

    const/16 v1, 0xb4

    invoke-static {p0, v0, v1}, Lcom/trueaxis/modmenu/ModMenu;->clamp(III)I

    move-result p0

    return p0
.end method

.method public static prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .registers 3

    .line 444
    const-string v0, "jcs_mod"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    return-object p0
.end method

.method private static quarantineLivery(Ljava/io/File;ILjava/lang/String;Ljava/lang/String;)V
    .registers 13

    .line 653
    const-string v0, " path="

    const-string v1, " reason="

    const-string v2, " car="

    const-string v3, "livery"

    new-instance v4, Ljava/io/File;

    invoke-virtual {p0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 654
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

    .line 655
    nop

    .line 657
    :try_start_31
    invoke-virtual {p0, v4}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v5

    .line 658
    if-nez v5, :cond_3b

    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    move-result v5
    :try_end_3b
    .catchall {:try_start_31 .. :try_end_3b} :catchall_8b

    .line 665
    :cond_3b
    nop

    .line 666
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "quarantined "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    .line 667
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

    .line 669
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " target="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    .line 670
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

    .line 666
    invoke-static {v3, p0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 672
    return-void

    .line 659
    :catchall_8b
    move-exception v4

    .line 660
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "quarantine failed "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    .line 661
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

    .line 663
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 660
    invoke-static {v3, p0, v4}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 664
    return-void
.end method

.method public static raceSwarmEnabled(Landroid/content/Context;)Z
    .registers 3

    .line 514
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "race_ghost_swarm"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method private static rememberCar(Landroid/content/Context;Landroid/widget/Spinner;)V
    .registers 3

    .line 428
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

    .line 429
    return-void
.end method

.method public static rememberSwarmCatalogPaths(Landroid/content/Context;Ljava/util/List;)V
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 576
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    .line 577
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->swarmCatalogPaths(Landroid/content/Context;)[Ljava/lang/String;

    move-result-object v1

    array-length v2, v1

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_c
    if-ge v4, v2, :cond_1c

    aget-object v5, v1, v4

    .line 578
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v6

    if-lez v6, :cond_19

    invoke-virtual {v0, v5}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    .line 577
    :cond_19
    add-int/lit8 v4, v4, 0x1

    goto :goto_c

    .line 580
    :cond_1c
    nop

    .line 581
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_21
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_46

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 582
    if-eqz v1, :cond_45

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_45

    invoke-virtual {v0}, Ljava/util/LinkedHashSet;->size()I

    move-result v2

    const/16 v4, 0x20

    if-ge v2, v4, :cond_45

    .line 583
    invoke-virtual {v0, v1}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_45

    .line 584
    const/4 v1, 0x1

    const/4 v3, 0x1

    .line 586
    :cond_45
    goto :goto_21

    .line 587
    :cond_46
    if-nez v3, :cond_49

    .line 588
    return-void

    .line 590
    :cond_49
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 591
    invoke-virtual {v0}, Ljava/util/LinkedHashSet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_52
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_6d

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 592
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-lez v3, :cond_69

    const/16 v3, 0xa

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 593
    :cond_69
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 594
    goto :goto_52

    .line 595
    :cond_6d
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v1, "swarm_catalog_paths"

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 596
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string p1, "catalog persisted count="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {v0}, Ljava/util/LinkedHashSet;->size()I

    move-result p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "swarm"

    invoke-static {p1, p0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 597
    return-void
.end method

.method public static replayCameraMode(Landroid/content/Context;)I
    .registers 3

    .line 499
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "replay_camera_mode"

    const/4 v1, 0x1

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    .line 500
    sget-object v0, Lcom/trueaxis/modmenu/ModMenu;->REPLAY_CAMERA_MODE_NAMES:[Ljava/lang/String;

    array-length v0, v0

    add-int/2addr v0, v1

    sub-int/2addr v0, v1

    .line 501
    if-lt p0, v1, :cond_16

    if-gt p0, v0, :cond_16

    .line 502
    move v1, p0

    goto :goto_17

    .line 503
    :cond_16
    nop

    .line 501
    :goto_17
    return v1
.end method

.method public static replayFreeCameraEnabled(Landroid/content/Context;)Z
    .registers 3

    .line 493
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->applyMenuDefaults(Landroid/content/Context;)V

    .line 494
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "replay_free_camera"

    const/4 v1, 0x1

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method public static replaySwarmEnabled(Landroid/content/Context;)Z
    .registers 3

    .line 507
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->applyMenuDefaults(Landroid/content/Context;)V

    .line 510
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "replay_swarm"

    const/4 v1, 0x1

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method public static resetAllCustomLiveries(Landroid/content/Context;)V
    .registers 3

    .line 1503
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModDebugLog;->install(Landroid/content/Context;)V

    .line 1504
    const-string v0, "livery"

    const-string v1, "reset all custom liveries"

    invoke-static {v0, v1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 1505
    const/4 v0, 0x0

    :goto_b
    sget-object v1, Lcom/trueaxis/modmenu/ModMenu;->CAR_TEXTURES:[Ljava/lang/String;

    array-length v1, v1

    if-ge v0, v1, :cond_16

    .line 1506
    invoke-static {p0, v0}, Lcom/trueaxis/modmenu/ModMenu;->deleteCustomLivery(Landroid/content/Context;I)V

    .line 1505
    add-int/lit8 v0, v0, 0x1

    goto :goto_b

    .line 1508
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

    .line 407
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModDebugLog;->install(Landroid/content/Context;)V

    .line 408
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

    .line 409
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

    .line 408
    const-string v1, "livery"

    invoke-static {v1, v0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 410
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    const/16 v2, 0x200

    if-ne v0, v2, :cond_4b

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    if-ne v0, v2, :cond_4b

    .line 411
    move-object v0, p2

    goto :goto_50

    .line 412
    :cond_4b
    const/4 v0, 0x1

    invoke-static {p2, v2, v2, v0}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v0

    :goto_50
    nop

    .line 414
    :try_start_51
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/ModMenu;->customTexture(Landroid/content/Context;I)Ljava/io/File;

    move-result-object v2

    invoke-static {v2, v0}, Lcom/trueaxis/modmenu/ModMenu;->writeLivery(Ljava/io/File;Landroid/graphics/Bitmap;)V

    .line 415
    invoke-static {p0, p1, v0}, Lcom/trueaxis/modmenu/ModMenu;->mirrorExternal(Landroid/content/Context;ILandroid/graphics/Bitmap;)V

    .line 416
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

    .line 418
    if-eq v0, p2, :cond_7a

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 420
    :cond_7a
    return-void

    .line 418
    :catchall_7b
    move-exception p0

    if-eq v0, p2, :cond_81

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 419
    :cond_81
    throw p0
.end method

.method private static sectionHeader(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/TextView;
    .registers 5

    .line 310
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p1, v0}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p1

    .line 311
    const/16 v0, 0xff

    const/16 v1, 0x98

    const/16 v2, 0x40

    invoke-static {v0, v1, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    .line 310
    const/16 v1, 0xb

    invoke-static {p0, p1, v1, v0}, Lcom/trueaxis/modmenu/ModMenu;->label(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object p1

    .line 312
    invoke-virtual {p1}, Landroid/widget/TextView;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 313
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_2a

    .line 314
    const v0, 0x3da3d70a

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setLetterSpacing(F)V

    .line 316
    :cond_2a
    const/4 v0, 0x6

    invoke-static {p0, v0}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result p0

    const/4 v0, 0x0

    invoke-virtual {p1, v0, v0, v0, p0}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 317
    return-object p1
.end method

.method public static sectorSplitsEnabled(Landroid/content/Context;)Z
    .registers 3

    .line 488
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->applyMenuDefaults(Landroid/content/Context;)V

    .line 489
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

    .line 423
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "livery_car"

    const/4 v1, 0x1

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    .line 424
    if-ltz p0, :cond_13

    sget-object v0, Lcom/trueaxis/modmenu/ModMenu;->CAR_TEXTURES:[Ljava/lang/String;

    array-length v0, v0

    if-ge p0, v0, :cond_13

    move v1, p0

    :cond_13
    return v1
.end method

.method private static showDonateDialog(Landroid/app/Activity;)V
    .registers 13

    .line 234
    const-string v0, "launcher"

    const-string v1, "donate modal opened address=F6mjNXKBKzjmKTK1Z9cWabFHZYtxMg8rojuNuppX2EG1"

    invoke-static {v0, v1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 235
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 236
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 237
    const/16 v2, 0x10

    invoke-static {p0, v2}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v3

    const/16 v4, 0xc

    invoke-static {p0, v4}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v5

    invoke-static {p0, v2}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v6

    const/4 v7, 0x4

    invoke-static {p0, v7}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v8

    invoke-virtual {v0, v3, v5, v6, v8}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 239
    const/16 v3, 0xff

    const/16 v5, 0x80

    const/4 v6, 0x0

    invoke-static {v3, v5, v6}, Landroid/graphics/Color;->rgb(III)I

    move-result v3

    const-string v5, "Fuel the development"

    invoke-static {p0, v5, v2, v3}, Lcom/trueaxis/modmenu/ModMenu;->label(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v3

    .line 240
    invoke-static {p0, v7}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v5

    invoke-virtual {v3, v6, v6, v6, v5}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 241
    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 243
    nop

    .line 245
    const/16 v3, 0xaa

    const/16 v5, 0xb2

    const/16 v8, 0xb9

    invoke-static {v3, v5, v8}, Landroid/graphics/Color;->rgb(III)I

    move-result v3

    .line 243
    const-string v5, "Scan the QR or copy the wallet to support the mod."

    const/16 v8, 0xb

    invoke-static {p0, v5, v8, v3}, Lcom/trueaxis/modmenu/ModMenu;->label(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v3

    .line 246
    const/16 v5, 0x8

    invoke-static {p0, v5}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v8

    invoke-virtual {v3, v6, v6, v6, v8}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 247
    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 249
    const-string v3, "Solana (SOL) wallet"

    const/4 v8, -0x1

    invoke-static {p0, v3, v4, v8}, Lcom/trueaxis/modmenu/ModMenu;->label(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v3

    .line 250
    const/4 v9, 0x2

    invoke-static {p0, v9}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v9

    invoke-virtual {v3, v6, v6, v6, v9}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 251
    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 253
    const/16 v3, 0xd8

    const/16 v9, 0xde

    const/16 v10, 0xd2

    invoke-static {v10, v3, v9}, Landroid/graphics/Color;->rgb(III)I

    move-result v3

    const-string v9, "F6mjNXKBKzjmKTK1Z9cWabFHZYtxMg8rojuNuppX2EG1"

    const/16 v10, 0x9

    invoke-static {p0, v9, v10, v3}, Lcom/trueaxis/modmenu/ModMenu;->label(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v3

    .line 254
    sget-object v10, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;

    invoke-virtual {v3, v10}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 255
    sget v10, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v10, v2, :cond_90

    .line 256
    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setTextIsSelectable(Z)V

    .line 258
    :cond_90
    const/4 v2, 0x6

    invoke-static {p0, v2}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v2

    invoke-virtual {v3, v6, v6, v6, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 259
    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 261
    const/16 v2, 0x78

    const/16 v3, 0x8c

    const/16 v10, 0xdc

    invoke-static {v2, v10, v3}, Landroid/graphics/Color;->rgb(III)I

    move-result v2

    const-string v3, ""

    const/16 v11, 0xa

    invoke-static {p0, v3, v11, v2}, Lcom/trueaxis/modmenu/ModMenu;->label(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v2

    .line 262
    invoke-static {p0, v7}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v3

    invoke-virtual {v2, v6, v6, v6, v3}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 263
    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 264
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 266
    const-string v3, "Copy address"

    invoke-static {p0, v3}, Lcom/trueaxis/modmenu/ModMenu;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v3

    .line 267
    new-instance v6, Lcom/trueaxis/modmenu/ModMenu$2;

    invoke-direct {v6, p0, v2}, Lcom/trueaxis/modmenu/ModMenu$2;-><init>(Landroid/app/Activity;Landroid/widget/TextView;)V

    invoke-virtual {v3, v6}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 283
    invoke-static {}, Lcom/trueaxis/modmenu/ModMenu;->fill()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v2

    invoke-virtual {v0, v3, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 285
    new-instance v2, Landroid/widget/FrameLayout;

    invoke-direct {v2, p0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 286
    invoke-static {p0, v5}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v3

    int-to-float v3, v3

    invoke-static {v8, v3}, Lcom/trueaxis/modmenu/ModMenu;->background(IF)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/FrameLayout;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 287
    invoke-static {p0, v4}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v3

    invoke-static {p0, v4}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v6

    invoke-static {p0, v4}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v7

    invoke-static {p0, v4}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-virtual {v2, v3, v6, v7, v4}, Landroid/widget/FrameLayout;->setPadding(IIII)V

    .line 288
    new-instance v3, Landroid/widget/ImageView;

    invoke-direct {v3, p0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 289
    invoke-static {p0, v10}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v4

    .line 290
    invoke-static {v9, v4}, Lcom/trueaxis/modmenu/QrCodeEncoder;->encode(Ljava/lang/String;I)Landroid/graphics/Bitmap;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 291
    invoke-virtual {v3, v1}, Landroid/widget/ImageView;->setAdjustViewBounds(Z)V

    .line 292
    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v6, 0x11

    const/4 v7, -0x2

    invoke-direct {v4, v7, v7, v6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v2, v3, v4}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 296
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v7, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 299
    iput v1, v3, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 300
    invoke-static {p0, v5}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v1

    iput v1, v3, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 301
    invoke-virtual {v0, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 303
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 304
    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    .line 305
    const-string v0, "Done"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    .line 306
    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 307
    return-void
.end method

.method public static showLiveryManager(Landroid/app/Activity;)V
    .registers 13

    .line 1190
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModDebugLog;->install(Landroid/content/Context;)V

    .line 1191
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

    .line 1193
    :try_start_23
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 1194
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 1195
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

    .line 1197
    const-string v2, "Design a livery in the app, upload any PNG/JPG, or export the exact UV texture to edit elsewhere. Liveries are 512x512 PNG and apply after a restart."

    const v3, -0xbbbbbc

    const/16 v4, 0xb

    invoke-static {p0, v2, v4, v3}, Lcom/trueaxis/modmenu/ModMenu;->label(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v2

    .line 1201
    const/16 v5, 0x8

    invoke-static {p0, v5}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v6

    const/4 v7, 0x0

    invoke-virtual {v2, v7, v7, v7, v6}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 1202
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 1204
    new-instance v2, Landroid/widget/Spinner;

    invoke-direct {v2, p0}, Landroid/widget/Spinner;-><init>(Landroid/content/Context;)V

    .line 1205
    new-instance v6, Landroid/widget/ArrayAdapter;

    sget-object v8, Lcom/trueaxis/modmenu/ModMenu;->CAR_NAMES:[Ljava/lang/String;

    const v9, 0x1090008

    invoke-direct {v6, p0, v9, v8}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    .line 1207
    const v8, 0x1090009

    invoke-virtual {v6, v8}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 1208
    invoke-virtual {v2, v6}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 1209
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->selectedCar(Landroid/content/Context;)I

    move-result v6

    invoke-virtual {v2, v6}, Landroid/widget/Spinner;->setSelection(I)V

    .line 1210
    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v8, -0x1

    const/4 v9, -0x2

    invoke-direct {v6, v8, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v2, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1213
    const-string v6, ""

    invoke-static {p0, v6, v4, v3}, Lcom/trueaxis/modmenu/ModMenu;->label(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v3

    .line 1214
    const/4 v4, 0x5

    invoke-static {p0, v4}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v6

    invoke-static {p0, v4}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-virtual {v3, v7, v6, v7, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 1215
    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 1217
    const-string v4, "\u00c3\u00b0\u00c5\u00b8\u00c5\u00bd\u00c2\u00a8  Open livery designer"

    invoke-static {p0, v4}, Lcom/trueaxis/modmenu/ModMenu;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v4

    .line 1218
    const/high16 v6, 0x41500000

    invoke-virtual {v4, v6}, Landroid/widget/Button;->setTextSize(F)V

    .line 1219
    invoke-virtual {v4, v8}, Landroid/widget/Button;->setTextColor(I)V

    .line 1220
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

    .line 1221
    new-instance v6, Lcom/trueaxis/modmenu/ModMenu$21;

    invoke-direct {v6, p0, v2}, Lcom/trueaxis/modmenu/ModMenu$21;-><init>(Landroid/app/Activity;Landroid/widget/Spinner;)V

    invoke-virtual {v4, v6}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1233
    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v6, v8, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 1235
    invoke-static {p0, v5}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v5

    iput v5, v6, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 1236
    invoke-virtual {v0, v4, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1238
    new-instance v4, Landroid/widget/LinearLayout;

    invoke-direct {v4, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 1239
    invoke-virtual {v4, v7}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 1240
    const-string v5, "Upload"

    invoke-static {p0, v5}, Lcom/trueaxis/modmenu/ModMenu;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v5

    .line 1241
    const-string v6, "Export / edit"

    invoke-static {p0, v6}, Lcom/trueaxis/modmenu/ModMenu;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v6

    .line 1242
    const-string v8, "Restore default"

    invoke-static {p0, v8}, Lcom/trueaxis/modmenu/ModMenu;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v8

    .line 1243
    new-instance v10, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v11, 0x3f800000

    invoke-direct {v10, v7, v9, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v4, v5, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1245
    new-instance v10, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v10, v7, v9, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v4, v6, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1247
    new-instance v10, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v10, v7, v9, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v4, v8, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1249
    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 1251
    new-instance v4, Lcom/trueaxis/modmenu/ModMenu$22;

    invoke-direct {v4, v2, v3, p0}, Lcom/trueaxis/modmenu/ModMenu$22;-><init>(Landroid/widget/Spinner;Landroid/widget/TextView;Landroid/app/Activity;)V

    .line 1259
    new-instance v3, Lcom/trueaxis/modmenu/ModMenu$23;

    invoke-direct {v3, p0, v2, v4}, Lcom/trueaxis/modmenu/ModMenu$23;-><init>(Landroid/app/Activity;Landroid/widget/Spinner;Ljava/lang/Runnable;)V

    invoke-virtual {v2, v3}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 1271
    invoke-interface {v4}, Ljava/lang/Runnable;->run()V

    .line 1273
    new-instance v3, Lcom/trueaxis/modmenu/ModMenu$24;

    invoke-direct {v3, p0, v2}, Lcom/trueaxis/modmenu/ModMenu$24;-><init>(Landroid/app/Activity;Landroid/widget/Spinner;)V

    invoke-virtual {v5, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1290
    new-instance v3, Lcom/trueaxis/modmenu/ModMenu$25;

    invoke-direct {v3, p0, v2}, Lcom/trueaxis/modmenu/ModMenu$25;-><init>(Landroid/app/Activity;Landroid/widget/Spinner;)V

    invoke-virtual {v6, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1312
    new-instance v3, Lcom/trueaxis/modmenu/ModMenu$26;

    invoke-direct {v3, v2, p0, v4}, Lcom/trueaxis/modmenu/ModMenu$26;-><init>(Landroid/widget/Spinner;Landroid/app/Activity;Ljava/lang/Runnable;)V

    invoke-virtual {v8, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1322
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v3, "Custom liveries - all cars"

    .line 1323
    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 1324
    invoke-virtual {v2, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v2, "Close"

    .line 1325
    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 1326
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;
    :try_end_148
    .catchall {:try_start_23 .. :try_end_148} :catchall_149

    .line 1331
    goto :goto_159

    .line 1327
    :catchall_149
    move-exception v0

    .line 1328
    const-string v2, "YCS2Mod"

    const-string v3, "Could not open livery manager"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1329
    invoke-static {v1, v3, v0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1330
    const-string v0, "Could not open livery manager."

    invoke-static {p0, v0}, Lcom/trueaxis/modmenu/ModMenu;->toast(Landroid/content/Context;Ljava/lang/String;)V

    .line 1332
    :goto_159
    return-void
.end method

.method public static showPreLaunchMenu(Landroid/app/Activity;Ljava/lang/Runnable;)V
    .registers 33

    .line 679
    move-object/from16 v0, p0

    invoke-static/range {p0 .. p0}, Lcom/trueaxis/modmenu/ModDebugLog;->install(Landroid/content/Context;)V

    .line 680
    invoke-static/range {p0 .. p0}, Lcom/trueaxis/modmenu/ModMenu;->applyMenuDefaults(Landroid/content/Context;)V

    .line 681
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "show pre-launch menu checkpointSplits="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 682
    invoke-static/range {p0 .. p0}, Lcom/trueaxis/modmenu/ModMenu;->checkpointSplitsEnabled(Landroid/content/Context;)Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 681
    const-string v10, "launcher"

    invoke-static {v10, v1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 683
    invoke-static/range {p0 .. p0}, Lcom/trueaxis/modmenu/ModIdentity;->configure(Landroid/content/Context;)V

    .line 685
    :try_start_27
    new-instance v11, Landroid/widget/LinearLayout;

    invoke-direct {v11, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 686
    const/4 v12, 0x1

    invoke-virtual {v11, v12}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 687
    const/16 v1, 0xd

    const/16 v2, 0x17

    const/16 v13, 0x11

    invoke-static {v1, v13, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v1

    invoke-virtual {v11, v1}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 688
    const/16 v14, 0xc

    invoke-static {v0, v14}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v1

    const/16 v15, 0xa

    invoke-static {v0, v15}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v2

    invoke-static {v0, v14}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v3

    invoke-static {v0, v15}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-virtual {v11, v1, v2, v3, v4}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 690
    const-string v1, "JCS2 Community Mod"

    const/16 v9, 0x80

    const/16 v8, 0xff

    const/4 v7, 0x0

    invoke-static {v8, v9, v7}, Landroid/graphics/Color;->rgb(III)I

    move-result v2

    const/16 v3, 0x14

    invoke-static {v0, v1, v3, v2}, Lcom/trueaxis/modmenu/ModMenu;->label(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v1

    .line 691
    invoke-virtual {v1, v13}, Landroid/widget/TextView;->setGravity(I)V

    .line 692
    const/4 v6, 0x2

    invoke-static {v0, v6}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v2

    invoke-virtual {v1, v7, v7, v7, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 693
    invoke-virtual {v11, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 695
    invoke-static/range {p0 .. p0}, Lcom/trueaxis/modmenu/ModMenu;->buildSummary(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    const/16 v5, 0xde

    const/16 v4, 0xd8

    const/16 v2, 0xd2

    invoke-static {v2, v4, v5}, Landroid/graphics/Color;->rgb(III)I

    move-result v8

    invoke-static {v0, v1, v15, v8}, Lcom/trueaxis/modmenu/ModMenu;->label(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v1

    .line 696
    invoke-virtual {v1, v13}, Landroid/widget/TextView;->setGravity(I)V

    .line 697
    invoke-static {v0, v6}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v8

    invoke-virtual {v1, v7, v7, v7, v8}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 698
    invoke-virtual {v11, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 700
    const-string v1, "Updates, custom liveries, and replay tools before launch."

    .line 702
    const/16 v8, 0xb9

    const/16 v14, 0xb2

    const/16 v2, 0xaa

    invoke-static {v2, v14, v8}, Landroid/graphics/Color;->rgb(III)I

    move-result v9

    .line 700
    invoke-static {v0, v1, v15, v9}, Lcom/trueaxis/modmenu/ModMenu;->label(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v1

    .line 703
    invoke-virtual {v1, v13}, Landroid/widget/TextView;->setGravity(I)V

    .line 704
    const/4 v9, 0x6

    invoke-static {v0, v9}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v9

    invoke-virtual {v1, v7, v7, v7, v9}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 705
    invoke-virtual {v11, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 707
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 708
    invoke-virtual {v1, v7}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 709
    invoke-virtual {v1, v13}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 710
    const/4 v9, 0x6

    invoke-static {v0, v9}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v9

    invoke-virtual {v1, v7, v7, v7, v9}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 711
    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    .line 712
    const/16 v2, 0x2a

    invoke-static {v0, v2}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v2

    const/16 v8, 0x2a

    invoke-static {v0, v8}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v8

    invoke-direct {v9, v2, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 713
    const/4 v2, 0x5

    invoke-static {v0, v2}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v2

    const/4 v8, 0x5

    invoke-static {v0, v8}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v8

    invoke-virtual {v9, v2, v7, v8, v7}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 714
    const/16 v2, 0x29

    const/16 v8, 0x2e

    const/16 v13, 0x24

    invoke-static {v13, v2, v8}, Landroid/graphics/Color;->rgb(III)I

    move-result v2

    .line 715
    const/16 v8, 0x65

    const/16 v13, 0xf2

    const/16 v15, 0x58

    invoke-static {v15, v8, v13}, Landroid/graphics/Color;->rgb(III)I

    move-result v8

    .line 716
    const/16 v13, 0x19

    const/16 v15, 0x23

    invoke-static {v3, v13, v15}, Landroid/graphics/Color;->rgb(III)I

    move-result v3

    .line 717
    new-instance v13, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;

    const/4 v15, -0x1

    invoke-direct {v13, v15, v2}, Lcom/trueaxis/modmenu/ModMenu$GitHubIconDrawable;-><init>(II)V

    const-string v14, "GitHub"

    new-instance v4, Lcom/trueaxis/modmenu/ModMenu$3;

    invoke-direct {v4, v0}, Lcom/trueaxis/modmenu/ModMenu$3;-><init>(Landroid/app/Activity;)V

    invoke-static {v0, v2, v13, v14, v4}, Lcom/trueaxis/modmenu/ModMenu;->iconLinkButton(Landroid/app/Activity;ILandroid/graphics/drawable/Drawable;Ljava/lang/String;Landroid/view/View$OnClickListener;)Landroid/widget/Button;

    move-result-object v2

    invoke-virtual {v1, v2, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 730
    new-instance v2, Lcom/trueaxis/modmenu/ModMenu$SolanaDonateIconDrawable;

    invoke-direct {v2}, Lcom/trueaxis/modmenu/ModMenu$SolanaDonateIconDrawable;-><init>()V

    const-string v4, "Donate"

    new-instance v13, Lcom/trueaxis/modmenu/ModMenu$4;

    invoke-direct {v13, v0}, Lcom/trueaxis/modmenu/ModMenu$4;-><init>(Landroid/app/Activity;)V

    invoke-static {v0, v3, v2, v4, v13}, Lcom/trueaxis/modmenu/ModMenu;->iconLinkButton(Landroid/app/Activity;ILandroid/graphics/drawable/Drawable;Ljava/lang/String;Landroid/view/View$OnClickListener;)Landroid/widget/Button;

    move-result-object v2

    invoke-virtual {v1, v2, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 737
    new-instance v2, Lcom/trueaxis/modmenu/ModMenu$DiscordIconDrawable;

    invoke-direct {v2, v15, v8}, Lcom/trueaxis/modmenu/ModMenu$DiscordIconDrawable;-><init>(II)V

    const-string v3, "Discord"

    new-instance v4, Lcom/trueaxis/modmenu/ModMenu$5;

    invoke-direct {v4, v0}, Lcom/trueaxis/modmenu/ModMenu$5;-><init>(Landroid/app/Activity;)V

    invoke-static {v0, v8, v2, v3, v4}, Lcom/trueaxis/modmenu/ModMenu;->iconLinkButton(Landroid/app/Activity;ILandroid/graphics/drawable/Drawable;Ljava/lang/String;Landroid/view/View$OnClickListener;)Landroid/widget/Button;

    move-result-object v2

    invoke-virtual {v1, v2, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 750
    invoke-virtual {v11, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 752
    new-instance v13, Landroid/widget/ScrollView;

    invoke-direct {v13, v0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    .line 753
    invoke-virtual {v13, v12}, Landroid/widget/ScrollView;->setFillViewport(Z)V

    .line 754
    new-instance v14, Landroid/widget/LinearLayout;

    invoke-direct {v14, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 755
    invoke-virtual {v14, v12}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 756
    invoke-static {v0, v6}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v1

    invoke-static {v0, v6}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v2

    const/16 v9, 0x8

    invoke-static {v0, v9}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v3

    invoke-virtual {v14, v1, v7, v2, v3}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 758
    invoke-static/range {p0 .. p0}, Lcom/trueaxis/modmenu/ModMenu;->subCard(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v1

    .line 759
    invoke-static {v0, v14, v1}, Lcom/trueaxis/modmenu/ModMenu;->addSubCard(Landroid/content/Context;Landroid/widget/LinearLayout;Landroid/widget/LinearLayout;)V

    .line 760
    const-string v2, "Mod tools"

    invoke-static {v0, v2}, Lcom/trueaxis/modmenu/ModMenu;->sectionHeader(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 762
    const-string v2, "Custom liveries"

    invoke-static {v0, v2}, Lcom/trueaxis/modmenu/ModMenu;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v2

    .line 763
    new-instance v3, Lcom/trueaxis/modmenu/ModMenu$6;

    invoke-direct {v3, v0}, Lcom/trueaxis/modmenu/ModMenu$6;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 769
    const-string v3, "Check updates"

    invoke-static {v0, v3}, Lcom/trueaxis/modmenu/ModMenu;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v3

    .line 770
    new-instance v4, Lcom/trueaxis/modmenu/ModMenu$7;

    invoke-direct {v4, v0}, Lcom/trueaxis/modmenu/ModMenu$7;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 776
    invoke-static {v0, v1, v2, v3}, Lcom/trueaxis/modmenu/ModMenu;->addButtonRow(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;Landroid/widget/Button;)V

    .line 778
    const-string v2, "Always on: purchase compatibility, expanded checkpoints, blue flame ID."

    .line 780
    const/16 v3, 0x96

    const/16 v4, 0x9e

    const/16 v8, 0xa5

    invoke-static {v3, v4, v8}, Landroid/graphics/Color;->rgb(III)I

    move-result v3

    .line 778
    const/16 v8, 0x9

    invoke-static {v0, v2, v8, v3}, Lcom/trueaxis/modmenu/ModMenu;->label(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v2

    .line 781
    const/4 v4, 0x4

    invoke-static {v0, v4}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v3

    invoke-static {v0, v6}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v8

    invoke-virtual {v2, v7, v3, v7, v8}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 782
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 784
    invoke-static/range {p0 .. p0}, Lcom/trueaxis/modmenu/ModMenu;->subCard(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v8

    .line 785
    invoke-static {v0, v14, v8}, Lcom/trueaxis/modmenu/ModMenu;->addSubCard(Landroid/content/Context;Landroid/widget/LinearLayout;Landroid/widget/LinearLayout;)V

    .line 786
    const-string v1, "Replay camera"

    invoke-static {v0, v1}, Lcom/trueaxis/modmenu/ModMenu;->sectionHeader(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v8, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 787
    const-string v1, "Enable gesture free camera during replays"

    const-string v2, "replay_free_camera"

    invoke-static {v0, v8, v1, v2, v12}, Lcom/trueaxis/modmenu/ModMenu;->addCheckBox(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Z)Landroid/widget/CheckBox;

    .line 791
    const-string v1, "Camera mode"

    const/16 v2, 0xd2

    const/16 v3, 0xd8

    invoke-static {v2, v3, v5}, Landroid/graphics/Color;->rgb(III)I

    move-result v6

    const/16 v2, 0xb

    invoke-static {v0, v1, v2, v6}, Lcom/trueaxis/modmenu/ModMenu;->label(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v1

    .line 792
    invoke-static {v0, v4}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v2

    invoke-virtual {v1, v7, v2, v7, v7}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 793
    invoke-static {}, Lcom/trueaxis/modmenu/ModMenu;->fill()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v2

    invoke-virtual {v8, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 794
    new-instance v6, Landroid/widget/Spinner;

    invoke-direct {v6, v0}, Landroid/widget/Spinner;-><init>(Landroid/content/Context;)V

    .line 795
    new-instance v1, Landroid/widget/ArrayAdapter;

    sget-object v2, Lcom/trueaxis/modmenu/ModMenu;->REPLAY_CAMERA_MODE_NAMES:[Ljava/lang/String;

    const v3, 0x1090008

    invoke-direct {v1, v0, v3, v2}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    .line 797
    const v2, 0x1090009

    invoke-virtual {v1, v2}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 799
    invoke-virtual {v6, v1}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 800
    invoke-static/range {p0 .. p0}, Lcom/trueaxis/modmenu/ModMenu;->replayCameraMode(Landroid/content/Context;)I

    move-result v1

    sub-int/2addr v1, v12

    invoke-virtual {v6, v1}, Landroid/widget/Spinner;->setSelection(I)V

    .line 804
    new-instance v3, Lcom/trueaxis/modmenu/ModMenu$8;

    invoke-direct {v3, v0}, Lcom/trueaxis/modmenu/ModMenu$8;-><init>(Landroid/app/Activity;)V

    .line 813
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 814
    invoke-virtual {v2, v12}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 815
    const/16 v1, 0xc

    invoke-static {v0, v1}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-virtual {v2, v4, v7, v7, v7}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 816
    const-string v4, "Orbit radius"

    const-string v22, "orbit_radius"

    const-string v23, " units"

    const/16 v24, 0x8

    const/16 v25, 0x4

    const/16 v26, 0x28

    move-object/from16 v1, p0

    move-object/from16 v27, v2

    const/16 v15, 0xd2

    move-object/from16 v20, v3

    const/16 v28, 0xd8

    move-object v3, v4

    move-object/from16 v4, v22

    move/from16 v5, v24

    move-object/from16 v29, v6

    move/from16 v6, v25

    const/4 v15, 0x0

    move/from16 v7, v26

    move-object/from16 v30, v8

    move-object/from16 v8, v23

    move-object/from16 v9, v20

    invoke-static/range {v1 .. v9}, Lcom/trueaxis/modmenu/ModMenu;->addSeek(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;IIILjava/lang/String;Ljava/lang/Runnable;)Landroid/widget/LinearLayout;

    .line 818
    const-string v3, "Rotation speed"

    const-string v4, "orbit_speed"

    const-string v8, " deg/s"

    const/16 v5, 0x48

    const/4 v6, 0x5

    const/16 v7, 0xb4

    move-object/from16 v1, p0

    move-object/from16 v2, v27

    move-object/from16 v9, v20

    invoke-static/range {v1 .. v9}, Lcom/trueaxis/modmenu/ModMenu;->addSeek(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;IIILjava/lang/String;Ljava/lang/Runnable;)Landroid/widget/LinearLayout;

    .line 820
    const-string v3, "Camera height"

    const-string v4, "orbit_height"

    const-string v8, " deg"

    const/16 v5, 0x2a

    const/16 v6, 0xa

    const/16 v7, 0x50

    move-object/from16 v1, p0

    move-object/from16 v2, v27

    move-object/from16 v9, v20

    invoke-static/range {v1 .. v9}, Lcom/trueaxis/modmenu/ModMenu;->addSeek(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;IIILjava/lang/String;Ljava/lang/Runnable;)Landroid/widget/LinearLayout;

    .line 823
    new-instance v9, Lcom/trueaxis/modmenu/ModMenu$9;

    invoke-direct {v9, v0}, Lcom/trueaxis/modmenu/ModMenu$9;-><init>(Landroid/app/Activity;)V

    .line 833
    new-instance v8, Landroid/widget/LinearLayout;

    invoke-direct {v8, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 834
    invoke-virtual {v8, v12}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 835
    const/16 v1, 0xc

    invoke-static {v0, v1}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v2

    invoke-virtual {v8, v2, v15, v15, v15}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 836
    const-string v1, "Camera side"

    const/16 v2, 0xd2

    const/16 v6, 0xd8

    const/16 v7, 0xde

    invoke-static {v2, v6, v7}, Landroid/graphics/Color;->rgb(III)I

    move-result v3

    const/16 v2, 0xb

    invoke-static {v0, v1, v2, v3}, Lcom/trueaxis/modmenu/ModMenu;->label(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v1

    .line 837
    const/4 v5, 0x4

    invoke-static {v0, v5}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v2

    invoke-virtual {v1, v15, v2, v15, v15}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 838
    invoke-static {}, Lcom/trueaxis/modmenu/ModMenu;->fill()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v2

    invoke-virtual {v8, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 839
    new-instance v1, Landroid/widget/Spinner;

    invoke-direct {v1, v0}, Landroid/widget/Spinner;-><init>(Landroid/content/Context;)V

    .line 840
    new-instance v2, Landroid/widget/ArrayAdapter;

    sget-object v3, Lcom/trueaxis/modmenu/ModMenu;->TRACKSIDE_SIDE_NAMES:[Ljava/lang/String;

    const v4, 0x1090008

    invoke-direct {v2, v0, v4, v3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    .line 842
    const v3, 0x1090009

    invoke-virtual {v2, v3}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 844
    invoke-virtual {v1, v2}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 845
    invoke-static/range {p0 .. p0}, Lcom/trueaxis/modmenu/ModMenu;->tracksideSideMode(Landroid/content/Context;)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/Spinner;->setSelection(I)V

    .line 846
    new-instance v2, Lcom/trueaxis/modmenu/ModMenu$10;

    invoke-direct {v2, v0, v9}, Lcom/trueaxis/modmenu/ModMenu$10;-><init>(Landroid/app/Activity;Ljava/lang/Runnable;)V

    invoke-virtual {v1, v2}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 856
    invoke-static {}, Lcom/trueaxis/modmenu/ModMenu;->fill()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v2

    invoke-virtual {v8, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 857
    const-string v3, "Distance from track"

    const-string v4, "trackside_side_dist"

    const-string v16, " units"

    const/16 v17, 0xb

    const/16 v18, 0x2

    const/16 v19, 0x28

    move-object/from16 v1, p0

    move-object v2, v8

    const/4 v12, 0x4

    move/from16 v5, v17

    move/from16 v6, v18

    move/from16 v7, v19

    move-object/from16 v17, v8

    move-object/from16 v8, v16

    move-object/from16 v16, v9

    invoke-static/range {v1 .. v9}, Lcom/trueaxis/modmenu/ModMenu;->addSeek(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;IIILjava/lang/String;Ljava/lang/Runnable;)Landroid/widget/LinearLayout;

    .line 859
    const-string v3, "Height above track"

    const-string v4, "trackside_height"

    const-string v8, " units"

    const/4 v5, 0x7

    const/4 v6, 0x1

    const/16 v7, 0x28

    move-object/from16 v1, p0

    move-object/from16 v2, v17

    move-object/from16 v9, v16

    invoke-static/range {v1 .. v9}, Lcom/trueaxis/modmenu/ModMenu;->addSeek(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;IIILjava/lang/String;Ljava/lang/Runnable;)Landroid/widget/LinearLayout;

    .line 861
    const-string v3, "Camera placed ahead (min distance)"

    const-string v4, "trackside_min_dist"

    const-string v8, " units"

    const/16 v5, 0x23

    const/16 v6, 0xa

    const/16 v7, 0x96

    move-object/from16 v1, p0

    move-object/from16 v2, v17

    move-object/from16 v9, v16

    invoke-static/range {v1 .. v9}, Lcom/trueaxis/modmenu/ModMenu;->addSeek(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;IIILjava/lang/String;Ljava/lang/Runnable;)Landroid/widget/LinearLayout;

    .line 864
    const-string v3, "Switch to next camera at (max distance)"

    const-string v4, "trackside_max_dist"

    const-string v8, " units"

    const/16 v5, 0x37

    const/16 v6, 0x14

    const/16 v7, 0x12c

    move-object/from16 v1, p0

    move-object/from16 v2, v17

    move-object/from16 v9, v16

    invoke-static/range {v1 .. v9}, Lcom/trueaxis/modmenu/ModMenu;->addSeek(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;IIILjava/lang/String;Ljava/lang/Runnable;)Landroid/widget/LinearLayout;

    .line 868
    const-string v1, "No extra settings for this mode. Drag to change the view, pinch to zoom."

    .line 870
    const/16 v2, 0x96

    const/16 v3, 0x9e

    const/16 v4, 0xa5

    invoke-static {v2, v3, v4}, Landroid/graphics/Color;->rgb(III)I

    move-result v2

    .line 868
    const/16 v9, 0x9

    invoke-static {v0, v1, v9, v2}, Lcom/trueaxis/modmenu/ModMenu;->label(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v1

    .line 871
    const/16 v2, 0xc

    invoke-static {v0, v2}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v3

    invoke-static {v0, v12}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v2

    invoke-virtual {v1, v3, v2, v15, v15}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 873
    new-instance v2, Lcom/trueaxis/modmenu/ModMenu$11;

    move-object/from16 v4, v17

    move-object/from16 v3, v27

    invoke-direct {v2, v0, v3, v4, v1}, Lcom/trueaxis/modmenu/ModMenu$11;-><init>(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/LinearLayout;Landroid/widget/TextView;)V

    move-object/from16 v5, v29

    invoke-virtual {v5, v2}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 894
    invoke-static {}, Lcom/trueaxis/modmenu/ModMenu;->fill()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v2

    move-object/from16 v8, v30

    invoke-virtual {v8, v5, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 895
    invoke-static {}, Lcom/trueaxis/modmenu/ModMenu;->fill()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v2

    invoke-virtual {v8, v3, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 896
    invoke-static {}, Lcom/trueaxis/modmenu/ModMenu;->fill()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v2

    invoke-virtual {v8, v4, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 897
    invoke-static {}, Lcom/trueaxis/modmenu/ModMenu;->fill()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v2

    invoke-virtual {v8, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 898
    invoke-static/range {p0 .. p0}, Lcom/trueaxis/modmenu/ModMenu;->replayCameraMode(Landroid/content/Context;)I

    move-result v2

    .line 899
    const/4 v5, 0x1

    if-ne v2, v5, :cond_37f

    const/4 v7, 0x1

    goto :goto_380

    :cond_37f
    const/4 v7, 0x0

    .line 900
    :goto_380
    sget-object v5, Lcom/trueaxis/modmenu/ModMenu;->REPLAY_CAMERA_MODE_NAMES:[Ljava/lang/String;

    array-length v5, v5

    const/4 v6, 0x1

    add-int/2addr v5, v6

    sub-int/2addr v5, v6

    if-ne v2, v5, :cond_38a

    const/4 v2, 0x1

    goto :goto_38b

    :cond_38a
    const/4 v2, 0x0

    .line 902
    :goto_38b
    if-eqz v7, :cond_38f

    const/4 v5, 0x0

    goto :goto_391

    :cond_38f
    const/16 v5, 0x8

    :goto_391
    invoke-virtual {v3, v5}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 903
    if-eqz v2, :cond_398

    const/4 v3, 0x0

    goto :goto_39a

    :cond_398
    const/16 v3, 0x8

    :goto_39a
    invoke-virtual {v4, v3}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 904
    if-nez v7, :cond_3a4

    if-eqz v2, :cond_3a2

    goto :goto_3a4

    :cond_3a2
    const/4 v7, 0x0

    goto :goto_3a6

    :cond_3a4
    :goto_3a4
    const/16 v7, 0x8

    :goto_3a6
    invoke-virtual {v1, v7}, Landroid/widget/TextView;->setVisibility(I)V

    .line 906
    new-instance v7, Landroid/widget/LinearLayout;

    invoke-direct {v7, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 907
    const/4 v1, 0x1

    invoke-virtual {v7, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 908
    const/16 v1, 0xc

    invoke-static {v0, v1}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v2

    invoke-virtual {v7, v2, v15, v15, v15}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 909
    new-instance v6, Lcom/trueaxis/modmenu/ModMenu$12;

    invoke-direct {v6, v7, v0}, Lcom/trueaxis/modmenu/ModMenu$12;-><init>(Landroid/widget/LinearLayout;Landroid/app/Activity;)V

    .line 920
    const-string v3, "Auto-cycle camera modes during a replay"

    const-string v4, "camera_cycle"

    const/4 v5, 0x0

    move-object/from16 v1, p0

    move-object v2, v8

    move-object/from16 v16, v6

    invoke-static/range {v1 .. v6}, Lcom/trueaxis/modmenu/ModMenu;->addCheckBox(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/Runnable;)Landroid/widget/CheckBox;

    .line 923
    const-string v3, "Seconds per camera mode"

    const-string v4, "camera_cycle_seconds"

    const-string v17, " s"
    :try_end_3d3
    .catchall {:try_start_27 .. :try_end_3d3} :catchall_62c

    const/16 v5, 0xa

    const/4 v6, 0x3

    const/16 v18, 0x3c

    move-object/from16 v1, p0

    move-object v2, v7

    move-object v12, v7

    move/from16 v7, v18

    move-object v15, v8

    move-object/from16 v8, v17

    move-object/from16 v17, v10

    const/16 v10, 0x9

    move-object/from16 v9, v16

    :try_start_3e7
    invoke-static/range {v1 .. v9}, Lcom/trueaxis/modmenu/ModMenu;->addSeek(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;IIILjava/lang/String;Ljava/lang/Runnable;)Landroid/widget/LinearLayout;

    .line 925
    invoke-static/range {p0 .. p0}, Lcom/trueaxis/modmenu/ModMenu;->cameraCycleEnabled(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_3f2

    const/4 v7, 0x0

    goto :goto_3f4

    :cond_3f2
    const/16 v7, 0x8

    :goto_3f4
    invoke-virtual {v12, v7}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 926
    invoke-static {}, Lcom/trueaxis/modmenu/ModMenu;->fill()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v1

    invoke-virtual {v15, v12, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 928
    invoke-static/range {p0 .. p0}, Lcom/trueaxis/modmenu/ModMenu;->subCard(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v7

    .line 929
    invoke-static {v0, v14, v7}, Lcom/trueaxis/modmenu/ModMenu;->addSubCard(Landroid/content/Context;Landroid/widget/LinearLayout;Landroid/widget/LinearLayout;)V

    .line 930
    const-string v1, "Replay swarm"

    invoke-static {v0, v1}, Lcom/trueaxis/modmenu/ModMenu;->sectionHeader(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v7, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 931
    const-string v1, "Watch or race several replays at once. Saved replays are found automatically. In game: open View Replay on a level, tap the SWARM button (top right), tick ghost replays, Apply."

    .line 935
    const/16 v2, 0xb2

    const/16 v3, 0xaa

    const/16 v9, 0xb9

    invoke-static {v3, v2, v9}, Landroid/graphics/Color;->rgb(III)I

    move-result v4

    .line 931
    invoke-static {v0, v1, v10, v4}, Lcom/trueaxis/modmenu/ModMenu;->label(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v1

    .line 936
    const/4 v12, 0x2

    invoke-static {v0, v12}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v2

    const/4 v3, 0x0

    invoke-virtual {v1, v3, v3, v3, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 937
    invoke-virtual {v7, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 938
    new-instance v8, Landroid/widget/LinearLayout;

    invoke-direct {v8, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 939
    const/4 v1, 0x1

    invoke-virtual {v8, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 940
    const/16 v1, 0xc

    invoke-static {v0, v1}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v2

    const/4 v1, 0x0

    invoke-virtual {v8, v2, v1, v1, v1}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 941
    const-string v3, "Enable replay swarm picker during passive replays"

    const-string v4, "replay_swarm"

    new-instance v6, Lcom/trueaxis/modmenu/ModMenu$13;

    invoke-direct {v6, v8, v0}, Lcom/trueaxis/modmenu/ModMenu$13;-><init>(Landroid/widget/LinearLayout;Landroid/app/Activity;)V

    const/4 v5, 0x1

    move-object/from16 v1, p0

    move-object v2, v7

    invoke-static/range {v1 .. v6}, Lcom/trueaxis/modmenu/ModMenu;->addCheckBox(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/Runnable;)Landroid/widget/CheckBox;

    .line 949
    const-string v3, "Race against the selected swarm ghosts"

    const-string v4, "race_ghost_swarm"

    new-instance v6, Lcom/trueaxis/modmenu/ModMenu$14;

    invoke-direct {v6, v0}, Lcom/trueaxis/modmenu/ModMenu$14;-><init>(Landroid/app/Activity;)V

    const/4 v5, 0x0

    move-object/from16 v1, p0

    move-object v2, v8

    invoke-static/range {v1 .. v6}, Lcom/trueaxis/modmenu/ModMenu;->addCheckBox(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/Runnable;)Landroid/widget/CheckBox;

    .line 959
    invoke-static/range {p0 .. p0}, Lcom/trueaxis/modmenu/ModMenu;->replaySwarmEnabled(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_465

    const/4 v1, 0x0

    goto :goto_467

    :cond_465
    const/16 v1, 0x8

    :goto_467
    invoke-virtual {v8, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 960
    invoke-static {}, Lcom/trueaxis/modmenu/ModMenu;->fill()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v1

    invoke-virtual {v7, v8, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 962
    invoke-static/range {p0 .. p0}, Lcom/trueaxis/modmenu/ModMenu;->subCard(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v15

    .line 963
    invoke-static {v0, v14, v15}, Lcom/trueaxis/modmenu/ModMenu;->addSubCard(Landroid/content/Context;Landroid/widget/LinearLayout;Landroid/widget/LinearLayout;)V

    .line 964
    new-instance v8, Landroid/widget/LinearLayout;

    invoke-direct {v8, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 965
    const/4 v1, 0x0

    invoke-virtual {v8, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 966
    const/16 v7, 0x10

    invoke-virtual {v8, v7}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 967
    const-string v1, "Replay split HUD"

    invoke-static {v0, v1}, Lcom/trueaxis/modmenu/ModMenu;->sectionHeader(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v1

    .line 968
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v3, 0x3f800000

    const/4 v6, -0x2

    const/4 v4, 0x0

    invoke-direct {v2, v4, v6, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v8, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 971
    new-instance v5, Landroid/widget/LinearLayout;

    invoke-direct {v5, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 972
    const/4 v1, 0x1

    invoke-virtual {v5, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 973
    const/16 v1, 0xc

    invoke-static {v0, v1}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v2

    const/4 v1, 0x0

    invoke-virtual {v5, v2, v1, v1, v1}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 974
    const/16 v4, 0x8

    invoke-virtual {v5, v4}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 975
    const-string v3, "Text transparency"

    const-string v16, "split_alpha"

    const-string v19, "%"

    const/16 v21, 0x5a

    const/16 v22, 0xa

    const/16 v23, 0x64

    move-object/from16 v1, p0

    move-object v2, v5

    move-object/from16 v4, v16

    move-object/from16 v16, v5

    move/from16 v5, v21

    const/4 v12, -0x2

    move/from16 v6, v22

    move/from16 v7, v23

    move-object v10, v8

    move-object/from16 v8, v19

    invoke-static/range {v1 .. v8}, Lcom/trueaxis/modmenu/ModMenu;->addSeek(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;IIILjava/lang/String;)Landroid/widget/LinearLayout;

    .line 977
    const-string v3, "Horizontal position"

    const-string v4, "split_x"

    const-string v8, " dp"

    const/16 v5, 0x58

    const/4 v6, 0x0

    const/16 v7, 0x168

    move-object/from16 v1, p0

    move-object/from16 v2, v16

    invoke-static/range {v1 .. v8}, Lcom/trueaxis/modmenu/ModMenu;->addSeek(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;IIILjava/lang/String;)Landroid/widget/LinearLayout;

    .line 979
    const-string v3, "Vertical position"

    const-string v4, "split_y"

    const-string v8, " dp"

    const/16 v5, 0x27

    const/4 v6, 0x0

    const/16 v7, 0xb4

    move-object/from16 v1, p0

    move-object/from16 v2, v16

    invoke-static/range {v1 .. v8}, Lcom/trueaxis/modmenu/ModMenu;->addSeek(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;IIILjava/lang/String;)Landroid/widget/LinearLayout;

    .line 982
    new-instance v1, Lcom/trueaxis/modmenu/ModMenu$DisplayIconDrawable;

    .line 983
    const/16 v2, 0xde

    const/16 v3, 0xd8

    const/16 v4, 0xd2

    invoke-static {v4, v3, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v2

    invoke-direct {v1, v2}, Lcom/trueaxis/modmenu/ModMenu$DisplayIconDrawable;-><init>(I)V

    const-string v2, "Show display position sliders"

    new-instance v3, Lcom/trueaxis/modmenu/ModMenu$15;

    move-object/from16 v7, v16

    invoke-direct {v3, v7}, Lcom/trueaxis/modmenu/ModMenu$15;-><init>(Landroid/widget/LinearLayout;)V

    .line 982
    invoke-static {v0, v1, v2, v3}, Lcom/trueaxis/modmenu/ModMenu;->miniIconButton(Landroid/app/Activity;Landroid/graphics/drawable/Drawable;Ljava/lang/String;Landroid/view/View$OnClickListener;)Landroid/widget/Button;

    move-result-object v8

    .line 993
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v12, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v10, v8, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 996
    invoke-static {}, Lcom/trueaxis/modmenu/ModMenu;->fill()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v1

    invoke-virtual {v15, v10, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 998
    const-string v1, "Compares your run with the saved replay ghost when timing is available."

    .line 1000
    const/16 v2, 0xb2

    const/16 v3, 0xaa

    invoke-static {v3, v2, v9}, Landroid/graphics/Color;->rgb(III)I

    move-result v2

    .line 998
    const/16 v3, 0x9

    invoke-static {v0, v1, v3, v2}, Lcom/trueaxis/modmenu/ModMenu;->label(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v1

    .line 1001
    const/4 v2, 0x2

    invoke-static {v0, v2}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v2

    const/4 v3, 0x0

    invoke-virtual {v1, v3, v3, v3, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 1002
    invoke-virtual {v15, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 1004
    new-instance v9, Landroid/widget/LinearLayout;

    invoke-direct {v9, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 1005
    const/4 v1, 0x1

    invoke-virtual {v9, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 1006
    const/16 v1, 0xc

    invoke-static {v0, v1}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {v9, v1, v2, v2, v2}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 1008
    const-string v3, "Enable checkpoint/sector deltas vs saved replay ghost"

    const-string v4, "checkpoint_splits"

    new-instance v6, Lcom/trueaxis/modmenu/ModMenu$16;

    invoke-direct {v6, v0, v9, v7, v8}, Lcom/trueaxis/modmenu/ModMenu$16;-><init>(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    const/4 v5, 0x1

    move-object/from16 v1, p0

    move-object v2, v15

    invoke-static/range {v1 .. v6}, Lcom/trueaxis/modmenu/ModMenu;->addCheckBox(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/Runnable;)Landroid/widget/CheckBox;

    .line 1017
    const-string v1, "Show consecutive splits as an on-screen list"

    const-string v2, "split_list"

    const/4 v3, 0x1

    invoke-static {v0, v9, v1, v2, v3}, Lcom/trueaxis/modmenu/ModMenu;->addCheckBox(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Z)Landroid/widget/CheckBox;

    .line 1020
    const-string v1, "Use sector deltas instead of checkpoint deltas"

    const-string v2, "split_sector_delta"

    const/4 v3, 0x0

    invoke-static {v0, v9, v1, v2, v3}, Lcom/trueaxis/modmenu/ModMenu;->addCheckBox(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Z)Landroid/widget/CheckBox;

    .line 1024
    invoke-static {v0, v9, v7, v8}, Lcom/trueaxis/modmenu/ModMenu;->updateSplitOptionsVisibility(Landroid/content/Context;Landroid/view/View;Landroid/view/View;Landroid/view/View;)V

    .line 1025
    invoke-static {}, Lcom/trueaxis/modmenu/ModMenu;->fill()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v1

    invoke-virtual {v15, v9, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1026
    invoke-static {}, Lcom/trueaxis/modmenu/ModMenu;->fill()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v1

    invoke-virtual {v15, v7, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1028
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v2, -0x1

    invoke-direct {v1, v2, v12}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v13, v14, v1}, Landroid/widget/ScrollView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1031
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v3, 0x3f800000

    const/4 v4, 0x0

    invoke-direct {v1, v2, v4, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v11, v13, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1034
    const-string v1, "Start game"

    invoke-static {v0, v1}, Lcom/trueaxis/modmenu/ModMenu;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v1

    .line 1035
    const/high16 v2, 0x41600000

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setTextSize(F)V

    .line 1036
    const/high16 v2, -0x1000000

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setTextColor(I)V

    .line 1037
    const/16 v2, 0x80

    const/16 v3, 0xff

    const/4 v4, 0x0

    invoke-static {v3, v2, v4}, Landroid/graphics/Color;->rgb(III)I

    move-result v2

    const/16 v3, 0x8

    invoke-static {v0, v3}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v4

    int-to-float v4, v4

    invoke-static {v2, v4}, Lcom/trueaxis/modmenu/ModMenu;->background(IF)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1038
    const/16 v2, 0x10

    invoke-static {v0, v2}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v4

    const/16 v5, 0xa

    invoke-static {v0, v5}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v6

    invoke-static {v0, v2}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v2

    invoke-static {v0, v5}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v5

    invoke-virtual {v1, v4, v6, v2, v5}, Landroid/widget/Button;->setPadding(IIII)V

    .line 1039
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x1

    invoke-direct {v2, v4, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 1041
    invoke-static {v0, v3}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v3

    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 1042
    new-instance v3, Lcom/trueaxis/modmenu/ModMenu$17;
    :try_end_5df
    .catchall {:try_start_3e7 .. :try_end_5df} :catchall_628

    move-object/from16 v4, p1

    :try_start_5e1
    invoke-direct {v3, v4}, Lcom/trueaxis/modmenu/ModMenu$17;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v1, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1048
    invoke-virtual {v11, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1050
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 1051
    const/16 v2, 0x11

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 1052
    const/4 v2, 0x4

    invoke-static {v0, v2}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v2

    const/4 v3, 0x0

    invoke-virtual {v1, v3, v2, v3, v3}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 1053
    new-instance v2, Lcom/trueaxis/modmenu/ModMenu$BugIconDrawable;

    .line 1054
    const/16 v3, 0xb4

    const/16 v5, 0xbc

    const/16 v6, 0xc3

    invoke-static {v3, v5, v6}, Landroid/graphics/Color;->rgb(III)I

    move-result v3

    invoke-direct {v2, v3}, Lcom/trueaxis/modmenu/ModMenu$BugIconDrawable;-><init>(I)V

    const-string v3, "Upload debug logs"

    new-instance v5, Lcom/trueaxis/modmenu/ModMenu$18;

    invoke-direct {v5, v0}, Lcom/trueaxis/modmenu/ModMenu$18;-><init>(Landroid/app/Activity;)V

    .line 1053
    invoke-static {v0, v2, v3, v5}, Lcom/trueaxis/modmenu/ModMenu;->miniIconButton(Landroid/app/Activity;Landroid/graphics/drawable/Drawable;Ljava/lang/String;Landroid/view/View$OnClickListener;)Landroid/widget/Button;

    move-result-object v2

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v12, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1064
    invoke-virtual {v11, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 1066
    invoke-virtual {v0, v11}, Landroid/app/Activity;->setContentView(Landroid/view/View;)V
    :try_end_625
    .catchall {:try_start_5e1 .. :try_end_625} :catchall_626

    .line 1071
    goto :goto_642

    .line 1067
    :catchall_626
    move-exception v0

    goto :goto_631

    :catchall_628
    move-exception v0

    move-object/from16 v4, p1

    goto :goto_631

    :catchall_62c
    move-exception v0

    move-object/from16 v4, p1

    move-object/from16 v17, v10

    .line 1068
    :goto_631
    const-string v1, "YCS2Mod"

    const-string v2, "Could not show pre-launch mod menu"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1069
    const-string v1, "Could not show pre-launch mod menu; falling back to game"

    move-object/from16 v2, v17

    invoke-static {v2, v1, v0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1070
    invoke-interface/range {p1 .. p1}, Ljava/lang/Runnable;->run()V

    .line 1072
    :goto_642
    return-void
.end method

.method public static splitAlphaPercent(Landroid/content/Context;)I
    .registers 3

    .line 600
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->applyMenuDefaults(Landroid/content/Context;)V

    .line 601
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

    .line 483
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->applyMenuDefaults(Landroid/content/Context;)V

    .line 484
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

    .line 605
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->applyMenuDefaults(Landroid/content/Context;)V

    .line 606
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

    .line 610
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->applyMenuDefaults(Landroid/content/Context;)V

    .line 611
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

.method private static subCard(Landroid/content/Context;)Landroid/widget/LinearLayout;
    .registers 7

    .line 322
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 323
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 324
    const/16 v1, 0xc

    invoke-static {p0, v1}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v2

    const/16 v3, 0xa

    invoke-static {p0, v3}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-static {p0, v1}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v5

    invoke-static {p0, v3}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result v3

    invoke-virtual {v0, v2, v4, v5, v3}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 325
    const/16 v2, 0x21

    const/16 v3, 0x29

    const/16 v4, 0x1c

    invoke-static {v4, v2, v3}, Landroid/graphics/Color;->rgb(III)I

    move-result v2

    invoke-static {p0, v1}, Lcom/trueaxis/modmenu/ModMenu;->dp(Landroid/content/Context;I)I

    move-result p0

    int-to-float p0, p0

    invoke-static {v2, p0}, Lcom/trueaxis/modmenu/ModMenu;->background(IF)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/widget/LinearLayout;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 326
    return-object v0
.end method

.method public static swarmCatalogPaths(Landroid/content/Context;)[Ljava/lang/String;
    .registers 3

    .line 567
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "swarm_catalog_paths"

    const-string v1, ""

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 568
    if-eqz p0, :cond_1c

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_15

    goto :goto_1c

    .line 571
    :cond_15
    const-string v0, "\n"

    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 569
    :cond_1c
    :goto_1c
    const/4 p0, 0x0

    new-array p0, p0, [Ljava/lang/String;

    return-object p0
.end method

.method public static textureSize()I
    .registers 1

    .line 369
    const/16 v0, 0x200

    return v0
.end method

.method private static toast(Landroid/content/Context;Ljava/lang/String;)V
    .registers 3

    .line 432
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 433
    return-void
.end method

.method public static tracksideHeight(Landroid/content/Context;)I
    .registers 3

    .line 542
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "trackside_height"

    const/4 v1, 0x7

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    const/4 v0, 0x1

    const/16 v1, 0x28

    invoke-static {p0, v0, v1}, Lcom/trueaxis/modmenu/ModMenu;->clamp(III)I

    move-result p0

    return p0
.end method

.method public static tracksideMaxDist(Landroid/content/Context;)I
    .registers 4

    .line 552
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->tracksideMinDist(Landroid/content/Context;)I

    move-result v0

    .line 553
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v1, "trackside_max_dist"

    const/16 v2, 0x37

    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    const/16 v1, 0x14

    const/16 v2, 0x12c

    invoke-static {p0, v1, v2}, Lcom/trueaxis/modmenu/ModMenu;->clamp(III)I

    move-result p0

    .line 554
    add-int/lit8 v0, v0, 0xa

    invoke-static {p0, v0}, Ljava/lang/Math;->max(II)I

    move-result p0

    return p0
.end method

.method public static tracksideMinDist(Landroid/content/Context;)I
    .registers 3

    .line 547
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "trackside_min_dist"

    const/16 v1, 0x23

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    const/16 v0, 0xa

    const/16 v1, 0x96

    invoke-static {p0, v0, v1}, Lcom/trueaxis/modmenu/ModMenu;->clamp(III)I

    move-result p0

    return p0
.end method

.method public static tracksideSideDist(Landroid/content/Context;)I
    .registers 3

    .line 538
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "trackside_side_dist"

    const/16 v1, 0xb

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    const/4 v0, 0x2

    const/16 v1, 0x28

    invoke-static {p0, v0, v1}, Lcom/trueaxis/modmenu/ModMenu;->clamp(III)I

    move-result p0

    return p0
.end method

.method public static tracksideSideMode(Landroid/content/Context;)I
    .registers 3

    .line 534
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "trackside_side_mode"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    const/4 v0, 0x2

    invoke-static {p0, v1, v0}, Lcom/trueaxis/modmenu/ModMenu;->clamp(III)I

    move-result p0

    return p0
.end method

.method private static updateSeekLabel(Landroid/widget/TextView;Ljava/lang/String;ILjava/lang/String;)V
    .registers 5

    .line 1186
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

    .line 1187
    return-void
.end method

.method private static updateSplitOptionsVisibility(Landroid/content/Context;Landroid/view/View;Landroid/view/View;Landroid/view/View;)V
    .registers 7

    .line 1133
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->applyMenuDefaults(Landroid/content/Context;)V

    .line 1134
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "checkpoint_splits"

    const/4 v1, 0x1

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    .line 1135
    const/4 v0, 0x0

    const/16 v1, 0x8

    if-eqz p0, :cond_15

    const/4 v2, 0x0

    goto :goto_17

    :cond_15
    const/16 v2, 0x8

    :goto_17
    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 1136
    if-eqz p3, :cond_24

    .line 1137
    if-eqz p0, :cond_1f

    goto :goto_21

    :cond_1f
    const/16 v0, 0x8

    :goto_21
    invoke-virtual {p3, v0}, Landroid/view/View;->setVisibility(I)V

    .line 1139
    :cond_24
    if-nez p0, :cond_2b

    if-eqz p2, :cond_2b

    .line 1140
    invoke-virtual {p2, v1}, Landroid/view/View;->setVisibility(I)V

    .line 1142
    :cond_2b
    return-void
.end method

.method public static validateCustomLiveriesForGame(Landroid/content/Context;)V
    .registers 4

    .line 623
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModDebugLog;->install(Landroid/content/Context;)V

    .line 624
    const/4 v0, 0x0

    :goto_4
    sget-object v1, Lcom/trueaxis/modmenu/ModMenu;->CAR_TEXTURES:[Ljava/lang/String;

    array-length v1, v1

    if-ge v0, v1, :cond_20

    .line 625
    invoke-static {p0, v0}, Lcom/trueaxis/modmenu/ModMenu;->customTexture(Landroid/content/Context;I)Ljava/io/File;

    move-result-object v1

    const-string v2, "internal"

    invoke-static {v1, v0, v2}, Lcom/trueaxis/modmenu/ModMenu;->validateCustomLiveryFile(Ljava/io/File;ILjava/lang/String;)V

    .line 626
    invoke-static {p0, v0}, Lcom/trueaxis/modmenu/ModMenu;->externalTexture(Landroid/content/Context;I)Ljava/io/File;

    move-result-object v1

    .line 627
    if-eqz v1, :cond_1d

    const-string v2, "external"

    invoke-static {v1, v0, v2}, Lcom/trueaxis/modmenu/ModMenu;->validateCustomLiveryFile(Ljava/io/File;ILjava/lang/String;)V

    .line 624
    :cond_1d
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 629
    :cond_20
    return-void
.end method

.method private static validateCustomLiveryFile(Ljava/io/File;ILjava/lang/String;)V
    .registers 10

    .line 632
    const-string v0, " path="

    const-string v1, " car="

    const-string v2, "livery"

    if-eqz p0, :cond_c6

    invoke-virtual {p0}, Ljava/io/File;->isFile()Z

    move-result v3

    if-nez v3, :cond_10

    goto/16 :goto_c6

    .line 634
    :cond_10
    :try_start_10
    new-instance v3, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v3}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 635
    const/4 v4, 0x1

    iput-boolean v4, v3, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 636
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5, v3}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 637
    iget v5, v3, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    const/16 v6, 0x200

    if-ne v5, v6, :cond_2a

    iget v5, v3, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    if-ne v5, v6, :cond_2a

    goto :goto_2b

    :cond_2a
    const/4 v4, 0x0

    .line 638
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

    .line 639
    invoke-static {p1}, Lcom/trueaxis/modmenu/ModMenu;->carName(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 640
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

    .line 642
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

    .line 638
    invoke-static {v2, v3}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 644
    if-nez v4, :cond_90

    const-string v3, "invalid-size-or-decode"

    invoke-static {p0, p1, p2, v3}, Lcom/trueaxis/modmenu/ModMenu;->quarantineLivery(Ljava/io/File;ILjava/lang/String;Ljava/lang/String;)V
    :try_end_90
    .catchall {:try_start_10 .. :try_end_90} :catchall_91

    .line 649
    :cond_90
    goto :goto_c5

    .line 645
    :catchall_91
    move-exception v3

    .line 646
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "validate failed "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 647
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

    .line 646
    invoke-static {v2, v0, v3}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 648
    const-string v0, "exception"

    invoke-static {p0, p1, p2, v0}, Lcom/trueaxis/modmenu/ModMenu;->quarantineLivery(Ljava/io/File;ILjava/lang/String;Ljava/lang/String;)V

    .line 650
    :goto_c5
    return-void

    .line 632
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

    .line 1414
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

    .line 1415
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

    .line 1414
    const-string v1, "livery"

    invoke-static {v1, v0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 1416
    invoke-virtual {p0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    .line 1417
    if-eqz v0, :cond_ef

    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v2

    if-nez v2, :cond_4a

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v0

    if-eqz v0, :cond_ef

    .line 1420
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

    .line 1421
    nop

    .line 1423
    const/4 v2, 0x0

    :try_start_68
    new-instance v3, Ljava/io/FileOutputStream;

    invoke-direct {v3, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_6d
    .catchall {:try_start_68 .. :try_end_6d} :catchall_e1

    .line 1424
    :try_start_6d
    sget-object v4, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v5, 0x64

    invoke-virtual {p1, v4, v5, v3}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    move-result p1

    if-eqz p1, :cond_d6

    .line 1427
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->flush()V

    .line 1428
    invoke-static {v3}, Lcom/trueaxis/modmenu/ModMenu;->closeQuietly(Ljava/io/Closeable;)V
    :try_end_7d
    .catchall {:try_start_6d .. :try_end_7d} :catchall_de

    .line 1429
    nop

    .line 1430
    :try_start_7e
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result p1

    if-eqz p1, :cond_93

    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    move-result p1

    if-eqz p1, :cond_8b

    goto :goto_93

    .line 1431
    :cond_8b
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Could not replace old livery"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 1433
    :cond_93
    :goto_93
    invoke-virtual {v0, p0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result p1

    if-eqz p1, :cond_ce

    .line 1434
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

    .line 1435
    invoke-virtual {p0}, Ljava/io/File;->length()J

    move-result-wide v3

    invoke-virtual {p1, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 1434
    invoke-static {v1, p0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_c1
    .catchall {:try_start_7e .. :try_end_c1} :catchall_e1

    .line 1437
    invoke-static {v2}, Lcom/trueaxis/modmenu/ModMenu;->closeQuietly(Ljava/io/Closeable;)V

    .line 1438
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result p0

    if-eqz p0, :cond_cd

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 1440
    :cond_cd
    return-void

    .line 1433
    :cond_ce
    :try_start_ce
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Could not save livery"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_d6
    .catchall {:try_start_ce .. :try_end_d6} :catchall_e1

    .line 1425
    :cond_d6
    :try_start_d6
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Could not encode PNG"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_de
    .catchall {:try_start_d6 .. :try_end_de} :catchall_de

    .line 1437
    :catchall_de
    move-exception p0

    move-object v2, v3

    goto :goto_e2

    :catchall_e1
    move-exception p0

    :goto_e2
    invoke-static {v2}, Lcom/trueaxis/modmenu/ModMenu;->closeQuietly(Ljava/io/Closeable;)V

    .line 1438
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result p1

    if-eqz p1, :cond_ee

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 1439
    :cond_ee
    throw p0

    .line 1418
    :cond_ef
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Could not create livery folder"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static ycs2PrefixEnabled(Landroid/content/Context;)Z
    .registers 1

    .line 615
    const/4 p0, 0x0

    return p0
.end method
