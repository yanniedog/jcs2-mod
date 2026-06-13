.class Lcom/trueaxis/keyboard/Keyboard$12;
.super Ljava/lang/Object;
.source "Keyboard.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/keyboard/Keyboard;->setTextboxAlpha(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trueaxis/keyboard/Keyboard;

.field final synthetic val$Alpha:I


# direct methods
.method constructor <init>(Lcom/trueaxis/keyboard/Keyboard;I)V
    .locals 0

    .line 487
    iput-object p1, p0, Lcom/trueaxis/keyboard/Keyboard$12;->this$0:Lcom/trueaxis/keyboard/Keyboard;

    iput p2, p0, Lcom/trueaxis/keyboard/Keyboard$12;->val$Alpha:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 491
    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$200()Landroid/widget/EditText;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 493
    iget v0, p0, Lcom/trueaxis/keyboard/Keyboard$12;->val$Alpha:I

    invoke-static {v0}, Lcom/trueaxis/keyboard/Keyboard;->access$102(I)I

    .line 494
    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$300()I

    move-result v0

    iget v1, p0, Lcom/trueaxis/keyboard/Keyboard$12;->val$Alpha:I

    shl-int/lit8 v1, v1, 0x18

    or-int/2addr v0, v1

    .line 495
    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$200()Landroid/widget/EditText;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/widget/EditText;->setTextColor(I)V

    :cond_0
    return-void
.end method
