.class Lcom/trueaxis/keyboard/KeyboardMultiple$18;
.super Ljava/lang/Object;
.source "KeyboardMultiple.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/keyboard/KeyboardMultiple;->showSystemMessage(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trueaxis/keyboard/KeyboardMultiple;

.field final synthetic val$activity:Landroid/app/Activity;

.field final synthetic val$msg:Ljava/lang/String;

.field final synthetic val$title:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/trueaxis/keyboard/KeyboardMultiple;Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 897
    iput-object p1, p0, Lcom/trueaxis/keyboard/KeyboardMultiple$18;->this$0:Lcom/trueaxis/keyboard/KeyboardMultiple;

    iput-object p2, p0, Lcom/trueaxis/keyboard/KeyboardMultiple$18;->val$activity:Landroid/app/Activity;

    iput-object p3, p0, Lcom/trueaxis/keyboard/KeyboardMultiple$18;->val$msg:Ljava/lang/String;

    iput-object p4, p0, Lcom/trueaxis/keyboard/KeyboardMultiple$18;->val$title:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 901
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/trueaxis/keyboard/KeyboardMultiple$18;->val$activity:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 902
    iget-object v1, p0, Lcom/trueaxis/keyboard/KeyboardMultiple$18;->val$msg:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    iget-object v2, p0, Lcom/trueaxis/keyboard/KeyboardMultiple$18;->val$title:Ljava/lang/String;

    .line 903
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const/4 v2, 0x0

    .line 904
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Lcom/trueaxis/keyboard/KeyboardMultiple$18$1;

    invoke-direct {v2, p0}, Lcom/trueaxis/keyboard/KeyboardMultiple$18$1;-><init>(Lcom/trueaxis/keyboard/KeyboardMultiple$18;)V

    const-string v3, "OK"

    .line 906
    invoke-virtual {v1, v3, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 916
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    return-void
.end method
