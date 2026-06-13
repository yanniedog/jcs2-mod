.class public final Lcom/google/android/gms/gass/internal/GassResponseParcel;
.super Lcom/google/android/gms/common/internal/safeparcel/AbstractSafeParcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/google/android/gms/gass/internal/GassResponseParcel;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private YX:Lcom/google/android/gms/internal/zzae$zza;

.field private YY:[B

.field public final versionCode:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/gms/gass/internal/zzd;

    invoke-direct {v0}, Lcom/google/android/gms/gass/internal/zzd;-><init>()V

    sput-object v0, Lcom/google/android/gms/gass/internal/GassResponseParcel;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method constructor <init>(I[B)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/common/internal/safeparcel/AbstractSafeParcelable;-><init>()V

    iput p1, p0, Lcom/google/android/gms/gass/internal/GassResponseParcel;->versionCode:I

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/google/android/gms/gass/internal/GassResponseParcel;->YX:Lcom/google/android/gms/internal/zzae$zza;

    iput-object p2, p0, Lcom/google/android/gms/gass/internal/GassResponseParcel;->YY:[B

    invoke-direct {p0}, Lcom/google/android/gms/gass/internal/GassResponseParcel;->zzaww()V

    return-void
.end method

.method private zzawu()V
    .locals 2

    invoke-direct {p0}, Lcom/google/android/gms/gass/internal/GassResponseParcel;->zzawv()Z

    move-result v0

    if-nez v0, :cond_0

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/gass/internal/GassResponseParcel;->YY:[B

    invoke-static {v0}, Lcom/google/android/gms/internal/zzae$zza;->zzc([B)Lcom/google/android/gms/internal/zzae$zza;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/gass/internal/GassResponseParcel;->YX:Lcom/google/android/gms/internal/zzae$zza;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/gass/internal/GassResponseParcel;->YY:[B
    :try_end_0
    .catch Lcom/google/android/gms/internal/zzapu; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    :cond_0
    :goto_0
    invoke-direct {p0}, Lcom/google/android/gms/gass/internal/GassResponseParcel;->zzaww()V

    return-void
.end method

.method private zzawv()Z
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/gass/internal/GassResponseParcel;->YX:Lcom/google/android/gms/internal/zzae$zza;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private zzaww()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/gass/internal/GassResponseParcel;->YX:Lcom/google/android/gms/internal/zzae$zza;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/gass/internal/GassResponseParcel;->YY:[B

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/gass/internal/GassResponseParcel;->YX:Lcom/google/android/gms/internal/zzae$zza;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/gass/internal/GassResponseParcel;->YY:[B

    if-nez v0, :cond_1

    return-void

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/gass/internal/GassResponseParcel;->YX:Lcom/google/android/gms/internal/zzae$zza;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/google/android/gms/gass/internal/GassResponseParcel;->YY:[B

    if-nez v0, :cond_2

    goto :goto_0

    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Invalid internal representation - full"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_3
    :goto_0
    iget-object v0, p0, Lcom/google/android/gms/gass/internal/GassResponseParcel;->YX:Lcom/google/android/gms/internal/zzae$zza;

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/google/android/gms/gass/internal/GassResponseParcel;->YY:[B

    if-nez v0, :cond_4

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Invalid internal representation - empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_4
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Impossible"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/google/android/gms/gass/internal/zzd;->zza(Lcom/google/android/gms/gass/internal/GassResponseParcel;Landroid/os/Parcel;I)V

    return-void
.end method

.method public zzblc()[B
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/gass/internal/GassResponseParcel;->YY:[B

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/gass/internal/GassResponseParcel;->YX:Lcom/google/android/gms/internal/zzae$zza;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzapv;->zzf(Lcom/google/android/gms/internal/zzapv;)[B

    move-result-object v0

    return-object v0
.end method

.method public zzbld()Lcom/google/android/gms/internal/zzae$zza;
    .locals 1

    invoke-direct {p0}, Lcom/google/android/gms/gass/internal/GassResponseParcel;->zzawu()V

    iget-object v0, p0, Lcom/google/android/gms/gass/internal/GassResponseParcel;->YX:Lcom/google/android/gms/internal/zzae$zza;

    return-object v0
.end method
