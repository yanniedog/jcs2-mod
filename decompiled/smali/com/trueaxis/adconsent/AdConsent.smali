.class public Lcom/trueaxis/adconsent/AdConsent;
.super Ljava/lang/Object;
.source "AdConsent.java"


# static fields
.field private static final PRIVACY_URL:Ljava/lang/String; = "https://www.trueaxis.com/jcs2pp.html"

.field private static final PUBLISHER_ID:Ljava/lang/String; = "pub-2604878176519514"


# instance fields
.field private consentForm:Lcom/google/ads/consent/ConsentForm;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/trueaxis/adconsent/AdConsent;)V
    .locals 0

    .line 15
    invoke-direct {p0}, Lcom/trueaxis/adconsent/AdConsent;->displayConsentForm()V

    return-void
.end method

.method static synthetic access$100(Lcom/trueaxis/adconsent/AdConsent;)Lcom/google/ads/consent/ConsentForm;
    .locals 0

    .line 15
    iget-object p0, p0, Lcom/trueaxis/adconsent/AdConsent;->consentForm:Lcom/google/ads/consent/ConsentForm;

    return-object p0
.end method

.method private displayConsentForm()V
    .locals 3

    .line 78
    invoke-static {}, Lcom/trueaxis/game/Interface;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    .line 79
    new-instance v1, Lcom/google/ads/consent/ConsentForm$Builder;

    invoke-direct {p0}, Lcom/trueaxis/adconsent/AdConsent;->getPrivacyUrl()Ljava/net/URL;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Lcom/google/ads/consent/ConsentForm$Builder;-><init>(Landroid/content/Context;Ljava/net/URL;)V

    new-instance v2, Lcom/trueaxis/adconsent/AdConsent$2;

    invoke-direct {v2, p0, v0}, Lcom/trueaxis/adconsent/AdConsent$2;-><init>(Lcom/trueaxis/adconsent/AdConsent;Landroid/app/Activity;)V

    .line 80
    invoke-virtual {v1, v2}, Lcom/google/ads/consent/ConsentForm$Builder;->withListener(Lcom/google/ads/consent/ConsentFormListener;)Lcom/google/ads/consent/ConsentForm$Builder;

    move-result-object v0

    .line 120
    invoke-virtual {v0}, Lcom/google/ads/consent/ConsentForm$Builder;->withPersonalizedAdsOption()Lcom/google/ads/consent/ConsentForm$Builder;

    move-result-object v0

    .line 121
    invoke-virtual {v0}, Lcom/google/ads/consent/ConsentForm$Builder;->withNonPersonalizedAdsOption()Lcom/google/ads/consent/ConsentForm$Builder;

    move-result-object v0

    .line 122
    invoke-virtual {v0}, Lcom/google/ads/consent/ConsentForm$Builder;->build()Lcom/google/ads/consent/ConsentForm;

    move-result-object v0

    iput-object v0, p0, Lcom/trueaxis/adconsent/AdConsent;->consentForm:Lcom/google/ads/consent/ConsentForm;

    .line 123
    iget-object v0, p0, Lcom/trueaxis/adconsent/AdConsent;->consentForm:Lcom/google/ads/consent/ConsentForm;

    invoke-virtual {v0}, Lcom/google/ads/consent/ConsentForm;->load()V

    return-void
.end method

.method private getPrivacyUrl()Ljava/net/URL;
    .locals 2

    .line 129
    :try_start_0
    new-instance v0, Ljava/net/URL;

    const-string v1, "https://www.trueaxis.com/jcs2pp.html"

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 132
    invoke-virtual {v0}, Ljava/net/MalformedURLException;->printStackTrace()V

    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method


# virtual methods
.method public initAdConsent()V
    .locals 5

    const/4 v0, 0x0

    .line 23
    sput-boolean v0, Lcom/trueaxis/admob/AdMob;->bEuropean:Z

    const/4 v1, 0x1

    .line 24
    sput-boolean v1, Lcom/trueaxis/admob/AdMob;->bPersonelised:Z

    .line 25
    invoke-static {}, Lcom/trueaxis/game/Interface;->getContext()Landroid/content/Context;

    move-result-object v2

    check-cast v2, Landroid/app/Activity;

    .line 31
    invoke-static {v2}, Lcom/google/ads/consent/ConsentInformation;->getInstance(Landroid/content/Context;)Lcom/google/ads/consent/ConsentInformation;

    move-result-object v3

    new-array v1, v1, [Ljava/lang/String;

    const-string v4, "pub-2604878176519514"

    aput-object v4, v1, v0

    .line 32
    new-instance v0, Lcom/trueaxis/adconsent/AdConsent$1;

    invoke-direct {v0, p0, v3, v2}, Lcom/trueaxis/adconsent/AdConsent$1;-><init>(Lcom/trueaxis/adconsent/AdConsent;Lcom/google/ads/consent/ConsentInformation;Landroid/app/Activity;)V

    invoke-virtual {v3, v1, v0}, Lcom/google/ads/consent/ConsentInformation;->requestConsentInfoUpdate([Ljava/lang/String;Lcom/google/ads/consent/ConsentInfoUpdateListener;)V

    return-void
.end method

.method public resetConsent()V
    .locals 1

    .line 69
    invoke-static {}, Lcom/trueaxis/game/Interface;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    .line 70
    invoke-static {v0}, Lcom/google/ads/consent/ConsentInformation;->getInstance(Landroid/content/Context;)Lcom/google/ads/consent/ConsentInformation;

    move-result-object v0

    .line 71
    invoke-virtual {v0}, Lcom/google/ads/consent/ConsentInformation;->reset()V

    const/4 v0, 0x0

    .line 72
    sput-boolean v0, Lcom/trueaxis/admob/AdMob;->bEuropean:Z

    const/4 v0, 0x1

    .line 73
    sput-boolean v0, Lcom/trueaxis/admob/AdMob;->bPersonelised:Z

    return-void
.end method
