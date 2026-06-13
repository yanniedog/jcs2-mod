.class Lcom/trueaxis/server/Server$6;
.super Lcom/trueaxis/server/Server$postThread;
.source "Server.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/server/Server;->TaServer_VerifyIAP(Ljava/lang/String;[BJ)V
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

    .line 934
    iput-object p1, p0, Lcom/trueaxis/server/Server$6;->this$0:Lcom/trueaxis/server/Server;

    invoke-direct/range {p0 .. p8}, Lcom/trueaxis/server/Server$postThread;-><init>(Lcom/trueaxis/server/Server;ZLjava/lang/String;[BIJI)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 939
    :try_start_0
    iput v0, p0, Lcom/trueaxis/server/Server$6;->nErrorFromTimer:I

    .line 940
    new-instance v2, Ljava/net/URL;

    iget-object v3, p0, Lcom/trueaxis/server/Server$6;->urlStr:Ljava/lang/String;

    invoke-direct {v2, v3}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 941
    invoke-virtual {v2}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v2

    check-cast v2, Ljava/net/HttpURLConnection;
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_b
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_a
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_9
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_8
    .catch Ljava/util/NoSuchElementException; {:try_start_0 .. :try_end_0} :catch_7
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_6
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 942
    :try_start_1
    iput-object v2, p0, Lcom/trueaxis/server/Server$6;->connnection:Ljava/net/HttpURLConnection;

    const/4 v1, 0x1

    .line 944
    invoke-virtual {v2, v1}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 945
    invoke-virtual {v2, v0}, Ljava/net/HttpURLConnection;->setUseCaches(Z)V

    const-string v0, "POST"

    .line 946
    invoke-virtual {v2, v0}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 947
    iget-object v0, p0, Lcom/trueaxis/server/Server$6;->data:[B

    array-length v0, v0

    invoke-virtual {v2, v0}, Ljava/net/HttpURLConnection;->setFixedLengthStreamingMode(I)V

    const-string v0, "Content-Type"

    const-string v3, "application/x-www-form-urlencoded"

    .line 948
    invoke-virtual {v2, v0, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "User-Agent"

    .line 949
    invoke-static {}, Lcom/trueaxis/server/Server;->access$300()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v0, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 951
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Lcom/trueaxis/server/Server$6;->_timer:Ljava/util/Timer;

    .line 952
    iget-object v0, p0, Lcom/trueaxis/server/Server$6;->_timer:Ljava/util/Timer;

    new-instance v3, Lcom/trueaxis/server/Server$postThread$Timeout;

    invoke-direct {v3, p0, p0, v1}, Lcom/trueaxis/server/Server$postThread$Timeout;-><init>(Lcom/trueaxis/server/Server$postThread;Lcom/trueaxis/server/Server$postThread;I)V

    iget v4, p0, Lcom/trueaxis/server/Server$6;->CONNECTION_TIMEOUT_VALUE:I

    int-to-long v4, v4

    invoke-virtual {v0, v3, v4, v5}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    .line 953
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    .line 954
    iget-object v3, p0, Lcom/trueaxis/server/Server$6;->_timer:Ljava/util/Timer;

    invoke-virtual {v3}, Ljava/util/Timer;->cancel()V

    .line 955
    iget-object v3, p0, Lcom/trueaxis/server/Server$6;->_timer:Ljava/util/Timer;

    invoke-virtual {v3}, Ljava/util/Timer;->purge()I

    .line 956
    iget-object v3, p0, Lcom/trueaxis/server/Server$6;->data:[B

    invoke-virtual {v0, v3}, Ljava/io/OutputStream;->write([B)V

    .line 957
    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 958
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 960
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Lcom/trueaxis/server/Server$6;->_timer:Ljava/util/Timer;

    .line 961
    iget-object v0, p0, Lcom/trueaxis/server/Server$6;->_timer:Ljava/util/Timer;

    new-instance v3, Lcom/trueaxis/server/Server$postThread$Timeout;

    invoke-direct {v3, p0, p0, v1}, Lcom/trueaxis/server/Server$postThread$Timeout;-><init>(Lcom/trueaxis/server/Server$postThread;Lcom/trueaxis/server/Server$postThread;I)V

    iget v4, p0, Lcom/trueaxis/server/Server$6;->CONNECTION_TIMEOUT_VALUE:I

    int-to-long v4, v4

    invoke-virtual {v0, v3, v4, v5}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    .line 962
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v0

    .line 963
    iget-object v3, p0, Lcom/trueaxis/server/Server$6;->_timer:Ljava/util/Timer;

    invoke-virtual {v3}, Ljava/util/Timer;->cancel()V

    .line 964
    iget-object v3, p0, Lcom/trueaxis/server/Server$6;->_timer:Ljava/util/Timer;

    invoke-virtual {v3}, Ljava/util/Timer;->purge()I

    const/16 v3, 0xc8

    if-ne v0, v3, :cond_0

    .line 968
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Lcom/trueaxis/server/Server$6;->_timer:Ljava/util/Timer;

    .line 969
    iget-object v0, p0, Lcom/trueaxis/server/Server$6;->_timer:Ljava/util/Timer;

    new-instance v3, Lcom/trueaxis/server/Server$postThread$Timeout;

    invoke-direct {v3, p0, p0, v1}, Lcom/trueaxis/server/Server$postThread$Timeout;-><init>(Lcom/trueaxis/server/Server$postThread;Lcom/trueaxis/server/Server$postThread;I)V

    iget v4, p0, Lcom/trueaxis/server/Server$6;->CONNECTION_TIMEOUT_VALUE:I

    int-to-long v4, v4

    invoke-virtual {v0, v3, v4, v5}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    .line 970
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    .line 971
    iget-object v3, p0, Lcom/trueaxis/server/Server$6;->_timer:Ljava/util/Timer;

    invoke-virtual {v3}, Ljava/util/Timer;->cancel()V

    .line 972
    iget-object v3, p0, Lcom/trueaxis/server/Server$6;->_timer:Ljava/util/Timer;

    invoke-virtual {v3}, Ljava/util/Timer;->purge()I

    .line 974
    new-instance v3, Ljava/io/BufferedInputStream;

    invoke-direct {v3, v0}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 975
    invoke-virtual {p0, v3, v1}, Lcom/trueaxis/server/Server$6;->readStreamWithTimeOut(Ljava/io/InputStream;I)[B

    move-result-object v0

    .line 976
    invoke-virtual {v3}, Ljava/io/BufferedInputStream;->close()V

    .line 977
    new-instance v1, Ljava/lang/String;

    const-string v3, "UTF-8"

    invoke-direct {v1, v0, v3}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 979
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v1, "platform"

    .line 980
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    const-string v1, "gameId"

    .line 981
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v4

    const-string v1, "verified"

    .line 982
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v5

    const-string v1, "error"

    .line 983
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v7

    const/4 v6, 0x1

    .line 984
    iget-wide v8, p0, Lcom/trueaxis/server/Server$6;->Context64:J

    invoke-static/range {v3 .. v9}, Lcom/trueaxis/cLib/TrueaxisLib;->IAPCheckSuccess(IIIIIJ)V

    goto :goto_0

    .line 988
    :cond_0
    iget v0, p0, Lcom/trueaxis/server/Server$6;->nErrorFromTimer:I

    if-nez v0, :cond_1

    .line 989
    iget-wide v0, p0, Lcom/trueaxis/server/Server$6;->Context64:J

    invoke-static {v0, v1}, Lcom/trueaxis/cLib/TrueaxisLib;->IAPCheckFail(J)V
    :try_end_1
    .catch Ljava/net/MalformedURLException; {:try_start_1 .. :try_end_1} :catch_5
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_4
    .catch Ljava/lang/NullPointerException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/util/NoSuchElementException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_1
    :goto_0
    if-eqz v2, :cond_8

    .line 1017
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    goto/16 :goto_8

    :catchall_0
    move-exception v0

    goto/16 :goto_9

    :catch_0
    move-object v1, v2

    goto :goto_1

    :catch_1
    move-object v1, v2

    goto :goto_2

    :catch_2
    move-object v1, v2

    goto :goto_3

    :catch_3
    move-object v1, v2

    goto :goto_4

    :catch_4
    move-object v1, v2

    goto :goto_5

    :catch_5
    move-object v1, v2

    goto :goto_6

    :catchall_1
    move-exception v0

    move-object v2, v1

    goto :goto_9

    .line 1012
    :catch_6
    :goto_1
    :try_start_2
    iget v0, p0, Lcom/trueaxis/server/Server$6;->nErrorFromTimer:I

    if-nez v0, :cond_2

    .line 1013
    iget-wide v2, p0, Lcom/trueaxis/server/Server$6;->Context64:J

    invoke-static {v2, v3}, Lcom/trueaxis/cLib/TrueaxisLib;->IAPCheckFail(J)V

    :cond_2
    if-eqz v1, :cond_8

    goto :goto_7

    .line 1008
    :catch_7
    :goto_2
    iget v0, p0, Lcom/trueaxis/server/Server$6;->nErrorFromTimer:I

    if-nez v0, :cond_3

    .line 1009
    iget-wide v2, p0, Lcom/trueaxis/server/Server$6;->Context64:J

    invoke-static {v2, v3}, Lcom/trueaxis/cLib/TrueaxisLib;->IAPCheckFail(J)V

    :cond_3
    if-eqz v1, :cond_8

    goto :goto_7

    .line 1004
    :catch_8
    :goto_3
    iget v0, p0, Lcom/trueaxis/server/Server$6;->nErrorFromTimer:I

    if-nez v0, :cond_4

    .line 1005
    iget-wide v2, p0, Lcom/trueaxis/server/Server$6;->Context64:J

    invoke-static {v2, v3}, Lcom/trueaxis/cLib/TrueaxisLib;->IAPCheckFail(J)V

    :cond_4
    if-eqz v1, :cond_8

    goto :goto_7

    .line 1000
    :catch_9
    :goto_4
    iget v0, p0, Lcom/trueaxis/server/Server$6;->nErrorFromTimer:I

    if-nez v0, :cond_5

    .line 1001
    iget-wide v2, p0, Lcom/trueaxis/server/Server$6;->Context64:J

    invoke-static {v2, v3}, Lcom/trueaxis/cLib/TrueaxisLib;->IAPCheckFail(J)V

    :cond_5
    if-eqz v1, :cond_8

    goto :goto_7

    .line 996
    :catch_a
    :goto_5
    iget v0, p0, Lcom/trueaxis/server/Server$6;->nErrorFromTimer:I

    if-nez v0, :cond_6

    .line 997
    iget-wide v2, p0, Lcom/trueaxis/server/Server$6;->Context64:J

    invoke-static {v2, v3}, Lcom/trueaxis/cLib/TrueaxisLib;->IAPCheckFail(J)V

    :cond_6
    if-eqz v1, :cond_8

    goto :goto_7

    .line 992
    :catch_b
    :goto_6
    iget v0, p0, Lcom/trueaxis/server/Server$6;->nErrorFromTimer:I

    if-nez v0, :cond_7

    .line 993
    iget-wide v2, p0, Lcom/trueaxis/server/Server$6;->Context64:J

    invoke-static {v2, v3}, Lcom/trueaxis/cLib/TrueaxisLib;->IAPCheckFail(J)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :cond_7
    if-eqz v1, :cond_8

    .line 1017
    :goto_7
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_8
    :goto_8
    return-void

    :goto_9
    if-eqz v2, :cond_9

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 1018
    :cond_9
    throw v0
.end method
