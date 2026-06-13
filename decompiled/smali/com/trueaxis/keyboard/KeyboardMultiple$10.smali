.class Lcom/trueaxis/keyboard/KeyboardMultiple$10;
.super Ljava/lang/Object;
.source "KeyboardMultiple.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/keyboard/KeyboardMultiple;->setTextboxString(ILjava/lang/String;)V
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

    .line 712
    iput-object p1, p0, Lcom/trueaxis/keyboard/KeyboardMultiple$10;->this$0:Lcom/trueaxis/keyboard/KeyboardMultiple;

    iput p2, p0, Lcom/trueaxis/keyboard/KeyboardMultiple$10;->val$index:I

    iput-object p3, p0, Lcom/trueaxis/keyboard/KeyboardMultiple$10;->val$str:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 716
    sget-object v0, Lcom/trueaxis/keyboard/KeyboardMultiple;->boxList:Ljava/util/ArrayList;

    iget v1, p0, Lcom/trueaxis/keyboard/KeyboardMultiple$10;->val$index:I

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/trueaxis/keyboard/KeyboardMultiple$MultipleInputBox;

    if-eqz v0, :cond_0

    .line 717
    iget-object v1, v0, Lcom/trueaxis/keyboard/KeyboardMultiple$MultipleInputBox;->editBox:Landroid/widget/EditText;

    if-eqz v1, :cond_0

    .line 719
    iget-object v1, p0, Lcom/trueaxis/keyboard/KeyboardMultiple$10;->val$str:Ljava/lang/String;

    invoke-static {v1}, Lcom/trueaxis/keyboard/KeyboardMultiple;->access$702(Ljava/lang/String;)Ljava/lang/String;

    .line 720
    iget-object v1, v0, Lcom/trueaxis/keyboard/KeyboardMultiple$MultipleInputBox;->editBox:Landroid/widget/EditText;

    invoke-static {}, Lcom/trueaxis/keyboard/KeyboardMultiple;->access$300()I

    move-result v2

    shl-int/lit8 v2, v2, 0x18

    const/4 v3, 0x0

    or-int/2addr v2, v3

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setTextColor(I)V

    .line 721
    invoke-static {v3}, Lcom/trueaxis/keyboard/KeyboardMultiple;->access$602(I)I

    .line 722
    iget-object v0, v0, Lcom/trueaxis/keyboard/KeyboardMultiple$MultipleInputBox;->editBox:Landroid/widget/EditText;

    invoke-static {}, Lcom/trueaxis/keyboard/KeyboardMultiple;->access$700()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method
