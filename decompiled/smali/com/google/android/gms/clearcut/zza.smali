.class public Lcom/google/android/gms/clearcut/zza;
.super Ljava/lang/Object;


# static fields
.field private static pX:I = -0x1

.field public static final pY:Lcom/google/android/gms/clearcut/zza;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/gms/clearcut/zza;

    invoke-direct {v0}, Lcom/google/android/gms/clearcut/zza;-><init>()V

    sput-object v0, Lcom/google/android/gms/clearcut/zza;->pY:Lcom/google/android/gms/clearcut/zza;

    return-void
.end method

.method protected constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zzbk(Landroid/content/Context;)I
    .locals 2

    sget v0, Lcom/google/android/gms/clearcut/zza;->pX:I

    if-gez v0, :cond_0

    const/4 v0, 0x0

    const-string v1, "bootCount"

    invoke-virtual {p1, v1, v0}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    const/4 v0, 0x1

    invoke-interface {p1, v1, v0}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p1

    sput p1, Lcom/google/android/gms/clearcut/zza;->pX:I

    :cond_0
    sget p1, Lcom/google/android/gms/clearcut/zza;->pX:I

    return p1
.end method
