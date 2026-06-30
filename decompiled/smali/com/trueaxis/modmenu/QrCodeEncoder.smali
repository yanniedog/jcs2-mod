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

    .line 146
    add-int/lit8 p3, p3, -0x1

    :goto_2
    if-ltz p3, :cond_10

    .line 147
    add-int/lit8 v0, p1, 0x1

    ushr-int v1, p2, p3

    and-int/lit8 v1, v1, 0x1

    aput v1, p0, p1

    .line 146
    add-int/lit8 p3, p3, -0x1

    move p1, v0

    goto :goto_2

    .line 149
    :cond_10
    return p1
.end method

.method private static applyMask([[Z[[ZI)V
    .registers 10

    .line 290
    array-length v0, p0

    .line 291
    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_3
    if-ge v2, v0, :cond_82

    .line 292
    const/4 v3, 0x0

    :goto_6
    if-ge v3, v0, :cond_7f

    .line 293
    aget-object v4, p1, v2

    aget-boolean v4, v4, v3

    if-eqz v4, :cond_10

    .line 294
    goto/16 :goto_7c

    .line 297
    :cond_10
    const/4 v4, 0x1

    packed-switch p2, :pswitch_data_84

    .line 305
    add-int v5, v3, v2

    rem-int/lit8 v5, v5, 0x2

    mul-int v6, v3, v2

    rem-int/lit8 v6, v6, 0x3

    add-int/2addr v5, v6

    rem-int/lit8 v5, v5, 0x2

    if-nez v5, :cond_70

    const/4 v5, 0x1

    goto :goto_71

    .line 304
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

    .line 303
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

    .line 302
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

    .line 301
    :pswitch_4c
    add-int v5, v3, v2

    rem-int/lit8 v5, v5, 0x3

    if-nez v5, :cond_54

    const/4 v5, 0x1

    goto :goto_71

    :cond_54
    const/4 v5, 0x0

    goto :goto_71

    .line 300
    :pswitch_56
    rem-int/lit8 v5, v3, 0x3

    if-nez v5, :cond_5c

    const/4 v5, 0x1

    goto :goto_71

    :cond_5c
    const/4 v5, 0x0

    goto :goto_71

    .line 299
    :pswitch_5e
    rem-int/lit8 v5, v2, 0x2

    if-nez v5, :cond_64

    const/4 v5, 0x1

    goto :goto_71

    :cond_64
    const/4 v5, 0x0

    goto :goto_71

    .line 298
    :pswitch_66
    add-int v5, v3, v2

    rem-int/lit8 v5, v5, 0x2

    if-nez v5, :cond_6e

    const/4 v5, 0x1

    goto :goto_71

    :cond_6e
    const/4 v5, 0x0

    goto :goto_71

    .line 305
    :cond_70
    const/4 v5, 0x0

    .line 307
    :goto_71
    if-eqz v5, :cond_7c

    .line 308
    aget-object v5, p0, v2

    aget-object v6, p0, v2

    aget-boolean v6, v6, v3

    xor-int/2addr v4, v6

    aput-boolean v4, v5, v3

    .line 292
    :cond_7c
    :goto_7c
    add-int/lit8 v3, v3, 0x1

    goto :goto_6

    .line 291
    :cond_7f
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 312
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

    .line 271
    nop

    .line 272
    nop

    .line 273
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

    .line 274
    const v1, 0x7fffffff

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_1a
    const/16 v4, 0x8

    if-ge v2, v4, :cond_3f

    .line 275
    const/4 v4, 0x0

    :goto_1f
    array-length v5, p1

    if-ge v4, v5, :cond_2d

    .line 276
    aget-object v5, p1, v4

    aget-object v6, p0, v4

    array-length v7, p1

    invoke-static {v5, v0, v6, v0, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 275
    add-int/lit8 v4, v4, 0x1

    goto :goto_1f

    .line 278
    :cond_2d
    invoke-static {p0, p2, v2}, Lcom/trueaxis/modmenu/QrCodeEncoder;->applyMask([[Z[[ZI)V

    .line 279
    invoke-static {p0, p2, v2}, Lcom/trueaxis/modmenu/QrCodeEncoder;->drawFormatBits([[Z[[ZI)V

    .line 280
    invoke-static {p0}, Lcom/trueaxis/modmenu/QrCodeEncoder;->maskPenalty([[Z)I

    move-result v4

    .line 281
    if-ge v4, v1, :cond_3c

    .line 282
    nop

    .line 283
    move v3, v2

    move v1, v4

    .line 274
    :cond_3c
    add-int/lit8 v2, v2, 0x1

    goto :goto_1a

    .line 286
    :cond_3f
    return v3
.end method

.method private static chooseVersion(I)I
    .registers 4

    .line 34
    const/4 v0, 0x1

    :goto_1
    const/16 v1, 0xa

    if-gt v0, v1, :cond_1b

    .line 35
    sget-object v1, Lcom/trueaxis/modmenu/QrCodeEncoder;->DATA_CODEWORDS:[I

    add-int/lit8 v2, v0, -0x1

    aget v1, v1, v2

    .line 36
    mul-int/lit8 v2, p0, 0x8

    add-int/lit8 v2, v2, 0xc

    add-int/lit8 v2, v2, 0x4

    .line 37
    add-int/lit8 v2, v2, 0x7

    div-int/lit8 v2, v2, 0x8

    .line 38
    if-gt v2, v1, :cond_18

    .line 39
    return v0

    .line 34
    :cond_18
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 42
    :cond_1b
    return v1
.end method

.method private static drawAlignment([[Z[[ZII)V
    .registers 11

    .line 242
    const/4 v0, -0x2

    const/4 v1, -0x2

    :goto_2
    const/4 v2, 0x2

    if-gt v1, v2, :cond_26

    .line 243
    const/4 v3, -0x2

    :goto_6
    if-gt v3, v2, :cond_23

    .line 244
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

    .line 245
    :goto_19
    add-int v4, p2, v3

    add-int v6, p3, v1

    invoke-static {p0, p1, v4, v6, v5}, Lcom/trueaxis/modmenu/QrCodeEncoder;->setModule([[Z[[ZIIZ)V

    .line 243
    add-int/lit8 v3, v3, 0x1

    goto :goto_6

    .line 242
    :cond_23
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 248
    :cond_26
    return-void
.end method

.method private static drawFinder([[Z[[ZII)V
    .registers 12

    .line 226
    const/4 v0, -0x1

    const/4 v1, -0x1

    :goto_2
    const/4 v2, 0x7

    if-gt v1, v2, :cond_3e

    .line 227
    const/4 v3, -0x1

    :goto_6
    if-gt v3, v2, :cond_3b

    .line 228
    add-int v4, p2, v3

    .line 229
    add-int v5, p3, v1

    .line 230
    if-ltz v4, :cond_38

    if-ltz v5, :cond_38

    array-length v6, p0

    if-ge v4, v6, :cond_38

    array-length v6, p0

    if-lt v5, v6, :cond_17

    .line 231
    goto :goto_38

    .line 233
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

    .line 236
    :goto_35
    invoke-static {p0, p1, v4, v5, v6}, Lcom/trueaxis/modmenu/QrCodeEncoder;->setModule([[Z[[ZIIZ)V

    .line 227
    :cond_38
    :goto_38
    add-int/lit8 v3, v3, 0x1

    goto :goto_6

    .line 226
    :cond_3b
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 239
    :cond_3e
    return-void
.end method

.method private static drawFormatBits([[Z[[ZI)V
    .registers 11

    .line 315
    array-length v0, p0

    .line 316
    const/16 v1, 0x8

    or-int/2addr p2, v1

    .line 317
    shl-int/lit8 p2, p2, 0xa

    .line 318
    const/4 v2, 0x5

    move v4, p2

    const/4 v3, 0x5

    :goto_9
    const/4 v5, 0x0

    const/4 v6, 0x1

    if-ltz v3, :cond_1b

    .line 319
    shl-int/lit8 v7, v4, 0x1

    ushr-int/lit8 v4, v4, 0xa

    and-int/2addr v4, v6

    if-eqz v4, :cond_16

    const/16 v5, 0x537

    :cond_16
    xor-int v4, v7, v5

    .line 318
    add-int/lit8 v3, v3, -0x1

    goto :goto_9

    .line 321
    :cond_1b
    and-int/lit16 v3, v4, 0x3ff

    or-int/2addr p2, v3

    .line 322
    const/4 v3, 0x0

    :goto_1f
    if-gt v3, v2, :cond_2f

    .line 323
    ushr-int v4, p2, v3

    and-int/2addr v4, v6

    if-eqz v4, :cond_28

    const/4 v4, 0x1

    goto :goto_29

    :cond_28
    const/4 v4, 0x0

    :goto_29
    invoke-static {p0, p1, v1, v3, v4}, Lcom/trueaxis/modmenu/QrCodeEncoder;->setModule([[Z[[ZIIZ)V

    .line 322
    add-int/lit8 v3, v3, 0x1

    goto :goto_1f

    .line 325
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

    .line 326
    ushr-int/lit8 v2, p2, 0x7

    and-int/2addr v2, v6

    if-eqz v2, :cond_42

    const/4 v2, 0x1

    goto :goto_43

    :cond_42
    const/4 v2, 0x0

    :goto_43
    invoke-static {p0, p1, v1, v1, v2}, Lcom/trueaxis/modmenu/QrCodeEncoder;->setModule([[Z[[ZIIZ)V

    .line 327
    ushr-int/lit8 v2, p2, 0x8

    and-int/2addr v2, v6

    if-eqz v2, :cond_4d

    const/4 v2, 0x1

    goto :goto_4e

    :cond_4d
    const/4 v2, 0x0

    :goto_4e
    invoke-static {p0, p1, v3, v1, v2}, Lcom/trueaxis/modmenu/QrCodeEncoder;->setModule([[Z[[ZIIZ)V

    .line 328
    const/16 v2, 0x9

    :goto_53
    const/16 v3, 0xf

    if-ge v2, v3, :cond_67

    .line 329
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

    .line 328
    add-int/lit8 v2, v2, 0x1

    goto :goto_53

    .line 331
    :cond_67
    const/4 v2, 0x0

    :goto_68
    if-ge v2, v1, :cond_7b

    .line 332
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

    .line 331
    add-int/lit8 v2, v2, 0x1

    goto :goto_68

    .line 334
    :cond_7b
    const/16 v2, 0x8

    :goto_7d
    if-ge v2, v3, :cond_90

    .line 335
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

    .line 334
    add-int/lit8 v2, v2, 0x1

    goto :goto_7d

    .line 337
    :cond_90
    sub-int/2addr v0, v1

    invoke-static {p0, p1, v1, v0, v6}, Lcom/trueaxis/modmenu/QrCodeEncoder;->setModule([[Z[[ZIIZ)V

    .line 338
    return-void
.end method

.method private static drawFunctionPatterns(I[[Z[[Z)V
    .registers 13

    .line 192
    array-length v0, p1

    .line 193
    const/4 v1, 0x0

    invoke-static {p1, p2, v1, v1}, Lcom/trueaxis/modmenu/QrCodeEncoder;->drawFinder([[Z[[ZII)V

    .line 194
    add-int/lit8 v2, v0, -0x7

    invoke-static {p1, p2, v2, v1}, Lcom/trueaxis/modmenu/QrCodeEncoder;->drawFinder([[Z[[ZII)V

    .line 195
    invoke-static {p1, p2, v1, v2}, Lcom/trueaxis/modmenu/QrCodeEncoder;->drawFinder([[Z[[ZII)V

    .line 196
    const/4 v2, 0x0

    :goto_e
    const/16 v3, 0x8

    if-ge v2, v3, :cond_2c

    .line 197
    const/4 v3, 0x7

    invoke-static {p1, p2, v2, v3, v1}, Lcom/trueaxis/modmenu/QrCodeEncoder;->setModule([[Z[[ZIIZ)V

    .line 198
    invoke-static {p1, p2, v3, v2, v1}, Lcom/trueaxis/modmenu/QrCodeEncoder;->setModule([[Z[[ZIIZ)V

    .line 199
    add-int/lit8 v4, v0, -0x8

    add-int v5, v4, v2

    invoke-static {p1, p2, v5, v3, v1}, Lcom/trueaxis/modmenu/QrCodeEncoder;->setModule([[Z[[ZIIZ)V

    .line 200
    invoke-static {p1, p2, v3, v5, v1}, Lcom/trueaxis/modmenu/QrCodeEncoder;->setModule([[Z[[ZIIZ)V

    .line 201
    invoke-static {p1, p2, v2, v4, v1}, Lcom/trueaxis/modmenu/QrCodeEncoder;->setModule([[Z[[ZIIZ)V

    .line 202
    invoke-static {p1, p2, v4, v2, v1}, Lcom/trueaxis/modmenu/QrCodeEncoder;->setModule([[Z[[ZIIZ)V

    .line 196
    add-int/lit8 v2, v2, 0x1

    goto :goto_e

    .line 204
    :cond_2c
    const/16 v2, 0x8

    :goto_2e
    add-int/lit8 v4, v0, -0x8

    if-ge v2, v4, :cond_3c

    .line 205
    const/4 v4, 0x6

    invoke-static {p1, p2, v4, v2, v1}, Lcom/trueaxis/modmenu/QrCodeEncoder;->setModule([[Z[[ZIIZ)V

    .line 206
    invoke-static {p1, p2, v2, v4, v1}, Lcom/trueaxis/modmenu/QrCodeEncoder;->setModule([[Z[[ZIIZ)V

    .line 204
    add-int/lit8 v2, v2, 0x2

    goto :goto_2e

    .line 208
    :cond_3c
    invoke-static {p0}, Lcom/trueaxis/modmenu/QrCodeEncoder;->getAlignmentPositions(I)[I

    move-result-object v2

    .line 209
    const/4 v5, 0x0

    :goto_41
    array-length v6, v2

    const/4 v7, 0x1

    if-ge v5, v6, :cond_67

    .line 210
    const/4 v6, 0x0

    :goto_46
    array-length v8, v2

    if-ge v6, v8, :cond_64

    .line 211
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

    .line 213
    goto :goto_61

    .line 215
    :cond_5a
    aget v8, v2, v5

    aget v9, v2, v6

    invoke-static {p1, p2, v8, v9}, Lcom/trueaxis/modmenu/QrCodeEncoder;->drawAlignment([[Z[[ZII)V

    .line 210
    :cond_61
    :goto_61
    add-int/lit8 v6, v6, 0x1

    goto :goto_46

    .line 209
    :cond_64
    add-int/lit8 v5, v5, 0x1

    goto :goto_41

    .line 218
    :cond_67
    invoke-static {p1, p2, v3, v4, v7}, Lcom/trueaxis/modmenu/QrCodeEncoder;->setModule([[Z[[ZIIZ)V

    .line 219
    sget-object v2, Lcom/trueaxis/modmenu/QrCodeEncoder;->REMAINDER_BITS:[I

    sub-int/2addr p0, v7

    aget p0, v2, p0

    .line 220
    const/4 v2, 0x0

    :goto_70
    if-ge v2, p0, :cond_7c

    .line 221
    add-int/lit8 v3, v0, -0x1

    sub-int v4, v3, v2

    invoke-static {p1, p2, v4, v3, v1}, Lcom/trueaxis/modmenu/QrCodeEncoder;->setModule([[Z[[ZIIZ)V

    .line 220
    add-int/lit8 v2, v2, 0x1

    goto :goto_70

    .line 223
    :cond_7c
    return-void
.end method

.method private static drawVersionBits(I[[Z[[Z)V
    .registers 10

    .line 341
    array-length v0, p1

    .line 342
    shl-int/lit8 p0, p0, 0xc

    .line 343
    const/4 v1, 0x0

    move v3, p0

    const/4 v2, 0x0

    :goto_6
    const/4 v4, 0x6

    const/4 v5, 0x1

    if-ge v2, v4, :cond_19

    .line 344
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

    .line 343
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    .line 346
    :cond_19
    and-int/lit16 v2, v3, 0xfff

    or-int/2addr p0, v2

    .line 347
    const/4 v2, 0x0

    :goto_1d
    const/16 v3, 0x12

    if-ge v2, v3, :cond_39

    .line 348
    ushr-int v3, p0, v2

    and-int/2addr v3, v5

    if-eqz v3, :cond_28

    const/4 v3, 0x1

    goto :goto_29

    :cond_28
    const/4 v3, 0x0

    .line 349
    :goto_29
    add-int/lit8 v4, v0, -0xb

    rem-int/lit8 v6, v2, 0x3

    add-int/2addr v4, v6

    .line 350
    div-int/lit8 v6, v2, 0x3

    .line 351
    invoke-static {p1, p2, v4, v6, v3}, Lcom/trueaxis/modmenu/QrCodeEncoder;->setModule([[Z[[ZIIZ)V

    .line 352
    invoke-static {p1, p2, v6, v4, v3}, Lcom/trueaxis/modmenu/QrCodeEncoder;->setModule([[Z[[ZIIZ)V

    .line 347
    add-int/lit8 v2, v2, 0x1

    goto :goto_1d

    .line 354
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

    .line 46
    mul-int/lit8 v0, p0, 0x4

    add-int/lit8 v0, v0, 0x11

    .line 47
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

    .line 48
    new-array v1, v1, [I

    aput v0, v1, v3

    aput v0, v1, v4

    sget-object v0, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    invoke-static {v0, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [[Z

    .line 49
    invoke-static {p0, v2, v0}, Lcom/trueaxis/modmenu/QrCodeEncoder;->drawFunctionPatterns(I[[Z[[Z)V

    .line 50
    invoke-static {p0, p1}, Lcom/trueaxis/modmenu/QrCodeEncoder;->makeCodewords(I[B)[I

    move-result-object p1

    .line 51
    invoke-static {v2, v0, p1}, Lcom/trueaxis/modmenu/QrCodeEncoder;->placeDataBits([[Z[[Z[I)V

    .line 52
    invoke-static {p0, v2, v0}, Lcom/trueaxis/modmenu/QrCodeEncoder;->chooseMask(I[[Z[[Z)I

    move-result p1

    .line 53
    invoke-static {v2, v0, p1}, Lcom/trueaxis/modmenu/QrCodeEncoder;->applyMask([[Z[[ZI)V

    .line 54
    invoke-static {v2, v0, p1}, Lcom/trueaxis/modmenu/QrCodeEncoder;->drawFormatBits([[Z[[ZI)V

    .line 55
    const/4 p1, 0x7

    if-lt p0, p1, :cond_3d

    .line 56
    invoke-static {p0, v2, v0}, Lcom/trueaxis/modmenu/QrCodeEncoder;->drawVersionBits(I[[Z[[Z)V

    .line 58
    :cond_3d
    return-object v2
.end method

.method private static getAlignmentPositions(I)[I
    .registers 8

    .line 257
    const/4 v0, 0x0

    const/4 v1, 0x1

    if-ne p0, v1, :cond_7

    .line 258
    new-array p0, v0, [I

    return-object p0

    .line 260
    :cond_7
    div-int/lit8 v2, p0, 0x7

    add-int/lit8 v2, v2, 0x2

    .line 261
    const/16 v3, 0x20

    if-ne p0, v3, :cond_12

    const/16 p0, 0x1a

    goto :goto_1d

    :cond_12
    mul-int/lit8 p0, p0, 0x4

    mul-int/lit8 v3, v2, 0x2

    add-int/2addr p0, v3

    add-int/2addr p0, v1

    add-int/lit8 v3, v3, -0x2

    div-int/2addr p0, v3

    mul-int/lit8 p0, p0, 0x2

    .line 262
    :goto_1d
    new-array v3, v2, [I

    .line 263
    const/4 v4, 0x6

    aput v4, v3, v0

    .line 264
    sub-int/2addr v2, v1

    move v4, v2

    :goto_24
    if-lt v4, v1, :cond_32

    .line 265
    aget v5, v3, v0

    sub-int v6, v2, v4

    mul-int v6, v6, p0

    add-int/2addr v5, v6

    aput v5, v3, v4

    .line 264
    add-int/lit8 v4, v4, -0x1

    goto :goto_24

    .line 267
    :cond_32
    return-object v3
.end method

.method private static gfMul(II)I
    .registers 6

    .line 176
    nop

    .line 177
    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_4
    const/16 v3, 0x8

    if-ge v1, v3, :cond_1f

    .line 178
    and-int/lit8 v3, p1, 0x1

    if-eqz v3, :cond_d

    .line 179
    xor-int/2addr v2, p0

    .line 181
    :cond_d
    and-int/lit16 v3, p0, 0x80

    if-eqz v3, :cond_13

    const/4 v3, 0x1

    goto :goto_14

    :cond_13
    const/4 v3, 0x0

    .line 182
    :goto_14
    shl-int/lit8 p0, p0, 0x1

    .line 183
    if-eqz v3, :cond_1a

    .line 184
    xor-int/lit8 p0, p0, 0x1d

    .line 186
    :cond_1a
    ushr-int/lit8 p1, p1, 0x1

    .line 177
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 188
    :cond_1f
    and-int/lit16 p0, v2, 0xff

    return p0
.end method

.method private static makeCodewords(I[B)[I
    .registers 16

    .line 62
    sget-object v0, Lcom/trueaxis/modmenu/QrCodeEncoder;->DATA_CODEWORDS:[I

    add-int/lit8 v1, p0, -0x1

    aget v0, v0, v1

    .line 63
    sget-object v2, Lcom/trueaxis/modmenu/QrCodeEncoder;->NUM_BLOCKS:[I

    aget v2, v2, v1

    .line 64
    sget-object v3, Lcom/trueaxis/modmenu/QrCodeEncoder;->ECC_CODEWORDS:[I

    aget v1, v3, v1

    .line 65
    div-int v3, v0, v2

    .line 66
    rem-int v4, v0, v2

    .line 68
    new-array v5, v0, [I

    .line 69
    nop

    .line 70
    mul-int/lit8 v6, v0, 0x8

    add-int/lit8 v7, v6, 0x20

    new-array v7, v7, [I

    .line 71
    const/4 v8, 0x0

    const/4 v9, 0x4

    invoke-static {v7, v8, v9, v9}, Lcom/trueaxis/modmenu/QrCodeEncoder;->appendBits([IIII)I

    move-result v10

    .line 72
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

    .line 73
    const/4 v10, 0x0

    :goto_32
    array-length v11, p1

    if-ge v10, v11, :cond_40

    .line 74
    aget-byte v11, p1, v10

    and-int/lit16 v11, v11, 0xff

    invoke-static {v7, p0, v11, v13}, Lcom/trueaxis/modmenu/QrCodeEncoder;->appendBits([IIII)I

    move-result p0

    .line 73
    add-int/lit8 v10, v10, 0x1

    goto :goto_32

    .line 76
    :cond_40
    sub-int/2addr v6, p0

    invoke-static {v9, v6}, Ljava/lang/Math;->min(II)I

    move-result v6

    invoke-static {v7, p0, v8, v6}, Lcom/trueaxis/modmenu/QrCodeEncoder;->appendBits([IIII)I

    move-result p0

    .line 77
    :goto_49
    rem-int/lit8 v6, p0, 0x8

    const/4 v9, 0x1

    if-eqz v6, :cond_53

    .line 78
    invoke-static {v7, p0, v8, v9}, Lcom/trueaxis/modmenu/QrCodeEncoder;->appendBits([IIII)I

    move-result p0

    goto :goto_49

    .line 80
    :cond_53
    const/4 p0, 0x0

    :goto_54
    if-ge p0, v0, :cond_6b

    .line 81
    nop

    .line 82
    const/4 v6, 0x0

    const/4 v10, 0x0

    :goto_59
    if-ge v6, v13, :cond_66

    .line 83
    shl-int/lit8 v10, v10, 0x1

    mul-int/lit8 v11, p0, 0x8

    add-int/2addr v11, v6

    aget v11, v7, v11

    or-int/2addr v10, v11

    .line 82
    add-int/lit8 v6, v6, 0x1

    goto :goto_59

    .line 85
    :cond_66
    aput v10, v5, p0

    .line 80
    add-int/lit8 p0, p0, 0x1

    goto :goto_54

    .line 87
    :cond_6b
    array-length p0, p1

    :goto_6c
    if-ge p0, v0, :cond_7c

    .line 88
    rem-int/lit8 p1, p0, 0x2

    if-nez p1, :cond_75

    const/16 p1, 0xec

    goto :goto_77

    :cond_75
    const/16 p1, 0x11

    :goto_77
    aput p1, v5, p0

    .line 87
    add-int/lit8 p0, p0, 0x1

    goto :goto_6c

    .line 91
    :cond_7c
    new-array p0, v2, [[I

    .line 92
    nop

    .line 93
    const/4 p1, 0x0

    const/4 v6, 0x0

    :goto_81
    if-ge p1, v2, :cond_9d

    .line 94
    if-ge p1, v4, :cond_87

    const/4 v7, 0x1

    goto :goto_88

    :cond_87
    const/4 v7, 0x0

    :goto_88
    add-int/2addr v7, v3

    .line 95
    add-int v10, v7, v1

    new-array v10, v10, [I

    aput-object v10, p0, p1

    .line 96
    aget-object v10, p0, p1

    invoke-static {v5, v6, v10, v8, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 97
    add-int/2addr v6, v7

    .line 98
    aget-object v10, p0, p1

    invoke-static {v10, v7, v1}, Lcom/trueaxis/modmenu/QrCodeEncoder;->reedSolomon([III)V

    .line 93
    add-int/lit8 p1, p1, 0x1

    goto :goto_81

    .line 101
    :cond_9d
    mul-int p1, v2, v1

    add-int/2addr v0, p1

    .line 102
    new-array p1, v0, [I

    .line 103
    nop

    .line 104
    if-lez v4, :cond_a6

    goto :goto_a7

    :cond_a6
    const/4 v9, 0x0

    :goto_a7
    add-int/2addr v3, v9

    .line 105
    const/4 v0, 0x0

    const/4 v4, 0x0

    :goto_aa
    if-ge v0, v3, :cond_c4

    .line 106
    const/4 v5, 0x0

    :goto_ad
    if-ge v5, v2, :cond_c1

    .line 107
    aget-object v6, p0, v5

    array-length v6, v6

    sub-int/2addr v6, v1

    if-ge v0, v6, :cond_be

    .line 108
    add-int/lit8 v6, v4, 0x1

    aget-object v7, p0, v5

    aget v7, v7, v0

    aput v7, p1, v4

    move v4, v6

    .line 106
    :cond_be
    add-int/lit8 v5, v5, 0x1

    goto :goto_ad

    .line 105
    :cond_c1
    add-int/lit8 v0, v0, 0x1

    goto :goto_aa

    .line 112
    :cond_c4
    const/4 v0, 0x0

    :goto_c5
    if-ge v0, v1, :cond_de

    .line 113
    const/4 v3, 0x0

    :goto_c8
    if-ge v3, v2, :cond_db

    .line 114
    add-int/lit8 v5, v4, 0x1

    aget-object v6, p0, v3

    aget-object v7, p0, v3

    array-length v7, v7

    sub-int/2addr v7, v1

    add-int/2addr v7, v0

    aget v6, v6, v7

    aput v6, p1, v4

    .line 113
    add-int/lit8 v3, v3, 0x1

    move v4, v5

    goto :goto_c8

    .line 112
    :cond_db
    add-int/lit8 v0, v0, 0x1

    goto :goto_c5

    .line 117
    :cond_de
    return-object p1
.end method

.method private static maskPenalty([[Z)I
    .registers 11

    .line 357
    array-length v0, p0

    .line 358
    nop

    .line 359
    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_5
    const/4 v4, 0x5

    const/4 v5, 0x1

    if-ge v2, v0, :cond_30

    .line 360
    aget-object v6, p0, v2

    aget-boolean v6, v6, v1

    .line 361
    nop

    .line 362
    const/4 v7, 0x1

    const/4 v8, 0x1

    :goto_10
    if-ge v7, v0, :cond_28

    .line 363
    aget-object v9, p0, v2

    aget-boolean v9, v9, v7

    if-ne v9, v6, :cond_1b

    .line 364
    add-int/lit8 v8, v8, 0x1

    goto :goto_25

    .line 366
    :cond_1b
    if-lt v8, v4, :cond_20

    .line 367
    add-int/lit8 v8, v8, -0x2

    add-int/2addr v3, v8

    .line 369
    :cond_20
    aget-object v6, p0, v2

    aget-boolean v6, v6, v7

    .line 370
    const/4 v8, 0x1

    .line 362
    :goto_25
    add-int/lit8 v7, v7, 0x1

    goto :goto_10

    .line 373
    :cond_28
    if-lt v8, v4, :cond_2d

    .line 374
    add-int/lit8 v8, v8, -0x2

    add-int/2addr v3, v8

    .line 359
    :cond_2d
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    .line 377
    :cond_30
    const/4 v2, 0x0

    :goto_31
    if-ge v2, v0, :cond_5a

    .line 378
    aget-object v6, p0, v1

    aget-boolean v6, v6, v2

    .line 379
    nop

    .line 380
    const/4 v7, 0x1

    const/4 v8, 0x1

    :goto_3a
    if-ge v7, v0, :cond_52

    .line 381
    aget-object v9, p0, v7

    aget-boolean v9, v9, v2

    if-ne v9, v6, :cond_45

    .line 382
    add-int/lit8 v8, v8, 0x1

    goto :goto_4f

    .line 384
    :cond_45
    if-lt v8, v4, :cond_4a

    .line 385
    add-int/lit8 v8, v8, -0x2

    add-int/2addr v3, v8

    .line 387
    :cond_4a
    aget-object v6, p0, v7

    aget-boolean v6, v6, v2

    .line 388
    const/4 v8, 0x1

    .line 380
    :goto_4f
    add-int/lit8 v7, v7, 0x1

    goto :goto_3a

    .line 391
    :cond_52
    if-lt v8, v4, :cond_57

    .line 392
    add-int/lit8 v8, v8, -0x2

    add-int/2addr v3, v8

    .line 377
    :cond_57
    add-int/lit8 v2, v2, 0x1

    goto :goto_31

    .line 395
    :cond_5a
    return v3
.end method

.method private static placeDataBits([[Z[[Z[I)V
    .registers 19

    .line 121
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    array-length v2, v0

    .line 122
    nop

    .line 123
    array-length v3, v1

    mul-int/lit8 v3, v3, 0x8

    .line 124
    add-int/lit8 v4, v2, -0x1

    const/4 v5, 0x0

    move v6, v4

    const/4 v7, 0x0

    :goto_e
    const/4 v8, 0x1

    if-lt v6, v8, :cond_4f

    .line 125
    const/4 v9, 0x6

    if-ne v6, v9, :cond_15

    .line 126
    const/4 v6, 0x5

    .line 128
    :cond_15
    const/4 v9, 0x0

    :goto_16
    if-ge v9, v2, :cond_4c

    .line 129
    add-int/lit8 v10, v6, 0x1

    const/4 v11, 0x2

    div-int/2addr v10, v11

    rem-int/2addr v10, v11

    if-nez v10, :cond_22

    sub-int v10, v4, v9

    goto :goto_23

    :cond_22
    move v10, v9

    .line 130
    :goto_23
    const/4 v12, 0x0

    :goto_24
    if-ge v12, v11, :cond_49

    .line 131
    sub-int v13, v6, v12

    .line 132
    aget-object v14, p1, v10

    aget-boolean v14, v14, v13

    if-eqz v14, :cond_2f

    .line 133
    goto :goto_46

    .line 135
    :cond_2f
    if-ge v7, v3, :cond_46

    .line 136
    div-int/lit8 v14, v7, 0x8

    aget v14, v1, v14

    rem-int/lit8 v15, v7, 0x8

    rsub-int/lit8 v15, v15, 0x7

    ushr-int/2addr v14, v15

    and-int/2addr v14, v8

    .line 137
    aget-object v15, v0, v10

    if-ne v14, v8, :cond_41

    const/4 v14, 0x1

    goto :goto_42

    :cond_41
    const/4 v14, 0x0

    :goto_42
    aput-boolean v14, v15, v13

    .line 138
    add-int/lit8 v7, v7, 0x1

    .line 130
    :cond_46
    :goto_46
    add-int/lit8 v12, v12, 0x1

    goto :goto_24

    .line 128
    :cond_49
    add-int/lit8 v9, v9, 0x1

    goto :goto_16

    .line 124
    :cond_4c
    add-int/lit8 v6, v6, -0x2

    goto :goto_e

    .line 143
    :cond_4f
    return-void
.end method

.method private static reedSolomon([III)V
    .registers 13

    .line 153
    add-int/lit8 v0, p2, 0x1

    new-array v0, v0, [I

    .line 154
    const/4 v1, 0x0

    const/4 v2, 0x1

    aput v2, v0, v1

    .line 155
    nop

    .line 156
    const/4 v3, 0x0

    const/4 v4, 0x1

    :goto_b
    if-ge v3, p2, :cond_30

    .line 157
    move v5, p2

    :goto_e
    if-lt v5, v2, :cond_20

    .line 158
    aget v6, v0, v5

    invoke-static {v6, v4}, Lcom/trueaxis/modmenu/QrCodeEncoder;->gfMul(II)I

    move-result v6

    add-int/lit8 v7, v5, -0x1

    aget v7, v0, v7

    xor-int/2addr v6, v7

    aput v6, v0, v5

    .line 157
    add-int/lit8 v5, v5, -0x1

    goto :goto_e

    .line 160
    :cond_20
    aget v5, v0, v1

    invoke-static {v5, v4}, Lcom/trueaxis/modmenu/QrCodeEncoder;->gfMul(II)I

    move-result v5

    aput v5, v0, v1

    .line 161
    const/4 v5, 0x2

    invoke-static {v4, v5}, Lcom/trueaxis/modmenu/QrCodeEncoder;->gfMul(II)I

    move-result v4

    .line 156
    add-int/lit8 v3, v3, 0x1

    goto :goto_b

    .line 163
    :cond_30
    new-array v3, p2, [I

    .line 164
    const/4 v4, 0x0

    :goto_33
    if-ge v4, p1, :cond_56

    .line 165
    aget v5, p0, v4

    aget v6, v3, v1

    xor-int/2addr v5, v6

    .line 166
    add-int/lit8 v6, p2, -0x1

    invoke-static {v3, v2, v3, v1, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 167
    aput v1, v3, v6

    .line 168
    const/4 v6, 0x0

    :goto_42
    if-ge v6, p2, :cond_53

    .line 169
    aget v7, v3, v6

    add-int/lit8 v8, v6, 0x1

    aget v9, v0, v8

    invoke-static {v9, v5}, Lcom/trueaxis/modmenu/QrCodeEncoder;->gfMul(II)I

    move-result v9

    xor-int/2addr v7, v9

    aput v7, v3, v6

    .line 168
    move v6, v8

    goto :goto_42

    .line 164
    :cond_53
    add-int/lit8 v4, v4, 0x1

    goto :goto_33

    .line 172
    :cond_56
    invoke-static {v3, v1, p0, p1, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 173
    return-void
.end method

.method private static render([[ZI)Landroid/graphics/Bitmap;
    .registers 14

    .line 399
    array-length v0, p0

    .line 400
    nop

    .line 401
    add-int/lit8 v1, v0, 0x8

    .line 402
    div-int/2addr p1, v1

    const/4 v2, 0x1

    invoke-static {v2, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    .line 403
    mul-int v3, p1, v1

    .line 404
    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v3, v3, v4}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v3

    .line 405
    const/4 v4, 0x0

    const/4 v5, 0x0

    :goto_14
    if-ge v5, v1, :cond_4f

    .line 406
    const/4 v6, 0x0

    :goto_17
    if-ge v6, v1, :cond_4c

    .line 407
    add-int/lit8 v7, v6, -0x4

    .line 408
    add-int/lit8 v8, v5, -0x4

    .line 409
    if-ltz v7, :cond_2d

    if-ltz v8, :cond_2d

    if-ge v7, v0, :cond_2d

    if-ge v8, v0, :cond_2d

    aget-object v8, p0, v8

    aget-boolean v7, v8, v7

    if-eqz v7, :cond_2d

    const/4 v7, 0x1

    goto :goto_2e

    :cond_2d
    const/4 v7, 0x0

    .line 410
    :goto_2e
    if-eqz v7, :cond_33

    const/high16 v7, -0x1000000

    goto :goto_34

    :cond_33
    const/4 v7, -0x1

    .line 411
    :goto_34
    const/4 v8, 0x0

    :goto_35
    if-ge v8, p1, :cond_49

    .line 412
    const/4 v9, 0x0

    :goto_38
    if-ge v9, p1, :cond_46

    .line 413
    mul-int v10, v6, p1

    add-int/2addr v10, v9

    mul-int v11, v5, p1

    add-int/2addr v11, v8

    invoke-virtual {v3, v10, v11, v7}, Landroid/graphics/Bitmap;->setPixel(III)V

    .line 412
    add-int/lit8 v9, v9, 0x1

    goto :goto_38

    .line 411
    :cond_46
    add-int/lit8 v8, v8, 0x1

    goto :goto_35

    .line 406
    :cond_49
    add-int/lit8 v6, v6, 0x1

    goto :goto_17

    .line 405
    :cond_4c
    add-int/lit8 v5, v5, 0x1

    goto :goto_14

    .line 418
    :cond_4f
    return-object v3
.end method

.method private static setModule([[Z[[ZIIZ)V
    .registers 5

    .line 252
    aget-object p0, p0, p3

    aput-boolean p4, p0, p2

    .line 253
    aget-object p0, p1, p3

    const/4 p1, 0x1

    aput-boolean p1, p0, p2

    .line 254
    return-void
.end method
