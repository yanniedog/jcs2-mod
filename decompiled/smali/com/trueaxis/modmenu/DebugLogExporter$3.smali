.class Lcom/trueaxis/modmenu/DebugLogExporter$3;
.super Ljava/lang/Object;
.source "DebugLogExporter.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/modmenu/DebugLogExporter;->showUploadResult(Landroid/app/Activity;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$activity:Landroid/app/Activity;

.field final synthetic val$pasteUrl:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/app/Activity;Ljava/lang/String;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 132
    iput-object p1, p0, Lcom/trueaxis/modmenu/DebugLogExporter$3;->val$activity:Landroid/app/Activity;

    iput-object p2, p0, Lcom/trueaxis/modmenu/DebugLogExporter$3;->val$pasteUrl:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 3

    .line 134
    iget-object p1, p0, Lcom/trueaxis/modmenu/DebugLogExporter$3;->val$activity:Landroid/app/Activity;

    iget-object p2, p0, Lcom/trueaxis/modmenu/DebugLogExporter$3;->val$pasteUrl:Ljava/lang/String;

    # invokes: Lcom/trueaxis/modmenu/DebugLogExporter;->openLink(Landroid/app/Activity;Ljava/lang/String;)V
    invoke-static {p1, p2}, Lcom/trueaxis/modmenu/DebugLogExporter;->access$800(Landroid/app/Activity;Ljava/lang/String;)V

    .line 135
    return-void
.end method
