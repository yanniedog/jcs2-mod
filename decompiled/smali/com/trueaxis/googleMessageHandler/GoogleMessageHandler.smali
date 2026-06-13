.class public Lcom/trueaxis/googleMessageHandler/GoogleMessageHandler;
.super Ljava/lang/Object;
.source "GoogleMessageHandler.java"


# static fields
.field public static ApiHandler:Landroid/os/Handler; = null

.field public static final finaliseIAPHandler:I = 0x102

.field public static final imagePickerHandler:I = 0x105

.field public static final initialiseIAPHandler:I = 0x101

.field public static final openWebsiteHandler:I = 0x106

.field public static final purchaseIAPHandler:I = 0x104

.field public static final restoreDLC:I = 0x107

.field public static final restoreIAPHandler:I = 0x103


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static startMessageHandler()V
    .locals 1

    .line 33
    new-instance v0, Lcom/trueaxis/googleMessageHandler/GoogleMessageHandler$1;

    invoke-direct {v0}, Lcom/trueaxis/googleMessageHandler/GoogleMessageHandler$1;-><init>()V

    sput-object v0, Lcom/trueaxis/googleMessageHandler/GoogleMessageHandler;->ApiHandler:Landroid/os/Handler;

    return-void
.end method
