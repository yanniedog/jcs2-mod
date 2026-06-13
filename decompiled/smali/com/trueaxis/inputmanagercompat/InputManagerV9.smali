.class public Lcom/trueaxis/inputmanagercompat/InputManagerV9;
.super Ljava/lang/Object;
.source "InputManagerV9.java"

# interfaces
.implements Lcom/trueaxis/inputmanagercompat/InputManagerCompat;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trueaxis/inputmanagercompat/InputManagerV9$DeviceEvent;,
        Lcom/trueaxis/inputmanagercompat/InputManagerV9$PollingMessageHandler;
    }
.end annotation


# static fields
.field private static final CHECK_ELAPSED_TIME:J = 0xbb8L

.field private static final LOG_TAG:Ljava/lang/String; = "InputManagerV9"

.field private static final MESSAGE_TEST_FOR_DISCONNECT:I = 0x65

.field private static final ON_DEVICE_ADDED:I = 0x0

.field private static final ON_DEVICE_CHANGED:I = 0x1

.field private static final ON_DEVICE_REMOVED:I = 0x2


# instance fields
.field private final mDefaultHandler:Landroid/os/Handler;

.field private final mDevices:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "[J>;"
        }
    .end annotation
.end field

.field private final mListeners:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/trueaxis/inputmanagercompat/InputManagerCompat$InputDeviceListener;",
            "Landroid/os/Handler;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 88
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 89
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/trueaxis/inputmanagercompat/InputManagerV9;->mDevices:Landroid/util/SparseArray;

    .line 90
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/trueaxis/inputmanagercompat/InputManagerV9;->mListeners:Ljava/util/Map;

    .line 91
    new-instance v0, Lcom/trueaxis/inputmanagercompat/InputManagerV9$PollingMessageHandler;

    invoke-direct {v0, p0}, Lcom/trueaxis/inputmanagercompat/InputManagerV9$PollingMessageHandler;-><init>(Lcom/trueaxis/inputmanagercompat/InputManagerV9;)V

    iput-object v0, p0, Lcom/trueaxis/inputmanagercompat/InputManagerV9;->mDefaultHandler:Landroid/os/Handler;

    .line 94
    invoke-virtual {p0}, Lcom/trueaxis/inputmanagercompat/InputManagerV9;->getInputDeviceIds()[I

    return-void
.end method

.method static synthetic access$000(Lcom/trueaxis/inputmanagercompat/InputManagerV9;)Landroid/util/SparseArray;
    .locals 0

    .line 33
    iget-object p0, p0, Lcom/trueaxis/inputmanagercompat/InputManagerV9;->mDevices:Landroid/util/SparseArray;

    return-object p0
.end method

.method static synthetic access$100(Lcom/trueaxis/inputmanagercompat/InputManagerV9;II)V
    .locals 0

    .line 33
    invoke-direct {p0, p1, p2}, Lcom/trueaxis/inputmanagercompat/InputManagerV9;->notifyListeners(II)V

    return-void
.end method

.method private notifyListeners(II)V
    .locals 3

    .line 134
    iget-object v0, p0, Lcom/trueaxis/inputmanagercompat/InputManagerV9;->mListeners:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 137
    iget-object v0, p0, Lcom/trueaxis/inputmanagercompat/InputManagerV9;->mListeners:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trueaxis/inputmanagercompat/InputManagerCompat$InputDeviceListener;

    .line 138
    iget-object v2, p0, Lcom/trueaxis/inputmanagercompat/InputManagerV9;->mListeners:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/os/Handler;

    .line 139
    invoke-static {p1, p2, v1}, Lcom/trueaxis/inputmanagercompat/InputManagerV9$DeviceEvent;->getDeviceEvent(IILcom/trueaxis/inputmanagercompat/InputManagerCompat$InputDeviceListener;)Lcom/trueaxis/inputmanagercompat/InputManagerV9$DeviceEvent;

    move-result-object v1

    .line 140
    invoke-virtual {v2, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method public getInputDevice(I)Landroid/view/InputDevice;
    .locals 0

    .line 99
    invoke-static {p1}, Landroid/view/InputDevice;->getDevice(I)Landroid/view/InputDevice;

    move-result-object p1

    return-object p1
.end method

.method public getInputDeviceIds()[I
    .locals 9

    .line 106
    invoke-static {}, Landroid/view/InputDevice;->getDeviceIds()[I

    move-result-object v0

    .line 107
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    .line 108
    array-length v3, v0

    const/4 v4, 0x0

    const/4 v5, 0x0

    :goto_0
    if-ge v5, v3, :cond_1

    aget v6, v0, v5

    .line 109
    iget-object v7, p0, Lcom/trueaxis/inputmanagercompat/InputManagerV9;->mDevices:Landroid/util/SparseArray;

    invoke-virtual {v7, v6}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [J

    if-nez v7, :cond_0

    .line 112
    iget-object v7, p0, Lcom/trueaxis/inputmanagercompat/InputManagerV9;->mDevices:Landroid/util/SparseArray;

    const/4 v8, 0x1

    new-array v8, v8, [J

    aput-wide v1, v8, v4

    invoke-virtual {v7, v6, v8}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    :cond_0
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method public onGenericMotionEvent(I)V
    .locals 4

    .line 190
    iget-object v0, p0, Lcom/trueaxis/inputmanagercompat/InputManagerV9;->mDevices:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [J

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 192
    invoke-direct {p0, v1, p1}, Lcom/trueaxis/inputmanagercompat/InputManagerV9;->notifyListeners(II)V

    const/4 v0, 0x1

    new-array v0, v0, [J

    .line 194
    iget-object v2, p0, Lcom/trueaxis/inputmanagercompat/InputManagerV9;->mDevices:Landroid/util/SparseArray;

    invoke-virtual {v2, p1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 196
    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    .line 197
    aput-wide v2, v0, v1

    return-void
.end method

.method public onPause()V
    .locals 2

    .line 202
    iget-object v0, p0, Lcom/trueaxis/inputmanagercompat/InputManagerV9;->mDefaultHandler:Landroid/os/Handler;

    const/16 v1, 0x65

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    return-void
.end method

.method public onResume()V
    .locals 2

    .line 207
    iget-object v0, p0, Lcom/trueaxis/inputmanagercompat/InputManagerV9;->mDefaultHandler:Landroid/os/Handler;

    const/16 v1, 0x65

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    return-void
.end method

.method public registerInputDeviceListener(Lcom/trueaxis/inputmanagercompat/InputManagerCompat$InputDeviceListener;Landroid/os/Handler;)V
    .locals 1

    .line 120
    iget-object v0, p0, Lcom/trueaxis/inputmanagercompat/InputManagerV9;->mListeners:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    if-nez p2, :cond_0

    .line 122
    iget-object p2, p0, Lcom/trueaxis/inputmanagercompat/InputManagerV9;->mDefaultHandler:Landroid/os/Handler;

    .line 124
    :cond_0
    iget-object v0, p0, Lcom/trueaxis/inputmanagercompat/InputManagerV9;->mListeners:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public unregisterInputDeviceListener(Lcom/trueaxis/inputmanagercompat/InputManagerCompat$InputDeviceListener;)V
    .locals 1

    .line 129
    iget-object v0, p0, Lcom/trueaxis/inputmanagercompat/InputManagerV9;->mListeners:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
