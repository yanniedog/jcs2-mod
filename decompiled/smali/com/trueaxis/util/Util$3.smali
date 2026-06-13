.class final Lcom/trueaxis/util/Util$3;
.super Landroid/view/OrientationEventListener;
.source "Util.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/util/Util;->initialise()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>(Landroid/content/Context;I)V
    .locals 0

    .line 167
    invoke-direct {p0, p1, p2}, Landroid/view/OrientationEventListener;-><init>(Landroid/content/Context;I)V

    return-void
.end method


# virtual methods
.method public onOrientationChanged(I)V
    .locals 1

    .line 170
    invoke-static {}, Lcom/trueaxis/game/Interface;->getContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Landroid/app/Activity;

    const-string v0, "window"

    .line 171
    invoke-virtual {p1, v0}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/WindowManager;

    .line 172
    invoke-interface {p1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Display;->getRotation()I

    move-result p1

    .line 173
    sget v0, Lcom/trueaxis/util/Util;->rotationType:I

    if-eq p1, v0, :cond_0

    .line 175
    sput p1, Lcom/trueaxis/util/Util;->rotationType:I

    .line 176
    sget p1, Lcom/trueaxis/util/Util;->rotationType:I

    invoke-static {p1}, Lcom/trueaxis/cLib/TrueaxisLib;->SetDeviceRotation(I)V

    :cond_0
    return-void
.end method
