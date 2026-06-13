.class public Lcom/trueaxis/backupAgent/TheBackupAgent;
.super Landroid/app/backup/BackupAgentHelper;
.source "TheBackupAgent.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 7
    invoke-direct {p0}, Landroid/app/backup/BackupAgentHelper;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreate()V
    .locals 7

    .line 12
    new-instance v0, Landroid/app/backup/SharedPreferencesBackupHelper;

    const/16 v1, 0xb

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "TAS_0"

    aput-object v3, v1, v2

    const/4 v3, 0x1

    const-string v4, "TAS_1"

    aput-object v4, v1, v3

    const/4 v4, 0x2

    const-string v5, "TAS_2"

    aput-object v5, v1, v4

    const/4 v5, 0x3

    const-string v6, "TAS_3"

    aput-object v6, v1, v5

    const/4 v5, 0x4

    const-string v6, "TAS_4"

    aput-object v6, v1, v5

    const/4 v5, 0x5

    const-string v6, "TAS_5"

    aput-object v6, v1, v5

    const/4 v5, 0x6

    const-string v6, "TAS_6"

    aput-object v6, v1, v5

    const/4 v5, 0x7

    const-string v6, "TAS_7"

    aput-object v6, v1, v5

    const/16 v5, 0x8

    const-string v6, "TAS_8"

    aput-object v6, v1, v5

    const/16 v5, 0x9

    const-string v6, "TAS_9"

    aput-object v6, v1, v5

    const/16 v5, 0xa

    const-string v6, "any"

    aput-object v6, v1, v5

    invoke-direct {v0, p0, v1}, Landroid/app/backup/SharedPreferencesBackupHelper;-><init>(Landroid/content/Context;[Ljava/lang/String;)V

    const-string v1, "SaveData"

    .line 14
    invoke-virtual {p0, v1, v0}, Lcom/trueaxis/backupAgent/TheBackupAgent;->addHelper(Ljava/lang/String;Landroid/app/backup/BackupHelper;)V

    .line 16
    new-instance v0, Landroid/app/backup/FileBackupHelper;

    new-array v1, v4, [Ljava/lang/String;

    const-string v4, "statHeader"

    aput-object v4, v1, v2

    const-string v2, "statsFile"

    aput-object v2, v1, v3

    invoke-direct {v0, p0, v1}, Landroid/app/backup/FileBackupHelper;-><init>(Landroid/content/Context;[Ljava/lang/String;)V

    const-string v1, "SaveFileData"

    .line 17
    invoke-virtual {p0, v1, v0}, Lcom/trueaxis/backupAgent/TheBackupAgent;->addHelper(Ljava/lang/String;Landroid/app/backup/BackupHelper;)V

    return-void
.end method
