.class Lcom/trueaxis/keyboard/Keyboard$5;
.super Ljava/lang/Object;
.source "Keyboard.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/keyboard/Keyboard;->createPopUpWindow()V
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

    .line 240
    iput-object p1, p0, Lcom/trueaxis/keyboard/Keyboard$5;->this$0:Lcom/trueaxis/keyboard/Keyboard;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 245
    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$900()V

    .line 247
    new-instance v0, Landroid/widget/PopupWindow;

    invoke-static {}, Lcom/trueaxis/game/Interface;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/PopupWindow;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/trueaxis/keyboard/Keyboard;->popUp:Landroid/widget/PopupWindow;

    .line 248
    sget-object v0, Lcom/trueaxis/keyboard/Keyboard;->popUp:Landroid/widget/PopupWindow;

    const/16 v1, 0x140

    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setWidth(I)V

    .line 249
    sget-object v0, Lcom/trueaxis/keyboard/Keyboard;->popUp:Landroid/widget/PopupWindow;

    const/16 v1, 0x64

    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setHeight(I)V

    .line 250
    sget-object v0, Lcom/trueaxis/keyboard/Keyboard;->popUp:Landroid/widget/PopupWindow;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setClippingEnabled(Z)V

    .line 252
    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$200()Landroid/widget/EditText;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string v0, ""

    .line 254
    invoke-static {v0}, Lcom/trueaxis/keyboard/Keyboard;->access$402(Ljava/lang/String;)Ljava/lang/String;

    .line 255
    invoke-static {v0}, Lcom/trueaxis/keyboard/Keyboard;->access$002(Ljava/lang/String;)Ljava/lang/String;

    .line 256
    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$200()Landroid/widget/EditText;

    move-result-object v0

    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$400()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 257
    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$200()Landroid/widget/EditText;

    move-result-object v0

    const/high16 v2, -0x1000000

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setTextColor(I)V

    .line 258
    invoke-static {v1}, Lcom/trueaxis/keyboard/Keyboard;->access$302(I)I

    .line 259
    sget-object v0, Lcom/trueaxis/keyboard/Keyboard;->popUp:Landroid/widget/PopupWindow;

    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$200()Landroid/widget/EditText;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/PopupWindow;->setContentView(Landroid/view/View;)V

    .line 262
    :cond_0
    sget-object v0, Lcom/trueaxis/keyboard/Keyboard;->popUp:Landroid/widget/PopupWindow;

    sget-object v2, Lcom/trueaxis/keyboard/Keyboard;->customPopUpTouchListenr:Landroid/view/View$OnTouchListener;

    invoke-virtual {v0, v2}, Landroid/widget/PopupWindow;->setTouchInterceptor(Landroid/view/View$OnTouchListener;)V

    .line 263
    sget-object v0, Lcom/trueaxis/keyboard/Keyboard;->popUp:Landroid/widget/PopupWindow;

    new-instance v2, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {v2}, Landroid/graphics/drawable/BitmapDrawable;-><init>()V

    invoke-virtual {v0, v2}, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 264
    sget-object v0, Lcom/trueaxis/keyboard/Keyboard;->popUp:Landroid/widget/PopupWindow;

    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->access$1000()Landroid/widget/LinearLayout;

    move-result-object v2

    invoke-virtual {v0, v2, v1, v1, v1}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    .line 265
    sget-object v0, Lcom/trueaxis/keyboard/Keyboard;->popUp:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->update()V

    const/16 v0, 0xff

    .line 267
    invoke-static {v0}, Lcom/trueaxis/keyboard/Keyboard;->access$102(I)I

    .line 268
    invoke-static {v1}, Lcom/trueaxis/keyboard/Keyboard;->access$502(Z)Z

    return-void
.end method
