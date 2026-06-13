.class Lcom/trueaxis/keyboard/Keyboard$13;
.super Ljava/lang/Object;
.source "Keyboard.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/keyboard/Keyboard;->setTextBoxAlignTextLeft()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trueaxis/keyboard/Keyboard;


# direct methods
.method constructor <init>(Lcom/trueaxis/keyboard/Keyboard;)V
    .locals 0

    .line 514
    iput-object p1, p0, Lcom/trueaxis/keyboard/Keyboard$13;->this$0:Lcom/trueaxis/keyboard/Keyboard;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 518
    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$200()Landroid/widget/EditText;

    move-result-object v0

    if-eqz v0, :cond_0

    const/16 v0, 0x33

    .line 520
    invoke-static {v0}, Lcom/trueaxis/keyboard/Keyboard;->access$1302(I)I

    .line 521
    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$200()Landroid/widget/EditText;

    move-result-object v0

    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$1300()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setGravity(I)V

    :cond_0
    return-void
.end method
