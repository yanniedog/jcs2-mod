.class Lcom/trueaxis/server/Server$postThread$Timeout;
.super Ljava/util/TimerTask;
.source "Server.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trueaxis/server/Server$postThread;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Timeout"
.end annotation


# instance fields
.field private _task:Lcom/trueaxis/server/Server$postThread;

.field final synthetic this$1:Lcom/trueaxis/server/Server$postThread;

.field private type:I


# direct methods
.method public constructor <init>(Lcom/trueaxis/server/Server$postThread;Lcom/trueaxis/server/Server$postThread;I)V
    .locals 0

    .line 199
    iput-object p1, p0, Lcom/trueaxis/server/Server$postThread$Timeout;->this$1:Lcom/trueaxis/server/Server$postThread;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    .line 200
    iput-object p2, p0, Lcom/trueaxis/server/Server$postThread$Timeout;->_task:Lcom/trueaxis/server/Server$postThread;

    .line 201
    iput p3, p0, Lcom/trueaxis/server/Server$postThread$Timeout;->type:I

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 208
    :try_start_0
    iget v0, p0, Lcom/trueaxis/server/Server$postThread$Timeout;->type:I

    if-eqz v0, :cond_2

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    goto :goto_0

    .line 217
    :cond_0
    iget-object v0, p0, Lcom/trueaxis/server/Server$postThread$Timeout;->_task:Lcom/trueaxis/server/Server$postThread;

    invoke-virtual {v0}, Lcom/trueaxis/server/Server$postThread;->cancelGetOrPost()V

    goto :goto_0

    .line 214
    :cond_1
    iget-object v0, p0, Lcom/trueaxis/server/Server$postThread$Timeout;->_task:Lcom/trueaxis/server/Server$postThread;

    invoke-virtual {v0}, Lcom/trueaxis/server/Server$postThread;->cancelVerify()V

    goto :goto_0

    .line 211
    :cond_2
    iget-object v0, p0, Lcom/trueaxis/server/Server$postThread$Timeout;->_task:Lcom/trueaxis/server/Server$postThread;

    invoke-virtual {v0}, Lcom/trueaxis/server/Server$postThread;->cancelDLC()V
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    .line 223
    throw v0

    :catch_0
    :goto_0
    return-void
.end method
