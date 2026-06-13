.class public Lcom/trueaxis/keyboard/Keyboard;
.super Ljava/lang/Object;
.source "Keyboard.java"


# static fields
.field private static backgroundType:I = 0x1

.field static customPopUpTouchListenr:Landroid/view/View$OnTouchListener; = null

.field private static editBox:Landroid/widget/EditText; = null

.field private static editPlaceHolerStr:Ljava/lang/String; = ""

.field private static editStr:Ljava/lang/String; = ""

.field private static gravityType:I = 0x0

.field private static isKeyboardUp:Z = false

.field private static mAlpha:I = 0xff

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

    .line 183
    new-instance v0, Lcom/trueaxis/keyboard/Keyboard$4;

    invoke-direct {v0}, Lcom/trueaxis/keyboard/Keyboard$4;-><init>()V

    sput-object v0, Lcom/trueaxis/keyboard/Keyboard;->customPopUpTouchListenr:Landroid/view/View$OnTouchListener;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    .line 30
    sget-object v0, Lcom/trueaxis/keyboard/Keyboard;->editPlaceHolerStr:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$002(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 30
    sput-object p0, Lcom/trueaxis/keyboard/Keyboard;->editPlaceHolerStr:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$100()I
    .locals 1

    .line 30
    sget v0, Lcom/trueaxis/keyboard/Keyboard;->mAlpha:I

    return v0
.end method

.method static synthetic access$1000()Landroid/widget/LinearLayout;
    .locals 1

    .line 30
    sget-object v0, Lcom/trueaxis/keyboard/Keyboard;->mainLayout:Landroid/widget/LinearLayout;

    return-object v0
.end method

.method static synthetic access$102(I)I
    .locals 0

    .line 30
    sput p0, Lcom/trueaxis/keyboard/Keyboard;->mAlpha:I

    return p0
.end method

.method static synthetic access$1100()I
    .locals 1

    .line 30
    sget v0, Lcom/trueaxis/keyboard/Keyboard;->backgroundType:I

    return v0
.end method

.method static synthetic access$1102(I)I
    .locals 0

    .line 30
    sput p0, Lcom/trueaxis/keyboard/Keyboard;->backgroundType:I

    return p0
.end method

.method static synthetic access$1200()Landroid/graphics/drawable/Drawable;
    .locals 1

    .line 30
    sget-object v0, Lcom/trueaxis/keyboard/Keyboard;->originalDrawable:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method static synthetic access$1202(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 30
    sput-object p0, Lcom/trueaxis/keyboard/Keyboard;->originalDrawable:Landroid/graphics/drawable/Drawable;

    return-object p0
.end method

.method static synthetic access$1300()I
    .locals 1

    .line 30
    sget v0, Lcom/trueaxis/keyboard/Keyboard;->gravityType:I

    return v0
.end method

.method static synthetic access$1302(I)I
    .locals 0

    .line 30
    sput p0, Lcom/trueaxis/keyboard/Keyboard;->gravityType:I

    return p0
.end method

.method static synthetic access$1400()F
    .locals 1

    .line 30
    sget v0, Lcom/trueaxis/keyboard/Keyboard;->m_fScale:F

    return v0
.end method

.method static synthetic access$1402(F)F
    .locals 0

    .line 30
    sput p0, Lcom/trueaxis/keyboard/Keyboard;->m_fScale:F

    return p0
.end method

.method static synthetic access$1500()F
    .locals 1

    .line 30
    sget v0, Lcom/trueaxis/keyboard/Keyboard;->m_fAngleDegrees:F

    return v0
.end method

.method static synthetic access$1502(F)F
    .locals 0

    .line 30
    sput p0, Lcom/trueaxis/keyboard/Keyboard;->m_fAngleDegrees:F

    return p0
.end method

.method static synthetic access$1600()F
    .locals 1

    .line 30
    sget v0, Lcom/trueaxis/keyboard/Keyboard;->m_fW:F

    return v0
.end method

.method static synthetic access$1602(F)F
    .locals 0

    .line 30
    sput p0, Lcom/trueaxis/keyboard/Keyboard;->m_fW:F

    return p0
.end method

.method static synthetic access$1700()F
    .locals 1

    .line 30
    sget v0, Lcom/trueaxis/keyboard/Keyboard;->m_fH:F

    return v0
.end method

.method static synthetic access$1702(F)F
    .locals 0

    .line 30
    sput p0, Lcom/trueaxis/keyboard/Keyboard;->m_fH:F

    return p0
.end method

.method static synthetic access$200()Landroid/widget/EditText;
    .locals 1

    .line 30
    sget-object v0, Lcom/trueaxis/keyboard/Keyboard;->editBox:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$300()I
    .locals 1

    .line 30
    sget v0, Lcom/trueaxis/keyboard/Keyboard;->textColor:I

    return v0
.end method

.method static synthetic access$302(I)I
    .locals 0

    .line 30
    sput p0, Lcom/trueaxis/keyboard/Keyboard;->textColor:I

    return p0
.end method

.method static synthetic access$400()Ljava/lang/String;
    .locals 1

    .line 30
    sget-object v0, Lcom/trueaxis/keyboard/Keyboard;->editStr:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$402(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 30
    sput-object p0, Lcom/trueaxis/keyboard/Keyboard;->editStr:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$502(Z)Z
    .locals 0

    .line 30
    sput-boolean p0, Lcom/trueaxis/keyboard/Keyboard;->isKeyboardUp:Z

    return p0
.end method

.method static synthetic access$600()Ljava/lang/String;
    .locals 1

    .line 30
    sget-object v0, Lcom/trueaxis/keyboard/Keyboard;->textBefore:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$602(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 30
    sput-object p0, Lcom/trueaxis/keyboard/Keyboard;->textBefore:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$700()I
    .locals 1

    .line 30
    sget v0, Lcom/trueaxis/keyboard/Keyboard;->x_Offset:I

    return v0
.end method

.method static synthetic access$702(I)I
    .locals 0

    .line 30
    sput p0, Lcom/trueaxis/keyboard/Keyboard;->x_Offset:I

    return p0
.end method

.method static synthetic access$800()I
    .locals 1

    .line 30
    sget v0, Lcom/trueaxis/keyboard/Keyboard;->y_Offset:I

    return v0
.end method

.method static synthetic access$802(I)I
    .locals 0

    .line 30
    sput p0, Lcom/trueaxis/keyboard/Keyboard;->y_Offset:I

    return p0
.end method

.method static synthetic access$900()V
    .locals 0

    .line 30
    invoke-static {}, Lcom/trueaxis/keyboard/Keyboard;->createEditBox()V

    return-void
.end method

.method private static createEditBox()V
    .locals 4

    .line 54
    new-instance v0, Lcom/trueaxis/keyboard/Keyboard$1;

    invoke-static {}, Lcom/trueaxis/game/Interface;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/trueaxis/keyboard/Keyboard$1;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/trueaxis/keyboard/Keyboard;->editBox:Landroid/widget/EditText;

    .line 86
    sget-object v0, Lcom/trueaxis/keyboard/Keyboard;->editBox:Landroid/widget/EditText;

    new-instance v1, Lcom/trueaxis/keyboard/Keyboard$2;

    invoke-direct {v1}, Lcom/trueaxis/keyboard/Keyboard$2;-><init>()V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 143
    sget-object v0, Lcom/trueaxis/keyboard/Keyboard;->editBox:Landroid/widget/EditText;

    const v1, 0x80091

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setInputType(I)V

    .line 144
    sget-object v0, Lcom/trueaxis/keyboard/Keyboard;->editBox:Landroid/widget/EditText;

    const/4 v1, 0x1

    new-array v1, v1, [Landroid/text/InputFilter;

    new-instance v2, Landroid/text/InputFilter$LengthFilter;

    const/16 v3, 0x40

    invoke-direct {v2, v3}, Landroid/text/InputFilter$LengthFilter;-><init>(I)V

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setFilters([Landroid/text/InputFilter;)V

    .line 145
    sget-object v0, Lcom/trueaxis/keyboard/Keyboard;->editBox:Landroid/widget/EditText;

    invoke-virtual {v0, v3}, Landroid/widget/EditText;->setCursorVisible(Z)V

    .line 146
    sget-object v0, Lcom/trueaxis/keyboard/Keyboard;->editBox:Landroid/widget/EditText;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 147
    sget v0, Lcom/trueaxis/keyboard/Keyboard;->gravityType:I

    if-eqz v0, :cond_0

    .line 148
    sget-object v1, Lcom/trueaxis/keyboard/Keyboard;->editBox:Landroid/widget/EditText;

    invoke-virtual {v1, v0}, Landroid/widget/EditText;->setGravity(I)V

    .line 149
    :cond_0
    sget-object v0, Lcom/trueaxis/keyboard/Keyboard;->editBox:Landroid/widget/EditText;

    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setImeOptions(I)V

    .line 150
    sget-object v0, Lcom/trueaxis/keyboard/Keyboard;->editBox:Landroid/widget/EditText;

    sget-object v1, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setTypeface(Landroid/graphics/Typeface;)V

    .line 152
    sget-object v0, Lcom/trueaxis/keyboard/Keyboard;->editBox:Landroid/widget/EditText;

    new-instance v1, Lcom/trueaxis/keyboard/Keyboard$3;

    invoke-direct {v1}, Lcom/trueaxis/keyboard/Keyboard$3;-><init>()V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 180
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-static {}, Lcom/trueaxis/game/Interface;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/trueaxis/keyboard/Keyboard;->mainLayout:Landroid/widget/LinearLayout;

    return-void
.end method

.method public static destroyPopUpWindowForPause()V
    .locals 2

    .line 367
    invoke-static {}, Lcom/trueaxis/game/Interface;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/trueaxis/keyboard/Keyboard$8;

    invoke-direct {v1}, Lcom/trueaxis/keyboard/Keyboard$8;-><init>()V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static restorePopUpWindow()V
    .locals 2

    .line 275
    invoke-static {}, Lcom/trueaxis/game/Interface;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/trueaxis/keyboard/Keyboard$6;

    invoke-direct {v1}, Lcom/trueaxis/keyboard/Keyboard$6;-><init>()V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method


# virtual methods
.method public createPopUpWindow()V
    .locals 2

    .line 239
    invoke-static {}, Lcom/trueaxis/game/Interface;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/trueaxis/keyboard/Keyboard$5;

    invoke-direct {v1, p0}, Lcom/trueaxis/keyboard/Keyboard$5;-><init>(Lcom/trueaxis/keyboard/Keyboard;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public destroyPopUpWindow()V
    .locals 2

    .line 351
    invoke-static {}, Lcom/trueaxis/game/Interface;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/trueaxis/keyboard/Keyboard$7;

    invoke-direct {v1, p0}, Lcom/trueaxis/keyboard/Keyboard$7;-><init>(Lcom/trueaxis/keyboard/Keyboard;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public getTextboxString()Ljava/lang/String;
    .locals 1

    .line 503
    sget-object v0, Lcom/trueaxis/keyboard/Keyboard;->editStr:Ljava/lang/String;

    return-object v0
.end method

.method public isKeyboardUp()Z
    .locals 1

    .line 508
    sget-boolean v0, Lcom/trueaxis/keyboard/Keyboard;->isKeyboardUp:Z

    return v0
.end method

.method public setTextBoxAlignTextCenter()V
    .locals 2

    .line 545
    invoke-static {}, Lcom/trueaxis/game/Interface;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/trueaxis/keyboard/Keyboard$15;

    invoke-direct {v1, p0}, Lcom/trueaxis/keyboard/Keyboard$15;-><init>(Lcom/trueaxis/keyboard/Keyboard;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public setTextBoxAlignTextLeft()V
    .locals 2

    .line 513
    invoke-static {}, Lcom/trueaxis/game/Interface;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/trueaxis/keyboard/Keyboard$13;

    invoke-direct {v1, p0}, Lcom/trueaxis/keyboard/Keyboard$13;-><init>(Lcom/trueaxis/keyboard/Keyboard;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public setTextBoxAlignTextRight()V
    .locals 2

    .line 529
    invoke-static {}, Lcom/trueaxis/game/Interface;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/trueaxis/keyboard/Keyboard$14;

    invoke-direct {v1, p0}, Lcom/trueaxis/keyboard/Keyboard$14;-><init>(Lcom/trueaxis/keyboard/Keyboard;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public setTextBoxEnableBackground(I)V
    .locals 2

    .line 561
    invoke-static {}, Lcom/trueaxis/game/Interface;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/trueaxis/keyboard/Keyboard$16;

    invoke-direct {v1, p0, p1}, Lcom/trueaxis/keyboard/Keyboard$16;-><init>(Lcom/trueaxis/keyboard/Keyboard;I)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public setTextboxAlpha(I)V
    .locals 2

    .line 486
    invoke-static {}, Lcom/trueaxis/game/Interface;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/trueaxis/keyboard/Keyboard$12;

    invoke-direct {v1, p0, p1}, Lcom/trueaxis/keyboard/Keyboard$12;-><init>(Lcom/trueaxis/keyboard/Keyboard;I)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public setTextboxBounds(IIIIFF)V
    .locals 10

    .line 383
    invoke-static {}, Lcom/trueaxis/game/Interface;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    new-instance v9, Lcom/trueaxis/keyboard/Keyboard$9;

    move-object v1, v9

    move-object v2, p0

    move v3, p3

    move v4, p4

    move v5, p1

    move v6, p2

    move v7, p5

    move/from16 v8, p6

    invoke-direct/range {v1 .. v8}, Lcom/trueaxis/keyboard/Keyboard$9;-><init>(Lcom/trueaxis/keyboard/Keyboard;IIIIFF)V

    invoke-virtual {v0, v9}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public setTextboxPlaceholderString(Ljava/lang/String;)V
    .locals 2

    .line 468
    invoke-static {}, Lcom/trueaxis/game/Interface;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/trueaxis/keyboard/Keyboard$11;

    invoke-direct {v1, p0, p1}, Lcom/trueaxis/keyboard/Keyboard$11;-><init>(Lcom/trueaxis/keyboard/Keyboard;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public setTextboxString(Ljava/lang/String;)V
    .locals 2

    .line 450
    invoke-static {}, Lcom/trueaxis/game/Interface;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/trueaxis/keyboard/Keyboard$10;

    invoke-direct {v1, p0, p1}, Lcom/trueaxis/keyboard/Keyboard$10;-><init>(Lcom/trueaxis/keyboard/Keyboard;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method
