.class final Lcom/trueaxis/modmenu/UpdateManager$DownloadProgress;
.super Ljava/lang/Object;
.source "UpdateManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trueaxis/modmenu/UpdateManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "DownloadProgress"
.end annotation


# instance fields
.field downloaded:J

.field exists:Z

.field reason:I

.field status:I

.field total:J


# direct methods
.method private constructor <init>()V
    .registers 3

    .line 669
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 672
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/trueaxis/modmenu/UpdateManager$DownloadProgress;->downloaded:J

    .line 673
    iput-wide v0, p0, Lcom/trueaxis/modmenu/UpdateManager$DownloadProgress;->total:J

    return-void
.end method

.method synthetic constructor <init>(Lcom/trueaxis/modmenu/UpdateManager$1;)V
    .registers 2

    .line 669
    invoke-direct {p0}, Lcom/trueaxis/modmenu/UpdateManager$DownloadProgress;-><init>()V

    return-void
.end method
