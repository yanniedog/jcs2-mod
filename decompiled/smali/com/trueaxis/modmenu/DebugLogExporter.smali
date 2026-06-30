.class final Lcom/trueaxis/modmenu/DebugLogExporter;
.super Ljava/lang/Object;
.source "DebugLogExporter.java"


# static fields
.field private static final CONNECT_TIMEOUT_MS:I = 0x2710

.field private static final MAX_PASTE_BYTES:I = 0x57800

.field private static final PASTE_URL:Ljava/lang/String; = "https://paste.rs/"

.field private static final READ_TIMEOUT_MS:I = 0x7530

.field private static uploading:Z


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 23
    invoke-static {}, Lcom/trueaxis/modmenu/DebugLogExporter;->preparePayload()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Ljava/lang/String;)Ljava/lang/String;
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 23
    invoke-static {p0}, Lcom/trueaxis/modmenu/DebugLogExporter;->uploadToPasteRs(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$200(Landroid/app/Activity;Ljava/lang/String;)V
    .registers 2

    .line 23
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/DebugLogExporter;->showUploadResult(Landroid/app/Activity;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$300(Landroid/app/Activity;Ljava/lang/Runnable;)V
    .registers 2

    .line 23
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/DebugLogExporter;->runOnUi(Landroid/app/Activity;Ljava/lang/Runnable;)V

    return-void
.end method

.method static synthetic access$400(Ljava/lang/Throwable;)Ljava/lang/String;
    .registers 1

    .line 23
    invoke-static {p0}, Lcom/trueaxis/modmenu/DebugLogExporter;->readable(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$500(Landroid/content/Context;Ljava/lang/String;)V
    .registers 2

    .line 23
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/DebugLogExporter;->toast(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$602(Z)Z
    .registers 1

    .line 23
    sput-boolean p0, Lcom/trueaxis/modmenu/DebugLogExporter;->uploading:Z

    return p0
.end method

.method static synthetic access$700(Landroid/content/Context;Ljava/lang/String;)V
    .registers 2

    .line 23
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/DebugLogExporter;->copyLink(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$800(Landroid/app/Activity;Ljava/lang/String;)V
    .registers 2

    .line 23
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/DebugLogExporter;->openLink(Landroid/app/Activity;Ljava/lang/String;)V

    return-void
.end method

.method private static closeQuietly(Ljava/io/Closeable;)V
    .registers 1

    .line 204
    if-nez p0, :cond_3

    return-void

    .line 206
    :cond_3
    :try_start_3
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_6
    .catchall {:try_start_3 .. :try_end_6} :catchall_7

    .line 208
    goto :goto_8

    .line 207
    :catchall_7
    move-exception p0

    .line 209
    :goto_8
    return-void
.end method

.method private static copyLink(Landroid/content/Context;Ljava/lang/String;)V
    .registers 6

    .line 158
    const-string v0, "debug-export"

    :try_start_2
    const-string v1, "clipboard"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/ClipboardManager;

    .line 160
    if-eqz v1, :cond_31

    .line 161
    const-string v2, "YCS2 debug log"

    invoke-static {v2, p1}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V

    .line 162
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "copied link url="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 163
    const-string v1, "Link copied to clipboard."

    invoke-static {p0, v1}, Lcom/trueaxis/modmenu/DebugLogExporter;->toast(Landroid/content/Context;Ljava/lang/String;)V

    .line 167
    goto :goto_6a

    .line 160
    :cond_31
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Clipboard unavailable"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_39
    .catchall {:try_start_2 .. :try_end_39} :catchall_39

    .line 164
    :catchall_39
    move-exception v1

    .line 165
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "copy link failed url="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1, v1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 166
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Could not copy link: "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-static {v1}, Lcom/trueaxis/modmenu/DebugLogExporter;->readable(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/DebugLogExporter;->toast(Landroid/content/Context;Ljava/lang/String;)V

    .line 168
    :goto_6a
    return-void
.end method

.method private static normalizePasteUrl(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    .line 119
    const-string v0, "http://"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_41

    const-string v0, "https://"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_11

    goto :goto_41

    .line 122
    :cond_11
    const-string v0, "/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2d

    .line 123
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "https://paste.rs"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 125
    :cond_2d
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "https://paste.rs/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 120
    :cond_41
    :goto_41
    return-object p0
.end method

.method private static openLink(Landroid/app/Activity;Ljava/lang/String;)V
    .registers 6

    .line 148
    const-string v0, "debug-export"

    :try_start_2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "open link url="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 149
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {p0, v1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
    :try_end_26
    .catchall {:try_start_2 .. :try_end_26} :catchall_27

    .line 153
    goto :goto_41

    .line 150
    :catchall_27
    move-exception v1

    .line 151
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "open link failed url="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2, v1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 152
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/DebugLogExporter;->toast(Landroid/content/Context;Ljava/lang/String;)V

    .line 154
    :goto_41
    return-void
.end method

.method private static preparePayload()Ljava/lang/String;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 66
    invoke-static {}, Lcom/trueaxis/modmenu/ModDebugLog;->readExportContent()Ljava/lang/String;

    move-result-object v0

    .line 67
    const-string v1, "UTF-8"

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v1

    .line 68
    array-length v2, v1

    const v3, 0x57800

    if-gt v2, v3, :cond_11

    .line 69
    return-object v0

    .line 71
    :cond_11
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "truncating payload bytes="

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    array-length v1, v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " limit="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "debug-export"

    invoke-static {v2, v1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    invoke-static {v1, v3}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 74
    :goto_3c
    if-lez v1, :cond_50

    add-int/lit8 v2, v1, -0x1

    invoke-virtual {v0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const v4, 0xfc00

    and-int/2addr v2, v4

    const v4, 0xd800

    if-ne v2, v4, :cond_50

    .line 75
    add-int/lit8 v1, v1, -0x1

    goto :goto_3c

    .line 77
    :cond_50
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v4, 0x0

    invoke-virtual {v0, v4, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n\n--- TRUNCATED: paste.rs size limit ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " bytes) ---\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static readString(Ljava/io/InputStream;)Ljava/lang/String;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 171
    if-nez p0, :cond_5

    const-string p0, ""

    return-object p0

    .line 172
    :cond_5
    nop

    .line 174
    const/4 v0, 0x0

    :try_start_7
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v2, Ljava/io/InputStreamReader;

    const-string v3, "UTF-8"

    invoke-direct {v2, p0, v3}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v1, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_13
    .catchall {:try_start_7 .. :try_end_13} :catchall_34

    .line 175
    :try_start_13
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 176
    const/16 v2, 0x1000

    new-array v2, v2, [C

    .line 178
    :goto_1c
    invoke-virtual {v1, v2}, Ljava/io/BufferedReader;->read([C)I

    move-result v3

    if-ltz v3, :cond_27

    .line 179
    const/4 v4, 0x0

    invoke-virtual {v0, v2, v4, v3}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    goto :goto_1c

    .line 181
    :cond_27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_2b
    .catchall {:try_start_13 .. :try_end_2b} :catchall_32

    .line 183
    invoke-static {v1}, Lcom/trueaxis/modmenu/DebugLogExporter;->closeQuietly(Ljava/io/Closeable;)V

    .line 184
    invoke-static {p0}, Lcom/trueaxis/modmenu/DebugLogExporter;->closeQuietly(Ljava/io/Closeable;)V

    .line 181
    return-object v0

    .line 183
    :catchall_32
    move-exception v0

    goto :goto_38

    :catchall_34
    move-exception v1

    move-object v5, v1

    move-object v1, v0

    move-object v0, v5

    :goto_38
    invoke-static {v1}, Lcom/trueaxis/modmenu/DebugLogExporter;->closeQuietly(Ljava/io/Closeable;)V

    .line 184
    invoke-static {p0}, Lcom/trueaxis/modmenu/DebugLogExporter;->closeQuietly(Ljava/io/Closeable;)V

    .line 185
    goto :goto_40

    :goto_3f
    throw v0

    :goto_40
    goto :goto_3f
.end method

.method private static readable(Ljava/lang/Throwable;)Ljava/lang/String;
    .registers 3

    .line 189
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    .line 190
    if-eqz v0, :cond_e

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_d

    goto :goto_e

    .line 191
    :cond_d
    goto :goto_16

    :cond_e
    :goto_e
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    .line 190
    :goto_16
    return-object v0
.end method

.method private static runOnUi(Landroid/app/Activity;Ljava/lang/Runnable;)V
    .registers 3

    .line 195
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    .line 196
    :cond_7
    invoke-virtual {p0, p1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 197
    return-void
.end method

.method private static showUploadResult(Landroid/app/Activity;Ljava/lang/String;)V
    .registers 5

    .line 129
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 130
    const-string v1, "Debug logs uploaded"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Share this link when reporting issues:\n\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 131
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lcom/trueaxis/modmenu/DebugLogExporter$3;

    invoke-direct {v1, p0, p1}, Lcom/trueaxis/modmenu/DebugLogExporter$3;-><init>(Landroid/app/Activity;Ljava/lang/String;)V

    .line 132
    const-string v2, "Open link"

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lcom/trueaxis/modmenu/DebugLogExporter$2;

    invoke-direct {v1, p0, p1}, Lcom/trueaxis/modmenu/DebugLogExporter$2;-><init>(Landroid/app/Activity;Ljava/lang/String;)V

    .line 137
    const-string p0, "Copy link"

    invoke-virtual {v0, p0, v1}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    .line 142
    const-string p1, "Close"

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    .line 143
    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 144
    return-void
.end method

.method private static toast(Landroid/content/Context;Ljava/lang/String;)V
    .registers 3

    .line 200
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 201
    return-void
.end method

.method static uploadNow(Landroid/app/Activity;)V
    .registers 3

    .line 34
    sget-boolean v0, Lcom/trueaxis/modmenu/DebugLogExporter;->uploading:Z

    if-eqz v0, :cond_a

    .line 35
    const-string v0, "Debug log upload is already running."

    invoke-static {p0, v0}, Lcom/trueaxis/modmenu/DebugLogExporter;->toast(Landroid/content/Context;Ljava/lang/String;)V

    .line 36
    return-void

    .line 38
    :cond_a
    const/4 v0, 0x1

    sput-boolean v0, Lcom/trueaxis/modmenu/DebugLogExporter;->uploading:Z

    .line 39
    const-string v0, "debug-export"

    const-string v1, "upload started"

    invoke-static {v0, v1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    const-string v0, "Uploading debug logs..."

    invoke-static {p0, v0}, Lcom/trueaxis/modmenu/DebugLogExporter;->toast(Landroid/content/Context;Ljava/lang/String;)V

    .line 41
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/trueaxis/modmenu/DebugLogExporter$1;

    invoke-direct {v1, p0}, Lcom/trueaxis/modmenu/DebugLogExporter$1;-><init>(Landroid/app/Activity;)V

    const-string p0, "YCS2DebugLogUpload"

    invoke-direct {v0, v1, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 62
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 63
    return-void
.end method

.method private static uploadToPasteRs(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 82
    new-instance v0, Ljava/net/URL;

    const-string v1, "https://paste.rs/"

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    .line 83
    const/16 v1, 0x2710

    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 84
    const/16 v1, 0x7530

    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 85
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setUseCaches(Z)V

    .line 86
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 87
    const-string v1, "POST"

    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 88
    const-string v1, "Content-Type"

    const-string v2, "text/plain; charset=utf-8"

    invoke-virtual {v0, v1, v2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    const-string v1, "User-Agent"

    const-string v2, "YCS2ModDebugLog/1.0"

    invoke-virtual {v0, v1, v2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    nop

    .line 92
    :try_start_33
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v1
    :try_end_37
    .catchall {:try_start_33 .. :try_end_37} :catchall_e1

    .line 93
    :try_start_37
    const-string v2, "UTF-8"

    invoke-virtual {p0, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/io/OutputStream;->write([B)V

    .line 94
    invoke-virtual {v1}, Ljava/io/OutputStream;->flush()V
    :try_end_43
    .catchall {:try_start_37 .. :try_end_43} :catchall_df

    .line 96
    invoke-static {v1}, Lcom/trueaxis/modmenu/DebugLogExporter;->closeQuietly(Ljava/io/Closeable;)V

    .line 97
    nop

    .line 99
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result p0

    .line 100
    const/16 v1, 0xc8

    if-lt p0, v1, :cond_58

    const/16 v1, 0x12c

    if-ge p0, v1, :cond_58

    .line 101
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    goto :goto_5c

    :cond_58
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;

    move-result-object v1

    .line 102
    :goto_5c
    invoke-static {v1}, Lcom/trueaxis/modmenu/DebugLogExporter;->readString(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 103
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 104
    const/16 v0, 0xc9

    const/16 v2, 0xce

    if-eq p0, v0, :cond_a8

    if-eq p0, v2, :cond_a8

    .line 105
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "HTTP "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    .line 106
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_9a

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, ": "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_9c

    :cond_9a
    const-string v1, ""

    :goto_9c
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 108
    :cond_a8
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_d7

    .line 111
    if-ne p0, v2, :cond_d2

    .line 112
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "paste.rs partial upload status="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, " url="

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "debug-export"

    invoke-static {v0, p0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 115
    :cond_d2
    invoke-static {v1}, Lcom/trueaxis/modmenu/DebugLogExporter;->normalizePasteUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 109
    :cond_d7
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "Paste service returned an empty URL"

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 96
    :catchall_df
    move-exception p0

    goto :goto_e3

    :catchall_e1
    move-exception p0

    const/4 v1, 0x0

    :goto_e3
    invoke-static {v1}, Lcom/trueaxis/modmenu/DebugLogExporter;->closeQuietly(Ljava/io/Closeable;)V

    .line 97
    throw p0
.end method
