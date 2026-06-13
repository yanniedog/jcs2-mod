.class public Lcom/trueaxis/cLib/TrueaxisLib;
.super Ljava/lang/Object;
.source "TrueaxisLib.java"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "trueaxis"

    .line 11
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static native AdMobNotifyAdFinished()V
.end method

.method public static native AdMobNotifyAdLoaded()V
.end method

.method public static native CancelPicker()V
.end method

.method public static native DeviceTweaks(II)V
.end method

.method public static native DlcError(J)V
.end method

.method public static native DlcOnloaded(J)V
.end method

.method public static native EveryplayFinishedRecordingCallback()V
.end method

.method public static native EveryplayHiddenCallback()V
.end method

.method public static native EveryplayReadyForRecording(I)V
.end method

.method public static native EveryplayStartRecordingCallback()V
.end method

.method public static native ExperiaZhack()V
.end method

.method public static native GetBoardType()I
.end method

.method public static native GetWordType()I
.end method

.method public static native IAPCheckFail(J)V
.end method

.method public static native IAPCheckSuccess(IIIIIJ)V
.end method

.method public static native JaypadIsSupported()V
.end method

.method public static native KeyboardExecuteOnChangeCallback()V
.end method

.method public static native KeyboardExecuteOnEndEditingCallback()V
.end method

.method public static native KeyboardExecuteOnStartEditingCallback()V
.end method

.method public static native KeyboardMultipleExecuteOnChangeCallback()V
.end method

.method public static native KeyboardMultipleExecuteOnEndEditingCallback()V
.end method

.method public static native KeyboardMultipleExecuteOnStartEditingCallback()V
.end method

.method public static native LoadFromPicker(IIZ[I)V
.end method

.method public static native OnDeepLinkAndroid(Ljava/lang/String;)V
.end method

.method public static native OnGooglePlayServicesOnConnection(I)V
.end method

.method public static native OnGooglePlayServicesReadFileComplete([BLjava/lang/String;)V
.end method

.method public static native OnGooglePlayServicesSaveFileComplete(ZLjava/lang/String;)V
.end method

.method public static native OnPutToSleep()V
.end method

.method public static native OnWakeUp()V
.end method

.method public static native Render()V
.end method

.method public static native ResetFrameDelay()V
.end method

.method public static native ResetIAPMessages()V
.end method

.method public static native RestoreDLC(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public static native ServerError(II)V
.end method

.method public static native ServerResponse([BII)V
.end method

.method public static native SetDeviceRotation(I)V
.end method

.method public static native SetIsAboveIceCreamSandwich()V
.end method

.method public static native SetMemoryLimits(I)V
.end method

.method public static native SetOSScreenSize(II)V
.end method

.method public static native SetRestart(II)V
.end method

.method public static native SetSyncInfo(FI)V
.end method

.method public static native StartJoypad(I)V
.end method

.method public static native StopJoypad()V
.end method

.method public static native VerifyCompleted()V
.end method

.method public static native accountSwitched()V
.end method

.method public static native alreadyEntitled(Ljava/lang/String;)V
.end method

.method public static native fbAddFriend(ILjava/lang/String;Ljava/lang/String;)V
.end method

.method public static native fbDidLogin()V
.end method

.method public static native fbDidLogout()V
.end method

.method public static native fbDidNotLogin()V
.end method

.method public static native fbEndFriendsList()V
.end method

.method public static native fbEndFriendsListForSKATE()V
.end method

.method public static native fbGetFriendsComplete()V
.end method

.method public static native fbSetFriendCount(I)V
.end method

.method public static native fbSetFriendsList(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public static native fbSetLoginState(I)V
.end method

.method public static native fbSetUserInfo(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public static native fbStartFriendsList(I)V
.end method

.method public static native fillAudioForKamcord([SI)V
.end method

.method public static native initKamcord(Landroid/app/Activity;)V
.end method

.method public static native initLowLatencySound(ZII)V
.end method

.method public static native initStore(Z)V
.end method

.method public static native itemDataFail()V
.end method

.method public static native listenerKamcordCallback()V
.end method

.method public static native populateStore(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public static native purchaseFail(Ljava/lang/String;I)V
.end method

.method public static native purchaseSet(Ljava/lang/String;)V
.end method

.method public static native purchaseSuccess(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
.end method

.method public static native resetRestoreMenu()V
.end method

.method public static native setDlcForDwnload(J)V
.end method

.method public static native unavaiableItems(Ljava/lang/String;)V
.end method

.method public static native updateDlcRecievedSize(I[BJ)V
.end method

.method public static native updateDlcTotalSize(IJ)V
.end method
