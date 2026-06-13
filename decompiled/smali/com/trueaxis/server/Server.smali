.class public Lcom/trueaxis/server/Server;
.super Ljava/lang/Object;
.source "Server.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trueaxis/server/Server$postThread;
    }
.end annotation


# static fields
.field private static UserAgentStr:Ljava/lang/String;

.field private static conn:[Ljava/net/HttpURLConnection;

.field private static refCountAllowed:[I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static TaServer_SetUserAgent(Ljava/lang/String;)V
    .locals 0

    .line 333
    sput-object p0, Lcom/trueaxis/server/Server;->UserAgentStr:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$100()[I
    .locals 1

    .line 25
    sget-object v0, Lcom/trueaxis/server/Server;->refCountAllowed:[I

    return-object v0
.end method

.method static synthetic access$200()[Ljava/net/HttpURLConnection;
    .locals 1

    .line 25
    sget-object v0, Lcom/trueaxis/server/Server;->conn:[Ljava/net/HttpURLConnection;

    return-object v0
.end method

.method static synthetic access$300()Ljava/lang/String;
    .locals 1

    .line 25
    sget-object v0, Lcom/trueaxis/server/Server;->UserAgentStr:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public TaServer_CancelPost(I)V
    .locals 2

    .line 352
    :try_start_0
    sget-object v0, Lcom/trueaxis/server/Server;->conn:[Ljava/net/HttpURLConnection;

    aget-object v0, v0, p1

    if-eqz v0, :cond_0

    .line 354
    sget-object v0, Lcom/trueaxis/server/Server;->refCountAllowed:[I

    const/4 v1, 0x0

    aput v1, v0, p1

    .line 355
    sget-object v0, Lcom/trueaxis/server/Server;->conn:[Ljava/net/HttpURLConnection;

    aget-object p1, v0, p1

    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    .line 361
    throw p1

    :catch_0
    :cond_0
    :goto_0
    return-void
.end method

.method public TaServer_Get(Ljava/lang/String;I)V
    .locals 1

    const/4 v0, 0x2

    .line 366
    invoke-virtual {p0, p1, p2, v0}, Lcom/trueaxis/server/Server;->TaServer_GetWithRef(Ljava/lang/String;II)V

    return-void
.end method

.method public TaServer_GetAndroidId()Ljava/lang/String;
    .locals 2

    .line 1037
    invoke-static {}, Lcom/trueaxis/game/Interface;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "android_id"

    invoke-static {v0, v1}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public TaServer_GetDLC(Ljava/lang/String;[BJ)V
    .locals 10

    .line 836
    new-instance v9, Lcom/trueaxis/server/Server$5;

    const/4 v2, 0x1

    const/4 v5, 0x0

    const/4 v8, 0x0

    move-object v0, v9

    move-object v1, p0

    move-object v3, p1

    move-object v4, p2

    move-wide v6, p3

    invoke-direct/range {v0 .. v8}, Lcom/trueaxis/server/Server$5;-><init>(Lcom/trueaxis/server/Server;ZLjava/lang/String;[BIJI)V

    .line 928
    invoke-virtual {v9}, Lcom/trueaxis/server/Server$5;->start()V

    return-void
.end method

.method public TaServer_GetWithRef(Ljava/lang/String;II)V
    .locals 9

    const/4 v0, -0x1

    if-ne p2, v0, :cond_0

    .line 375
    new-instance v0, Lcom/trueaxis/server/Server$1;

    const/4 v3, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v1, v0

    move-object v2, p0

    move-object v4, p1

    move v7, p2

    move v8, p3

    invoke-direct/range {v1 .. v8}, Lcom/trueaxis/server/Server$1;-><init>(Lcom/trueaxis/server/Server;ZLjava/lang/String;[BIII)V

    .line 470
    invoke-virtual {v0}, Lcom/trueaxis/server/Server$1;->start()V

    return-void

    .line 475
    :cond_0
    :try_start_0
    sget-object v0, Lcom/trueaxis/server/Server;->conn:[Ljava/net/HttpURLConnection;

    aget-object v0, v0, p2
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_1

    return-void

    .line 481
    :cond_1
    new-instance v0, Lcom/trueaxis/server/Server$2;

    const/4 v3, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v1, v0

    move-object v2, p0

    move-object v4, p1

    move v7, p2

    move v8, p3

    invoke-direct/range {v1 .. v8}, Lcom/trueaxis/server/Server$2;-><init>(Lcom/trueaxis/server/Server;ZLjava/lang/String;[BIII)V

    .line 592
    invoke-virtual {v0}, Lcom/trueaxis/server/Server$2;->start()V

    return-void

    :catchall_0
    move-exception p1

    .line 480
    throw p1

    :catch_0
    return-void
.end method

.method public TaServer_InitialisePlatform(I)V
    .locals 4

    .line 338
    new-array v0, p1, [Ljava/net/HttpURLConnection;

    sput-object v0, Lcom/trueaxis/server/Server;->conn:[Ljava/net/HttpURLConnection;

    .line 339
    new-array v0, p1, [I

    sput-object v0, Lcom/trueaxis/server/Server;->refCountAllowed:[I

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, p1, :cond_0

    .line 343
    sget-object v2, Lcom/trueaxis/server/Server;->conn:[Ljava/net/HttpURLConnection;

    const/4 v3, 0x0

    aput-object v3, v2, v1

    .line 344
    sget-object v2, Lcom/trueaxis/server/Server;->refCountAllowed:[I

    aput v0, v2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public TaServer_Post(ZLjava/lang/String;[BII)V
    .locals 7

    const/4 v6, 0x2

    move-object v0, p0

    move v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    move v5, p5

    .line 597
    invoke-virtual/range {v0 .. v6}, Lcom/trueaxis/server/Server;->TaServer_PostWithRef(ZLjava/lang/String;[BIII)V

    return-void
.end method

.method public TaServer_PostWithRef(ZLjava/lang/String;[BIII)V
    .locals 9

    const/4 v0, -0x1

    if-ne p5, v0, :cond_0

    .line 605
    :try_start_0
    new-instance v0, Lcom/trueaxis/server/Server$3;

    move-object v1, v0

    move-object v2, p0

    move v3, p1

    move-object v4, p2

    move-object v5, p3

    move v6, p4

    move v7, p5

    move v8, p6

    invoke-direct/range {v1 .. v8}, Lcom/trueaxis/server/Server$3;-><init>(Lcom/trueaxis/server/Server;ZLjava/lang/String;[BIII)V

    .line 699
    invoke-virtual {v0}, Lcom/trueaxis/server/Server$3;->start()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void

    :cond_0
    if-ltz p5, :cond_3

    .line 707
    :try_start_1
    sget-object v0, Lcom/trueaxis/server/Server;->conn:[Ljava/net/HttpURLConnection;

    array-length v0, v0

    if-lt p5, v0, :cond_1

    goto :goto_0

    .line 708
    :cond_1
    sget-object v0, Lcom/trueaxis/server/Server;->conn:[Ljava/net/HttpURLConnection;

    aget-object v0, v0, p5
    :try_end_1
    .catch Ljava/lang/NullPointerException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v0, :cond_2

    return-void

    :catchall_0
    move-exception p1

    .line 716
    throw p1

    .line 719
    :catch_1
    :cond_2
    :try_start_2
    new-instance v8, Lcom/trueaxis/server/Server$4;

    move-object v0, v8

    move-object v1, p0

    move v2, p1

    move-object v3, p2

    move-object v4, p3

    move v5, p4

    move v6, p5

    move v7, p6

    invoke-direct/range {v0 .. v7}, Lcom/trueaxis/server/Server$4;-><init>(Lcom/trueaxis/server/Server;ZLjava/lang/String;[BIII)V

    .line 828
    invoke-virtual {v8}, Lcom/trueaxis/server/Server$4;->start()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    :catch_2
    :cond_3
    :goto_0
    return-void
.end method

.method public TaServer_VerifyIAP(Ljava/lang/String;[BJ)V
    .locals 8

    # Stubbed: the trueaxis verify server is dead. Instead of POSTing the
    # receipt and failing (-> IAPCheckFail, which locks/blocks startup),
    # report verified=1, error=0 straight back to native. platform/gameId
    # are echoed from the outgoing request body so they match what native sent.
    const-string v0, "platform"

    invoke-static {p2, v0}, Lcom/trueaxis/server/Stub;->extractInt([BLjava/lang/String;)I

    move-result v1

    const-string v0, "gameId"

    invoke-static {p2, v0}, Lcom/trueaxis/server/Stub;->extractInt([BLjava/lang/String;)I

    move-result v2

    const/4 v3, 0x1

    const/4 v4, 0x1

    const/4 v5, 0x0

    move-wide v6, p3

    invoke-static/range {v1 .. v7}, Lcom/trueaxis/cLib/TrueaxisLib;->IAPCheckSuccess(IIIIIJ)V

    return-void
.end method
