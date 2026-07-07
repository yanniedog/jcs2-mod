#!/usr/bin/env bash
# Linux counterpart to the Windows-only scripts/setup_jcs2_llm_emulator.ps1 /
# run_jcs2_llm_iteration.ps1 harness, for Cursor Cloud (Linux/x86_64) VMs.
#
# The Cloud VM has no /dev/kvm (no CPU virtualization), so the emulator runs in
# software (TCG) mode via `-accel off`. That is functional but slow: the mod
# launcher (Java/UI) renders and the modded APK installs/launches, but the heavy
# 3D game itself is not expected to be interactive at TCG speed. Use a real
# device or the documented Windows emulator harness for actual gameplay.
#
# Usage:
#   scripts/linux_android_emulator.sh install   # idempotent SDK + emulator + image + AVD
#   scripts/linux_android_emulator.sh boot       # start headless emulator (backgrounded via tmux if available)
#   scripts/linux_android_emulator.sh status     # adb devices + boot state
#   scripts/linux_android_emulator.sh run [APK]   # install + launch APK (default: ./jcs2-mod.apk)
#   scripts/linux_android_emulator.sh shot [PNG]  # screenshot to PNG (default: /tmp/emulator.png)
#   scripts/linux_android_emulator.sh stop        # kill the running emulator
set -euo pipefail

export ANDROID_HOME="${ANDROID_HOME:-$HOME/android-sdk}"
export ANDROID_SDK_ROOT="$ANDROID_HOME"
export JAVA_HOME="${JAVA_HOME:-/usr/lib/jvm/java-21-openjdk-amd64}"
CMDTOOLS="$ANDROID_HOME/cmdline-tools/latest/bin"
export PATH="$CMDTOOLS:$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator:$ANDROID_HOME/build-tools/36.1.0:$JAVA_HOME/bin:$PATH"

AVD_NAME="${JCS2_AVD:-jcs2-emu}"
SYS_IMAGE="system-images;android-34;google_apis;x86_64"
SERIAL="emulator-5554"
BOOT_LOG="/tmp/jcs2_emulator_boot.log"

install() {
  mkdir -p "$ANDROID_HOME"
  if [ ! -x "$CMDTOOLS/sdkmanager" ]; then
    echo "Installing Android command-line tools..."
    tmp="$(mktemp -d)"
    curl -fsSL -o "$tmp/cmdtools.zip" https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip
    mkdir -p "$ANDROID_HOME/cmdline-tools"
    unzip -q "$tmp/cmdtools.zip" -d "$ANDROID_HOME/cmdline-tools"
    mv "$ANDROID_HOME/cmdline-tools/cmdline-tools" "$ANDROID_HOME/cmdline-tools/latest"
    rm -rf "$tmp"
  fi
  yes | "$CMDTOOLS/sdkmanager" --licenses >/dev/null 2>&1 || true
  "$CMDTOOLS/sdkmanager" \
    "platform-tools" "emulator" \
    "platforms;android-34" "build-tools;36.1.0" \
    "$SYS_IMAGE" >/dev/null
  if ! "$CMDTOOLS/avdmanager" list avd 2>/dev/null | grep -q "Name: $AVD_NAME"; then
    echo "Creating AVD $AVD_NAME..."
    echo "no" | "$CMDTOOLS/avdmanager" create avd -n "$AVD_NAME" -k "$SYS_IMAGE" -d pixel_5 --force
  fi
  echo "Emulator ready. AVD=$AVD_NAME SDK=$ANDROID_HOME"
}

boot() {
  local args=(-avd "$AVD_NAME" -no-window -no-audio -no-boot-anim -no-snapshot \
    -gpu swiftshader_indirect -accel off -no-metrics)
  if command -v tmux >/dev/null 2>&1 && [ -f /exec-daemon/tmux.portal.conf ]; then
    tmux -f /exec-daemon/tmux.portal.conf has-session -t "=android-emulator" 2>/dev/null || \
      tmux -f /exec-daemon/tmux.portal.conf new-session -d -s android-emulator -c "$HOME" -- bash -l
    tmux -f /exec-daemon/tmux.portal.conf send-keys -t "android-emulator:0.0" \
      "emulator ${args[*]} 2>&1 | tee $BOOT_LOG" C-m
    echo "Emulator booting in tmux session 'android-emulator' (log: $BOOT_LOG)."
  else
    nohup emulator "${args[@]}" >"$BOOT_LOG" 2>&1 &
    echo "Emulator booting (pid $!, log: $BOOT_LOG)."
  fi
  echo "Poll readiness with: $0 status  (TCG cold boot takes several minutes)"
}

status() {
  adb start-server >/dev/null 2>&1 || true
  adb devices
  # This image does not always set sys.boot_completed under TCG; treat a
  # populated package list as 'system ready'.
  local pkgs
  pkgs="$(adb -s "$SERIAL" shell pm list packages 2>/dev/null | wc -l | tr -d '[:space:]' || echo 0)"
  echo "packages visible: $pkgs (system ready when > 0)"
  echo "bootanim: $(adb -s "$SERIAL" shell getprop init.svc.bootanim 2>/dev/null | tr -d '\r')"
}

run() {
  local apk="${1:-jcs2-mod.apk}"
  [ -f "$apk" ] || { echo "APK not found: $apk" >&2; exit 1; }
  echo "Installing $apk (slow under TCG)..."
  adb -s "$SERIAL" install -r -g "$apk"
  local pkg
  pkg="$(aapt2 dump packagename "$apk" 2>/dev/null || echo modded.ycs2)"
  echo "Launching $pkg..."
  adb -s "$SERIAL" shell monkey -p "$pkg" -c android.intent.category.LAUNCHER 1 >/dev/null 2>&1
  echo "Launched. Check: adb -s $SERIAL shell dumpsys activity activities | grep topResumedActivity"
}

shot() {
  local out="${1:-/tmp/emulator.png}"
  adb -s "$SERIAL" shell screencap -p /sdcard/_shot.png
  adb -s "$SERIAL" pull /sdcard/_shot.png "$out"
  echo "Saved $out"
}

stop() {
  adb -s "$SERIAL" emu kill 2>/dev/null || true
  echo "Sent kill to $SERIAL."
}

cmd="${1:-install}"; shift || true
case "$cmd" in
  install) install ;;
  boot) boot ;;
  status) status ;;
  run) run "$@" ;;
  shot) shot "$@" ;;
  stop) stop ;;
  *) echo "unknown command: $cmd" >&2; exit 2 ;;
esac
