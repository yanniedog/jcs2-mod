.class public final enum Lcom/google/android/gms/internal/zzk$zza;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzk;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "zza"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/google/android/gms/internal/zzk$zza;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum zzas:Lcom/google/android/gms/internal/zzk$zza;

.field public static final enum zzat:Lcom/google/android/gms/internal/zzk$zza;

.field public static final enum zzau:Lcom/google/android/gms/internal/zzk$zza;

.field public static final enum zzav:Lcom/google/android/gms/internal/zzk$zza;

.field private static final synthetic zzaw:[Lcom/google/android/gms/internal/zzk$zza;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    new-instance v0, Lcom/google/android/gms/internal/zzk$zza;

    const/4 v1, 0x0

    const-string v2, "LOW"

    invoke-direct {v0, v2, v1}, Lcom/google/android/gms/internal/zzk$zza;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/android/gms/internal/zzk$zza;->zzas:Lcom/google/android/gms/internal/zzk$zza;

    new-instance v0, Lcom/google/android/gms/internal/zzk$zza;

    const/4 v2, 0x1

    const-string v3, "NORMAL"

    invoke-direct {v0, v3, v2}, Lcom/google/android/gms/internal/zzk$zza;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/android/gms/internal/zzk$zza;->zzat:Lcom/google/android/gms/internal/zzk$zza;

    new-instance v0, Lcom/google/android/gms/internal/zzk$zza;

    const/4 v3, 0x2

    const-string v4, "HIGH"

    invoke-direct {v0, v4, v3}, Lcom/google/android/gms/internal/zzk$zza;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/android/gms/internal/zzk$zza;->zzau:Lcom/google/android/gms/internal/zzk$zza;

    new-instance v0, Lcom/google/android/gms/internal/zzk$zza;

    const/4 v4, 0x3

    const-string v5, "IMMEDIATE"

    invoke-direct {v0, v5, v4}, Lcom/google/android/gms/internal/zzk$zza;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/android/gms/internal/zzk$zza;->zzav:Lcom/google/android/gms/internal/zzk$zza;

    const/4 v0, 0x4

    new-array v0, v0, [Lcom/google/android/gms/internal/zzk$zza;

    sget-object v5, Lcom/google/android/gms/internal/zzk$zza;->zzas:Lcom/google/android/gms/internal/zzk$zza;

    aput-object v5, v0, v1

    sget-object v1, Lcom/google/android/gms/internal/zzk$zza;->zzat:Lcom/google/android/gms/internal/zzk$zza;

    aput-object v1, v0, v2

    sget-object v1, Lcom/google/android/gms/internal/zzk$zza;->zzau:Lcom/google/android/gms/internal/zzk$zza;

    aput-object v1, v0, v3

    sget-object v1, Lcom/google/android/gms/internal/zzk$zza;->zzav:Lcom/google/android/gms/internal/zzk$zza;

    aput-object v1, v0, v4

    sput-object v0, Lcom/google/android/gms/internal/zzk$zza;->zzaw:[Lcom/google/android/gms/internal/zzk$zza;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static values()[Lcom/google/android/gms/internal/zzk$zza;
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/zzk$zza;->zzaw:[Lcom/google/android/gms/internal/zzk$zza;

    invoke-virtual {v0}, [Lcom/google/android/gms/internal/zzk$zza;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/android/gms/internal/zzk$zza;

    return-object v0
.end method
