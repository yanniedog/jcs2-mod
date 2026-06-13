.class Lcom/trueaxis/keyboard/KeyboardMultiple$11;
.super Ljava/lang/Object;
.source "KeyboardMultiple.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/keyboard/KeyboardMultiple;->setTextboxPlaceholderString(ILjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trueaxis/keyboard/KeyboardMultiple;

.field final synthetic val$index:I

.field final synthetic val$str:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/trueaxis/keyboard/KeyboardMultiple;ILjava/lang/String;)V
    .locals 0

    .line 731
    iput-object p1, p0, Lcom/trueaxis/keyboard/KeyboardMultiple$11;->this$0:Lcom/trueaxis/keyboard/KeyboardMultiple;

    iput p2, p0, Lcom/trueaxis/keyboard/KeyboardMultiple$11;->val$index:I

    iput-object p3, p0, Lcom/trueaxis/keyboard/KeyboardMultiple$11;->val$str:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 735
    sget-object v0, Lcom/trueaxis/keyboard/KeyboardMultiple;->boxList:Ljava/util/ArrayList;

    iget v1, p0, Lcom/trueaxis/keyboard/KeyboardMultiple$11;->val$index:I

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/trueaxis/keyboard/KeyboardMultiple$MultipleInputBox;

    if-eqz v0, :cond_0

    .line 736
    iget-object v1, v0, Lcom/trueaxis/keyboard/KeyboardMultiple$MultipleInputBox;->editBox:Landroid/widget/EditText;

    if-eqz v1, :cond_0

    .line 738
    iget-object v1, p0, Lcom/trueaxis/keyboard/KeyboardMultiple$11;->val$str:Ljava/lang/String;

    invoke-static {v1}, Lcom/trueaxis/keyboard/KeyboardMultiple;->access$502(Ljava/lang/String;)Ljava/lang/String;

    .line 739
    iget-object v1, v0, Lcom/trueaxis/keyboard/KeyboardMultiple$MultipleInputBox;->editBox:Landroid/widget/EditText;

    invoke-static {}, Lcom/trueaxis/keyboard/KeyboardMultiple;->access$300()I

    move-result v2

    shl-int/lit8 v2, v2, 0x18

    const v3, 0xa0a0a0

    or-int/2addr v2, v3

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setTextColor(I)V

    .line 740
    invoke-static {v3}, Lcom/trueaxis/keyboard/KeyboardMultiple;->access$602(I)I

    .line 741
    iget-object v0, v0, Lcom/trueaxis/keyboard/KeyboardMultiple$MultipleInputBox;->editBox:Landroid/widget/EditText;

    invoke-static {}, Lcom/trueaxis/keyboard/KeyboardMultiple;->access$500()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method
