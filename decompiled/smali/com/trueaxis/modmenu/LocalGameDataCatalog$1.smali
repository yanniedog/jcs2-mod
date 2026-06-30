.class Lcom/trueaxis/modmenu/LocalGameDataCatalog$1;
.super Ljava/lang/Object;
.source "LocalGameDataCatalog.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trueaxis/modmenu/LocalGameDataCatalog;->listEntries(Landroid/content/Context;)Ljava/util/List;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lcom/trueaxis/modmenu/LocalGameDataCatalog$Entry;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 95
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/trueaxis/modmenu/LocalGameDataCatalog$Entry;Lcom/trueaxis/modmenu/LocalGameDataCatalog$Entry;)I
    .registers 3

    .line 97
    iget-object p1, p1, Lcom/trueaxis/modmenu/LocalGameDataCatalog$Entry;->name:Ljava/lang/String;

    iget-object p2, p2, Lcom/trueaxis/modmenu/LocalGameDataCatalog$Entry;->name:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            null,
            null
        }
    .end annotation

    .line 95
    check-cast p1, Lcom/trueaxis/modmenu/LocalGameDataCatalog$Entry;

    check-cast p2, Lcom/trueaxis/modmenu/LocalGameDataCatalog$Entry;

    invoke-virtual {p0, p1, p2}, Lcom/trueaxis/modmenu/LocalGameDataCatalog$1;->compare(Lcom/trueaxis/modmenu/LocalGameDataCatalog$Entry;Lcom/trueaxis/modmenu/LocalGameDataCatalog$Entry;)I

    move-result p1

    return p1
.end method
