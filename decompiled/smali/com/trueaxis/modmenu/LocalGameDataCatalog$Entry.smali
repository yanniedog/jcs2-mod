.class final Lcom/trueaxis/modmenu/LocalGameDataCatalog$Entry;
.super Ljava/lang/Object;
.source "LocalGameDataCatalog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trueaxis/modmenu/LocalGameDataCatalog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Entry"
.end annotation


# instance fields
.field final bytes:J

.field final lastModified:J

.field final name:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;JJ)V
    .registers 6

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-object p1, p0, Lcom/trueaxis/modmenu/LocalGameDataCatalog$Entry;->name:Ljava/lang/String;

    .line 33
    iput-wide p2, p0, Lcom/trueaxis/modmenu/LocalGameDataCatalog$Entry;->bytes:J

    .line 34
    iput-wide p4, p0, Lcom/trueaxis/modmenu/LocalGameDataCatalog$Entry;->lastModified:J

    .line 35
    return-void
.end method
