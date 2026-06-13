.class public Lcom/trueaxis/game/InterfaceShared;
.super Ljava/lang/Object;
.source "InterfaceShared.java"


# static fields
.field public static AMKey:Ljava/lang/String; = "ca-app-pub-2604878176519514/3048476436"

.field public static final PICK_FRIENDS_ACTIVITY:I = 0x2

.field public static final PICTURE_GALLERY:I = 0x1

.field private static mContext:Landroid/content/Context;


# instance fields
.field private facebook:Lcom/trueaxis/facebook/Facebook;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getContext()Landroid/content/Context;
    .locals 1

    .line 35
    sget-object v0, Lcom/trueaxis/game/InterfaceShared;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method public static getRpick_friends_activity()I
    .locals 1

    const v0, 0x7f0b0048

    return v0
.end method

.method public static get_Rfriend_picker_fragment()I
    .locals 1

    const v0, 0x7f080061

    return v0
.end method

.method public static initialise(Landroid/content/Context;)V
    .locals 1

    .line 25
    sput-object p0, Lcom/trueaxis/game/InterfaceShared;->mContext:Landroid/content/Context;

    const-string v0, "JetCarStunts2 Android"

    .line 28
    invoke-static {v0}, Lcom/trueaxis/server/Server;->TaServer_SetUserAgent(Ljava/lang/String;)V

    .line 30
    invoke-static {p0}, Lcom/trueaxis/game/Interface;->initialiseExtra(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public initialiseActivity(Landroid/os/Bundle;)V
    .locals 2

    .line 56
    new-instance v0, Lcom/trueaxis/facebook/Facebook;

    invoke-direct {v0}, Lcom/trueaxis/facebook/Facebook;-><init>()V

    iput-object v0, p0, Lcom/trueaxis/game/InterfaceShared;->facebook:Lcom/trueaxis/facebook/Facebook;

    .line 57
    iget-object v0, p0, Lcom/trueaxis/game/InterfaceShared;->facebook:Lcom/trueaxis/facebook/Facebook;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/trueaxis/facebook/Facebook;->initialise(Landroid/os/Bundle;Z)V

    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;I)V
    .locals 0

    .line 109
    iget-object p4, p0, Lcom/trueaxis/game/InterfaceShared;->facebook:Lcom/trueaxis/facebook/Facebook;

    invoke-virtual {p4, p1, p2, p3}, Lcom/trueaxis/facebook/Facebook;->onActivityResult(IILandroid/content/Intent;)V

    const/4 p2, 0x2

    if-eq p1, p2, :cond_0

    goto :goto_0

    .line 114
    :cond_0
    iget-object p1, p0, Lcom/trueaxis/game/InterfaceShared;->facebook:Lcom/trueaxis/facebook/Facebook;

    invoke-virtual {p1}, Lcom/trueaxis/facebook/Facebook;->onActivityResultForFreindsPicker()V

    :goto_0
    return-void
.end method

.method public onPause()V
    .locals 1

    .line 77
    invoke-static {}, Lcom/trueaxis/cLib/TrueaxisLib;->OnPutToSleep()V

    .line 78
    invoke-static {}, Lcom/trueaxis/vsync/Vsync;->removeVsyncCallback()V

    .line 80
    sget-object v0, Lcom/trueaxis/keyboard/Keyboard;->popUp:Landroid/widget/PopupWindow;

    if-eqz v0, :cond_0

    .line 82
    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->destroyPopUpWindowForPause()V

    const/4 v0, 0x1

    .line 83
    sput-boolean v0, Lcom/trueaxis/keyboard/Keyboard;->restorePopup:Z

    .line 85
    :cond_0
    invoke-static {}, Lcom/trueaxis/game/Interface;->onPauseExtra()V

    .line 86
    sget-object v0, Lcom/trueaxis/util/Util;->orientationListener:Landroid/view/OrientationEventListener;

    invoke-virtual {v0}, Landroid/view/OrientationEventListener;->disable()V

    return-void
.end method

.method public onResume()V
    .locals 1

    .line 91
    invoke-static {}, Lcom/trueaxis/util/Util;->resumeSoftkeysDelayed()V

    .line 92
    invoke-static {}, Lcom/trueaxis/cLib/TrueaxisLib;->ResetFrameDelay()V

    .line 93
    invoke-static {}, Lcom/trueaxis/cLib/TrueaxisLib;->OnWakeUp()V

    .line 95
    invoke-static {}, Lcom/trueaxis/vsync/Vsync;->setVsyncCallback()V

    .line 97
    sget-boolean v0, Lcom/trueaxis/keyboard/Keyboard;->restorePopup:Z

    if-eqz v0, :cond_0

    .line 99
    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->restorePopUpWindow()V

    .line 101
    :cond_0
    invoke-static {}, Lcom/trueaxis/game/Interface;->onResumeExtra()V

    .line 102
    sget-object v0, Lcom/trueaxis/util/Util;->orientationListener:Landroid/view/OrientationEventListener;

    invoke-virtual {v0}, Landroid/view/OrientationEventListener;->enable()V

    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 1

    .line 62
    iget-object v0, p0, Lcom/trueaxis/game/InterfaceShared;->facebook:Lcom/trueaxis/facebook/Facebook;

    invoke-virtual {v0, p1}, Lcom/trueaxis/facebook/Facebook;->onSaveInstanceState(Landroid/os/Bundle;)V

    return-void
.end method

.method public onStart()V
    .locals 1

    .line 67
    iget-object v0, p0, Lcom/trueaxis/game/InterfaceShared;->facebook:Lcom/trueaxis/facebook/Facebook;

    invoke-virtual {v0}, Lcom/trueaxis/facebook/Facebook;->onStart()V

    return-void
.end method

.method public onStop()V
    .locals 1

    .line 72
    iget-object v0, p0, Lcom/trueaxis/game/InterfaceShared;->facebook:Lcom/trueaxis/facebook/Facebook;

    invoke-virtual {v0}, Lcom/trueaxis/facebook/Facebook;->onStop()V

    return-void
.end method
