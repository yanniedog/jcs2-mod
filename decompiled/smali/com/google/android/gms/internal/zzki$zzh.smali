.class public Lcom/google/android/gms/internal/zzki$zzh;
.super Lcom/google/android/gms/internal/zzki$zzg;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzki;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "zzh"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzki$zzg;-><init>()V

    return-void
.end method


# virtual methods
.method public zzao(Landroid/content/Context;)Landroid/webkit/CookieManager;
    .locals 0

    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    move-result-object p1

    return-object p1
.end method
