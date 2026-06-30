.class final Lcom/trueaxis/modmenu/LocalGameDataCatalog$Summary;
.super Ljava/lang/Object;
.source "LocalGameDataCatalog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trueaxis/modmenu/LocalGameDataCatalog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Summary"
.end annotation


# instance fields
.field final entries:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/trueaxis/modmenu/LocalGameDataCatalog$Entry;",
            ">;"
        }
    .end annotation
.end field

.field final fileCount:I

.field final totalBytes:J


# direct methods
.method constructor <init>(IJLjava/util/List;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IJ",
            "Ljava/util/List<",
            "Lcom/trueaxis/modmenu/LocalGameDataCatalog$Entry;",
            ">;)V"
        }
    .end annotation

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    iput p1, p0, Lcom/trueaxis/modmenu/LocalGameDataCatalog$Summary;->fileCount:I

    .line 45
    iput-wide p2, p0, Lcom/trueaxis/modmenu/LocalGameDataCatalog$Summary;->totalBytes:J

    .line 46
    iput-object p4, p0, Lcom/trueaxis/modmenu/LocalGameDataCatalog$Summary;->entries:Ljava/util/List;

    .line 47
    return-void
.end method
