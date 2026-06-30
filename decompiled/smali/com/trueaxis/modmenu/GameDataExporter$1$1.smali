.class Lcom/trueaxis/modmenu/GameDataExporter$1$1;
.super Ljava/lang/Object;
.source "GameDataExporter.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/modmenu/GameDataExporter$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trueaxis/modmenu/GameDataExporter$1;

.field final synthetic val$zip:Ljava/io/File;


# direct methods
.method constructor <init>(Lcom/trueaxis/modmenu/GameDataExporter$1;Ljava/io/File;)V
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

    .line 41
    iput-object p1, p0, Lcom/trueaxis/modmenu/GameDataExporter$1$1;->this$0:Lcom/trueaxis/modmenu/GameDataExporter$1;

    iput-object p2, p0, Lcom/trueaxis/modmenu/GameDataExporter$1$1;->val$zip:Ljava/io/File;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 43
    iget-object v0, p0, Lcom/trueaxis/modmenu/GameDataExporter$1$1;->this$0:Lcom/trueaxis/modmenu/GameDataExporter$1;

    iget-object v0, v0, Lcom/trueaxis/modmenu/GameDataExporter$1;->val$activity:Landroid/app/Activity;

    iget-object v1, p0, Lcom/trueaxis/modmenu/GameDataExporter$1$1;->val$zip:Ljava/io/File;

    # invokes: Lcom/trueaxis/modmenu/GameDataExporter;->shareZip(Landroid/app/Activity;Ljava/io/File;)V
    invoke-static {v0, v1}, Lcom/trueaxis/modmenu/GameDataExporter;->access$100(Landroid/app/Activity;Ljava/io/File;)V

    .line 44
    return-void
.end method
