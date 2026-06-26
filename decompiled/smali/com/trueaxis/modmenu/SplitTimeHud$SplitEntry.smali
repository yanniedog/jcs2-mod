.class final Lcom/trueaxis/modmenu/SplitTimeHud$SplitEntry;
.super Ljava/lang/Object;
.source "SplitTimeHud.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trueaxis/modmenu/SplitTimeHud;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "SplitEntry"
.end annotation


# instance fields
.field final checkpoint:I

.field final color:I

.field final cumulativeMillis:I

.field final line:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;III)V
    .registers 5

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput-object p1, p0, Lcom/trueaxis/modmenu/SplitTimeHud$SplitEntry;->line:Ljava/lang/String;

    .line 35
    iput p2, p0, Lcom/trueaxis/modmenu/SplitTimeHud$SplitEntry;->color:I

    .line 36
    iput p3, p0, Lcom/trueaxis/modmenu/SplitTimeHud$SplitEntry;->checkpoint:I

    .line 37
    iput p4, p0, Lcom/trueaxis/modmenu/SplitTimeHud$SplitEntry;->cumulativeMillis:I

    .line 38
    return-void
.end method
