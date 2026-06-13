.class Lcom/trueaxis/inputmanagercompat/InputManagerV16$V16InputDeviceListener;
.super Ljava/lang/Object;
.source "InputManagerV16.java"

# interfaces
.implements Landroid/hardware/input/InputManager$InputDeviceListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trueaxis/inputmanagercompat/InputManagerV16;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "V16InputDeviceListener"
.end annotation


# instance fields
.field final mIDL:Lcom/trueaxis/inputmanagercompat/InputManagerCompat$InputDeviceListener;


# direct methods
.method public constructor <init>(Lcom/trueaxis/inputmanagercompat/InputManagerCompat$InputDeviceListener;)V
    .locals 0

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    iput-object p1, p0, Lcom/trueaxis/inputmanagercompat/InputManagerV16$V16InputDeviceListener;->mIDL:Lcom/trueaxis/inputmanagercompat/InputManagerCompat$InputDeviceListener;

    return-void
.end method


# virtual methods
.method public onInputDeviceAdded(I)V
    .locals 1

    .line 60
    iget-object v0, p0, Lcom/trueaxis/inputmanagercompat/InputManagerV16$V16InputDeviceListener;->mIDL:Lcom/trueaxis/inputmanagercompat/InputManagerCompat$InputDeviceListener;

    invoke-interface {v0, p1}, Lcom/trueaxis/inputmanagercompat/InputManagerCompat$InputDeviceListener;->onInputDeviceAdded(I)V

    return-void
.end method

.method public onInputDeviceChanged(I)V
    .locals 1

    .line 65
    iget-object v0, p0, Lcom/trueaxis/inputmanagercompat/InputManagerV16$V16InputDeviceListener;->mIDL:Lcom/trueaxis/inputmanagercompat/InputManagerCompat$InputDeviceListener;

    invoke-interface {v0, p1}, Lcom/trueaxis/inputmanagercompat/InputManagerCompat$InputDeviceListener;->onInputDeviceChanged(I)V

    return-void
.end method

.method public onInputDeviceRemoved(I)V
    .locals 1

    .line 70
    iget-object v0, p0, Lcom/trueaxis/inputmanagercompat/InputManagerV16$V16InputDeviceListener;->mIDL:Lcom/trueaxis/inputmanagercompat/InputManagerCompat$InputDeviceListener;

    invoke-interface {v0, p1}, Lcom/trueaxis/inputmanagercompat/InputManagerCompat$InputDeviceListener;->onInputDeviceRemoved(I)V

    return-void
.end method
