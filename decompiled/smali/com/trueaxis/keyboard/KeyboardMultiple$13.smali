.class Lcom/trueaxis/keyboard/KeyboardMultiple$13;
.super Ljava/lang/Object;
.source "KeyboardMultiple.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/keyboard/KeyboardMultiple;->getTextboxString(I)Ljava/lang/String;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trueaxis/keyboard/KeyboardMultiple;

.field final synthetic val$index:I


# direct methods
.method constructor <init>(Lcom/trueaxis/keyboard/KeyboardMultiple;I)V
    .locals 0

    .line 772
    iput-object p1, p0, Lcom/trueaxis/keyboard/KeyboardMultiple$13;->this$0:Lcom/trueaxis/keyboard/KeyboardMultiple;

    iput p2, p0, Lcom/trueaxis/keyboard/KeyboardMultiple$13;->val$index:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 776
    sget-object v0, Lcom/trueaxis/keyboard/KeyboardMultiple;->boxList:Ljava/util/ArrayList;

    iget v1, p0, Lcom/trueaxis/keyboard/KeyboardMultiple$13;->val$index:I

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/trueaxis/keyboard/KeyboardMultiple$MultipleInputBox;

    if-eqz v0, :cond_0

    .line 777
    iget-object v1, v0, Lcom/trueaxis/keyboard/KeyboardMultiple$MultipleInputBox;->editBox:Landroid/widget/EditText;

    if-eqz v1, :cond_0

    .line 779
    iget-object v0, v0, Lcom/trueaxis/keyboard/KeyboardMultiple$MultipleInputBox;->editStr:Ljava/lang/String;

    invoke-static {v0}, Lcom/trueaxis/keyboard/KeyboardMultiple;->access$702(Ljava/lang/String;)Ljava/lang/String;

    :cond_0
    return-void
.end method
