.class Lcom/trueaxis/keyboard/Keyboard$11;
.super Ljava/lang/Object;
.source "Keyboard.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/keyboard/Keyboard;->setTextboxPlaceholderString(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trueaxis/keyboard/Keyboard;

.field final synthetic val$str:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/trueaxis/keyboard/Keyboard;Ljava/lang/String;)V
    .locals 0

    .line 469
    iput-object p1, p0, Lcom/trueaxis/keyboard/Keyboard$11;->this$0:Lcom/trueaxis/keyboard/Keyboard;

    iput-object p2, p0, Lcom/trueaxis/keyboard/Keyboard$11;->val$str:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 473
    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$200()Landroid/widget/EditText;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 475
    iget-object v0, p0, Lcom/trueaxis/keyboard/Keyboard$11;->val$str:Ljava/lang/String;

    invoke-static {v0}, Lcom/trueaxis/keyboard/Keyboard;->access$002(Ljava/lang/String;)Ljava/lang/String;

    .line 476
    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$200()Landroid/widget/EditText;

    move-result-object v0

    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$100()I

    move-result v1

    shl-int/lit8 v1, v1, 0x18

    const v2, 0xa0a0a0

    or-int/2addr v1, v2

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setTextColor(I)V

    .line 477
    invoke-static {v2}, Lcom/trueaxis/keyboard/Keyboard;->access$302(I)I

    .line 478
    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$200()Landroid/widget/EditText;

    move-result-object v0

    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$000()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method
