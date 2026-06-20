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
.field private hideAt:J

.field private lastCheckpointCount:I

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

    .line 41
    iput-object p1, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->val$activity:Landroid/app/Activity;

    iput-object p2, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->val$split:Landroid/widget/TextView;

    iput-object p3, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->val$handler:Landroid/os/Handler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 9

    .line 46
    iget-object v0, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->val$activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_9

    return-void

    .line 47
    :cond_9
    invoke-static {}, Lcom/trueaxis/modmenu/RequiredPatches;->readLatestCheckpointSplit()J

    move-result-wide v0

    .line 48
    const/16 v2, 0x20

    ushr-long v2, v0, v2

    long-to-int v3, v2

    .line 49
    long-to-int v1, v0

    .line 51
    iget v0, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->lastCheckpointCount:I

    const/16 v2, 0x8

    if-ge v3, v0, :cond_22

    .line 52
    iput v3, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->lastCheckpointCount:I

    .line 53
    iget-object v0, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->val$split:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_a4

    .line 54
    :cond_22
    iget v0, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->lastCheckpointCount:I

    const/4 v4, 0x1

    add-int/2addr v0, v4

    if-le v3, v0, :cond_31

    .line 57
    iput v3, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->lastCheckpointCount:I

    .line 58
    iget-object v0, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->val$split:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_a4

    .line 59
    :cond_31
    iget v0, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->lastCheckpointCount:I

    if-le v3, v0, :cond_8d

    .line 60
    iput v3, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->lastCheckpointCount:I

    .line 61
    if-lez v3, :cond_a4

    .line 62
    const/4 v0, 0x0

    if-gtz v1, :cond_3e

    const/4 v2, 0x1

    goto :goto_3f

    :cond_3e
    const/4 v2, 0x0

    .line 63
    :goto_3f
    iget-object v3, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->val$split:Landroid/widget/TextView;

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 64
    if-eqz v2, :cond_48

    const-string v6, "-"

    goto :goto_4a

    :cond_48
    const-string v6, "+"

    :goto_4a
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v1

    int-to-float v1, v1

    const/high16 v7, 0x447a0000    # 1000.0f

    div-float/2addr v1, v7

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    aput-object v6, v7, v0

    aput-object v1, v7, v4

    .line 63
    const-string v1, "%s%.2f"

    invoke-static {v5, v1, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 65
    iget-object v1, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->val$split:Landroid/widget/TextView;

    const/16 v3, 0x50

    const/16 v4, 0xff

    if-eqz v2, :cond_75

    .line 66
    const/16 v2, 0x6e

    invoke-static {v3, v4, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v2

    goto :goto_7b

    .line 67
    :cond_75
    const/16 v2, 0x46

    invoke-static {v4, v3, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v2

    .line 65
    :goto_7b
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 68
    iget-object v1, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->val$split:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 69
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const-wide/16 v2, 0x9c4

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->hideAt:J

    .line 70
    goto :goto_a4

    .line 71
    :cond_8d
    iget-object v0, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->val$split:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_a4

    .line 72
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v3, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->hideAt:J

    cmp-long v5, v0, v3

    if-ltz v5, :cond_a4

    .line 73
    iget-object v0, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->val$split:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 75
    :cond_a4
    :goto_a4
    iget-object v0, p0, Lcom/trueaxis/modmenu/SplitTimeHud$1;->val$handler:Landroid/os/Handler;

    const-wide/16 v1, 0x32

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 76
    return-void
.end method
