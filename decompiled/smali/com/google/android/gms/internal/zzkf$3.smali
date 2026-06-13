.class final Lcom/google/android/gms/internal/zzkf$3;
.super Lcom/google/android/gms/internal/zzkf$zza;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzkf;->zza(Landroid/content/Context;Ljava/lang/String;J)Ljava/util/concurrent/Future;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzala:Landroid/content/Context;

.field final synthetic zzckp:Ljava/lang/String;

.field final synthetic zzckq:J


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/lang/String;J)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzkf$3;->zzala:Landroid/content/Context;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzkf$3;->zzckp:Ljava/lang/String;

    iput-wide p3, p0, Lcom/google/android/gms/internal/zzkf$3;->zzckq:J

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzkf$zza;-><init>(Lcom/google/android/gms/internal/zzkf$1;)V

    return-void
.end method


# virtual methods
.method public zzew()V
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/zzkf$3;->zzala:Landroid/content/Context;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzkf;->zzn(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzkf$3;->zzckp:Ljava/lang/String;

    const-string v2, "app_settings_json"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    iget-wide v1, p0, Lcom/google/android/gms/internal/zzkf$3;->zzckq:J

    const-string v3, "app_settings_last_update_ms"

    invoke-interface {v0, v3, v1, v2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method
