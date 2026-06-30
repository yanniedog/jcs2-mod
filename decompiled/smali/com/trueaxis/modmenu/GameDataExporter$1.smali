.class Lcom/trueaxis/modmenu/GameDataExporter$1;
.super Ljava/lang/Object;
.source "GameDataExporter.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/modmenu/GameDataExporter;->exportNow(Landroid/app/Activity;)V
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

    .line 35
    iput-object p1, p0, Lcom/trueaxis/modmenu/GameDataExporter$1;->val$activity:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 6

    .line 38
    const-string v0, "game-data-export"

    :try_start_2
    iget-object v1, p0, Lcom/trueaxis/modmenu/GameDataExporter$1;->val$activity:Landroid/app/Activity;

    # invokes: Lcom/trueaxis/modmenu/GameDataExporter;->buildExportZip(Landroid/app/Activity;)Ljava/io/File;
    invoke-static {v1}, Lcom/trueaxis/modmenu/GameDataExporter;->access$000(Landroid/app/Activity;)Ljava/io/File;

    move-result-object v1

    .line 39
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "export complete path="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 40
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " bytes="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1}, Ljava/io/File;->length()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 39
    invoke-static {v0, v2}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    iget-object v2, p0, Lcom/trueaxis/modmenu/GameDataExporter$1;->val$activity:Landroid/app/Activity;

    new-instance v3, Lcom/trueaxis/modmenu/GameDataExporter$1$1;

    invoke-direct {v3, p0, v1}, Lcom/trueaxis/modmenu/GameDataExporter$1$1;-><init>(Lcom/trueaxis/modmenu/GameDataExporter$1;Ljava/io/File;)V

    invoke-virtual {v2, v3}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_3a
    .catchall {:try_start_2 .. :try_end_3a} :catchall_3b

    .line 53
    goto :goto_4b

    .line 46
    :catchall_3b
    move-exception v1

    .line 47
    const-string v2, "export failed"

    invoke-static {v0, v2, v1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 48
    iget-object v0, p0, Lcom/trueaxis/modmenu/GameDataExporter$1;->val$activity:Landroid/app/Activity;

    new-instance v2, Lcom/trueaxis/modmenu/GameDataExporter$1$2;

    invoke-direct {v2, p0, v1}, Lcom/trueaxis/modmenu/GameDataExporter$1$2;-><init>(Lcom/trueaxis/modmenu/GameDataExporter$1;Ljava/lang/Throwable;)V

    invoke-virtual {v0, v2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 54
    :goto_4b
    return-void
.end method
