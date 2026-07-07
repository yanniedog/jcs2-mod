.class Lcom/trueaxis/modmenu/ModMenu$23;
.super Ljava/lang/Object;
.source "ModMenu.java"

# interfaces
.implements Landroid/content/DialogInterface$OnMultiChoiceClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/modmenu/ModMenu;->showGhostPackPicker(Landroid/app/Activity;Landroid/widget/Button;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$checks:[Z


# direct methods
.method constructor <init>([Z)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1234
    iput-object p1, p0, Lcom/trueaxis/modmenu/ModMenu$23;->val$checks:[Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;IZ)V
    .registers 4

    .line 1237
    iget-object p1, p0, Lcom/trueaxis/modmenu/ModMenu$23;->val$checks:[Z

    aput-boolean p3, p1, p2

    .line 1238
    return-void
.end method
