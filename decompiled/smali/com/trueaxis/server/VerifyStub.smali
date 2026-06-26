.class public Lcom/trueaxis/server/VerifyStub;
.super Ljava/lang/Thread;
.source "VerifyStub.java"


# Delivers the stubbed IAP-verify result from a background thread.
# Calling TrueaxisLib.IAPCheckSuccess synchronously inside TaServer_VerifyIAP
# re-entered native on the game/UI thread and produced an ANR
# ("YCS2 isn't responding"). The original code answered from a worker thread
# after the network round-trip; this mirrors that, with a short delay so the
# native VerifyIAP call has unwound before the callback fires.

.field private final ctx:J

.field private final data:[B


.method public constructor <init>([BJ)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    iput-object p1, p0, Lcom/trueaxis/server/VerifyStub;->data:[B

    iput-wide p2, p0, Lcom/trueaxis/server/VerifyStub;->ctx:J

    return-void
.end method

.method public run()V
    .locals 8

    :try_start_0
    const-wide/16 v0, 0xc8

    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    iget-object v0, p0, Lcom/trueaxis/server/VerifyStub;->data:[B

    const-string v1, "platform"

    invoke-static {v0, v1}, Lcom/trueaxis/server/Stub;->extractInt([BLjava/lang/String;)I

    move-result v1

    iget-object v0, p0, Lcom/trueaxis/server/VerifyStub;->data:[B

    const-string v2, "gameId"

    invoke-static {v0, v2}, Lcom/trueaxis/server/Stub;->extractInt([BLjava/lang/String;)I

    move-result v2

    const/4 v3, 0x1

    const/4 v4, 0x1

    const/4 v5, 0x0

    iget-wide v6, p0, Lcom/trueaxis/server/VerifyStub;->ctx:J

    invoke-static/range {v1 .. v7}, Lcom/trueaxis/cLib/TrueaxisLib;->IAPCheckSuccess(IIIIIJ)V

    return-void
.end method
