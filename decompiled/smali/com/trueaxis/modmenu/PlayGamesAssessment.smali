.class final Lcom/trueaxis/modmenu/PlayGamesAssessment;
.super Ljava/lang/Object;
.source "PlayGamesAssessment.java"


# static fields
.field static final PLAY_GAMES_APP_ID:Ljava/lang/String; = ""

.field static final PLAY_GAMES_SAVED_GAME_MAX_BYTES:I = 0x300000


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    return-void
.end method

.method static isPlayGamesConfigured()Z
    .registers 1

    .line 21
    const-string v0, ""

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_a

    const/4 v0, 0x1

    goto :goto_b

    :cond_a
    const/4 v0, 0x0

    :goto_b
    return v0
.end method

.method static leaderboardFeasibility()Ljava/lang/String;
    .registers 1

    .line 29
    const-string v0, "Not integrated. Official JCS2 posts scores to TrueAxis (connect.trueaxis.com), not Play Games. A separate Play Console entry for package modded.ycs2 with its own leaderboard IDs would be required; it cannot merge with stock leaderboards."

    return-object v0
.end method

.method static localBackupStatus(Landroid/content/Context;)Ljava/lang/String;
    .registers 4

    .line 50
    invoke-static {p0}, Lcom/trueaxis/modmenu/LocalGameDataCatalog;->summarize(Landroid/content/Context;)Lcom/trueaxis/modmenu/LocalGameDataCatalog$Summary;

    move-result-object p0

    .line 51
    iget v0, p0, Lcom/trueaxis/modmenu/LocalGameDataCatalog$Summary;->fileCount:I

    if-nez v0, :cond_b

    .line 52
    const-string p0, "No local stats/replay queue files found yet. Play a level first."

    return-object p0

    .line 54
    :cond_b
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget v1, p0, Lcom/trueaxis/modmenu/LocalGameDataCatalog$Summary;->fileCount:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " local file(s), "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Lcom/trueaxis/modmenu/LocalGameDataCatalog$Summary;->totalBytes:J

    .line 55
    invoke-static {v1, v2}, Lcom/trueaxis/modmenu/LocalGameDataCatalog;->formatBytes(J)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, " \u2014 export below for manual backup."

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 54
    return-object p0
.end method

.method static packageName(Landroid/content/Context;)Ljava/lang/String;
    .registers 1

    .line 25
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static replayFeasibility()Ljava/lang/String;
    .registers 1

    .line 36
    const-string v0, "Not integrated. Replays upload to TrueAxis via TaServer; Play Games Saved Games allows up to 3 MB per file but uses a proprietary replay format and would not sync with in-game replay sharing."

    return-object v0
.end method

.method static signInStatus(Landroid/content/Context;)Ljava/lang/String;
    .registers 3

    .line 42
    invoke-static {}, Lcom/trueaxis/modmenu/PlayGamesAssessment;->isPlayGamesConfigured()Z

    move-result v0

    if-eqz v0, :cond_24

    .line 43
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Play Games app ID configured for "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Lcom/trueaxis/modmenu/PlayGamesAssessment;->packageName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, " \u2014 SDK wiring still pending."

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 46
    :cond_24
    const-string p0, "Play Games SDK not bundled; sign-in unavailable."

    return-object p0
.end method
