.class Lcom/trueaxis/keyboard/KeyboardMultiple$MultipleInputBox;
.super Ljava/lang/Object;
.source "KeyboardMultiple.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trueaxis/keyboard/KeyboardMultiple;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "MultipleInputBox"
.end annotation


# instance fields
.field public editBox:Landroid/widget/EditText;

.field public editStr:Ljava/lang/String;

.field final synthetic this$0:Lcom/trueaxis/keyboard/KeyboardMultiple;


# direct methods
.method constructor <init>(Lcom/trueaxis/keyboard/KeyboardMultiple;)V
    .locals 0

    .line 38
    iput-object p1, p0, Lcom/trueaxis/keyboard/KeyboardMultiple$MultipleInputBox;->this$0:Lcom/trueaxis/keyboard/KeyboardMultiple;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
