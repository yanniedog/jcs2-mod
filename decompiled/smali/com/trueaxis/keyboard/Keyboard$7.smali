.class Lcom/trueaxis/keyboard/Keyboard$7;
.super Ljava/lang/Object;
.source "Keyboard.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/keyboard/Keyboard;->destroyPopUpWindow()V
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

    .line 352
    iput-object p1, p0, Lcom/trueaxis/keyboard/Keyboard$7;->this$0:Lcom/trueaxis/keyboard/Keyboard;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 356
    sget-object v0, Lcom/trueaxis/keyboard/Keyboard;->popUp:Landroid/widget/PopupWindow;

    if-eqz v0, :cond_0

    .line 358
    sget-object v0, Lcom/trueaxis/keyboard/Keyboard;->popUp:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V

    const/4 v0, 0x0

    .line 359
    sput-object v0, Lcom/trueaxis/keyboard/Keyboard;->popUp:Landroid/widget/PopupWindow;

    :cond_0
    return-void
.end method
