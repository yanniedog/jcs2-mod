.class Lcom/trueaxis/modmenu/ModMenu$7;
.super Ljava/lang/Object;
.source "ModMenu.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/modmenu/ModMenu;->addSeek(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;IIILjava/lang/String;)Landroid/widget/LinearLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$c:Landroid/content/Context;

.field final synthetic val$key:Ljava/lang/String;

.field final synthetic val$label:Ljava/lang/String;

.field final synthetic val$min:I

.field final synthetic val$suffix:Ljava/lang/String;

.field final synthetic val$value:Landroid/widget/TextView;


# direct methods
.method constructor <init>(ILandroid/content/Context;Ljava/lang/String;Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 564
    iput p1, p0, Lcom/trueaxis/modmenu/ModMenu$7;->val$min:I

    iput-object p2, p0, Lcom/trueaxis/modmenu/ModMenu$7;->val$c:Landroid/content/Context;

    iput-object p3, p0, Lcom/trueaxis/modmenu/ModMenu$7;->val$key:Ljava/lang/String;

    iput-object p4, p0, Lcom/trueaxis/modmenu/ModMenu$7;->val$value:Landroid/widget/TextView;

    iput-object p5, p0, Lcom/trueaxis/modmenu/ModMenu$7;->val$label:Ljava/lang/String;

    iput-object p6, p0, Lcom/trueaxis/modmenu/ModMenu$7;->val$suffix:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .registers 5

    .line 566
    iget p1, p0, Lcom/trueaxis/modmenu/ModMenu$7;->val$min:I

    add-int/2addr p1, p2

    .line 567
    iget-object p2, p0, Lcom/trueaxis/modmenu/ModMenu$7;->val$c:Landroid/content/Context;

    invoke-static {p2}, Lcom/trueaxis/modmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p2

    invoke-interface {p2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p2

    iget-object p3, p0, Lcom/trueaxis/modmenu/ModMenu$7;->val$key:Ljava/lang/String;

    invoke-interface {p2, p3, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p2

    invoke-interface {p2}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 568
    iget-object p2, p0, Lcom/trueaxis/modmenu/ModMenu$7;->val$value:Landroid/widget/TextView;

    iget-object p3, p0, Lcom/trueaxis/modmenu/ModMenu$7;->val$label:Ljava/lang/String;

    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$7;->val$suffix:Ljava/lang/String;

    # invokes: Lcom/trueaxis/modmenu/ModMenu;->updateSeekLabel(Landroid/widget/TextView;Ljava/lang/String;ILjava/lang/String;)V
    invoke-static {p2, p3, p1, v0}, Lcom/trueaxis/modmenu/ModMenu;->access$100(Landroid/widget/TextView;Ljava/lang/String;ILjava/lang/String;)V

    .line 569
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "option changed key="

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    iget-object p3, p0, Lcom/trueaxis/modmenu/ModMenu$7;->val$key:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string p3, " value="

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "launcher"

    invoke-static {p2, p1}, Lcom/trueaxis/modmenu/ModDebugLog;->module(Ljava/lang/String;Ljava/lang/String;)V

    .line 570
    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .registers 2

    .line 573
    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .registers 2

    .line 576
    return-void
.end method
