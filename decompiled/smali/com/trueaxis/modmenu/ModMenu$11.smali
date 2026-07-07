.class Lcom/trueaxis/modmenu/ModMenu$11;
.super Ljava/lang/Object;
.source "ModMenu.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/modmenu/ModMenu;->showPreLaunchMenu(Landroid/app/Activity;Ljava/lang/Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$a:Landroid/app/Activity;

.field final synthetic val$noParamsNote:Landroid/widget/TextView;

.field final synthetic val$orbitParams:Landroid/widget/LinearLayout;

.field final synthetic val$tracksideParams:Landroid/widget/LinearLayout;


# direct methods
.method constructor <init>(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/LinearLayout;Landroid/widget/TextView;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 923
    iput-object p1, p0, Lcom/trueaxis/modmenu/ModMenu$11;->val$a:Landroid/app/Activity;

    iput-object p2, p0, Lcom/trueaxis/modmenu/ModMenu$11;->val$orbitParams:Landroid/widget/LinearLayout;

    iput-object p3, p0, Lcom/trueaxis/modmenu/ModMenu$11;->val$tracksideParams:Landroid/widget/LinearLayout;

    iput-object p4, p0, Lcom/trueaxis/modmenu/ModMenu$11;->val$noParamsNote:Landroid/widget/TextView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .line 926
    add-int/lit8 p1, p3, 0x1

    .line 927
    iget-object p2, p0, Lcom/trueaxis/modmenu/ModMenu$11;->val$a:Landroid/app/Activity;

    invoke-static {p2}, Lcom/trueaxis/modmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p2

    invoke-interface {p2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p2

    const-string p4, "replay_camera_mode"

    invoke-interface {p2, p4, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p2

    invoke-interface {p2}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 928
    const/4 p2, 0x0

    const/4 p4, 0x1

    if-ne p1, p4, :cond_1b

    const/4 p5, 0x1

    goto :goto_1c

    :cond_1b
    const/4 p5, 0x0

    .line 929
    :goto_1c
    # getter for: Lcom/trueaxis/modmenu/ModMenu;->REPLAY_CAMERA_MODE_NAMES:[Ljava/lang/String;
    invoke-static {}, Lcom/trueaxis/modmenu/ModMenu;->access$100()[Ljava/lang/String;

    move-result-object v0

    array-length v0, v0

    sub-int/2addr v0, p4

    if-ne p3, v0, :cond_25

    goto :goto_26

    :cond_25
    const/4 p4, 0x0

    .line 930
    :goto_26
    iget-object p3, p0, Lcom/trueaxis/modmenu/ModMenu$11;->val$orbitParams:Landroid/widget/LinearLayout;

    const/16 v0, 0x8

    if-eqz p5, :cond_2e

    const/4 v1, 0x0

    goto :goto_30

    :cond_2e
    const/16 v1, 0x8

    :goto_30
    invoke-virtual {p3, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 931
    iget-object p3, p0, Lcom/trueaxis/modmenu/ModMenu$11;->val$tracksideParams:Landroid/widget/LinearLayout;

    if-eqz p4, :cond_39

    const/4 v1, 0x0

    goto :goto_3b

    :cond_39
    const/16 v1, 0x8

    :goto_3b
    invoke-virtual {p3, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 932
    iget-object p3, p0, Lcom/trueaxis/modmenu/ModMenu$11;->val$noParamsNote:Landroid/widget/TextView;

    if-nez p5, :cond_44

    if-eqz p4, :cond_46

    :cond_44
    const/16 p2, 0x8

    :cond_46
    invoke-virtual {p3, p2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 936
    :try_start_49
    invoke-static {p1}, Lcom/trueaxis/modmenu/RequiredPatches;->setReplayCameraMode(I)V
    :try_end_4c
    .catchall {:try_start_49 .. :try_end_4c} :catchall_4d

    .line 938
    goto :goto_4e

    .line 937
    :catchall_4d
    move-exception p1

    .line 939
    :goto_4e
    return-void
.end method

.method public onNothingSelected(Landroid/widget/AdapterView;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;)V"
        }
    .end annotation

    .line 942
    return-void
.end method
