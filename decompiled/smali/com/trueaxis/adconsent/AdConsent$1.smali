.class Lcom/trueaxis/adconsent/AdConsent$1;
.super Ljava/lang/Object;
.source "AdConsent.java"

# interfaces
.implements Lcom/google/ads/consent/ConsentInfoUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/adconsent/AdConsent;->initAdConsent()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trueaxis/adconsent/AdConsent;

.field final synthetic val$activity:Landroid/app/Activity;

.field final synthetic val$consentInformation:Lcom/google/ads/consent/ConsentInformation;


# direct methods
.method constructor <init>(Lcom/trueaxis/adconsent/AdConsent;Lcom/google/ads/consent/ConsentInformation;Landroid/app/Activity;)V
    .locals 0

    .line 32
    iput-object p1, p0, Lcom/trueaxis/adconsent/AdConsent$1;->this$0:Lcom/trueaxis/adconsent/AdConsent;

    iput-object p2, p0, Lcom/trueaxis/adconsent/AdConsent$1;->val$consentInformation:Lcom/google/ads/consent/ConsentInformation;

    iput-object p3, p0, Lcom/trueaxis/adconsent/AdConsent$1;->val$activity:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onConsentInfoUpdated(Lcom/google/ads/consent/ConsentStatus;)V
    .locals 3

    .line 36
    iget-object v0, p0, Lcom/trueaxis/adconsent/AdConsent$1;->val$consentInformation:Lcom/google/ads/consent/ConsentInformation;

    invoke-virtual {v0}, Lcom/google/ads/consent/ConsentInformation;->isRequestLocationInEeaOrUnknown()Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_2

    .line 38
    sput-boolean v2, Lcom/trueaxis/admob/AdMob;->bEuropean:Z

    .line 40
    sget-object v0, Lcom/google/ads/consent/ConsentStatus;->UNKNOWN:Lcom/google/ads/consent/ConsentStatus;

    if-ne p1, v0, :cond_0

    .line 42
    iget-object p1, p0, Lcom/trueaxis/adconsent/AdConsent$1;->this$0:Lcom/trueaxis/adconsent/AdConsent;

    invoke-static {p1}, Lcom/trueaxis/adconsent/AdConsent;->access$000(Lcom/trueaxis/adconsent/AdConsent;)V

    goto :goto_0

    .line 44
    :cond_0
    sget-object v0, Lcom/google/ads/consent/ConsentStatus;->NON_PERSONALIZED:Lcom/google/ads/consent/ConsentStatus;

    if-ne p1, v0, :cond_1

    .line 46
    sput-boolean v1, Lcom/trueaxis/admob/AdMob;->bPersonelised:Z

    goto :goto_0

    .line 48
    :cond_1
    sget-object v0, Lcom/google/ads/consent/ConsentStatus;->PERSONALIZED:Lcom/google/ads/consent/ConsentStatus;

    if-ne p1, v0, :cond_3

    .line 50
    sput-boolean v2, Lcom/trueaxis/admob/AdMob;->bPersonelised:Z

    goto :goto_0

    .line 54
    :cond_2
    sput-boolean v1, Lcom/trueaxis/admob/AdMob;->bEuropean:Z

    .line 55
    sput-boolean v2, Lcom/trueaxis/admob/AdMob;->bPersonelised:Z

    :cond_3
    :goto_0
    return-void
.end method

.method public onFailedToUpdateConsentInfo(Ljava/lang/String;)V
    .locals 2

    .line 62
    iget-object v0, p0, Lcom/trueaxis/adconsent/AdConsent$1;->val$activity:Landroid/app/Activity;

    const/4 v1, 0x1

    invoke-static {v0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void
.end method
