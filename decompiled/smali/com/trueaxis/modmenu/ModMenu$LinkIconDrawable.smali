.class abstract Lcom/trueaxis/modmenu/ModMenu$LinkIconDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "ModMenu.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trueaxis/modmenu/ModMenu;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40a
    name = "LinkIconDrawable"
.end annotation


# instance fields
.field final cutout:Landroid/graphics/Paint;

.field final paint:Landroid/graphics/Paint;

.field final path:Landroid/graphics/Path;


# direct methods
.method constructor <init>(II)V
    .registers 5

    .line 963
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 959
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$LinkIconDrawable;->paint:Landroid/graphics/Paint;

    .line 960
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$LinkIconDrawable;->cutout:Landroid/graphics/Paint;

    .line 961
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$LinkIconDrawable;->path:Landroid/graphics/Path;

    .line 964
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$LinkIconDrawable;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 965
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$LinkIconDrawable;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 966
    iget-object p1, p0, Lcom/trueaxis/modmenu/ModMenu$LinkIconDrawable;->cutout:Landroid/graphics/Paint;

    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 967
    iget-object p1, p0, Lcom/trueaxis/modmenu/ModMenu$LinkIconDrawable;->cutout:Landroid/graphics/Paint;

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setColor(I)V

    .line 968
    return-void
.end method


# virtual methods
.method public getIntrinsicHeight()I
    .registers 2

    .line 989
    const/16 v0, 0x18

    return v0
.end method

.method public getIntrinsicWidth()I
    .registers 2

    .line 985
    const/16 v0, 0x18

    return v0
.end method

.method public getOpacity()I
    .registers 2

    .line 981
    const/4 v0, -0x3

    return v0
.end method

.method public setAlpha(I)V
    .registers 3

    .line 971
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$LinkIconDrawable;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 972
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$LinkIconDrawable;->cutout:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 973
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3

    .line 976
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$LinkIconDrawable;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 977
    iget-object v0, p0, Lcom/trueaxis/modmenu/ModMenu$LinkIconDrawable;->cutout:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 978
    return-void
.end method
