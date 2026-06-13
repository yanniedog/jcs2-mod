.class public Lcom/trueaxis/inputmanagercompat/InputManagerV16;
.super Ljava/lang/Object;
.source "InputManagerV16.java"

# interfaces
.implements Lcom/trueaxis/inputmanagercompat/InputManagerCompat;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trueaxis/inputmanagercompat/InputManagerV16$V16InputDeviceListener;
    }
.end annotation


# instance fields
.field private final mInputManager:Landroid/hardware/input/InputManager;

.field private final mListeners:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/trueaxis/inputmanagercompat/InputManagerCompat$InputDeviceListener;",
            "Lcom/trueaxis/inputmanagercompat/InputManagerV16$V16InputDeviceListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "input"

    .line 37
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/hardware/input/InputManager;

    iput-object p1, p0, Lcom/trueaxis/inputmanagercompat/InputManagerV16;->mInputManager:Landroid/hardware/input/InputManager;

    .line 38
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/trueaxis/inputmanagercompat/InputManagerV16;->mListeners:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public getInputDevice(I)Landroid/view/InputDevice;
    .locals 1

    .line 43
    iget-object v0, p0, Lcom/trueaxis/inputmanagercompat/InputManagerV16;->mInputManager:Landroid/hardware/input/InputManager;

    invoke-virtual {v0, p1}, Landroid/hardware/input/InputManager;->getInputDevice(I)Landroid/view/InputDevice;

    move-result-object p1

    return-object p1
.end method

.method public getInputDeviceIds()[I
    .locals 1

    .line 48
    iget-object v0, p0, Lcom/trueaxis/inputmanagercompat/InputManagerV16;->mInputManager:Landroid/hardware/input/InputManager;

    invoke-virtual {v0}, Landroid/hardware/input/InputManager;->getInputDeviceIds()[I

    move-result-object v0

    return-object v0
.end method

.method public onGenericMotionEvent(I)V
    .locals 0

    return-void
.end method

.method public onPause()V
    .locals 0

    return-void
.end method

.method public onResume()V
    .locals 0

    return-void
.end method

.method public registerInputDeviceListener(Lcom/trueaxis/inputmanagercompat/InputManagerCompat$InputDeviceListener;Landroid/os/Handler;)V
    .locals 2

    .line 77
    new-instance v0, Lcom/trueaxis/inputmanagercompat/InputManagerV16$V16InputDeviceListener;

    invoke-direct {v0, p1}, Lcom/trueaxis/inputmanagercompat/InputManagerV16$V16InputDeviceListener;-><init>(Lcom/trueaxis/inputmanagercompat/InputManagerCompat$InputDeviceListener;)V

    .line 78
    iget-object v1, p0, Lcom/trueaxis/inputmanagercompat/InputManagerV16;->mInputManager:Landroid/hardware/input/InputManager;

    invoke-virtual {v1, v0, p2}, Landroid/hardware/input/InputManager;->registerInputDeviceListener(Landroid/hardware/input/InputManager$InputDeviceListener;Landroid/os/Handler;)V

    .line 79
    iget-object p2, p0, Lcom/trueaxis/inputmanagercompat/InputManagerV16;->mListeners:Ljava/util/Map;

    invoke-interface {p2, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public unregisterInputDeviceListener(Lcom/trueaxis/inputmanagercompat/InputManagerCompat$InputDeviceListener;)V
    .locals 1

    .line 84
    iget-object v0, p0, Lcom/trueaxis/inputmanagercompat/InputManagerV16;->mListeners:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/trueaxis/inputmanagercompat/InputManagerV16$V16InputDeviceListener;

    if-eqz p1, :cond_0

    .line 87
    iget-object v0, p0, Lcom/trueaxis/inputmanagercompat/InputManagerV16;->mInputManager:Landroid/hardware/input/InputManager;

    invoke-virtual {v0, p1}, Landroid/hardware/input/InputManager;->unregisterInputDeviceListener(Landroid/hardware/input/InputManager$InputDeviceListener;)V

    :cond_0
    return-void
.end method
