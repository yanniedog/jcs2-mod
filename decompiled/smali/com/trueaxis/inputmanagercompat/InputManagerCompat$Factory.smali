.class public Lcom/trueaxis/inputmanagercompat/InputManagerCompat$Factory;
.super Ljava/lang/Object;
.source "InputManagerCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trueaxis/inputmanagercompat/InputManagerCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Factory"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 123
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInputManager(Landroid/content/Context;)Lcom/trueaxis/inputmanagercompat/InputManagerCompat;
    .locals 2

    .line 133
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_0

    .line 134
    new-instance v0, Lcom/trueaxis/inputmanagercompat/InputManagerV16;

    invoke-direct {v0, p0}, Lcom/trueaxis/inputmanagercompat/InputManagerV16;-><init>(Landroid/content/Context;)V

    return-object v0

    .line 136
    :cond_0
    new-instance p0, Lcom/trueaxis/inputmanagercompat/InputManagerV9;

    invoke-direct {p0}, Lcom/trueaxis/inputmanagercompat/InputManagerV9;-><init>()V

    return-object p0
.end method
