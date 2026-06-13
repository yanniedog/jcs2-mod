.class public Lcom/trueaxis/server/Stub;
.super Ljava/lang/Object;
.source "Stub.java"


# Helper methods injected to stub all IAP/verify as already-owned (offline).
# extractInt: pulls an integer value that follows a key inside a request body
#             (works for both form-encoded "key=N" and JSON "key":N forms).
# ownAll:     reports every known SKU back to native as a successful purchase.

.method public static extractInt([BLjava/lang/String;)I
    .locals 6

    :try_start_0
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, p0}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {v0, p1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-ltz v1, :ret_zero

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    add-int/2addr v1, v3

    :skip_loop
    if-ge v1, v2, :ret_zero

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x30

    if-lt v4, v5, :skip_inc

    const/16 v5, 0x39

    if-le v4, v5, :found_start

    :skip_inc
    add-int/lit8 v1, v1, 0x1

    goto :skip_loop

    :found_start
    move v3, v1

    :digit_loop
    if-ge v1, v2, :end_digits

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x30

    if-lt v4, v5, :end_digits

    const/16 v5, 0x39

    if-gt v4, v5, :end_digits

    add-int/lit8 v1, v1, 0x1

    goto :digit_loop

    :end_digits
    if-eq v1, v3, :ret_zero

    invoke-virtual {v0, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    :ret_zero
    const/4 v0, 0x0

    return v0

    :catch_0
    move-exception v0

    const/4 v0, 0x0

    return v0
.end method

.method public static ownAll()V
    .locals 5

    # honor the in-game "Unlock everything" toggle (default on)
    invoke-static {}, Lcom/trueaxis/game/Interface;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/trueaxis/modmenu/ModMenu;->unlockAll(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :unlock_ok

    return-void

    :unlock_ok
    const/4 v4, 0x0

    :try_start_0
    sget-object v0, Lcom/trueaxis/game/Interface;->moreSkus:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :loop_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :done_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const-string v2, "{}"

    const-string v3, ""

    invoke-static {v1, v2, v3, v4}, Lcom/trueaxis/cLib/TrueaxisLib;->purchaseSuccess(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    goto :loop_0

    :done_0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    return-void
.end method
