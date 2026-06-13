.class public abstract Lcom/google/android/gms/internal/zzaq;
.super Lcom/google/android/gms/internal/zzao;


# static fields
.field private static final TAG:Ljava/lang/String;

.field private static startTime:J

.field protected static volatile zzaey:Lcom/google/android/gms/internal/zzax;

.field private static zzafo:Ljava/lang/reflect/Method;

.field static zzafq:Z

.field protected static final zzaft:Ljava/lang/Object;


# instance fields
.field protected zzafn:Z

.field protected zzafp:Ljava/lang/String;

.field protected zzafr:Z

.field protected zzafs:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const-class v0, Lcom/google/android/gms/internal/zzaq;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/internal/zzaq;->TAG:Ljava/lang/String;

    const-wide/16 v0, 0x0

    sput-wide v0, Lcom/google/android/gms/internal/zzaq;->startTime:J

    const/4 v0, 0x0

    sput-boolean v0, Lcom/google/android/gms/internal/zzaq;->zzafq:Z

    const/4 v0, 0x0

    sput-object v0, Lcom/google/android/gms/internal/zzaq;->zzaey:Lcom/google/android/gms/internal/zzax;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/zzaq;->zzaft:Ljava/lang/Object;

    return-void
.end method

.method protected constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzao;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/google/android/gms/internal/zzaq;->zzafn:Z

    iput-boolean p1, p0, Lcom/google/android/gms/internal/zzaq;->zzafr:Z

    iput-boolean p1, p0, Lcom/google/android/gms/internal/zzaq;->zzafs:Z

    iput-object p2, p0, Lcom/google/android/gms/internal/zzaq;->zzafp:Ljava/lang/String;

    iput-boolean p1, p0, Lcom/google/android/gms/internal/zzaq;->zzafn:Z

    return-void
.end method

.method protected constructor <init>(Landroid/content/Context;Ljava/lang/String;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzao;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/google/android/gms/internal/zzaq;->zzafn:Z

    iput-boolean p1, p0, Lcom/google/android/gms/internal/zzaq;->zzafr:Z

    iput-boolean p1, p0, Lcom/google/android/gms/internal/zzaq;->zzafs:Z

    iput-object p2, p0, Lcom/google/android/gms/internal/zzaq;->zzafp:Ljava/lang/String;

    iput-boolean p3, p0, Lcom/google/android/gms/internal/zzaq;->zzafn:Z

    return-void
.end method

.method static zza(Lcom/google/android/gms/internal/zzax;Landroid/view/MotionEvent;Landroid/util/DisplayMetrics;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzax;",
            "Landroid/view/MotionEvent;",
            "Landroid/util/DisplayMetrics;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/zzaw;
        }
    .end annotation

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzcb()Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzcc()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/zzax;->zzc(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/reflect/Method;

    move-result-object p0

    sput-object p0, Lcom/google/android/gms/internal/zzaq;->zzafo:Ljava/lang/reflect/Method;

    sget-object p0, Lcom/google/android/gms/internal/zzaq;->zzafo:Ljava/lang/reflect/Method;

    if-eqz p0, :cond_0

    if-eqz p1, :cond_0

    const/4 v0, 0x0

    const/4 v1, 0x2

    :try_start_0
    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const/4 p1, 0x1

    aput-object p2, v1, p1

    invoke-virtual {p0, v0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/ArrayList;
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    new-instance p1, Lcom/google/android/gms/internal/zzaw;

    invoke-direct {p1, p0}, Lcom/google/android/gms/internal/zzaw;-><init>(Ljava/lang/Throwable;)V

    throw p1

    :catch_1
    move-exception p0

    new-instance p1, Lcom/google/android/gms/internal/zzaw;

    invoke-direct {p1, p0}, Lcom/google/android/gms/internal/zzaw;-><init>(Ljava/lang/Throwable;)V

    throw p1

    :cond_0
    new-instance p0, Lcom/google/android/gms/internal/zzaw;

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzaw;-><init>()V

    throw p0
.end method

.method protected static declared-synchronized zza(Landroid/content/Context;Z)V
    .locals 5

    const-class v0, Lcom/google/android/gms/internal/zzaq;

    monitor-enter v0

    :try_start_0
    sget-boolean v1, Lcom/google/android/gms/internal/zzaq;->zzafq:Z

    if-nez v1, :cond_0

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v1

    const-wide/16 v3, 0x3e8

    div-long/2addr v1, v3

    sput-wide v1, Lcom/google/android/gms/internal/zzaq;->startTime:J

    invoke-static {p0, p1}, Lcom/google/android/gms/internal/zzaq;->zzb(Landroid/content/Context;Z)Lcom/google/android/gms/internal/zzax;

    move-result-object p0

    sput-object p0, Lcom/google/android/gms/internal/zzaq;->zzaey:Lcom/google/android/gms/internal/zzax;

    const/4 p0, 0x1

    sput-boolean p0, Lcom/google/android/gms/internal/zzaq;->zzafq:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method private static zza(Lcom/google/android/gms/internal/zzax;)V
    .locals 3

    const-class v0, Landroid/content/Context;

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzbn()Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzbo()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v1, v2, v0}, Lcom/google/android/gms/internal/zzax;->zza(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Z

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzbl()Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzbm()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v1, v2, v0}, Lcom/google/android/gms/internal/zzax;->zza(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Z

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzbx()Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzby()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v1, v2, v0}, Lcom/google/android/gms/internal/zzax;->zza(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Z

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzbv()Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzbw()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v1, v2, v0}, Lcom/google/android/gms/internal/zzax;->zza(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Z

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzbf()Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzbg()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v1, v2, v0}, Lcom/google/android/gms/internal/zzax;->zza(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Z

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzbd()Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzbe()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v1, v2, v0}, Lcom/google/android/gms/internal/zzax;->zza(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Z

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzbb()Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzbc()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v1, v2, v0}, Lcom/google/android/gms/internal/zzax;->zza(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Z

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzbr()Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzbs()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v1, v2, v0}, Lcom/google/android/gms/internal/zzax;->zza(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Z

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzaz()Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzba()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v1, v2, v0}, Lcom/google/android/gms/internal/zzax;->zza(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Z

    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Class;

    const-class v1, Landroid/view/MotionEvent;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const-class v1, Landroid/util/DisplayMetrics;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzcb()Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzcc()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v1, v2, v0}, Lcom/google/android/gms/internal/zzax;->zza(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Z

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzbj()Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzbk()Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v2

    invoke-virtual {p0, v0, v1, v2}, Lcom/google/android/gms/internal/zzax;->zza(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Z

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzbz()Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzca()Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v2

    invoke-virtual {p0, v0, v1, v2}, Lcom/google/android/gms/internal/zzax;->zza(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Z

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzbt()Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzbu()Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v2

    invoke-virtual {p0, v0, v1, v2}, Lcom/google/android/gms/internal/zzax;->zza(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Z

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzbh()Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzbi()Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v2

    invoke-virtual {p0, v0, v1, v2}, Lcom/google/android/gms/internal/zzax;->zza(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Z

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzbp()Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzbq()Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v2

    invoke-virtual {p0, v0, v1, v2}, Lcom/google/android/gms/internal/zzax;->zza(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Z

    return-void
.end method

.method protected static zzb(Landroid/content/Context;Z)Lcom/google/android/gms/internal/zzax;
    .locals 3

    sget-object v0, Lcom/google/android/gms/internal/zzaq;->zzaey:Lcom/google/android/gms/internal/zzax;

    if-nez v0, :cond_1

    sget-object v0, Lcom/google/android/gms/internal/zzaq;->zzaft:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/google/android/gms/internal/zzaq;->zzaey:Lcom/google/android/gms/internal/zzax;

    if-nez v1, :cond_0

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzay()Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v1, v2, p1}, Lcom/google/android/gms/internal/zzax;->zza(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Lcom/google/android/gms/internal/zzax;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/internal/zzaq;->zza(Lcom/google/android/gms/internal/zzax;)V

    sput-object p0, Lcom/google/android/gms/internal/zzaq;->zzaey:Lcom/google/android/gms/internal/zzax;

    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :cond_1
    :goto_0
    sget-object p0, Lcom/google/android/gms/internal/zzaq;->zzaey:Lcom/google/android/gms/internal/zzax;

    return-object p0
.end method


# virtual methods
.method protected zza(Lcom/google/android/gms/internal/zzax;Lcom/google/android/gms/internal/zzae$zza;)V
    .locals 1

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzax;->zzcd()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/internal/zzaq;->zzb(Lcom/google/android/gms/internal/zzax;Lcom/google/android/gms/internal/zzae$zza;)Ljava/util/List;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzaq;->zza(Ljava/util/List;)V

    return-void
.end method

.method protected zza(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/util/concurrent/Callable<",
            "Ljava/lang/Void;",
            ">;>;)V"
        }
    .end annotation

    sget-object v0, Lcom/google/android/gms/internal/zzaq;->zzaey:Lcom/google/android/gms/internal/zzax;

    if-nez v0, :cond_0

    return-void

    :cond_0
    sget-object v0, Lcom/google/android/gms/internal/zzaq;->zzaey:Lcom/google/android/gms/internal/zzax;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzax;->zzcd()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    if-nez v0, :cond_1

    return-void

    :cond_1
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_2

    :try_start_0
    sget-object v1, Lcom/google/android/gms/internal/zzdc;->zzbbj:Lcom/google/android/gms/internal/zzcy;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzcy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v0, p1, v1, v2, v3}, Ljava/util/concurrent/ExecutorService;->invokeAll(Ljava/util/Collection;JLjava/util/concurrent/TimeUnit;)Ljava/util/List;
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    sget-object v0, Lcom/google/android/gms/internal/zzaq;->TAG:Ljava/lang/String;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p1}, Lcom/google/android/gms/internal/zzay;->zza(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p1

    aput-object p1, v1, v2

    const-string p1, "class methods got exception: %s"

    invoke-static {p1, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    :goto_0
    return-void
.end method

.method protected zzb(Lcom/google/android/gms/internal/zzax;Lcom/google/android/gms/internal/zzae$zza;)Ljava/util/List;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzax;",
            "Lcom/google/android/gms/internal/zzae$zza;",
            ")",
            "Ljava/util/List<",
            "Ljava/util/concurrent/Callable<",
            "Ljava/lang/Void;",
            ">;>;"
        }
    .end annotation

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzax;->zzat()I

    move-result v9

    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    new-instance v7, Lcom/google/android/gms/internal/zzbb;

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzbn()Ljava/lang/String;

    move-result-object v2

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzbo()Ljava/lang/String;

    move-result-object v3

    const/16 v6, 0x1b

    move-object v0, v7

    move-object v1, p1

    move-object v4, p2

    move v5, v9

    invoke-direct/range {v0 .. v6}, Lcom/google/android/gms/internal/zzbb;-><init>(Lcom/google/android/gms/internal/zzax;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/zzae$zza;II)V

    invoke-interface {v10, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v11, Lcom/google/android/gms/internal/zzbg;

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzbj()Ljava/lang/String;

    move-result-object v2

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzbk()Ljava/lang/String;

    move-result-object v3

    sget-wide v5, Lcom/google/android/gms/internal/zzaq;->startTime:J

    const/16 v8, 0x19

    move-object v0, v11

    move v7, v9

    invoke-direct/range {v0 .. v8}, Lcom/google/android/gms/internal/zzbg;-><init>(Lcom/google/android/gms/internal/zzax;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/zzae$zza;JII)V

    invoke-interface {v10, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v7, Lcom/google/android/gms/internal/zzbl;

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzbt()Ljava/lang/String;

    move-result-object v2

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzbu()Ljava/lang/String;

    move-result-object v3

    const/4 v6, 0x1

    move-object v0, v7

    move v5, v9

    invoke-direct/range {v0 .. v6}, Lcom/google/android/gms/internal/zzbl;-><init>(Lcom/google/android/gms/internal/zzax;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/zzae$zza;II)V

    invoke-interface {v10, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v7, Lcom/google/android/gms/internal/zzbm;

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzbv()Ljava/lang/String;

    move-result-object v2

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzbw()Ljava/lang/String;

    move-result-object v3

    const/16 v6, 0x1f

    move-object v0, v7

    invoke-direct/range {v0 .. v6}, Lcom/google/android/gms/internal/zzbm;-><init>(Lcom/google/android/gms/internal/zzax;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/zzae$zza;II)V

    invoke-interface {v10, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v7, Lcom/google/android/gms/internal/zzbn;

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzbz()Ljava/lang/String;

    move-result-object v2

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzca()Ljava/lang/String;

    move-result-object v3

    const/16 v6, 0x21

    move-object v0, v7

    invoke-direct/range {v0 .. v6}, Lcom/google/android/gms/internal/zzbn;-><init>(Lcom/google/android/gms/internal/zzax;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/zzae$zza;II)V

    invoke-interface {v10, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v7, Lcom/google/android/gms/internal/zzba;

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzbx()Ljava/lang/String;

    move-result-object v2

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzby()Ljava/lang/String;

    move-result-object v3

    const/16 v6, 0x1d

    move-object v0, v7

    invoke-direct/range {v0 .. v6}, Lcom/google/android/gms/internal/zzba;-><init>(Lcom/google/android/gms/internal/zzax;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/zzae$zza;II)V

    invoke-interface {v10, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v7, Lcom/google/android/gms/internal/zzbe;

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzbf()Ljava/lang/String;

    move-result-object v2

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzbg()Ljava/lang/String;

    move-result-object v3

    const/4 v6, 0x5

    move-object v0, v7

    invoke-direct/range {v0 .. v6}, Lcom/google/android/gms/internal/zzbe;-><init>(Lcom/google/android/gms/internal/zzax;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/zzae$zza;II)V

    invoke-interface {v10, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v7, Lcom/google/android/gms/internal/zzbk;

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzbr()Ljava/lang/String;

    move-result-object v2

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzbs()Ljava/lang/String;

    move-result-object v3

    const/16 v6, 0xc

    move-object v0, v7

    invoke-direct/range {v0 .. v6}, Lcom/google/android/gms/internal/zzbk;-><init>(Lcom/google/android/gms/internal/zzax;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/zzae$zza;II)V

    invoke-interface {v10, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v7, Lcom/google/android/gms/internal/zzaz;

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzaz()Ljava/lang/String;

    move-result-object v2

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzba()Ljava/lang/String;

    move-result-object v3

    const/4 v6, 0x3

    move-object v0, v7

    invoke-direct/range {v0 .. v6}, Lcom/google/android/gms/internal/zzaz;-><init>(Lcom/google/android/gms/internal/zzax;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/zzae$zza;II)V

    invoke-interface {v10, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v7, Lcom/google/android/gms/internal/zzbd;

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzbd()Ljava/lang/String;

    move-result-object v2

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzbe()Ljava/lang/String;

    move-result-object v3

    const/16 v6, 0x22

    move-object v0, v7

    invoke-direct/range {v0 .. v6}, Lcom/google/android/gms/internal/zzbd;-><init>(Lcom/google/android/gms/internal/zzax;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/zzae$zza;II)V

    invoke-interface {v10, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v7, Lcom/google/android/gms/internal/zzbc;

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzbb()Ljava/lang/String;

    move-result-object v2

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzbc()Ljava/lang/String;

    move-result-object v3

    const/16 v6, 0x23

    move-object v0, v7

    invoke-direct/range {v0 .. v6}, Lcom/google/android/gms/internal/zzbc;-><init>(Lcom/google/android/gms/internal/zzax;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/zzae$zza;II)V

    invoke-interface {v10, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/google/android/gms/internal/zzdc;->zzbbn:Lcom/google/android/gms/internal/zzcy;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzcy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v7, Lcom/google/android/gms/internal/zzbf;

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzbh()Ljava/lang/String;

    move-result-object v2

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzbi()Ljava/lang/String;

    move-result-object v3

    const/16 v6, 0x2c

    move-object v0, v7

    move-object v1, p1

    move-object v4, p2

    move v5, v9

    invoke-direct/range {v0 .. v6}, Lcom/google/android/gms/internal/zzbf;-><init>(Lcom/google/android/gms/internal/zzax;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/zzae$zza;II)V

    invoke-interface {v10, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    sget-object v0, Lcom/google/android/gms/internal/zzdc;->zzbbq:Lcom/google/android/gms/internal/zzcy;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzcy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v7, Lcom/google/android/gms/internal/zzbj;

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzbp()Ljava/lang/String;

    move-result-object v2

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzbq()Ljava/lang/String;

    move-result-object v3

    const/16 v6, 0x16

    move-object v0, v7

    move-object v1, p1

    move-object v4, p2

    move v5, v9

    invoke-direct/range {v0 .. v6}, Lcom/google/android/gms/internal/zzbj;-><init>(Lcom/google/android/gms/internal/zzax;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/zzae$zza;II)V

    invoke-interface {v10, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1
    return-object v10
.end method

.method protected zzc(Landroid/content/Context;)Lcom/google/android/gms/internal/zzae$zza;
    .locals 2

    new-instance v0, Lcom/google/android/gms/internal/zzae$zza;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzae$zza;-><init>()V

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaq;->zzafp:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaq;->zzafp:Ljava/lang/String;

    iput-object v1, v0, Lcom/google/android/gms/internal/zzae$zza;->zzcs:Ljava/lang/String;

    :cond_0
    iget-boolean v1, p0, Lcom/google/android/gms/internal/zzaq;->zzafn:Z

    invoke-static {p1, v1}, Lcom/google/android/gms/internal/zzaq;->zzb(Landroid/content/Context;Z)Lcom/google/android/gms/internal/zzax;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzax;->zzcs()V

    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/internal/zzaq;->zza(Lcom/google/android/gms/internal/zzax;Lcom/google/android/gms/internal/zzae$zza;)V

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzax;->zzct()V

    return-object v0
.end method

.method protected zzc(Lcom/google/android/gms/internal/zzax;Lcom/google/android/gms/internal/zzae$zza;)Ljava/util/List;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzax;",
            "Lcom/google/android/gms/internal/zzae$zza;",
            ")",
            "Ljava/util/List<",
            "Ljava/util/concurrent/Callable<",
            "Ljava/lang/Void;",
            ">;>;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzax;->zzcd()Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    if-nez v1, :cond_0

    return-object v0

    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzax;->zzat()I

    move-result v1

    new-instance v2, Lcom/google/android/gms/internal/zzbi;

    invoke-direct {v2, p1, p2}, Lcom/google/android/gms/internal/zzbi;-><init>(Lcom/google/android/gms/internal/zzax;Lcom/google/android/gms/internal/zzae$zza;)V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v9, Lcom/google/android/gms/internal/zzbl;

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzbt()Ljava/lang/String;

    move-result-object v4

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzbu()Ljava/lang/String;

    move-result-object v5

    const/4 v8, 0x1

    move-object v2, v9

    move-object v3, p1

    move-object v6, p2

    move v7, v1

    invoke-direct/range {v2 .. v8}, Lcom/google/android/gms/internal/zzbl;-><init>(Lcom/google/android/gms/internal/zzax;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/zzae$zza;II)V

    invoke-interface {v0, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v11, Lcom/google/android/gms/internal/zzbg;

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzbj()Ljava/lang/String;

    move-result-object v4

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzbk()Ljava/lang/String;

    move-result-object v5

    sget-wide v7, Lcom/google/android/gms/internal/zzaq;->startTime:J

    const/16 v10, 0x19

    move-object v2, v11

    move v9, v1

    invoke-direct/range {v2 .. v10}, Lcom/google/android/gms/internal/zzbg;-><init>(Lcom/google/android/gms/internal/zzax;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/zzae$zza;JII)V

    invoke-interface {v0, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object v2, Lcom/google/android/gms/internal/zzdc;->zzbbo:Lcom/google/android/gms/internal/zzcy;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzcy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_1

    new-instance v9, Lcom/google/android/gms/internal/zzbf;

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzbh()Ljava/lang/String;

    move-result-object v4

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzbi()Ljava/lang/String;

    move-result-object v5

    const/16 v8, 0x2c

    move-object v2, v9

    move-object v3, p1

    move-object v6, p2

    move v7, v1

    invoke-direct/range {v2 .. v8}, Lcom/google/android/gms/internal/zzbf;-><init>(Lcom/google/android/gms/internal/zzax;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/zzae$zza;II)V

    invoke-interface {v0, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1
    new-instance v9, Lcom/google/android/gms/internal/zzaz;

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzaz()Ljava/lang/String;

    move-result-object v4

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzba()Ljava/lang/String;

    move-result-object v5

    const/4 v8, 0x3

    move-object v2, v9

    move-object v3, p1

    move-object v6, p2

    move v7, v1

    invoke-direct/range {v2 .. v8}, Lcom/google/android/gms/internal/zzaz;-><init>(Lcom/google/android/gms/internal/zzax;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/zzae$zza;II)V

    invoke-interface {v0, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object v2, Lcom/google/android/gms/internal/zzdc;->zzbbr:Lcom/google/android/gms/internal/zzcy;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzcy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_2

    new-instance v9, Lcom/google/android/gms/internal/zzbj;

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzbp()Ljava/lang/String;

    move-result-object v4

    invoke-static {}, Lcom/google/android/gms/internal/zzav;->zzbq()Ljava/lang/String;

    move-result-object v5

    const/16 v8, 0x16

    move-object v2, v9

    move-object v3, p1

    move-object v6, p2

    move v7, v1

    invoke-direct/range {v2 .. v8}, Lcom/google/android/gms/internal/zzbj;-><init>(Lcom/google/android/gms/internal/zzax;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/zzae$zza;II)V

    invoke-interface {v0, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_2
    return-object v0
.end method

.method protected zzd(Landroid/content/Context;)Lcom/google/android/gms/internal/zzae$zza;
    .locals 2

    new-instance v0, Lcom/google/android/gms/internal/zzae$zza;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzae$zza;-><init>()V

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaq;->zzafp:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaq;->zzafp:Ljava/lang/String;

    iput-object v1, v0, Lcom/google/android/gms/internal/zzae$zza;->zzcs:Ljava/lang/String;

    :cond_0
    iget-boolean v1, p0, Lcom/google/android/gms/internal/zzaq;->zzafn:Z

    invoke-static {p1, v1}, Lcom/google/android/gms/internal/zzaq;->zzb(Landroid/content/Context;Z)Lcom/google/android/gms/internal/zzax;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzax;->zzcs()V

    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/internal/zzaq;->zzd(Lcom/google/android/gms/internal/zzax;Lcom/google/android/gms/internal/zzae$zza;)V

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzax;->zzct()V

    return-object v0
.end method

.method protected zzd(Lcom/google/android/gms/internal/zzax;Lcom/google/android/gms/internal/zzae$zza;)V
    .locals 9

    const/4 v0, 0x0

    const/4 v1, 0x1

    const-wide/16 v2, 0x0

    :try_start_0
    iget-object v4, p0, Lcom/google/android/gms/internal/zzaq;->zzafd:Landroid/view/MotionEvent;

    iget-object v5, p0, Lcom/google/android/gms/internal/zzaq;->zzafl:Landroid/util/DisplayMetrics;

    invoke-static {p1, v4, v5}, Lcom/google/android/gms/internal/zzaq;->zza(Lcom/google/android/gms/internal/zzax;Landroid/view/MotionEvent;Landroid/util/DisplayMetrics;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Long;

    iput-object v5, p2, Lcom/google/android/gms/internal/zzae$zza;->zzdf:Ljava/lang/Long;

    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Long;

    iput-object v5, p2, Lcom/google/android/gms/internal/zzae$zza;->zzdg:Ljava/lang/Long;

    const/4 v5, 0x2

    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Long;

    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    cmp-long v8, v6, v2

    if-ltz v8, :cond_0

    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Long;

    iput-object v5, p2, Lcom/google/android/gms/internal/zzae$zza;->zzdh:Ljava/lang/Long;

    :cond_0
    const/4 v5, 0x3

    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Long;

    iput-object v5, p2, Lcom/google/android/gms/internal/zzae$zza;->zzdv:Ljava/lang/Long;

    const/4 v5, 0x4

    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Long;

    iput-object v4, p2, Lcom/google/android/gms/internal/zzae$zza;->zzdw:Ljava/lang/Long;
    :try_end_0
    .catch Lcom/google/android/gms/internal/zzaw; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    nop

    :goto_0
    iget-wide v4, p0, Lcom/google/android/gms/internal/zzaq;->zzaff:J

    cmp-long v6, v4, v2

    if-lez v6, :cond_1

    iget-wide v4, p0, Lcom/google/android/gms/internal/zzaq;->zzaff:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    iput-object v4, p2, Lcom/google/android/gms/internal/zzae$zza;->zzea:Ljava/lang/Long;

    :cond_1
    iget-wide v4, p0, Lcom/google/android/gms/internal/zzaq;->zzafg:J

    cmp-long v6, v4, v2

    if-lez v6, :cond_2

    iget-wide v4, p0, Lcom/google/android/gms/internal/zzaq;->zzafg:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    iput-object v4, p2, Lcom/google/android/gms/internal/zzae$zza;->zzdz:Ljava/lang/Long;

    :cond_2
    iget-wide v4, p0, Lcom/google/android/gms/internal/zzaq;->zzafh:J

    cmp-long v6, v4, v2

    if-lez v6, :cond_3

    iget-wide v4, p0, Lcom/google/android/gms/internal/zzaq;->zzafh:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    iput-object v4, p2, Lcom/google/android/gms/internal/zzae$zza;->zzdy:Ljava/lang/Long;

    :cond_3
    iget-wide v4, p0, Lcom/google/android/gms/internal/zzaq;->zzafi:J

    cmp-long v6, v4, v2

    if-lez v6, :cond_4

    iget-wide v4, p0, Lcom/google/android/gms/internal/zzaq;->zzafi:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    iput-object v4, p2, Lcom/google/android/gms/internal/zzae$zza;->zzeb:Ljava/lang/Long;

    :cond_4
    iget-wide v4, p0, Lcom/google/android/gms/internal/zzaq;->zzafj:J

    cmp-long v6, v4, v2

    if-lez v6, :cond_5

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzaq;->zzafj:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    iput-object v2, p2, Lcom/google/android/gms/internal/zzae$zza;->zzed:Ljava/lang/Long;

    :cond_5
    :try_start_1
    iget-object v2, p0, Lcom/google/android/gms/internal/zzaq;->zzafe:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->size()I

    move-result v2

    sub-int/2addr v2, v1

    if-lez v2, :cond_6

    new-array v3, v2, [Lcom/google/android/gms/internal/zzae$zza$zza;

    iput-object v3, p2, Lcom/google/android/gms/internal/zzae$zza;->zzee:[Lcom/google/android/gms/internal/zzae$zza$zza;

    const/4 v3, 0x0

    :goto_1
    if-ge v3, v2, :cond_6

    iget-object v4, p0, Lcom/google/android/gms/internal/zzaq;->zzafe:Ljava/util/LinkedList;

    invoke-virtual {v4, v3}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/MotionEvent;

    iget-object v5, p0, Lcom/google/android/gms/internal/zzaq;->zzafl:Landroid/util/DisplayMetrics;

    invoke-static {p1, v4, v5}, Lcom/google/android/gms/internal/zzaq;->zza(Lcom/google/android/gms/internal/zzax;Landroid/view/MotionEvent;Landroid/util/DisplayMetrics;)Ljava/util/List;

    move-result-object v4

    new-instance v5, Lcom/google/android/gms/internal/zzae$zza$zza;

    invoke-direct {v5}, Lcom/google/android/gms/internal/zzae$zza$zza;-><init>()V

    invoke-interface {v4, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Long;

    iput-object v6, v5, Lcom/google/android/gms/internal/zzae$zza$zza;->zzdf:Ljava/lang/Long;

    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Long;

    iput-object v4, v5, Lcom/google/android/gms/internal/zzae$zza$zza;->zzdg:Ljava/lang/Long;

    iget-object v4, p2, Lcom/google/android/gms/internal/zzae$zza;->zzee:[Lcom/google/android/gms/internal/zzae$zza$zza;

    aput-object v5, v4, v3
    :try_end_1
    .catch Lcom/google/android/gms/internal/zzaw; {:try_start_1 .. :try_end_1} :catch_1

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :catch_1
    const/4 v0, 0x0

    iput-object v0, p2, Lcom/google/android/gms/internal/zzae$zza;->zzee:[Lcom/google/android/gms/internal/zzae$zza$zza;

    :cond_6
    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/internal/zzaq;->zzc(Lcom/google/android/gms/internal/zzax;Lcom/google/android/gms/internal/zzae$zza;)Ljava/util/List;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzaq;->zza(Ljava/util/List;)V

    return-void
.end method
