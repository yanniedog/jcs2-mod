.class Lcom/trueaxis/server/Server$postThread;
.super Ljava/lang/Thread;
.source "Server.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trueaxis/server/Server;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "postThread"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trueaxis/server/Server$postThread$Timeout;,
        Lcom/trueaxis/server/Server$postThread$ResettableTimer;
    }
.end annotation


# instance fields
.field CONNECTION_TIMEOUT_VALUE:I

.field Context:I

.field Context64:J

.field DOWNLOAD_TIMEOUT_VALUE:I

.field RefCount:I

.field _timer:Ljava/util/Timer;

.field connnection:Ljava/net/HttpURLConnection;

.field data:[B

.field nDataLength:I

.field nErrorFromTimer:I

.field final synthetic this$0:Lcom/trueaxis/server/Server;

.field urlStr:Ljava/lang/String;

.field useUrlencoded:Z


# direct methods
.method constructor <init>(Lcom/trueaxis/server/Server;ZLjava/lang/String;[BIII)V
    .locals 0

    .line 45
    iput-object p1, p0, Lcom/trueaxis/server/Server$postThread;->this$0:Lcom/trueaxis/server/Server;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    const/16 p1, 0x7530

    .line 41
    iput p1, p0, Lcom/trueaxis/server/Server$postThread;->CONNECTION_TIMEOUT_VALUE:I

    .line 42
    iput p1, p0, Lcom/trueaxis/server/Server$postThread;->DOWNLOAD_TIMEOUT_VALUE:I

    .line 46
    iput-boolean p2, p0, Lcom/trueaxis/server/Server$postThread;->useUrlencoded:Z

    .line 47
    iput-object p3, p0, Lcom/trueaxis/server/Server$postThread;->urlStr:Ljava/lang/String;

    .line 48
    iput-object p4, p0, Lcom/trueaxis/server/Server$postThread;->data:[B

    .line 49
    iput p5, p0, Lcom/trueaxis/server/Server$postThread;->nDataLength:I

    .line 50
    iput p6, p0, Lcom/trueaxis/server/Server$postThread;->Context:I

    .line 51
    iput p7, p0, Lcom/trueaxis/server/Server$postThread;->RefCount:I

    return-void
.end method

.method constructor <init>(Lcom/trueaxis/server/Server;ZLjava/lang/String;[BIJI)V
    .locals 0

    .line 54
    iput-object p1, p0, Lcom/trueaxis/server/Server$postThread;->this$0:Lcom/trueaxis/server/Server;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    const/16 p1, 0x7530

    .line 41
    iput p1, p0, Lcom/trueaxis/server/Server$postThread;->CONNECTION_TIMEOUT_VALUE:I

    .line 42
    iput p1, p0, Lcom/trueaxis/server/Server$postThread;->DOWNLOAD_TIMEOUT_VALUE:I

    .line 55
    iput-boolean p2, p0, Lcom/trueaxis/server/Server$postThread;->useUrlencoded:Z

    .line 56
    iput-object p3, p0, Lcom/trueaxis/server/Server$postThread;->urlStr:Ljava/lang/String;

    .line 57
    iput-object p4, p0, Lcom/trueaxis/server/Server$postThread;->data:[B

    .line 58
    iput p5, p0, Lcom/trueaxis/server/Server$postThread;->nDataLength:I

    .line 59
    iput-wide p6, p0, Lcom/trueaxis/server/Server$postThread;->Context64:J

    .line 60
    iput p8, p0, Lcom/trueaxis/server/Server$postThread;->RefCount:I

    return-void
.end method


# virtual methods
.method public cancelDLC()V
    .locals 2

    const/4 v0, 0x1

    .line 228
    iput v0, p0, Lcom/trueaxis/server/Server$postThread;->nErrorFromTimer:I

    .line 229
    iget-wide v0, p0, Lcom/trueaxis/server/Server$postThread;->Context64:J

    invoke-static {v0, v1}, Lcom/trueaxis/cLib/TrueaxisLib;->DlcError(J)V

    .line 230
    iget-object v0, p0, Lcom/trueaxis/server/Server$postThread;->_timer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 231
    iget-object v0, p0, Lcom/trueaxis/server/Server$postThread;->_timer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->purge()I

    .line 232
    iget-object v0, p0, Lcom/trueaxis/server/Server$postThread;->connnection:Ljava/net/HttpURLConnection;

    if-eqz v0, :cond_0

    .line 234
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_0
    return-void
.end method

.method public cancelGetOrPost()V
    .locals 5

    const/4 v0, 0x1

    .line 250
    iput v0, p0, Lcom/trueaxis/server/Server$postThread;->nErrorFromTimer:I

    .line 251
    iget v1, p0, Lcom/trueaxis/server/Server$postThread;->Context:I

    const/16 v2, 0x1f4

    const/4 v3, -0x1

    if-ne v1, v3, :cond_1

    .line 253
    iget v3, p0, Lcom/trueaxis/server/Server$postThread;->RefCount:I

    if-eqz v3, :cond_0

    sub-int/2addr v3, v0

    .line 255
    iput v3, p0, Lcom/trueaxis/server/Server$postThread;->RefCount:I

    .line 256
    iget-object v0, p0, Lcom/trueaxis/server/Server$postThread;->this$0:Lcom/trueaxis/server/Server;

    iget-object v2, p0, Lcom/trueaxis/server/Server$postThread;->urlStr:Ljava/lang/String;

    iget v3, p0, Lcom/trueaxis/server/Server$postThread;->RefCount:I

    invoke-virtual {v0, v2, v1, v3}, Lcom/trueaxis/server/Server;->TaServer_GetWithRef(Ljava/lang/String;II)V

    goto :goto_0

    .line 260
    :cond_0
    invoke-static {v2, v1}, Lcom/trueaxis/cLib/TrueaxisLib;->ServerError(II)V

    .line 262
    :goto_0
    iget-object v0, p0, Lcom/trueaxis/server/Server$postThread;->_timer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 263
    iget-object v0, p0, Lcom/trueaxis/server/Server$postThread;->_timer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->purge()I

    .line 264
    iget-object v0, p0, Lcom/trueaxis/server/Server$postThread;->connnection:Ljava/net/HttpURLConnection;

    if-eqz v0, :cond_4

    .line 266
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    goto :goto_1

    .line 271
    :cond_1
    iget v1, p0, Lcom/trueaxis/server/Server$postThread;->RefCount:I

    const/4 v3, 0x0

    if-eqz v1, :cond_3

    invoke-static {}, Lcom/trueaxis/server/Server;->access$100()[I

    move-result-object v1

    iget v4, p0, Lcom/trueaxis/server/Server$postThread;->Context:I

    aget v1, v1, v4

    if-ne v1, v0, :cond_3

    .line 273
    iget-object v1, p0, Lcom/trueaxis/server/Server$postThread;->_timer:Ljava/util/Timer;

    invoke-virtual {v1}, Ljava/util/Timer;->cancel()V

    .line 274
    iget-object v1, p0, Lcom/trueaxis/server/Server$postThread;->_timer:Ljava/util/Timer;

    invoke-virtual {v1}, Ljava/util/Timer;->purge()I

    .line 275
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v1

    iget v2, p0, Lcom/trueaxis/server/Server$postThread;->Context:I

    aget-object v1, v1, v2

    if-eqz v1, :cond_2

    .line 277
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v1

    iget v2, p0, Lcom/trueaxis/server/Server$postThread;->Context:I

    aget-object v1, v1, v2

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 278
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v1

    iget v2, p0, Lcom/trueaxis/server/Server$postThread;->Context:I

    aput-object v3, v1, v2

    .line 280
    :cond_2
    iget v1, p0, Lcom/trueaxis/server/Server$postThread;->RefCount:I

    sub-int/2addr v1, v0

    iput v1, p0, Lcom/trueaxis/server/Server$postThread;->RefCount:I

    .line 281
    iget-object v0, p0, Lcom/trueaxis/server/Server$postThread;->this$0:Lcom/trueaxis/server/Server;

    iget-object v1, p0, Lcom/trueaxis/server/Server$postThread;->urlStr:Ljava/lang/String;

    iget v2, p0, Lcom/trueaxis/server/Server$postThread;->Context:I

    iget v3, p0, Lcom/trueaxis/server/Server$postThread;->RefCount:I

    invoke-virtual {v0, v1, v2, v3}, Lcom/trueaxis/server/Server;->TaServer_GetWithRef(Ljava/lang/String;II)V

    goto :goto_1

    .line 285
    :cond_3
    iget v0, p0, Lcom/trueaxis/server/Server$postThread;->Context:I

    invoke-static {v2, v0}, Lcom/trueaxis/cLib/TrueaxisLib;->ServerError(II)V

    .line 286
    iget-object v0, p0, Lcom/trueaxis/server/Server$postThread;->_timer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 287
    iget-object v0, p0, Lcom/trueaxis/server/Server$postThread;->_timer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->purge()I

    .line 288
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v1, p0, Lcom/trueaxis/server/Server$postThread;->Context:I

    aget-object v0, v0, v1

    if-eqz v0, :cond_4

    .line 290
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v1, p0, Lcom/trueaxis/server/Server$postThread;->Context:I

    aget-object v0, v0, v1

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 291
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v1, p0, Lcom/trueaxis/server/Server$postThread;->Context:I

    aput-object v3, v0, v1

    :cond_4
    :goto_1
    return-void
.end method

.method public cancelVerify()V
    .locals 2

    const/4 v0, 0x1

    .line 239
    iput v0, p0, Lcom/trueaxis/server/Server$postThread;->nErrorFromTimer:I

    .line 240
    iget-wide v0, p0, Lcom/trueaxis/server/Server$postThread;->Context64:J

    invoke-static {v0, v1}, Lcom/trueaxis/cLib/TrueaxisLib;->IAPCheckFail(J)V

    .line 241
    iget-object v0, p0, Lcom/trueaxis/server/Server$postThread;->_timer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 242
    iget-object v0, p0, Lcom/trueaxis/server/Server$postThread;->_timer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->purge()I

    .line 243
    iget-object v0, p0, Lcom/trueaxis/server/Server$postThread;->connnection:Ljava/net/HttpURLConnection;

    if-eqz v0, :cond_0

    .line 245
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_0
    return-void
.end method

.method protected readStreamWithTimeOut(Ljava/io/InputStream;I)[B
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0x400

    new-array v0, v0, [B

    .line 300
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    array-length v2, v0

    invoke-direct {v1, v2}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 303
    new-instance v2, Lcom/trueaxis/server/Server$postThread$ResettableTimer;

    invoke-direct {v2, p0, p0, p2}, Lcom/trueaxis/server/Server$postThread$ResettableTimer;-><init>(Lcom/trueaxis/server/Server$postThread;Lcom/trueaxis/server/Server$postThread;I)V

    .line 304
    iget p2, p0, Lcom/trueaxis/server/Server$postThread;->DOWNLOAD_TIMEOUT_VALUE:I

    invoke-virtual {v2, p2}, Lcom/trueaxis/server/Server$postThread$ResettableTimer;->start(I)V

    .line 309
    :goto_0
    :try_start_0
    array-length p2, v0

    const/4 v3, 0x0

    invoke-virtual {p1, v0, v3, p2}, Ljava/io/InputStream;->read([BII)I

    move-result p2

    const/4 v4, -0x1

    if-eq p2, v4, :cond_0

    .line 311
    invoke-virtual {v1, v0, v3, p2}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 312
    invoke-virtual {v2}, Lcom/trueaxis/server/Server$postThread$ResettableTimer;->restartTimer()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 322
    :catch_0
    :cond_0
    invoke-virtual {v2}, Lcom/trueaxis/server/Server$postThread$ResettableTimer;->finishedTask()V

    .line 325
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p1

    return-object p1
.end method
