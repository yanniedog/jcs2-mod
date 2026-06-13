.class Lcom/trueaxis/inputmanagercompat/InputManagerV9$DeviceEvent;
.super Ljava/lang/Object;
.source "InputManagerV9.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trueaxis/inputmanagercompat/InputManagerV9;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DeviceEvent"
.end annotation


# static fields
.field private static sEventQueue:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Lcom/trueaxis/inputmanagercompat/InputManagerV9$DeviceEvent;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mId:I

.field private mListener:Lcom/trueaxis/inputmanagercompat/InputManagerCompat$InputDeviceListener;

.field private mMessageType:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 149
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    sput-object v0, Lcom/trueaxis/inputmanagercompat/InputManagerV9$DeviceEvent;->sEventQueue:Ljava/util/Queue;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 151
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static getDeviceEvent(IILcom/trueaxis/inputmanagercompat/InputManagerCompat$InputDeviceListener;)Lcom/trueaxis/inputmanagercompat/InputManagerV9$DeviceEvent;
    .locals 1

    .line 156
    sget-object v0, Lcom/trueaxis/inputmanagercompat/InputManagerV9$DeviceEvent;->sEventQueue:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/trueaxis/inputmanagercompat/InputManagerV9$DeviceEvent;

    if-nez v0, :cond_0

    .line 158
    new-instance v0, Lcom/trueaxis/inputmanagercompat/InputManagerV9$DeviceEvent;

    invoke-direct {v0}, Lcom/trueaxis/inputmanagercompat/InputManagerV9$DeviceEvent;-><init>()V

    .line 160
    :cond_0
    iput p0, v0, Lcom/trueaxis/inputmanagercompat/InputManagerV9$DeviceEvent;->mMessageType:I

    .line 161
    iput p1, v0, Lcom/trueaxis/inputmanagercompat/InputManagerV9$DeviceEvent;->mId:I

    .line 162
    iput-object p2, v0, Lcom/trueaxis/inputmanagercompat/InputManagerV9$DeviceEvent;->mListener:Lcom/trueaxis/inputmanagercompat/InputManagerCompat$InputDeviceListener;

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 168
    iget v0, p0, Lcom/trueaxis/inputmanagercompat/InputManagerV9$DeviceEvent;->mMessageType:I

    if-eqz v0, :cond_2

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    const-string v0, "InputManagerV9"

    const-string v1, "Unknown Message Type"

    .line 179
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 176
    :cond_0
    iget-object v0, p0, Lcom/trueaxis/inputmanagercompat/InputManagerV9$DeviceEvent;->mListener:Lcom/trueaxis/inputmanagercompat/InputManagerCompat$InputDeviceListener;

    iget v1, p0, Lcom/trueaxis/inputmanagercompat/InputManagerV9$DeviceEvent;->mId:I

    invoke-interface {v0, v1}, Lcom/trueaxis/inputmanagercompat/InputManagerCompat$InputDeviceListener;->onInputDeviceRemoved(I)V

    goto :goto_0

    .line 173
    :cond_1
    iget-object v0, p0, Lcom/trueaxis/inputmanagercompat/InputManagerV9$DeviceEvent;->mListener:Lcom/trueaxis/inputmanagercompat/InputManagerCompat$InputDeviceListener;

    iget v1, p0, Lcom/trueaxis/inputmanagercompat/InputManagerV9$DeviceEvent;->mId:I

    invoke-interface {v0, v1}, Lcom/trueaxis/inputmanagercompat/InputManagerCompat$InputDeviceListener;->onInputDeviceChanged(I)V

    goto :goto_0

    .line 170
    :cond_2
    iget-object v0, p0, Lcom/trueaxis/inputmanagercompat/InputManagerV9$DeviceEvent;->mListener:Lcom/trueaxis/inputmanagercompat/InputManagerCompat$InputDeviceListener;

    iget v1, p0, Lcom/trueaxis/inputmanagercompat/InputManagerV9$DeviceEvent;->mId:I

    invoke-interface {v0, v1}, Lcom/trueaxis/inputmanagercompat/InputManagerCompat$InputDeviceListener;->onInputDeviceAdded(I)V

    .line 183
    :goto_0
    sget-object v0, Lcom/trueaxis/inputmanagercompat/InputManagerV9$DeviceEvent;->sEventQueue:Ljava/util/Queue;

    invoke-interface {v0, p0}, Ljava/util/Queue;->offer(Ljava/lang/Object;)Z

    return-void
.end method
