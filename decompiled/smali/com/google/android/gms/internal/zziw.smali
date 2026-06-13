.class public final Lcom/google/android/gms/internal/zziw;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzin;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/zziw$zza;
    }
.end annotation


# instance fields
.field private zzcha:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/content/Context;",
            "Lcom/google/android/gms/internal/zziw$zza;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zziw;->zzcha:Ljava/util/WeakHashMap;

    return-void
.end method


# virtual methods
.method public zzy(Landroid/content/Context;)Lcom/google/android/gms/internal/zziv;
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/zziw;->zzcha:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zziw$zza;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zziw$zza;->hasExpired()Z

    move-result v1

    if-nez v1, :cond_0

    sget-object v1, Lcom/google/android/gms/internal/zzdc;->zzbas:Lcom/google/android/gms/internal/zzcy;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzcy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Lcom/google/android/gms/internal/zziv$zza;

    iget-object v0, v0, Lcom/google/android/gms/internal/zziw$zza;->zzchc:Lcom/google/android/gms/internal/zziv;

    invoke-direct {v1, p1, v0}, Lcom/google/android/gms/internal/zziv$zza;-><init>(Landroid/content/Context;Lcom/google/android/gms/internal/zziv;)V

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zziv$zza;->zzrn()Lcom/google/android/gms/internal/zziv;

    move-result-object v0

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/google/android/gms/internal/zziv$zza;

    invoke-direct {v0, p1}, Lcom/google/android/gms/internal/zziv$zza;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zziv$zza;->zzrn()Lcom/google/android/gms/internal/zziv;

    move-result-object v0

    :goto_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zziw;->zzcha:Ljava/util/WeakHashMap;

    new-instance v2, Lcom/google/android/gms/internal/zziw$zza;

    invoke-direct {v2, p0, v0}, Lcom/google/android/gms/internal/zziw$zza;-><init>(Lcom/google/android/gms/internal/zziw;Lcom/google/android/gms/internal/zziv;)V

    invoke-virtual {v1, p1, v2}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0
.end method
