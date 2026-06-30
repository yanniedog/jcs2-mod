.class final Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$FreeCamWindowCallback;
.super Ljava/lang/Object;
.source "ReplayFreeCameraOverlay.java"

# interfaces
.implements Landroid/view/Window$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "FreeCamWindowCallback"
.end annotation


# instance fields
.field private final controller:Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;

.field private final delegate:Landroid/view/Window$Callback;


# direct methods
.method constructor <init>(Landroid/view/Window$Callback;Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;)V
    .registers 3

    .line 160
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 161
    iput-object p1, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$FreeCamWindowCallback;->delegate:Landroid/view/Window$Callback;

    .line 162
    iput-object p2, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$FreeCamWindowCallback;->controller:Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;

    .line 163
    return-void
.end method


# virtual methods
.method public dispatchGenericMotionEvent(Landroid/view/MotionEvent;)Z
    .registers 3

    .line 196
    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$FreeCamWindowCallback;->delegate:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->dispatchGenericMotionEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .registers 3

    .line 184
    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$FreeCamWindowCallback;->delegate:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method public dispatchKeyShortcutEvent(Landroid/view/KeyEvent;)Z
    .registers 3

    .line 188
    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$FreeCamWindowCallback;->delegate:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->dispatchKeyShortcutEvent(Landroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method public dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z
    .registers 3

    .line 200
    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$FreeCamWindowCallback;->delegate:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z

    move-result p1

    return p1
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 7

    .line 166
    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$FreeCamWindowCallback;->controller:Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;

    invoke-virtual {v0, p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$GestureController;->onWindowTouch(Landroid/view/MotionEvent;)Ljava/lang/Boolean;

    move-result-object v0

    .line 167
    if-eqz v0, :cond_6b

    .line 169
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v1

    const/4 v2, 0x1

    if-eq v1, v2, :cond_16

    .line 170
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v1

    const/4 v2, 0x3

    if-ne v1, v2, :cond_66

    .line 171
    :cond_16
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_1f

    const-string v1, "G"

    goto :goto_21

    :cond_1f
    const-string v1, "F"

    .line 172
    :goto_21
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_2a

    const-string v2, "gesture_consumed"

    goto :goto_2c

    :cond_2a
    const-string v2, "tap_passed_to_game"

    :goto_2c
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "{\"action\":"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 173
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ",\"pointerCount\":"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 174
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result p1

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v3, ",\"consumed\":"

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v3, "}"

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 171
    const-string v3, "ReplayFreeCameraOverlay.java:dispatchTouchEvent"

    # invokes: Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->agentLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {v1, v3, v2, p1}, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay;->access$000(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 178
    :cond_66
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    return p1

    .line 180
    :cond_6b
    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$FreeCamWindowCallback;->delegate:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public dispatchTrackballEvent(Landroid/view/MotionEvent;)Z
    .registers 3

    .line 192
    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$FreeCamWindowCallback;->delegate:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->dispatchTrackballEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public onActionModeFinished(Landroid/view/ActionMode;)V
    .registers 3

    .line 269
    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$FreeCamWindowCallback;->delegate:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->onActionModeFinished(Landroid/view/ActionMode;)V

    .line 270
    return-void
.end method

.method public onActionModeStarted(Landroid/view/ActionMode;)V
    .registers 3

    .line 265
    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$FreeCamWindowCallback;->delegate:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->onActionModeStarted(Landroid/view/ActionMode;)V

    .line 266
    return-void
.end method

.method public onAttachedToWindow()V
    .registers 2

    .line 236
    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$FreeCamWindowCallback;->delegate:Landroid/view/Window$Callback;

    invoke-interface {v0}, Landroid/view/Window$Callback;->onAttachedToWindow()V

    .line 237
    return-void
.end method

.method public onContentChanged()V
    .registers 2

    .line 228
    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$FreeCamWindowCallback;->delegate:Landroid/view/Window$Callback;

    invoke-interface {v0}, Landroid/view/Window$Callback;->onContentChanged()V

    .line 229
    return-void
.end method

.method public onCreatePanelMenu(ILandroid/view/Menu;)Z
    .registers 4

    .line 208
    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$FreeCamWindowCallback;->delegate:Landroid/view/Window$Callback;

    invoke-interface {v0, p1, p2}, Landroid/view/Window$Callback;->onCreatePanelMenu(ILandroid/view/Menu;)Z

    move-result p1

    return p1
.end method

.method public onCreatePanelView(I)Landroid/view/View;
    .registers 3

    .line 204
    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$FreeCamWindowCallback;->delegate:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->onCreatePanelView(I)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public onDetachedFromWindow()V
    .registers 2

    .line 240
    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$FreeCamWindowCallback;->delegate:Landroid/view/Window$Callback;

    invoke-interface {v0}, Landroid/view/Window$Callback;->onDetachedFromWindow()V

    .line 241
    return-void
.end method

.method public onMenuItemSelected(ILandroid/view/MenuItem;)Z
    .registers 4

    .line 220
    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$FreeCamWindowCallback;->delegate:Landroid/view/Window$Callback;

    invoke-interface {v0, p1, p2}, Landroid/view/Window$Callback;->onMenuItemSelected(ILandroid/view/MenuItem;)Z

    move-result p1

    return p1
.end method

.method public onMenuOpened(ILandroid/view/Menu;)Z
    .registers 4

    .line 216
    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$FreeCamWindowCallback;->delegate:Landroid/view/Window$Callback;

    invoke-interface {v0, p1, p2}, Landroid/view/Window$Callback;->onMenuOpened(ILandroid/view/Menu;)Z

    move-result p1

    return p1
.end method

.method public onPanelClosed(ILandroid/view/Menu;)V
    .registers 4

    .line 244
    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$FreeCamWindowCallback;->delegate:Landroid/view/Window$Callback;

    invoke-interface {v0, p1, p2}, Landroid/view/Window$Callback;->onPanelClosed(ILandroid/view/Menu;)V

    .line 245
    return-void
.end method

.method public onPreparePanel(ILandroid/view/View;Landroid/view/Menu;)Z
    .registers 5

    .line 212
    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$FreeCamWindowCallback;->delegate:Landroid/view/Window$Callback;

    invoke-interface {v0, p1, p2, p3}, Landroid/view/Window$Callback;->onPreparePanel(ILandroid/view/View;Landroid/view/Menu;)Z

    move-result p1

    return p1
.end method

.method public onSearchRequested()Z
    .registers 2

    .line 248
    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$FreeCamWindowCallback;->delegate:Landroid/view/Window$Callback;

    invoke-interface {v0}, Landroid/view/Window$Callback;->onSearchRequested()Z

    move-result v0

    return v0
.end method

.method public onSearchRequested(Landroid/view/SearchEvent;)Z
    .registers 3

    .line 252
    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$FreeCamWindowCallback;->delegate:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->onSearchRequested(Landroid/view/SearchEvent;)Z

    move-result p1

    return p1
.end method

.method public onWindowAttributesChanged(Landroid/view/WindowManager$LayoutParams;)V
    .registers 3

    .line 224
    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$FreeCamWindowCallback;->delegate:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->onWindowAttributesChanged(Landroid/view/WindowManager$LayoutParams;)V

    .line 225
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .registers 3

    .line 232
    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$FreeCamWindowCallback;->delegate:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->onWindowFocusChanged(Z)V

    .line 233
    return-void
.end method

.method public onWindowStartingActionMode(Landroid/view/ActionMode$Callback;)Landroid/view/ActionMode;
    .registers 3

    .line 256
    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$FreeCamWindowCallback;->delegate:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->onWindowStartingActionMode(Landroid/view/ActionMode$Callback;)Landroid/view/ActionMode;

    move-result-object p1

    return-object p1
.end method

.method public onWindowStartingActionMode(Landroid/view/ActionMode$Callback;I)Landroid/view/ActionMode;
    .registers 4

    .line 261
    iget-object v0, p0, Lcom/trueaxis/modmenu/ReplayFreeCameraOverlay$FreeCamWindowCallback;->delegate:Landroid/view/Window$Callback;

    invoke-interface {v0, p1, p2}, Landroid/view/Window$Callback;->onWindowStartingActionMode(Landroid/view/ActionMode$Callback;I)Landroid/view/ActionMode;

    move-result-object p1

    return-object p1
.end method
