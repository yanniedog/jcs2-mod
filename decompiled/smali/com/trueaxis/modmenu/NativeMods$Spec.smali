.class final Lcom/trueaxis/modmenu/NativeMods$Spec;
.super Ljava/lang/Object;
.source "NativeMods.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trueaxis/modmenu/NativeMods;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Spec"
.end annotation


# instance fields
.field final category:Ljava/lang/String;

.field final danger:Z

.field final id:I

.field final label:Ljava/lang/String;

.field final type:I


# direct methods
.method constructor <init>(IILjava/lang/String;Ljava/lang/String;)V
    .registers 11

    .line 37
    const/4 v5, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/trueaxis/modmenu/NativeMods$Spec;-><init>(IILjava/lang/String;Ljava/lang/String;Z)V

    .line 38
    return-void
.end method

.method constructor <init>(IILjava/lang/String;Ljava/lang/String;Z)V
    .registers 6

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput p1, p0, Lcom/trueaxis/modmenu/NativeMods$Spec;->id:I

    .line 42
    iput p2, p0, Lcom/trueaxis/modmenu/NativeMods$Spec;->type:I

    .line 43
    iput-object p3, p0, Lcom/trueaxis/modmenu/NativeMods$Spec;->category:Ljava/lang/String;

    .line 44
    iput-object p4, p0, Lcom/trueaxis/modmenu/NativeMods$Spec;->label:Ljava/lang/String;

    .line 45
    iput-boolean p5, p0, Lcom/trueaxis/modmenu/NativeMods$Spec;->danger:Z

    .line 46
    return-void
.end method
