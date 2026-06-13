.class public Lcom/google/android/gms/ads/internal/overlay/zzw;
.super Ljava/lang/Thread;

# interfaces
.implements Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;
.implements Lcom/google/android/gms/ads/internal/overlay/zzv$zza;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzin;
.end annotation


# static fields
.field private static final zzbur:[F


# instance fields
.field private zzaie:I

.field private zzaif:I

.field private final zzbun:[F

.field private final zzbus:Lcom/google/android/gms/ads/internal/overlay/zzv;

.field private final zzbut:[F

.field private final zzbuu:[F

.field private final zzbuv:[F

.field private final zzbuw:[F

.field private final zzbux:[F

.field private final zzbuy:[F

.field private zzbuz:F

.field private zzbva:F

.field private zzbvb:F

.field private zzbvc:Landroid/graphics/SurfaceTexture;

.field private zzbvd:Landroid/graphics/SurfaceTexture;

.field private zzbve:I

.field private zzbvf:I

.field private zzbvg:I

.field private zzbvh:Ljava/nio/FloatBuffer;

.field private final zzbvi:Ljava/util/concurrent/CountDownLatch;

.field private final zzbvj:Ljava/lang/Object;

.field private zzbvk:Ljavax/microedition/khronos/egl/EGL10;

.field private zzbvl:Ljavax/microedition/khronos/egl/EGLDisplay;

.field private zzbvm:Ljavax/microedition/khronos/egl/EGLContext;

.field private zzbvn:Ljavax/microedition/khronos/egl/EGLSurface;

.field private volatile zzbvo:Z

.field private volatile zzbvp:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0xc

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    sput-object v0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbur:[F

    return-void

    :array_0
    .array-data 4
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        -0x40800000    # -1.0f
    .end array-data
.end method

.method constructor <init>(Landroid/content/Context;)V
    .locals 2

    const-string v0, "SphericalVideoProcessor"

    invoke-direct {p0, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    sget-object v0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbur:[F

    array-length v0, v0

    mul-int/lit8 v0, v0, 0x4

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvh:Ljava/nio/FloatBuffer;

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvh:Ljava/nio/FloatBuffer;

    sget-object v1, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbur:[F

    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    const/16 v0, 0x9

    new-array v1, v0, [F

    iput-object v1, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbun:[F

    new-array v1, v0, [F

    iput-object v1, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbut:[F

    new-array v1, v0, [F

    iput-object v1, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbuu:[F

    new-array v1, v0, [F

    iput-object v1, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbuv:[F

    new-array v1, v0, [F

    iput-object v1, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbuw:[F

    new-array v1, v0, [F

    iput-object v1, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbux:[F

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbuy:[F

    const/high16 v0, 0x7fc00000    # Float.NaN

    iput v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbuz:F

    new-instance v0, Lcom/google/android/gms/ads/internal/overlay/zzv;

    invoke-direct {v0, p1}, Lcom/google/android/gms/ads/internal/overlay/zzv;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbus:Lcom/google/android/gms/ads/internal/overlay/zzv;

    iget-object p1, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbus:Lcom/google/android/gms/ads/internal/overlay/zzv;

    invoke-virtual {p1, p0}, Lcom/google/android/gms/ads/internal/overlay/zzv;->zza(Lcom/google/android/gms/ads/internal/overlay/zzv$zza;)V

    new-instance p1, Ljava/util/concurrent/CountDownLatch;

    const/4 v0, 0x1

    invoke-direct {p1, v0}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    iput-object p1, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvi:Ljava/util/concurrent/CountDownLatch;

    new-instance p1, Ljava/lang/Object;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvj:Ljava/lang/Object;

    return-void
.end method

.method private zza([FF)V
    .locals 5

    const/4 v0, 0x0

    const/high16 v1, 0x3f800000    # 1.0f

    aput v1, p1, v0

    const/4 v0, 0x0

    const/4 v1, 0x1

    aput v0, p1, v1

    const/4 v1, 0x2

    aput v0, p1, v1

    const/4 v1, 0x3

    aput v0, p1, v1

    float-to-double v1, p2

    invoke-static {v1, v2}, Ljava/lang/Math;->cos(D)D

    move-result-wide v3

    double-to-float p2, v3

    const/4 v3, 0x4

    aput p2, p1, v3

    invoke-static {v1, v2}, Ljava/lang/Math;->sin(D)D

    move-result-wide v3

    neg-double v3, v3

    double-to-float p2, v3

    const/4 v3, 0x5

    aput p2, p1, v3

    const/4 p2, 0x6

    aput v0, p1, p2

    invoke-static {v1, v2}, Ljava/lang/Math;->sin(D)D

    move-result-wide v3

    double-to-float p2, v3

    const/4 v0, 0x7

    aput p2, p1, v0

    invoke-static {v1, v2}, Ljava/lang/Math;->cos(D)D

    move-result-wide v0

    double-to-float p2, v0

    const/16 v0, 0x8

    aput p2, p1, v0

    return-void
.end method

.method private zza([F[F[F)V
    .locals 12

    const/4 v0, 0x0

    aget v1, p2, v0

    aget v2, p3, v0

    mul-float v1, v1, v2

    const/4 v2, 0x1

    aget v3, p2, v2

    const/4 v4, 0x3

    aget v5, p3, v4

    mul-float v3, v3, v5

    add-float/2addr v1, v3

    const/4 v3, 0x2

    aget v5, p2, v3

    const/4 v6, 0x6

    aget v7, p3, v6

    mul-float v5, v5, v7

    add-float/2addr v1, v5

    aput v1, p1, v0

    aget v1, p2, v0

    aget v5, p3, v2

    mul-float v1, v1, v5

    aget v5, p2, v2

    const/4 v7, 0x4

    aget v8, p3, v7

    mul-float v5, v5, v8

    add-float/2addr v1, v5

    aget v5, p2, v3

    const/4 v8, 0x7

    aget v9, p3, v8

    mul-float v5, v5, v9

    add-float/2addr v1, v5

    aput v1, p1, v2

    aget v1, p2, v0

    aget v5, p3, v3

    mul-float v1, v1, v5

    aget v5, p2, v2

    const/4 v9, 0x5

    aget v10, p3, v9

    mul-float v5, v5, v10

    add-float/2addr v1, v5

    aget v5, p2, v3

    const/16 v10, 0x8

    aget v11, p3, v10

    mul-float v5, v5, v11

    add-float/2addr v1, v5

    aput v1, p1, v3

    aget v1, p2, v4

    aget v5, p3, v0

    mul-float v1, v1, v5

    aget v5, p2, v7

    aget v11, p3, v4

    mul-float v5, v5, v11

    add-float/2addr v1, v5

    aget v5, p2, v9

    aget v11, p3, v6

    mul-float v5, v5, v11

    add-float/2addr v1, v5

    aput v1, p1, v4

    aget v1, p2, v4

    aget v5, p3, v2

    mul-float v1, v1, v5

    aget v5, p2, v7

    aget v11, p3, v7

    mul-float v5, v5, v11

    add-float/2addr v1, v5

    aget v5, p2, v9

    aget v11, p3, v8

    mul-float v5, v5, v11

    add-float/2addr v1, v5

    aput v1, p1, v7

    aget v1, p2, v4

    aget v5, p3, v3

    mul-float v1, v1, v5

    aget v5, p2, v7

    aget v11, p3, v9

    mul-float v5, v5, v11

    add-float/2addr v1, v5

    aget v5, p2, v9

    aget v11, p3, v10

    mul-float v5, v5, v11

    add-float/2addr v1, v5

    aput v1, p1, v9

    aget v1, p2, v6

    aget v0, p3, v0

    mul-float v1, v1, v0

    aget v0, p2, v8

    aget v4, p3, v4

    mul-float v0, v0, v4

    add-float/2addr v1, v0

    aget v0, p2, v10

    aget v4, p3, v6

    mul-float v0, v0, v4

    add-float/2addr v1, v0

    aput v1, p1, v6

    aget v0, p2, v6

    aget v1, p3, v2

    mul-float v0, v0, v1

    aget v1, p2, v8

    aget v2, p3, v7

    mul-float v1, v1, v2

    add-float/2addr v0, v1

    aget v1, p2, v10

    aget v2, p3, v8

    mul-float v1, v1, v2

    add-float/2addr v0, v1

    aput v0, p1, v8

    aget v0, p2, v6

    aget v1, p3, v3

    mul-float v0, v0, v1

    aget v1, p2, v8

    aget v2, p3, v9

    mul-float v1, v1, v2

    add-float/2addr v0, v1

    aget p2, p2, v10

    aget p3, p3, v10

    mul-float p2, p2, p3

    add-float/2addr v0, p2

    aput v0, p1, v10

    return-void
.end method

.method private zza([F[F)[F
    .locals 8

    const/4 v0, 0x3

    new-array v1, v0, [F

    const/4 v2, 0x0

    aget v3, p1, v2

    aget v4, p2, v2

    mul-float v3, v3, v4

    const/4 v4, 0x1

    aget v5, p1, v4

    aget v6, p2, v4

    mul-float v5, v5, v6

    add-float/2addr v3, v5

    const/4 v5, 0x2

    aget v6, p1, v5

    aget v7, p2, v5

    mul-float v6, v6, v7

    add-float/2addr v3, v6

    aput v3, v1, v2

    aget v0, p1, v0

    aget v3, p2, v2

    mul-float v0, v0, v3

    const/4 v3, 0x4

    aget v3, p1, v3

    aget v6, p2, v4

    mul-float v3, v3, v6

    add-float/2addr v0, v3

    const/4 v3, 0x5

    aget v3, p1, v3

    aget v6, p2, v5

    mul-float v3, v3, v6

    add-float/2addr v0, v3

    aput v0, v1, v4

    const/4 v0, 0x6

    aget v0, p1, v0

    aget v2, p2, v2

    mul-float v0, v0, v2

    const/4 v2, 0x7

    aget v2, p1, v2

    aget v3, p2, v4

    mul-float v2, v2, v3

    add-float/2addr v0, v2

    const/16 v2, 0x8

    aget p1, p1, v2

    aget p2, p2, v5

    mul-float p1, p1, p2

    add-float/2addr v0, p1

    aput v0, v1, v5

    return-object v1
.end method

.method private zzb([FF)V
    .locals 4

    float-to-double v0, p2

    invoke-static {v0, v1}, Ljava/lang/Math;->cos(D)D

    move-result-wide v2

    double-to-float p2, v2

    const/4 v2, 0x0

    aput p2, p1, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->sin(D)D

    move-result-wide v2

    neg-double v2, v2

    double-to-float p2, v2

    const/4 v2, 0x1

    aput p2, p1, v2

    const/4 p2, 0x0

    const/4 v2, 0x2

    aput p2, p1, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->sin(D)D

    move-result-wide v2

    double-to-float v2, v2

    const/4 v3, 0x3

    aput v2, p1, v3

    invoke-static {v0, v1}, Ljava/lang/Math;->cos(D)D

    move-result-wide v0

    double-to-float v0, v0

    const/4 v1, 0x4

    aput v0, p1, v1

    const/4 v0, 0x5

    aput p2, p1, v0

    const/4 v0, 0x6

    aput p2, p1, v0

    const/4 v0, 0x7

    aput p2, p1, v0

    const/16 p2, 0x8

    const/high16 v0, 0x3f800000    # 1.0f

    aput v0, p1, p2

    return-void
.end method

.method private zzbx(Ljava/lang/String;)V
    .locals 3

    invoke-static {}, Landroid/opengl/GLES20;->glGetError()I

    move-result v0

    if-eqz v0, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, 0x15

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ": glError "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "SphericalVideoRenderer"

    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    return-void
.end method

.method private zzc([F)F
    .locals 4

    const/4 v0, 0x3

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/ads/internal/overlay/zzw;->zza([F[F)[F

    move-result-object p1

    const/4 v0, 0x1

    aget v0, p1, v0

    float-to-double v0, v0

    const/4 v2, 0x0

    aget p1, p1, v2

    float-to-double v2, p1

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v0

    double-to-float p1, v0

    const v0, 0x3fc90fdb

    sub-float/2addr p1, v0

    return p1

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method private zzc(ILjava/lang/String;)I
    .locals 3

    invoke-static {p1}, Landroid/opengl/GLES20;->glCreateShader(I)I

    move-result v0

    const-string v1, "createShader"

    invoke-direct {p0, v1}, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbx(Ljava/lang/String;)V

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-static {v0, p2}, Landroid/opengl/GLES20;->glShaderSource(ILjava/lang/String;)V

    const-string p2, "shaderSource"

    invoke-direct {p0, p2}, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbx(Ljava/lang/String;)V

    invoke-static {v0}, Landroid/opengl/GLES20;->glCompileShader(I)V

    const-string p2, "compileShader"

    invoke-direct {p0, p2}, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbx(Ljava/lang/String;)V

    const/4 p2, 0x1

    new-array p2, p2, [I

    const v2, 0x8b81

    invoke-static {v0, v2, p2, v1}, Landroid/opengl/GLES20;->glGetShaderiv(II[II)V

    const-string v2, "getShaderiv"

    invoke-direct {p0, v2}, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbx(Ljava/lang/String;)V

    aget p2, p2, v1

    if-nez p2, :cond_0

    new-instance p2, Ljava/lang/StringBuilder;

    const/16 v2, 0x25

    invoke-direct {p2, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v2, "Could not compile shader "

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ":"

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "SphericalVideoRenderer"

    invoke-static {p2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {v0}, Landroid/opengl/GLES20;->glGetShaderInfoLog(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {v0}, Landroid/opengl/GLES20;->glDeleteShader(I)V

    const-string p1, "deleteShader"

    invoke-direct {p0, p1}, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbx(Ljava/lang/String;)V

    const/4 v0, 0x0

    :cond_0
    return v0
.end method

.method private zzoz()V
    .locals 5

    iget v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzaie:I

    iget v1, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzaif:I

    const/4 v2, 0x0

    invoke-static {v2, v2, v0, v1}, Landroid/opengl/GLES20;->glViewport(IIII)V

    const-string v0, "viewport"

    invoke-direct {p0, v0}, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbx(Ljava/lang/String;)V

    iget v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbve:I

    const-string v1, "uFOVx"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iget v1, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbve:I

    const-string v2, "uFOVy"

    invoke-static {v1, v2}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v1

    iget v2, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzaie:I

    iget v3, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzaif:I

    const v4, 0x3f5f66f3

    if-le v2, v3, :cond_0

    invoke-static {v0, v4}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    iget v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzaif:I

    int-to-float v0, v0

    mul-float v0, v0, v4

    iget v2, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzaie:I

    int-to-float v2, v2

    div-float/2addr v0, v2

    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    goto :goto_0

    :cond_0
    int-to-float v2, v2

    mul-float v2, v2, v4

    int-to-float v3, v3

    div-float/2addr v2, v3

    invoke-static {v0, v2}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    invoke-static {v1, v4}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    :goto_0
    return-void
.end method

.method private zzpb()I
    .locals 5

    invoke-direct {p0}, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzpe()Ljava/lang/String;

    move-result-object v0

    const v1, 0x8b31

    invoke-direct {p0, v1, v0}, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzc(ILjava/lang/String;)I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    const v2, 0x8b30

    invoke-direct {p0}, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzpf()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v2, v3}, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzc(ILjava/lang/String;)I

    move-result v2

    if-nez v2, :cond_1

    return v1

    :cond_1
    invoke-static {}, Landroid/opengl/GLES20;->glCreateProgram()I

    move-result v3

    const-string v4, "createProgram"

    invoke-direct {p0, v4}, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbx(Ljava/lang/String;)V

    if-eqz v3, :cond_3

    invoke-static {v3, v0}, Landroid/opengl/GLES20;->glAttachShader(II)V

    const-string v0, "attachShader"

    invoke-direct {p0, v0}, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbx(Ljava/lang/String;)V

    invoke-static {v3, v2}, Landroid/opengl/GLES20;->glAttachShader(II)V

    invoke-direct {p0, v0}, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbx(Ljava/lang/String;)V

    invoke-static {v3}, Landroid/opengl/GLES20;->glLinkProgram(I)V

    const-string v0, "linkProgram"

    invoke-direct {p0, v0}, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbx(Ljava/lang/String;)V

    const/4 v0, 0x1

    new-array v2, v0, [I

    const v4, 0x8b82

    invoke-static {v3, v4, v2, v1}, Landroid/opengl/GLES20;->glGetProgramiv(II[II)V

    const-string v4, "getProgramiv"

    invoke-direct {p0, v4}, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbx(Ljava/lang/String;)V

    aget v2, v2, v1

    if-eq v2, v0, :cond_2

    const-string v0, "SphericalVideoRenderer"

    const-string v2, "Could not link program: "

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {v3}, Landroid/opengl/GLES20;->glGetProgramInfoLog(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {v3}, Landroid/opengl/GLES20;->glDeleteProgram(I)V

    const-string v0, "deleteProgram"

    invoke-direct {p0, v0}, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbx(Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    invoke-static {v3}, Landroid/opengl/GLES20;->glValidateProgram(I)V

    const-string v0, "validateProgram"

    invoke-direct {p0, v0}, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbx(Ljava/lang/String;)V

    :cond_3
    move v1, v3

    :goto_0
    return v1
.end method

.method private zzpd()Ljavax/microedition/khronos/egl/EGLConfig;
    .locals 8

    const/4 v0, 0x1

    new-array v7, v0, [I

    new-array v0, v0, [Ljavax/microedition/khronos/egl/EGLConfig;

    const/16 v1, 0xb

    new-array v3, v1, [I

    fill-array-data v3, :array_0

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvk:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvl:Ljavax/microedition/khronos/egl/EGLDisplay;

    const/4 v5, 0x1

    move-object v4, v0

    move-object v6, v7

    invoke-interface/range {v1 .. v6}, Ljavax/microedition/khronos/egl/EGL10;->eglChooseConfig(Ljavax/microedition/khronos/egl/EGLDisplay;[I[Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    return-object v2

    :cond_0
    const/4 v1, 0x0

    aget v3, v7, v1

    if-lez v3, :cond_1

    aget-object v0, v0, v1

    return-object v0

    :cond_1
    return-object v2

    :array_0
    .array-data 4
        0x3040
        0x4
        0x3024
        0x8
        0x3023
        0x8
        0x3022
        0x8
        0x3025
        0x10
        0x3038
    .end array-data
.end method

.method private zzpe()Ljava/lang/String;
    .locals 3

    sget-object v0, Lcom/google/android/gms/internal/zzdc;->zzbam:Lcom/google/android/gms/internal/zzcy;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzcy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzcy;->zzjw()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzcy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0

    :cond_0
    const-string v0, "attribute highp vec3 aPosition;varying vec3 pos;void main() {  gl_Position = vec4(aPosition, 1.0);  pos = aPosition;}"

    return-object v0
.end method

.method private zzpf()Ljava/lang/String;
    .locals 3

    sget-object v0, Lcom/google/android/gms/internal/zzdc;->zzban:Lcom/google/android/gms/internal/zzcy;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzcy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzcy;->zzjw()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzcy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0

    :cond_0
    const-string v0, "#extension GL_OES_EGL_image_external : require\n#define INV_PI 0.3183\nprecision highp float;varying vec3 pos;uniform samplerExternalOES uSplr;uniform mat3 uVMat;uniform float uFOVx;uniform float uFOVy;void main() {  vec3 ray = vec3(pos.x * tan(uFOVx), pos.y * tan(uFOVy), -1);  ray = (uVMat * ray).xyz;  ray = normalize(ray);  vec2 texCrd = vec2(    0.5 + atan(ray.x, - ray.z) * INV_PI * 0.5, acos(ray.y) * INV_PI);  gl_FragColor = vec4(texture2D(uSplr, texCrd).xyz, 1.0);}"

    return-object v0
.end method


# virtual methods
.method public onFrameAvailable(Landroid/graphics/SurfaceTexture;)V
    .locals 1

    iget p1, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvg:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvg:I

    iget-object p1, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvj:Ljava/lang/Object;

    monitor-enter p1

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvj:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    monitor-exit p1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public run()V
    .locals 5

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvd:Landroid/graphics/SurfaceTexture;

    if-nez v0, :cond_0

    const-string v0, "SphericalVideoProcessor started with no output texture."

    invoke-static {v0}, Lcom/google/android/gms/internal/zzkd;->e(Ljava/lang/String;)V

    :goto_0
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvi:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzpc()Z

    move-result v0

    invoke-virtual {p0}, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzpa()I

    move-result v1

    iget v2, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbve:I

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_1

    const/4 v2, 0x1

    goto :goto_1

    :cond_1
    const/4 v2, 0x0

    :goto_1
    if-eqz v0, :cond_6

    if-nez v2, :cond_2

    goto/16 :goto_5

    :cond_2
    new-instance v0, Landroid/graphics/SurfaceTexture;

    invoke-direct {v0, v1}, Landroid/graphics/SurfaceTexture;-><init>(I)V

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvc:Landroid/graphics/SurfaceTexture;

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvc:Landroid/graphics/SurfaceTexture;

    invoke-virtual {v0, p0}, Landroid/graphics/SurfaceTexture;->setOnFrameAvailableListener(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvi:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbus:Lcom/google/android/gms/ads/internal/overlay/zzv;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/overlay/zzv;->start()V

    const/4 v0, 0x0

    :try_start_0
    iput-boolean v4, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvo:Z

    :catch_0
    :goto_2
    iget-boolean v1, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvp:Z

    if-nez v1, :cond_5

    invoke-virtual {p0}, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzoy()V

    iget-boolean v1, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvo:Z

    if-eqz v1, :cond_3

    invoke-direct {p0}, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzoz()V

    iput-boolean v3, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvo:Z
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :cond_3
    :try_start_1
    iget-object v1, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvj:Ljava/lang/Object;

    monitor-enter v1
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :try_start_2
    iget-boolean v2, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvp:Z

    if-nez v2, :cond_4

    iget-boolean v2, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvo:Z

    if-nez v2, :cond_4

    iget v2, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvg:I

    if-nez v2, :cond_4

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvj:Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/lang/Object;->wait()V

    :cond_4
    monitor-exit v1

    goto :goto_2

    :catchall_0
    move-exception v2

    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    throw v2
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/lang/IllegalStateException; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :cond_5
    :goto_3
    iget-object v1, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbus:Lcom/google/android/gms/ads/internal/overlay/zzv;

    invoke-virtual {v1}, Lcom/google/android/gms/ads/internal/overlay/zzv;->stop()V

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvc:Landroid/graphics/SurfaceTexture;

    invoke-virtual {v1, v0}, Landroid/graphics/SurfaceTexture;->setOnFrameAvailableListener(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;)V

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvc:Landroid/graphics/SurfaceTexture;

    invoke-virtual {p0}, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzpg()Z

    goto :goto_4

    :catchall_1
    move-exception v1

    :try_start_4
    const-string v2, "SphericalVideoProcessor died."

    invoke-static {v2, v1}, Lcom/google/android/gms/internal/zzkd;->zzb(Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzft()Lcom/google/android/gms/internal/zzjx;

    move-result-object v2

    invoke-virtual {v2, v1, v4}, Lcom/google/android/gms/internal/zzjx;->zzb(Ljava/lang/Throwable;Z)V

    goto :goto_3

    :catch_1
    const-string v1, "SphericalVideoProcessor halted unexpectedly."

    invoke-static {v1}, Lcom/google/android/gms/internal/zzkd;->zzcx(Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    goto :goto_3

    :goto_4
    return-void

    :catchall_2
    move-exception v1

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbus:Lcom/google/android/gms/ads/internal/overlay/zzv;

    invoke-virtual {v2}, Lcom/google/android/gms/ads/internal/overlay/zzv;->stop()V

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvc:Landroid/graphics/SurfaceTexture;

    invoke-virtual {v2, v0}, Landroid/graphics/SurfaceTexture;->setOnFrameAvailableListener(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;)V

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvc:Landroid/graphics/SurfaceTexture;

    invoke-virtual {p0}, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzpg()Z

    throw v1

    :cond_6
    :goto_5
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvk:Ljavax/microedition/khronos/egl/EGL10;

    invoke-interface {v0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetError()I

    move-result v0

    invoke-static {v0}, Landroid/opengl/GLUtils;->getEGLErrorString(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "EGL initialization failed: "

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_7

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_6

    :cond_7
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    :goto_6
    invoke-static {v0}, Lcom/google/android/gms/internal/zzkd;->e(Ljava/lang/String;)V

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzft()Lcom/google/android/gms/internal/zzjx;

    move-result-object v1

    new-instance v2, Ljava/lang/Throwable;

    invoke-direct {v2, v0}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2, v4}, Lcom/google/android/gms/internal/zzjx;->zzb(Ljava/lang/Throwable;Z)V

    invoke-virtual {p0}, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzpg()Z

    goto/16 :goto_0
.end method

.method zza(Landroid/graphics/SurfaceTexture;II)V
    .locals 0

    iput p2, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzaie:I

    iput p3, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzaif:I

    iput-object p1, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvd:Landroid/graphics/SurfaceTexture;

    return-void
.end method

.method zzb(FF)V
    .locals 3

    iget v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzaie:I

    iget v1, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzaif:I

    const v2, 0x3fdf66f3

    mul-float p1, p1, v2

    if-le v0, v1, :cond_0

    int-to-float v1, v0

    div-float/2addr p1, v1

    mul-float p2, p2, v2

    int-to-float v0, v0

    goto :goto_0

    :cond_0
    int-to-float v0, v1

    div-float/2addr p1, v0

    mul-float p2, p2, v2

    int-to-float v0, v1

    :goto_0
    div-float/2addr p2, v0

    iget v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbva:F

    sub-float/2addr v0, p1

    iput v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbva:F

    iget p1, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvb:F

    sub-float/2addr p1, p2

    iput p1, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvb:F

    iget p1, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvb:F

    const p2, -0x4036f025

    cmpg-float p1, p1, p2

    if-gez p1, :cond_1

    iput p2, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvb:F

    :cond_1
    iget p1, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvb:F

    const p2, 0x3fc90fdb

    cmpl-float p1, p1, p2

    if-lez p1, :cond_2

    iput p2, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvb:F

    :cond_2
    return-void
.end method

.method zzg(II)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvj:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iput p1, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzaie:I

    iput p2, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzaif:I

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvo:Z

    iget-object p1, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvj:Ljava/lang/Object;

    invoke-virtual {p1}, Ljava/lang/Object;->notifyAll()V

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public zznz()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvj:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvj:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method zzow()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvj:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x1

    :try_start_0
    iput-boolean v1, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvp:Z

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvd:Landroid/graphics/SurfaceTexture;

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvj:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public zzox()Landroid/graphics/SurfaceTexture;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvd:Landroid/graphics/SurfaceTexture;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvi:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->await()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvc:Landroid/graphics/SurfaceTexture;

    return-object v0
.end method

.method zzoy()V
    .locals 4

    :goto_0
    iget v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvg:I

    const/4 v1, 0x1

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvc:Landroid/graphics/SurfaceTexture;

    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->updateTexImage()V

    iget v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvg:I

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvg:I

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbus:Lcom/google/android/gms/ads/internal/overlay/zzv;

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbun:[F

    invoke-virtual {v0, v2}, Lcom/google/android/gms/ads/internal/overlay/zzv;->zzb([F)Z

    move-result v0

    if-eqz v0, :cond_2

    iget v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbuz:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbun:[F

    invoke-direct {p0, v0}, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzc([F)F

    move-result v0

    neg-float v0, v0

    iput v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbuz:F

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbux:[F

    iget v2, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbuz:F

    iget v3, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbva:F

    add-float/2addr v2, v3

    invoke-direct {p0, v0, v2}, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzb([FF)V

    goto :goto_1

    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbun:[F

    const v2, -0x4036f025

    invoke-direct {p0, v0, v2}, Lcom/google/android/gms/ads/internal/overlay/zzw;->zza([FF)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbux:[F

    iget v2, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbva:F

    invoke-direct {p0, v0, v2}, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzb([FF)V

    :goto_1
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbut:[F

    const v2, 0x3fc90fdb

    invoke-direct {p0, v0, v2}, Lcom/google/android/gms/ads/internal/overlay/zzw;->zza([FF)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbuu:[F

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbux:[F

    iget-object v3, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbut:[F

    invoke-direct {p0, v0, v2, v3}, Lcom/google/android/gms/ads/internal/overlay/zzw;->zza([F[F[F)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbuv:[F

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbun:[F

    iget-object v3, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbuu:[F

    invoke-direct {p0, v0, v2, v3}, Lcom/google/android/gms/ads/internal/overlay/zzw;->zza([F[F[F)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbuw:[F

    iget v2, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvb:F

    invoke-direct {p0, v0, v2}, Lcom/google/android/gms/ads/internal/overlay/zzw;->zza([FF)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbuy:[F

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbuw:[F

    iget-object v3, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbuv:[F

    invoke-direct {p0, v0, v2, v3}, Lcom/google/android/gms/ads/internal/overlay/zzw;->zza([F[F[F)V

    iget v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvf:I

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbuy:[F

    const/4 v3, 0x0

    invoke-static {v0, v1, v3, v2, v3}, Landroid/opengl/GLES20;->glUniformMatrix3fv(IIZ[FI)V

    const/4 v0, 0x5

    const/4 v1, 0x4

    invoke-static {v0, v3, v1}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    const-string v0, "drawArrays"

    invoke-direct {p0, v0}, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbx(Ljava/lang/String;)V

    invoke-static {}, Landroid/opengl/GLES20;->glFinish()V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvk:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvl:Ljavax/microedition/khronos/egl/EGLDisplay;

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvn:Ljavax/microedition/khronos/egl/EGLSurface;

    invoke-interface {v0, v1, v2}, Ljavax/microedition/khronos/egl/EGL10;->eglSwapBuffers(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)Z

    return-void
.end method

.method zzpa()I
    .locals 8

    invoke-direct {p0}, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzpb()I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbve:I

    iget v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbve:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    const-string v0, "useProgram"

    invoke-direct {p0, v0}, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbx(Ljava/lang/String;)V

    iget v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbve:I

    const-string v1, "aPosition"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    move-result v0

    iget-object v7, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvh:Ljava/nio/FloatBuffer;

    const/4 v3, 0x3

    const/16 v4, 0x1406

    const/4 v5, 0x0

    const/16 v6, 0xc

    move v2, v0

    invoke-static/range {v2 .. v7}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    const-string v1, "vertexAttribPointer"

    invoke-direct {p0, v1}, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbx(Ljava/lang/String;)V

    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    const-string v0, "enableVertexAttribArray"

    invoke-direct {p0, v0}, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbx(Ljava/lang/String;)V

    const/4 v0, 0x1

    new-array v1, v0, [I

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    const-string v3, "genTextures"

    invoke-direct {p0, v3}, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbx(Ljava/lang/String;)V

    aget v1, v1, v2

    const v3, 0x8d65

    invoke-static {v3, v1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    const-string v4, "bindTextures"

    invoke-direct {p0, v4}, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbx(Ljava/lang/String;)V

    const/16 v4, 0x2601

    const/16 v5, 0x2800

    invoke-static {v3, v5, v4}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    const-string v5, "texParameteri"

    invoke-direct {p0, v5}, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbx(Ljava/lang/String;)V

    const/16 v6, 0x2801

    invoke-static {v3, v6, v4}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    invoke-direct {p0, v5}, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbx(Ljava/lang/String;)V

    const v4, 0x812f

    const/16 v6, 0x2802

    invoke-static {v3, v6, v4}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    invoke-direct {p0, v5}, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbx(Ljava/lang/String;)V

    const/16 v6, 0x2803

    invoke-static {v3, v6, v4}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    invoke-direct {p0, v5}, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbx(Ljava/lang/String;)V

    iget v3, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbve:I

    const-string v4, "uVMat"

    invoke-static {v3, v4}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v3

    iput v3, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvf:I

    const/16 v3, 0x9

    new-array v3, v3, [F

    fill-array-data v3, :array_0

    iget v4, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvf:I

    invoke-static {v4, v0, v2, v3, v2}, Landroid/opengl/GLES20;->glUniformMatrix3fv(IIZ[FI)V

    return v1

    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method zzpc()Z
    .locals 6

    invoke-static {}, Ljavax/microedition/khronos/egl/EGLContext;->getEGL()Ljavax/microedition/khronos/egl/EGL;

    move-result-object v0

    check-cast v0, Ljavax/microedition/khronos/egl/EGL10;

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvk:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvk:Ljavax/microedition/khronos/egl/EGL10;

    sget-object v1, Ljavax/microedition/khronos/egl/EGL10;->EGL_DEFAULT_DISPLAY:Ljava/lang/Object;

    invoke-interface {v0, v1}, Ljavax/microedition/khronos/egl/EGL10;->eglGetDisplay(Ljava/lang/Object;)Ljavax/microedition/khronos/egl/EGLDisplay;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvl:Ljavax/microedition/khronos/egl/EGLDisplay;

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvl:Ljavax/microedition/khronos/egl/EGLDisplay;

    sget-object v1, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_DISPLAY:Ljavax/microedition/khronos/egl/EGLDisplay;

    const/4 v2, 0x0

    if-ne v0, v1, :cond_0

    return v2

    :cond_0
    const/4 v0, 0x2

    new-array v0, v0, [I

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvk:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v3, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvl:Ljavax/microedition/khronos/egl/EGLDisplay;

    invoke-interface {v1, v3, v0}, Ljavax/microedition/khronos/egl/EGL10;->eglInitialize(Ljavax/microedition/khronos/egl/EGLDisplay;[I)Z

    move-result v0

    if-nez v0, :cond_1

    return v2

    :cond_1
    invoke-direct {p0}, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzpd()Ljavax/microedition/khronos/egl/EGLConfig;

    move-result-object v0

    if-nez v0, :cond_2

    return v2

    :cond_2
    const/4 v1, 0x3

    new-array v1, v1, [I

    fill-array-data v1, :array_0

    iget-object v3, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvk:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v4, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvl:Ljavax/microedition/khronos/egl/EGLDisplay;

    sget-object v5, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    invoke-interface {v3, v4, v0, v5, v1}, Ljavax/microedition/khronos/egl/EGL10;->eglCreateContext(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;Ljavax/microedition/khronos/egl/EGLContext;[I)Ljavax/microedition/khronos/egl/EGLContext;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvm:Ljavax/microedition/khronos/egl/EGLContext;

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvm:Ljavax/microedition/khronos/egl/EGLContext;

    if-eqz v1, :cond_6

    sget-object v3, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    if-ne v1, v3, :cond_3

    goto :goto_0

    :cond_3
    iget-object v1, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvk:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v3, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvl:Ljavax/microedition/khronos/egl/EGLDisplay;

    iget-object v4, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvd:Landroid/graphics/SurfaceTexture;

    const/4 v5, 0x0

    invoke-interface {v1, v3, v0, v4, v5}, Ljavax/microedition/khronos/egl/EGL10;->eglCreateWindowSurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;Ljava/lang/Object;[I)Ljavax/microedition/khronos/egl/EGLSurface;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvn:Ljavax/microedition/khronos/egl/EGLSurface;

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvn:Ljavax/microedition/khronos/egl/EGLSurface;

    if-eqz v0, :cond_6

    sget-object v1, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    if-ne v0, v1, :cond_4

    goto :goto_0

    :cond_4
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvk:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvl:Ljavax/microedition/khronos/egl/EGLDisplay;

    iget-object v3, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvn:Ljavax/microedition/khronos/egl/EGLSurface;

    iget-object v4, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvm:Ljavax/microedition/khronos/egl/EGLContext;

    invoke-interface {v0, v1, v3, v3, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z

    move-result v0

    if-nez v0, :cond_5

    return v2

    :cond_5
    const/4 v0, 0x1

    return v0

    :cond_6
    :goto_0
    return v2

    :array_0
    .array-data 4
        0x3098
        0x2
        0x3038
    .end array-data
.end method

.method zzpg()Z
    .locals 7

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvn:Ljavax/microedition/khronos/egl/EGLSurface;

    const/4 v1, 0x0

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    sget-object v3, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    if-eq v0, v3, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvk:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v3, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvl:Ljavax/microedition/khronos/egl/EGLDisplay;

    sget-object v4, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    sget-object v5, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    sget-object v6, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    invoke-interface {v0, v3, v4, v5, v6}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z

    move-result v0

    or-int/2addr v0, v1

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvk:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v3, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvl:Ljavax/microedition/khronos/egl/EGLDisplay;

    iget-object v4, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvn:Ljavax/microedition/khronos/egl/EGLSurface;

    invoke-interface {v1, v3, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroySurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)Z

    move-result v1

    or-int/2addr v1, v0

    iput-object v2, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvn:Ljavax/microedition/khronos/egl/EGLSurface;

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvm:Ljavax/microedition/khronos/egl/EGLContext;

    if-eqz v0, :cond_1

    iget-object v3, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvk:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v4, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvl:Ljavax/microedition/khronos/egl/EGLDisplay;

    invoke-interface {v3, v4, v0}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroyContext(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLContext;)Z

    move-result v0

    or-int/2addr v1, v0

    iput-object v2, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvm:Ljavax/microedition/khronos/egl/EGLContext;

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvl:Ljavax/microedition/khronos/egl/EGLDisplay;

    if-eqz v0, :cond_2

    iget-object v3, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvk:Ljavax/microedition/khronos/egl/EGL10;

    invoke-interface {v3, v0}, Ljavax/microedition/khronos/egl/EGL10;->eglTerminate(Ljavax/microedition/khronos/egl/EGLDisplay;)Z

    move-result v0

    or-int/2addr v1, v0

    iput-object v2, p0, Lcom/google/android/gms/ads/internal/overlay/zzw;->zzbvl:Ljavax/microedition/khronos/egl/EGLDisplay;

    :cond_2
    return v1
.end method
