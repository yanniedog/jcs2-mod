.class Lcom/trueaxis/keyboard/KeyboardMultiple$5;
.super Ljava/lang/Object;
.source "KeyboardMultiple.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/keyboard/KeyboardMultiple;->hideAllBox()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trueaxis/keyboard/KeyboardMultiple;


# direct methods
.method constructor <init>(Lcom/trueaxis/keyboard/KeyboardMultiple;)V
    .locals 0

    .line 402
    iput-object p1, p0, Lcom/trueaxis/keyboard/KeyboardMultiple$5;->this$0:Lcom/trueaxis/keyboard/KeyboardMultiple;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 407
    sget-object v0, Lcom/trueaxis/keyboard/KeyboardMultiple;->boxList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    .line 410
    sget-object v2, Lcom/trueaxis/keyboard/KeyboardMultiple;->boxList:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/trueaxis/keyboard/KeyboardMultiple$MultipleInputBox;

    .line 411
    iget-object v2, v2, Lcom/trueaxis/keyboard/KeyboardMultiple$MultipleInputBox;->editBox:Landroid/widget/EditText;

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setVisibility(I)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method
