.class Lcom/trueaxis/facebook/Facebook$4;
.super Ljava/lang/Object;
.source "Facebook.java"

# interfaces
.implements Lcom/facebook/GraphRequest$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/facebook/Facebook;->getFriends(ILjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trueaxis/facebook/Facebook;

.field final synthetic val$filterStored:Ljava/lang/String;

.field final synthetic val$maxFriendsStored:I


# direct methods
.method constructor <init>(Lcom/trueaxis/facebook/Facebook;Ljava/lang/String;I)V
    .locals 0

    .line 340
    iput-object p1, p0, Lcom/trueaxis/facebook/Facebook$4;->this$0:Lcom/trueaxis/facebook/Facebook;

    iput-object p2, p0, Lcom/trueaxis/facebook/Facebook$4;->val$filterStored:Ljava/lang/String;

    iput p3, p0, Lcom/trueaxis/facebook/Facebook$4;->val$maxFriendsStored:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleted(Lcom/facebook/GraphResponse;)V
    .locals 7

    if-nez p1, :cond_0

    return-void

    .line 346
    :cond_0
    iget-object v0, p0, Lcom/trueaxis/facebook/Facebook$4;->val$filterStored:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    .line 349
    invoke-virtual {p1}, Lcom/facebook/GraphResponse;->getJSONObject()Lorg/json/JSONObject;

    move-result-object p1

    const/4 v1, 0x0

    :try_start_0
    const-string v2, "data"

    .line 352
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    if-eqz p1, :cond_3

    const/4 v2, 0x0

    .line 354
    :goto_0
    :try_start_1
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v3
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    if-ge v1, v3, :cond_4

    .line 357
    :try_start_2
    invoke-virtual {p1, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    if-eqz v3, :cond_2

    const-string v4, "id"

    .line 360
    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "name"

    .line 361
    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 362
    iget-object v5, p0, Lcom/trueaxis/facebook/Facebook$4;->val$filterStored:Ljava/lang/String;

    if-eqz v5, :cond_1

    iget-object v5, p0, Lcom/trueaxis/facebook/Facebook$4;->val$filterStored:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    const/4 v6, 0x1

    if-lt v5, v6, :cond_1

    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 364
    :cond_1
    invoke-static {v2, v3, v4}, Lcom/trueaxis/cLib/TrueaxisLib;->fbAddFriend(ILjava/lang/String;Ljava/lang/String;)V

    add-int/lit8 v2, v2, 0x1

    .line 367
    iget v3, p0, Lcom/trueaxis/facebook/Facebook$4;->val$maxFriendsStored:I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    if-lt v2, v3, :cond_2

    goto :goto_1

    :catch_0
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :catch_1
    :cond_3
    const/4 v2, 0x0

    .line 382
    :catch_2
    :cond_4
    :goto_1
    invoke-static {v2}, Lcom/trueaxis/cLib/TrueaxisLib;->fbSetFriendCount(I)V

    .line 383
    invoke-static {}, Lcom/trueaxis/cLib/TrueaxisLib;->fbGetFriendsComplete()V

    return-void
.end method
