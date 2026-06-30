.class final Lcom/trueaxis/modmenu/GameDataExporter;
.super Ljava/lang/Object;
.source "GameDataExporter.java"


# static fields
.field private static final AUTHORITY_SUFFIX:Ljava/lang/String; = ".moddata"

.field private static final BUFFER_SIZE:I = 0x2000


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    return-void
.end method

.method static synthetic access$000(Landroid/app/Activity;)Ljava/io/File;
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 26
    invoke-static {p0}, Lcom/trueaxis/modmenu/GameDataExporter;->buildExportZip(Landroid/app/Activity;)Ljava/io/File;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$100(Landroid/app/Activity;Ljava/io/File;)V
    .registers 2

    .line 26
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/GameDataExporter;->shareZip(Landroid/app/Activity;Ljava/io/File;)V

    return-void
.end method

.method static synthetic access$200(Ljava/lang/Throwable;)Ljava/lang/String;
    .registers 1

    .line 26
    invoke-static {p0}, Lcom/trueaxis/modmenu/GameDataExporter;->readable(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$300(Landroid/app/Activity;Ljava/lang/String;)V
    .registers 2

    .line 26
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/GameDataExporter;->toast(Landroid/app/Activity;Ljava/lang/String;)V

    return-void
.end method

.method private static buildExportZip(Landroid/app/Activity;)Ljava/io/File;
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 59
    invoke-static {p0}, Lcom/trueaxis/modmenu/LocalGameDataCatalog;->listFiles(Landroid/content/Context;)Ljava/util/List;

    move-result-object v0

    .line 60
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_d4

    .line 64
    invoke-virtual {p0}, Landroid/app/Activity;->getCacheDir()Ljava/io/File;

    move-result-object p0

    .line 65
    if-eqz p0, :cond_cc

    .line 68
    new-instance v1, Ljava/io/File;

    const-string v2, "exports"

    invoke-direct {v1, p0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 69
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result p0

    if-nez p0, :cond_2c

    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    move-result p0

    if-eqz p0, :cond_24

    goto :goto_2c

    .line 70
    :cond_24
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "Could not create export directory"

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 73
    :cond_2c
    :goto_2c
    new-instance p0, Ljava/text/SimpleDateFormat;

    const-string v2, "yyyyMMdd-HHmmss"

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {p0, v2, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    new-instance v2, Ljava/util/Date;

    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    invoke-virtual {p0, v2}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    .line 74
    new-instance v2, Ljava/io/File;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "jcs2-local-data-"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v3, ".zip"

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v2, v1, p0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 76
    nop

    .line 78
    const/4 p0, 0x0

    :try_start_5e
    new-instance v1, Ljava/util/zip/ZipOutputStream;

    new-instance v3, Ljava/io/BufferedOutputStream;

    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v3, v4}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    invoke-direct {v1, v3}, Ljava/util/zip/ZipOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_6d
    .catchall {:try_start_5e .. :try_end_6d} :catchall_c5

    .line 79
    const/16 v3, 0x2000

    :try_start_6f
    new-array v3, v3, [B

    .line 80
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_75
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_bb

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/io/File;

    .line 81
    new-instance v5, Ljava/util/zip/ZipEntry;

    invoke-virtual {v4}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/util/zip/ZipEntry;-><init>(Ljava/lang/String;)V

    .line 82
    invoke-virtual {v4}, Ljava/io/File;->lastModified()J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Ljava/util/zip/ZipEntry;->setTime(J)V

    .line 83
    invoke-virtual {v1, v5}, Ljava/util/zip/ZipOutputStream;->putNextEntry(Ljava/util/zip/ZipEntry;)V
    :try_end_94
    .catchall {:try_start_6f .. :try_end_94} :catchall_c3

    .line 84
    nop

    .line 86
    :try_start_95
    new-instance v5, Ljava/io/BufferedInputStream;

    new-instance v6, Ljava/io/FileInputStream;

    invoke-direct {v6, v4}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v5, v6}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_9f
    .catchall {:try_start_95 .. :try_end_9f} :catchall_b4

    .line 88
    :goto_9f
    :try_start_9f
    invoke-virtual {v5, v3}, Ljava/io/BufferedInputStream;->read([B)I

    move-result v4

    if-ltz v4, :cond_aa

    .line 89
    const/4 v6, 0x0

    invoke-virtual {v1, v3, v6, v4}, Ljava/util/zip/ZipOutputStream;->write([BII)V
    :try_end_a9
    .catchall {:try_start_9f .. :try_end_a9} :catchall_b2

    goto :goto_9f

    .line 92
    :cond_aa
    :try_start_aa
    invoke-static {v5}, Lcom/trueaxis/modmenu/GameDataExporter;->closeQuietly(Ljava/io/Closeable;)V

    .line 93
    nop

    .line 94
    invoke-virtual {v1}, Ljava/util/zip/ZipOutputStream;->closeEntry()V

    .line 95
    goto :goto_75

    .line 92
    :catchall_b2
    move-exception p0

    goto :goto_b7

    :catchall_b4
    move-exception v0

    move-object v5, p0

    move-object p0, v0

    :goto_b7
    invoke-static {v5}, Lcom/trueaxis/modmenu/GameDataExporter;->closeQuietly(Ljava/io/Closeable;)V

    .line 93
    throw p0

    .line 96
    :cond_bb
    invoke-virtual {v1}, Ljava/util/zip/ZipOutputStream;->finish()V
    :try_end_be
    .catchall {:try_start_aa .. :try_end_be} :catchall_c3

    .line 98
    invoke-static {v1}, Lcom/trueaxis/modmenu/GameDataExporter;->closeQuietly(Ljava/io/Closeable;)V

    .line 99
    nop

    .line 100
    return-object v2

    .line 98
    :catchall_c3
    move-exception p0

    goto :goto_c8

    :catchall_c5
    move-exception v0

    move-object v1, p0

    move-object p0, v0

    :goto_c8
    invoke-static {v1}, Lcom/trueaxis/modmenu/GameDataExporter;->closeQuietly(Ljava/io/Closeable;)V

    .line 99
    throw p0

    .line 66
    :cond_cc
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "Cache directory unavailable"

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 61
    :cond_d4
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "No local stats or replay queue files found"

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    goto :goto_dd

    :goto_dc
    throw p0

    :goto_dd
    goto :goto_dc
.end method

.method private static closeQuietly(Ljava/io/Closeable;)V
    .registers 1

    .line 146
    if-nez p0, :cond_3

    .line 147
    return-void

    .line 150
    :cond_3
    :try_start_3
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_6
    .catchall {:try_start_3 .. :try_end_6} :catchall_7

    .line 152
    goto :goto_8

    .line 151
    :catchall_7
    move-exception p0

    .line 153
    :goto_8
    return-void
.end method

.method static exportNow(Landroid/app/Activity;)V
    .registers 3

    .line 34
    const-string v0, "game-data-export"

    const-string v1, "export started"

    invoke-static {v0, v1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/trueaxis/modmenu/GameDataExporter$1;

    invoke-direct {v1, p0}, Lcom/trueaxis/modmenu/GameDataExporter$1;-><init>(Landroid/app/Activity;)V

    const-string p0, "YCS2GameDataExport"

    invoke-direct {v0, v1, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 55
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 56
    return-void
.end method

.method private static fileProviderUri(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;)Landroid/net/Uri;
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 125
    const-string v0, "android.support.v4.content.FileProvider"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 126
    const/4 v1, 0x3

    new-array v2, v1, [Ljava/lang/Class;

    const-class v3, Landroid/content/Context;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const-class v3, Ljava/lang/String;

    const/4 v5, 0x1

    aput-object v3, v2, v5

    const-class v3, Ljava/io/File;

    const/4 v6, 0x2

    aput-object v3, v2, v6

    const-string v3, "getUriForFile"

    invoke-virtual {v0, v3, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 128
    new-array v1, v1, [Ljava/lang/Object;

    aput-object p0, v1, v4

    aput-object p1, v1, v5

    aput-object p2, v1, v6

    const/4 p0, 0x0

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .line 129
    instance-of p1, p0, Landroid/net/Uri;

    if-eqz p1, :cond_32

    .line 132
    check-cast p0, Landroid/net/Uri;

    return-object p0

    .line 130
    :cond_32
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "FileProvider returned no URI"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static readable(Ljava/lang/Throwable;)Ljava/lang/String;
    .registers 3

    .line 136
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    .line 137
    if-eqz v0, :cond_e

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_d

    goto :goto_e

    .line 138
    :cond_d
    goto :goto_16

    :cond_e
    :goto_e
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    .line 137
    :goto_16
    return-object v0
.end method

.method private static shareZip(Landroid/app/Activity;Ljava/io/File;)V
    .registers 4

    .line 105
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ".moddata"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 106
    invoke-static {p0, v0, p1}, Lcom/trueaxis/modmenu/GameDataExporter;->fileProviderUri(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;)Landroid/net/Uri;

    move-result-object p1

    .line 107
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.SEND"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 108
    const-string v1, "application/zip"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 109
    const-string v1, "android.intent.extra.STREAM"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 110
    const-string p1, "android.intent.extra.SUBJECT"

    const-string v1, "JCS2 local stats/replay data"

    invoke-virtual {v0, p1, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 111
    const-string p1, "android.intent.extra.TEXT"

    const-string v1, "Local Jet Car Stunts 2 stats and pending score/replay queue files. These are not Play Games cloud saves."

    invoke-virtual {v0, p1, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 114
    const/4 p1, 0x1

    invoke-virtual {v0, p1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 115
    const-string p1, "Share local game data"

    invoke-static {v0, p1}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 116
    const-string p1, "Export ready \u2014 choose a destination."

    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/GameDataExporter;->toast(Landroid/app/Activity;Ljava/lang/String;)V
    :try_end_4c
    .catchall {:try_start_0 .. :try_end_4c} :catchall_4d

    .line 120
    goto :goto_6f

    .line 117
    :catchall_4d
    move-exception p1

    .line 118
    const-string v0, "game-data-export"

    const-string v1, "share failed"

    invoke-static {v0, v1, p1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 119
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Could not share export: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p1}, Lcom/trueaxis/modmenu/GameDataExporter;->readable(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/GameDataExporter;->toast(Landroid/app/Activity;Ljava/lang/String;)V

    .line 121
    :goto_6f
    return-void
.end method

.method private static toast(Landroid/app/Activity;Ljava/lang/String;)V
    .registers 3

    .line 142
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 143
    return-void
.end method
