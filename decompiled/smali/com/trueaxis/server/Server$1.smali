.class Lcom/trueaxis/server/Server$1;
.super Lcom/trueaxis/server/Server$postThread;
.source "Server.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/server/Server;->TaServer_GetWithRef(Ljava/lang/String;II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trueaxis/server/Server;


# direct methods
.method constructor <init>(Lcom/trueaxis/server/Server;ZLjava/lang/String;[BIII)V
    .locals 0

    .line 376
    iput-object p1, p0, Lcom/trueaxis/server/Server$1;->this$0:Lcom/trueaxis/server/Server;

    invoke-direct/range {p0 .. p7}, Lcom/trueaxis/server/Server$postThread;-><init>(Lcom/trueaxis/server/Server;ZLjava/lang/String;[BIII)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    const/4 v0, 0x0

    const/16 v1, 0x1f4

    const/4 v2, 0x0

    .line 381
    :try_start_0
    iput v0, p0, Lcom/trueaxis/server/Server$1;->nErrorFromTimer:I

    .line 382
    new-instance v0, Ljava/net/URL;

    iget-object v3, p0, Lcom/trueaxis/server/Server$1;->urlStr:Ljava/lang/String;

    invoke-direct {v0, v3}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 383
    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_9
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_8
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_7
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_6
    .catch Ljava/util/NoSuchElementException; {:try_start_0 .. :try_end_0} :catch_5
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 384
    :try_start_1
    iput-object v0, p0, Lcom/trueaxis/server/Server$1;->connnection:Ljava/net/HttpURLConnection;

    .line 386
    new-instance v2, Ljava/util/Timer;

    invoke-direct {v2}, Ljava/util/Timer;-><init>()V

    iput-object v2, p0, Lcom/trueaxis/server/Server$1;->_timer:Ljava/util/Timer;

    .line 387
    iget-object v2, p0, Lcom/trueaxis/server/Server$1;->_timer:Ljava/util/Timer;

    new-instance v3, Lcom/trueaxis/server/Server$postThread$Timeout;

    const/4 v4, 0x2

    invoke-direct {v3, p0, p0, v4}, Lcom/trueaxis/server/Server$postThread$Timeout;-><init>(Lcom/trueaxis/server/Server$postThread;Lcom/trueaxis/server/Server$postThread;I)V

    iget v5, p0, Lcom/trueaxis/server/Server$1;->CONNECTION_TIMEOUT_VALUE:I

    int-to-long v5, v5

    invoke-virtual {v2, v3, v5, v6}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    .line 388
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v2

    .line 389
    iget-object v3, p0, Lcom/trueaxis/server/Server$1;->_timer:Ljava/util/Timer;

    invoke-virtual {v3}, Ljava/util/Timer;->cancel()V

    .line 390
    iget-object v3, p0, Lcom/trueaxis/server/Server$1;->_timer:Ljava/util/Timer;

    invoke-virtual {v3}, Ljava/util/Timer;->purge()I

    const/16 v3, 0xc8

    if-ne v2, v3, :cond_0

    .line 394
    new-instance v2, Ljava/util/Timer;

    invoke-direct {v2}, Ljava/util/Timer;-><init>()V

    iput-object v2, p0, Lcom/trueaxis/server/Server$1;->_timer:Ljava/util/Timer;

    .line 395
    iget-object v2, p0, Lcom/trueaxis/server/Server$1;->_timer:Ljava/util/Timer;

    new-instance v3, Lcom/trueaxis/server/Server$postThread$Timeout;

    invoke-direct {v3, p0, p0, v4}, Lcom/trueaxis/server/Server$postThread$Timeout;-><init>(Lcom/trueaxis/server/Server$postThread;Lcom/trueaxis/server/Server$postThread;I)V

    iget v5, p0, Lcom/trueaxis/server/Server$1;->CONNECTION_TIMEOUT_VALUE:I

    int-to-long v5, v5

    invoke-virtual {v2, v3, v5, v6}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    .line 396
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    .line 397
    iget-object v3, p0, Lcom/trueaxis/server/Server$1;->_timer:Ljava/util/Timer;

    invoke-virtual {v3}, Ljava/util/Timer;->cancel()V

    .line 398
    iget-object v3, p0, Lcom/trueaxis/server/Server$1;->_timer:Ljava/util/Timer;

    invoke-virtual {v3}, Ljava/util/Timer;->purge()I

    .line 400
    new-instance v3, Ljava/io/BufferedInputStream;

    invoke-direct {v3, v2}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 401
    invoke-virtual {p0, v3, v4}, Lcom/trueaxis/server/Server$1;->readStreamWithTimeOut(Ljava/io/InputStream;I)[B

    move-result-object v2

    .line 402
    invoke-virtual {v3}, Ljava/io/BufferedInputStream;->close()V

    .line 403
    array-length v3, v2

    iget v4, p0, Lcom/trueaxis/server/Server$1;->Context:I

    invoke-static {v2, v3, v4}, Lcom/trueaxis/cLib/TrueaxisLib;->ServerResponse([BII)V

    goto :goto_0

    .line 407
    :cond_0
    iget v3, p0, Lcom/trueaxis/server/Server$1;->nErrorFromTimer:I

    if-nez v3, :cond_1

    .line 408
    iget v3, p0, Lcom/trueaxis/server/Server$1;->Context:I

    invoke-static {v2, v3}, Lcom/trueaxis/cLib/TrueaxisLib;->ServerError(II)V
    :try_end_1
    .catch Ljava/net/MalformedURLException; {:try_start_1 .. :try_end_1} :catch_4
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/NullPointerException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/util/NoSuchElementException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_1
    :goto_0
    if-eqz v0, :cond_b

    .line 467
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    goto/16 :goto_b

    :catchall_0
    move-exception v1

    move-object v2, v0

    goto/16 :goto_c

    :catch_0
    move-object v2, v0

    goto :goto_1

    :catch_1
    move-object v2, v0

    goto :goto_3

    :catch_2
    move-object v2, v0

    goto :goto_5

    :catch_3
    move-object v2, v0

    goto/16 :goto_7

    :catch_4
    move-object v2, v0

    goto/16 :goto_9

    :catchall_1
    move-exception v1

    goto/16 :goto_c

    .line 453
    :catch_5
    :goto_1
    :try_start_2
    iget v0, p0, Lcom/trueaxis/server/Server$1;->nErrorFromTimer:I

    if-nez v0, :cond_3

    .line 455
    iget v0, p0, Lcom/trueaxis/server/Server$1;->RefCount:I

    if-eqz v0, :cond_2

    .line 457
    iget v0, p0, Lcom/trueaxis/server/Server$1;->RefCount:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/trueaxis/server/Server$1;->RefCount:I

    .line 458
    iget-object v0, p0, Lcom/trueaxis/server/Server$1;->this$0:Lcom/trueaxis/server/Server;

    iget-object v1, p0, Lcom/trueaxis/server/Server$1;->urlStr:Ljava/lang/String;

    iget v3, p0, Lcom/trueaxis/server/Server$1;->Context:I

    iget v4, p0, Lcom/trueaxis/server/Server$1;->RefCount:I

    invoke-virtual {v0, v1, v3, v4}, Lcom/trueaxis/server/Server;->TaServer_GetWithRef(Ljava/lang/String;II)V

    goto :goto_2

    .line 462
    :cond_2
    iget v0, p0, Lcom/trueaxis/server/Server$1;->Context:I

    invoke-static {v1, v0}, Lcom/trueaxis/cLib/TrueaxisLib;->ServerError(II)V

    :cond_3
    :goto_2
    if-eqz v2, :cond_b

    goto/16 :goto_a

    .line 440
    :catch_6
    :goto_3
    iget v0, p0, Lcom/trueaxis/server/Server$1;->nErrorFromTimer:I

    if-nez v0, :cond_5

    .line 442
    iget v0, p0, Lcom/trueaxis/server/Server$1;->RefCount:I

    if-eqz v0, :cond_4

    .line 444
    iget v0, p0, Lcom/trueaxis/server/Server$1;->RefCount:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/trueaxis/server/Server$1;->RefCount:I

    .line 445
    iget-object v0, p0, Lcom/trueaxis/server/Server$1;->this$0:Lcom/trueaxis/server/Server;

    iget-object v1, p0, Lcom/trueaxis/server/Server$1;->urlStr:Ljava/lang/String;

    iget v3, p0, Lcom/trueaxis/server/Server$1;->Context:I

    iget v4, p0, Lcom/trueaxis/server/Server$1;->RefCount:I

    invoke-virtual {v0, v1, v3, v4}, Lcom/trueaxis/server/Server;->TaServer_GetWithRef(Ljava/lang/String;II)V

    goto :goto_4

    .line 449
    :cond_4
    iget v0, p0, Lcom/trueaxis/server/Server$1;->Context:I

    invoke-static {v1, v0}, Lcom/trueaxis/cLib/TrueaxisLib;->ServerError(II)V

    :cond_5
    :goto_4
    if-eqz v2, :cond_b

    goto :goto_a

    .line 427
    :catch_7
    :goto_5
    iget v0, p0, Lcom/trueaxis/server/Server$1;->nErrorFromTimer:I

    if-nez v0, :cond_7

    .line 429
    iget v0, p0, Lcom/trueaxis/server/Server$1;->RefCount:I

    if-eqz v0, :cond_6

    .line 431
    iget v0, p0, Lcom/trueaxis/server/Server$1;->RefCount:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/trueaxis/server/Server$1;->RefCount:I

    .line 432
    iget-object v0, p0, Lcom/trueaxis/server/Server$1;->this$0:Lcom/trueaxis/server/Server;

    iget-object v1, p0, Lcom/trueaxis/server/Server$1;->urlStr:Ljava/lang/String;

    iget v3, p0, Lcom/trueaxis/server/Server$1;->Context:I

    iget v4, p0, Lcom/trueaxis/server/Server$1;->RefCount:I

    invoke-virtual {v0, v1, v3, v4}, Lcom/trueaxis/server/Server;->TaServer_GetWithRef(Ljava/lang/String;II)V

    goto :goto_6

    .line 436
    :cond_6
    iget v0, p0, Lcom/trueaxis/server/Server$1;->Context:I

    invoke-static {v1, v0}, Lcom/trueaxis/cLib/TrueaxisLib;->ServerError(II)V

    :cond_7
    :goto_6
    if-eqz v2, :cond_b

    goto :goto_a

    .line 414
    :catch_8
    :goto_7
    iget v0, p0, Lcom/trueaxis/server/Server$1;->nErrorFromTimer:I

    if-nez v0, :cond_9

    .line 416
    iget v0, p0, Lcom/trueaxis/server/Server$1;->RefCount:I

    if-eqz v0, :cond_8

    .line 418
    iget v0, p0, Lcom/trueaxis/server/Server$1;->RefCount:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/trueaxis/server/Server$1;->RefCount:I

    .line 419
    iget-object v0, p0, Lcom/trueaxis/server/Server$1;->this$0:Lcom/trueaxis/server/Server;

    iget-object v1, p0, Lcom/trueaxis/server/Server$1;->urlStr:Ljava/lang/String;

    iget v3, p0, Lcom/trueaxis/server/Server$1;->Context:I

    iget v4, p0, Lcom/trueaxis/server/Server$1;->RefCount:I

    invoke-virtual {v0, v1, v3, v4}, Lcom/trueaxis/server/Server;->TaServer_GetWithRef(Ljava/lang/String;II)V

    goto :goto_8

    .line 423
    :cond_8
    iget v0, p0, Lcom/trueaxis/server/Server$1;->Context:I

    invoke-static {v1, v0}, Lcom/trueaxis/cLib/TrueaxisLib;->ServerError(II)V

    :cond_9
    :goto_8
    if-eqz v2, :cond_b

    goto :goto_a

    .line 411
    :catch_9
    :goto_9
    iget v0, p0, Lcom/trueaxis/server/Server$1;->nErrorFromTimer:I

    if-nez v0, :cond_a

    .line 412
    iget v0, p0, Lcom/trueaxis/server/Server$1;->Context:I

    invoke-static {v1, v0}, Lcom/trueaxis/cLib/TrueaxisLib;->ServerError(II)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :cond_a
    if-eqz v2, :cond_b

    .line 467
    :goto_a
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_b
    :goto_b
    return-void

    :goto_c
    if-eqz v2, :cond_c

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 468
    :cond_c
    throw v1
.end method
