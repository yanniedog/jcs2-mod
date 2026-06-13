.class public Lcom/google/ads/consent/ConsentForm$Builder;
.super Ljava/lang/Object;
.source "ConsentForm.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/ads/consent/ConsentForm;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private adFreeOption:Z

.field private final appPrivacyPolicyURL:Ljava/net/URL;

.field private final context:Landroid/content/Context;

.field private listener:Lcom/google/ads/consent/ConsentFormListener;

.field private nonPersonalizedAdsOption:Z

.field private personalizedAdsOption:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/net/URL;)V
    .locals 0

    .line 176
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 177
    iput-object p1, p0, Lcom/google/ads/consent/ConsentForm$Builder;->context:Landroid/content/Context;

    const/4 p1, 0x0

    .line 178
    iput-boolean p1, p0, Lcom/google/ads/consent/ConsentForm$Builder;->personalizedAdsOption:Z

    .line 179
    iput-boolean p1, p0, Lcom/google/ads/consent/ConsentForm$Builder;->nonPersonalizedAdsOption:Z

    .line 180
    iput-boolean p1, p0, Lcom/google/ads/consent/ConsentForm$Builder;->adFreeOption:Z

    .line 181
    iput-object p2, p0, Lcom/google/ads/consent/ConsentForm$Builder;->appPrivacyPolicyURL:Ljava/net/URL;

    .line 183
    iget-object p1, p0, Lcom/google/ads/consent/ConsentForm$Builder;->appPrivacyPolicyURL:Ljava/net/URL;

    if-eqz p1, :cond_0

    return-void

    .line 184
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Must provide valid app privacy policy url to create a ConsentForm"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method static synthetic access$000(Lcom/google/ads/consent/ConsentForm$Builder;)Landroid/content/Context;
    .locals 0

    .line 167
    iget-object p0, p0, Lcom/google/ads/consent/ConsentForm$Builder;->context:Landroid/content/Context;

    return-object p0
.end method

.method static synthetic access$100(Lcom/google/ads/consent/ConsentForm$Builder;)Lcom/google/ads/consent/ConsentFormListener;
    .locals 0

    .line 167
    iget-object p0, p0, Lcom/google/ads/consent/ConsentForm$Builder;->listener:Lcom/google/ads/consent/ConsentFormListener;

    return-object p0
.end method

.method static synthetic access$200(Lcom/google/ads/consent/ConsentForm$Builder;)Z
    .locals 0

    .line 167
    iget-boolean p0, p0, Lcom/google/ads/consent/ConsentForm$Builder;->personalizedAdsOption:Z

    return p0
.end method

.method static synthetic access$300(Lcom/google/ads/consent/ConsentForm$Builder;)Z
    .locals 0

    .line 167
    iget-boolean p0, p0, Lcom/google/ads/consent/ConsentForm$Builder;->nonPersonalizedAdsOption:Z

    return p0
.end method

.method static synthetic access$400(Lcom/google/ads/consent/ConsentForm$Builder;)Z
    .locals 0

    .line 167
    iget-boolean p0, p0, Lcom/google/ads/consent/ConsentForm$Builder;->adFreeOption:Z

    return p0
.end method

.method static synthetic access$500(Lcom/google/ads/consent/ConsentForm$Builder;)Ljava/net/URL;
    .locals 0

    .line 167
    iget-object p0, p0, Lcom/google/ads/consent/ConsentForm$Builder;->appPrivacyPolicyURL:Ljava/net/URL;

    return-object p0
.end method


# virtual methods
.method public build()Lcom/google/ads/consent/ConsentForm;
    .locals 2

    .line 210
    new-instance v0, Lcom/google/ads/consent/ConsentForm;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/google/ads/consent/ConsentForm;-><init>(Lcom/google/ads/consent/ConsentForm$Builder;Lcom/google/ads/consent/ConsentForm$1;)V

    return-object v0
.end method

.method public withAdFreeOption()Lcom/google/ads/consent/ConsentForm$Builder;
    .locals 1

    const/4 v0, 0x1

    .line 205
    iput-boolean v0, p0, Lcom/google/ads/consent/ConsentForm$Builder;->adFreeOption:Z

    return-object p0
.end method

.method public withListener(Lcom/google/ads/consent/ConsentFormListener;)Lcom/google/ads/consent/ConsentForm$Builder;
    .locals 0

    .line 190
    iput-object p1, p0, Lcom/google/ads/consent/ConsentForm$Builder;->listener:Lcom/google/ads/consent/ConsentFormListener;

    return-object p0
.end method

.method public withNonPersonalizedAdsOption()Lcom/google/ads/consent/ConsentForm$Builder;
    .locals 1

    const/4 v0, 0x1

    .line 200
    iput-boolean v0, p0, Lcom/google/ads/consent/ConsentForm$Builder;->nonPersonalizedAdsOption:Z

    return-object p0
.end method

.method public withPersonalizedAdsOption()Lcom/google/ads/consent/ConsentForm$Builder;
    .locals 1

    const/4 v0, 0x1

    .line 195
    iput-boolean v0, p0, Lcom/google/ads/consent/ConsentForm$Builder;->personalizedAdsOption:Z

    return-object p0
.end method
