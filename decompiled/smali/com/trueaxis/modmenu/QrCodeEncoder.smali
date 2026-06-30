.class public final Lcom/trueaxis/modmenu/QrCodeEncoder;
.super Ljava/lang/Object;
.source "QrCodeEncoder.java"


# static fields
.field private static final DATA_CODEWORDS:[I

.field private static final ECC_CODEWORDS:[I

.field private static final NUM_BLOCKS:[I

.field private static final REMAINDER_BITS:[I


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 10
    const/16 v0, 0xa

    new-array v1, v0, [I

    fill-array-data v1, :array_20

    sput-object v1, Lcom/trueaxis/modmenu/QrCodeEncoder;->DATA_CODEWORDS:[I

    .line 13
    new-array v1, v0, [I

    fill-array-data v1, :array_38

    sput-object v1, Lcom/trueaxis/modmenu/QrCodeEncoder;->ECC_CODEWORDS:[I

    .line 16
    new-array v1, v0, [I

    fill-array-data v1, :array_50

    sput-object v1, Lcom/trueaxis/modmenu/QrCodeEncoder;->NUM_BLOCKS:[I

    .line 19
    new-array v0, v0, [I

    fill-array-data v0, :array_68

    sput-object v0, Lcom/trueaxis/modmenu/QrCodeEncoder;->REMAINDER_BITS:[I

    return-void

    nop

    :array_20
    .array-data 4
        0x10
        0x1c
        0x2c
        0x3e
        0x54
        0x6a
        0x7a
        0x98
        0xb4
        0xd5
    .end array-data

    :array_38
    .array-data 4
        0xa
        0x10
        0x1a
        0x12
        0x18
        0x1c
        0x14
        0x18
        0x1c
        0x1a
    .end array-data

    :array_50
    .array-data 4
        0x1
        0x1
        0x1
        0x2
        0x2
        0x4
        0x4
        0x4
        0x4
        0x6
    .end array-data

    :array_68
    .array-data 4
        0x0
        0x7
        0x7
        0x7
        0x7
        0x7
        0x0
        0x0
        0x0
        0x0
    .end array-data
.end method

.method private constructor <init>()V
    .registers 1

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    return-void
.end method

.method private static appendBits([IIII)I
    .registers 6

    .line 148
    add-int/lit8 p3, p3, -0x1

    :goto_2
    if-ltz p3, :cond_10

    .line 149
    add-int/lit8 v0, p1, 0x1

    ushr-int v1, p2, p3

    and-int/lit8 v1, v1, 0x1

    aput v1, p0, p1

    .line 148
    add-int/lit8 p3, p3, -0x1

    move p1, v0

    goto :goto_2

    .line 151
    :cond_10
    return p1
.end method

.method private static applyMask([[Z[[ZI)V
    .registers 10

    .line 300
    array-length v0, p0

    .line 301
    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_3
    if-ge v2, v0, :cond_82

    .line 302
    const/4 v3, 0x0

    :goto_6
    if-ge v3, v0, :cond_7f

    .line 303
    aget-object v4, p1, v2

    aget-boolean v4, v4, v3

    if-eqz v4, :cond_10

    .line 304
    goto/16 :goto_7c

    .line 307
    :cond_10
    const/4 v4, 0x1

    packed-switch p2, :pswitch_data_84

    .line 315
    add-int v5, v3, v2

    rem-int/lit8 v5, v5, 0x2

    mul-int v6, v3, v2

    rem-int/lit8 v6, v6, 0x3

    add-int/2addr v5, v6

    rem-int/lit8 v5, v5, 0x2

    if-nez v5, :cond_70

    const/4 v5, 0x1

    goto :goto_71

    .line 314
    :pswitch_23
    mul-int v5, v3, v2

    rem-int/lit8 v6, v5, 0x2

    rem-int/lit8 v5, v5, 0x3

    add-int/2addr v6, v5

    rem-int/lit8 v6, v6, 0x2

    if-nez v6, :cond_30

    const/4 v5, 0x1

    goto :goto_71

    :cond_30
    const/4 v5, 0x0

    goto :goto_71

    .line 313
    :pswitch_32
    mul-int v5, v3, v2

    rem-int/lit8 v6, v5, 0x2

    rem-int/lit8 v5, v5, 0x3

    add-int/2addr v6, v5

    if-nez v6, :cond_3d

    const/4 v5, 0x1

    goto :goto_71

    :cond_3d
    const/4 v5, 0x0

    goto :goto_71

    .line 312
    :pswitch_3f
    div-int/lit8 v5, v3, 0x3

    div-int/lit8 v6, v2, 0x2

    add-int/2addr v5, v6

    rem-int/lit8 v5, v5, 0x2

    if-nez v5, :cond_4a

    const/4 v5, 0x1

    goto :goto_71

    :cond_4a
    const/4 v5, 0x0

    goto :goto_71

    .line 311
    :pswitch_4c
    add-int v5, v3, v2

    rem-int/lit8 v5, v5, 0x3

    if-nez v5, :cond_54

    const/4 v5, 0x1

    goto :goto_71

    :cond_54
    const/4 v5, 0x0

    goto :goto_71

    .line 310
    :pswitch_56
    rem-int/lit8 v5, v3, 0x3

    if-nez v5, :cond_5c

    const/4 v5, 0x1

    goto :goto_71

    :cond_5c
    const/4 v5, 0x0

    goto :goto_71

    .line 309
    :pswitch_5e
    rem-int/lit8 v5, v2, 0x2

    if-nez v5, :cond_64

    const/4 v5, 0x1

    goto :goto_71

    :cond_64
    const/4 v5, 0x0

    goto :goto_71

    .line 308
    :pswitch_66
    add-int v5, v3, v2

    rem-int/lit8 v5, v5, 0x2

    if-nez v5, :cond_6e

    const/4 v5, 0x1

    goto :goto_71

    :cond_6e
    const/4 v5, 0x0

    goto :goto_71

    .line 315
    :cond_70
    const/4 v5, 0x0

    .line 317
    :goto_71
    if-eqz v5, :cond_7c

    .line 318
    aget-object v5, p0, v2

    aget-object v6, p0, v2

    aget-boolean v6, v6, v3

    xor-int/2addr v4, v6

    aput-boolean v4, v5, v3

    .line 302
    :cond_7c
    :goto_7c
    add-int/lit8 v3, v3, 0x1

    goto :goto_6

    .line 301
    :cond_7f
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 322
    :cond_82
    return-void

    nop

    :pswitch_data_84
    .packed-switch 0x0
        :pswitch_66
        :pswitch_5e
        :pswitch_56
        :pswitch_4c
        :pswitch_3f
        :pswitch_32
        :pswitch_23
    .end packed-switch
.end method

.method private static chooseMask(I[[Z[[Z)I
    .registers 11

    .line 281
    nop

    .line 282
    nop

    .line 283
    array-length p0, p1

    array-length v0, p1

    const/4 v1, 0x2

    new-array v1, v1, [I

    const/4 v2, 0x1

    aput v0, v1, v2

    const/4 v0, 0x0

    aput p0, v1, v0

    sget-object p0, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    invoke-static {p0, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [[Z

    .line 284
    const v1, 0x7fffffff

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_1a
    const/16 v4, 0x8

    if-ge v2, v4, :cond_3f

    .line 285
    const/4 v4, 0x0

    :goto_1f
    array-length v5, p1

    if-ge v4, v5, :cond_2d

    .line 286
    aget-object v5, p1, v4

    aget-object v6, p0, v4

    array-length v7, p1

    invoke-static {v5, v0, v6, v0, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 285
    add-int/lit8 v4, v4, 0x1

    goto :goto_1f

    .line 288
    :cond_2d
    invoke-static {p0, p2, v2}, Lcom/trueaxis/modmenu/QrCodeEncoder;->applyMask([[Z[[ZI)V

    .line 289
    invoke-static {p0, p2, v2}, Lcom/trueaxis/modmenu/QrCodeEncoder;->drawFormatBits([[Z[[ZI)V

    .line 290
    invoke-static {p0}, Lcom/trueaxis/modmenu/QrCodeEncoder;->maskPenalty([[Z)I

    move-result v4

    .line 291
    if-ge v4, v1, :cond_3c

    .line 292
    nop

    .line 293
    move v3, v2

    move v1, v4

    .line 284
    :cond_3c
    add-int/lit8 v2, v2, 0x1

    goto :goto_1a

    .line 296
    :cond_3f
    return v3
.end method

.method private static chooseVersion(I)I
    .registers 6

    .line 34
    const/4 v0, 0x1

    :goto_1
    const/16 v1, 0xa

    if-gt v0, v1, :cond_26

    .line 35
    sget-object v1, Lcom/trueaxis/modmenu/QrCodeEncoder;->DATA_CODEWORDS:[I

    add-int/lit8 v2, v0, -0x1

    aget v1, v1, v2

    .line 36
    const/16 v2, 0x9

    const/16 v3, 0x8

    if-gt v0, v2, :cond_14

    const/16 v2, 0x8

    goto :goto_16

    :cond_14
    const/16 v2, 0x10

    .line 37
    :goto_16
    add-int/lit8 v2, v2, 0x4

    mul-int/lit8 v4, p0, 0x8

    add-int/2addr v2, v4

    add-int/lit8 v2, v2, 0x4

    .line 38
    add-int/lit8 v2, v2, 0x7

    div-int/2addr v2, v3

    .line 39
    if-gt v2, v1, :cond_23

    .line 40
    return v0

    .line 34
    :cond_23
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 43
    :cond_26
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "QR payload too large for version 10 ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v1, " bytes)"

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    goto :goto_46

    :goto_45
    throw v0

    :goto_46
    goto :goto_45
.end method

.method private static drawAlignment([[Z[[ZII)V
    .registers 11

    .line 244
    const/4 v0, -0x2

    const/4 v1, -0x2

    :goto_2
    const/4 v2, 0x2

    if-gt v1, v2, :cond_26

    .line 245
    const/4 v3, -0x2

    :goto_6
    if-gt v3, v2, :cond_23

    .line 246
    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    move-result v4

    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v5

    invoke-static {v4, v5}, Ljava/lang/Math;->max(II)I

    move-result v4

    const/4 v5, 0x1

    if-eq v4, v5, :cond_18

    goto :goto_19

    :cond_18
    const/4 v5, 0x0

    .line 247
    :goto_19
    add-int v4, p2, v3

    add-int v6, p3, v1

    invoke-static {p0, p1, v4, v6, v5}, Lcom/trueaxis/modmenu/QrCodeEncoder;->setModule([[Z[[ZIIZ)V

    .line 245
    add-int/lit8 v3, v3, 0x1

    goto :goto_6

    .line 244
    :cond_23
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 250
    :cond_26
    return-void
.end method

.method private static drawFinder([[Z[[ZII)V
    .registers 12

    .line 228
    const/4 v0, -0x1

    const/4 v1, -0x1

    :goto_2
    const/4 v2, 0x7

    if-gt v1, v2, :cond_3e

    .line 229
    const/4 v3, -0x1

    :goto_6
    if-gt v3, v2, :cond_3b

    .line 230
    add-int v4, p2, v3

    .line 231
    add-int v5, p3, v1

    .line 232
    if-ltz v4, :cond_38

    if-ltz v5, :cond_38

    array-length v6, p0

    if-ge v4, v6, :cond_38

    array-length v6, p0

    if-lt v5, v6, :cond_17

    .line 233
    goto :goto_38

    .line 235
    :cond_17
    if-ltz v3, :cond_34

    const/4 v6, 0x6

    if-gt v3, v6, :cond_34

    if-ltz v1, :cond_34

    if-gt v1, v6, :cond_34

    if-eqz v3, :cond_32

    if-eq v3, v6, :cond_32

    if-eqz v1, :cond_32

    if-eq v1, v6, :cond_32

    const/4 v6, 0x2

    if-lt v3, v6, :cond_34

    const/4 v7, 0x4

    if-gt v3, v7, :cond_34

    if-lt v1, v6, :cond_34

    if-gt v1, v7, :cond_34

    :cond_32
    const/4 v6, 0x1

    goto :goto_35

    :cond_34
    const/4 v6, 0x0

    .line 238
    :goto_35
    invoke-static {p0, p1, v4, v5, v6}, Lcom/trueaxis/modmenu/QrCodeEncoder;->setModule([[Z[[ZIIZ)V

    .line 229
    :cond_38
    :goto_38
    add-int/lit8 v3, v3, 0x1

    goto :goto_6

    .line 228
    :cond_3b
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 241
    :cond_3e
    return-void
.end method

.method private static drawFormatBits([[Z[[ZI)V
    .registers 11

    .line 325
    array-length v0, p0

    .line 326
    const/16 v1, 0x8

    or-int/2addr p2, v1

    .line 327
    shl-int/lit8 p2, p2, 0xa

    .line 328
    const/4 v2, 0x5

    move v4, p2

    const/4 v3, 0x5

    :goto_9
    const/4 v5, 0x0

    const/4 v6, 0x1

    if-ltz v3, :cond_1b

    .line 329
    shl-int/lit8 v7, v4, 0x1

    ushr-int/lit8 v4, v4, 0xa

    and-int/2addr v4, v6

    if-eqz v4, :cond_16

    const/16 v5, 0x537

    :cond_16
    xor-int v4, v7, v5

    .line 328
    add-int/lit8 v3, v3, -0x1

    goto :goto_9

    .line 331
    :cond_1b
    and-int/lit16 v3, v4, 0x3ff

    or-int/2addr p2, v3

    .line 332
    const/4 v3, 0x0

    :goto_1f
    if-gt v3, v2, :cond_2f

    .line 333
    ushr-int v4, p2, v3

    and-int/2addr v4, v6

    if-eqz v4, :cond_28

    const/4 v4, 0x1

    goto :goto_29

    :cond_28
    const/4 v4, 0x0

    :goto_29
    invoke-static {p0, p1, v1, v3, v4}, Lcom/trueaxis/modmenu/QrCodeEncoder;->setModule([[Z[[ZIIZ)V

    .line 332
    add-int/lit8 v3, v3, 0x1

    goto :goto_1f

    .line 335
    :cond_2f
    ushr-int/lit8 v2, p2, 0x6

    and-int/2addr v2, v6

    if-eqz v2, :cond_36

    const/4 v2, 0x1

    goto :goto_37

    :cond_36
    const/4 v2, 0x0

    :goto_37
    const/4 v3, 0x7

    invoke-static {p0, p1, v1, v3, v2}, Lcom/trueaxis/modmenu/QrCodeEncoder;->setModule([[Z[[ZIIZ)V

    .line 336
    ushr-int/lit8 v2, p2, 0x7

    and-int/2addr v2, v6

    if-eqz v2, :cond_42

    const/4 v2, 0x1

    goto :goto_43

    :cond_42
    const/4 v2, 0x0

    :goto_43
    invoke-static {p0, p1, v1, v1, v2}, Lcom/trueaxis/modmenu/QrCodeEncoder;->setModule([[Z[[ZIIZ)V

    .line 337
    ushr-int/lit8 v2, p2, 0x8

    and-int/2addr v2, v6

    if-eqz v2, :cond_4d

    const/4 v2, 0x1

    goto :goto_4e

    :cond_4d
    const/4 v2, 0x0

    :goto_4e
    invoke-static {p0, p1, v3, v1, v2}, Lcom/trueaxis/modmenu/QrCodeEncoder;->setModule([[Z[[ZIIZ)V

    .line 338
    const/16 v2, 0x9

    :goto_53
    const/16 v3, 0xf

    if-ge v2, v3, :cond_67

    .line 339
    rsub-int/lit8 v3, v2, 0xe

    ushr-int v4, p2, v2

    and-int/2addr v4, v6

    if-eqz v4, :cond_60

    const/4 v4, 0x1

    goto :goto_61

    :cond_60
    const/4 v4, 0x0

    :goto_61
    invoke-static {p0, p1, v3, v1, v4}, Lcom/trueaxis/modmenu/QrCodeEncoder;->setModule([[Z[[ZIIZ)V

    .line 338
    add-int/lit8 v2, v2, 0x1

    goto :goto_53

    .line 341
    :cond_67
    const/4 v2, 0x0

    :goto_68
    if-ge v2, v1, :cond_7b

    .line 342
    add-int/lit8 v4, v0, -0x1

    sub-int/2addr v4, v2

    ushr-int v7, p2, v2

    and-int/2addr v7, v6

    if-eqz v7, :cond_74

    const/4 v7, 0x1

    goto :goto_75

    :cond_74
    const/4 v7, 0x0

    :goto_75
    invoke-static {p0, p1, v4, v1, v7}, Lcom/trueaxis/modmenu/QrCodeEncoder;->setModule([[Z[[ZIIZ)V

    .line 341
    add-int/lit8 v2, v2, 0x1

    goto :goto_68

    .line 344
    :cond_7b
    const/16 v2, 0x8

    :goto_7d
    if-ge v2, v3, :cond_90

    .line 345
    add-int/lit8 v4, v0, -0xf

    add-int/2addr v4, v2

    ushr-int v7, p2, v2

    and-int/2addr v7, v6

    if-eqz v7, :cond_89

    const/4 v7, 0x1

    goto :goto_8a

    :cond_89
    const/4 v7, 0x0

    :goto_8a
    invoke-static {p0, p1, v1, v4, v7}, Lcom/trueaxis/modmenu/QrCodeEncoder;->setModule([[Z[[ZIIZ)V

    .line 344
    add-int/lit8 v2, v2, 0x1

    goto :goto_7d

    .line 347
    :cond_90
    sub-int/2addr v0, v1

    invoke-static {p0, p1, v1, v0, v6}, Lcom/trueaxis/modmenu/QrCodeEncoder;->setModule([[Z[[ZIIZ)V

    .line 348
    return-void
.end method

.method private static drawFunctionPatterns(I[[Z[[Z)V
    .registers 13

    .line 194
    array-length v0, p1

    .line 195
    const/4 v1, 0x0

    invoke-static {p1, p2, v1, v1}, Lcom/trueaxis/modmenu/QrCodeEncoder;->drawFinder([[Z[[ZII)V

    .line 196
    add-int/lit8 v2, v0, -0x7

    invoke-static {p1, p2, v2, v1}, Lcom/trueaxis/modmenu/QrCodeEncoder;->drawFinder([[Z[[ZII)V

    .line 197
    invoke-static {p1, p2, v1, v2}, Lcom/trueaxis/modmenu/QrCodeEncoder;->drawFinder([[Z[[ZII)V

    .line 198
    const/4 v2, 0x0

    :goto_e
    const/16 v3, 0x8

    if-ge v2, v3, :cond_2c

    .line 199
    const/4 v3, 0x7

    invoke-static {p1, p2, v2, v3, v1}, Lcom/trueaxis/modmenu/QrCodeEncoder;->setModule([[Z[[ZIIZ)V

    .line 200
    invoke-static {p1, p2, v3, v2, v1}, Lcom/trueaxis/modmenu/QrCodeEncoder;->setModule([[Z[[ZIIZ)V

    .line 201
    add-int/lit8 v4, v0, -0x8

    add-int v5, v4, v2

    invoke-static {p1, p2, v5, v3, v1}, Lcom/trueaxis/modmenu/QrCodeEncoder;->setModule([[Z[[ZIIZ)V

    .line 202
    invoke-static {p1, p2, v3, v5, v1}, Lcom/trueaxis/modmenu/QrCodeEncoder;->setModule([[Z[[ZIIZ)V

    .line 203
    invoke-static {p1, p2, v2, v4, v1}, Lcom/trueaxis/modmenu/QrCodeEncoder;->setModule([[Z[[ZIIZ)V

    .line 204
    invoke-static {p1, p2, v4, v2, v1}, Lcom/trueaxis/modmenu/QrCodeEncoder;->setModule([[Z[[ZIIZ)V

    .line 198
    add-int/lit8 v2, v2, 0x1

    goto :goto_e

    .line 206
    :cond_2c
    const/16 v2, 0x8

    :goto_2e
    add-int/lit8 v4, v0, -0x8

    if-ge v2, v4, :cond_3c

    .line 207
    const/4 v4, 0x6

    invoke-static {p1, p2, v4, v2, v1}, Lcom/trueaxis/modmenu/QrCodeEncoder;->setModule([[Z[[ZIIZ)V

    .line 208
    invoke-static {p1, p2, v2, v4, v1}, Lcom/trueaxis/modmenu/QrCodeEncoder;->setModule([[Z[[ZIIZ)V

    .line 206
    add-int/lit8 v2, v2, 0x2

    goto :goto_2e

    .line 210
    :cond_3c
    invoke-static {p0}, Lcom/trueaxis/modmenu/QrCodeEncoder;->getAlignmentPositions(I)[I

    move-result-object v2

    .line 211
    const/4 v5, 0x0

    :goto_41
    array-length v6, v2

    const/4 v7, 0x1

    if-ge v5, v6, :cond_67

    .line 212
    const/4 v6, 0x0

    :goto_46
    array-length v8, v2

    if-ge v6, v8, :cond_64

    .line 213
    if-nez v5, :cond_4d

    if-eqz v6, :cond_61

    :cond_4d
    if-nez v5, :cond_53

    array-length v8, v2

    sub-int/2addr v8, v7

    if-eq v6, v8, :cond_61

    :cond_53
    array-length v8, v2

    sub-int/2addr v8, v7

    if-ne v5, v8, :cond_5a

    if-nez v6, :cond_5a

    .line 215
    goto :goto_61

    .line 217
    :cond_5a
    aget v8, v2, v5

    aget v9, v2, v6

    invoke-static {p1, p2, v8, v9}, Lcom/trueaxis/modmenu/QrCodeEncoder;->drawAlignment([[Z[[ZII)V

    .line 212
    :cond_61
    :goto_61
    add-int/lit8 v6, v6, 0x1

    goto :goto_46

    .line 211
    :cond_64
    add-int/lit8 v5, v5, 0x1

    goto :goto_41

    .line 220
    :cond_67
    invoke-static {p1, p2, v3, v4, v7}, Lcom/trueaxis/modmenu/QrCodeEncoder;->setModule([[Z[[ZIIZ)V

    .line 221
    sget-object v2, Lcom/trueaxis/modmenu/QrCodeEncoder;->REMAINDER_BITS:[I

    sub-int/2addr p0, v7

    aget p0, v2, p0

    .line 222
    const/4 v2, 0x0

    :goto_70
    if-ge v2, p0, :cond_7c

    .line 223
    add-int/lit8 v3, v0, -0x1

    sub-int v4, v3, v2

    invoke-static {p1, p2, v4, v3, v1}, Lcom/trueaxis/modmenu/QrCodeEncoder;->setModule([[Z[[ZIIZ)V

    .line 222
    add-int/lit8 v2, v2, 0x1

    goto :goto_70

    .line 225
    :cond_7c
    return-void
.end method

.method private static drawVersionBits(I[[Z[[Z)V
    .registers 10

    .line 351
    array-length v0, p1

    .line 352
    shl-int/lit8 p0, p0, 0xc

    .line 353
    const/4 v1, 0x0

    move v3, p0

    const/4 v2, 0x0

    :goto_6
    const/4 v4, 0x6

    const/4 v5, 0x1

    if-ge v2, v4, :cond_19

    .line 354
    shl-int/lit8 v4, v3, 0x1

    ushr-int/lit8 v3, v3, 0x11

    and-int/2addr v3, v5

    if-eqz v3, :cond_14

    const/16 v3, 0x1f25

    goto :goto_15

    :cond_14
    const/4 v3, 0x0

    :goto_15
    xor-int/2addr v3, v4

    .line 353
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    .line 356
    :cond_19
    and-int/lit16 v2, v3, 0xfff

    or-int/2addr p0, v2

    .line 357
    const/4 v2, 0x0

    :goto_1d
    const/16 v3, 0x12

    if-ge v2, v3, :cond_39

    .line 358
    ushr-int v3, p0, v2

    and-int/2addr v3, v5

    if-eqz v3, :cond_28

    const/4 v3, 0x1

    goto :goto_29

    :cond_28
    const/4 v3, 0x0

    .line 359
    :goto_29
    add-int/lit8 v4, v0, -0xb

    rem-int/lit8 v6, v2, 0x3

    add-int/2addr v4, v6

    .line 360
    div-int/lit8 v6, v2, 0x3

    .line 361
    invoke-static {p1, p2, v4, v6, v3}, Lcom/trueaxis/modmenu/QrCodeEncoder;->setModule([[Z[[ZIIZ)V

    .line 362
    invoke-static {p1, p2, v6, v4, v3}, Lcom/trueaxis/modmenu/QrCodeEncoder;->setModule([[Z[[ZIIZ)V

    .line 357
    add-int/lit8 v2, v2, 0x1

    goto :goto_1d

    .line 364
    :cond_39
    return-void
.end method

.method public static encode(Ljava/lang/String;I)Landroid/graphics/Bitmap;
    .registers 3

    .line 27
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object p0

    .line 28
    array-length v0, p0

    invoke-static {v0}, Lcom/trueaxis/modmenu/QrCodeEncoder;->chooseVersion(I)I

    move-result v0

    .line 29
    invoke-static {v0, p0}, Lcom/trueaxis/modmenu/QrCodeEncoder;->encodeVersion(I[B)[[Z

    move-result-object p0

    .line 30
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/QrCodeEncoder;->render([[ZI)Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0
.end method

.method private static encodeVersion(I[B)[[Z
    .registers 8

    .line 47
    mul-int/lit8 v0, p0, 0x4

    add-int/lit8 v0, v0, 0x11

    .line 48
    const/4 v1, 0x2

    new-array v2, v1, [I

    const/4 v3, 0x1

    aput v0, v2, v3

    const/4 v4, 0x0

    aput v0, v2, v4

    sget-object v5, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    invoke-static {v5, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [[Z

    .line 49
    new-array v1, v1, [I

    aput v0, v1, v3

    aput v0, v1, v4

    sget-object v0, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    invoke-static {v0, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [[Z

    .line 50
    invoke-static {p0, v2, v0}, Lcom/trueaxis/modmenu/QrCodeEncoder;->drawFunctionPatterns(I[[Z[[Z)V

    .line 51
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/QrCodeEncoder;->makeCodewords(I[B)[I

    move-result-object p1

    .line 52
    invoke-static {v2, v0, p1}, Lcom/trueaxis/modmenu/QrCodeEncoder;->placeDataBits([[Z[[Z[I)V

    .line 53
    invoke-static {p0, v2, v0}, Lcom/trueaxis/modmenu/QrCodeEncoder;->chooseMask(I[[Z[[Z)I

    move-result p1

    .line 54
    invoke-static {v2, v0, p1}, Lcom/trueaxis/modmenu/QrCodeEncoder;->applyMask([[Z[[ZI)V

    .line 55
    invoke-static {v2, v0, p1}, Lcom/trueaxis/modmenu/QrCodeEncoder;->drawFormatBits([[Z[[ZI)V

    .line 56
    const/4 p1, 0x7

    if-lt p0, p1, :cond_3d

    .line 57
    invoke-static {p0, v2, v0}, Lcom/trueaxis/modmenu/QrCodeEncoder;->drawVersionBits(I[[Z[[Z)V

    .line 59
    :cond_3d
    return-object v2
.end method

.method private static getAlignmentPositions(I)[I
    .registers 7

    .line 259
    const/4 v0, 0x0

    const/4 v1, 0x1

    if-ne p0, v1, :cond_7

    .line 260
    new-array p0, v0, [I

    return-object p0

    .line 262
    :cond_7
    mul-int/lit8 v2, p0, 0x4

    add-int/lit8 v2, v2, 0x11

    .line 263
    div-int/lit8 p0, p0, 0x7

    const/4 v3, 0x2

    add-int/2addr p0, v3

    .line 264
    new-array v4, p0, [I

    .line 265
    const/4 v5, 0x6

    aput v5, v4, v0

    .line 266
    add-int/lit8 v5, p0, -0x1

    add-int/lit8 v2, v2, -0x7

    aput v2, v4, v5

    .line 267
    if-ne p0, v3, :cond_1d

    .line 268
    return-object v4

    .line 270
    :cond_1d
    aget p0, v4, v5

    aget v2, v4, v0

    sub-int/2addr p0, v2

    div-int/2addr p0, v5

    .line 271
    and-int/lit8 v2, p0, 0x1

    if-eqz v2, :cond_29

    .line 272
    add-int/lit8 p0, p0, 0x1

    .line 274
    :cond_29
    nop

    :goto_2a
    if-ge v1, v5, :cond_36

    .line 275
    aget v2, v4, v0

    mul-int v3, v1, p0

    add-int/2addr v2, v3

    aput v2, v4, v1

    .line 274
    add-int/lit8 v1, v1, 0x1

    goto :goto_2a

    .line 277
    :cond_36
    return-object v4
.end method

.method private static gfMul(II)I
    .registers 6

    .line 178
    nop

    .line 179
    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_4
    const/16 v3, 0x8

    if-ge v1, v3, :cond_1f

    .line 180
    and-int/lit8 v3, p1, 0x1

    if-eqz v3, :cond_d

    .line 181
    xor-int/2addr v2, p0

    .line 183
    :cond_d
    and-int/lit16 v3, p0, 0x80

    if-eqz v3, :cond_13

    const/4 v3, 0x1

    goto :goto_14

    :cond_13
    const/4 v3, 0x0

    .line 184
    :goto_14
    shl-int/lit8 p0, p0, 0x1

    .line 185
    if-eqz v3, :cond_1a

    .line 186
    xor-int/lit8 p0, p0, 0x1d

    .line 188
    :cond_1a
    ushr-int/lit8 p1, p1, 0x1

    .line 179
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 190
    :cond_1f
    and-int/lit16 p0, v2, 0xff

    return p0
.end method

.method private static makeCodewords(I[B)[I
    .registers 16

    .line 63
    sget-object v0, Lcom/trueaxis/modmenu/QrCodeEncoder;->DATA_CODEWORDS:[I

    add-int/lit8 v1, p0, -0x1

    aget v0, v0, v1

    .line 64
    sget-object v2, Lcom/trueaxis/modmenu/QrCodeEncoder;->NUM_BLOCKS:[I

    aget v2, v2, v1

    .line 65
    sget-object v3, Lcom/trueaxis/modmenu/QrCodeEncoder;->ECC_CODEWORDS:[I

    aget v1, v3, v1

    .line 66
    div-int v3, v0, v2

    .line 67
    rem-int v4, v0, v2

    .line 69
    new-array v5, v0, [I

    .line 70
    nop

    .line 71
    mul-int/lit8 v6, v0, 0x8

    add-int/lit8 v7, v6, 0x20

    new-array v7, v7, [I

    .line 72
    const/4 v8, 0x0

    const/4 v9, 0x4

    invoke-static {v7, v8, v9, v9}, Lcom/trueaxis/modmenu/QrCodeEncoder;->appendBits([IIII)I

    move-result v10

    .line 73
    array-length v11, p1

    const/16 v12, 0x9

    const/16 v13, 0x8

    if-gt p0, v12, :cond_2b

    const/16 p0, 0x8

    goto :goto_2d

    :cond_2b
    const/16 p0, 0x10

    :goto_2d
    invoke-static {v7, v10, v11, p0}, Lcom/trueaxis/modmenu/QrCodeEncoder;->appendBits([IIII)I

    move-result p0

    .line 74
    const/4 v10, 0x0

    :goto_32
    array-length v11, p1

    if-ge v10, v11, :cond_40

    .line 75
    aget-byte v11, p1, v10

    and-int/lit16 v11, v11, 0xff

    invoke-static {v7, p0, v11, v13}, Lcom/trueaxis/modmenu/QrCodeEncoder;->appendBits([IIII)I

    move-result p0

    .line 74
    add-int/lit8 v10, v10, 0x1

    goto :goto_32

    .line 77
    :cond_40
    sub-int/2addr v6, p0

    invoke-static {v9, v6}, Ljava/lang/Math;->min(II)I

    move-result p1

    invoke-static {v7, p0, v8, p1}, Lcom/trueaxis/modmenu/QrCodeEncoder;->appendBits([IIII)I

    move-result p0

    .line 78
    :goto_49
    rem-int/lit8 p1, p0, 0x8

    const/4 v6, 0x1

    if-eqz p1, :cond_53

    .line 79
    invoke-static {v7, p0, v8, v6}, Lcom/trueaxis/modmenu/QrCodeEncoder;->appendBits([IIII)I

    move-result p0

    goto :goto_49

    .line 81
    :cond_53
    const/4 p1, 0x0

    :goto_54
    if-ge p1, v0, :cond_6b

    .line 82
    nop

    .line 83
    const/4 v9, 0x0

    const/4 v10, 0x0

    :goto_59
    if-ge v9, v13, :cond_66

    .line 84
    shl-int/lit8 v10, v10, 0x1

    mul-int/lit8 v11, p1, 0x8

    add-int/2addr v11, v9

    aget v11, v7, v11

    or-int/2addr v10, v11

    .line 83
    add-int/lit8 v9, v9, 0x1

    goto :goto_59

    .line 86
    :cond_66
    aput v10, v5, p1

    .line 81
    add-int/lit8 p1, p1, 0x1

    goto :goto_54

    .line 88
    :cond_6b
    add-int/lit8 p0, p0, 0x7

    div-int/2addr p0, v13

    .line 89
    nop

    :goto_6f
    if-ge p0, v0, :cond_7f

    .line 90
    rem-int/lit8 p1, p0, 0x2

    if-nez p1, :cond_78

    const/16 p1, 0xec

    goto :goto_7a

    :cond_78
    const/16 p1, 0x11

    :goto_7a
    aput p1, v5, p0

    .line 89
    add-int/lit8 p0, p0, 0x1

    goto :goto_6f

    .line 93
    :cond_7f
    new-array p0, v2, [[I

    .line 94
    nop

    .line 95
    const/4 p1, 0x0

    const/4 v7, 0x0

    :goto_84
    if-ge p1, v2, :cond_a0

    .line 96
    if-ge p1, v4, :cond_8a

    const/4 v9, 0x1

    goto :goto_8b

    :cond_8a
    const/4 v9, 0x0

    :goto_8b
    add-int/2addr v9, v3

    .line 97
    add-int v10, v9, v1

    new-array v10, v10, [I

    aput-object v10, p0, p1

    .line 98
    aget-object v10, p0, p1

    invoke-static {v5, v7, v10, v8, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 99
    add-int/2addr v7, v9

    .line 100
    aget-object v10, p0, p1

    invoke-static {v10, v9, v1}, Lcom/trueaxis/modmenu/QrCodeEncoder;->reedSolomon([III)V

    .line 95
    add-int/lit8 p1, p1, 0x1

    goto :goto_84

    .line 103
    :cond_a0
    mul-int p1, v2, v1

    add-int/2addr v0, p1

    .line 104
    new-array p1, v0, [I

    .line 105
    nop

    .line 106
    if-lez v4, :cond_a9

    goto :goto_aa

    :cond_a9
    const/4 v6, 0x0

    :goto_aa
    add-int/2addr v3, v6

    .line 107
    const/4 v0, 0x0

    const/4 v4, 0x0

    :goto_ad
    if-ge v0, v3, :cond_c7

    .line 108
    const/4 v5, 0x0

    :goto_b0
    if-ge v5, v2, :cond_c4

    .line 109
    aget-object v6, p0, v5

    array-length v6, v6

    sub-int/2addr v6, v1

    if-ge v0, v6, :cond_c1

    .line 110
    add-int/lit8 v6, v4, 0x1

    aget-object v7, p0, v5

    aget v7, v7, v0

    aput v7, p1, v4

    move v4, v6

    .line 108
    :cond_c1
    add-int/lit8 v5, v5, 0x1

    goto :goto_b0

    .line 107
    :cond_c4
    add-int/lit8 v0, v0, 0x1

    goto :goto_ad

    .line 114
    :cond_c7
    const/4 v0, 0x0

    :goto_c8
    if-ge v0, v1, :cond_e1

    .line 115
    const/4 v3, 0x0

    :goto_cb
    if-ge v3, v2, :cond_de

    .line 116
    add-int/lit8 v5, v4, 0x1

    aget-object v6, p0, v3

    aget-object v7, p0, v3

    array-length v7, v7

    sub-int/2addr v7, v1

    add-int/2addr v7, v0

    aget v6, v6, v7

    aput v6, p1, v4

    .line 115
    add-int/lit8 v3, v3, 0x1

    move v4, v5

    goto :goto_cb

    .line 114
    :cond_de
    add-int/lit8 v0, v0, 0x1

    goto :goto_c8

    .line 119
    :cond_e1
    return-object p1
.end method

.method private static maskPenalty([[Z)I
    .registers 11

    .line 367
    array-length v0, p0

    .line 368
    nop

    .line 369
    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_5
    const/4 v4, 0x5

    const/4 v5, 0x1

    if-ge v2, v0, :cond_30

    .line 370
    aget-object v6, p0, v2

    aget-boolean v6, v6, v1

    .line 371
    nop

    .line 372
    const/4 v7, 0x1

    const/4 v8, 0x1

    :goto_10
    if-ge v7, v0, :cond_28

    .line 373
    aget-object v9, p0, v2

    aget-boolean v9, v9, v7

    if-ne v9, v6, :cond_1b

    .line 374
    add-int/lit8 v8, v8, 0x1

    goto :goto_25

    .line 376
    :cond_1b
    if-lt v8, v4, :cond_20

    .line 377
    add-int/lit8 v8, v8, -0x2

    add-int/2addr v3, v8

    .line 379
    :cond_20
    aget-object v6, p0, v2

    aget-boolean v6, v6, v7

    .line 380
    const/4 v8, 0x1

    .line 372
    :goto_25
    add-int/lit8 v7, v7, 0x1

    goto :goto_10

    .line 383
    :cond_28
    if-lt v8, v4, :cond_2d

    .line 384
    add-int/lit8 v8, v8, -0x2

    add-int/2addr v3, v8

    .line 369
    :cond_2d
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    .line 387
    :cond_30
    const/4 v2, 0x0

    :goto_31
    if-ge v2, v0, :cond_5a

    .line 388
    aget-object v6, p0, v1

    aget-boolean v6, v6, v2

    .line 389
    nop

    .line 390
    const/4 v7, 0x1

    const/4 v8, 0x1

    :goto_3a
    if-ge v7, v0, :cond_52

    .line 391
    aget-object v9, p0, v7

    aget-boolean v9, v9, v2

    if-ne v9, v6, :cond_45

    .line 392
    add-int/lit8 v8, v8, 0x1

    goto :goto_4f

    .line 394
    :cond_45
    if-lt v8, v4, :cond_4a

    .line 395
    add-int/lit8 v8, v8, -0x2

    add-int/2addr v3, v8

    .line 397
    :cond_4a
    aget-object v6, p0, v7

    aget-boolean v6, v6, v2

    .line 398
    const/4 v8, 0x1

    .line 390
    :goto_4f
    add-int/lit8 v7, v7, 0x1

    goto :goto_3a

    .line 401
    :cond_52
    if-lt v8, v4, :cond_57

    .line 402
    add-int/lit8 v8, v8, -0x2

    add-int/2addr v3, v8

    .line 387
    :cond_57
    add-int/lit8 v2, v2, 0x1

    goto :goto_31

    .line 405
    :cond_5a
    return v3
.end method

.method private static placeDataBits([[Z[[Z[I)V
    .registers 19

    .line 123
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    array-length v2, v0

    .line 124
    nop

    .line 125
    array-length v3, v1

    mul-int/lit8 v3, v3, 0x8

    .line 126
    add-int/lit8 v4, v2, -0x1

    const/4 v5, 0x0

    move v6, v4

    const/4 v7, 0x0

    :goto_e
    const/4 v8, 0x1

    if-lt v6, v8, :cond_4f

    .line 127
    const/4 v9, 0x6

    if-ne v6, v9, :cond_15

    .line 128
    const/4 v6, 0x5

    .line 130
    :cond_15
    const/4 v9, 0x0

    :goto_16
    if-ge v9, v2, :cond_4c

    .line 131
    add-int/lit8 v10, v6, 0x1

    const/4 v11, 0x2

    div-int/2addr v10, v11

    rem-int/2addr v10, v11

    if-nez v10, :cond_22

    sub-int v10, v4, v9

    goto :goto_23

    :cond_22
    move v10, v9

    .line 132
    :goto_23
    const/4 v12, 0x0

    :goto_24
    if-ge v12, v11, :cond_49

    .line 133
    sub-int v13, v6, v12

    .line 134
    aget-object v14, p1, v10

    aget-boolean v14, v14, v13

    if-eqz v14, :cond_2f

    .line 135
    goto :goto_46

    .line 137
    :cond_2f
    if-ge v7, v3, :cond_46

    .line 138
    div-int/lit8 v14, v7, 0x8

    aget v14, v1, v14

    rem-int/lit8 v15, v7, 0x8

    rsub-int/lit8 v15, v15, 0x7

    ushr-int/2addr v14, v15

    and-int/2addr v14, v8

    .line 139
    aget-object v15, v0, v10

    if-ne v14, v8, :cond_41

    const/4 v14, 0x1

    goto :goto_42

    :cond_41
    const/4 v14, 0x0

    :goto_42
    aput-boolean v14, v15, v13

    .line 140
    add-int/lit8 v7, v7, 0x1

    .line 132
    :cond_46
    :goto_46
    add-int/lit8 v12, v12, 0x1

    goto :goto_24

    .line 130
    :cond_49
    add-int/lit8 v9, v9, 0x1

    goto :goto_16

    .line 126
    :cond_4c
    add-int/lit8 v6, v6, -0x2

    goto :goto_e

    .line 145
    :cond_4f
    return-void
.end method

.method private static reedSolomon([III)V
    .registers 13

    .line 155
    add-int/lit8 v0, p2, 0x1

    new-array v0, v0, [I

    .line 156
    const/4 v1, 0x0

    const/4 v2, 0x1

    aput v2, v0, v1

    .line 157
    nop

    .line 158
    const/4 v3, 0x0

    const/4 v4, 0x1

    :goto_b
    if-ge v3, p2, :cond_30

    .line 159
    move v5, p2

    :goto_e
    if-lt v5, v2, :cond_20

    .line 160
    aget v6, v0, v5

    invoke-static {v6, v4}, Lcom/trueaxis/modmenu/QrCodeEncoder;->gfMul(II)I

    move-result v6

    add-int/lit8 v7, v5, -0x1

    aget v7, v0, v7

    xor-int/2addr v6, v7

    aput v6, v0, v5

    .line 159
    add-int/lit8 v5, v5, -0x1

    goto :goto_e

    .line 162
    :cond_20
    aget v5, v0, v1

    invoke-static {v5, v4}, Lcom/trueaxis/modmenu/QrCodeEncoder;->gfMul(II)I

    move-result v5

    aput v5, v0, v1

    .line 163
    const/4 v5, 0x2

    invoke-static {v4, v5}, Lcom/trueaxis/modmenu/QrCodeEncoder;->gfMul(II)I

    move-result v4

    .line 158
    add-int/lit8 v3, v3, 0x1

    goto :goto_b

    .line 165
    :cond_30
    new-array v3, p2, [I

    .line 166
    const/4 v4, 0x0

    :goto_33
    if-ge v4, p1, :cond_56

    .line 167
    aget v5, p0, v4

    aget v6, v3, v1

    xor-int/2addr v5, v6

    .line 168
    add-int/lit8 v6, p2, -0x1

    invoke-static {v3, v2, v3, v1, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 169
    aput v1, v3, v6

    .line 170
    const/4 v6, 0x0

    :goto_42
    if-ge v6, p2, :cond_53

    .line 171
    aget v7, v3, v6

    add-int/lit8 v8, v6, 0x1

    aget v9, v0, v8

    invoke-static {v9, v5}, Lcom/trueaxis/modmenu/QrCodeEncoder;->gfMul(II)I

    move-result v9

    xor-int/2addr v7, v9

    aput v7, v3, v6

    .line 170
    move v6, v8

    goto :goto_42

    .line 166
    :cond_53
    add-int/lit8 v4, v4, 0x1

    goto :goto_33

    .line 174
    :cond_56
    invoke-static {v3, v1, p0, p1, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 175
    return-void
.end method

.method private static render([[ZI)Landroid/graphics/Bitmap;
    .registers 19

    .line 409
    move-object/from16 v0, p0

    array-length v1, v0

    .line 410
    nop

    .line 411
    add-int/lit8 v2, v1, 0x8

    .line 412
    div-int v3, p1, v2

    const/4 v4, 0x1

    invoke-static {v4, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    .line 413
    mul-int v12, v3, v2

    .line 414
    sget-object v5, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v12, v12, v5}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v13

    .line 415
    mul-int v5, v12, v12

    new-array v6, v5, [I

    .line 416
    const/4 v5, 0x0

    const/4 v7, 0x0

    :goto_1b
    if-ge v7, v2, :cond_5b

    .line 417
    const/4 v8, 0x0

    :goto_1e
    if-ge v8, v2, :cond_58

    .line 418
    add-int/lit8 v9, v8, -0x4

    .line 419
    add-int/lit8 v10, v7, -0x4

    .line 420
    if-ltz v9, :cond_34

    if-ltz v10, :cond_34

    if-ge v9, v1, :cond_34

    if-ge v10, v1, :cond_34

    aget-object v10, v0, v10

    aget-boolean v9, v10, v9

    if-eqz v9, :cond_34

    const/4 v9, 0x1

    goto :goto_35

    :cond_34
    const/4 v9, 0x0

    .line 421
    :goto_35
    if-eqz v9, :cond_3a

    const/high16 v9, -0x1000000

    goto :goto_3b

    :cond_3a
    const/4 v9, -0x1

    .line 422
    :goto_3b
    mul-int v10, v7, v3

    mul-int v10, v10, v12

    mul-int v11, v8, v3

    add-int/2addr v10, v11

    .line 423
    const/4 v11, 0x0

    :goto_43
    if-ge v11, v3, :cond_55

    .line 424
    mul-int v14, v11, v12

    add-int/2addr v14, v10

    .line 425
    const/4 v15, 0x0

    :goto_49
    if-ge v15, v3, :cond_52

    .line 426
    add-int v16, v14, v15

    aput v9, v6, v16

    .line 425
    add-int/lit8 v15, v15, 0x1

    goto :goto_49

    .line 423
    :cond_52
    add-int/lit8 v11, v11, 0x1

    goto :goto_43

    .line 417
    :cond_55
    add-int/lit8 v8, v8, 0x1

    goto :goto_1e

    .line 416
    :cond_58
    add-int/lit8 v7, v7, 0x1

    goto :goto_1b

    .line 431
    :cond_5b
    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v7, 0x0

    move-object v5, v13

    move v8, v12

    move v11, v12

    invoke-virtual/range {v5 .. v12}, Landroid/graphics/Bitmap;->setPixels([IIIIIII)V

    .line 432
    return-object v13
.end method

.method private static setModule([[Z[[ZIIZ)V
    .registers 5

    .line 254
    aget-object p0, p0, p3

    aput-boolean p4, p0, p2

    .line 255
    aget-object p0, p1, p3

    const/4 p1, 0x1

    aput-boolean p1, p0, p2

    .line 256
    return-void
.end method
