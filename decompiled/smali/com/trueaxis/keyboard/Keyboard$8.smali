.class final Lcom/trueaxis/keyboard/Keyboard$8;
.super Ljava/lang/Object;
.source "Keyboard.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/keyboard/Keyboard;->destroyPopUpWindowForPause()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 368
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 372
    sget-object v0, Lcom/trueaxis/keyboard/Keyboard;->popUp:Landroid/widget/PopupWindow;

    if-eqz v0, :cond_0

    .line 374
    sget-object v0, Lcom/trueaxis/keyboard/Keyboard;->popUp:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V

    const/4 v0, 0x0

    .line 375
    sput-object v0, Lcom/trueaxis/keyboard/Keyboard;->popUp:Landroid/widget/PopupWindow;

    :cond_0
    return-void
.end method
