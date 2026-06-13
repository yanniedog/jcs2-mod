.class Lcom/trueaxis/keyboard/Keyboard$16;
.super Ljava/lang/Object;
.source "Keyboard.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/keyboard/Keyboard;->setTextBoxEnableBackground(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trueaxis/keyboard/Keyboard;

.field final synthetic val$bSet:I


# direct methods
.method constructor <init>(Lcom/trueaxis/keyboard/Keyboard;I)V
    .locals 0

    .line 562
    iput-object p1, p0, Lcom/trueaxis/keyboard/Keyboard$16;->this$0:Lcom/trueaxis/keyboard/Keyboard;

    iput p2, p0, Lcom/trueaxis/keyboard/Keyboard$16;->val$bSet:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 567
    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$200()Landroid/widget/EditText;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 569
    iget v0, p0, Lcom/trueaxis/keyboard/Keyboard$16;->val$bSet:I

    invoke-static {v0}, Lcom/trueaxis/keyboard/Keyboard;->access$1102(I)I

    .line 571
    iget v0, p0, Lcom/trueaxis/keyboard/Keyboard$16;->val$bSet:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 573
    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$1200()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 574
    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$200()Landroid/widget/EditText;

    move-result-object v0

    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$1200()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 578
    :cond_0
    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$1200()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-nez v0, :cond_1

    .line 579
    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$200()Landroid/widget/EditText;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/EditText;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-static {v0}, Lcom/trueaxis/keyboard/Keyboard;->access$1202(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    .line 581
    :cond_1
    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$200()Landroid/widget/EditText;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setBackgroundColor(I)V

    :cond_2
    :goto_0
    return-void
.end method
