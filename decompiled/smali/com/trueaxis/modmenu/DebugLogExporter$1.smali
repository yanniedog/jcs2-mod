.class Lcom/trueaxis/modmenu/DebugLogExporter$1;
.super Ljava/lang/Object;
.source "DebugLogExporter.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/modmenu/DebugLogExporter;->uploadNow(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$activity:Landroid/app/Activity;


# direct methods
.method constructor <init>(Landroid/app/Activity;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 41
    iput-object p1, p0, Lcom/trueaxis/modmenu/DebugLogExporter$1;->val$activity:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 6

    .line 44
    const-string v0, "debug-export"

    const/4 v1, 0x0

    :try_start_3
    # invokes: Lcom/trueaxis/modmenu/DebugLogExporter;->preparePayload()Ljava/lang/String;
    invoke-static {}, Lcom/trueaxis/modmenu/DebugLogExporter;->access$000()Ljava/lang/String;

    move-result-object v2

    # invokes: Lcom/trueaxis/modmenu/DebugLogExporter;->uploadToPasteRs(Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v2}, Lcom/trueaxis/modmenu/DebugLogExporter;->access$100(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 45
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "upload complete url="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    iget-object v3, p0, Lcom/trueaxis/modmenu/DebugLogExporter$1;->val$activity:Landroid/app/Activity;

    new-instance v4, Lcom/trueaxis/modmenu/DebugLogExporter$1$1;

    invoke-direct {v4, p0, v2}, Lcom/trueaxis/modmenu/DebugLogExporter$1$1;-><init>(Lcom/trueaxis/modmenu/DebugLogExporter$1;Ljava/lang/String;)V

    # invokes: Lcom/trueaxis/modmenu/DebugLogExporter;->runOnUi(Landroid/app/Activity;Ljava/lang/Runnable;)V
    invoke-static {v3, v4}, Lcom/trueaxis/modmenu/DebugLogExporter;->access$300(Landroid/app/Activity;Ljava/lang/Runnable;)V
    :try_end_2b
    .catchall {:try_start_3 .. :try_end_2b} :catchall_2c

    goto :goto_3c

    .line 51
    :catchall_2c
    move-exception v2

    .line 52
    :try_start_2d
    const-string v3, "upload failed"

    invoke-static {v0, v3, v2}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 53
    iget-object v0, p0, Lcom/trueaxis/modmenu/DebugLogExporter$1;->val$activity:Landroid/app/Activity;

    new-instance v3, Lcom/trueaxis/modmenu/DebugLogExporter$1$2;

    invoke-direct {v3, p0, v2}, Lcom/trueaxis/modmenu/DebugLogExporter$1$2;-><init>(Lcom/trueaxis/modmenu/DebugLogExporter$1;Ljava/lang/Throwable;)V

    # invokes: Lcom/trueaxis/modmenu/DebugLogExporter;->runOnUi(Landroid/app/Activity;Ljava/lang/Runnable;)V
    invoke-static {v0, v3}, Lcom/trueaxis/modmenu/DebugLogExporter;->access$300(Landroid/app/Activity;Ljava/lang/Runnable;)V
    :try_end_3c
    .catchall {:try_start_2d .. :try_end_3c} :catchall_41

    .line 59
    :goto_3c
    # setter for: Lcom/trueaxis/modmenu/DebugLogExporter;->uploading:Z
    invoke-static {v1}, Lcom/trueaxis/modmenu/DebugLogExporter;->access$602(Z)Z

    .line 60
    nop

    .line 61
    return-void

    .line 59
    :catchall_41
    move-exception v0

    # setter for: Lcom/trueaxis/modmenu/DebugLogExporter;->uploading:Z
    invoke-static {v1}, Lcom/trueaxis/modmenu/DebugLogExporter;->access$602(Z)Z

    .line 60
    throw v0
.end method
