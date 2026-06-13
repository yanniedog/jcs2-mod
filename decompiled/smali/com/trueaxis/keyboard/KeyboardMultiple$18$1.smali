.class Lcom/trueaxis/keyboard/KeyboardMultiple$18$1;
.super Ljava/lang/Object;
.source "KeyboardMultiple.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/keyboard/KeyboardMultiple$18;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/trueaxis/keyboard/KeyboardMultiple$18;


# direct methods
.method constructor <init>(Lcom/trueaxis/keyboard/KeyboardMultiple$18;)V
    .locals 0

    .line 908
    iput-object p1, p0, Lcom/trueaxis/keyboard/KeyboardMultiple$18$1;->this$1:Lcom/trueaxis/keyboard/KeyboardMultiple$18;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 912
    invoke-interface {p1}, Landroid/content/DialogInterface;->cancel()V

    return-void
.end method
