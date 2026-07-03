.class Lcom/trueaxis/modmenu/ReplaySwarmOverlay$2;
.super Ljava/lang/Object;
.source "ReplaySwarmOverlay.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->install(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$activity:Landroid/app/Activity;

.field final synthetic val$status:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Landroid/app/Activity;Landroid/widget/TextView;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 136
    iput-object p1, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$2;->val$activity:Landroid/app/Activity;

    iput-object p2, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$2;->val$status:Landroid/widget/TextView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 3

    .line 138
    iget-object p1, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$2;->val$activity:Landroid/app/Activity;

    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplaySwarmOverlay$2;->val$status:Landroid/widget/TextView;

    # invokes: Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->showPicker(Landroid/app/Activity;Landroid/widget/TextView;)V
    invoke-static {p1, v0}, Lcom/trueaxis/modmenu/ReplaySwarmOverlay;->access$100(Landroid/app/Activity;Landroid/widget/TextView;)V

    .line 139
    return-void
.end method
