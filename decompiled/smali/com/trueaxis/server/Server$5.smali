.class Lcom/trueaxis/server/Server$5;
.super Lcom/trueaxis/server/Server$postThread;
.source "Server.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/server/Server;->TaServer_GetDLC(Ljava/lang/String;[BJ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trueaxis/server/Server;


# direct methods
.method constructor <init>(Lcom/trueaxis/server/Server;ZLjava/lang/String;[BIJI)V
    .locals 0

    .line 837
    iput-object p1, p0, Lcom/trueaxis/server/Server$5;->this$0:Lcom/trueaxis/server/Server;

    invoke-direct/range {p0 .. p8}, Lcom/trueaxis/server/Server$postThread;-><init>(Lcom/trueaxis/server/Server;ZLjava/lang/String;[BIJI)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 842
    :try_start_0
    iput v0, p0, Lcom/trueaxis/server/Server$5;->nErrorFromTimer:I

    .line 843
    new-instance v2, Ljava/net/URL;

    iget-object v3, p0, Lcom/trueaxis/server/Server$5;->urlStr:Ljava/lang/String;

    invoke-direct {v2, v3}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 844
    invoke-virtual {v2}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v2

    check-cast v2, Ljava/net/HttpURLConnection;
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_9
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_8
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_7
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_6
    .catch Ljava/util/NoSuchElementException; {:try_start_0 .. :try_end_0} :catch_5
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 845
    :try_start_1
    iput-object v2, p0, Lcom/trueaxis/server/Server$5;->connnection:Ljava/net/HttpURLConnection;

    const/4 v1, 0x1

    .line 847
    invoke-virtual {v2, v1}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 848
    invoke-virtual {v2, v0}, Ljava/net/HttpURLConnection;->setUseCaches(Z)V

    const-string v1, "POST"

    .line 849
    invoke-virtual {v2, v1}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 850
    iget-object v1, p0, Lcom/trueaxis/server/Server$5;->data:[B

    array-length v1, v1

    invoke-virtual {v2, v1}, Ljava/net/HttpURLConnection;->setFixedLengthStreamingMode(I)V

    const-string v1, "Content-Type"

    const-string v3, "application/x-www-form-urlencoded"

    .line 851
    invoke-virtual {v2, v1, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "User-Agent"

    .line 852
    invoke-static {}, Lcom/trueaxis/server/Server;->access$300()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v1, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 853
    new-instance v1, Ljava/util/Timer;

    invoke-direct {v1}, Ljava/util/Timer;-><init>()V

    iput-object v1, p0, Lcom/trueaxis/server/Server$5;->_timer:Ljava/util/Timer;

    .line 854
    iget-object v1, p0, Lcom/trueaxis/server/Server$5;->_timer:Ljava/util/Timer;

    new-instance v3, Lcom/trueaxis/server/Server$postThread$Timeout;

    invoke-direct {v3, p0, p0, v0}, Lcom/trueaxis/server/Server$postThread$Timeout;-><init>(Lcom/trueaxis/server/Server$postThread;Lcom/trueaxis/server/Server$postThread;I)V

    iget v4, p0, Lcom/trueaxis/server/Server$5;->CONNECTION_TIMEOUT_VALUE:I

    int-to-long v4, v4

    invoke-virtual {v1, v3, v4, v5}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    .line 855
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v1

    .line 856
    iget-object v3, p0, Lcom/trueaxis/server/Server$5;->_timer:Ljava/util/Timer;

    invoke-virtual {v3}, Ljava/util/Timer;->cancel()V

    .line 857
    iget-object v3, p0, Lcom/trueaxis/server/Server$5;->_timer:Ljava/util/Timer;

    invoke-virtual {v3}, Ljava/util/Timer;->purge()I

    .line 858
    iget-object v3, p0, Lcom/trueaxis/server/Server$5;->data:[B

    invoke-virtual {v1, v3}, Ljava/io/OutputStream;->write([B)V

    .line 859
    invoke-virtual {v1}, Ljava/io/OutputStream;->flush()V

    .line 860
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

    .line 862
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getContentLength()I

    move-result v1

    iget-wide v3, p0, Lcom/trueaxis/server/Server$5;->Context64:J

    invoke-static {v1, v3, v4}, Lcom/trueaxis/cLib/TrueaxisLib;->updateDlcTotalSize(IJ)V

    .line 863
    iget-wide v3, p0, Lcom/trueaxis/server/Server$5;->Context64:J

    invoke-static {v3, v4}, Lcom/trueaxis/cLib/TrueaxisLib;->setDlcForDwnload(J)V

    .line 865
    new-instance v1, Ljava/util/Timer;

    invoke-direct {v1}, Ljava/util/Timer;-><init>()V

    iput-object v1, p0, Lcom/trueaxis/server/Server$5;->_timer:Ljava/util/Timer;

    .line 866
    iget-object v1, p0, Lcom/trueaxis/server/Server$5;->_timer:Ljava/util/Timer;

    new-instance v3, Lcom/trueaxis/server/Server$postThread$Timeout;

    invoke-direct {v3, p0, p0, v0}, Lcom/trueaxis/server/Server$postThread$Timeout;-><init>(Lcom/trueaxis/server/Server$postThread;Lcom/trueaxis/server/Server$postThread;I)V

    iget v4, p0, Lcom/trueaxis/server/Server$5;->CONNECTION_TIMEOUT_VALUE:I

    int-to-long v4, v4

    invoke-virtual {v1, v3, v4, v5}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    .line 867
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v1

    .line 868
    iget-object v3, p0, Lcom/trueaxis/server/Server$5;->_timer:Ljava/util/Timer;

    invoke-virtual {v3}, Ljava/util/Timer;->cancel()V

    .line 869
    iget-object v3, p0, Lcom/trueaxis/server/Server$5;->_timer:Ljava/util/Timer;

    invoke-virtual {v3}, Ljava/util/Timer;->purge()I

    const/16 v3, 0xc8

    if-eq v1, v3, :cond_1

    const/16 v3, 0xce

    if-ne v1, v3, :cond_0

    goto :goto_0

    .line 905
    :cond_0
    iget v0, p0, Lcom/trueaxis/server/Server$5;->nErrorFromTimer:I

    if-nez v0, :cond_3

    .line 906
    iget-wide v0, p0, Lcom/trueaxis/server/Server$5;->Context64:J

    invoke-static {v0, v1}, Lcom/trueaxis/cLib/TrueaxisLib;->DlcError(J)V

    goto :goto_2

    .line 873
    :cond_1
    :goto_0
    new-instance v1, Ljava/util/Timer;

    invoke-direct {v1}, Ljava/util/Timer;-><init>()V

    iput-object v1, p0, Lcom/trueaxis/server/Server$5;->_timer:Ljava/util/Timer;

    .line 874
    iget-object v1, p0, Lcom/trueaxis/server/Server$5;->_timer:Ljava/util/Timer;

    new-instance v3, Lcom/trueaxis/server/Server$postThread$Timeout;

    invoke-direct {v3, p0, p0, v0}, Lcom/trueaxis/server/Server$postThread$Timeout;-><init>(Lcom/trueaxis/server/Server$postThread;Lcom/trueaxis/server/Server$postThread;I)V

    iget v4, p0, Lcom/trueaxis/server/Server$5;->CONNECTION_TIMEOUT_VALUE:I

    int-to-long v4, v4

    invoke-virtual {v1, v3, v4, v5}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    .line 875
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    .line 876
    iget-object v3, p0, Lcom/trueaxis/server/Server$5;->_timer:Ljava/util/Timer;

    invoke-virtual {v3}, Ljava/util/Timer;->cancel()V

    .line 877
    iget-object v3, p0, Lcom/trueaxis/server/Server$5;->_timer:Ljava/util/Timer;

    invoke-virtual {v3}, Ljava/util/Timer;->purge()I

    .line 879
    new-instance v3, Ljava/io/BufferedInputStream;

    invoke-direct {v3, v1}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    const/16 v1, 0x400

    new-array v1, v1, [B

    .line 885
    new-instance v4, Lcom/trueaxis/server/Server$postThread$ResettableTimer;

    invoke-direct {v4, p0, p0, v0}, Lcom/trueaxis/server/Server$postThread$ResettableTimer;-><init>(Lcom/trueaxis/server/Server$postThread;Lcom/trueaxis/server/Server$postThread;I)V

    .line 886
    iget v0, p0, Lcom/trueaxis/server/Server$5;->DOWNLOAD_TIMEOUT_VALUE:I

    invoke-virtual {v4, v0}, Lcom/trueaxis/server/Server$postThread$ResettableTimer;->start(I)V

    .line 887
    :goto_1
    invoke-virtual {v3, v1}, Ljava/io/BufferedInputStream;->read([B)I

    move-result v0

    const/4 v5, -0x1

    if-eq v0, v5, :cond_2

    .line 889
    iget-wide v5, p0, Lcom/trueaxis/server/Server$5;->Context64:J

    invoke-static {v0, v1, v5, v6}, Lcom/trueaxis/cLib/TrueaxisLib;->updateDlcRecievedSize(I[BJ)V

    .line 890
    invoke-virtual {v4}, Lcom/trueaxis/server/Server$postThread$ResettableTimer;->restartTimer()V

    goto :goto_1

    .line 896
    :cond_2
    invoke-virtual {v4}, Lcom/trueaxis/server/Server$postThread$ResettableTimer;->finishedTask()V

    .line 900
    invoke-virtual {v3}, Ljava/io/BufferedInputStream;->close()V

    .line 901
    iget-wide v0, p0, Lcom/trueaxis/server/Server$5;->Context64:J

    invoke-static {v0, v1}, Lcom/trueaxis/cLib/TrueaxisLib;->DlcOnloaded(J)V
    :try_end_1
    .catch Ljava/net/MalformedURLException; {:try_start_1 .. :try_end_1} :catch_4
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/NullPointerException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/util/NoSuchElementException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_3
    :goto_2
    if-eqz v2, :cond_9

    .line 925
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    goto :goto_9

    :catchall_0
    move-exception v0

    goto :goto_a

    :catch_0
    move-object v1, v2

    goto :goto_3

    :catch_1
    move-object v1, v2

    goto :goto_4

    :catch_2
    move-object v1, v2

    goto :goto_5

    :catch_3
    move-object v1, v2

    goto :goto_6

    :catch_4
    move-object v1, v2

    goto :goto_7

    :catchall_1
    move-exception v0

    move-object v2, v1

    goto :goto_a

    .line 921
    :catch_5
    :goto_3
    :try_start_2
    iget v0, p0, Lcom/trueaxis/server/Server$5;->nErrorFromTimer:I

    if-nez v0, :cond_4

    .line 922
    iget-wide v2, p0, Lcom/trueaxis/server/Server$5;->Context64:J

    invoke-static {v2, v3}, Lcom/trueaxis/cLib/TrueaxisLib;->DlcError(J)V

    :cond_4
    if-eqz v1, :cond_9

    goto :goto_8

    .line 918
    :catch_6
    :goto_4
    iget v0, p0, Lcom/trueaxis/server/Server$5;->nErrorFromTimer:I

    if-nez v0, :cond_5

    .line 919
    iget-wide v2, p0, Lcom/trueaxis/server/Server$5;->Context64:J

    invoke-static {v2, v3}, Lcom/trueaxis/cLib/TrueaxisLib;->DlcError(J)V

    :cond_5
    if-eqz v1, :cond_9

    goto :goto_8

    .line 915
    :catch_7
    :goto_5
    iget v0, p0, Lcom/trueaxis/server/Server$5;->nErrorFromTimer:I

    if-nez v0, :cond_6

    .line 916
    iget-wide v2, p0, Lcom/trueaxis/server/Server$5;->Context64:J

    invoke-static {v2, v3}, Lcom/trueaxis/cLib/TrueaxisLib;->DlcError(J)V

    :cond_6
    if-eqz v1, :cond_9

    goto :goto_8

    .line 912
    :catch_8
    :goto_6
    iget v0, p0, Lcom/trueaxis/server/Server$5;->nErrorFromTimer:I

    if-nez v0, :cond_7

    .line 913
    iget-wide v2, p0, Lcom/trueaxis/server/Server$5;->Context64:J

    invoke-static {v2, v3}, Lcom/trueaxis/cLib/TrueaxisLib;->DlcError(J)V

    :cond_7
    if-eqz v1, :cond_9

    goto :goto_8

    .line 909
    :catch_9
    :goto_7
    iget v0, p0, Lcom/trueaxis/server/Server$5;->nErrorFromTimer:I

    if-nez v0, :cond_8

    .line 910
    iget-wide v2, p0, Lcom/trueaxis/server/Server$5;->Context64:J

    invoke-static {v2, v3}, Lcom/trueaxis/cLib/TrueaxisLib;->DlcError(J)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :cond_8
    if-eqz v1, :cond_9

    .line 925
    :goto_8
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_9
    :goto_9
    return-void

    :goto_a
    if-eqz v2, :cond_a

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 926
    :cond_a
    goto :goto_c

    :goto_b
    throw v0

    :goto_c
    goto :goto_b
.end method
