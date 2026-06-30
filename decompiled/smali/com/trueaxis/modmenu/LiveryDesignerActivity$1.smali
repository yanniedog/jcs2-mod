.class Lcom/trueaxis/modmenu/LiveryDesignerActivity$1;
.super Ljava/lang/Object;
.source "LiveryDesignerActivity.java"

# interfaces
.implements Lcom/trueaxis/modmenu/LiveryDesignerActivity$DesignView$ColorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/modmenu/LiveryDesignerActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trueaxis/modmenu/LiveryDesignerActivity;


# direct methods
.method constructor <init>(Lcom/trueaxis/modmenu/LiveryDesignerActivity;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 97
    iput-object p1, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$1;->this$0:Lcom/trueaxis/modmenu/LiveryDesignerActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onColorPicked(I)V
    .registers 4

    .line 99
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "picked color="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "designer"

    invoke-static {v1, v0}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 100
    iget-object v0, p0, Lcom/trueaxis/modmenu/LiveryDesignerActivity$1;->this$0:Lcom/trueaxis/modmenu/LiveryDesignerActivity;

    # invokes: Lcom/trueaxis/modmenu/LiveryDesignerActivity;->setColor(I)V
    invoke-static {v0, p1}, Lcom/trueaxis/modmenu/LiveryDesignerActivity;->access$000(Lcom/trueaxis/modmenu/LiveryDesignerActivity;I)V

    .line 101
    return-void
.end method
