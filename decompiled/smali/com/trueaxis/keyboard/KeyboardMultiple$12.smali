.class Lcom/trueaxis/keyboard/KeyboardMultiple$12;
.super Ljava/lang/Object;
.source "KeyboardMultiple.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/keyboard/KeyboardMultiple;->setTextboxAlpha(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trueaxis/keyboard/KeyboardMultiple;

.field final synthetic val$Alpha:I


# direct methods
.method constructor <init>(Lcom/trueaxis/keyboard/KeyboardMultiple;I)V
    .locals 0

    .line 750
    iput-object p1, p0, Lcom/trueaxis/keyboard/KeyboardMultiple$12;->this$0:Lcom/trueaxis/keyboard/KeyboardMultiple;

    iput p2, p0, Lcom/trueaxis/keyboard/KeyboardMultiple$12;->val$Alpha:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 754
    sget-object v0, Lcom/trueaxis/keyboard/KeyboardMultiple;->boxList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 755
    invoke-static {}, Lcom/trueaxis/keyboard/KeyboardMultiple;->access$600()I

    move-result v1

    iget v2, p0, Lcom/trueaxis/keyboard/KeyboardMultiple$12;->val$Alpha:I

    shl-int/lit8 v3, v2, 0x18

    or-int/2addr v1, v3

    .line 756
    invoke-static {v2}, Lcom/trueaxis/keyboard/KeyboardMultiple;->access$302(I)I

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_1

    .line 758
    sget-object v3, Lcom/trueaxis/keyboard/KeyboardMultiple;->boxList:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/trueaxis/keyboard/KeyboardMultiple$MultipleInputBox;

    if-eqz v3, :cond_0

    .line 759
    iget-object v4, v3, Lcom/trueaxis/keyboard/KeyboardMultiple$MultipleInputBox;->editBox:Landroid/widget/EditText;

    if-eqz v4, :cond_0

    .line 760
    iget-object v3, v3, Lcom/trueaxis/keyboard/KeyboardMultiple$MultipleInputBox;->editBox:Landroid/widget/EditText;

    invoke-virtual {v3, v1}, Landroid/widget/EditText;->setTextColor(I)V

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method
