.class Lcom/trueaxis/keyboard/KeyboardMultiple$7;
.super Ljava/lang/Object;
.source "KeyboardMultiple.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/keyboard/KeyboardMultiple;->destroyPopUpWindow()V
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

    .line 612
    iput-object p1, p0, Lcom/trueaxis/keyboard/KeyboardMultiple$7;->this$0:Lcom/trueaxis/keyboard/KeyboardMultiple;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 616
    sget-object v0, Lcom/trueaxis/keyboard/KeyboardMultiple;->popUp:Landroid/widget/PopupWindow;

    if-eqz v0, :cond_0

    .line 618
    sget-object v0, Lcom/trueaxis/keyboard/KeyboardMultiple;->popUp:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V

    const/4 v0, 0x0

    .line 619
    sput-object v0, Lcom/trueaxis/keyboard/KeyboardMultiple;->popUp:Landroid/widget/PopupWindow;

    :cond_0
    return-void
.end method
