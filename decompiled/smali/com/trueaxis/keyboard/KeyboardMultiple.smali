.class public Lcom/trueaxis/keyboard/KeyboardMultiple;
.super Ljava/lang/Object;
.source "KeyboardMultiple.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trueaxis/keyboard/KeyboardMultiple$MultipleInputBox;
    }
.end annotation


# static fields
.field private static backgroundType:I = 0x1

.field static boxList:Ljava/util/ArrayList; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/trueaxis/keyboard/KeyboardMultiple$MultipleInputBox;",
            ">;"
        }
    .end annotation
.end field

.field static customPopUpTouchListenr:Landroid/view/View$OnTouchListener; = null

.field private static editPlaceHolerStr:Ljava/lang/String; = ""

.field private static editStr:Ljava/lang/String; = ""

.field private static gravityType:I = 0x0

.field static hintList:Ljava/util/ArrayList; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static isKeyboardUp:Z = false

.field private static mAlpha:I = 0xff

.field private static m_currentActiveBoxId:I = -0x1

.field private static m_currentNewBoxId:I

.field private static m_fAngleDegrees:F

.field private static m_fH:F

.field private static m_fScale:F

.field private static m_fW:F

.field private static mainLayout:Landroid/widget/LinearLayout;

.field private static originalDrawable:Landroid/graphics/drawable/Drawable;

.field public static popUp:Landroid/widget/PopupWindow;

.field public static restorePopup:Z

.field private static textBefore:Ljava/lang/String;

.field private static textColor:I

.field private static x_Offset:I

.field private static y_Offset:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 71
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/trueaxis/keyboard/KeyboardMultiple;->boxList:Ljava/util/ArrayList;

    .line 72
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/trueaxis/keyboard/KeyboardMultiple;->hintList:Ljava/util/ArrayList;

    .line 267
    new-instance v0, Lcom/trueaxis/keyboard/KeyboardMultiple$4;

    invoke-direct {v0}, Lcom/trueaxis/keyboard/KeyboardMultiple$4;-><init>()V

    sput-object v0, Lcom/trueaxis/keyboard/KeyboardMultiple;->customPopUpTouchListenr:Landroid/view/View$OnTouchListener;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$002(Z)Z
    .locals 0

    .line 36
    sput-boolean p0, Lcom/trueaxis/keyboard/KeyboardMultiple;->isKeyboardUp:Z

    return p0
.end method

.method static synthetic access$100()I
    .locals 1

    .line 36
    sget v0, Lcom/trueaxis/keyboard/KeyboardMultiple;->x_Offset:I

    return v0
.end method

.method static synthetic access$1002(F)F
    .locals 0

    .line 36
    sput p0, Lcom/trueaxis/keyboard/KeyboardMultiple;->m_fH:F

    return p0
.end method

.method static synthetic access$102(I)I
    .locals 0

    .line 36
    sput p0, Lcom/trueaxis/keyboard/KeyboardMultiple;->x_Offset:I

    return p0
.end method

.method static synthetic access$1100(Lcom/trueaxis/keyboard/KeyboardMultiple;)Landroid/widget/EditText;
    .locals 0

    .line 36
    invoke-direct {p0}, Lcom/trueaxis/keyboard/KeyboardMultiple;->createEditBox()Landroid/widget/EditText;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1200()I
    .locals 1

    .line 36
    sget v0, Lcom/trueaxis/keyboard/KeyboardMultiple;->gravityType:I

    return v0
.end method

.method static synthetic access$1202(I)I
    .locals 0

    .line 36
    sput p0, Lcom/trueaxis/keyboard/KeyboardMultiple;->gravityType:I

    return p0
.end method

.method static synthetic access$200()I
    .locals 1

    .line 36
    sget v0, Lcom/trueaxis/keyboard/KeyboardMultiple;->y_Offset:I

    return v0
.end method

.method static synthetic access$202(I)I
    .locals 0

    .line 36
    sput p0, Lcom/trueaxis/keyboard/KeyboardMultiple;->y_Offset:I

    return p0
.end method

.method static synthetic access$300()I
    .locals 1

    .line 36
    sget v0, Lcom/trueaxis/keyboard/KeyboardMultiple;->mAlpha:I

    return v0
.end method

.method static synthetic access$302(I)I
    .locals 0

    .line 36
    sput p0, Lcom/trueaxis/keyboard/KeyboardMultiple;->mAlpha:I

    return p0
.end method

.method static synthetic access$402(I)I
    .locals 0

    .line 36
    sput p0, Lcom/trueaxis/keyboard/KeyboardMultiple;->m_currentActiveBoxId:I

    return p0
.end method

.method static synthetic access$500()Ljava/lang/String;
    .locals 1

    .line 36
    sget-object v0, Lcom/trueaxis/keyboard/KeyboardMultiple;->editPlaceHolerStr:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$502(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 36
    sput-object p0, Lcom/trueaxis/keyboard/KeyboardMultiple;->editPlaceHolerStr:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$600()I
    .locals 1

    .line 36
    sget v0, Lcom/trueaxis/keyboard/KeyboardMultiple;->textColor:I

    return v0
.end method

.method static synthetic access$602(I)I
    .locals 0

    .line 36
    sput p0, Lcom/trueaxis/keyboard/KeyboardMultiple;->textColor:I

    return p0
.end method

.method static synthetic access$700()Ljava/lang/String;
    .locals 1

    .line 36
    sget-object v0, Lcom/trueaxis/keyboard/KeyboardMultiple;->editStr:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$702(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 36
    sput-object p0, Lcom/trueaxis/keyboard/KeyboardMultiple;->editStr:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$800()Landroid/widget/LinearLayout;
    .locals 1

    .line 36
    sget-object v0, Lcom/trueaxis/keyboard/KeyboardMultiple;->mainLayout:Landroid/widget/LinearLayout;

    return-object v0
.end method

.method static synthetic access$802(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;
    .locals 0

    .line 36
    sput-object p0, Lcom/trueaxis/keyboard/KeyboardMultiple;->mainLayout:Landroid/widget/LinearLayout;

    return-object p0
.end method

.method static synthetic access$902(F)F
    .locals 0

    .line 36
    sput p0, Lcom/trueaxis/keyboard/KeyboardMultiple;->m_fW:F

    return p0
.end method

.method private createEditBox()Landroid/widget/EditText;
    .locals 5

    .line 85
    new-instance v0, Lcom/trueaxis/keyboard/KeyboardMultiple$1;

    invoke-static {}, Lcom/trueaxis/game/Interface;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/trueaxis/keyboard/KeyboardMultiple$1;-><init>(Lcom/trueaxis/keyboard/KeyboardMultiple;Landroid/content/Context;)V

    .line 128
    new-instance v1, Lcom/trueaxis/keyboard/KeyboardMultiple$2;

    invoke-direct {v1, p0}, Lcom/trueaxis/keyboard/KeyboardMultiple$2;-><init>(Lcom/trueaxis/keyboard/KeyboardMultiple;)V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    const v1, 0x80091

    .line 191
    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setInputType(I)V

    const/4 v1, 0x1

    new-array v2, v1, [Landroid/text/InputFilter;

    .line 192
    new-instance v3, Landroid/text/InputFilter$LengthFilter;

    const/16 v4, 0x40

    invoke-direct {v3, v4}, Landroid/text/InputFilter$LengthFilter;-><init>(I)V

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setFilters([Landroid/text/InputFilter;)V

    .line 193
    invoke-virtual {v0, v4}, Landroid/widget/EditText;->setCursorVisible(Z)V

    const-string v2, ""

    .line 194
    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 196
    sget v2, Lcom/trueaxis/keyboard/KeyboardMultiple;->gravityType:I

    if-eqz v2, :cond_0

    .line 197
    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setGravity(I)V

    :cond_0
    const/high16 v2, 0x10000000

    .line 198
    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setImeOptions(I)V

    .line 199
    sget-object v2, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setTypeface(Landroid/graphics/Typeface;)V

    const/16 v2, 0x1f4

    .line 200
    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setWidth(I)V

    const/16 v2, 0x32

    .line 201
    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setHeight(I)V

    .line 202
    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setMaxLines(I)V

    .line 204
    new-instance v1, Lcom/trueaxis/keyboard/KeyboardMultiple$3;

    invoke-direct {v1, p0}, Lcom/trueaxis/keyboard/KeyboardMultiple$3;-><init>(Lcom/trueaxis/keyboard/KeyboardMultiple;)V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 247
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x2

    invoke-direct {v1, v2, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 248
    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 250
    sget v1, Lcom/trueaxis/keyboard/KeyboardMultiple;->m_currentNewBoxId:I

    add-int/lit8 v2, v1, 0x1

    sput v2, Lcom/trueaxis/keyboard/KeyboardMultiple;->m_currentNewBoxId:I

    .line 251
    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setId(I)V

    .line 253
    sget-object v2, Lcom/trueaxis/keyboard/KeyboardMultiple;->hintList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 254
    sget-object v2, Lcom/trueaxis/keyboard/KeyboardMultiple;->hintList:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/CharSequence;

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 256
    :cond_1
    sput v1, Lcom/trueaxis/keyboard/KeyboardMultiple;->m_currentActiveBoxId:I

    .line 258
    new-instance v1, Lcom/trueaxis/keyboard/KeyboardMultiple$MultipleInputBox;

    invoke-direct {v1, p0}, Lcom/trueaxis/keyboard/KeyboardMultiple$MultipleInputBox;-><init>(Lcom/trueaxis/keyboard/KeyboardMultiple;)V

    .line 259
    iput-object v0, v1, Lcom/trueaxis/keyboard/KeyboardMultiple$MultipleInputBox;->editBox:Landroid/widget/EditText;

    .line 261
    sget-object v2, Lcom/trueaxis/keyboard/KeyboardMultiple;->boxList:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0
.end method

.method public static destroyPopUpWindowForPause()V
    .locals 2

    .line 627
    invoke-static {}, Lcom/trueaxis/game/Interface;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/trueaxis/keyboard/KeyboardMultiple$8;

    invoke-direct {v1}, Lcom/trueaxis/keyboard/KeyboardMultiple$8;-><init>()V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method private static getCurrentActiveBox()Lcom/trueaxis/keyboard/KeyboardMultiple$MultipleInputBox;
    .locals 2

    .line 76
    sget-object v0, Lcom/trueaxis/keyboard/KeyboardMultiple;->boxList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 77
    sget v1, Lcom/trueaxis/keyboard/KeyboardMultiple;->m_currentActiveBoxId:I

    if-lez v1, :cond_0

    if-ge v1, v0, :cond_0

    .line 78
    sget-object v0, Lcom/trueaxis/keyboard/KeyboardMultiple;->boxList:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/trueaxis/keyboard/KeyboardMultiple$MultipleInputBox;

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method


# virtual methods
.method public createPopUpWindow(IIIIII)V
    .locals 10

    .line 422
    invoke-static {}, Lcom/trueaxis/game/Interface;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    new-instance v9, Lcom/trueaxis/keyboard/KeyboardMultiple$6;

    move-object v1, v9

    move-object v2, p0

    move v3, p4

    move v4, p5

    move v5, p2

    move v6, p3

    move/from16 v7, p6

    move v8, p1

    invoke-direct/range {v1 .. v8}, Lcom/trueaxis/keyboard/KeyboardMultiple$6;-><init>(Lcom/trueaxis/keyboard/KeyboardMultiple;IIIIII)V

    invoke-virtual {v0, v9}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public destroyPopUpWindow()V
    .locals 2

    .line 611
    invoke-static {}, Lcom/trueaxis/game/Interface;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/trueaxis/keyboard/KeyboardMultiple$7;

    invoke-direct {v1, p0}, Lcom/trueaxis/keyboard/KeyboardMultiple$7;-><init>(Lcom/trueaxis/keyboard/KeyboardMultiple;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public getTextboxString(I)Ljava/lang/String;
    .locals 2

    const-string v0, ""

    .line 769
    sput-object v0, Lcom/trueaxis/keyboard/KeyboardMultiple;->editStr:Ljava/lang/String;

    .line 771
    invoke-static {}, Lcom/trueaxis/game/Interface;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/trueaxis/keyboard/KeyboardMultiple$13;

    invoke-direct {v1, p0, p1}, Lcom/trueaxis/keyboard/KeyboardMultiple$13;-><init>(Lcom/trueaxis/keyboard/KeyboardMultiple;I)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 785
    sget-object p1, Lcom/trueaxis/keyboard/KeyboardMultiple;->editStr:Ljava/lang/String;

    return-object p1
.end method

.method public hideAllBox()V
    .locals 2

    .line 401
    invoke-static {}, Lcom/trueaxis/game/Interface;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/trueaxis/keyboard/KeyboardMultiple$5;

    invoke-direct {v1, p0}, Lcom/trueaxis/keyboard/KeyboardMultiple$5;-><init>(Lcom/trueaxis/keyboard/KeyboardMultiple;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public isKeyboardUp()Z
    .locals 1

    .line 790
    sget-boolean v0, Lcom/trueaxis/keyboard/KeyboardMultiple;->isKeyboardUp:Z

    return v0
.end method

.method public setHintText(ILjava/lang/String;)V
    .locals 0

    .line 382
    sget-object p1, Lcom/trueaxis/keyboard/KeyboardMultiple;->hintList:Ljava/util/ArrayList;

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public setSecureText(I)V
    .locals 2

    .line 846
    invoke-static {}, Lcom/trueaxis/game/Interface;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/trueaxis/keyboard/KeyboardMultiple$17;

    invoke-direct {v1, p0, p1}, Lcom/trueaxis/keyboard/KeyboardMultiple$17;-><init>(Lcom/trueaxis/keyboard/KeyboardMultiple;I)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public setTextBoxAlignTextCenter(I)V
    .locals 2

    .line 829
    invoke-static {}, Lcom/trueaxis/game/Interface;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/trueaxis/keyboard/KeyboardMultiple$16;

    invoke-direct {v1, p0, p1}, Lcom/trueaxis/keyboard/KeyboardMultiple$16;-><init>(Lcom/trueaxis/keyboard/KeyboardMultiple;I)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public setTextBoxAlignTextLeft(I)V
    .locals 2

    .line 795
    invoke-static {}, Lcom/trueaxis/game/Interface;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/trueaxis/keyboard/KeyboardMultiple$14;

    invoke-direct {v1, p0, p1}, Lcom/trueaxis/keyboard/KeyboardMultiple$14;-><init>(Lcom/trueaxis/keyboard/KeyboardMultiple;I)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public setTextBoxAlignTextRight(I)V
    .locals 2

    .line 812
    invoke-static {}, Lcom/trueaxis/game/Interface;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/trueaxis/keyboard/KeyboardMultiple$15;

    invoke-direct {v1, p0, p1}, Lcom/trueaxis/keyboard/KeyboardMultiple$15;-><init>(Lcom/trueaxis/keyboard/KeyboardMultiple;I)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public setTextboxAlpha(I)V
    .locals 2

    .line 749
    invoke-static {}, Lcom/trueaxis/game/Interface;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/trueaxis/keyboard/KeyboardMultiple$12;

    invoke-direct {v1, p0, p1}, Lcom/trueaxis/keyboard/KeyboardMultiple$12;-><init>(Lcom/trueaxis/keyboard/KeyboardMultiple;I)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public setTextboxBounds(IIIIFF)V
    .locals 6

    .line 643
    invoke-static {}, Lcom/trueaxis/game/Interface;->getContext()Landroid/content/Context;

    move-result-object p5

    check-cast p5, Landroid/app/Activity;

    new-instance p6, Lcom/trueaxis/keyboard/KeyboardMultiple$9;

    move-object v0, p6

    move-object v1, p0

    move v2, p3

    move v3, p4

    move v4, p1

    move v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/trueaxis/keyboard/KeyboardMultiple$9;-><init>(Lcom/trueaxis/keyboard/KeyboardMultiple;IIII)V

    invoke-virtual {p5, p6}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public setTextboxPlaceholderString(ILjava/lang/String;)V
    .locals 2

    .line 730
    invoke-static {}, Lcom/trueaxis/game/Interface;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/trueaxis/keyboard/KeyboardMultiple$11;

    invoke-direct {v1, p0, p1, p2}, Lcom/trueaxis/keyboard/KeyboardMultiple$11;-><init>(Lcom/trueaxis/keyboard/KeyboardMultiple;ILjava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public setTextboxString(ILjava/lang/String;)V
    .locals 2

    .line 711
    invoke-static {}, Lcom/trueaxis/game/Interface;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/trueaxis/keyboard/KeyboardMultiple$10;

    invoke-direct {v1, p0, p1, p2}, Lcom/trueaxis/keyboard/KeyboardMultiple$10;-><init>(Lcom/trueaxis/keyboard/KeyboardMultiple;ILjava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public showSystemMessage(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 895
    invoke-static {}, Lcom/trueaxis/game/Interface;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    .line 896
    invoke-static {}, Lcom/trueaxis/game/Interface;->getContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Landroid/app/Activity;

    new-instance v2, Lcom/trueaxis/keyboard/KeyboardMultiple$18;

    invoke-direct {v2, p0, v0, p2, p1}, Lcom/trueaxis/keyboard/KeyboardMultiple$18;-><init>(Lcom/trueaxis/keyboard/KeyboardMultiple;Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method
