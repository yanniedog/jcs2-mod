.class public Lcom/trueaxis/facebook/Facebook;
.super Ljava/lang/Object;
.source "Facebook.java"


# static fields
.field public static final Facebook_LoginStateAttempting:I = 0x1

.field public static final Facebook_LoginStateFail:I = 0x3

.field public static final Facebook_LoginStateNone:I = 0x0

.field public static final Facebook_LoginStateSuccess:I = 0x2

.field private static accessToken:Lcom/facebook/AccessToken; = null

.field public static callbackManager:Lcom/facebook/CallbackManager; = null

.field private static facebookId:Ljava/lang/String; = ""

.field public static loginManager:Lcom/facebook/login/LoginManager; = null

.field public static m_bForChallenge:Z = true

.field public static m_bMultiselect:Z = true

.field public static profileTracker:Lcom/facebook/ProfileTracker;

.field public static stopRestoreAsyncInProgress:Z

.field public static tokenTracker:Lcom/facebook/AccessTokenTracker;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    .line 31
    sget-object v0, Lcom/trueaxis/facebook/Facebook;->facebookId:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$002(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 31
    sput-object p0, Lcom/trueaxis/facebook/Facebook;->facebookId:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$102(Lcom/facebook/AccessToken;)Lcom/facebook/AccessToken;
    .locals 0

    .line 31
    sput-object p0, Lcom/trueaxis/facebook/Facebook;->accessToken:Lcom/facebook/AccessToken;

    return-object p0
.end method

.method public static stopTrackingProfile()V
    .locals 1

    .line 147
    sget-object v0, Lcom/trueaxis/facebook/Facebook;->profileTracker:Lcom/facebook/ProfileTracker;

    if-nez v0, :cond_0

    return-void

    .line 150
    :cond_0
    invoke-virtual {v0}, Lcom/facebook/ProfileTracker;->isTracking()Z

    move-result v0

    if-nez v0, :cond_1

    return-void

    .line 153
    :cond_1
    sget-object v0, Lcom/trueaxis/facebook/Facebook;->profileTracker:Lcom/facebook/ProfileTracker;

    invoke-virtual {v0}, Lcom/facebook/ProfileTracker;->stopTracking()V

    return-void
.end method

.method public static stopTrackingToken()V
    .locals 1

    .line 169
    sget-object v0, Lcom/trueaxis/facebook/Facebook;->tokenTracker:Lcom/facebook/AccessTokenTracker;

    if-nez v0, :cond_0

    return-void

    .line 172
    :cond_0
    invoke-virtual {v0}, Lcom/facebook/AccessTokenTracker;->isTracking()Z

    move-result v0

    if-nez v0, :cond_1

    return-void

    .line 175
    :cond_1
    sget-object v0, Lcom/trueaxis/facebook/Facebook;->tokenTracker:Lcom/facebook/AccessTokenTracker;

    invoke-virtual {v0}, Lcom/facebook/AccessTokenTracker;->stopTracking()V

    return-void
.end method

.method public static trackProfile()V
    .locals 1

    .line 136
    sget-object v0, Lcom/trueaxis/facebook/Facebook;->profileTracker:Lcom/facebook/ProfileTracker;

    if-nez v0, :cond_0

    return-void

    .line 139
    :cond_0
    invoke-virtual {v0}, Lcom/facebook/ProfileTracker;->isTracking()Z

    move-result v0

    if-eqz v0, :cond_1

    return-void

    .line 142
    :cond_1
    sget-object v0, Lcom/trueaxis/facebook/Facebook;->profileTracker:Lcom/facebook/ProfileTracker;

    invoke-virtual {v0}, Lcom/facebook/ProfileTracker;->startTracking()V

    return-void
.end method

.method public static trackToken()V
    .locals 1

    .line 158
    sget-object v0, Lcom/trueaxis/facebook/Facebook;->tokenTracker:Lcom/facebook/AccessTokenTracker;

    if-nez v0, :cond_0

    return-void

    .line 161
    :cond_0
    invoke-virtual {v0}, Lcom/facebook/AccessTokenTracker;->isTracking()Z

    move-result v0

    if-eqz v0, :cond_1

    return-void

    .line 164
    :cond_1
    sget-object v0, Lcom/trueaxis/facebook/Facebook;->tokenTracker:Lcom/facebook/AccessTokenTracker;

    invoke-virtual {v0}, Lcom/facebook/AccessTokenTracker;->startTracking()V

    return-void
.end method


# virtual methods
.method public facebookLogin()V
    .locals 6

    .line 226
    sget-object v0, Lcom/trueaxis/facebook/Facebook;->loginManager:Lcom/facebook/login/LoginManager;

    if-nez v0, :cond_0

    return-void

    .line 229
    :cond_0
    invoke-static {}, Lcom/trueaxis/game/Interface;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-nez v0, :cond_1

    return-void

    :cond_1
    const/4 v1, 0x1

    .line 233
    invoke-static {v1}, Lcom/trueaxis/cLib/TrueaxisLib;->fbSetLoginState(I)V

    .line 234
    sget-object v2, Lcom/trueaxis/facebook/Facebook;->loginManager:Lcom/facebook/login/LoginManager;

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v5, "public_profile"

    aput-object v5, v3, v4

    const-string v4, "user_friends"

    aput-object v4, v3, v1

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {v2, v0, v1}, Lcom/facebook/login/LoginManager;->logInWithReadPermissions(Landroid/app/Activity;Ljava/util/Collection;)V

    return-void
.end method

.method public facebookLogout()V
    .locals 1

    .line 240
    sget-object v0, Lcom/trueaxis/facebook/Facebook;->loginManager:Lcom/facebook/login/LoginManager;

    if-nez v0, :cond_0

    return-void

    .line 243
    :cond_0
    invoke-virtual {v0}, Lcom/facebook/login/LoginManager;->logOut()V

    .line 244
    invoke-static {}, Lcom/trueaxis/cLib/TrueaxisLib;->fbDidLogout()V

    return-void
.end method

.method public getAccessToken()Ljava/lang/String;
    .locals 2

    .line 263
    sget-object v0, Lcom/trueaxis/facebook/Facebook;->loginManager:Lcom/facebook/login/LoginManager;

    const-string v1, ""

    if-nez v0, :cond_0

    return-object v1

    .line 266
    :cond_0
    sget-object v0, Lcom/trueaxis/facebook/Facebook;->accessToken:Lcom/facebook/AccessToken;

    if-nez v0, :cond_1

    return-object v1

    .line 269
    :cond_1
    invoke-virtual {v0}, Lcom/facebook/AccessToken;->isExpired()Z

    move-result v0

    if-eqz v0, :cond_2

    return-object v1

    .line 272
    :cond_2
    sget-object v0, Lcom/trueaxis/facebook/Facebook;->accessToken:Lcom/facebook/AccessToken;

    invoke-virtual {v0}, Lcom/facebook/AccessToken;->getToken()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFriends(ILjava/lang/String;)V
    .locals 7

    .line 324
    sget-object v1, Lcom/trueaxis/facebook/Facebook;->accessToken:Lcom/facebook/AccessToken;

    if-nez v1, :cond_0

    return-void

    .line 327
    :cond_0
    sget-object v0, Lcom/trueaxis/facebook/Facebook;->facebookId:Ljava/lang/String;

    if-nez v0, :cond_1

    return-void

    .line 333
    :cond_1
    new-instance v6, Lcom/facebook/GraphRequest;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "/"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Lcom/trueaxis/facebook/Facebook;->facebookId:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/friends"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    sget-object v4, Lcom/facebook/HttpMethod;->GET:Lcom/facebook/HttpMethod;

    new-instance v5, Lcom/trueaxis/facebook/Facebook$4;

    invoke-direct {v5, p0, p2, p1}, Lcom/trueaxis/facebook/Facebook$4;-><init>(Lcom/trueaxis/facebook/Facebook;Ljava/lang/String;I)V

    move-object v0, v6

    invoke-direct/range {v0 .. v5}, Lcom/facebook/GraphRequest;-><init>(Lcom/facebook/AccessToken;Ljava/lang/String;Landroid/os/Bundle;Lcom/facebook/HttpMethod;Lcom/facebook/GraphRequest$Callback;)V

    .line 386
    invoke-virtual {v6}, Lcom/facebook/GraphRequest;->executeAsync()Lcom/facebook/GraphRequestAsyncTask;

    return-void
.end method

.method public initialise(Landroid/os/Bundle;Z)V
    .locals 2

    .line 54
    invoke-static {}, Lcom/facebook/login/LoginManager;->getInstance()Lcom/facebook/login/LoginManager;

    move-result-object p1

    sput-object p1, Lcom/trueaxis/facebook/Facebook;->loginManager:Lcom/facebook/login/LoginManager;

    .line 55
    invoke-static {}, Lcom/facebook/CallbackManager$Factory;->create()Lcom/facebook/CallbackManager;

    move-result-object p1

    sput-object p1, Lcom/trueaxis/facebook/Facebook;->callbackManager:Lcom/facebook/CallbackManager;

    .line 57
    invoke-static {}, Lcom/facebook/AccessToken;->getCurrentAccessToken()Lcom/facebook/AccessToken;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 60
    sput-object p1, Lcom/trueaxis/facebook/Facebook;->accessToken:Lcom/facebook/AccessToken;

    .line 61
    sget-object p1, Lcom/trueaxis/facebook/Facebook;->accessToken:Lcom/facebook/AccessToken;

    invoke-virtual {p1}, Lcom/facebook/AccessToken;->getUserId()Ljava/lang/String;

    move-result-object p1

    sput-object p1, Lcom/trueaxis/facebook/Facebook;->facebookId:Ljava/lang/String;

    .line 64
    :cond_0
    new-instance p1, Lcom/trueaxis/facebook/Facebook$1;

    invoke-direct {p1, p0}, Lcom/trueaxis/facebook/Facebook$1;-><init>(Lcom/trueaxis/facebook/Facebook;)V

    sput-object p1, Lcom/trueaxis/facebook/Facebook;->profileTracker:Lcom/facebook/ProfileTracker;

    .line 81
    invoke-static {}, Lcom/trueaxis/facebook/Facebook;->trackProfile()V

    .line 83
    new-instance p1, Lcom/trueaxis/facebook/Facebook$2;

    invoke-direct {p1, p0}, Lcom/trueaxis/facebook/Facebook$2;-><init>(Lcom/trueaxis/facebook/Facebook;)V

    sput-object p1, Lcom/trueaxis/facebook/Facebook;->tokenTracker:Lcom/facebook/AccessTokenTracker;

    .line 98
    sget-object p1, Lcom/trueaxis/facebook/Facebook;->tokenTracker:Lcom/facebook/AccessTokenTracker;

    invoke-virtual {p1}, Lcom/facebook/AccessTokenTracker;->startTracking()V

    .line 100
    sget-object p1, Lcom/trueaxis/facebook/Facebook;->loginManager:Lcom/facebook/login/LoginManager;

    sget-object v0, Lcom/trueaxis/facebook/Facebook;->callbackManager:Lcom/facebook/CallbackManager;

    new-instance v1, Lcom/trueaxis/facebook/Facebook$3;

    invoke-direct {v1, p0}, Lcom/trueaxis/facebook/Facebook$3;-><init>(Lcom/trueaxis/facebook/Facebook;)V

    invoke-virtual {p1, v0, v1}, Lcom/facebook/login/LoginManager;->registerCallback(Lcom/facebook/CallbackManager;Lcom/facebook/FacebookCallback;)V

    .line 131
    sput-boolean p2, Lcom/trueaxis/facebook/Facebook;->m_bMultiselect:Z

    return-void
.end method

.method public isFacebookSessionValid()Z
    .locals 2

    .line 249
    sget-object v0, Lcom/trueaxis/facebook/Facebook;->loginManager:Lcom/facebook/login/LoginManager;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 252
    :cond_0
    sget-object v0, Lcom/trueaxis/facebook/Facebook;->accessToken:Lcom/facebook/AccessToken;

    if-nez v0, :cond_1

    return v1

    .line 255
    :cond_1
    invoke-virtual {v0}, Lcom/facebook/AccessToken;->isExpired()Z

    move-result v0

    if-eqz v0, :cond_2

    return v1

    :cond_2
    const/4 v0, 0x1

    return v0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    .line 196
    invoke-static {}, Lcom/trueaxis/game/Interface;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    .line 198
    sget-object v0, Lcom/trueaxis/facebook/Facebook;->callbackManager:Lcom/facebook/CallbackManager;

    if-eqz v0, :cond_0

    .line 199
    invoke-interface {v0, p1, p2, p3}, Lcom/facebook/CallbackManager;->onActivityResult(IILandroid/content/Intent;)Z

    :cond_0
    return-void
.end method

.method public onActivityResultForFreindsPicker()V
    .locals 0

    return-void
.end method

.method public onDestroy()V
    .locals 0

    .line 318
    invoke-static {}, Lcom/trueaxis/facebook/Facebook;->stopTrackingProfile()V

    .line 319
    invoke-static {}, Lcom/trueaxis/facebook/Facebook;->stopTrackingToken()V

    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 0

    return-void
.end method

.method public onStart()V
    .locals 0

    .line 180
    invoke-static {}, Lcom/trueaxis/facebook/Facebook;->trackProfile()V

    .line 181
    invoke-static {}, Lcom/trueaxis/facebook/Facebook;->trackToken()V

    return-void
.end method

.method public onStop()V
    .locals 0

    .line 186
    invoke-static {}, Lcom/trueaxis/facebook/Facebook;->stopTrackingProfile()V

    .line 187
    invoke-static {}, Lcom/trueaxis/facebook/Facebook;->stopTrackingToken()V

    return-void
.end method

.method public startPickFriendsActivity()V
    .locals 5

    .line 277
    invoke-virtual {p0}, Lcom/trueaxis/facebook/Facebook;->isFacebookSessionValid()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    .line 279
    sput-boolean v0, Lcom/trueaxis/facebook/Facebook;->m_bForChallenge:Z

    .line 281
    invoke-static {}, Lcom/trueaxis/game/Interface;->getContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Landroid/app/Activity;

    .line 282
    invoke-virtual {v1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v2

    check-cast v2, Lcom/trueaxis/facebook/FriendPickerApplication;

    .line 285
    new-instance v2, Landroid/content/Intent;

    const-class v3, Lcom/trueaxis/facebook/PickFriendsActivity;

    invoke-direct {v2, v1, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/4 v3, 0x0

    .line 291
    sget-boolean v4, Lcom/trueaxis/facebook/Facebook;->m_bMultiselect:Z

    invoke-static {v2, v3, v4, v0}, Lcom/trueaxis/facebook/PickFriendsActivity;->populateParameters(Landroid/content/Intent;Ljava/lang/String;ZZ)V

    const/4 v3, 0x2

    .line 292
    invoke-virtual {v1, v2, v3}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 294
    sput-boolean v0, Lcom/trueaxis/facebook/Facebook;->stopRestoreAsyncInProgress:Z

    :cond_0
    return-void
.end method

.method public startPickFriendsActivityForSKATE()V
    .locals 5

    .line 300
    invoke-virtual {p0}, Lcom/trueaxis/facebook/Facebook;->isFacebookSessionValid()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 302
    sput-boolean v0, Lcom/trueaxis/facebook/Facebook;->m_bForChallenge:Z

    .line 304
    invoke-static {}, Lcom/trueaxis/game/Interface;->getContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Landroid/app/Activity;

    .line 305
    invoke-virtual {v1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v2

    check-cast v2, Lcom/trueaxis/facebook/FriendPickerApplication;

    .line 308
    new-instance v2, Landroid/content/Intent;

    const-class v3, Lcom/trueaxis/facebook/PickFriendsActivity;

    invoke-direct {v2, v1, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/4 v3, 0x0

    const/4 v4, 0x1

    .line 309
    invoke-static {v2, v3, v0, v4}, Lcom/trueaxis/facebook/PickFriendsActivity;->populateParameters(Landroid/content/Intent;Ljava/lang/String;ZZ)V

    const/4 v0, 0x2

    .line 310
    invoke-virtual {v1, v2, v0}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 312
    sput-boolean v4, Lcom/trueaxis/facebook/Facebook;->stopRestoreAsyncInProgress:Z

    :cond_0
    return-void
.end method
