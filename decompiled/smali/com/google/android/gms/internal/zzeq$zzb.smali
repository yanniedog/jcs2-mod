.class Lcom/google/android/gms/internal/zzeq$zzb;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzin;
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzeq;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "zzb"
.end annotation


# instance fields
.field private final zzbii:Ljava/lang/String;

.field private final zzbij:Ljava/net/URL;

.field private final zzbik:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/google/android/gms/internal/zzeq$zza;",
            ">;"
        }
    .end annotation
.end field

.field private final zzbil:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/net/URL;Ljava/util/ArrayList;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/net/URL;",
            "Ljava/util/ArrayList<",
            "Lcom/google/android/gms/internal/zzeq$zza;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzeq$zzb;->zzbii:Ljava/lang/String;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzeq$zzb;->zzbij:Ljava/net/URL;

    if-nez p3, :cond_0

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzeq$zzb;->zzbik:Ljava/util/ArrayList;

    goto :goto_0

    :cond_0
    iput-object p3, p0, Lcom/google/android/gms/internal/zzeq$zzb;->zzbik:Ljava/util/ArrayList;

    :goto_0
    iput-object p4, p0, Lcom/google/android/gms/internal/zzeq$zzb;->zzbil:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public zzle()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzeq$zzb;->zzbii:Ljava/lang/String;

    return-object v0
.end method

.method public zzlf()Ljava/net/URL;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzeq$zzb;->zzbij:Ljava/net/URL;

    return-object v0
.end method

.method public zzlg()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/google/android/gms/internal/zzeq$zza;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzeq$zzb;->zzbik:Ljava/util/ArrayList;

    return-object v0
.end method

.method public zzlh()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzeq$zzb;->zzbil:Ljava/lang/String;

    return-object v0
.end method
