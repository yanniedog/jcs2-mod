.class final Lcom/trueaxis/modmenu/LocalGameDataCatalog;
.super Ljava/lang/Object;
.source "LocalGameDataCatalog.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trueaxis/modmenu/LocalGameDataCatalog$Entry;,
        Lcom/trueaxis/modmenu/LocalGameDataCatalog$Summary;
    }
.end annotation


# static fields
.field private static final KNOWN_NAMES:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .line 18
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "statHeader"

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const-string v1, "statsFile"

    const/4 v2, 0x1

    aput-object v1, v0, v2

    const-string v1, "stats.bin"

    const/4 v2, 0x2

    aput-object v1, v0, v2

    const-string v1, "statsbak.bin"

    const/4 v2, 0x3

    aput-object v1, v0, v2

    const-string v1, "g_stats"

    const/4 v2, 0x4

    aput-object v1, v0, v2

    sput-object v0, Lcom/trueaxis/modmenu/LocalGameDataCatalog;->KNOWN_NAMES:[Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    return-void
.end method

.method private static addIfPresent(Ljava/util/List;Ljava/io/File;[Ljava/lang/String;)V
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/trueaxis/modmenu/LocalGameDataCatalog$Entry;",
            ">;",
            "Ljava/io/File;",
            "[",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 114
    array-length v0, p2

    const/4 v1, 0x0

    :goto_2
    if-ge v1, v0, :cond_25

    aget-object v3, p2, v1

    .line 115
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p1, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 116
    invoke-virtual {v2}, Ljava/io/File;->isFile()Z

    move-result v4

    if-eqz v4, :cond_22

    .line 117
    new-instance v8, Lcom/trueaxis/modmenu/LocalGameDataCatalog$Entry;

    invoke-virtual {v2}, Ljava/io/File;->length()J

    move-result-wide v4

    invoke-virtual {v2}, Ljava/io/File;->lastModified()J

    move-result-wide v6

    move-object v2, v8

    invoke-direct/range {v2 .. v7}, Lcom/trueaxis/modmenu/LocalGameDataCatalog$Entry;-><init>(Ljava/lang/String;JJ)V

    invoke-interface {p0, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 114
    :cond_22
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 120
    :cond_25
    return-void
.end method

.method private static containsName(Ljava/util/List;Ljava/lang/String;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/trueaxis/modmenu/LocalGameDataCatalog$Entry;",
            ">;",
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation

    .line 138
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_4
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1b

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/trueaxis/modmenu/LocalGameDataCatalog$Entry;

    .line 139
    iget-object v0, v0, Lcom/trueaxis/modmenu/LocalGameDataCatalog$Entry;->name:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1a

    .line 140
    const/4 p0, 0x1

    return p0

    .line 142
    :cond_1a
    goto :goto_4

    .line 143
    :cond_1b
    const/4 p0, 0x0

    return p0
.end method

.method static formatBytes(J)Ljava/lang/String;
    .registers 8

    .line 104
    const-wide/16 v0, 0x400

    cmp-long v2, p0, v0

    if-gez v2, :cond_1a

    .line 105
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " B"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 107
    :cond_1a
    const-wide/32 v0, 0x100000

    const/4 v2, 0x0

    const/4 v3, 0x1

    cmp-long v4, p0, v0

    if-gez v4, :cond_3b

    .line 108
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    long-to-double p0, p0

    const-wide/high16 v4, 0x4090000000000000L

    invoke-static {p0, p1}, Ljava/lang/Double;->isNaN(D)Z

    div-double/2addr p0, v4

    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p0

    new-array p1, v3, [Ljava/lang/Object;

    aput-object p0, p1, v2

    const-string p0, "%.1f KB"

    invoke-static {v0, p0, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 110
    :cond_3b
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    long-to-double p0, p0

    const-wide/high16 v4, 0x4130000000000000L

    invoke-static {p0, p1}, Ljava/lang/Double;->isNaN(D)Z

    div-double/2addr p0, v4

    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p0

    new-array p1, v3, [Ljava/lang/Object;

    aput-object p0, p1, v2

    const-string p0, "%.2f MB"

    invoke-static {v0, p0, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static listEntries(Landroid/content/Context;)Ljava/util/List;
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List<",
            "Lcom/trueaxis/modmenu/LocalGameDataCatalog$Entry;",
            ">;"
        }
    .end annotation

    .line 74
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object p0

    .line 75
    if-eqz p0, :cond_57

    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-nez v0, :cond_d

    goto :goto_57

    .line 79
    :cond_d
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 80
    sget-object v1, Lcom/trueaxis/modmenu/LocalGameDataCatalog;->KNOWN_NAMES:[Ljava/lang/String;

    invoke-static {v0, p0, v1}, Lcom/trueaxis/modmenu/LocalGameDataCatalog;->addIfPresent(Ljava/util/List;Ljava/io/File;[Ljava/lang/String;)V

    .line 82
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object p0

    .line 83
    if-eqz p0, :cond_4e

    .line 84
    array-length v1, p0

    const/4 v2, 0x0

    :goto_1f
    if-ge v2, v1, :cond_4e

    aget-object v3, p0, v2

    .line 85
    invoke-virtual {v3}, Ljava/io/File;->isFile()Z

    move-result v4

    if-nez v4, :cond_2a

    .line 86
    goto :goto_4b

    .line 88
    :cond_2a
    invoke-virtual {v3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v6

    .line 89
    invoke-static {v6}, Lcom/trueaxis/modmenu/LocalGameDataCatalog;->matchesPattern(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4b

    invoke-static {v0, v6}, Lcom/trueaxis/modmenu/LocalGameDataCatalog;->containsName(Ljava/util/List;Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_4b

    .line 90
    new-instance v4, Lcom/trueaxis/modmenu/LocalGameDataCatalog$Entry;

    invoke-virtual {v3}, Ljava/io/File;->length()J

    move-result-wide v7

    invoke-virtual {v3}, Ljava/io/File;->lastModified()J

    move-result-wide v9

    move-object v5, v4

    invoke-direct/range {v5 .. v10}, Lcom/trueaxis/modmenu/LocalGameDataCatalog$Entry;-><init>(Ljava/lang/String;JJ)V

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 84
    :cond_4b
    :goto_4b
    add-int/lit8 v2, v2, 0x1

    goto :goto_1f

    .line 95
    :cond_4e
    new-instance p0, Lcom/trueaxis/modmenu/LocalGameDataCatalog$1;

    invoke-direct {p0}, Lcom/trueaxis/modmenu/LocalGameDataCatalog$1;-><init>()V

    invoke-static {v0, p0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 100
    return-object v0

    .line 76
    :cond_57
    :goto_57
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method static listFiles(Landroid/content/Context;)Ljava/util/List;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    .line 63
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 64
    invoke-static {p0}, Lcom/trueaxis/modmenu/LocalGameDataCatalog;->listEntries(Landroid/content/Context;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2e

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/trueaxis/modmenu/LocalGameDataCatalog$Entry;

    .line 65
    new-instance v3, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v4

    iget-object v2, v2, Lcom/trueaxis/modmenu/LocalGameDataCatalog$Entry;->name:Ljava/lang/String;

    invoke-direct {v3, v4, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 66
    invoke-virtual {v3}, Ljava/io/File;->isFile()Z

    move-result v2

    if-eqz v2, :cond_2d

    .line 67
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 69
    :cond_2d
    goto :goto_d

    .line 70
    :cond_2e
    return-object v0
.end method

.method private static matchesPattern(Ljava/lang/String;)Z
    .registers 4

    .line 123
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    .line 124
    const-string v0, "stats"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    const-string v1, ".bin"

    const/4 v2, 0x1

    if-eqz v0, :cond_18

    invoke-virtual {p0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_18

    .line 125
    return v2

    .line 127
    :cond_18
    const-string v0, "statsbak"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_27

    invoke-virtual {p0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_27

    .line 128
    return v2

    .line 130
    :cond_27
    const-string v0, "statheader"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_52

    .line 131
    const-string v0, "statsfile"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_52

    .line 132
    const-string v0, "stats.bin"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_52

    .line 133
    const-string v0, "statsbak.bin"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_52

    .line 134
    const-string v0, "g_stats"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_50

    goto :goto_52

    :cond_50
    const/4 v2, 0x0

    goto :goto_53

    :cond_52
    :goto_52
    nop

    .line 130
    :goto_53
    return v2
.end method

.method static summarize(Landroid/content/Context;)Lcom/trueaxis/modmenu/LocalGameDataCatalog$Summary;
    .registers 6

    .line 54
    invoke-static {p0}, Lcom/trueaxis/modmenu/LocalGameDataCatalog;->listEntries(Landroid/content/Context;)Ljava/util/List;

    move-result-object p0

    .line 55
    nop

    .line 56
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const-wide/16 v1, 0x0

    :goto_b
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1b

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/trueaxis/modmenu/LocalGameDataCatalog$Entry;

    .line 57
    iget-wide v3, v3, Lcom/trueaxis/modmenu/LocalGameDataCatalog$Entry;->bytes:J

    add-long/2addr v1, v3

    .line 58
    goto :goto_b

    .line 59
    :cond_1b
    new-instance v0, Lcom/trueaxis/modmenu/LocalGameDataCatalog$Summary;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v3

    invoke-direct {v0, v3, v1, v2, p0}, Lcom/trueaxis/modmenu/LocalGameDataCatalog$Summary;-><init>(IJLjava/util/List;)V

    return-object v0
.end method
