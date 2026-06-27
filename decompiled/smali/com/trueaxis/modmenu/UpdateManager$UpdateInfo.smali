.class final Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;
.super Ljava/lang/Object;
.source "UpdateManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trueaxis/modmenu/UpdateManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "UpdateInfo"
.end annotation


# instance fields
.field apkName:Ljava/lang/String;

.field apkSha256:Ljava/lang/String;

.field apkSize:J

.field apkUrl:Ljava/lang/String;

.field packageName:Ljava/lang/String;

.field versionCode:I

.field versionName:Ljava/lang/String;


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 492
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/trueaxis/modmenu/UpdateManager$1;)V
    .registers 2

    .line 492
    invoke-direct {p0}, Lcom/trueaxis/modmenu/UpdateManager$UpdateInfo;-><init>()V

    return-void
.end method
