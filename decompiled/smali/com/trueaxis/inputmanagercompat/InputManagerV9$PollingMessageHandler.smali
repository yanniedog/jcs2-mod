.class Lcom/trueaxis/inputmanagercompat/InputManagerV9$PollingMessageHandler;
.super Landroid/os/Handler;
.source "InputManagerV9.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trueaxis/inputmanagercompat/InputManagerV9;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "PollingMessageHandler"
.end annotation


# instance fields
.field private final mInputManager:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/trueaxis/inputmanagercompat/InputManagerV9;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/trueaxis/inputmanagercompat/InputManagerV9;)V
    .locals 1

    .line 49
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 50
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/trueaxis/inputmanagercompat/InputManagerV9$PollingMessageHandler;->mInputManager:Ljava/lang/ref/WeakReference;

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 12

    .line 55
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 56
    iget p1, p1, Landroid/os/Message;->what:I

    const/16 v0, 0x65

    if-eq p1, v0, :cond_0

    goto :goto_2

    .line 58
    :cond_0
    iget-object p1, p0, Lcom/trueaxis/inputmanagercompat/InputManagerV9$PollingMessageHandler;->mInputManager:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/trueaxis/inputmanagercompat/InputManagerV9;

    if-eqz p1, :cond_4

    .line 60
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    .line 61
    invoke-static {p1}, Lcom/trueaxis/inputmanagercompat/InputManagerV9;->access$000(Lcom/trueaxis/inputmanagercompat/InputManagerV9;)Landroid/util/SparseArray;

    move-result-object v3

    invoke-virtual {v3}, Landroid/util/SparseArray;->size()I

    move-result v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    :goto_0
    const-wide/16 v6, 0xbb8

    if-ge v5, v3, :cond_3

    .line 63
    invoke-static {p1}, Lcom/trueaxis/inputmanagercompat/InputManagerV9;->access$000(Lcom/trueaxis/inputmanagercompat/InputManagerV9;)Landroid/util/SparseArray;

    move-result-object v8

    invoke-virtual {v8, v5}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [J

    if-eqz v8, :cond_2

    .line 65
    aget-wide v9, v8, v4

    sub-long v9, v1, v9

    cmp-long v11, v9, v6

    if-lez v11, :cond_2

    .line 68
    invoke-static {p1}, Lcom/trueaxis/inputmanagercompat/InputManagerV9;->access$000(Lcom/trueaxis/inputmanagercompat/InputManagerV9;)Landroid/util/SparseArray;

    move-result-object v6

    invoke-virtual {v6, v5}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v6

    .line 69
    invoke-static {v6}, Landroid/view/InputDevice;->getDevice(I)Landroid/view/InputDevice;

    move-result-object v7

    if-nez v7, :cond_1

    const/4 v7, 0x2

    .line 71
    invoke-static {p1, v7, v6}, Lcom/trueaxis/inputmanagercompat/InputManagerV9;->access$100(Lcom/trueaxis/inputmanagercompat/InputManagerV9;II)V

    .line 72
    invoke-static {p1}, Lcom/trueaxis/inputmanagercompat/InputManagerV9;->access$000(Lcom/trueaxis/inputmanagercompat/InputManagerV9;)Landroid/util/SparseArray;

    move-result-object v7

    invoke-virtual {v7, v6}, Landroid/util/SparseArray;->remove(I)V

    goto :goto_1

    .line 74
    :cond_1
    aput-wide v1, v8, v4

    :cond_2
    :goto_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 79
    :cond_3
    invoke-virtual {p0, v0, v6, v7}, Lcom/trueaxis/inputmanagercompat/InputManagerV9$PollingMessageHandler;->sendEmptyMessageDelayed(IJ)Z

    :cond_4
    :goto_2
    return-void
.end method
