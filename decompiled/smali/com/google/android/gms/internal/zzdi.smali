.class public Lcom/google/android/gms/internal/zzdi;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzin;
.end annotation


# instance fields
.field private final zzbeb:J

.field private final zzbec:Ljava/lang/String;

.field private final zzbed:Lcom/google/android/gms/internal/zzdi;


# direct methods
.method public constructor <init>(JLjava/lang/String;Lcom/google/android/gms/internal/zzdi;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lcom/google/android/gms/internal/zzdi;->zzbeb:J

    iput-object p3, p0, Lcom/google/android/gms/internal/zzdi;->zzbec:Ljava/lang/String;

    iput-object p4, p0, Lcom/google/android/gms/internal/zzdi;->zzbed:Lcom/google/android/gms/internal/zzdi;

    return-void
.end method


# virtual methods
.method getTime()J
    .locals 2

    iget-wide v0, p0, Lcom/google/android/gms/internal/zzdi;->zzbeb:J

    return-wide v0
.end method

.method zzkd()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzdi;->zzbec:Ljava/lang/String;

    return-object v0
.end method

.method zzke()Lcom/google/android/gms/internal/zzdi;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzdi;->zzbed:Lcom/google/android/gms/internal/zzdi;

    return-object v0
.end method
