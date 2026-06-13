.class Lcom/trueaxis/server/Server$2;
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

    .line 482
    iput-object p1, p0, Lcom/trueaxis/server/Server$2;->this$0:Lcom/trueaxis/server/Server;

    invoke-direct/range {p0 .. p7}, Lcom/trueaxis/server/Server$postThread;-><init>(Lcom/trueaxis/server/Server;ZLjava/lang/String;[BIII)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .line 485
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v1, p0, Lcom/trueaxis/server/Server$2;->Context:I

    aget-object v0, v0, v1

    if-eqz v0, :cond_0

    return-void

    .line 487
    :cond_0
    invoke-static {}, Lcom/trueaxis/server/Server;->access$100()[I

    move-result-object v0

    iget v1, p0, Lcom/trueaxis/server/Server$2;->Context:I

    const/4 v2, 0x1

    aput v2, v0, v1

    .line 489
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v1, p0, Lcom/trueaxis/server/Server$2;->Context:I

    const/4 v3, 0x0

    aput-object v3, v0, v1

    const/4 v0, 0x0

    const/16 v1, 0x1f4

    .line 491
    :try_start_0
    iput v0, p0, Lcom/trueaxis/server/Server$2;->nErrorFromTimer:I

    .line 492
    new-instance v0, Ljava/net/URL;

    iget-object v4, p0, Lcom/trueaxis/server/Server$2;->urlStr:Ljava/lang/String;

    invoke-direct {v0, v4}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 493
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v4

    iget v5, p0, Lcom/trueaxis/server/Server$2;->Context:I

    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    aput-object v0, v4, v5

    .line 494
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v4, p0, Lcom/trueaxis/server/Server$2;->Context:I

    aget-object v0, v0, v4

    iput-object v0, p0, Lcom/trueaxis/server/Server$2;->connnection:Ljava/net/HttpURLConnection;

    .line 496
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Lcom/trueaxis/server/Server$2;->_timer:Ljava/util/Timer;

    .line 497
    iget-object v0, p0, Lcom/trueaxis/server/Server$2;->_timer:Ljava/util/Timer;

    new-instance v4, Lcom/trueaxis/server/Server$postThread$Timeout;

    const/4 v5, 0x2

    invoke-direct {v4, p0, p0, v5}, Lcom/trueaxis/server/Server$postThread$Timeout;-><init>(Lcom/trueaxis/server/Server$postThread;Lcom/trueaxis/server/Server$postThread;I)V

    iget v6, p0, Lcom/trueaxis/server/Server$2;->CONNECTION_TIMEOUT_VALUE:I

    int-to-long v6, v6

    invoke-virtual {v0, v4, v6, v7}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    .line 498
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v4, p0, Lcom/trueaxis/server/Server$2;->Context:I

    aget-object v0, v0, v4

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v0

    .line 499
    iget-object v4, p0, Lcom/trueaxis/server/Server$2;->_timer:Ljava/util/Timer;

    invoke-virtual {v4}, Ljava/util/Timer;->cancel()V

    .line 500
    iget-object v4, p0, Lcom/trueaxis/server/Server$2;->_timer:Ljava/util/Timer;

    invoke-virtual {v4}, Ljava/util/Timer;->purge()I

    const/16 v4, 0xc8

    if-ne v0, v4, :cond_1

    .line 504
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Lcom/trueaxis/server/Server$2;->_timer:Ljava/util/Timer;

    .line 505
    iget-object v0, p0, Lcom/trueaxis/server/Server$2;->_timer:Ljava/util/Timer;

    new-instance v4, Lcom/trueaxis/server/Server$postThread$Timeout;

    invoke-direct {v4, p0, p0, v5}, Lcom/trueaxis/server/Server$postThread$Timeout;-><init>(Lcom/trueaxis/server/Server$postThread;Lcom/trueaxis/server/Server$postThread;I)V

    iget v6, p0, Lcom/trueaxis/server/Server$2;->CONNECTION_TIMEOUT_VALUE:I

    int-to-long v6, v6

    invoke-virtual {v0, v4, v6, v7}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    .line 506
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v4, p0, Lcom/trueaxis/server/Server$2;->Context:I

    aget-object v0, v0, v4

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    .line 507
    iget-object v4, p0, Lcom/trueaxis/server/Server$2;->_timer:Ljava/util/Timer;

    invoke-virtual {v4}, Ljava/util/Timer;->cancel()V

    .line 508
    iget-object v4, p0, Lcom/trueaxis/server/Server$2;->_timer:Ljava/util/Timer;

    invoke-virtual {v4}, Ljava/util/Timer;->purge()I

    .line 510
    new-instance v4, Ljava/io/BufferedInputStream;

    invoke-direct {v4, v0}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 511
    invoke-virtual {p0, v4, v5}, Lcom/trueaxis/server/Server$2;->readStreamWithTimeOut(Ljava/io/InputStream;I)[B

    move-result-object v0

    .line 512
    invoke-virtual {v4}, Ljava/io/BufferedInputStream;->close()V

    .line 513
    array-length v4, v0

    iget v5, p0, Lcom/trueaxis/server/Server$2;->Context:I

    invoke-static {v0, v4, v5}, Lcom/trueaxis/cLib/TrueaxisLib;->ServerResponse([BII)V

    goto :goto_0

    .line 517
    :cond_1
    iget v4, p0, Lcom/trueaxis/server/Server$2;->nErrorFromTimer:I

    if-nez v4, :cond_2

    .line 518
    iget v4, p0, Lcom/trueaxis/server/Server$2;->Context:I

    invoke-static {v0, v4}, Lcom/trueaxis/cLib/TrueaxisLib;->ServerError(II)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/NoSuchElementException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 585
    :cond_2
    :goto_0
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v1, p0, Lcom/trueaxis/server/Server$2;->Context:I

    aget-object v0, v0, v1

    if-eqz v0, :cond_c

    .line 587
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v1, p0, Lcom/trueaxis/server/Server$2;->Context:I

    aget-object v0, v0, v1

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 588
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v1, p0, Lcom/trueaxis/server/Server$2;->Context:I

    aput-object v3, v0, v1

    goto/16 :goto_5

    :catchall_0
    move-exception v0

    goto/16 :goto_6

    .line 570
    :catch_0
    :try_start_1
    iget v0, p0, Lcom/trueaxis/server/Server$2;->nErrorFromTimer:I

    if-nez v0, :cond_4

    .line 572
    iget v0, p0, Lcom/trueaxis/server/Server$2;->RefCount:I

    if-eqz v0, :cond_3

    invoke-static {}, Lcom/trueaxis/server/Server;->access$100()[I

    move-result-object v0

    iget v4, p0, Lcom/trueaxis/server/Server$2;->Context:I

    aget v0, v0, v4

    if-ne v0, v2, :cond_3

    .line 574
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v1, p0, Lcom/trueaxis/server/Server$2;->Context:I

    aput-object v3, v0, v1

    .line 575
    iget v0, p0, Lcom/trueaxis/server/Server$2;->RefCount:I

    sub-int/2addr v0, v2

    iput v0, p0, Lcom/trueaxis/server/Server$2;->RefCount:I

    .line 576
    iget-object v0, p0, Lcom/trueaxis/server/Server$2;->this$0:Lcom/trueaxis/server/Server;

    iget-object v1, p0, Lcom/trueaxis/server/Server$2;->urlStr:Ljava/lang/String;

    iget v2, p0, Lcom/trueaxis/server/Server$2;->Context:I

    iget v4, p0, Lcom/trueaxis/server/Server$2;->RefCount:I

    invoke-virtual {v0, v1, v2, v4}, Lcom/trueaxis/server/Server;->TaServer_GetWithRef(Ljava/lang/String;II)V

    goto :goto_1

    .line 580
    :cond_3
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v2, p0, Lcom/trueaxis/server/Server$2;->Context:I

    aput-object v3, v0, v2

    .line 581
    iget v0, p0, Lcom/trueaxis/server/Server$2;->Context:I

    invoke-static {v1, v0}, Lcom/trueaxis/cLib/TrueaxisLib;->ServerError(II)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 585
    :cond_4
    :goto_1
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v1, p0, Lcom/trueaxis/server/Server$2;->Context:I

    aget-object v0, v0, v1

    if-eqz v0, :cond_c

    .line 587
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v1, p0, Lcom/trueaxis/server/Server$2;->Context:I

    aget-object v0, v0, v1

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 588
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v1, p0, Lcom/trueaxis/server/Server$2;->Context:I

    aput-object v3, v0, v1

    goto/16 :goto_5

    .line 555
    :catch_1
    :try_start_2
    iget v0, p0, Lcom/trueaxis/server/Server$2;->nErrorFromTimer:I

    if-nez v0, :cond_6

    .line 557
    iget v0, p0, Lcom/trueaxis/server/Server$2;->RefCount:I

    if-eqz v0, :cond_5

    invoke-static {}, Lcom/trueaxis/server/Server;->access$100()[I

    move-result-object v0

    iget v4, p0, Lcom/trueaxis/server/Server$2;->Context:I

    aget v0, v0, v4

    if-ne v0, v2, :cond_5

    .line 559
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v1, p0, Lcom/trueaxis/server/Server$2;->Context:I

    aput-object v3, v0, v1

    .line 560
    iget v0, p0, Lcom/trueaxis/server/Server$2;->RefCount:I

    sub-int/2addr v0, v2

    iput v0, p0, Lcom/trueaxis/server/Server$2;->RefCount:I

    .line 561
    iget-object v0, p0, Lcom/trueaxis/server/Server$2;->this$0:Lcom/trueaxis/server/Server;

    iget-object v1, p0, Lcom/trueaxis/server/Server$2;->urlStr:Ljava/lang/String;

    iget v2, p0, Lcom/trueaxis/server/Server$2;->Context:I

    iget v4, p0, Lcom/trueaxis/server/Server$2;->RefCount:I

    invoke-virtual {v0, v1, v2, v4}, Lcom/trueaxis/server/Server;->TaServer_GetWithRef(Ljava/lang/String;II)V

    goto :goto_2

    .line 565
    :cond_5
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v2, p0, Lcom/trueaxis/server/Server$2;->Context:I

    aput-object v3, v0, v2

    .line 566
    iget v0, p0, Lcom/trueaxis/server/Server$2;->Context:I

    invoke-static {v1, v0}, Lcom/trueaxis/cLib/TrueaxisLib;->ServerError(II)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 585
    :cond_6
    :goto_2
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v1, p0, Lcom/trueaxis/server/Server$2;->Context:I

    aget-object v0, v0, v1

    if-eqz v0, :cond_c

    .line 587
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v1, p0, Lcom/trueaxis/server/Server$2;->Context:I

    aget-object v0, v0, v1

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 588
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v1, p0, Lcom/trueaxis/server/Server$2;->Context:I

    aput-object v3, v0, v1

    goto/16 :goto_5

    .line 540
    :catch_2
    :try_start_3
    iget v0, p0, Lcom/trueaxis/server/Server$2;->nErrorFromTimer:I

    if-nez v0, :cond_8

    .line 542
    iget v0, p0, Lcom/trueaxis/server/Server$2;->RefCount:I

    if-eqz v0, :cond_7

    invoke-static {}, Lcom/trueaxis/server/Server;->access$100()[I

    move-result-object v0

    iget v4, p0, Lcom/trueaxis/server/Server$2;->Context:I

    aget v0, v0, v4

    if-ne v0, v2, :cond_7

    .line 544
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v1, p0, Lcom/trueaxis/server/Server$2;->Context:I

    aput-object v3, v0, v1

    .line 545
    iget v0, p0, Lcom/trueaxis/server/Server$2;->RefCount:I

    sub-int/2addr v0, v2

    iput v0, p0, Lcom/trueaxis/server/Server$2;->RefCount:I

    .line 546
    iget-object v0, p0, Lcom/trueaxis/server/Server$2;->this$0:Lcom/trueaxis/server/Server;

    iget-object v1, p0, Lcom/trueaxis/server/Server$2;->urlStr:Ljava/lang/String;

    iget v2, p0, Lcom/trueaxis/server/Server$2;->Context:I

    iget v4, p0, Lcom/trueaxis/server/Server$2;->RefCount:I

    invoke-virtual {v0, v1, v2, v4}, Lcom/trueaxis/server/Server;->TaServer_GetWithRef(Ljava/lang/String;II)V

    goto :goto_3

    .line 550
    :cond_7
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v2, p0, Lcom/trueaxis/server/Server$2;->Context:I

    aput-object v3, v0, v2

    .line 551
    iget v0, p0, Lcom/trueaxis/server/Server$2;->Context:I

    invoke-static {v1, v0}, Lcom/trueaxis/cLib/TrueaxisLib;->ServerError(II)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 585
    :cond_8
    :goto_3
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v1, p0, Lcom/trueaxis/server/Server$2;->Context:I

    aget-object v0, v0, v1

    if-eqz v0, :cond_c

    .line 587
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v1, p0, Lcom/trueaxis/server/Server$2;->Context:I

    aget-object v0, v0, v1

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 588
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v1, p0, Lcom/trueaxis/server/Server$2;->Context:I

    aput-object v3, v0, v1

    goto/16 :goto_5

    .line 525
    :catch_3
    :try_start_4
    iget v0, p0, Lcom/trueaxis/server/Server$2;->nErrorFromTimer:I

    if-nez v0, :cond_a

    .line 527
    iget v0, p0, Lcom/trueaxis/server/Server$2;->RefCount:I

    if-eqz v0, :cond_9

    invoke-static {}, Lcom/trueaxis/server/Server;->access$100()[I

    move-result-object v0

    iget v4, p0, Lcom/trueaxis/server/Server$2;->Context:I

    aget v0, v0, v4

    if-ne v0, v2, :cond_9

    .line 529
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v1, p0, Lcom/trueaxis/server/Server$2;->Context:I

    aput-object v3, v0, v1

    .line 530
    iget v0, p0, Lcom/trueaxis/server/Server$2;->RefCount:I

    sub-int/2addr v0, v2

    iput v0, p0, Lcom/trueaxis/server/Server$2;->RefCount:I

    .line 531
    iget-object v0, p0, Lcom/trueaxis/server/Server$2;->this$0:Lcom/trueaxis/server/Server;

    iget-object v1, p0, Lcom/trueaxis/server/Server$2;->urlStr:Ljava/lang/String;

    iget v2, p0, Lcom/trueaxis/server/Server$2;->Context:I

    iget v4, p0, Lcom/trueaxis/server/Server$2;->RefCount:I

    invoke-virtual {v0, v1, v2, v4}, Lcom/trueaxis/server/Server;->TaServer_GetWithRef(Ljava/lang/String;II)V

    goto :goto_4

    .line 535
    :cond_9
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v2, p0, Lcom/trueaxis/server/Server$2;->Context:I

    aput-object v3, v0, v2

    .line 536
    iget v0, p0, Lcom/trueaxis/server/Server$2;->Context:I

    invoke-static {v1, v0}, Lcom/trueaxis/cLib/TrueaxisLib;->ServerError(II)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 585
    :cond_a
    :goto_4
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v1, p0, Lcom/trueaxis/server/Server$2;->Context:I

    aget-object v0, v0, v1

    if-eqz v0, :cond_c

    .line 587
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v1, p0, Lcom/trueaxis/server/Server$2;->Context:I

    aget-object v0, v0, v1

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 588
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v1, p0, Lcom/trueaxis/server/Server$2;->Context:I

    aput-object v3, v0, v1

    goto :goto_5

    .line 521
    :catch_4
    :try_start_5
    iget v0, p0, Lcom/trueaxis/server/Server$2;->nErrorFromTimer:I

    if-nez v0, :cond_b

    .line 522
    iget v0, p0, Lcom/trueaxis/server/Server$2;->Context:I

    invoke-static {v1, v0}, Lcom/trueaxis/cLib/TrueaxisLib;->ServerError(II)V

    .line 523
    :cond_b
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v1, p0, Lcom/trueaxis/server/Server$2;->Context:I

    aput-object v3, v0, v1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 585
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v1, p0, Lcom/trueaxis/server/Server$2;->Context:I

    aget-object v0, v0, v1

    if-eqz v0, :cond_c

    .line 587
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v1, p0, Lcom/trueaxis/server/Server$2;->Context:I

    aget-object v0, v0, v1

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 588
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v1, p0, Lcom/trueaxis/server/Server$2;->Context:I

    aput-object v3, v0, v1

    :cond_c
    :goto_5
    return-void

    .line 585
    :goto_6
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v1

    iget v2, p0, Lcom/trueaxis/server/Server$2;->Context:I

    aget-object v1, v1, v2

    if-eqz v1, :cond_d

    .line 587
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v1

    iget v2, p0, Lcom/trueaxis/server/Server$2;->Context:I

    aget-object v1, v1, v2

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 588
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v1

    iget v2, p0, Lcom/trueaxis/server/Server$2;->Context:I

    aput-object v3, v1, v2

    .line 590
    :cond_d
    throw v0
.end method
