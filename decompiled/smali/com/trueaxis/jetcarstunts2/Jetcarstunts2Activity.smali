.class public Lcom/trueaxis/jetcarstunts2/Jetcarstunts2Activity;
.super Landroid/app/NativeActivity;
.source "Jetcarstunts2Activity.java"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback2;
.implements Lcom/trueaxis/inputmanagercompat/InputManagerCompat$InputDeviceListener;


# static fields
.field static final TAG:Ljava/lang/String; = "JetCarStunts2"

.field static gamepadButtonMapping:[I

.field static reStartCount:I


# instance fields
.field private game:Lcom/trueaxis/game/Interface;

.field public gamepadAxisIndices:[I

.field public gamepadAxisMaxVals:[F

.field public gamepadAxisMinVals:[F

.field public gamepadButtonIndices:[I

.field private mInputManager:Lcom/trueaxis/inputmanagercompat/InputManagerCompat;

.field private nButtonCount:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x23

    new-array v0, v0, [I

    .line 342
    fill-array-data v0, :array_0

    sput-object v0, Lcom/trueaxis/jetcarstunts2/Jetcarstunts2Activity;->gamepadButtonMapping:[I

    return-void

    :array_0
    .array-data 4
        0xbc
        0xbd
        0xbe
        0xbf
        0xc0
        0xc1
        0xc2
        0xc3
        0xc4
        0xc5
        0xc6
        0xc7
        0xc8
        0xc9
        0xca
        0xcb
        0x60
        0x61
        0x62
        0x63
        0x64
        0x65
        0x66
        0x68
        0x67
        0x69
        0x6c
        0x6d
        0x6e
        0x3
        0x13
        0x14
        0x15
        0x16
        0x17
    .end array-data
.end method

.method public constructor <init>()V
    .locals 2

    .line 36
    invoke-direct {p0}, Landroid/app/NativeActivity;-><init>()V

    const/4 v0, 0x0

    .line 43
    iput-object v0, p0, Lcom/trueaxis/jetcarstunts2/Jetcarstunts2Activity;->mInputManager:Lcom/trueaxis/inputmanagercompat/InputManagerCompat;

    .line 335
    iput-object v0, p0, Lcom/trueaxis/jetcarstunts2/Jetcarstunts2Activity;->gamepadAxisIndices:[I

    .line 336
    iput-object v0, p0, Lcom/trueaxis/jetcarstunts2/Jetcarstunts2Activity;->gamepadAxisMinVals:[F

    .line 337
    iput-object v0, p0, Lcom/trueaxis/jetcarstunts2/Jetcarstunts2Activity;->gamepadAxisMaxVals:[F

    const/4 v1, 0x0

    .line 339
    iput v1, p0, Lcom/trueaxis/jetcarstunts2/Jetcarstunts2Activity;->nButtonCount:I

    .line 340
    iput-object v0, p0, Lcom/trueaxis/jetcarstunts2/Jetcarstunts2Activity;->gamepadButtonIndices:[I

    return-void
.end method

.method public static doRestart(Landroid/content/Context;)V
    .locals 7

    const-string v0, "JetCarStunts2"

    if-eqz p0, :cond_2

    .line 287
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 292
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    .line 291
    invoke-virtual {v1, v2}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    if-eqz v1, :cond_0

    const/high16 v2, 0x4000000

    .line 295
    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    const v2, 0x36870

    const/high16 v3, 0x10000000

    .line 300
    invoke-static {p0, v2, v1, v3}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    const-string v2, "alarm"

    .line 302
    invoke-virtual {p0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/AlarmManager;

    const/4 v2, 0x1

    .line 303
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    const-wide/16 v5, 0x64

    add-long/2addr v3, v5

    invoke-virtual {p0, v2, v3, v4, v1}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    const/4 p0, 0x0

    .line 305
    invoke-static {p0}, Ljava/lang/System;->exit(I)V

    goto :goto_0

    :cond_0
    const-string p0, "Was not able to restart application, mStartActivity null"

    .line 307
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_1
    const-string p0, "Was not able to restart application, PM null"

    .line 310
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_2
    const-string p0, "Was not able to restart application, Context null"

    .line 313
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const-string p0, "Was not able to restart application"

    .line 316
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return-void
.end method


# virtual methods
.method checkForNewInputDevices(I)V
    .locals 1

    .line 271
    iget-object v0, p0, Lcom/trueaxis/jetcarstunts2/Jetcarstunts2Activity;->mInputManager:Lcom/trueaxis/inputmanagercompat/InputManagerCompat;

    if-eqz v0, :cond_0

    .line 273
    invoke-interface {v0, p1}, Lcom/trueaxis/inputmanagercompat/InputManagerCompat;->onGenericMotionEvent(I)V

    :cond_0
    return-void
.end method

.method public dumpGamepadButtons()Ljava/lang/String;
    .locals 6

    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 441
    :goto_0
    sget-object v3, Lcom/trueaxis/jetcarstunts2/Jetcarstunts2Activity;->gamepadButtonMapping:[I

    array-length v4, v3

    if-ge v1, v4, :cond_1

    .line 443
    aget v3, v3, v1

    .line 444
    invoke-static {v3}, Landroid/view/KeyCharacterMap;->deviceHasKey(I)Z

    move-result v3

    if-eqz v3, :cond_0

    add-int/lit8 v2, v2, 0x1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 449
    :cond_1
    iput v2, p0, Lcom/trueaxis/jetcarstunts2/Jetcarstunts2Activity;->nButtonCount:I

    .line 450
    new-array v1, v2, [I

    iput-object v1, p0, Lcom/trueaxis/jetcarstunts2/Jetcarstunts2Activity;->gamepadButtonIndices:[I

    const-string v1, ""

    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 453
    :goto_1
    sget-object v4, Lcom/trueaxis/jetcarstunts2/Jetcarstunts2Activity;->gamepadButtonMapping:[I

    array-length v5, v4

    if-ge v0, v5, :cond_4

    .line 455
    aget v4, v4, v0

    .line 456
    invoke-static {v4}, Landroid/view/KeyCharacterMap;->deviceHasKey(I)Z

    move-result v5

    if-eqz v5, :cond_3

    if-nez v2, :cond_2

    .line 459
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "Has Buttons: "

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 461
    :cond_2
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v4}, Landroid/view/KeyEvent;->keyCodeToString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " "

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 464
    iget-object v2, p0, Lcom/trueaxis/jetcarstunts2/Jetcarstunts2Activity;->gamepadButtonIndices:[I

    add-int/lit8 v5, v3, 0x1

    aput v4, v2, v3

    const/4 v2, 0x1

    move v3, v5

    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_4
    return-object v1
.end method

.method public dumpJoystickInfo(Landroid/view/InputDevice;)Ljava/lang/String;
    .locals 7

    .line 386
    invoke-virtual {p1}, Landroid/view/InputDevice;->getMotionRanges()Ljava/util/List;

    move-result-object p1

    .line 388
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    .line 390
    new-array v1, v0, [I

    iput-object v1, p0, Lcom/trueaxis/jetcarstunts2/Jetcarstunts2Activity;->gamepadAxisIndices:[I

    .line 391
    new-array v1, v0, [F

    iput-object v1, p0, Lcom/trueaxis/jetcarstunts2/Jetcarstunts2Activity;->gamepadAxisMinVals:[F

    .line 392
    new-array v0, v0, [F

    iput-object v0, p0, Lcom/trueaxis/jetcarstunts2/Jetcarstunts2Activity;->gamepadAxisMaxVals:[F

    .line 396
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    const/4 v0, 0x0

    const/4 v1, 0x1

    const-string v2, ""

    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 397
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 399
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/view/InputDevice$MotionRange;

    if-eqz v3, :cond_0

    .line 401
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "\tAxes:\n"

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 402
    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "\t\t"

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Landroid/view/InputDevice$MotionRange;->getAxis()I

    move-result v2

    invoke-static {v2}, Landroid/view/MotionEvent;->axisToString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " ("

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 403
    invoke-virtual {v5}, Landroid/view/InputDevice$MotionRange;->getMin()F

    move-result v2

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v2, ", "

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Landroid/view/InputDevice$MotionRange;->getMax()F

    move-result v2

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v2, ")\n"

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 406
    iget-object v3, p0, Lcom/trueaxis/jetcarstunts2/Jetcarstunts2Activity;->gamepadAxisIndices:[I

    invoke-virtual {v5}, Landroid/view/InputDevice$MotionRange;->getAxis()I

    move-result v6

    aput v6, v3, v4

    .line 407
    iget-object v3, p0, Lcom/trueaxis/jetcarstunts2/Jetcarstunts2Activity;->gamepadAxisMinVals:[F

    invoke-virtual {v5}, Landroid/view/InputDevice$MotionRange;->getMin()F

    move-result v6

    aput v6, v3, v4

    .line 408
    iget-object v3, p0, Lcom/trueaxis/jetcarstunts2/Jetcarstunts2Activity;->gamepadAxisMaxVals:[F

    invoke-virtual {v5}, Landroid/view/InputDevice$MotionRange;->getMax()F

    move-result v5

    aput v5, v3, v4

    add-int/2addr v4, v1

    const/4 v3, 0x0

    goto :goto_0

    .line 412
    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\n"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public findBySource(I)Landroid/view/InputDevice;
    .locals 4

    .line 419
    invoke-static {}, Landroid/view/InputDevice;->getDeviceIds()[I

    move-result-object v0

    const/4 v1, 0x0

    .line 423
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_1

    .line 424
    aget v2, v0, v1

    invoke-static {v2}, Landroid/view/InputDevice;->getDevice(I)Landroid/view/InputDevice;

    move-result-object v2

    .line 425
    invoke-virtual {v2}, Landroid/view/InputDevice;->getSources()I

    move-result v3

    and-int/lit16 v3, v3, -0x100

    and-int/2addr v3, p1

    if-eqz v3, :cond_0

    return-object v2

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method public findJoystick()Landroid/view/InputDevice;
    .locals 1

    const v0, 0x1000010

    .line 472
    invoke-virtual {p0, v0}, Lcom/trueaxis/jetcarstunts2/Jetcarstunts2Activity;->findBySource(I)Landroid/view/InputDevice;

    move-result-object v0

    return-object v0
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 2

    invoke-static {p0, p1, p2, p3}, Lcom/trueaxis/modmenu/ModMenu;->handleActivityResult(Landroid/app/Activity;IILandroid/content/Intent;)Z

    move-result v0

    if-eqz v0, :modmenu_result_unhandled

    return-void

    :modmenu_result_unhandled
    .line 190
    iget-object v0, p0, Lcom/trueaxis/jetcarstunts2/Jetcarstunts2Activity;->game:Lcom/trueaxis/game/Interface;

    invoke-virtual {v0, p1, p2, p3}, Lcom/trueaxis/game/Interface;->onActivityResultExtra(IILandroid/content/Intent;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 191
    :cond_0
    invoke-super {p0, p1, p2, p3}, Landroid/app/NativeActivity;->onActivityResult(IILandroid/content/Intent;)V

    .line 192
    iget-object v0, p0, Lcom/trueaxis/jetcarstunts2/Jetcarstunts2Activity;->game:Lcom/trueaxis/game/Interface;

    sget v1, Lcom/trueaxis/jetcarstunts2/Jetcarstunts2Activity;->reStartCount:I

    invoke-virtual {v0, p1, p2, p3, v1}, Lcom/trueaxis/game/Interface;->onActivityResult(IILandroid/content/Intent;I)V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 12

    const-string v0, "JetCarStunts2"

    .line 65
    invoke-super {p0, p1}, Landroid/app/NativeActivity;->onCreate(Landroid/os/Bundle;)V

    .line 66
    sget v1, Lcom/trueaxis/jetcarstunts2/Jetcarstunts2Activity;->reStartCount:I

    const/4 v2, 0x1

    add-int/2addr v1, v2

    sput v1, Lcom/trueaxis/jetcarstunts2/Jetcarstunts2Activity;->reStartCount:I

    .line 68
    invoke-virtual {p0}, Lcom/trueaxis/jetcarstunts2/Jetcarstunts2Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Landroid/view/Window;->takeSurface(Landroid/view/SurfaceHolder$Callback2;)V

    .line 69
    new-instance v1, Landroid/view/SurfaceView;

    invoke-direct {v1, p0}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/trueaxis/util/Util;->mySurface:Landroid/view/SurfaceView;

    .line 70
    sget-object v1, Lcom/trueaxis/util/Util;->mySurface:Landroid/view/SurfaceView;

    invoke-virtual {v1}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v1

    .line 71
    invoke-interface {v1, p0}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 72
    sget-object v1, Lcom/trueaxis/util/Util;->mySurface:Landroid/view/SurfaceView;

    invoke-virtual {p0, v1}, Lcom/trueaxis/jetcarstunts2/Jetcarstunts2Activity;->setContentView(Landroid/view/View;)V

    invoke-static {p0}, Lcom/trueaxis/modmenu/RequiredPatches;->apply(Landroid/app/Activity;)V

    .line 74
    invoke-static {p0}, Lcom/trueaxis/game/Interface;->initialise(Landroid/content/Context;)V

    .line 75
    invoke-static {}, Lcom/trueaxis/util/Util;->initialise()V

    .line 77
    new-instance v1, Lcom/trueaxis/game/Interface;

    invoke-direct {v1}, Lcom/trueaxis/game/Interface;-><init>()V

    iput-object v1, p0, Lcom/trueaxis/jetcarstunts2/Jetcarstunts2Activity;->game:Lcom/trueaxis/game/Interface;

    .line 78
    iget-object v1, p0, Lcom/trueaxis/jetcarstunts2/Jetcarstunts2Activity;->game:Lcom/trueaxis/game/Interface;

    invoke-virtual {v1, p1}, Lcom/trueaxis/game/Interface;->initialiseActivity(Landroid/os/Bundle;)V

    .line 80
    invoke-static {}, Lcom/trueaxis/messageHandler/MessageHandler;->startMessageHandler()V

    const/4 p1, 0x0

    .line 84
    :try_start_0
    const-class v1, Landroid/view/KeyEvent;

    const-string v4, "keyCodeToString"

    new-array v5, v2, [Ljava/lang/Class;

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v5, p1

    invoke-virtual {v1, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 87
    :goto_0
    :try_start_1
    invoke-static {}, Lcom/trueaxis/cLib/TrueaxisLib;->JaypadIsSupported()V

    const-string v4, "****** Found API level 12 function! Joysticks supported"

    .line 88
    invoke-static {v0, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_0
    const/4 v1, 0x0

    :catch_1
    const-string v4, "****** Did not find API level 12 function! Joysticks NOT supported!"

    .line 90
    invoke-static {v0, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :goto_1
    if-eqz v1, :cond_4

    .line 95
    invoke-static {}, Lcom/trueaxis/cLib/TrueaxisLib;->StopJoypad()V

    .line 97
    invoke-static {p0}, Lcom/trueaxis/inputmanagercompat/InputManagerCompat$Factory;->getInputManager(Landroid/content/Context;)Lcom/trueaxis/inputmanagercompat/InputManagerCompat;

    move-result-object v1

    iput-object v1, p0, Lcom/trueaxis/jetcarstunts2/Jetcarstunts2Activity;->mInputManager:Lcom/trueaxis/inputmanagercompat/InputManagerCompat;

    .line 98
    iget-object v1, p0, Lcom/trueaxis/jetcarstunts2/Jetcarstunts2Activity;->mInputManager:Lcom/trueaxis/inputmanagercompat/InputManagerCompat;

    invoke-interface {v1, p0, v3}, Lcom/trueaxis/inputmanagercompat/InputManagerCompat;->registerInputDeviceListener(Lcom/trueaxis/inputmanagercompat/InputManagerCompat$InputDeviceListener;Landroid/os/Handler;)V

    .line 100
    iget-object v1, p0, Lcom/trueaxis/jetcarstunts2/Jetcarstunts2Activity;->mInputManager:Lcom/trueaxis/inputmanagercompat/InputManagerCompat;

    invoke-interface {v1}, Lcom/trueaxis/inputmanagercompat/InputManagerCompat;->getInputDeviceIds()[I

    move-result-object v1

    .line 101
    array-length v3, v1

    :goto_2
    if-ge p1, v3, :cond_4

    aget v4, v1, p1

    .line 103
    iget-object v5, p0, Lcom/trueaxis/jetcarstunts2/Jetcarstunts2Activity;->mInputManager:Lcom/trueaxis/inputmanagercompat/InputManagerCompat;

    invoke-interface {v5, v4}, Lcom/trueaxis/inputmanagercompat/InputManagerCompat;->getInputDevice(I)Landroid/view/InputDevice;

    move-result-object v4

    .line 104
    invoke-virtual {v4}, Landroid/view/InputDevice;->getSources()I

    move-result v5

    and-int/lit16 v6, v5, 0x401

    const/16 v7, 0x401

    const v8, 0x1000010

    if-eq v6, v7, :cond_1

    and-int v9, v5, v8

    if-ne v9, v8, :cond_3

    .line 110
    :cond_1
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, ""

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v10, "\n"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 112
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, "Joystick attached: "

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Landroid/view/InputDevice;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 113
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v4}, Lcom/trueaxis/jetcarstunts2/Jetcarstunts2Activity;->dumpJoystickInfo(Landroid/view/InputDevice;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 115
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 117
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/trueaxis/jetcarstunts2/Jetcarstunts2Activity;->dumpGamepadButtons()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 119
    invoke-static {v0, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 121
    iget v4, p0, Lcom/trueaxis/jetcarstunts2/Jetcarstunts2Activity;->nButtonCount:I

    const/4 v9, 0x2

    if-le v4, v9, :cond_3

    and-int v4, v5, v8

    if-ne v4, v8, :cond_2

    .line 125
    invoke-static {v9}, Lcom/trueaxis/cLib/TrueaxisLib;->StartJoypad(I)V

    goto :goto_3

    :cond_2
    if-ne v6, v7, :cond_3

    .line 129
    invoke-static {v2}, Lcom/trueaxis/cLib/TrueaxisLib;->StartJoypad(I)V

    :cond_3
    :goto_3
    add-int/lit8 p1, p1, 0x1

    goto/16 :goto_2

    :cond_4
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .line 139
    invoke-super {p0}, Landroid/app/NativeActivity;->onDestroy()V

    .line 140
    iget-object v0, p0, Lcom/trueaxis/jetcarstunts2/Jetcarstunts2Activity;->game:Lcom/trueaxis/game/Interface;

    invoke-virtual {v0}, Lcom/trueaxis/game/Interface;->onDestroy()V

    .line 141
    iget-object v0, p0, Lcom/trueaxis/jetcarstunts2/Jetcarstunts2Activity;->mInputManager:Lcom/trueaxis/inputmanagercompat/InputManagerCompat;

    if-eqz v0, :cond_0

    .line 142
    invoke-interface {v0, p0}, Lcom/trueaxis/inputmanagercompat/InputManagerCompat;->unregisterInputDeviceListener(Lcom/trueaxis/inputmanagercompat/InputManagerCompat$InputDeviceListener;)V

    .line 143
    :cond_0
    invoke-virtual {p0}, Lcom/trueaxis/jetcarstunts2/Jetcarstunts2Activity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    .line 145
    invoke-static {v0}, Ljava/lang/System;->exit(I)V

    :cond_1
    return-void
.end method

.method public onInputDeviceAdded(I)V
    .locals 7

    .line 197
    iget-object v0, p0, Lcom/trueaxis/jetcarstunts2/Jetcarstunts2Activity;->mInputManager:Lcom/trueaxis/inputmanagercompat/InputManagerCompat;

    invoke-interface {v0, p1}, Lcom/trueaxis/inputmanagercompat/InputManagerCompat;->getInputDevice(I)Landroid/view/InputDevice;

    move-result-object p1

    .line 198
    invoke-virtual {p1}, Landroid/view/InputDevice;->getSources()I

    move-result v0

    and-int/lit16 v1, v0, 0x401

    const/16 v2, 0x401

    const v3, 0x1000010

    if-eq v1, v2, :cond_0

    and-int v4, v0, v3

    if-ne v4, v3, :cond_2

    .line 204
    :cond_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, ""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 206
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "Joystick attached: "

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/view/InputDevice;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 207
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p1}, Lcom/trueaxis/jetcarstunts2/Jetcarstunts2Activity;->dumpJoystickInfo(Landroid/view/InputDevice;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 209
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 211
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/trueaxis/jetcarstunts2/Jetcarstunts2Activity;->dumpGamepadButtons()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v4, "JetCarStunts2"

    .line 213
    invoke-static {v4, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 215
    invoke-static {}, Lcom/trueaxis/cLib/TrueaxisLib;->StopJoypad()V

    .line 216
    iget p1, p0, Lcom/trueaxis/jetcarstunts2/Jetcarstunts2Activity;->nButtonCount:I

    const/4 v4, 0x2

    if-le p1, v4, :cond_2

    and-int p1, v0, v3

    if-ne p1, v3, :cond_1

    .line 220
    invoke-static {v4}, Lcom/trueaxis/cLib/TrueaxisLib;->StartJoypad(I)V

    goto :goto_0

    :cond_1
    if-ne v1, v2, :cond_2

    const/4 p1, 0x1

    .line 224
    invoke-static {p1}, Lcom/trueaxis/cLib/TrueaxisLib;->StartJoypad(I)V

    :cond_2
    :goto_0
    return-void
.end method

.method public onInputDeviceChanged(I)V
    .locals 7

    .line 232
    iget-object v0, p0, Lcom/trueaxis/jetcarstunts2/Jetcarstunts2Activity;->mInputManager:Lcom/trueaxis/inputmanagercompat/InputManagerCompat;

    invoke-interface {v0, p1}, Lcom/trueaxis/inputmanagercompat/InputManagerCompat;->getInputDevice(I)Landroid/view/InputDevice;

    move-result-object p1

    .line 233
    invoke-virtual {p1}, Landroid/view/InputDevice;->getSources()I

    move-result v0

    and-int/lit16 v1, v0, 0x401

    const/16 v2, 0x401

    const v3, 0x1000010

    if-eq v1, v2, :cond_0

    and-int v4, v0, v3

    if-ne v4, v3, :cond_2

    .line 239
    :cond_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, ""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 241
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "Joystick attached: "

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/view/InputDevice;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 242
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p1}, Lcom/trueaxis/jetcarstunts2/Jetcarstunts2Activity;->dumpJoystickInfo(Landroid/view/InputDevice;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 244
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 245
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/trueaxis/jetcarstunts2/Jetcarstunts2Activity;->dumpGamepadButtons()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v4, "JetCarStunts2"

    .line 247
    invoke-static {v4, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 249
    invoke-static {}, Lcom/trueaxis/cLib/TrueaxisLib;->StopJoypad()V

    .line 250
    iget p1, p0, Lcom/trueaxis/jetcarstunts2/Jetcarstunts2Activity;->nButtonCount:I

    const/4 v4, 0x2

    if-le p1, v4, :cond_2

    and-int p1, v0, v3

    if-ne p1, v3, :cond_1

    .line 254
    invoke-static {v4}, Lcom/trueaxis/cLib/TrueaxisLib;->StartJoypad(I)V

    goto :goto_0

    :cond_1
    if-ne v1, v2, :cond_2

    const/4 p1, 0x1

    .line 258
    invoke-static {p1}, Lcom/trueaxis/cLib/TrueaxisLib;->StartJoypad(I)V

    :cond_2
    :goto_0
    return-void
.end method

.method public onInputDeviceRemoved(I)V
    .locals 0

    .line 266
    invoke-static {}, Lcom/trueaxis/cLib/TrueaxisLib;->StopJoypad()V

    return-void
.end method

.method protected onPause()V
    .locals 1

    .line 163
    invoke-super {p0}, Landroid/app/NativeActivity;->onPause()V

    .line 164
    iget-object v0, p0, Lcom/trueaxis/jetcarstunts2/Jetcarstunts2Activity;->mInputManager:Lcom/trueaxis/inputmanagercompat/InputManagerCompat;

    if-eqz v0, :cond_0

    .line 165
    invoke-interface {v0}, Lcom/trueaxis/inputmanagercompat/InputManagerCompat;->onPause()V

    .line 166
    :cond_0
    iget-object v0, p0, Lcom/trueaxis/jetcarstunts2/Jetcarstunts2Activity;->game:Lcom/trueaxis/game/Interface;

    invoke-virtual {v0}, Lcom/trueaxis/game/Interface;->onPause()V

    return-void
.end method

.method protected onResume()V
    .locals 1

    .line 171
    invoke-super {p0}, Landroid/app/NativeActivity;->onResume()V

    .line 172
    iget-object v0, p0, Lcom/trueaxis/jetcarstunts2/Jetcarstunts2Activity;->mInputManager:Lcom/trueaxis/inputmanagercompat/InputManagerCompat;

    if-eqz v0, :cond_0

    .line 173
    invoke-interface {v0}, Lcom/trueaxis/inputmanagercompat/InputManagerCompat;->onResume()V

    .line 175
    :cond_0
    iget-object v0, p0, Lcom/trueaxis/jetcarstunts2/Jetcarstunts2Activity;->game:Lcom/trueaxis/game/Interface;

    invoke-virtual {v0}, Lcom/trueaxis/game/Interface;->onResume()V

    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 1

    .line 59
    invoke-super {p0, p1}, Landroid/app/NativeActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 60
    iget-object v0, p0, Lcom/trueaxis/jetcarstunts2/Jetcarstunts2Activity;->game:Lcom/trueaxis/game/Interface;

    invoke-virtual {v0, p1}, Lcom/trueaxis/game/Interface;->onSaveInstanceState(Landroid/os/Bundle;)V

    return-void
.end method

.method public onStart()V
    .locals 1

    .line 151
    invoke-super {p0}, Landroid/app/NativeActivity;->onStart()V

    .line 152
    iget-object v0, p0, Lcom/trueaxis/jetcarstunts2/Jetcarstunts2Activity;->game:Lcom/trueaxis/game/Interface;

    invoke-virtual {v0}, Lcom/trueaxis/game/Interface;->onStart()V

    return-void
.end method

.method public onStop()V
    .locals 1

    .line 157
    invoke-super {p0}, Landroid/app/NativeActivity;->onStop()V

    .line 158
    iget-object v0, p0, Lcom/trueaxis/jetcarstunts2/Jetcarstunts2Activity;->game:Lcom/trueaxis/game/Interface;

    invoke-virtual {v0}, Lcom/trueaxis/game/Interface;->onStop()V

    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 0

    .line 180
    invoke-super {p0, p1}, Landroid/app/NativeActivity;->onWindowFocusChanged(Z)V

    if-eqz p1, :cond_0

    .line 184
    invoke-static {}, Lcom/trueaxis/util/Util;->resumeSoftkeysDelayed()V

    :cond_0
    return-void
.end method

.method public reStart()V
    .locals 2

    .line 322
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_0

    .line 324
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/trueaxis/jetcarstunts2/Jetcarstunts2Activity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const v1, 0x10008000

    .line 325
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 326
    invoke-virtual {p0, v0}, Lcom/trueaxis/jetcarstunts2/Jetcarstunts2Activity;->startActivity(Landroid/content/Intent;)V

    .line 328
    :cond_0
    invoke-static {p0}, Lcom/trueaxis/jetcarstunts2/Jetcarstunts2Activity;->doRestart(Landroid/content/Context;)V

    return-void
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 0

    .line 48
    sget p3, Lcom/trueaxis/util/Util;->mWidthScale:I

    sget p4, Lcom/trueaxis/util/Util;->mHeightScale:I

    invoke-super {p0, p1, p2, p3, p4}, Landroid/app/NativeActivity;->surfaceChanged(Landroid/view/SurfaceHolder;III)V

    .line 50
    sget p2, Lcom/trueaxis/util/Util;->mWidthScale:I

    sget p3, Lcom/trueaxis/util/Util;->mHeightScale:I

    invoke-interface {p1, p2, p3}, Landroid/view/SurfaceHolder;->setFixedSize(II)V

    .line 51
    sget-object p1, Lcom/trueaxis/util/Util;->mySurface:Landroid/view/SurfaceView;

    invoke-virtual {p1}, Landroid/view/SurfaceView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    .line 52
    sget p2, Lcom/trueaxis/util/Util;->mWidth:I

    iput p2, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 53
    sget p2, Lcom/trueaxis/util/Util;->mHeight:I

    iput p2, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 54
    sget-object p2, Lcom/trueaxis/util/Util;->mySurface:Landroid/view/SurfaceView;

    invoke-virtual {p2, p1}, Landroid/view/SurfaceView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method
