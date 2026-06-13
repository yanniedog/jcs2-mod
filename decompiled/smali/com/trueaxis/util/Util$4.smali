.class Lcom/trueaxis/util/Util$4;
.super Ljava/lang/Object;
.source "Util.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/util/Util;->setFixedSize()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trueaxis/util/Util;


# direct methods
.method constructor <init>(Lcom/trueaxis/util/Util;)V
    .locals 0

    .line 282
    iput-object p1, p0, Lcom/trueaxis/util/Util$4;->this$0:Lcom/trueaxis/util/Util;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 286
    sget-object v0, Lcom/trueaxis/util/Util;->mySurface:Landroid/view/SurfaceView;

    invoke-virtual {v0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    .line 287
    sget v1, Lcom/trueaxis/util/Util;->mWidthScale:I

    sget v2, Lcom/trueaxis/util/Util;->mHeightScale:I

    invoke-interface {v0, v1, v2}, Landroid/view/SurfaceHolder;->setFixedSize(II)V

    return-void
.end method
