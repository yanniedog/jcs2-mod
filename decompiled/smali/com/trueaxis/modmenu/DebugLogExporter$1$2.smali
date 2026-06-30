.class Lcom/trueaxis/modmenu/DebugLogExporter$1$2;
.super Ljava/lang/Object;
.source "DebugLogExporter.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/modmenu/DebugLogExporter$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trueaxis/modmenu/DebugLogExporter$1;

.field final synthetic val$error:Ljava/lang/Throwable;


# direct methods
.method constructor <init>(Lcom/trueaxis/modmenu/DebugLogExporter$1;Ljava/lang/Throwable;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 53
    iput-object p1, p0, Lcom/trueaxis/modmenu/DebugLogExporter$1$2;->this$0:Lcom/trueaxis/modmenu/DebugLogExporter$1;

    iput-object p2, p0, Lcom/trueaxis/modmenu/DebugLogExporter$1$2;->val$error:Ljava/lang/Throwable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .line 55
    iget-object v0, p0, Lcom/trueaxis/modmenu/DebugLogExporter$1$2;->this$0:Lcom/trueaxis/modmenu/DebugLogExporter$1;

    iget-object v0, v0, Lcom/trueaxis/modmenu/DebugLogExporter$1;->val$activity:Landroid/app/Activity;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Debug log upload failed: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/trueaxis/modmenu/DebugLogExporter$1$2;->val$error:Ljava/lang/Throwable;

    # invokes: Lcom/trueaxis/modmenu/DebugLogExporter;->readable(Ljava/lang/Throwable;)Ljava/lang/String;
    invoke-static {v2}, Lcom/trueaxis/modmenu/DebugLogExporter;->access$400(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    # invokes: Lcom/trueaxis/modmenu/DebugLogExporter;->toast(Landroid/content/Context;Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/trueaxis/modmenu/DebugLogExporter;->access$500(Landroid/content/Context;Ljava/lang/String;)V

    .line 56
    return-void
.end method
