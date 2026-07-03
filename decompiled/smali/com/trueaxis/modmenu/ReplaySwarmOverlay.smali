.class final Lcom/trueaxis/modmenu/ReplaySwarmOverlay;
.super Ljava/lang/Object;
.source "ReplaySwarmOverlay.java"


# static fields
.field private static final PATH_BUFFER:I = 0xc0

.field private static final POLL_MS:I = 0x1f4


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    return-void
.end method

.method static synthetic access$000(Landroid/app/Activity;I)V
    .registers 2

    .line 24
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->persistCatalog(Landroid/app/Activity;I)V

    return-void
.end method

.method static synthetic access$100(Landroid/app/Activity;Landroid/widget/TextView;)V
    .registers 2

    .line 24
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->showPicker(Landroid/app/Activity;Landroid/widget/TextView;)V

    return-void
.end method

.method static synthetic access$200(Landroid/app/Activity;Ljava/lang/String;)V
    .registers 2

    .line 24
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->toast(Landroid/app/Activity;Ljava/lang/String;)V

    return-void
.end method

.method private static dp(Landroid/app/Activity;I)I
    .registers 2

    .line 277
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
    .registers 8

    .line 32
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->replaySwarmEnabled(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_7

    .line 33
    return-void

    .line 35
    :cond_7
    const v0, 0x1020002

    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 36
    if-nez v0, :cond_13

    .line 37
    return-void

    .line 40
    :cond_13
    new-instance v1, Landroid/widget/Button;

    invoke-direct {v1, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 41
    const-string v2, "Swarm"

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 42
    const/high16 v2, 0x41300000

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setTextSize(F)V

    .line 43
    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Landroid/widget/Button;->setAllCaps(Z)V

    .line 44
    const/4 v3, -0x1

    invoke-virtual {v1, v3}, Landroid/widget/Button;->setTextColor(I)V

    .line 45
    const/16 v3, 0x5a

    const/16 v4, 0x78

    const/16 v5, 0x46

    invoke-static {v5, v3, v4}, Landroid/graphics/Color;->rgb(III)I

    move-result v3

    invoke-virtual {v1, v3}, Landroid/widget/Button;->setBackgroundColor(I)V

    .line 46
    const/16 v3, 0xa

    invoke-static {p0, v3}, Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->dp(Landroid/app/Activity;I)I

    move-result v4

    const/4 v5, 0x6

    invoke-static {p0, v5}, Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->dp(Landroid/app/Activity;I)I

    move-result v6

    invoke-static {p0, v3}, Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->dp(Landroid/app/Activity;I)I

    move-result v3

    invoke-static {p0, v5}, Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->dp(Landroid/app/Activity;I)I

    move-result v5

    invoke-virtual {v1, v4, v6, v3, v5}, Landroid/widget/Button;->setPadding(IIII)V

    .line 47
    const/16 v3, 0x8

    invoke-virtual {v1, v3}, Landroid/widget/Button;->setVisibility(I)V

    .line 49
    new-instance v4, Landroid/widget/TextView;

    invoke-direct {v4, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 50
    invoke-virtual {v4, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 51
    const/16 v2, 0xdc

    const/16 v5, 0xff

    const/16 v6, 0xb4

    invoke-static {v6, v2, v5}, Landroid/graphics/Color;->rgb(III)I

    move-result v2

    invoke-virtual {v4, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 52
    const/high16 v2, 0x40000000

    const/high16 v5, -0x1000000

    const/high16 v6, 0x3f800000

    invoke-virtual {v4, v2, v6, v6, v5}, Landroid/widget/TextView;->setShadowLayer(FFFI)V

    .line 53
    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 55
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v3, -0x2

    invoke-direct {v2, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 59
    const/16 v5, 0x35

    iput v5, v2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 60
    const/16 v5, 0xc

    invoke-static {p0, v5}, Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->dp(Landroid/app/Activity;I)I

    move-result v6

    iput v6, v2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 61
    invoke-static {p0, v5}, Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->dp(Landroid/app/Activity;I)I

    move-result v6

    iput v6, v2, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 63
    new-instance v6, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v6, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 67
    const/16 v3, 0x33

    iput v3, v6, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 68
    invoke-static {p0, v5}, Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->dp(Landroid/app/Activity;I)I

    move-result v3

    iput v3, v6, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 69
    invoke-static {p0, v5}, Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->dp(Landroid/app/Activity;I)I

    move-result v3

    iput v3, v6, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 71
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 72
    invoke-virtual {v0, v4, v6}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 73
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-lt v0, v2, :cond_b4

    .line 74
    const/high16 v0, 0x447a0000

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setTranslationZ(F)V

    .line 75
    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setTranslationZ(F)V

    .line 78
    :cond_b4
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v0, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 79
    const-string v2, "replay swarm overlay installed"

    invoke-static {v2}, Lcom/trueaxis/modmenu/ModDebugLog;->log(Ljava/lang/String;)V

    .line 80
    new-instance v2, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$1;

    invoke-direct {v2, p0, v1, v4, v0}, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$1;-><init>(Landroid/app/Activity;Landroid/widget/Button;Landroid/widget/TextView;Landroid/os/Handler;)V

    invoke-virtual {v0, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 136
    new-instance v0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$2;

    invoke-direct {v0, p0, v4}, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$2;-><init>(Landroid/app/Activity;Landroid/widget/TextView;)V

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 141
    return-void
.end method

.method private static persistCatalog(Landroid/app/Activity;I)V
    .registers 9

    .line 245
    if-gtz p1, :cond_3

    .line 246
    return-void

    .line 248
    :cond_3
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(I)V

    .line 249
    const/16 v1, 0xc0

    new-array v1, v1, [B

    .line 250
    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_e
    if-ge v3, p1, :cond_23

    .line 251
    invoke-static {v3, v1}, Lcom/trueaxis/modmenu/RequiredPatches;->readReplaySwarmCatalogPath(I[B)I

    move-result v4

    .line 252
    if-lez v4, :cond_20

    .line 253
    new-instance v5, Ljava/lang/String;

    sget-object v6, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v5, v1, v2, v4, v6}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 250
    :cond_20
    add-int/lit8 v3, v3, 0x1

    goto :goto_e

    .line 256
    :cond_23
    invoke-static {p0, v0}, Lcom/trueaxis/modmenu/ModMenu;->rememberSwarmCatalogPaths(Landroid/content/Context;Ljava/util/List;)V

    .line 257
    return-void
.end method

.method private static replayLabel(I[B)Ljava/lang/String;
    .registers 5

    .line 260
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/RequiredPatches;->readReplaySwarmCatalogPath(I[B)I

    move-result v0

    .line 261
    if-gtz v0, :cond_1c

    .line 262
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Replay "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    add-int/lit8 p0, p0, 0x1

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 264
    :cond_1c
    new-instance p0, Ljava/lang/String;

    const/4 v1, 0x0

    sget-object v2, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {p0, p1, v1, v0, v2}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 265
    const/16 p1, 0x2f

    invoke-virtual {p0, p1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result p1

    .line 266
    if-ltz p1, :cond_39

    add-int/lit8 p1, p1, 0x1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-ge p1, v0, :cond_39

    .line 267
    invoke-virtual {p0, p1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 269
    :cond_39
    return-object p0
.end method

.method private static showPicker(Landroid/app/Activity;Landroid/widget/TextView;)V
    .registers 18

    .line 144
    move-object/from16 v0, p0

    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readReplaySwarmCatalogCount()I

    move-result v1

    .line 145
    if-gtz v1, :cond_e

    .line 146
    const-string v1, "Open a replay first so the swarm catalog can populate."

    invoke-static {v0, v1}, Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->toast(Landroid/app/Activity;Ljava/lang/String;)V

    .line 147
    return-void

    .line 150
    :cond_e
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 151
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 152
    const/16 v4, 0x10

    invoke-static {v0, v4}, Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->dp(Landroid/app/Activity;I)I

    move-result v5

    const/16 v6, 0x8

    invoke-static {v0, v6}, Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->dp(Landroid/app/Activity;I)I

    move-result v7

    invoke-static {v0, v4}, Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->dp(Landroid/app/Activity;I)I

    move-result v4

    const/4 v8, 0x4

    invoke-static {v0, v8}, Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->dp(Landroid/app/Activity;I)I

    move-result v9

    invoke-virtual {v2, v5, v7, v4, v9}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 154
    new-instance v4, Landroid/widget/TextView;

    invoke-direct {v4, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 155
    const-string v5, "Pick one primary replay for the camera, then select additional replays to render as synced ghost cars. Watch them together here, or hit Race to race against the pack (enable race swarm in the mod menu)."

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 159
    const/high16 v5, 0x41300000

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextSize(F)V

    .line 160
    const v7, -0xbbbbbc

    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 161
    invoke-static {v0, v6}, Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->dp(Landroid/app/Activity;I)I

    move-result v6

    const/4 v7, 0x0

    invoke-virtual {v4, v7, v7, v7, v6}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 162
    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 164
    new-instance v4, Landroid/widget/ScrollView;

    invoke-direct {v4, v0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    .line 165
    new-instance v6, Landroid/widget/LinearLayout;

    invoke-direct {v6, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 166
    invoke-virtual {v6, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 167
    invoke-virtual {v4, v6}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    .line 168
    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    .line 169
    const/16 v10, 0xdc

    invoke-static {v0, v10}, Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->dp(Landroid/app/Activity;I)I

    move-result v10

    const/4 v11, -0x1

    invoke-direct {v9, v11, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 168
    invoke-virtual {v2, v4, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 171
    new-instance v4, Landroid/widget/RadioGroup;

    invoke-direct {v4, v0}, Landroid/widget/RadioGroup;-><init>(Landroid/content/Context;)V

    .line 172
    invoke-virtual {v4, v3}, Landroid/widget/RadioGroup;->setOrientation(I)V

    .line 173
    invoke-virtual {v6, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 174
    new-array v3, v1, [Landroid/widget/CheckBox;

    .line 175
    const/16 v9, 0xc0

    new-array v9, v9, [B

    .line 176
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readReplaySwarmPrimaryIndex()I

    move-result v10

    .line 177
    if-ltz v10, :cond_87

    if-lt v10, v1, :cond_88

    .line 178
    :cond_87
    const/4 v10, 0x0

    .line 181
    :cond_88
    const/4 v11, 0x0

    :goto_89
    if-ge v11, v1, :cond_e6

    .line 182
    invoke-static {v11, v9}, Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->replayLabel(I[B)Ljava/lang/String;

    move-result-object v12

    .line 184
    new-instance v13, Landroid/widget/RadioButton;

    invoke-direct {v13, v0}, Landroid/widget/RadioButton;-><init>(Landroid/content/Context;)V

    .line 185
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Primary: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Landroid/widget/RadioButton;->setText(Ljava/lang/CharSequence;)V

    .line 186
    invoke-virtual {v13, v11}, Landroid/widget/RadioButton;->setId(I)V

    .line 187
    invoke-virtual {v13, v5}, Landroid/widget/RadioButton;->setTextSize(F)V

    .line 188
    invoke-virtual {v4, v13}, Landroid/widget/RadioGroup;->addView(Landroid/view/View;)V

    .line 190
    new-instance v13, Landroid/widget/CheckBox;

    invoke-direct {v13, v0}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    .line 191
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Ghost overlay for "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v13, v12}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    .line 192
    invoke-virtual {v13, v5}, Landroid/widget/CheckBox;->setTextSize(F)V

    .line 193
    const/16 v12, 0xc

    invoke-static {v0, v12}, Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->dp(Landroid/app/Activity;I)I

    move-result v12

    invoke-static {v0, v8}, Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->dp(Landroid/app/Activity;I)I

    move-result v14

    invoke-virtual {v13, v12, v7, v7, v14}, Landroid/widget/CheckBox;->setPadding(IIII)V

    .line 194
    aput-object v13, v3, v11

    .line 195
    invoke-virtual {v6, v13}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 181
    add-int/lit8 v11, v11, 0x1

    goto :goto_89

    .line 197
    :cond_e6
    invoke-virtual {v4, v10}, Landroid/widget/RadioGroup;->check(I)V

    .line 199
    new-instance v5, Landroid/app/AlertDialog$Builder;

    invoke-direct {v5, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 200
    const-string v6, "Replay swarm"

    invoke-virtual {v5, v6}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    .line 201
    invoke-virtual {v5, v2}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 202
    const-string v5, "Cancel"

    const/4 v6, 0x0

    invoke-virtual {v2, v5, v6}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    new-instance v5, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$4;

    move-object/from16 v6, p1

    invoke-direct {v5, v6, v0}, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$4;-><init>(Landroid/widget/TextView;Landroid/app/Activity;)V

    .line 203
    const-string v6, "Clear"

    invoke-virtual {v2, v6, v5}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    new-instance v5, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$3;

    invoke-direct {v5, v4, v0, v1, v3}, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$3;-><init>(Landroid/widget/RadioGroup;Landroid/app/Activity;I[Landroid/widget/CheckBox;)V

    .line 210
    const-string v0, "Apply"

    invoke-virtual {v2, v0, v5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 240
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 241
    return-void
.end method

.method private static toast(Landroid/app/Activity;Ljava/lang/String;)V
    .registers 3

    .line 273
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 274
    return-void
.end method
