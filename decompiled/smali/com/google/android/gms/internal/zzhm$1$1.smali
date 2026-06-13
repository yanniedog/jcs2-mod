.class Lcom/google/android/gms/internal/zzhm$1$1;
.super Landroid/webkit/WebViewClient;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzhm$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzasu:Landroid/webkit/WebView;

.field final synthetic zzbwl:Lcom/google/android/gms/internal/zzhm$1;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzhm$1;Landroid/webkit/WebView;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzhm$1$1;->zzbwl:Lcom/google/android/gms/internal/zzhm$1;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzhm$1$1;->zzasu:Landroid/webkit/WebView;

    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    return-void
.end method


# virtual methods
.method public onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 0

    const-string p1, "Loading assets have finished"

    invoke-static {p1}, Lcom/google/android/gms/internal/zzkd;->zzcv(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/google/android/gms/internal/zzhm$1$1;->zzbwl:Lcom/google/android/gms/internal/zzhm$1;

    iget-object p1, p1, Lcom/google/android/gms/internal/zzhm$1;->zzbwk:Lcom/google/android/gms/internal/zzhm;

    iget-object p1, p1, Lcom/google/android/gms/internal/zzhm;->zzbwh:Ljava/util/Set;

    iget-object p2, p0, Lcom/google/android/gms/internal/zzhm$1$1;->zzasu:Landroid/webkit/WebView;

    invoke-interface {p1, p2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    const-string p1, "Loading assets have failed."

    invoke-static {p1}, Lcom/google/android/gms/internal/zzkd;->zzcx(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/google/android/gms/internal/zzhm$1$1;->zzbwl:Lcom/google/android/gms/internal/zzhm$1;

    iget-object p1, p1, Lcom/google/android/gms/internal/zzhm$1;->zzbwk:Lcom/google/android/gms/internal/zzhm;

    iget-object p1, p1, Lcom/google/android/gms/internal/zzhm;->zzbwh:Ljava/util/Set;

    iget-object p2, p0, Lcom/google/android/gms/internal/zzhm$1$1;->zzasu:Landroid/webkit/WebView;

    invoke-interface {p1, p2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    return-void
.end method
