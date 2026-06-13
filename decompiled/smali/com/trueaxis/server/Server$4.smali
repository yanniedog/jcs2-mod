.class Lcom/trueaxis/server/Server$4;
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

    .line 719
    iput-object p1, p0, Lcom/trueaxis/server/Server$4;->this$0:Lcom/trueaxis/server/Server;

    invoke-direct/range {p0 .. p7}, Lcom/trueaxis/server/Server$postThread;-><init>(Lcom/trueaxis/server/Server;ZLjava/lang/String;[BIII)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 11

    .line 721
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v1, p0, Lcom/trueaxis/server/Server$4;->Context:I

    aget-object v0, v0, v1

    if-eqz v0, :cond_0

    return-void

    .line 723
    :cond_0
    invoke-static {}, Lcom/trueaxis/server/Server;->access$100()[I

    move-result-object v0

    iget v1, p0, Lcom/trueaxis/server/Server$4;->Context:I

    const/4 v2, 0x1

    aput v2, v0, v1

    .line 725
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v1, p0, Lcom/trueaxis/server/Server$4;->Context:I

    const/4 v3, 0x0

    aput-object v3, v0, v1

    const/4 v0, 0x0

    const/16 v1, 0x1f4

    .line 727
    :try_start_0
    iput v0, p0, Lcom/trueaxis/server/Server$4;->nErrorFromTimer:I

    .line 728
    new-instance v4, Ljava/net/URL;

    iget-object v5, p0, Lcom/trueaxis/server/Server$4;->urlStr:Ljava/lang/String;

    invoke-direct {v4, v5}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 729
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v5

    iget v6, p0, Lcom/trueaxis/server/Server$4;->Context:I

    invoke-virtual {v4}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v4

    check-cast v4, Ljava/net/HttpURLConnection;

    aput-object v4, v5, v6

    .line 730
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v4

    iget v5, p0, Lcom/trueaxis/server/Server$4;->Context:I

    aget-object v4, v4, v5

    iput-object v4, p0, Lcom/trueaxis/server/Server$4;->connnection:Ljava/net/HttpURLConnection;

    .line 732
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v4

    iget v5, p0, Lcom/trueaxis/server/Server$4;->Context:I

    aget-object v4, v4, v5

    invoke-virtual {v4, v2}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 733
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v4

    iget v5, p0, Lcom/trueaxis/server/Server$4;->Context:I

    aget-object v4, v4, v5

    invoke-virtual {v4, v0}, Ljava/net/HttpURLConnection;->setUseCaches(Z)V

    .line 734
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v4, p0, Lcom/trueaxis/server/Server$4;->Context:I

    aget-object v0, v0, v4

    const-string v4, "POST"

    invoke-virtual {v0, v4}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 735
    iget-boolean v0, p0, Lcom/trueaxis/server/Server$4;->useUrlencoded:Z
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/NoSuchElementException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-string v4, "Content-Type"

    if-eqz v0, :cond_1

    .line 736
    :try_start_1
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v5, p0, Lcom/trueaxis/server/Server$4;->Context:I

    aget-object v0, v0, v5

    iget-object v5, p0, Lcom/trueaxis/server/Server$4;->data:[B

    array-length v5, v5

    invoke-virtual {v0, v5}, Ljava/net/HttpURLConnection;->setFixedLengthStreamingMode(I)V

    .line 737
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v5, p0, Lcom/trueaxis/server/Server$4;->Context:I

    aget-object v0, v0, v5

    const-string v5, "application/x-www-form-urlencoded"

    invoke-virtual {v0, v4, v5}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 739
    :cond_1
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v5, p0, Lcom/trueaxis/server/Server$4;->Context:I

    aget-object v0, v0, v5

    iget v5, p0, Lcom/trueaxis/server/Server$4;->nDataLength:I

    invoke-virtual {v0, v5}, Ljava/net/HttpURLConnection;->setFixedLengthStreamingMode(I)V

    .line 740
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v5, p0, Lcom/trueaxis/server/Server$4;->Context:I

    aget-object v0, v0, v5

    const-string v5, "application/octet-stream"

    invoke-virtual {v0, v4, v5}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 742
    :goto_0
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v4, p0, Lcom/trueaxis/server/Server$4;->Context:I

    aget-object v0, v0, v4

    const-string v4, "User-Agent"

    invoke-static {}, Lcom/trueaxis/server/Server;->access$300()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v4, v5}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 743
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Lcom/trueaxis/server/Server$4;->_timer:Ljava/util/Timer;

    .line 744
    iget-object v0, p0, Lcom/trueaxis/server/Server$4;->_timer:Ljava/util/Timer;

    new-instance v4, Lcom/trueaxis/server/Server$postThread$Timeout;

    const/4 v5, 0x2

    invoke-direct {v4, p0, p0, v5}, Lcom/trueaxis/server/Server$postThread$Timeout;-><init>(Lcom/trueaxis/server/Server$postThread;Lcom/trueaxis/server/Server$postThread;I)V

    iget v6, p0, Lcom/trueaxis/server/Server$4;->CONNECTION_TIMEOUT_VALUE:I

    int-to-long v6, v6

    invoke-virtual {v0, v4, v6, v7}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    .line 745
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v4, p0, Lcom/trueaxis/server/Server$4;->Context:I

    aget-object v0, v0, v4

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    .line 746
    iget-object v4, p0, Lcom/trueaxis/server/Server$4;->_timer:Ljava/util/Timer;

    invoke-virtual {v4}, Ljava/util/Timer;->cancel()V

    .line 747
    iget-object v4, p0, Lcom/trueaxis/server/Server$4;->_timer:Ljava/util/Timer;

    invoke-virtual {v4}, Ljava/util/Timer;->purge()I

    .line 748
    iget-object v4, p0, Lcom/trueaxis/server/Server$4;->data:[B

    invoke-virtual {v0, v4}, Ljava/io/OutputStream;->write([B)V

    .line 749
    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 750
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 752
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Lcom/trueaxis/server/Server$4;->_timer:Ljava/util/Timer;

    .line 753
    iget-object v0, p0, Lcom/trueaxis/server/Server$4;->_timer:Ljava/util/Timer;

    new-instance v4, Lcom/trueaxis/server/Server$postThread$Timeout;

    invoke-direct {v4, p0, p0, v5}, Lcom/trueaxis/server/Server$postThread$Timeout;-><init>(Lcom/trueaxis/server/Server$postThread;Lcom/trueaxis/server/Server$postThread;I)V

    iget v6, p0, Lcom/trueaxis/server/Server$4;->CONNECTION_TIMEOUT_VALUE:I

    int-to-long v6, v6

    invoke-virtual {v0, v4, v6, v7}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    .line 754
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v4, p0, Lcom/trueaxis/server/Server$4;->Context:I

    aget-object v0, v0, v4

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v0

    .line 755
    iget-object v4, p0, Lcom/trueaxis/server/Server$4;->_timer:Ljava/util/Timer;

    invoke-virtual {v4}, Ljava/util/Timer;->cancel()V

    .line 756
    iget-object v4, p0, Lcom/trueaxis/server/Server$4;->_timer:Ljava/util/Timer;

    invoke-virtual {v4}, Ljava/util/Timer;->purge()I

    const/16 v4, 0xc8

    if-ne v0, v4, :cond_2

    .line 759
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Lcom/trueaxis/server/Server$4;->_timer:Ljava/util/Timer;

    .line 760
    iget-object v0, p0, Lcom/trueaxis/server/Server$4;->_timer:Ljava/util/Timer;

    new-instance v4, Lcom/trueaxis/server/Server$postThread$Timeout;

    invoke-direct {v4, p0, p0, v5}, Lcom/trueaxis/server/Server$postThread$Timeout;-><init>(Lcom/trueaxis/server/Server$postThread;Lcom/trueaxis/server/Server$postThread;I)V

    iget v6, p0, Lcom/trueaxis/server/Server$4;->CONNECTION_TIMEOUT_VALUE:I

    int-to-long v6, v6

    invoke-virtual {v0, v4, v6, v7}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    .line 761
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v4, p0, Lcom/trueaxis/server/Server$4;->Context:I

    aget-object v0, v0, v4

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    .line 762
    iget-object v4, p0, Lcom/trueaxis/server/Server$4;->_timer:Ljava/util/Timer;

    invoke-virtual {v4}, Ljava/util/Timer;->cancel()V

    .line 763
    iget-object v4, p0, Lcom/trueaxis/server/Server$4;->_timer:Ljava/util/Timer;

    invoke-virtual {v4}, Ljava/util/Timer;->purge()I

    .line 765
    new-instance v4, Ljava/io/BufferedInputStream;

    invoke-direct {v4, v0}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 766
    invoke-virtual {p0, v4, v5}, Lcom/trueaxis/server/Server$4;->readStreamWithTimeOut(Ljava/io/InputStream;I)[B

    move-result-object v0

    .line 767
    invoke-virtual {v4}, Ljava/io/BufferedInputStream;->close()V

    .line 768
    array-length v4, v0

    iget v5, p0, Lcom/trueaxis/server/Server$4;->Context:I

    invoke-static {v0, v4, v5}, Lcom/trueaxis/cLib/TrueaxisLib;->ServerResponse([BII)V

    goto :goto_1

    .line 770
    :cond_2
    iget v4, p0, Lcom/trueaxis/server/Server$4;->nErrorFromTimer:I

    if-nez v4, :cond_3

    .line 771
    iget v4, p0, Lcom/trueaxis/server/Server$4;->Context:I

    invoke-static {v0, v4}, Lcom/trueaxis/cLib/TrueaxisLib;->ServerError(II)V
    :try_end_1
    .catch Ljava/net/MalformedURLException; {:try_start_1 .. :try_end_1} :catch_4
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/NullPointerException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/util/NoSuchElementException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 822
    :cond_3
    :goto_1
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v1, p0, Lcom/trueaxis/server/Server$4;->Context:I

    aget-object v0, v0, v1

    if-eqz v0, :cond_d

    .line 823
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v1, p0, Lcom/trueaxis/server/Server$4;->Context:I

    aget-object v0, v0, v1

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 824
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v1, p0, Lcom/trueaxis/server/Server$4;->Context:I

    aput-object v3, v0, v1

    goto/16 :goto_6

    :catchall_0
    move-exception v0

    goto/16 :goto_7

    .line 811
    :catch_0
    :try_start_2
    iget v0, p0, Lcom/trueaxis/server/Server$4;->nErrorFromTimer:I

    if-nez v0, :cond_5

    .line 812
    iget v0, p0, Lcom/trueaxis/server/Server$4;->RefCount:I

    if-eqz v0, :cond_4

    invoke-static {}, Lcom/trueaxis/server/Server;->access$100()[I

    move-result-object v0

    iget v4, p0, Lcom/trueaxis/server/Server$4;->Context:I

    aget v0, v0, v4

    if-ne v0, v2, :cond_4

    .line 813
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v1, p0, Lcom/trueaxis/server/Server$4;->Context:I

    aput-object v3, v0, v1

    .line 814
    iget v0, p0, Lcom/trueaxis/server/Server$4;->RefCount:I

    sub-int/2addr v0, v2

    iput v0, p0, Lcom/trueaxis/server/Server$4;->RefCount:I

    .line 815
    iget-object v4, p0, Lcom/trueaxis/server/Server$4;->this$0:Lcom/trueaxis/server/Server;

    iget-boolean v5, p0, Lcom/trueaxis/server/Server$4;->useUrlencoded:Z

    iget-object v6, p0, Lcom/trueaxis/server/Server$4;->urlStr:Ljava/lang/String;

    iget-object v7, p0, Lcom/trueaxis/server/Server$4;->data:[B

    iget v8, p0, Lcom/trueaxis/server/Server$4;->nDataLength:I

    iget v9, p0, Lcom/trueaxis/server/Server$4;->Context:I

    iget v10, p0, Lcom/trueaxis/server/Server$4;->RefCount:I

    invoke-virtual/range {v4 .. v10}, Lcom/trueaxis/server/Server;->TaServer_PostWithRef(ZLjava/lang/String;[BIII)V

    goto :goto_2

    .line 817
    :cond_4
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v2, p0, Lcom/trueaxis/server/Server$4;->Context:I

    aput-object v3, v0, v2

    .line 818
    iget v0, p0, Lcom/trueaxis/server/Server$4;->Context:I

    invoke-static {v1, v0}, Lcom/trueaxis/cLib/TrueaxisLib;->ServerError(II)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 822
    :cond_5
    :goto_2
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v1, p0, Lcom/trueaxis/server/Server$4;->Context:I

    aget-object v0, v0, v1

    if-eqz v0, :cond_d

    .line 823
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v1, p0, Lcom/trueaxis/server/Server$4;->Context:I

    aget-object v0, v0, v1

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 824
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v1, p0, Lcom/trueaxis/server/Server$4;->Context:I

    aput-object v3, v0, v1

    goto/16 :goto_6

    .line 800
    :catch_1
    :try_start_3
    iget v0, p0, Lcom/trueaxis/server/Server$4;->nErrorFromTimer:I

    if-nez v0, :cond_7

    .line 801
    iget v0, p0, Lcom/trueaxis/server/Server$4;->RefCount:I

    if-eqz v0, :cond_6

    invoke-static {}, Lcom/trueaxis/server/Server;->access$100()[I

    move-result-object v0

    iget v4, p0, Lcom/trueaxis/server/Server$4;->Context:I

    aget v0, v0, v4

    if-ne v0, v2, :cond_6

    .line 802
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v1, p0, Lcom/trueaxis/server/Server$4;->Context:I

    aput-object v3, v0, v1

    .line 803
    iget v0, p0, Lcom/trueaxis/server/Server$4;->RefCount:I

    sub-int/2addr v0, v2

    iput v0, p0, Lcom/trueaxis/server/Server$4;->RefCount:I

    .line 804
    iget-object v4, p0, Lcom/trueaxis/server/Server$4;->this$0:Lcom/trueaxis/server/Server;

    iget-boolean v5, p0, Lcom/trueaxis/server/Server$4;->useUrlencoded:Z

    iget-object v6, p0, Lcom/trueaxis/server/Server$4;->urlStr:Ljava/lang/String;

    iget-object v7, p0, Lcom/trueaxis/server/Server$4;->data:[B

    iget v8, p0, Lcom/trueaxis/server/Server$4;->nDataLength:I

    iget v9, p0, Lcom/trueaxis/server/Server$4;->Context:I

    iget v10, p0, Lcom/trueaxis/server/Server$4;->RefCount:I

    invoke-virtual/range {v4 .. v10}, Lcom/trueaxis/server/Server;->TaServer_PostWithRef(ZLjava/lang/String;[BIII)V

    goto :goto_3

    .line 806
    :cond_6
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v2, p0, Lcom/trueaxis/server/Server$4;->Context:I

    aput-object v3, v0, v2

    .line 807
    iget v0, p0, Lcom/trueaxis/server/Server$4;->Context:I

    invoke-static {v1, v0}, Lcom/trueaxis/cLib/TrueaxisLib;->ServerError(II)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 822
    :cond_7
    :goto_3
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v1, p0, Lcom/trueaxis/server/Server$4;->Context:I

    aget-object v0, v0, v1

    if-eqz v0, :cond_d

    .line 823
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v1, p0, Lcom/trueaxis/server/Server$4;->Context:I

    aget-object v0, v0, v1

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 824
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v1, p0, Lcom/trueaxis/server/Server$4;->Context:I

    aput-object v3, v0, v1

    goto/16 :goto_6

    .line 789
    :catch_2
    :try_start_4
    iget v0, p0, Lcom/trueaxis/server/Server$4;->nErrorFromTimer:I

    if-nez v0, :cond_9

    .line 790
    iget v0, p0, Lcom/trueaxis/server/Server$4;->RefCount:I

    if-eqz v0, :cond_8

    invoke-static {}, Lcom/trueaxis/server/Server;->access$100()[I

    move-result-object v0

    iget v4, p0, Lcom/trueaxis/server/Server$4;->Context:I

    aget v0, v0, v4

    if-ne v0, v2, :cond_8

    .line 791
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v1, p0, Lcom/trueaxis/server/Server$4;->Context:I

    aput-object v3, v0, v1

    .line 792
    iget v0, p0, Lcom/trueaxis/server/Server$4;->RefCount:I

    sub-int/2addr v0, v2

    iput v0, p0, Lcom/trueaxis/server/Server$4;->RefCount:I

    .line 793
    iget-object v4, p0, Lcom/trueaxis/server/Server$4;->this$0:Lcom/trueaxis/server/Server;

    iget-boolean v5, p0, Lcom/trueaxis/server/Server$4;->useUrlencoded:Z

    iget-object v6, p0, Lcom/trueaxis/server/Server$4;->urlStr:Ljava/lang/String;

    iget-object v7, p0, Lcom/trueaxis/server/Server$4;->data:[B

    iget v8, p0, Lcom/trueaxis/server/Server$4;->nDataLength:I

    iget v9, p0, Lcom/trueaxis/server/Server$4;->Context:I

    iget v10, p0, Lcom/trueaxis/server/Server$4;->RefCount:I

    invoke-virtual/range {v4 .. v10}, Lcom/trueaxis/server/Server;->TaServer_PostWithRef(ZLjava/lang/String;[BIII)V

    goto :goto_4

    .line 795
    :cond_8
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v2, p0, Lcom/trueaxis/server/Server$4;->Context:I

    aput-object v3, v0, v2

    .line 796
    iget v0, p0, Lcom/trueaxis/server/Server$4;->Context:I

    invoke-static {v1, v0}, Lcom/trueaxis/cLib/TrueaxisLib;->ServerError(II)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 822
    :cond_9
    :goto_4
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v1, p0, Lcom/trueaxis/server/Server$4;->Context:I

    aget-object v0, v0, v1

    if-eqz v0, :cond_d

    .line 823
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v1, p0, Lcom/trueaxis/server/Server$4;->Context:I

    aget-object v0, v0, v1

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 824
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v1, p0, Lcom/trueaxis/server/Server$4;->Context:I

    aput-object v3, v0, v1

    goto/16 :goto_6

    .line 778
    :catch_3
    :try_start_5
    iget v0, p0, Lcom/trueaxis/server/Server$4;->nErrorFromTimer:I

    if-nez v0, :cond_b

    .line 779
    iget v0, p0, Lcom/trueaxis/server/Server$4;->RefCount:I

    if-eqz v0, :cond_a

    invoke-static {}, Lcom/trueaxis/server/Server;->access$100()[I

    move-result-object v0

    iget v4, p0, Lcom/trueaxis/server/Server$4;->Context:I

    aget v0, v0, v4

    if-ne v0, v2, :cond_a

    .line 780
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v1, p0, Lcom/trueaxis/server/Server$4;->Context:I

    aput-object v3, v0, v1

    .line 781
    iget v0, p0, Lcom/trueaxis/server/Server$4;->RefCount:I

    sub-int/2addr v0, v2

    iput v0, p0, Lcom/trueaxis/server/Server$4;->RefCount:I

    .line 782
    iget-object v4, p0, Lcom/trueaxis/server/Server$4;->this$0:Lcom/trueaxis/server/Server;

    iget-boolean v5, p0, Lcom/trueaxis/server/Server$4;->useUrlencoded:Z

    iget-object v6, p0, Lcom/trueaxis/server/Server$4;->urlStr:Ljava/lang/String;

    iget-object v7, p0, Lcom/trueaxis/server/Server$4;->data:[B

    iget v8, p0, Lcom/trueaxis/server/Server$4;->nDataLength:I

    iget v9, p0, Lcom/trueaxis/server/Server$4;->Context:I

    iget v10, p0, Lcom/trueaxis/server/Server$4;->RefCount:I

    invoke-virtual/range {v4 .. v10}, Lcom/trueaxis/server/Server;->TaServer_PostWithRef(ZLjava/lang/String;[BIII)V

    goto :goto_5

    .line 784
    :cond_a
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v2, p0, Lcom/trueaxis/server/Server$4;->Context:I

    aput-object v3, v0, v2

    .line 785
    iget v0, p0, Lcom/trueaxis/server/Server$4;->Context:I

    invoke-static {v1, v0}, Lcom/trueaxis/cLib/TrueaxisLib;->ServerError(II)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 822
    :cond_b
    :goto_5
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v1, p0, Lcom/trueaxis/server/Server$4;->Context:I

    aget-object v0, v0, v1

    if-eqz v0, :cond_d

    .line 823
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v1, p0, Lcom/trueaxis/server/Server$4;->Context:I

    aget-object v0, v0, v1

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 824
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v1, p0, Lcom/trueaxis/server/Server$4;->Context:I

    aput-object v3, v0, v1

    goto :goto_6

    .line 774
    :catch_4
    :try_start_6
    iget v0, p0, Lcom/trueaxis/server/Server$4;->nErrorFromTimer:I

    if-nez v0, :cond_c

    .line 775
    iget v0, p0, Lcom/trueaxis/server/Server$4;->Context:I

    invoke-static {v1, v0}, Lcom/trueaxis/cLib/TrueaxisLib;->ServerError(II)V

    .line 776
    :cond_c
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v1, p0, Lcom/trueaxis/server/Server$4;->Context:I

    aput-object v3, v0, v1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 822
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v1, p0, Lcom/trueaxis/server/Server$4;->Context:I

    aget-object v0, v0, v1

    if-eqz v0, :cond_d

    .line 823
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v1, p0, Lcom/trueaxis/server/Server$4;->Context:I

    aget-object v0, v0, v1

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 824
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v0

    iget v1, p0, Lcom/trueaxis/server/Server$4;->Context:I

    aput-object v3, v0, v1

    :cond_d
    :goto_6
    return-void

    .line 822
    :goto_7
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v1

    iget v2, p0, Lcom/trueaxis/server/Server$4;->Context:I

    aget-object v1, v1, v2

    if-eqz v1, :cond_e

    .line 823
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v1

    iget v2, p0, Lcom/trueaxis/server/Server$4;->Context:I

    aget-object v1, v1, v2

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 824
    invoke-static {}, Lcom/trueaxis/server/Server;->access$200()[Ljava/net/HttpURLConnection;

    move-result-object v1

    iget v2, p0, Lcom/trueaxis/server/Server$4;->Context:I

    aput-object v3, v1, v2

    .line 826
    :cond_e
    throw v0
.end method
