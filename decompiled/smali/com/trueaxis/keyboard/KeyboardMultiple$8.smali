.class final Lcom/trueaxis/keyboard/KeyboardMultiple$8;
.super Ljava/lang/Object;
.source "KeyboardMultiple.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/keyboard/KeyboardMultiple;->destroyPopUpWindowForPause()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 628
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 632
    sget-object v0, Lcom/trueaxis/keyboard/KeyboardMultiple;->popUp:Landroid/widget/PopupWindow;

    if-eqz v0, :cond_0

    .line 634
    sget-object v0, Lcom/trueaxis/keyboard/KeyboardMultiple;->popUp:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V

    const/4 v0, 0x0

    .line 635
    sput-object v0, Lcom/trueaxis/keyboard/KeyboardMultiple;->popUp:Landroid/widget/PopupWindow;

    :cond_0
    return-void
.end method
