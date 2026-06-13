.class Lcom/trueaxis/adconsent/AdConsent$2;
.super Lcom/google/ads/consent/ConsentFormListener;
.source "AdConsent.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/adconsent/AdConsent;->displayConsentForm()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trueaxis/adconsent/AdConsent;

.field final synthetic val$activity:Landroid/app/Activity;


# direct methods
.method constructor <init>(Lcom/trueaxis/adconsent/AdConsent;Landroid/app/Activity;)V
    .locals 0

    .line 81
    iput-object p1, p0, Lcom/trueaxis/adconsent/AdConsent$2;->this$0:Lcom/trueaxis/adconsent/AdConsent;

    iput-object p2, p0, Lcom/trueaxis/adconsent/AdConsent$2;->val$activity:Landroid/app/Activity;

    invoke-direct {p0}, Lcom/google/ads/consent/ConsentFormListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onConsentFormClosed(Lcom/google/ads/consent/ConsentStatus;Ljava/lang/Boolean;)V
    .locals 1

    const/4 p2, 0x1

    .line 97
    sput-boolean p2, Lcom/trueaxis/admob/AdMob;->bEuropean:Z

    .line 99
    sget-object v0, Lcom/google/ads/consent/ConsentStatus;->UNKNOWN:Lcom/google/ads/consent/ConsentStatus;

    if-ne p1, v0, :cond_0

    .line 101
    iget-object p1, p0, Lcom/trueaxis/adconsent/AdConsent$2;->this$0:Lcom/trueaxis/adconsent/AdConsent;

    invoke-static {p1}, Lcom/trueaxis/adconsent/AdConsent;->access$000(Lcom/trueaxis/adconsent/AdConsent;)V

    goto :goto_0

    .line 103
    :cond_0
    sget-object v0, Lcom/google/ads/consent/ConsentStatus;->NON_PERSONALIZED:Lcom/google/ads/consent/ConsentStatus;

    if-ne p1, v0, :cond_1

    const/4 p1, 0x0

    .line 105
    sput-boolean p1, Lcom/trueaxis/admob/AdMob;->bPersonelised:Z

    goto :goto_0

    .line 107
    :cond_1
    sget-object v0, Lcom/google/ads/consent/ConsentStatus;->PERSONALIZED:Lcom/google/ads/consent/ConsentStatus;

    if-ne p1, v0, :cond_2

    .line 109
    sput-boolean p2, Lcom/trueaxis/admob/AdMob;->bPersonelised:Z

    :cond_2
    :goto_0
    return-void
.end method

.method public onConsentFormError(Ljava/lang/String;)V
    .locals 2

    .line 117
    iget-object v0, p0, Lcom/trueaxis/adconsent/AdConsent$2;->val$activity:Landroid/app/Activity;

    const/4 v1, 0x1

    invoke-static {v0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method public onConsentFormLoaded()V
    .locals 1

    .line 85
    iget-object v0, p0, Lcom/trueaxis/adconsent/AdConsent$2;->this$0:Lcom/trueaxis/adconsent/AdConsent;

    invoke-static {v0}, Lcom/trueaxis/adconsent/AdConsent;->access$100(Lcom/trueaxis/adconsent/AdConsent;)Lcom/google/ads/consent/ConsentForm;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/ads/consent/ConsentForm;->show()V

    return-void
.end method

.method public onConsentFormOpened()V
    .locals 0

    return-void
.end method
