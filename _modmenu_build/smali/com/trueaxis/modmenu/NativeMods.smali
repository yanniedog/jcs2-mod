.class public final Lcom/trueaxis/modmenu/NativeMods;
.super Ljava/lang/Object;
.source "NativeMods.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trueaxis/modmenu/NativeMods$Spec;
    }
.end annotation


# static fields
.field public static final BOOL:I = 0x1

.field public static final CALL_INT:I = 0x5

.field public static final FLOAT:I = 0x3

.field public static final FUNC:I = 0x4

.field public static final INT:I = 0x2

.field private static final SPECS:[Lcom/trueaxis/modmenu/NativeMods$Spec;

.field private static loaded:Z


# direct methods
.method static constructor <clinit>()V
    .registers 16

    .line 49
    const/16 v0, 0x34

    new-array v0, v0, [Lcom/trueaxis/modmenu/NativeMods$Spec;

    new-instance v1, Lcom/trueaxis/modmenu/NativeMods$Spec;

    const-string v2, "Levels_IsPurchased return (ON = owned)"

    const/16 v3, 0x2a

    const/4 v4, 0x4

    const-string v5, "Unlocks & monetization"

    invoke-direct {v1, v3, v4, v5, v2}, Lcom/trueaxis/modmenu/NativeMods$Spec;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    const/4 v2, 0x0

    aput-object v1, v0, v2

    new-instance v1, Lcom/trueaxis/modmenu/NativeMods$Spec;

    const-string v6, "Store_IsItemPurchased return (ON = owned)"

    const/16 v7, 0x2b

    invoke-direct {v1, v7, v4, v5, v6}, Lcom/trueaxis/modmenu/NativeMods$Spec;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    const/4 v6, 0x1

    aput-object v1, v0, v6

    new-instance v1, Lcom/trueaxis/modmenu/NativeMods$Spec;

    const-string v8, "IsItemPurchased return (ON = owned)"

    const/16 v9, 0x2c

    invoke-direct {v1, v9, v4, v5, v8}, Lcom/trueaxis/modmenu/NativeMods$Spec;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    const/4 v8, 0x2

    aput-object v1, v0, v8

    new-instance v1, Lcom/trueaxis/modmenu/NativeMods$Spec;

    const-string v10, "Level editor unlocked return (ON = unlocked)"

    const/16 v11, 0x2d

    invoke-direct {v1, v11, v4, v5, v10}, Lcom/trueaxis/modmenu/NativeMods$Spec;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    const/4 v10, 0x3

    aput-object v1, v0, v10

    new-instance v1, Lcom/trueaxis/modmenu/NativeMods$Spec;

    const-string v12, "g_bUnLockAll (ON = unlock all)"

    invoke-direct {v1, v2, v6, v5, v12}, Lcom/trueaxis/modmenu/NativeMods$Spec;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    aput-object v1, v0, v4

    new-instance v1, Lcom/trueaxis/modmenu/NativeMods$Spec;

    const-string v5, "MaxUserLevelsReached return (OFF = unlimited)"

    const/16 v12, 0x2e

    const-string v13, "Level editor limits"

    invoke-direct {v1, v12, v4, v13, v5}, Lcom/trueaxis/modmenu/NativeMods$Spec;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    const/4 v5, 0x5

    aput-object v1, v0, v5

    new-instance v1, Lcom/trueaxis/modmenu/NativeMods$Spec;

    const-string v14, "Maximum checkpoint times"

    const/16 v15, 0x13

    invoke-direct {v1, v15, v8, v13, v14}, Lcom/trueaxis/modmenu/NativeMods$Spec;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    const/4 v14, 0x6

    aput-object v1, v0, v14

    new-instance v1, Lcom/trueaxis/modmenu/NativeMods$Spec;

    const-string v2, "Maximum text buffer size"

    const/16 v12, 0x14

    invoke-direct {v1, v12, v8, v13, v2}, Lcom/trueaxis/modmenu/NativeMods$Spec;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    const/4 v2, 0x7

    aput-object v1, v0, v2

    new-instance v1, Lcom/trueaxis/modmenu/NativeMods$Spec;

    const-string v13, "Ready-set-go countdown seconds"

    const/16 v11, 0x22

    const-string v9, "Gameplay tuning"

    invoke-direct {v1, v11, v10, v9, v13}, Lcom/trueaxis/modmenu/NativeMods$Spec;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    const/16 v13, 0x8

    aput-object v1, v0, v13

    new-instance v1, Lcom/trueaxis/modmenu/NativeMods$Spec;

    const/16 v7, 0x23

    const-string v3, "G-sensor responsiveness"

    invoke-direct {v1, v7, v10, v9, v3}, Lcom/trueaxis/modmenu/NativeMods$Spec;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    const/16 v3, 0x9

    aput-object v1, v0, v3

    new-instance v1, Lcom/trueaxis/modmenu/NativeMods$Spec;

    const/16 v3, 0x24

    const-string v7, "Screen tilt"

    invoke-direct {v1, v3, v10, v9, v7}, Lcom/trueaxis/modmenu/NativeMods$Spec;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    const/16 v3, 0xa

    aput-object v1, v0, v3

    new-instance v1, Lcom/trueaxis/modmenu/NativeMods$Spec;

    const/16 v3, 0x25

    const-string v7, "Sensor difference"

    invoke-direct {v1, v3, v10, v9, v7}, Lcom/trueaxis/modmenu/NativeMods$Spec;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    const/16 v3, 0xb

    aput-object v1, v0, v3

    new-instance v1, Lcom/trueaxis/modmenu/NativeMods$Spec;

    const/16 v3, 0xe

    const-string v7, "Rocket fuel empty message"

    invoke-direct {v1, v3, v6, v9, v7}, Lcom/trueaxis/modmenu/NativeMods$Spec;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    const/16 v3, 0xc

    aput-object v1, v0, v3

    new-instance v1, Lcom/trueaxis/modmenu/NativeMods$Spec;

    const/16 v3, 0x20

    const-string v7, "Freestyle best trick score"

    invoke-direct {v1, v3, v8, v9, v7}, Lcom/trueaxis/modmenu/NativeMods$Spec;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    const/16 v3, 0xd

    aput-object v1, v0, v3

    new-instance v1, Lcom/trueaxis/modmenu/NativeMods$Spec;

    const/16 v3, 0x21

    const-string v7, "In-air stunt counter"

    invoke-direct {v1, v3, v8, v9, v7}, Lcom/trueaxis/modmenu/NativeMods$Spec;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    const/16 v3, 0xe

    aput-object v1, v0, v3

    new-instance v1, Lcom/trueaxis/modmenu/NativeMods$Spec;

    const-string v3, "Hyper ballistic"

    const-string v7, "Cheat & debug flags"

    invoke-direct {v1, v6, v6, v7, v3}, Lcom/trueaxis/modmenu/NativeMods$Spec;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    const/16 v3, 0xf

    aput-object v1, v0, v3

    new-instance v1, Lcom/trueaxis/modmenu/NativeMods$Spec;

    const-string v3, "AI on player car"

    invoke-direct {v1, v8, v6, v7, v3}, Lcom/trueaxis/modmenu/NativeMods$Spec;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    const/16 v3, 0x10

    aput-object v1, v0, v3

    new-instance v1, Lcom/trueaxis/modmenu/NativeMods$Spec;

    const-string v3, "AI enabled"

    invoke-direct {v1, v10, v6, v7, v3}, Lcom/trueaxis/modmenu/NativeMods$Spec;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    const/16 v3, 0x11

    aput-object v1, v0, v3

    new-instance v1, Lcom/trueaxis/modmenu/NativeMods$Spec;

    const-string v3, "Fast forward"

    invoke-direct {v1, v4, v6, v7, v3}, Lcom/trueaxis/modmenu/NativeMods$Spec;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    const/16 v3, 0x12

    aput-object v1, v0, v3

    new-instance v1, Lcom/trueaxis/modmenu/NativeMods$Spec;

    const-string v3, "Show replay"

    invoke-direct {v1, v5, v6, v7, v3}, Lcom/trueaxis/modmenu/NativeMods$Spec;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    aput-object v1, v0, v15

    new-instance v1, Lcom/trueaxis/modmenu/NativeMods$Spec;

    const-string v3, "Screenshot mode"

    invoke-direct {v1, v14, v6, v7, v3}, Lcom/trueaxis/modmenu/NativeMods$Spec;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    aput-object v1, v0, v12

    new-instance v1, Lcom/trueaxis/modmenu/NativeMods$Spec;

    const-string v3, "In-game level editor"

    invoke-direct {v1, v2, v6, v7, v3}, Lcom/trueaxis/modmenu/NativeMods$Spec;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    const/16 v2, 0x15

    aput-object v1, v0, v2

    new-instance v1, Lcom/trueaxis/modmenu/NativeMods$Spec;

    const-string v2, "Disable dynamic cube mapping"

    invoke-direct {v1, v13, v6, v7, v2}, Lcom/trueaxis/modmenu/NativeMods$Spec;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    const/16 v2, 0x16

    aput-object v1, v0, v2

    new-instance v1, Lcom/trueaxis/modmenu/NativeMods$Spec;

    const/16 v2, 0x9

    const-string v3, "Sound loops off"

    invoke-direct {v1, v2, v6, v7, v3}, Lcom/trueaxis/modmenu/NativeMods$Spec;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    const/16 v2, 0x17

    aput-object v1, v0, v2

    new-instance v1, Lcom/trueaxis/modmenu/NativeMods$Spec;

    const/16 v2, 0xa

    const-string v3, "Flip screen"

    invoke-direct {v1, v2, v6, v7, v3}, Lcom/trueaxis/modmenu/NativeMods$Spec;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    const/16 v2, 0x18

    aput-object v1, v0, v2

    new-instance v1, Lcom/trueaxis/modmenu/NativeMods$Spec;

    const/16 v2, 0xb

    const-string v3, "Rotate screen"

    invoke-direct {v1, v2, v6, v7, v3}, Lcom/trueaxis/modmenu/NativeMods$Spec;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    const/16 v2, 0x19

    aput-object v1, v0, v2

    new-instance v1, Lcom/trueaxis/modmenu/NativeMods$Spec;

    const-string v2, "Prevent 30fps switch"

    const/16 v3, 0xc

    const-string v4, "Rendering & performance"

    invoke-direct {v1, v3, v6, v4, v2}, Lcom/trueaxis/modmenu/NativeMods$Spec;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    const/16 v2, 0x1a

    aput-object v1, v0, v2

    new-instance v1, Lcom/trueaxis/modmenu/NativeMods$Spec;

    const/16 v2, 0xd

    const-string v3, "Dynamic reflections"

    invoke-direct {v1, v2, v6, v4, v3}, Lcom/trueaxis/modmenu/NativeMods$Spec;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    const/16 v2, 0x1b

    aput-object v1, v0, v2

    new-instance v1, Lcom/trueaxis/modmenu/NativeMods$Spec;

    const/16 v2, 0x10

    const-string v3, "Frame rate flag"

    invoke-direct {v1, v2, v6, v4, v3}, Lcom/trueaxis/modmenu/NativeMods$Spec;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    const/16 v2, 0x1c

    aput-object v1, v0, v2

    new-instance v1, Lcom/trueaxis/modmenu/NativeMods$Spec;

    const/16 v2, 0x11

    const-string v3, "Default frame rate flag"

    invoke-direct {v1, v2, v6, v4, v3}, Lcom/trueaxis/modmenu/NativeMods$Spec;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    const/16 v2, 0x1d

    aput-object v1, v0, v2

    new-instance v1, Lcom/trueaxis/modmenu/NativeMods$Spec;

    const/16 v2, 0x12

    const-string v3, "Default dynamic reflections"

    invoke-direct {v1, v2, v6, v4, v3}, Lcom/trueaxis/modmenu/NativeMods$Spec;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    const/16 v2, 0x1e

    aput-object v1, v0, v2

    new-instance v1, Lcom/trueaxis/modmenu/NativeMods$Spec;

    const/16 v2, 0x15

    const-string v3, "Frame delay"

    invoke-direct {v1, v2, v8, v4, v3}, Lcom/trueaxis/modmenu/NativeMods$Spec;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    const/16 v2, 0x1f

    aput-object v1, v0, v2

    new-instance v1, Lcom/trueaxis/modmenu/NativeMods$Spec;

    const/16 v2, 0x16

    const-string v3, "MSAA sample count"

    invoke-direct {v1, v2, v8, v4, v3}, Lcom/trueaxis/modmenu/NativeMods$Spec;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    const/16 v2, 0x20

    aput-object v1, v0, v2

    new-instance v1, Lcom/trueaxis/modmenu/NativeMods$Spec;

    const/16 v2, 0x1a

    const-string v3, "Requested red bits"

    invoke-direct {v1, v2, v8, v4, v3}, Lcom/trueaxis/modmenu/NativeMods$Spec;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    const/16 v2, 0x21

    aput-object v1, v0, v2

    new-instance v1, Lcom/trueaxis/modmenu/NativeMods$Spec;

    const/16 v2, 0x1b

    const-string v3, "Requested green bits"

    invoke-direct {v1, v2, v8, v4, v3}, Lcom/trueaxis/modmenu/NativeMods$Spec;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    aput-object v1, v0, v11

    new-instance v1, Lcom/trueaxis/modmenu/NativeMods$Spec;

    const/16 v2, 0x1c

    const-string v3, "Requested blue bits"

    invoke-direct {v1, v2, v8, v4, v3}, Lcom/trueaxis/modmenu/NativeMods$Spec;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    const/16 v2, 0x23

    aput-object v1, v0, v2

    new-instance v1, Lcom/trueaxis/modmenu/NativeMods$Spec;

    const/16 v2, 0x1d

    const-string v3, "Requested alpha bits"

    invoke-direct {v1, v2, v8, v4, v3}, Lcom/trueaxis/modmenu/NativeMods$Spec;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    const/16 v2, 0x24

    aput-object v1, v0, v2

    new-instance v1, Lcom/trueaxis/modmenu/NativeMods$Spec;

    const/16 v2, 0x1e

    const-string v3, "Requested depth bits"

    invoke-direct {v1, v2, v8, v4, v3}, Lcom/trueaxis/modmenu/NativeMods$Spec;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    const/16 v2, 0x25

    aput-object v1, v0, v2

    new-instance v1, Lcom/trueaxis/modmenu/NativeMods$Spec;

    const/16 v2, 0x1f

    const-string v3, "Requested stencil bits"

    invoke-direct {v1, v2, v8, v4, v3}, Lcom/trueaxis/modmenu/NativeMods$Spec;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    const/16 v2, 0x26

    aput-object v1, v0, v2

    new-instance v1, Lcom/trueaxis/modmenu/NativeMods$Spec;

    const-string v3, "30fps timer wait"

    invoke-direct {v1, v2, v10, v4, v3}, Lcom/trueaxis/modmenu/NativeMods$Spec;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    const/16 v2, 0x27

    aput-object v1, v0, v2

    new-instance v1, Lcom/trueaxis/modmenu/NativeMods$Spec;

    const-string v3, "60fps timer wait"

    invoke-direct {v1, v2, v10, v4, v3}, Lcom/trueaxis/modmenu/NativeMods$Spec;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    const/16 v2, 0x28

    aput-object v1, v0, v2

    new-instance v1, Lcom/trueaxis/modmenu/NativeMods$Spec;

    const-string v3, "Near clip plane"

    invoke-direct {v1, v2, v10, v4, v3}, Lcom/trueaxis/modmenu/NativeMods$Spec;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    const/16 v2, 0x29

    aput-object v1, v0, v2

    new-instance v1, Lcom/trueaxis/modmenu/NativeMods$Spec;

    const-string v3, "Far clip plane"

    invoke-direct {v1, v2, v10, v4, v3}, Lcom/trueaxis/modmenu/NativeMods$Spec;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    const/16 v2, 0x2a

    aput-object v1, v0, v2

    new-instance v1, Lcom/trueaxis/modmenu/NativeMods$Spec;

    const-string v11, "Maximum collisions"

    const/4 v12, 0x1

    const/4 v8, 0x0

    const/4 v9, 0x5

    const-string v10, "Physics capacity"

    move-object v7, v1

    invoke-direct/range {v7 .. v12}, Lcom/trueaxis/modmenu/NativeMods$Spec;-><init>(IILjava/lang/String;Ljava/lang/String;Z)V

    const/16 v2, 0x2b

    aput-object v1, v0, v2

    new-instance v1, Lcom/trueaxis/modmenu/NativeMods$Spec;

    const-string v11, "Maximum object pairs"

    const/4 v8, 0x1

    const-string v10, "Physics capacity"

    move-object v7, v1

    invoke-direct/range {v7 .. v12}, Lcom/trueaxis/modmenu/NativeMods$Spec;-><init>(IILjava/lang/String;Ljava/lang/String;Z)V

    const/16 v2, 0x2c

    aput-object v1, v0, v2

    new-instance v1, Lcom/trueaxis/modmenu/NativeMods$Spec;

    const-string v11, "Maximum moving objects"

    const/4 v8, 0x2

    const-string v10, "Physics capacity"

    move-object v7, v1

    invoke-direct/range {v7 .. v12}, Lcom/trueaxis/modmenu/NativeMods$Spec;-><init>(IILjava/lang/String;Ljava/lang/String;Z)V

    const/16 v2, 0x2d

    aput-object v1, v0, v2

    new-instance v1, Lcom/trueaxis/modmenu/NativeMods$Spec;

    const-string v11, "Replay size"

    const/16 v8, 0x17

    const/4 v9, 0x2

    const-string v10, "Replay & ghost"

    move-object v7, v1

    invoke-direct/range {v7 .. v12}, Lcom/trueaxis/modmenu/NativeMods$Spec;-><init>(IILjava/lang/String;Ljava/lang/String;Z)V

    const/16 v2, 0x2e

    aput-object v1, v0, v2

    new-instance v1, Lcom/trueaxis/modmenu/NativeMods$Spec;

    const-string v11, "Ghost size"

    const/16 v8, 0x18

    const-string v10, "Replay & ghost"

    move-object v7, v1

    invoke-direct/range {v7 .. v12}, Lcom/trueaxis/modmenu/NativeMods$Spec;-><init>(IILjava/lang/String;Ljava/lang/String;Z)V

    const/16 v2, 0x2f

    aput-object v1, v0, v2

    new-instance v1, Lcom/trueaxis/modmenu/NativeMods$Spec;

    const-string v11, "Last replay size"

    const/16 v8, 0x19

    const-string v10, "Replay & ghost"

    move-object v7, v1

    invoke-direct/range {v7 .. v12}, Lcom/trueaxis/modmenu/NativeMods$Spec;-><init>(IILjava/lang/String;Ljava/lang/String;Z)V

    const/16 v2, 0x30

    aput-object v1, v0, v2

    new-instance v1, Lcom/trueaxis/modmenu/NativeMods$Spec;

    const-string v2, "Replay & ghost"

    const-string v3, "Keep replay hack"

    const/16 v4, 0xf

    invoke-direct {v1, v4, v6, v2, v3}, Lcom/trueaxis/modmenu/NativeMods$Spec;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    const/16 v2, 0x31

    aput-object v1, v0, v2

    new-instance v1, Lcom/trueaxis/modmenu/NativeMods$Spec;

    const-string v11, "g_bIAPCrack"

    const/16 v8, 0x2f

    const/4 v9, 0x1

    const-string v10, "Anti-piracy - advanced"

    move-object v7, v1

    invoke-direct/range {v7 .. v12}, Lcom/trueaxis/modmenu/NativeMods$Spec;-><init>(IILjava/lang/String;Ljava/lang/String;Z)V

    const/16 v2, 0x32

    aput-object v1, v0, v2

    new-instance v1, Lcom/trueaxis/modmenu/NativeMods$Spec;

    const-string v11, "g_bIAPCrackDisableStore"

    const/16 v8, 0x30

    const-string v10, "Anti-piracy - advanced"

    move-object v7, v1

    invoke-direct/range {v7 .. v12}, Lcom/trueaxis/modmenu/NativeMods$Spec;-><init>(IILjava/lang/String;Ljava/lang/String;Z)V

    const/16 v2, 0x33

    aput-object v1, v0, v2

    sput-object v0, Lcom/trueaxis/modmenu/NativeMods;->SPECS:[Lcom/trueaxis/modmenu/NativeMods$Spec;

    .line 108
    :try_start_2a7
    const-string v0, "jcs2mod"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 109
    sput-boolean v6, Lcom/trueaxis/modmenu/NativeMods;->loaded:Z
    :try_end_2ae
    .catchall {:try_start_2a7 .. :try_end_2ae} :catchall_2af

    .line 112
    goto :goto_2b3

    .line 110
    :catchall_2af
    move-exception v0

    .line 111
    const/4 v1, 0x0

    sput-boolean v1, Lcom/trueaxis/modmenu/NativeMods;->loaded:Z

    .line 113
    :goto_2b3
    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 115
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 116
    return-void
.end method

.method static synthetic access$000()V
    .registers 0

    .line 22
    invoke-static {}, Lcom/trueaxis/modmenu/NativeMods;->resetAll()V

    return-void
.end method

.method static synthetic access$100(Landroid/content/Context;)V
    .registers 1

    .line 22
    invoke-static {p0}, Lcom/trueaxis/modmenu/NativeMods;->clearSaved(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic access$1000(Lcom/trueaxis/modmenu/NativeMods$Spec;)Ljava/lang/String;
    .registers 1

    .line 22
    invoke-static {p0}, Lcom/trueaxis/modmenu/NativeMods;->valueKey(Lcom/trueaxis/modmenu/NativeMods$Spec;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1100(I)Z
    .registers 1

    .line 22
    invoke-static {p0}, Lcom/trueaxis/modmenu/NativeMods;->resetCall(I)Z

    move-result p0

    return p0
.end method

.method static synthetic access$200(Landroid/content/Context;I)I
    .registers 2

    .line 22
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/NativeMods;->dp(Landroid/content/Context;I)I

    move-result p0

    return p0
.end method

.method static synthetic access$300(I)Z
    .registers 1

    .line 22
    invoke-static {p0}, Lcom/trueaxis/modmenu/NativeMods;->reset(I)Z

    move-result p0

    return p0
.end method

.method static synthetic access$400(IZ)Z
    .registers 2

    .line 22
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/NativeMods;->setBool(IZ)Z

    move-result p0

    return p0
.end method

.method static synthetic access$500(Lcom/trueaxis/modmenu/NativeMods$Spec;)Ljava/lang/String;
    .registers 1

    .line 22
    invoke-static {p0}, Lcom/trueaxis/modmenu/NativeMods;->modeKey(Lcom/trueaxis/modmenu/NativeMods$Spec;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$600(Landroid/content/Context;Ljava/lang/String;)V
    .registers 2

    .line 22
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/NativeMods;->toast(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$700(IF)Z
    .registers 2

    .line 22
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/NativeMods;->setFloat(IF)Z

    move-result p0

    return p0
.end method

.method static synthetic access$800(II)Z
    .registers 2

    .line 22
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/NativeMods;->callInt(II)Z

    move-result p0

    return p0
.end method

.method static synthetic access$900(II)Z
    .registers 2

    .line 22
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/NativeMods;->setInt(II)Z

    move-result p0

    return p0
.end method

.method public static applySaved(Landroid/content/Context;)V
    .registers 10

    .line 191
    sget-boolean v0, Lcom/trueaxis/modmenu/NativeMods;->loaded:Z

    if-nez v0, :cond_5

    return-void

    .line 192
    :cond_5
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 193
    sget-object v1, Lcom/trueaxis/modmenu/NativeMods;->SPECS:[Lcom/trueaxis/modmenu/NativeMods$Spec;

    array-length v2, v1

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_e
    const/4 v5, 0x1

    if-ge v4, v2, :cond_72

    aget-object v6, v1, v4

    .line 194
    invoke-static {v6}, Lcom/trueaxis/modmenu/NativeMods;->isAvailable(Lcom/trueaxis/modmenu/NativeMods$Spec;)Z

    move-result v7

    if-nez v7, :cond_1a

    goto :goto_6f

    .line 195
    :cond_1a
    iget v7, v6, Lcom/trueaxis/modmenu/NativeMods$Spec;->type:I

    if-eq v7, v5, :cond_5a

    iget v7, v6, Lcom/trueaxis/modmenu/NativeMods$Spec;->type:I

    const/4 v8, 0x4

    if-ne v7, v8, :cond_24

    goto :goto_5a

    .line 199
    :cond_24
    invoke-static {v6}, Lcom/trueaxis/modmenu/NativeMods;->valueKey(Lcom/trueaxis/modmenu/NativeMods$Spec;)Ljava/lang/String;

    move-result-object v5

    const/4 v7, 0x0

    invoke-interface {v0, v5, v7}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 200
    if-nez v5, :cond_30

    goto :goto_6f

    .line 202
    :cond_30
    :try_start_30
    iget v7, v6, Lcom/trueaxis/modmenu/NativeMods$Spec;->type:I

    const/4 v8, 0x3

    if-ne v7, v8, :cond_3f

    iget v6, v6, Lcom/trueaxis/modmenu/NativeMods$Spec;->id:I

    invoke-static {v5}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v5

    invoke-static {v6, v5}, Lcom/trueaxis/modmenu/NativeMods;->setFloat(IF)Z

    goto :goto_57

    .line 203
    :cond_3f
    iget v7, v6, Lcom/trueaxis/modmenu/NativeMods$Spec;->type:I

    const/4 v8, 0x5

    if-ne v7, v8, :cond_4e

    iget v6, v6, Lcom/trueaxis/modmenu/NativeMods$Spec;->id:I

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    invoke-static {v6, v5}, Lcom/trueaxis/modmenu/NativeMods;->callInt(II)Z

    goto :goto_57

    .line 204
    :cond_4e
    iget v6, v6, Lcom/trueaxis/modmenu/NativeMods$Spec;->id:I

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    invoke-static {v6, v5}, Lcom/trueaxis/modmenu/NativeMods;->setInt(II)Z
    :try_end_57
    .catchall {:try_start_30 .. :try_end_57} :catchall_58

    .line 206
    :goto_57
    goto :goto_6f

    .line 205
    :catchall_58
    move-exception v5

    goto :goto_6f

    .line 196
    :cond_5a
    :goto_5a
    invoke-static {v6}, Lcom/trueaxis/modmenu/NativeMods;->modeKey(Lcom/trueaxis/modmenu/NativeMods$Spec;)Ljava/lang/String;

    move-result-object v7

    const/4 v8, -0x1

    invoke-interface {v0, v7, v8}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v7

    .line 197
    if-ltz v7, :cond_6e

    iget v6, v6, Lcom/trueaxis/modmenu/NativeMods$Spec;->id:I

    if-ne v7, v5, :cond_6a

    goto :goto_6b

    :cond_6a
    const/4 v5, 0x0

    :goto_6b
    invoke-static {v6, v5}, Lcom/trueaxis/modmenu/NativeMods;->setBool(IZ)Z

    .line 198
    :cond_6e
    nop

    .line 193
    :goto_6f
    add-int/lit8 v4, v4, 0x1

    goto :goto_e

    .line 211
    :cond_72
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->unlockAll(Landroid/content/Context;)Z

    move-result p0

    if-eqz p0, :cond_8f

    .line 212
    const/16 p0, 0x2a

    invoke-static {p0, v5}, Lcom/trueaxis/modmenu/NativeMods;->setBool(IZ)Z

    .line 213
    const/16 p0, 0x2b

    invoke-static {p0, v5}, Lcom/trueaxis/modmenu/NativeMods;->setBool(IZ)Z

    .line 214
    const/16 p0, 0x2c

    invoke-static {p0, v5}, Lcom/trueaxis/modmenu/NativeMods;->setBool(IZ)Z

    .line 215
    const/16 p0, 0x2d

    invoke-static {p0, v5}, Lcom/trueaxis/modmenu/NativeMods;->setBool(IZ)Z

    .line 216
    invoke-static {v3, v5}, Lcom/trueaxis/modmenu/NativeMods;->setBool(IZ)Z

    .line 218
    :cond_8f
    return-void
.end method

.method private static native available(I)Z
.end method

.method private static booleanRow(Landroid/app/Activity;Lcom/trueaxis/modmenu/NativeMods$Spec;)Landroid/view/View;
    .registers 11

    .line 299
    invoke-static {p0}, Lcom/trueaxis/modmenu/NativeMods;->row(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v0

    .line 300
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-static {p1}, Lcom/trueaxis/modmenu/NativeMods;->modeKey(Lcom/trueaxis/modmenu/NativeMods$Spec;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, -0x1

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    .line 301
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p1, Lcom/trueaxis/modmenu/NativeMods$Spec;->label:Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {v1}, Lcom/trueaxis/modmenu/NativeMods;->stateSuffix(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 302
    iget-boolean v2, p1, Lcom/trueaxis/modmenu/NativeMods$Spec;->danger:Z

    if-eqz v2, :cond_35

    const/16 v2, 0xa0

    const/16 v4, 0x1e

    invoke-static {v2, v4, v4}, Landroid/graphics/Color;->rgb(III)I

    move-result v2

    goto :goto_38

    :cond_35
    const v2, -0xbbbbbc

    .line 301
    :goto_38
    const/16 v4, 0xb

    invoke-static {p0, v1, v4, v2}, Lcom/trueaxis/modmenu/NativeMods;->text(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v1

    .line 303
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 304
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 305
    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 306
    const-string v5, "OFF"

    invoke-static {p0, v5}, Lcom/trueaxis/modmenu/NativeMods;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v5

    .line 307
    const-string v6, "DEFAULT"

    invoke-static {p0, v6}, Lcom/trueaxis/modmenu/NativeMods;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v6

    .line 308
    const-string v7, "ON"

    invoke-static {p0, v7}, Lcom/trueaxis/modmenu/NativeMods;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v7

    .line 309
    invoke-static {}, Lcom/trueaxis/modmenu/NativeMods;->weighted()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v8

    invoke-virtual {v2, v5, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 310
    invoke-static {}, Lcom/trueaxis/modmenu/NativeMods;->weighted()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v8

    invoke-virtual {v2, v6, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 311
    invoke-static {}, Lcom/trueaxis/modmenu/NativeMods;->weighted()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v8

    invoke-virtual {v2, v7, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 312
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 314
    new-instance v2, Lcom/trueaxis/modmenu/NativeMods$3;

    invoke-direct {v2, p1, p0, v1}, Lcom/trueaxis/modmenu/NativeMods$3;-><init>(Lcom/trueaxis/modmenu/NativeMods$Spec;Landroid/app/Activity;Landroid/widget/TextView;)V

    .line 331
    invoke-virtual {v5, v4}, Landroid/widget/Button;->setId(I)V

    .line 332
    invoke-virtual {v6, v3}, Landroid/widget/Button;->setId(I)V

    .line 333
    const/4 p0, 0x1

    invoke-virtual {v7, p0}, Landroid/widget/Button;->setId(I)V

    .line 334
    invoke-virtual {v5, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 335
    invoke-virtual {v6, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 336
    invoke-virtual {v7, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 337
    return-object v0
.end method

.method private static button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;
    .registers 3

    .line 412
    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 413
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 414
    const/high16 p0, 0x41100000    # 9.0f

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setTextSize(F)V

    .line 415
    const/16 p0, 0x11

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setGravity(I)V

    .line 416
    const/4 p0, 0x0

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setMinHeight(I)V

    .line 417
    invoke-virtual {v0, p0}, Landroid/widget/Button;->setMinimumHeight(I)V

    .line 418
    const/4 p0, 0x4

    const/4 p1, 0x2

    invoke-virtual {v0, p0, p1, p0, p1}, Landroid/widget/Button;->setPadding(IIII)V

    .line 419
    return-object v0
.end method

.method private static native callInt(II)Z
.end method

.method private static clearSaved(Landroid/content/Context;)V
    .registers 5

    .line 427
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 428
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 429
    invoke-interface {p0}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_14
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_38

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 430
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const-string v3, "native_"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_37

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 431
    :cond_37
    goto :goto_14

    .line 432
    :cond_38
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 433
    return-void
.end method

.method private static dp(Landroid/content/Context;I)I
    .registers 2

    .line 128
    int-to-float p1, p1

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    mul-float p1, p1, p0

    const/high16 p0, 0x3f000000    # 0.5f

    add-float/2addr p1, p0

    float-to-int p0, p1

    return p0
.end method

.method private static isAvailable(Lcom/trueaxis/modmenu/NativeMods$Spec;)Z
    .registers 3

    .line 187
    sget-boolean v0, Lcom/trueaxis/modmenu/NativeMods;->loaded:Z

    if-eqz v0, :cond_13

    iget v0, p0, Lcom/trueaxis/modmenu/NativeMods$Spec;->type:I

    const/4 v1, 0x5

    if-eq v0, v1, :cond_11

    iget p0, p0, Lcom/trueaxis/modmenu/NativeMods$Spec;->id:I

    invoke-static {p0}, Lcom/trueaxis/modmenu/NativeMods;->available(I)Z

    move-result p0

    if-eqz p0, :cond_13

    :cond_11
    const/4 p0, 0x1

    goto :goto_14

    :cond_13
    const/4 p0, 0x0

    :goto_14
    return p0
.end method

.method public static isQuickBoolOn(Landroid/content/Context;II)Z
    .registers 3

    .line 153
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-static {p1, p2}, Lcom/trueaxis/modmenu/NativeMods;->modeKey(II)Ljava/lang/String;

    move-result-object p1

    const/4 p2, -0x1

    invoke-interface {p0, p1, p2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    const/4 p1, 0x1

    if-ne p0, p1, :cond_11

    goto :goto_12

    :cond_11
    const/4 p1, 0x0

    :goto_12
    return p1
.end method

.method public static isQuickNumberOn(Landroid/content/Context;IILjava/lang/String;)Z
    .registers 4

    .line 157
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-static {p1, p2}, Lcom/trueaxis/modmenu/NativeMods;->valueKey(II)Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x0

    invoke-interface {p0, p1, p2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p3, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method private static modeKey(II)Ljava/lang/String;
    .registers 4

    .line 140
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "native_mode_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, "_"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static modeKey(Lcom/trueaxis/modmenu/NativeMods$Spec;)Ljava/lang/String;
    .registers 2

    .line 132
    iget v0, p0, Lcom/trueaxis/modmenu/NativeMods$Spec;->type:I

    iget p0, p0, Lcom/trueaxis/modmenu/NativeMods$Spec;->id:I

    invoke-static {v0, p0}, Lcom/trueaxis/modmenu/NativeMods;->modeKey(II)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static numberRow(Landroid/app/Activity;Lcom/trueaxis/modmenu/NativeMods$Spec;)Landroid/view/View;
    .registers 9

    .line 341
    invoke-static {p0}, Lcom/trueaxis/modmenu/NativeMods;->row(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v0

    .line 342
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p1, Lcom/trueaxis/modmenu/NativeMods$Spec;->label:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p1, Lcom/trueaxis/modmenu/NativeMods$Spec;->danger:Z

    const-string v3, ""

    if-eqz v2, :cond_18

    const-string v2, "  (advanced)"

    goto :goto_19

    :cond_18
    move-object v2, v3

    :goto_19
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 343
    iget-boolean v2, p1, Lcom/trueaxis/modmenu/NativeMods$Spec;->danger:Z

    if-eqz v2, :cond_2e

    const/16 v2, 0xa0

    const/16 v4, 0x1e

    invoke-static {v2, v4, v4}, Landroid/graphics/Color;->rgb(III)I

    move-result v2

    goto :goto_31

    :cond_2e
    const v2, -0xbbbbbc

    .line 342
    :goto_31
    const/16 v4, 0xb

    invoke-static {p0, v1, v4, v2}, Lcom/trueaxis/modmenu/NativeMods;->text(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v1

    .line 344
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 345
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 346
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 347
    new-instance v4, Landroid/widget/EditText;

    invoke-direct {v4, p0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 348
    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Landroid/widget/EditText;->setSingleLine(Z)V

    .line 349
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v5

    invoke-static {p1}, Lcom/trueaxis/modmenu/NativeMods;->valueKey(Lcom/trueaxis/modmenu/NativeMods$Spec;)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 350
    iget v3, p1, Lcom/trueaxis/modmenu/NativeMods$Spec;->type:I

    const/4 v5, 0x3

    if-ne v3, v5, :cond_63

    const-string v3, "decimal value"

    goto :goto_65

    :cond_63
    const-string v3, "integer value"

    :goto_65
    invoke-virtual {v4, v3}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 351
    const/high16 v3, 0x41300000    # 11.0f

    invoke-virtual {v4, v3}, Landroid/widget/EditText;->setTextSize(F)V

    .line 352
    nop

    .line 354
    iget v3, p1, Lcom/trueaxis/modmenu/NativeMods$Spec;->type:I

    if-ne v3, v5, :cond_75

    const/16 v3, 0x2000

    goto :goto_76

    :cond_75
    const/4 v3, 0x0

    :goto_76
    or-int/lit16 v3, v3, 0x1002

    .line 352
    invoke-virtual {v4, v3}, Landroid/widget/EditText;->setInputType(I)V

    .line 355
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v5, 0x2a

    invoke-static {p0, v5}, Lcom/trueaxis/modmenu/NativeMods;->dp(Landroid/content/Context;I)I

    move-result v5

    const v6, 0x3fd9999a

    invoke-direct {v3, v2, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v4, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 356
    const-string v2, "APPLY"

    invoke-static {p0, v2}, Lcom/trueaxis/modmenu/NativeMods;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v2

    .line 357
    const-string v3, "DEFAULT"

    invoke-static {p0, v3}, Lcom/trueaxis/modmenu/NativeMods;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v3

    .line 358
    invoke-static {}, Lcom/trueaxis/modmenu/NativeMods;->weighted()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v5

    invoke-virtual {v1, v2, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 359
    invoke-static {}, Lcom/trueaxis/modmenu/NativeMods;->weighted()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v5

    invoke-virtual {v1, v3, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 360
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 361
    new-instance v1, Lcom/trueaxis/modmenu/NativeMods$4;

    invoke-direct {v1, v4, p1, p0}, Lcom/trueaxis/modmenu/NativeMods$4;-><init>(Landroid/widget/EditText;Lcom/trueaxis/modmenu/NativeMods$Spec;Landroid/app/Activity;)V

    invoke-virtual {v2, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 377
    new-instance v1, Lcom/trueaxis/modmenu/NativeMods$5;

    invoke-direct {v1, p1, v4, p0}, Lcom/trueaxis/modmenu/NativeMods$5;-><init>(Lcom/trueaxis/modmenu/NativeMods$Spec;Landroid/widget/EditText;Landroid/app/Activity;)V

    invoke-virtual {v3, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 389
    return-object v0
.end method

.method public static quickBool(Landroid/content/Context;IIZ)V
    .registers 4

    .line 161
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 162
    if-eqz p3, :cond_13

    invoke-static {p1, p2}, Lcom/trueaxis/modmenu/NativeMods;->modeKey(II)Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x1

    invoke-interface {p0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    goto :goto_1a

    .line 163
    :cond_13
    invoke-static {p1, p2}, Lcom/trueaxis/modmenu/NativeMods;->modeKey(II)Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, p1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 164
    :goto_1a
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 165
    return-void
.end method

.method public static quickNumber(Landroid/content/Context;IILjava/lang/String;Z)V
    .registers 5

    .line 168
    invoke-static {p0}, Lcom/trueaxis/modmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 169
    if-eqz p4, :cond_12

    invoke-static {p1, p2}, Lcom/trueaxis/modmenu/NativeMods;->valueKey(II)Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, p1, p3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    goto :goto_19

    .line 170
    :cond_12
    invoke-static {p1, p2}, Lcom/trueaxis/modmenu/NativeMods;->valueKey(II)Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, p1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 171
    :goto_19
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 172
    return-void
.end method

.method private static native reset(I)Z
.end method

.method private static native resetAll()V
.end method

.method private static native resetCall(I)Z
.end method

.method private static row(Landroid/content/Context;)Landroid/widget/LinearLayout;
    .registers 4

    .line 393
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 394
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 395
    const/4 v1, 0x3

    invoke-static {p0, v1}, Lcom/trueaxis/modmenu/NativeMods;->dp(Landroid/content/Context;I)I

    move-result v2

    invoke-static {p0, v1}, Lcom/trueaxis/modmenu/NativeMods;->dp(Landroid/content/Context;I)I

    move-result p0

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v2, v1, p0}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 396
    return-object v0
.end method

.method private static native setBool(IZ)Z
.end method

.method private static native setFloat(IF)Z
.end method

.method private static native setInt(II)Z
.end method

.method public static setNativeUnlock(Landroid/content/Context;Z)V
    .registers 4

    .line 179
    const/16 v0, 0x2a

    const/4 v1, 0x4

    invoke-static {p0, v1, v0, p1}, Lcom/trueaxis/modmenu/NativeMods;->quickBool(Landroid/content/Context;IIZ)V

    .line 180
    const/16 v0, 0x2b

    invoke-static {p0, v1, v0, p1}, Lcom/trueaxis/modmenu/NativeMods;->quickBool(Landroid/content/Context;IIZ)V

    .line 181
    const/16 v0, 0x2c

    invoke-static {p0, v1, v0, p1}, Lcom/trueaxis/modmenu/NativeMods;->quickBool(Landroid/content/Context;IIZ)V

    .line 182
    const/16 v0, 0x2d

    invoke-static {p0, v1, v0, p1}, Lcom/trueaxis/modmenu/NativeMods;->quickBool(Landroid/content/Context;IIZ)V

    .line 183
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-static {p0, v0, v1, p1}, Lcom/trueaxis/modmenu/NativeMods;->quickBool(Landroid/content/Context;IIZ)V

    .line 184
    return-void
.end method

.method public static show(Landroid/app/Activity;)V
    .registers 16

    .line 221
    sget-boolean v0, Lcom/trueaxis/modmenu/NativeMods;->loaded:Z

    const/4 v1, 0x1

    if-nez v0, :cond_f

    .line 222
    const-string v0, "Native mod bridge did not load."

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 223
    return-void

    .line 225
    :cond_f
    new-instance v0, Landroid/widget/ScrollView;

    invoke-direct {v0, p0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    .line 226
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 227
    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 228
    const/16 v3, 0xc

    invoke-static {p0, v3}, Lcom/trueaxis/modmenu/NativeMods;->dp(Landroid/content/Context;I)I

    move-result v4

    const/4 v5, 0x4

    invoke-static {p0, v5}, Lcom/trueaxis/modmenu/NativeMods;->dp(Landroid/content/Context;I)I

    move-result v6

    invoke-static {p0, v3}, Lcom/trueaxis/modmenu/NativeMods;->dp(Landroid/content/Context;I)I

    move-result v7

    invoke-static {p0, v3}, Lcom/trueaxis/modmenu/NativeMods;->dp(Landroid/content/Context;I)I

    move-result v3

    invoke-virtual {v2, v4, v6, v7, v3}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 229
    invoke-virtual {v0, v2}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    .line 231
    const/16 v3, 0xb

    const v4, -0xbbbbbc

    const-string v6, "Changes apply immediately where the engine supports it and persist across launches. Use DEFAULT to restore the captured original value. Restart after changing startup/render settings."

    invoke-static {p0, v6, v3, v4}, Lcom/trueaxis/modmenu/NativeMods;->text(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v3

    .line 235
    const/16 v4, 0x8

    invoke-static {p0, v4}, Lcom/trueaxis/modmenu/NativeMods;->dp(Landroid/content/Context;I)I

    move-result v4

    const/4 v6, 0x0

    invoke-virtual {v3, v6, v6, v6, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 236
    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 238
    nop

    .line 239
    sget-object v3, Lcom/trueaxis/modmenu/NativeMods;->SPECS:[Lcom/trueaxis/modmenu/NativeMods$Spec;

    array-length v4, v3

    const-string v7, ""

    const/4 v8, 0x0

    :goto_54
    const/16 v9, 0xb4

    if-ge v8, v4, :cond_b3

    aget-object v10, v3, v8

    .line 240
    iget-object v11, v10, Lcom/trueaxis/modmenu/NativeMods$Spec;->category:Ljava/lang/String;

    invoke-virtual {v7, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_9b

    .line 241
    iget-object v7, v10, Lcom/trueaxis/modmenu/NativeMods$Spec;->category:Ljava/lang/String;

    .line 242
    const/16 v11, 0xff

    const/16 v12, 0x69

    invoke-static {v11, v12, v6}, Landroid/graphics/Color;->rgb(III)I

    move-result v11

    const/16 v12, 0xe

    invoke-static {p0, v7, v12, v11}, Lcom/trueaxis/modmenu/NativeMods;->text(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v11

    .line 243
    const/16 v12, 0xa

    invoke-static {p0, v12}, Lcom/trueaxis/modmenu/NativeMods;->dp(Landroid/content/Context;I)I

    move-result v13

    const/4 v14, 0x3

    invoke-static {p0, v14}, Lcom/trueaxis/modmenu/NativeMods;->dp(Landroid/content/Context;I)I

    move-result v14

    invoke-virtual {v11, v6, v13, v6, v14}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 244
    invoke-virtual {v2, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 245
    const-string v11, "Anti-piracy"

    invoke-virtual {v7, v11}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_9b

    .line 246
    nop

    .line 248
    const/16 v11, 0x1e

    invoke-static {v9, v11, v11}, Landroid/graphics/Color;->rgb(III)I

    move-result v9

    .line 246
    const-string v11, "Danger: these flags may disable the store or trigger crack handling. DEFAULT is safest."

    invoke-static {p0, v11, v12, v9}, Lcom/trueaxis/modmenu/NativeMods;->text(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v9

    invoke-virtual {v2, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 251
    :cond_9b
    iget v9, v10, Lcom/trueaxis/modmenu/NativeMods$Spec;->type:I

    if-eq v9, v1, :cond_a9

    iget v9, v10, Lcom/trueaxis/modmenu/NativeMods$Spec;->type:I

    if-ne v9, v5, :cond_a4

    goto :goto_a9

    .line 252
    :cond_a4
    invoke-static {p0, v10}, Lcom/trueaxis/modmenu/NativeMods;->numberRow(Landroid/app/Activity;Lcom/trueaxis/modmenu/NativeMods$Spec;)Landroid/view/View;

    move-result-object v9

    goto :goto_ad

    :cond_a9
    :goto_a9
    invoke-static {p0, v10}, Lcom/trueaxis/modmenu/NativeMods;->booleanRow(Landroid/app/Activity;Lcom/trueaxis/modmenu/NativeMods$Spec;)Landroid/view/View;

    move-result-object v9

    .line 251
    :goto_ad
    invoke-virtual {v2, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 239
    add-int/lit8 v8, v8, 0x1

    goto :goto_54

    .line 255
    :cond_b3
    const-string v1, "RESET ALL MODS AND LIVERIES TO DEFAULT"

    invoke-static {p0, v1}, Lcom/trueaxis/modmenu/NativeMods;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v1

    .line 256
    const/16 v3, 0x14

    invoke-static {v9, v3, v3}, Landroid/graphics/Color;->rgb(III)I

    move-result v3

    invoke-virtual {v1, v3}, Landroid/widget/Button;->setTextColor(I)V

    .line 257
    new-instance v3, Lcom/trueaxis/modmenu/NativeMods$1;

    invoke-direct {v3, p0}, Lcom/trueaxis/modmenu/NativeMods$1;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v1, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 275
    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 277
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 278
    const-string v2, "Interactive native mods"

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 279
    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 280
    const-string v1, "Close"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 281
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 282
    new-instance v1, Lcom/trueaxis/modmenu/NativeMods$2;

    invoke-direct {v1, v0, p0}, Lcom/trueaxis/modmenu/NativeMods$2;-><init>(Landroid/app/AlertDialog;Landroid/app/Activity;)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 291
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 292
    return-void
.end method

.method private static stateSuffix(I)Ljava/lang/String;
    .registers 2

    .line 295
    const/4 v0, 0x1

    if-ne p0, v0, :cond_6

    const-string p0, "  [ON]"

    goto :goto_d

    :cond_6
    if-nez p0, :cond_b

    const-string p0, "  [OFF]"

    goto :goto_d

    :cond_b
    const-string p0, ""

    :goto_d
    return-object p0
.end method

.method private static text(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/TextView;
    .registers 5

    .line 404
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 405
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 406
    int-to-float p0, p2

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 407
    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 408
    return-object v0
.end method

.method private static toast(Landroid/content/Context;Ljava/lang/String;)V
    .registers 3

    .line 423
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 424
    return-void
.end method

.method private static valueKey(II)Ljava/lang/String;
    .registers 4

    .line 144
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "native_value_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, "_"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static valueKey(Lcom/trueaxis/modmenu/NativeMods$Spec;)Ljava/lang/String;
    .registers 2

    .line 136
    iget v0, p0, Lcom/trueaxis/modmenu/NativeMods$Spec;->type:I

    iget p0, p0, Lcom/trueaxis/modmenu/NativeMods$Spec;->id:I

    invoke-static {v0, p0}, Lcom/trueaxis/modmenu/NativeMods;->valueKey(II)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static weighted()Landroid/widget/LinearLayout$LayoutParams;
    .registers 4

    .line 400
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x2

    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v3, 0x0

    invoke-direct {v0, v3, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    return-object v0
.end method
