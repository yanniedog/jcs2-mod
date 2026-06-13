.class public interface abstract Lcom/trueaxis/inputmanagercompat/InputManagerCompat;
.super Ljava/lang/Object;
.source "InputManagerCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trueaxis/inputmanagercompat/InputManagerCompat$Factory;,
        Lcom/trueaxis/inputmanagercompat/InputManagerCompat$InputDeviceListener;
    }
.end annotation


# virtual methods
.method public abstract getInputDevice(I)Landroid/view/InputDevice;
.end method

.method public abstract getInputDeviceIds()[I
.end method

.method public abstract onGenericMotionEvent(I)V
.end method

.method public abstract onPause()V
.end method

.method public abstract onResume()V
.end method

.method public abstract registerInputDeviceListener(Lcom/trueaxis/inputmanagercompat/InputManagerCompat$InputDeviceListener;Landroid/os/Handler;)V
.end method

.method public abstract unregisterInputDeviceListener(Lcom/trueaxis/inputmanagercompat/InputManagerCompat$InputDeviceListener;)V
.end method
