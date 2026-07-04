.class final Lcom/trueaxis/modmenu/ReplaySwarmOverlay;
.super Ljava/lang/Object;
.source "ReplaySwarmOverlay.java"


# static fields
.field private static final PATH_BUFFER:I = 0xc0

.field private static final POLL_MS:I = 0x1f4


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    return-void
.end method

.method static synthetic access$000(Landroid/app/Activity;I)V
    .registers 2

    .line 22
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->persistCatalog(Landroid/app/Activity;I)V

    return-void
.end method

.method static synthetic access$100(Landroid/app/Activity;Landroid/widget/TextView;)V
    .registers 2

    .line 22
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->showPicker(Landroid/app/Activity;Landroid/widget/TextView;)V

    return-void
.end method

.method static synthetic access$200(Landroid/app/Activity;Ljava/lang/String;)V
    .registers 2

    .line 22
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->toast(Landroid/app/Activity;Ljava/lang/String;)V

    return-void
.end method

.method private static dp(Landroid/app/Activity;I)I
    .registers 2

    .line 286
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

    .line 30
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->replaySwarmEnabled(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_7

    .line 31
    return-void

    .line 33
    :cond_7
    const v0, 0x1020002

    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 34
    if-nez v0, :cond_13

    .line 35
    return-void

    .line 38
    :cond_13
    new-instance v1, Landroid/widget/Button;

    invoke-direct {v1, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 39
    const-string v2, "Swarm"

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 40
    const/high16 v2, 0x41300000

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setTextSize(F)V

    .line 41
    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Landroid/widget/Button;->setAllCaps(Z)V

    .line 42
    const/4 v3, -0x1

    invoke-virtual {v1, v3}, Landroid/widget/Button;->setTextColor(I)V

    .line 43
    const/16 v3, 0x5a

    const/16 v4, 0x78

    const/16 v5, 0x46

    invoke-static {v5, v3, v4}, Landroid/graphics/Color;->rgb(III)I

    move-result v3

    invoke-virtual {v1, v3}, Landroid/widget/Button;->setBackgroundColor(I)V

    .line 44
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

    .line 45
    const/16 v3, 0x8

    invoke-virtual {v1, v3}, Landroid/widget/Button;->setVisibility(I)V

    .line 47
    new-instance v4, Landroid/widget/TextView;

    invoke-direct {v4, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 48
    invoke-virtual {v4, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 49
    const/16 v2, 0xdc

    const/16 v5, 0xff

    const/16 v6, 0xb4

    invoke-static {v6, v2, v5}, Landroid/graphics/Color;->rgb(III)I

    move-result v2

    invoke-virtual {v4, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 50
    const/high16 v2, 0x40000000

    const/high16 v5, -0x1000000

    const/high16 v6, 0x3f800000

    invoke-virtual {v4, v2, v6, v6, v5}, Landroid/widget/TextView;->setShadowLayer(FFFI)V

    .line 51
    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 53
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v3, -0x2

    invoke-direct {v2, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 57
    const/16 v5, 0x35

    iput v5, v2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 58
    const/16 v5, 0xc

    invoke-static {p0, v5}, Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->dp(Landroid/app/Activity;I)I

    move-result v6

    iput v6, v2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 59
    invoke-static {p0, v5}, Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->dp(Landroid/app/Activity;I)I

    move-result v6

    iput v6, v2, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 61
    new-instance v6, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v6, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 65
    const/16 v3, 0x33

    iput v3, v6, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 66
    invoke-static {p0, v5}, Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->dp(Landroid/app/Activity;I)I

    move-result v3

    iput v3, v6, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 67
    invoke-static {p0, v5}, Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->dp(Landroid/app/Activity;I)I

    move-result v3

    iput v3, v6, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 69
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 70
    invoke-virtual {v0, v4, v6}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 71
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-lt v0, v2, :cond_b4

    .line 72
    const/high16 v0, 0x447a0000

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setTranslationZ(F)V

    .line 73
    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setTranslationZ(F)V

    .line 76
    :cond_b4
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v0, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 77
    const-string v2, "replay swarm overlay installed"

    invoke-static {v2}, Lcom/trueaxis/modmenu/ModDebugLog;->log(Ljava/lang/String;)V

    .line 78
    new-instance v2, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$1;

    invoke-direct {v2, p0, v1, v4, v0}, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$1;-><init>(Landroid/app/Activity;Landroid/widget/Button;Landroid/widget/TextView;Landroid/os/Handler;)V

    invoke-virtual {v0, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 134
    new-instance v0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$2;

    invoke-direct {v0, p0, v4}, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$2;-><init>(Landroid/app/Activity;Landroid/widget/TextView;)V

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 146
    return-void
.end method

.method private static persistCatalog(Landroid/app/Activity;I)V
    .registers 9

    .line 251
    if-gtz p1, :cond_3

    .line 252
    return-void

    .line 254
    :cond_3
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(I)V

    .line 255
    const/16 v1, 0xc0

    new-array v1, v1, [B

    .line 256
    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_e
    if-ge v3, p1, :cond_27

    .line 257
    invoke-static {v3, v1}, Lcom/trueaxis/modmenu/RequiredPatches;->readReplaySwarmCatalogPath(I[B)I

    move-result v4

    .line 258
    if-lez v4, :cond_24

    .line 259
    new-instance v5, Ljava/lang/String;

    const-string v6, "UTF-8"

    invoke-static {v6}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v6

    invoke-direct {v5, v1, v2, v4, v6}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 256
    :cond_24
    add-int/lit8 v3, v3, 0x1

    goto :goto_e

    .line 262
    :cond_27
    invoke-static {p0, v0}, Lcom/trueaxis/modmenu/ModMenu;->rememberSwarmCatalogPaths(Landroid/content/Context;Ljava/util/List;)V

    .line 263
    return-void
.end method

.method private static replayLabel(I[B)Ljava/lang/String;
    .registers 6

    .line 266
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/RequiredPatches;->readReplaySwarmCatalogPath(I[B)I

    move-result v0

    .line 267
    const/4 v1, 0x1

    if-gtz v0, :cond_1c

    .line 268
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Replay "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    add-int/2addr p0, v1

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 270
    :cond_1c
    new-instance p0, Ljava/lang/String;

    const-string v2, "UTF-8"

    invoke-static {v2}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v2

    const/4 v3, 0x0

    invoke-direct {p0, p1, v3, v0, v2}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 271
    const/16 p1, 0x2f

    invoke-virtual {p0, p1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result p1

    .line 272
    if-ltz p1, :cond_3b

    add-int/2addr p1, v1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-ge p1, v0, :cond_3b

    .line 273
    invoke-virtual {p0, p1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 275
    :cond_3b
    const-string p1, "r\\d\\d\\.bin"

    invoke-virtual {p0, p1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_60

    .line 276
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Saved replay "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const/4 v0, 0x3

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 278
    :cond_60
    return-object p0
.end method

.method private static showPicker(Landroid/app/Activity;Landroid/widget/TextView;)V
    .registers 16

    .line 149
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readReplaySwarmCatalogCount()I

    move-result v0

    .line 150
    const-string v1, "OK"

    const/4 v2, 0x0

    if-gtz v0, :cond_22

    .line 151
    new-instance p1, Landroid/app/AlertDialog$Builder;

    invoke-direct {p1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 152
    const-string p0, "No replays found yet"

    invoke-virtual {p1, p0}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    .line 153
    const-string p1, "Finish a race (your replay saves automatically) or watch any replay once, then tap Swarm again. Found replays are remembered across sessions."

    invoke-virtual {p0, p1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    .line 156
    invoke-virtual {p0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    .line 157
    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 158
    return-void

    .line 161
    :cond_22
    new-instance v3, Landroid/widget/LinearLayout;

    invoke-direct {v3, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 162
    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 163
    const/16 v5, 0x10

    invoke-static {p0, v5}, Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->dp(Landroid/app/Activity;I)I

    move-result v6

    const/16 v7, 0x8

    invoke-static {p0, v7}, Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->dp(Landroid/app/Activity;I)I

    move-result v8

    invoke-static {p0, v5}, Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->dp(Landroid/app/Activity;I)I

    move-result v5

    const/4 v9, 0x4

    invoke-static {p0, v9}, Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->dp(Landroid/app/Activity;I)I

    move-result v10

    invoke-virtual {v3, v6, v8, v5, v10}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 165
    new-instance v5, Landroid/widget/TextView;

    invoke-direct {v5, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 166
    const-string v6, "The replay you are watching stays the camera car. Tick the replays to add as synced ghost cars (each gets its own colour), then Apply. To RACE the pack instead, enable race-vs-swarm in the mod menu, apply a selection here, and press Race."

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 171
    const/high16 v6, 0x41300000

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextSize(F)V

    .line 172
    const v6, -0xbbbbbc

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextColor(I)V

    .line 173
    invoke-static {p0, v7}, Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->dp(Landroid/app/Activity;I)I

    move-result v6

    const/4 v7, 0x0

    invoke-virtual {v5, v7, v7, v7, v6}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 174
    invoke-virtual {v3, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 176
    new-instance v5, Landroid/widget/ScrollView;

    invoke-direct {v5, p0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    .line 177
    new-instance v6, Landroid/widget/LinearLayout;

    invoke-direct {v6, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 178
    invoke-virtual {v6, v4}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 179
    invoke-virtual {v5, v6}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    .line 180
    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    .line 181
    const/16 v10, 0xdc

    invoke-static {p0, v10}, Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->dp(Landroid/app/Activity;I)I

    move-result v10

    const/4 v11, -0x1

    invoke-direct {v8, v11, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 180
    invoke-virtual {v3, v5, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 183
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readReplaySwarmPrimaryIndex()I

    move-result v5

    .line 184
    if-gez v5, :cond_a1

    .line 185
    new-instance p1, Landroid/app/AlertDialog$Builder;

    invoke-direct {p1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 186
    const-string p0, "Open a replay first"

    invoke-virtual {p1, p0}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    .line 187
    const-string p1, "Pick the swarm while WATCHING a replay: open View Replay on a level, then tap Swarm during playback."

    invoke-virtual {p0, p1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    .line 189
    invoke-virtual {p0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    .line 190
    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 191
    return-void

    .line 193
    :cond_a1
    new-array v1, v0, [Landroid/widget/CheckBox;

    .line 194
    const/16 v8, 0xc0

    new-array v8, v8, [B

    .line 195
    const/4 v10, 0x0

    :goto_a8
    if-ge v10, v0, :cond_eb

    .line 196
    new-instance v11, Landroid/widget/CheckBox;

    invoke-direct {v11, p0}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    .line 197
    invoke-static {v10, v8}, Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->replayLabel(I[B)Ljava/lang/String;

    move-result-object v12

    .line 198
    if-ne v10, v5, :cond_c8

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " (watching now)"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    :cond_c8
    invoke-virtual {v11, v12}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    .line 199
    if-eq v10, v5, :cond_cf

    const/4 v12, 0x1

    goto :goto_d0

    :cond_cf
    const/4 v12, 0x0

    :goto_d0
    invoke-virtual {v11, v12}, Landroid/widget/CheckBox;->setEnabled(Z)V

    .line 200
    const/high16 v12, 0x41400000

    invoke-virtual {v11, v12}, Landroid/widget/CheckBox;->setTextSize(F)V

    .line 201
    invoke-static {p0, v9}, Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->dp(Landroid/app/Activity;I)I

    move-result v12

    invoke-static {p0, v9}, Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->dp(Landroid/app/Activity;I)I

    move-result v13

    invoke-virtual {v11, v12, v7, v7, v13}, Landroid/widget/CheckBox;->setPadding(IIII)V

    .line 202
    aput-object v11, v1, v10

    .line 203
    invoke-virtual {v6, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 195
    add-int/lit8 v10, v10, 0x1

    goto :goto_a8

    .line 206
    :cond_eb
    new-instance v4, Landroid/app/AlertDialog$Builder;

    invoke-direct {v4, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 207
    const-string v6, "Replay swarm \u2014 pick ghost replays"

    invoke-virtual {v4, v6}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    .line 208
    invoke-virtual {v4, v3}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    .line 209
    const-string v4, "Cancel"

    invoke-virtual {v3, v4, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    new-instance v3, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$4;

    invoke-direct {v3, p1, p0}, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$4;-><init>(Landroid/widget/TextView;Landroid/app/Activity;)V

    .line 210
    const-string p1, "Clear"

    invoke-virtual {v2, p1, v3}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    new-instance v2, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$3;

    invoke-direct {v2, v0, v5, v1, p0}, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$3;-><init>(II[Landroid/widget/CheckBox;Landroid/app/Activity;)V

    .line 217
    const-string p0, "Apply"

    invoke-virtual {p1, p0, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    .line 246
    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 247
    return-void
.end method

.method private static toast(Landroid/app/Activity;Ljava/lang/String;)V
    .registers 3

    .line 282
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 283
    return-void
.end method
