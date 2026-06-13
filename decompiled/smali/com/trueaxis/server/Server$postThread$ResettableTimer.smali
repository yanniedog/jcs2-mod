.class Lcom/trueaxis/server/Server$postThread$ResettableTimer;
.super Ljava/lang/Object;
.source "Server.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trueaxis/server/Server$postThread;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ResettableTimer"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trueaxis/server/Server$postThread$ResettableTimer$ResettableTimerThread;
    }
.end annotation


# instance fields
.field private runThread:Lcom/trueaxis/server/Server$postThread$ResettableTimer$ResettableTimerThread;

.field public task:Lcom/trueaxis/server/Server$postThread;

.field final synthetic this$1:Lcom/trueaxis/server/Server$postThread;

.field public type:I


# direct methods
.method constructor <init>(Lcom/trueaxis/server/Server$postThread;Lcom/trueaxis/server/Server$postThread;I)V
    .locals 0

    .line 137
    iput-object p1, p0, Lcom/trueaxis/server/Server$postThread$ResettableTimer;->this$1:Lcom/trueaxis/server/Server$postThread;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 138
    iput-object p2, p0, Lcom/trueaxis/server/Server$postThread$ResettableTimer;->task:Lcom/trueaxis/server/Server$postThread;

    .line 139
    iput p3, p0, Lcom/trueaxis/server/Server$postThread$ResettableTimer;->type:I

    .line 140
    new-instance p1, Lcom/trueaxis/server/Server$postThread$ResettableTimer$ResettableTimerThread;

    invoke-direct {p1, p0}, Lcom/trueaxis/server/Server$postThread$ResettableTimer$ResettableTimerThread;-><init>(Lcom/trueaxis/server/Server$postThread$ResettableTimer;)V

    iput-object p1, p0, Lcom/trueaxis/server/Server$postThread$ResettableTimer;->runThread:Lcom/trueaxis/server/Server$postThread$ResettableTimer$ResettableTimerThread;

    .line 141
    iget-object p1, p0, Lcom/trueaxis/server/Server$postThread$ResettableTimer;->runThread:Lcom/trueaxis/server/Server$postThread$ResettableTimer$ResettableTimerThread;

    invoke-virtual {p1, p0}, Lcom/trueaxis/server/Server$postThread$ResettableTimer$ResettableTimerThread;->setParent(Lcom/trueaxis/server/Server$postThread$ResettableTimer;)V

    .line 142
    iget-object p1, p0, Lcom/trueaxis/server/Server$postThread$ResettableTimer;->runThread:Lcom/trueaxis/server/Server$postThread$ResettableTimer$ResettableTimerThread;

    invoke-virtual {p1}, Lcom/trueaxis/server/Server$postThread$ResettableTimer$ResettableTimerThread;->resetTimer()V

    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 2

    .line 167
    iget-object v0, p0, Lcom/trueaxis/server/Server$postThread$ResettableTimer;->runThread:Lcom/trueaxis/server/Server$postThread$ResettableTimer$ResettableTimerThread;

    invoke-virtual {v0}, Lcom/trueaxis/server/Server$postThread$ResettableTimer$ResettableTimerThread;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 169
    iget-object v0, p0, Lcom/trueaxis/server/Server$postThread$ResettableTimer;->runThread:Lcom/trueaxis/server/Server$postThread$ResettableTimer$ResettableTimerThread;

    invoke-virtual {v0}, Lcom/trueaxis/server/Server$postThread$ResettableTimer$ResettableTimerThread;->resetTimer()V

    .line 170
    iget-object v0, p0, Lcom/trueaxis/server/Server$postThread$ResettableTimer;->runThread:Lcom/trueaxis/server/Server$postThread$ResettableTimer$ResettableTimerThread;

    invoke-virtual {v0}, Lcom/trueaxis/server/Server$postThread$ResettableTimer$ResettableTimerThread;->finishedTask()V

    .line 174
    :cond_0
    :try_start_0
    iget v0, p0, Lcom/trueaxis/server/Server$postThread$ResettableTimer;->type:I

    if-eqz v0, :cond_3

    const/4 v1, 0x1

    if-eq v0, v1, :cond_2

    const/4 v1, 0x2

    if-eq v0, v1, :cond_1

    goto :goto_0

    .line 183
    :cond_1
    iget-object v0, p0, Lcom/trueaxis/server/Server$postThread$ResettableTimer;->task:Lcom/trueaxis/server/Server$postThread;

    invoke-virtual {v0}, Lcom/trueaxis/server/Server$postThread;->cancelGetOrPost()V

    goto :goto_0

    .line 180
    :cond_2
    iget-object v0, p0, Lcom/trueaxis/server/Server$postThread$ResettableTimer;->task:Lcom/trueaxis/server/Server$postThread;

    invoke-virtual {v0}, Lcom/trueaxis/server/Server$postThread;->cancelVerify()V

    goto :goto_0

    .line 177
    :cond_3
    iget-object v0, p0, Lcom/trueaxis/server/Server$postThread$ResettableTimer;->task:Lcom/trueaxis/server/Server$postThread;

    invoke-virtual {v0}, Lcom/trueaxis/server/Server$postThread;->cancelDLC()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    .line 189
    throw v0

    :catch_0
    :goto_0
    return-void
.end method

.method public finishedTask()V
    .locals 1

    .line 162
    iget-object v0, p0, Lcom/trueaxis/server/Server$postThread$ResettableTimer;->runThread:Lcom/trueaxis/server/Server$postThread$ResettableTimer$ResettableTimerThread;

    invoke-virtual {v0}, Lcom/trueaxis/server/Server$postThread$ResettableTimer$ResettableTimerThread;->finishedTask()V

    return-void
.end method

.method public restartTimer()V
    .locals 1

    .line 157
    iget-object v0, p0, Lcom/trueaxis/server/Server$postThread$ResettableTimer;->runThread:Lcom/trueaxis/server/Server$postThread$ResettableTimer$ResettableTimerThread;

    invoke-virtual {v0}, Lcom/trueaxis/server/Server$postThread$ResettableTimer$ResettableTimerThread;->resetTimer()V

    return-void
.end method

.method public start(I)V
    .locals 1

    .line 147
    iget-object v0, p0, Lcom/trueaxis/server/Server$postThread$ResettableTimer;->runThread:Lcom/trueaxis/server/Server$postThread$ResettableTimer$ResettableTimerThread;

    invoke-virtual {v0}, Lcom/trueaxis/server/Server$postThread$ResettableTimer$ResettableTimerThread;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 150
    :cond_0
    iget-object v0, p0, Lcom/trueaxis/server/Server$postThread$ResettableTimer;->runThread:Lcom/trueaxis/server/Server$postThread$ResettableTimer$ResettableTimerThread;

    invoke-virtual {v0}, Lcom/trueaxis/server/Server$postThread$ResettableTimer$ResettableTimerThread;->resetTimer()V

    .line 151
    iget-object v0, p0, Lcom/trueaxis/server/Server$postThread$ResettableTimer;->runThread:Lcom/trueaxis/server/Server$postThread$ResettableTimer$ResettableTimerThread;

    invoke-static {v0, p1}, Lcom/trueaxis/server/Server$postThread$ResettableTimer$ResettableTimerThread;->access$002(Lcom/trueaxis/server/Server$postThread$ResettableTimer$ResettableTimerThread;I)I

    .line 152
    iget-object p1, p0, Lcom/trueaxis/server/Server$postThread$ResettableTimer;->runThread:Lcom/trueaxis/server/Server$postThread$ResettableTimer$ResettableTimerThread;

    invoke-virtual {p1}, Lcom/trueaxis/server/Server$postThread$ResettableTimer$ResettableTimerThread;->start()V

    return-void
.end method
