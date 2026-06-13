.class Lcom/trueaxis/server/Server$3;
.super Lcom/trueaxis/server/Server$postThread;
.source "Server.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/server/Server;->TaServer_PostWithRef(ZLjava/lang/String;[BIII)V
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

    .line 605
    iput-object p1, p0, Lcom/trueaxis/server/Server$3;->this$0:Lcom/trueaxis/server/Server;

    invoke-direct/range {p0 .. p7}, Lcom/trueaxis/server/Server$postThread;-><init>(Lcom/trueaxis/server/Server;ZLjava/lang/String;[BIII)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 11

    const/4 v0, 0x0

    const/4 v1, 0x1

    const/16 v2, 0x1f4

    const/4 v3, 0x0

    .line 609
    :try_start_0
    iput v0, p0, Lcom/trueaxis/server/Server$3;->nErrorFromTimer:I

    .line 610
    new-instance v4, Ljava/net/URL;

    iget-object v5, p0, Lcom/trueaxis/server/Server$3;->urlStr:Ljava/lang/String;

    invoke-direct {v4, v5}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 611
    invoke-virtual {v4}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v4

    check-cast v4, Ljava/net/HttpURLConnection;
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_9
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_8
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_7
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_6
    .catch Ljava/util/NoSuchElementException; {:try_start_0 .. :try_end_0} :catch_5
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 612
    :try_start_1
    iput-object v4, p0, Lcom/trueaxis/server/Server$3;->connnection:Ljava/net/HttpURLConnection;

    .line 614
    invoke-virtual {v4, v1}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 615
    invoke-virtual {v4, v0}, Ljava/net/HttpURLConnection;->setUseCaches(Z)V

    const-string v0, "POST"

    .line 616
    invoke-virtual {v4, v0}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 617
    iget-boolean v0, p0, Lcom/trueaxis/server/Server$3;->useUrlencoded:Z
    :try_end_1
    .catch Ljava/net/MalformedURLException; {:try_start_1 .. :try_end_1} :catch_4
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/NullPointerException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/util/NoSuchElementException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const-string v3, "Content-Type"

    if-eqz v0, :cond_0

    .line 618
    :try_start_2
    iget-object v0, p0, Lcom/trueaxis/server/Server$3;->data:[B

    array-length v0, v0

    invoke-virtual {v4, v0}, Ljava/net/HttpURLConnection;->setFixedLengthStreamingMode(I)V

    const-string v0, "application/x-www-form-urlencoded"

    .line 619
    invoke-virtual {v4, v3, v0}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 621
    :cond_0
    iget v0, p0, Lcom/trueaxis/server/Server$3;->nDataLength:I

    invoke-virtual {v4, v0}, Ljava/net/HttpURLConnection;->setFixedLengthStreamingMode(I)V

    const-string v0, "application/octet-stream"

    .line 622
    invoke-virtual {v4, v3, v0}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    const-string v0, "User-Agent"

    .line 624
    invoke-static {}, Lcom/trueaxis/server/Server;->access$300()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v0, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 625
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Lcom/trueaxis/server/Server$3;->_timer:Ljava/util/Timer;

    .line 626
    iget-object v0, p0, Lcom/trueaxis/server/Server$3;->_timer:Ljava/util/Timer;

    new-instance v3, Lcom/trueaxis/server/Server$postThread$Timeout;

    const/4 v5, 0x2

    invoke-direct {v3, p0, p0, v5}, Lcom/trueaxis/server/Server$postThread$Timeout;-><init>(Lcom/trueaxis/server/Server$postThread;Lcom/trueaxis/server/Server$postThread;I)V

    iget v6, p0, Lcom/trueaxis/server/Server$3;->CONNECTION_TIMEOUT_VALUE:I

    int-to-long v6, v6

    invoke-virtual {v0, v3, v6, v7}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    .line 627
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    .line 628
    iget-object v3, p0, Lcom/trueaxis/server/Server$3;->_timer:Ljava/util/Timer;

    invoke-virtual {v3}, Ljava/util/Timer;->cancel()V

    .line 629
    iget-object v3, p0, Lcom/trueaxis/server/Server$3;->_timer:Ljava/util/Timer;

    invoke-virtual {v3}, Ljava/util/Timer;->purge()I

    .line 630
    iget-object v3, p0, Lcom/trueaxis/server/Server$3;->data:[B

    invoke-virtual {v0, v3}, Ljava/io/OutputStream;->write([B)V

    .line 631
    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 632
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 634
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Lcom/trueaxis/server/Server$3;->_timer:Ljava/util/Timer;

    .line 635
    iget-object v0, p0, Lcom/trueaxis/server/Server$3;->_timer:Ljava/util/Timer;

    new-instance v3, Lcom/trueaxis/server/Server$postThread$Timeout;

    invoke-direct {v3, p0, p0, v5}, Lcom/trueaxis/server/Server$postThread$Timeout;-><init>(Lcom/trueaxis/server/Server$postThread;Lcom/trueaxis/server/Server$postThread;I)V

    iget v6, p0, Lcom/trueaxis/server/Server$3;->CONNECTION_TIMEOUT_VALUE:I

    int-to-long v6, v6

    invoke-virtual {v0, v3, v6, v7}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    .line 636
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v0

    .line 637
    iget-object v3, p0, Lcom/trueaxis/server/Server$3;->_timer:Ljava/util/Timer;

    invoke-virtual {v3}, Ljava/util/Timer;->cancel()V

    .line 638
    iget-object v3, p0, Lcom/trueaxis/server/Server$3;->_timer:Ljava/util/Timer;

    invoke-virtual {v3}, Ljava/util/Timer;->purge()I

    const/16 v3, 0xc8

    if-ne v0, v3, :cond_1

    .line 641
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Lcom/trueaxis/server/Server$3;->_timer:Ljava/util/Timer;

    .line 642
    iget-object v0, p0, Lcom/trueaxis/server/Server$3;->_timer:Ljava/util/Timer;

    new-instance v3, Lcom/trueaxis/server/Server$postThread$Timeout;

    invoke-direct {v3, p0, p0, v5}, Lcom/trueaxis/server/Server$postThread$Timeout;-><init>(Lcom/trueaxis/server/Server$postThread;Lcom/trueaxis/server/Server$postThread;I)V

    iget v6, p0, Lcom/trueaxis/server/Server$3;->CONNECTION_TIMEOUT_VALUE:I

    int-to-long v6, v6

    invoke-virtual {v0, v3, v6, v7}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    .line 643
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    .line 644
    iget-object v3, p0, Lcom/trueaxis/server/Server$3;->_timer:Ljava/util/Timer;

    invoke-virtual {v3}, Ljava/util/Timer;->cancel()V

    .line 645
    iget-object v3, p0, Lcom/trueaxis/server/Server$3;->_timer:Ljava/util/Timer;

    invoke-virtual {v3}, Ljava/util/Timer;->purge()I

    .line 647
    new-instance v3, Ljava/io/BufferedInputStream;

    invoke-direct {v3, v0}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 648
    invoke-virtual {p0, v3, v5}, Lcom/trueaxis/server/Server$3;->readStreamWithTimeOut(Ljava/io/InputStream;I)[B

    move-result-object v0

    .line 649
    invoke-virtual {v3}, Ljava/io/BufferedInputStream;->close()V

    .line 650
    array-length v3, v0

    iget v5, p0, Lcom/trueaxis/server/Server$3;->Context:I

    invoke-static {v0, v3, v5}, Lcom/trueaxis/cLib/TrueaxisLib;->ServerResponse([BII)V

    goto :goto_1

    .line 652
    :cond_1
    iget v3, p0, Lcom/trueaxis/server/Server$3;->nErrorFromTimer:I

    if-nez v3, :cond_2

    .line 653
    iget v3, p0, Lcom/trueaxis/server/Server$3;->Context:I

    invoke-static {v0, v3}, Lcom/trueaxis/cLib/TrueaxisLib;->ServerError(II)V
    :try_end_2
    .catch Ljava/net/MalformedURLException; {:try_start_2 .. :try_end_2} :catch_4
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Ljava/lang/NullPointerException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/lang/IllegalStateException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/util/NoSuchElementException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :cond_2
    :goto_1
    if-eqz v4, :cond_c

    .line 696
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->disconnect()V

    goto/16 :goto_c

    :catchall_0
    move-exception v0

    goto/16 :goto_d

    :catch_0
    move-object v3, v4

    goto :goto_2

    :catch_1
    move-object v3, v4

    goto :goto_4

    :catch_2
    move-object v3, v4

    goto :goto_6

    :catch_3
    move-object v3, v4

    goto/16 :goto_8

    :catch_4
    move-object v3, v4

    goto/16 :goto_a

    :catchall_1
    move-exception v0

    move-object v4, v3

    goto/16 :goto_d

    .line 686
    :catch_5
    :goto_2
    :try_start_3
    iget v0, p0, Lcom/trueaxis/server/Server$3;->nErrorFromTimer:I

    if-nez v0, :cond_4

    .line 687
    iget v0, p0, Lcom/trueaxis/server/Server$3;->RefCount:I

    if-eqz v0, :cond_3

    .line 688
    iget v0, p0, Lcom/trueaxis/server/Server$3;->RefCount:I

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/trueaxis/server/Server$3;->RefCount:I

    .line 689
    iget-object v4, p0, Lcom/trueaxis/server/Server$3;->this$0:Lcom/trueaxis/server/Server;

    iget-boolean v5, p0, Lcom/trueaxis/server/Server$3;->useUrlencoded:Z

    iget-object v6, p0, Lcom/trueaxis/server/Server$3;->urlStr:Ljava/lang/String;

    iget-object v7, p0, Lcom/trueaxis/server/Server$3;->data:[B

    iget v8, p0, Lcom/trueaxis/server/Server$3;->nDataLength:I

    iget v9, p0, Lcom/trueaxis/server/Server$3;->Context:I

    iget v10, p0, Lcom/trueaxis/server/Server$3;->RefCount:I

    invoke-virtual/range {v4 .. v10}, Lcom/trueaxis/server/Server;->TaServer_PostWithRef(ZLjava/lang/String;[BIII)V

    goto :goto_3

    .line 691
    :cond_3
    iget v0, p0, Lcom/trueaxis/server/Server$3;->Context:I

    invoke-static {v2, v0}, Lcom/trueaxis/cLib/TrueaxisLib;->ServerError(II)V

    :cond_4
    :goto_3
    if-eqz v3, :cond_c

    goto/16 :goto_b

    .line 677
    :catch_6
    :goto_4
    iget v0, p0, Lcom/trueaxis/server/Server$3;->nErrorFromTimer:I

    if-nez v0, :cond_6

    .line 678
    iget v0, p0, Lcom/trueaxis/server/Server$3;->RefCount:I

    if-eqz v0, :cond_5

    .line 679
    iget v0, p0, Lcom/trueaxis/server/Server$3;->RefCount:I

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/trueaxis/server/Server$3;->RefCount:I

    .line 680
    iget-object v4, p0, Lcom/trueaxis/server/Server$3;->this$0:Lcom/trueaxis/server/Server;

    iget-boolean v5, p0, Lcom/trueaxis/server/Server$3;->useUrlencoded:Z

    iget-object v6, p0, Lcom/trueaxis/server/Server$3;->urlStr:Ljava/lang/String;

    iget-object v7, p0, Lcom/trueaxis/server/Server$3;->data:[B

    iget v8, p0, Lcom/trueaxis/server/Server$3;->nDataLength:I

    iget v9, p0, Lcom/trueaxis/server/Server$3;->Context:I

    iget v10, p0, Lcom/trueaxis/server/Server$3;->RefCount:I

    invoke-virtual/range {v4 .. v10}, Lcom/trueaxis/server/Server;->TaServer_PostWithRef(ZLjava/lang/String;[BIII)V

    goto :goto_5

    .line 682
    :cond_5
    iget v0, p0, Lcom/trueaxis/server/Server$3;->Context:I

    invoke-static {v2, v0}, Lcom/trueaxis/cLib/TrueaxisLib;->ServerError(II)V

    :cond_6
    :goto_5
    if-eqz v3, :cond_c

    goto :goto_b

    .line 668
    :catch_7
    :goto_6
    iget v0, p0, Lcom/trueaxis/server/Server$3;->nErrorFromTimer:I

    if-nez v0, :cond_8

    .line 669
    iget v0, p0, Lcom/trueaxis/server/Server$3;->RefCount:I

    if-eqz v0, :cond_7

    .line 670
    iget v0, p0, Lcom/trueaxis/server/Server$3;->RefCount:I

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/trueaxis/server/Server$3;->RefCount:I

    .line 671
    iget-object v4, p0, Lcom/trueaxis/server/Server$3;->this$0:Lcom/trueaxis/server/Server;

    iget-boolean v5, p0, Lcom/trueaxis/server/Server$3;->useUrlencoded:Z

    iget-object v6, p0, Lcom/trueaxis/server/Server$3;->urlStr:Ljava/lang/String;

    iget-object v7, p0, Lcom/trueaxis/server/Server$3;->data:[B

    iget v8, p0, Lcom/trueaxis/server/Server$3;->nDataLength:I

    iget v9, p0, Lcom/trueaxis/server/Server$3;->Context:I

    iget v10, p0, Lcom/trueaxis/server/Server$3;->RefCount:I

    invoke-virtual/range {v4 .. v10}, Lcom/trueaxis/server/Server;->TaServer_PostWithRef(ZLjava/lang/String;[BIII)V

    goto :goto_7

    .line 673
    :cond_7
    iget v0, p0, Lcom/trueaxis/server/Server$3;->Context:I

    invoke-static {v2, v0}, Lcom/trueaxis/cLib/TrueaxisLib;->ServerError(II)V

    :cond_8
    :goto_7
    if-eqz v3, :cond_c

    goto :goto_b

    .line 659
    :catch_8
    :goto_8
    iget v0, p0, Lcom/trueaxis/server/Server$3;->nErrorFromTimer:I

    if-nez v0, :cond_a

    .line 660
    iget v0, p0, Lcom/trueaxis/server/Server$3;->RefCount:I

    if-eqz v0, :cond_9

    .line 661
    iget v0, p0, Lcom/trueaxis/server/Server$3;->RefCount:I

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/trueaxis/server/Server$3;->RefCount:I

    .line 662
    iget-object v4, p0, Lcom/trueaxis/server/Server$3;->this$0:Lcom/trueaxis/server/Server;

    iget-boolean v5, p0, Lcom/trueaxis/server/Server$3;->useUrlencoded:Z

    iget-object v6, p0, Lcom/trueaxis/server/Server$3;->urlStr:Ljava/lang/String;

    iget-object v7, p0, Lcom/trueaxis/server/Server$3;->data:[B

    iget v8, p0, Lcom/trueaxis/server/Server$3;->nDataLength:I

    iget v9, p0, Lcom/trueaxis/server/Server$3;->Context:I

    iget v10, p0, Lcom/trueaxis/server/Server$3;->RefCount:I

    invoke-virtual/range {v4 .. v10}, Lcom/trueaxis/server/Server;->TaServer_PostWithRef(ZLjava/lang/String;[BIII)V

    goto :goto_9

    .line 664
    :cond_9
    iget v0, p0, Lcom/trueaxis/server/Server$3;->Context:I

    invoke-static {v2, v0}, Lcom/trueaxis/cLib/TrueaxisLib;->ServerError(II)V

    :cond_a
    :goto_9
    if-eqz v3, :cond_c

    goto :goto_b

    .line 656
    :catch_9
    :goto_a
    iget v0, p0, Lcom/trueaxis/server/Server$3;->nErrorFromTimer:I

    if-nez v0, :cond_b

    .line 657
    iget v0, p0, Lcom/trueaxis/server/Server$3;->Context:I

    invoke-static {v2, v0}, Lcom/trueaxis/cLib/TrueaxisLib;->ServerError(II)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :cond_b
    if-eqz v3, :cond_c

    .line 696
    :goto_b
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_c
    :goto_c
    return-void

    :goto_d
    if-eqz v4, :cond_d

    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 697
    :cond_d
    throw v0
.end method
