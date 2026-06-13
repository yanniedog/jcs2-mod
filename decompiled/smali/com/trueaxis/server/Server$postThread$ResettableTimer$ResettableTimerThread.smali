.class Lcom/trueaxis/server/Server$postThread$ResettableTimer$ResettableTimerThread;
.super Ljava/lang/Thread;
.source "Server.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trueaxis/server/Server$postThread$ResettableTimer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ResettableTimerThread"
.end annotation


# instance fields
.field private resettableTimer:Lcom/trueaxis/server/Server$postThread$ResettableTimer;

.field private running:Z

.field final synthetic this$2:Lcom/trueaxis/server/Server$postThread$ResettableTimer;

.field private timeout:I

.field private timer:I

.field private timerLock:Ljava/util/concurrent/locks/ReentrantLock;


# direct methods
.method constructor <init>(Lcom/trueaxis/server/Server$postThread$ResettableTimer;)V
    .locals 0

    .line 68
    iput-object p1, p0, Lcom/trueaxis/server/Server$postThread$ResettableTimer$ResettableTimerThread;->this$2:Lcom/trueaxis/server/Server$postThread$ResettableTimer;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    const/4 p1, 0x1

    .line 73
    iput-boolean p1, p0, Lcom/trueaxis/server/Server$postThread$ResettableTimer$ResettableTimerThread;->running:Z

    .line 74
    new-instance p1, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {p1}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object p1, p0, Lcom/trueaxis/server/Server$postThread$ResettableTimer$ResettableTimerThread;->timerLock:Ljava/util/concurrent/locks/ReentrantLock;

    return-void
.end method

.method static synthetic access$002(Lcom/trueaxis/server/Server$postThread$ResettableTimer$ResettableTimerThread;I)I
    .locals 0

    .line 68
    iput p1, p0, Lcom/trueaxis/server/Server$postThread$ResettableTimer$ResettableTimerThread;->timeout:I

    return p1
.end method


# virtual methods
.method public finishedTask()V
    .locals 1

    .line 90
    iget-object v0, p0, Lcom/trueaxis/server/Server$postThread$ResettableTimer$ResettableTimerThread;->timerLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    const/4 v0, 0x0

    .line 91
    iput-boolean v0, p0, Lcom/trueaxis/server/Server$postThread$ResettableTimer$ResettableTimerThread;->running:Z

    .line 92
    iget-object v0, p0, Lcom/trueaxis/server/Server$postThread$ResettableTimer$ResettableTimerThread;->timerLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    return-void
.end method

.method public resetTimer()V
    .locals 1

    .line 83
    iget-object v0, p0, Lcom/trueaxis/server/Server$postThread$ResettableTimer$ResettableTimerThread;->timerLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    const/4 v0, 0x0

    .line 84
    iput v0, p0, Lcom/trueaxis/server/Server$postThread$ResettableTimer$ResettableTimerThread;->timer:I

    .line 85
    iget-object v0, p0, Lcom/trueaxis/server/Server$postThread$ResettableTimer$ResettableTimerThread;->timerLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    return-void
.end method

.method public run()V
    .locals 11

    .line 98
    invoke-super {p0}, Ljava/lang/Thread;->run()V

    .line 100
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const/4 v2, 0x0

    .line 102
    iput v2, p0, Lcom/trueaxis/server/Server$postThread$ResettableTimer$ResettableTimerThread;->timer:I

    .line 103
    iget-boolean v3, p0, Lcom/trueaxis/server/Server$postThread$ResettableTimer$ResettableTimerThread;->running:Z

    const/4 v4, 0x0

    :goto_0
    if-eqz v3, :cond_2

    .line 108
    :try_start_0
    iget-object v3, p0, Lcom/trueaxis/server/Server$postThread$ResettableTimer$ResettableTimerThread;->timerLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v3}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 109
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    .line 110
    iget v3, p0, Lcom/trueaxis/server/Server$postThread$ResettableTimer$ResettableTimerThread;->timer:I

    int-to-long v7, v3

    sub-long v9, v5, v0

    add-long/2addr v7, v9

    long-to-int v3, v7

    iput v3, p0, Lcom/trueaxis/server/Server$postThread$ResettableTimer$ResettableTimerThread;->timer:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    .line 113
    :try_start_1
    iget v0, p0, Lcom/trueaxis/server/Server$postThread$ResettableTimer$ResettableTimerThread;->timer:I

    iget v1, p0, Lcom/trueaxis/server/Server$postThread$ResettableTimer$ResettableTimerThread;->timeout:I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    if-le v0, v1, :cond_0

    const/4 v0, 0x1

    .line 115
    :try_start_2
    iput-boolean v2, p0, Lcom/trueaxis/server/Server$postThread$ResettableTimer$ResettableTimerThread;->running:Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    const/4 v4, 0x1

    goto :goto_1

    :catch_0
    move-wide v0, v5

    const/4 v4, 0x1

    goto :goto_2

    .line 117
    :cond_0
    :goto_1
    :try_start_3
    iget-boolean v3, p0, Lcom/trueaxis/server/Server$postThread$ResettableTimer$ResettableTimerThread;->running:Z

    .line 118
    iget-object v0, p0, Lcom/trueaxis/server/Server$postThread$ResettableTimer$ResettableTimerThread;->timerLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    if-eqz v4, :cond_1

    const-string v0, "trueskate"

    .line 122
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Cancelling tasks from resettable timer - "

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v7, p0, Lcom/trueaxis/server/Server$postThread$ResettableTimer$ResettableTimerThread;->this$2:Lcom/trueaxis/server/Server$postThread$ResettableTimer;

    iget-object v7, v7, Lcom/trueaxis/server/Server$postThread$ResettableTimer;->task:Lcom/trueaxis/server/Server$postThread;

    iget-object v7, v7, Lcom/trueaxis/server/Server$postThread;->urlStr:Ljava/lang/String;

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, " - "

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v7, p0, Lcom/trueaxis/server/Server$postThread$ResettableTimer$ResettableTimerThread;->timer:I

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v7, " : "

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v7, p0, Lcom/trueaxis/server/Server$postThread$ResettableTimer$ResettableTimerThread;->timeout:I

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 123
    iget-object v0, p0, Lcom/trueaxis/server/Server$postThread$ResettableTimer$ResettableTimerThread;->resettableTimer:Lcom/trueaxis/server/Server$postThread$ResettableTimer;

    invoke-virtual {v0}, Lcom/trueaxis/server/Server$postThread$ResettableTimer;->cancel()V

    :cond_1
    const-wide/16 v0, 0x21

    .line 126
    invoke-static {v0, v1}, Lcom/trueaxis/server/Server$postThread$ResettableTimer$ResettableTimerThread;->sleep(J)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    move-wide v0, v5

    goto :goto_0

    :catch_1
    move-wide v0, v5

    :catch_2
    :goto_2
    const/4 v3, 0x0

    goto :goto_0

    :cond_2
    return-void
.end method

.method public setParent(Lcom/trueaxis/server/Server$postThread$ResettableTimer;)V
    .locals 0

    .line 78
    iput-object p1, p0, Lcom/trueaxis/server/Server$postThread$ResettableTimer$ResettableTimerThread;->resettableTimer:Lcom/trueaxis/server/Server$postThread$ResettableTimer;

    return-void
.end method
