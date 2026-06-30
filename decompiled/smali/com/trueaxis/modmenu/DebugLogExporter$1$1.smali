.class Lcom/trueaxis/modmenu/DebugLogExporter$1$1;
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

.field final synthetic val$pasteUrl:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/trueaxis/modmenu/DebugLogExporter$1;Ljava/lang/String;)V
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

    .line 46
    iput-object p1, p0, Lcom/trueaxis/modmenu/DebugLogExporter$1$1;->this$0:Lcom/trueaxis/modmenu/DebugLogExporter$1;

    iput-object p2, p0, Lcom/trueaxis/modmenu/DebugLogExporter$1$1;->val$pasteUrl:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 48
    iget-object v0, p0, Lcom/trueaxis/modmenu/DebugLogExporter$1$1;->this$0:Lcom/trueaxis/modmenu/DebugLogExporter$1;

    iget-object v0, v0, Lcom/trueaxis/modmenu/DebugLogExporter$1;->val$activity:Landroid/app/Activity;

    iget-object v1, p0, Lcom/trueaxis/modmenu/DebugLogExporter$1$1;->val$pasteUrl:Ljava/lang/String;

    # invokes: Lcom/trueaxis/modmenu/DebugLogExporter;->showUploadResult(Landroid/app/Activity;Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/trueaxis/modmenu/DebugLogExporter;->access$200(Landroid/app/Activity;Ljava/lang/String;)V

    .line 49
    return-void
.end method
