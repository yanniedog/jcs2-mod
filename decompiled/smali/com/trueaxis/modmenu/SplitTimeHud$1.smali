.class Lcom/trueaxis/modmenu/SplitTimeHud$1;
.super Ljava/lang/Object;
.source "SplitTimeHud.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/modmenu/SplitTimeHud;->install(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private disabled:Z

.field private lastCheckpointCount:I

.field private loggedGhostCheckpointCount:I

.field private loggedReplayLoadCount:I

.field private nextArmedDiagnosticAt:J

.field private final splitHistory:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/trueaxis/modmenu/SplitTimeHud$SplitEntry;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic val$activity:Landroid/app/Activity;

.field final synthetic val$handler:Landroid/os/Handler;

.field final synthetic val$split:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Landroid/app/Activity;Landroid/widget/TextView;Landroid/os/Handler;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 70
    iput-object p1, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->val$activity:Landroid/app/Activity;

    iput-object p2, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->val$split:Landroid/widget/TextView;

    iput-object p3, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->val$handler:Landroid/os/Handler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 76
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->splitHistory:Ljava/util/ArrayList;

    return-void
.end method

.method private applyLayoutOptions(Landroid/widget/TextView;)V
    .registers 6

    .line 251
    iget-object v0, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->val$activity:Landroid/app/Activity;

    invoke-static {v0}, Lcom/trueaxis/modmenu/ModMenu;->splitAlphaPercent(Landroid/content/Context;)I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x42c80000

    div-float/2addr v0, v1

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setAlpha(F)V

    .line 252
    invoke-virtual {p1}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 253
    instance-of v1, v0, Landroid/widget/FrameLayout$LayoutParams;

    if-eqz v1, :cond_3e

    .line 254
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 255
    iget-object v1, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->val$activity:Landroid/app/Activity;

    iget-object v2, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->val$activity:Landroid/app/Activity;

    invoke-static {v2}, Lcom/trueaxis/modmenu/ModMenu;->splitXdp(Landroid/content/Context;)I

    move-result v2

    # invokes: Lcom/trueaxis/modmenu/SplitTimeHud;->dp(Landroid/app/Activity;I)I
    invoke-static {v1, v2}, Lcom/trueaxis/modmenu/SplitTimeHud;->access$100(Landroid/app/Activity;I)I

    move-result v1

    .line 256
    iget-object v2, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->val$activity:Landroid/app/Activity;

    iget-object v3, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->val$activity:Landroid/app/Activity;

    invoke-static {v3}, Lcom/trueaxis/modmenu/ModMenu;->splitYdp(Landroid/content/Context;)I

    move-result v3

    # invokes: Lcom/trueaxis/modmenu/SplitTimeHud;->dp(Landroid/app/Activity;I)I
    invoke-static {v2, v3}, Lcom/trueaxis/modmenu/SplitTimeHud;->access$100(Landroid/app/Activity;I)I

    move-result v2

    .line 257
    iget v3, v0, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    if-ne v3, v1, :cond_37

    iget v3, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    if-eq v3, v2, :cond_3e

    .line 258
    :cond_37
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 259
    iput v2, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 260
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 263
    :cond_3e
    return-void
.end method

.method private displayText(Ljava/lang/String;)Ljava/lang/CharSequence;
    .registers 7

    .line 235
    iget-object v0, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->val$activity:Landroid/app/Activity;

    invoke-static {v0}, Lcom/trueaxis/modmenu/ModMenu;->splitListEnabled(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_4b

    iget-object v0, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->splitHistory:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_11

    goto :goto_4b

    .line 238
    :cond_11
    new-instance p1, Landroid/text/SpannableStringBuilder;

    const-string v0, "SPLITS"

    invoke-direct {p1, v0}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 239
    const/4 v0, 0x0

    :goto_19
    iget-object v1, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->splitHistory:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_4a

    .line 240
    iget-object v1, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->splitHistory:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trueaxis/modmenu/SplitTimeHud$SplitEntry;

    .line 241
    const/16 v2, 0xa

    invoke-virtual {p1, v2}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    .line 242
    invoke-virtual {p1}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v2

    .line 243
    iget-object v3, v1, Lcom/trueaxis/modmenu/SplitTimeHud$SplitEntry;->line:Ljava/lang/String;

    invoke-virtual {p1, v3}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 244
    new-instance v3, Landroid/text/style/ForegroundColorSpan;

    iget v1, v1, Lcom/trueaxis/modmenu/SplitTimeHud$SplitEntry;->color:I

    invoke-direct {v3, v1}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-virtual {p1}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v1

    const/16 v4, 0x21

    invoke-virtual {p1, v3, v2, v1, v4}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 239
    add-int/lit8 v0, v0, 0x1

    goto :goto_19

    .line 247
    :cond_4a
    return-object p1

    .line 236
    :cond_4b
    :goto_4b
    const-string v0, "SPLIT"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_54

    goto :goto_67

    :cond_54
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SPLIT "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :goto_67
    return-object p1
.end method

.method private liveArrayTrace(I)Ljava/lang/String;
    .registers 8

    .line 315
    const/4 v0, 0x0

    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    move-result v1

    const/16 v2, 0xc

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 316
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "["

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 317
    nop

    :goto_13
    if-ge v0, v1, :cond_31

    .line 318
    if-lez v0, :cond_1c

    const/16 v3, 0x2c

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 319
    :cond_1c
    add-int/lit8 v3, v0, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const/16 v5, 0x3a

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 320
    invoke-static {v0}, Lcom/trueaxis/modmenu/RequiredPatches;->readSplitLiveArrayMillis(I)I

    move-result v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 317
    move v0, v3

    goto :goto_13

    .line 322
    :cond_31
    if-le p1, v1, :cond_38

    const-string p1, ",..."

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 323
    :cond_38
    const/16 p1, 0x5d

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 324
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private logArmedDiagnostics(Ljava/lang/String;)V
    .registers 16

    .line 278
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 279
    iget-wide v2, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->nextArmedDiagnosticAt:J

    cmp-long v4, v0, v2

    if-gez v4, :cond_b

    return-void

    .line 280
    :cond_b
    const-string v2, "waiting"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_16

    const-wide/16 v2, 0x2710

    goto :goto_18

    :cond_16
    const-wide/16 v2, 0x7d0

    :goto_18
    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->nextArmedDiagnosticAt:J

    .line 281
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 284
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readSplitLiveCheckpointCount()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 285
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readSplitGhostCheckpointCount()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 286
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readSplitGhostSize()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 287
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readSplitShowReplayFlag()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    .line 288
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readSplitScannedCheckpointIndex()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    .line 289
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readSplitDecodedEngineCheckpointIndex()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    .line 290
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readSplitEngineLastCheckpointIndex()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    .line 291
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readSplitResolvedCheckpoint()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    .line 292
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readSplitLastCheckpointMillis()I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    .line 293
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readSplitLastReplaySize()I

    move-result v10

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    .line 294
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readSplitReplayVisualMillis()I

    move-result v11

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    const/16 v12, 0xc

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    aput-object p1, v12, v13

    const/4 p1, 0x1

    aput-object v1, v12, p1

    const/4 p1, 0x2

    aput-object v2, v12, p1

    const/4 p1, 0x3

    aput-object v3, v12, p1

    const/4 p1, 0x4

    aput-object v4, v12, p1

    const/4 p1, 0x5

    aput-object v5, v12, p1

    const/4 p1, 0x6

    aput-object v6, v12, p1

    const/4 p1, 0x7

    aput-object v7, v12, p1

    const/16 p1, 0x8

    aput-object v8, v12, p1

    const/16 p1, 0x9

    aput-object v9, v12, p1

    const/16 p1, 0xa

    aput-object v10, v12, p1

    const/16 p1, 0xb

    aput-object v11, v12, p1

    .line 281
    const-string p1, "split armed reason=%s live_count=%d ghost_count=%d ghost_size=%d show_replay=%d scanned_checkpoint=%d decoded_engine_checkpoint=%d engine_checkpoint=%d selected_checkpoint=%d last_checkpoint_ms=%d last_replay_size=%d replay_visual_ms=%d"

    invoke-static {v0, p1, v12}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/trueaxis/modmenu/ModDebugLog;->log(Ljava/lang/String;)V

    .line 295
    return-void
.end method

.method private logGhostCheckpoints(I)V
    .registers 11

    .line 298
    nop

    .line 299
    if-lez p1, :cond_c

    add-int/lit8 v0, p1, 0x1

    .line 300
    invoke-static {v0}, Lcom/trueaxis/modmenu/RequiredPatches;->readGhostCheckpointMillis(I)I

    move-result v1

    if-lez v1, :cond_c

    .line 301
    goto :goto_d

    .line 303
    :cond_c
    move v0, p1

    :goto_d
    iget v1, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->loggedGhostCheckpointCount:I

    if-gt v0, v1, :cond_12

    return-void

    .line 304
    :cond_12
    iget v1, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->loggedGhostCheckpointCount:I

    const/4 v2, 0x1

    add-int/2addr v1, v2

    .line 305
    :goto_16
    if-gt v1, v0, :cond_44

    .line 306
    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 308
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v1}, Lcom/trueaxis/modmenu/RequiredPatches;->readGhostCheckpointMillis(I)I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    .line 309
    if-le v1, p1, :cond_2b

    const-string v6, "true"

    goto :goto_2d

    :cond_2b
    const-string v6, "false"

    :goto_2d
    const/4 v7, 0x3

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object v4, v7, v8

    aput-object v5, v7, v2

    const/4 v4, 0x2

    aput-object v6, v7, v4

    .line 306
    const-string v4, "ghost checkpoint=%d ghost_ms=%d finish=%s"

    invoke-static {v3, v4, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/trueaxis/modmenu/ModDebugLog;->log(Ljava/lang/String;)V

    .line 305
    add-int/lit8 v1, v1, 0x1

    goto :goto_16

    .line 311
    :cond_44
    iput v0, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->loggedGhostCheckpointCount:I

    .line 312
    return-void
.end method

.method private officialGhostArrayTrace(I)Ljava/lang/String;
    .registers 8

    .line 328
    const/4 v0, 0x0

    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    move-result v1

    const/16 v2, 0xc

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 329
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "["

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 330
    nop

    :goto_13
    if-ge v0, v1, :cond_31

    .line 331
    if-lez v0, :cond_1c

    const/16 v3, 0x2c

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 332
    :cond_1c
    add-int/lit8 v3, v0, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const/16 v5, 0x3a

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 333
    invoke-static {v0}, Lcom/trueaxis/modmenu/RequiredPatches;->readSplitOfficialGhostArrayMillis(I)I

    move-result v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 330
    move v0, v3

    goto :goto_13

    .line 335
    :cond_31
    if-le p1, v1, :cond_38

    const-string p1, ",..."

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 336
    :cond_38
    const/16 p1, 0x5d

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 337
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private poll()V
    .registers 9

    .line 90
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readLatestCheckpointSplit()J

    move-result-wide v0

    .line 91
    const/16 v2, 0x20

    ushr-long v2, v0, v2

    long-to-int v3, v2

    .line 92
    long-to-int v1, v0

    .line 93
    const-wide/16 v4, 0xc8

    const/4 v0, 0x0

    if-nez v3, :cond_27

    .line 94
    iput v0, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->lastCheckpointCount:I

    .line 95
    iput v0, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->loggedGhostCheckpointCount:I

    .line 96
    iput v0, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->loggedReplayLoadCount:I

    .line 97
    iget-object v0, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->splitHistory:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 98
    iget-object v0, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->val$split:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 99
    iget-object v0, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->val$handler:Landroid/os/Handler;

    invoke-virtual {v0, p0, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 100
    return-void

    .line 103
    :cond_27
    iget-object v2, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->val$split:Landroid/widget/TextView;

    invoke-direct {p0, v2}, Lcom/trueaxis/modmenu/SplitTimeHud$1;->applyLayoutOptions(Landroid/widget/TextView;)V

    .line 104
    add-int/lit8 v3, v3, -0x1

    .line 105
    const-string v2, "SPLIT --"

    if-nez v3, :cond_67

    iget-object v6, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->val$split:Landroid/widget/TextView;

    invoke-virtual {v6}, Landroid/widget/TextView;->getVisibility()I

    move-result v6

    if-eqz v6, :cond_67

    .line 106
    iget-object v6, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->val$split:Landroid/widget/TextView;

    invoke-direct {p0, v2}, Lcom/trueaxis/modmenu/SplitTimeHud$1;->displayText(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 107
    iget-object v6, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->val$split:Landroid/widget/TextView;

    # getter for: Lcom/trueaxis/modmenu/SplitTimeHud;->SPLIT_READY:I
    invoke-static {}, Lcom/trueaxis/modmenu/SplitTimeHud;->access$000()I

    move-result v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 108
    iget-object v6, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->val$split:Landroid/widget/TextView;

    invoke-virtual {v6}, Landroid/widget/TextView;->bringToFront()V

    .line 109
    iget-object v6, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->val$split:Landroid/widget/TextView;

    invoke-virtual {v6, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 110
    const-string v6, "armed"

    invoke-direct {p0, v6}, Lcom/trueaxis/modmenu/SplitTimeHud$1;->logArmedDiagnostics(Ljava/lang/String;)V

    .line 111
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readSplitGhostCheckpointCount()I

    move-result v6

    invoke-direct {p0, v6}, Lcom/trueaxis/modmenu/SplitTimeHud$1;->logGhostCheckpoints(I)V

    .line 112
    const-string v6, "split HUD armed for raced replay ghost"

    invoke-static {v6}, Lcom/trueaxis/modmenu/ModDebugLog;->log(Ljava/lang/String;)V

    .line 115
    :cond_67
    iget v6, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->lastCheckpointCount:I

    if-ge v3, v6, :cond_af

    .line 116
    iput v3, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->lastCheckpointCount:I

    .line 117
    iget-object v1, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->splitHistory:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 118
    if-nez v3, :cond_76

    .line 119
    iput v0, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->loggedGhostCheckpointCount:I

    .line 121
    :cond_76
    iget-object v1, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->val$split:Landroid/widget/TextView;

    invoke-direct {p0, v2}, Lcom/trueaxis/modmenu/SplitTimeHud$1;->displayText(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 122
    iget-object v1, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->val$split:Landroid/widget/TextView;

    # getter for: Lcom/trueaxis/modmenu/SplitTimeHud;->SPLIT_READY:I
    invoke-static {}, Lcom/trueaxis/modmenu/SplitTimeHud;->access$000()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 123
    iget-object v1, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->val$split:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->bringToFront()V

    .line 124
    iget-object v1, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->val$split:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 125
    const-string v0, "reset"

    invoke-direct {p0, v0}, Lcom/trueaxis/modmenu/SplitTimeHud$1;->logArmedDiagnostics(Ljava/lang/String;)V

    .line 126
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "split checkpoint counter reset count="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/trueaxis/modmenu/ModDebugLog;->log(Ljava/lang/String;)V

    goto/16 :goto_147

    .line 127
    :cond_af
    iget v6, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->lastCheckpointCount:I

    add-int/lit8 v6, v6, 0x1

    if-le v3, v6, :cond_12a

    .line 128
    iget-object v6, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->splitHistory:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_100

    .line 131
    iput v0, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->lastCheckpointCount:I

    .line 132
    iget-object v1, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->val$split:Landroid/widget/TextView;

    invoke-direct {p0, v2}, Lcom/trueaxis/modmenu/SplitTimeHud$1;->displayText(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 133
    iget-object v1, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->val$split:Landroid/widget/TextView;

    # getter for: Lcom/trueaxis/modmenu/SplitTimeHud;->SPLIT_READY:I
    invoke-static {}, Lcom/trueaxis/modmenu/SplitTimeHud;->access$000()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 134
    iget-object v1, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->val$split:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->bringToFront()V

    .line 135
    iget-object v1, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->val$split:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 136
    const-string v0, "jump"

    invoke-direct {p0, v0}, Lcom/trueaxis/modmenu/SplitTimeHud$1;->logArmedDiagnostics(Ljava/lang/String;)V

    .line 137
    iget v0, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->loggedReplayLoadCount:I

    if-eq v0, v3, :cond_147

    .line 138
    iput v3, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->loggedReplayLoadCount:I

    .line 139
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "split replay-load checkpoint data armed count="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/trueaxis/modmenu/ModDebugLog;->log(Ljava/lang/String;)V

    .line 140
    invoke-direct {p0, v3}, Lcom/trueaxis/modmenu/SplitTimeHud$1;->logGhostCheckpoints(I)V

    goto :goto_147

    .line 143
    :cond_100
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "split checkpoint jump accepted from="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v2, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->lastCheckpointCount:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " to="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/trueaxis/modmenu/ModDebugLog;->log(Ljava/lang/String;)V

    .line 145
    iput v3, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->lastCheckpointCount:I

    .line 146
    iget-object v0, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->val$split:Landroid/widget/TextView;

    invoke-direct {p0, v0, v3, v1}, Lcom/trueaxis/modmenu/SplitTimeHud$1;->showSplit(Landroid/widget/TextView;II)V

    goto :goto_147

    .line 148
    :cond_12a
    iget v0, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->lastCheckpointCount:I

    if-le v3, v0, :cond_138

    .line 149
    iput v3, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->lastCheckpointCount:I

    .line 150
    if-lez v3, :cond_147

    .line 151
    iget-object v0, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->val$split:Landroid/widget/TextView;

    invoke-direct {p0, v0, v3, v1}, Lcom/trueaxis/modmenu/SplitTimeHud$1;->showSplit(Landroid/widget/TextView;II)V

    goto :goto_147

    .line 153
    :cond_138
    if-nez v3, :cond_147

    iget-object v0, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->val$split:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_147

    .line 154
    const-string v0, "waiting"

    invoke-direct {p0, v0}, Lcom/trueaxis/modmenu/SplitTimeHud$1;->logArmedDiagnostics(Ljava/lang/String;)V

    .line 156
    :cond_147
    :goto_147
    iget-object v0, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->val$handler:Landroid/os/Handler;

    invoke-virtual {v0, p0, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 157
    return-void
.end method

.method private previousCumulativeSplitMillis(I)I
    .registers 5

    .line 220
    iget-object v0, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->splitHistory:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_8
    if-ltz v0, :cond_1c

    .line 221
    iget-object v1, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->splitHistory:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trueaxis/modmenu/SplitTimeHud$SplitEntry;

    .line 222
    iget v2, v1, Lcom/trueaxis/modmenu/SplitTimeHud$SplitEntry;->checkpoint:I

    if-ne v2, p1, :cond_19

    iget p1, v1, Lcom/trueaxis/modmenu/SplitTimeHud$SplitEntry;->cumulativeMillis:I

    return p1

    .line 220
    :cond_19
    add-int/lit8 v0, v0, -0x1

    goto :goto_8

    .line 224
    :cond_1c
    const/high16 p1, -0x80000000

    return p1
.end method

.method private sectorSplitMillis(II)I
    .registers 4

    .line 213
    add-int/lit8 p1, p1, -0x1

    invoke-direct {p0, p1}, Lcom/trueaxis/modmenu/SplitTimeHud$1;->previousCumulativeSplitMillis(I)I

    move-result p1

    .line 214
    const/high16 v0, -0x80000000

    if-ne p1, v0, :cond_b

    .line 215
    goto :goto_c

    .line 216
    :cond_b
    sub-int/2addr p2, p1

    .line 214
    :goto_c
    return p2
.end method

.method private showSplit(Landroid/widget/TextView;II)V
    .registers 44

    .line 160
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    move/from16 v3, p3

    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readSplitGhostCheckpointCount()I

    move-result v4

    .line 161
    const/4 v5, 0x1

    const/4 v6, 0x0

    if-le v2, v4, :cond_18

    .line 162
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readSplitReplayHeaderFinishMillis()I

    move-result v7

    if-lez v7, :cond_18

    const/4 v7, 0x1

    goto :goto_19

    :cond_18
    const/4 v7, 0x0

    .line 163
    :goto_19
    iget-object v8, v0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->val$activity:Landroid/app/Activity;

    invoke-static {v8}, Lcom/trueaxis/modmenu/ModMenu;->sectorSplitsEnabled(Landroid/content/Context;)Z

    move-result v8

    .line 164
    if-eqz v8, :cond_26

    .line 165
    invoke-direct {v0, v2, v3}, Lcom/trueaxis/modmenu/SplitTimeHud$1;->sectorSplitMillis(II)I

    move-result v9

    goto :goto_27

    .line 166
    :cond_26
    move v9, v3

    .line 167
    :goto_27
    invoke-direct {v0, v2, v9, v8}, Lcom/trueaxis/modmenu/SplitTimeHud$1;->splitLine(IIZ)Ljava/lang/String;

    move-result-object v10

    .line 168
    invoke-direct {v0, v9}, Lcom/trueaxis/modmenu/SplitTimeHud$1;->splitColor(I)I

    move-result v11

    .line 169
    iget-object v12, v0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->splitHistory:Ljava/util/ArrayList;

    new-instance v13, Lcom/trueaxis/modmenu/SplitTimeHud$SplitEntry;

    invoke-direct {v13, v10, v11, v2, v3}, Lcom/trueaxis/modmenu/SplitTimeHud$SplitEntry;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v12, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 170
    :goto_39
    iget-object v12, v0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->splitHistory:Ljava/util/ArrayList;

    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    move-result v12

    const/16 v13, 0x8

    if-le v12, v13, :cond_49

    iget-object v12, v0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->splitHistory:Ljava/util/ArrayList;

    invoke-virtual {v12, v6}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_39

    .line 171
    :cond_49
    invoke-direct {v0, v10}, Lcom/trueaxis/modmenu/SplitTimeHud$1;->displayText(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v10

    invoke-virtual {v1, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 172
    iget-object v10, v0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->val$activity:Landroid/app/Activity;

    invoke-static {v10}, Lcom/trueaxis/modmenu/ModMenu;->splitListEnabled(Landroid/content/Context;)Z

    move-result v10

    if-eqz v10, :cond_5c

    # getter for: Lcom/trueaxis/modmenu/SplitTimeHud;->SPLIT_READY:I
    invoke-static {}, Lcom/trueaxis/modmenu/SplitTimeHud;->access$000()I

    move-result v11

    :cond_5c
    invoke-virtual {v1, v11}, Landroid/widget/TextView;->setTextColor(I)V

    .line 173
    invoke-virtual/range {p1 .. p1}, Landroid/widget/TextView;->bringToFront()V

    .line 174
    invoke-virtual {v1, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 175
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readLatestCheckpointCurrentMillis()I

    move-result v1

    .line 176
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readLatestCheckpointGhostMillis()I

    move-result v10

    .line 177
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readSplitLastCheckpointMillis()I

    move-result v11

    .line 178
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readSplitEngineLastCheckpointIndex()I

    move-result v12

    .line 179
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readSplitLiveCheckpointCount()I

    move-result v14

    .line 180
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readSplitOfficialGhostCheckpointCount()I

    move-result v15

    .line 181
    sget-object v13, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 183
    invoke-static/range {p2 .. p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    invoke-static/range {p3 .. p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 184
    if-eqz v8, :cond_98

    const-string v8, "sector"

    goto :goto_9a

    :cond_98
    const-string v8, "checkpoint"

    :goto_9a
    if-eqz v7, :cond_9f

    const-string v7, "true"

    goto :goto_a1

    :cond_9f
    const-string v7, "false"

    .line 185
    :goto_a1
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readSplitScannedCheckpointIndex()I

    move-result v18

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    .line 186
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readSplitDecodedEngineCheckpointIndex()I

    move-result v19

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v19

    .line 187
    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readSplitResolvedCheckpoint()I

    move-result v20

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    .line 188
    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v21

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v22

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    add-int/lit8 v24, v2, -0x1

    .line 189
    invoke-static/range {v24 .. v24}, Lcom/trueaxis/modmenu/RequiredPatches;->readSplitLiveArrayMillis(I)I

    move-result v25

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    add-int/2addr v4, v2

    sub-int/2addr v4, v5

    .line 190
    invoke-static {v4}, Lcom/trueaxis/modmenu/RequiredPatches;->readSplitLiveArrayMillis(I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 192
    invoke-static/range {v24 .. v24}, Lcom/trueaxis/modmenu/RequiredPatches;->readSplitOfficialGhostArrayMillis(I)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    .line 193
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readSplitReplayHeaderSize()I

    move-result v24

    invoke-static/range {v24 .. v24}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v24

    .line 194
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readSplitReplayHeaderCheckpointCount()I

    move-result v26

    invoke-static/range {v26 .. v26}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v26

    .line 195
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readSplitReplayHeaderFinishMillis()I

    move-result v27

    invoke-static/range {v27 .. v27}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v27

    .line 196
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readSplitGhostPos()I

    move-result v28

    invoke-static/range {v28 .. v28}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v28

    .line 197
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readSplitLastGhostPos()I

    move-result v29

    invoke-static/range {v29 .. v29}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v29

    .line 198
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readSplitLastReplaySize()I

    move-result v30

    invoke-static/range {v30 .. v30}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v30

    .line 199
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readSplitReplayVisualMillis()I

    move-result v31

    invoke-static/range {v31 .. v31}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v31

    .line 200
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readSplitGhostVisualMillis()I

    move-result v32

    invoke-static/range {v32 .. v32}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v32

    .line 201
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readSplitVisualDeltaMillis()I

    move-result v33

    invoke-static/range {v33 .. v33}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v33

    .line 202
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readSplitGhostCheckpointDistanceSq1000()I

    move-result v34

    invoke-static/range {v34 .. v34}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v34

    .line 203
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readSplitGhostRetrySkipIndex()I

    move-result v35

    invoke-static/range {v35 .. v35}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v35

    .line 204
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readSplitLastGhostRetrySkipIndex()I

    move-result v36

    invoke-static/range {v36 .. v36}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v36

    .line 205
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readSplitGhostRetryPauseTime()I

    move-result v37

    invoke-static/range {v37 .. v37}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v37

    .line 206
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readSplitLastGhostRetryPauseTime()I

    move-result v38

    invoke-static/range {v38 .. v38}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v38

    .line 207
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readSplitGhostRetrySkipCount()I

    move-result v39

    invoke-static/range {v39 .. v39}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v39

    .line 208
    invoke-direct {v0, v14}, Lcom/trueaxis/modmenu/SplitTimeHud$1;->liveArrayTrace(I)Ljava/lang/String;

    move-result-object v14

    invoke-direct {v0, v15}, Lcom/trueaxis/modmenu/SplitTimeHud$1;->officialGhostArrayTrace(I)Ljava/lang/String;

    move-result-object v15

    .line 209
    invoke-direct {v0, v9}, Lcom/trueaxis/modmenu/SplitTimeHud$1;->splitColorName(I)Ljava/lang/String;

    move-result-object v9

    iget-object v5, v0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->val$activity:Landroid/app/Activity;

    invoke-static {v5}, Lcom/trueaxis/modmenu/ModMenu;->splitListEnabled(Landroid/content/Context;)Z

    move-result v5

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    const/16 v0, 0x25

    new-array v0, v0, [Ljava/lang/Object;

    aput-object v16, v0, v6

    const/4 v6, 0x1

    aput-object v1, v0, v6

    const/4 v1, 0x2

    aput-object v10, v0, v1

    const/4 v1, 0x3

    aput-object v17, v0, v1

    const/4 v1, 0x4

    aput-object v3, v0, v1

    const/4 v1, 0x5

    aput-object v8, v0, v1

    const/4 v1, 0x6

    aput-object v7, v0, v1

    const/4 v1, 0x7

    aput-object v11, v0, v1

    const/16 v1, 0x8

    aput-object v18, v0, v1

    const/16 v1, 0x9

    aput-object v19, v0, v1

    const/16 v1, 0xa

    aput-object v12, v0, v1

    const/16 v1, 0xb

    aput-object v20, v0, v1

    const/16 v1, 0xc

    aput-object v21, v0, v1

    const/16 v1, 0xd

    aput-object v22, v0, v1

    const/16 v1, 0xe

    aput-object v23, v0, v1

    const/16 v1, 0xf

    aput-object v25, v0, v1

    const/16 v1, 0x10

    aput-object v2, v0, v1

    const/16 v1, 0x11

    aput-object v4, v0, v1

    const/16 v1, 0x12

    aput-object v24, v0, v1

    const/16 v1, 0x13

    aput-object v26, v0, v1

    const/16 v1, 0x14

    aput-object v27, v0, v1

    const/16 v1, 0x15

    aput-object v28, v0, v1

    const/16 v1, 0x16

    aput-object v29, v0, v1

    const/16 v1, 0x17

    aput-object v30, v0, v1

    const/16 v1, 0x18

    aput-object v31, v0, v1

    const/16 v1, 0x19

    aput-object v32, v0, v1

    const/16 v1, 0x1a

    aput-object v33, v0, v1

    const/16 v1, 0x1b

    aput-object v34, v0, v1

    const/16 v1, 0x1c

    aput-object v35, v0, v1

    const/16 v1, 0x1d

    aput-object v36, v0, v1

    const/16 v1, 0x1e

    aput-object v37, v0, v1

    const/16 v1, 0x1f

    aput-object v38, v0, v1

    const/16 v1, 0x20

    aput-object v39, v0, v1

    const/16 v1, 0x21

    aput-object v14, v0, v1

    const/16 v1, 0x22

    aput-object v15, v0, v1

    const/16 v1, 0x23

    aput-object v9, v0, v1

    const/16 v1, 0x24

    aput-object v5, v0, v1

    .line 181
    const-string v1, "split checkpoint=%d current_ms=%d ghost_ms=%d delta_ms=%d cumulative_delta_ms=%d mode=%s finish=%s last_checkpoint_ms=%d scanned_checkpoint=%d decoded_engine_checkpoint=%d engine_checkpoint=%d selected_checkpoint=%d live_count=%d effective_ghost_count=%d official_ghost_count=%d live_cp_ms=%d live_appended_ms=%d official_ghost_cp_ms=%d replay_header_size=%d replay_header_checkpoints=%d replay_header_finish_ms=%d ghost_pos=%d last_ghost_pos=%d last_replay_size=%d replay_visual_ms=%d ghost_visual_ms=%d visual_delta_ms=%d ghost_checkpoint_dist_sq1000=%d ghost_retry_index=%d last_ghost_retry_index=%d ghost_retry_pause=%d last_ghost_retry_pause=%d ghost_retry_count=%d live_array=%s official_ghost_array=%s color=%s list=%s"

    invoke-static {v13, v1, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/trueaxis/modmenu/ModDebugLog;->log(Ljava/lang/String;)V

    .line 210
    return-void
.end method

.method private splitColor(I)I
    .registers 2

    .line 266
    if-gez p1, :cond_7

    # getter for: Lcom/trueaxis/modmenu/SplitTimeHud;->SPLIT_FAST:I
    invoke-static {}, Lcom/trueaxis/modmenu/SplitTimeHud;->access$200()I

    move-result p1

    return p1

    .line 267
    :cond_7
    if-lez p1, :cond_e

    # getter for: Lcom/trueaxis/modmenu/SplitTimeHud;->SPLIT_SLOW:I
    invoke-static {}, Lcom/trueaxis/modmenu/SplitTimeHud;->access$300()I

    move-result p1

    return p1

    .line 268
    :cond_e
    # getter for: Lcom/trueaxis/modmenu/SplitTimeHud;->SPLIT_READY:I
    invoke-static {}, Lcom/trueaxis/modmenu/SplitTimeHud;->access$000()I

    move-result p1

    return p1
.end method

.method private splitColorName(I)Ljava/lang/String;
    .registers 2

    .line 272
    if-gez p1, :cond_5

    const-string p1, "green"

    return-object p1

    .line 273
    :cond_5
    if-lez p1, :cond_a

    const-string p1, "red"

    return-object p1

    .line 274
    :cond_a
    const-string p1, "yellow"

    return-object p1
.end method

.method private splitLine(IIZ)Ljava/lang/String;
    .registers 9

    .line 228
    const/4 v0, 0x1

    const/4 v1, 0x0

    if-gtz p2, :cond_6

    const/4 v2, 0x1

    goto :goto_7

    :cond_6
    const/4 v2, 0x0

    .line 229
    :goto_7
    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 230
    if-eqz p3, :cond_e

    const-string p3, "S"

    goto :goto_10

    :cond_e
    const-string p3, "CP"

    .line 231
    :goto_10
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    if-eqz v2, :cond_19

    const-string v2, "-"

    goto :goto_1b

    :cond_19
    const-string v2, "+"

    :goto_1b
    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    move-result p2

    int-to-float p2, p2

    const/high16 v4, 0x447a0000

    div-float/2addr p2, v4

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p2

    const/4 v4, 0x4

    new-array v4, v4, [Ljava/lang/Object;

    aput-object p3, v4, v1

    aput-object p1, v4, v0

    const/4 p1, 0x2

    aput-object v2, v4, p1

    const/4 p1, 0x3

    aput-object p2, v4, p1

    .line 229
    const-string p1, "%s%d %s%.2f"

    invoke-static {v3, p1, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method public run()V
    .registers 4

    .line 79
    iget-object v0, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->val$activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_24

    iget-boolean v0, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->disabled:Z

    if-eqz v0, :cond_d

    goto :goto_24

    .line 81
    :cond_d
    :try_start_d
    invoke-direct {p0}, Lcom/trueaxis/modmenu/SplitTimeHud$1;->poll()V
    :try_end_10
    .catchall {:try_start_d .. :try_end_10} :catchall_11

    .line 86
    goto :goto_23

    .line 82
    :catchall_11
    move-exception v0

    .line 83
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->disabled:Z

    .line 84
    iget-object v1, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->val$split:Landroid/widget/TextView;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 85
    const-string v1, "splits"

    const-string v2, "split HUD poll failed; disabling HUD"

    invoke-static {v1, v2, v0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 87
    :goto_23
    return-void

    .line 79
    :cond_24
    :goto_24
    return-void
.end method
