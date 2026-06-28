package com.trueaxis.modmenu;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.DownloadManager;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.database.Cursor;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.os.Handler;
import android.os.Looper;
import android.os.ParcelFileDescriptor;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;

import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.lang.reflect.Method;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.MessageDigest;
import java.util.Locale;

/**
 * Small self-updater for side-loaded community builds.
 *
 * Android does not allow this APK to silently replace itself. The updater can
 * check, download, verify, and open the package installer; the user still has to
 * approve installing the replacement APK.
 */
public final class UpdateManager {
    private static final String PREFS = "jcs_mod_update";
    private static final String K_LAST_CHECK_MS = "last_check_ms";
    private static final String K_DOWNLOAD_ID = "download_id";
    private static final String K_DOWNLOAD_SHA256 = "download_sha256";
    private static final String K_DOWNLOAD_VERSION_CODE = "download_version_code";
    private static final String K_DISMISSED_VERSION_CODE = "dismissed_version_code";
    private static final String K_INSTALL_PROMPTED_DOWNLOAD_ID = "install_prompted_download_id";
    private static final String K_INSTALL_PERMISSION_PROMPTED_VERSION_CODE =
            "install_permission_prompted_version_code";
    private static final String UPDATE_MANIFEST_URL =
            "https://github.com/yanniedog/jcs2-mod/releases/latest/download/jcs2-update.json";
    private static final String APK_MIME = "application/vnd.android.package-archive";
    private static final long CHECK_INTERVAL_MS = 12L * 60L * 60L * 1000L;
    private static final long PROGRESS_POLL_MS = 500L;
    private static final int MAX_MANIFEST_CHARS = 65536;
    private static final int PROGRESS_MAX = 1000;
    private static boolean checking;

    private UpdateManager() {
    }

    public static void checkSilently(final Activity activity) {
        if (resumePendingInstall(activity, false)) return;
        long now = System.currentTimeMillis();
        long last = prefs(activity).getLong(K_LAST_CHECK_MS, 0L);
        if (now - last < CHECK_INTERVAL_MS) return;
        checkForUpdates(activity, false);
    }

    public static void checkNow(final Activity activity) {
        if (resumePendingInstall(activity, true)) return;
        checkForUpdates(activity, true);
    }

    private static void checkForUpdates(final Activity activity, final boolean interactive) {
        if (checking) {
            if (interactive) toast(activity, "Update check is already running.");
            return;
        }
        checking = true;
        prefs(activity).edit().putLong(K_LAST_CHECK_MS, System.currentTimeMillis()).apply();
        if (interactive) toast(activity, "Checking for updates...");
        new Thread(new Runnable() {
            public void run() {
                try {
                    final UpdateInfo latest = fetchUpdateInfo();
                    final PackageInfo current = activity.getPackageManager()
                            .getPackageInfo(activity.getPackageName(), 0);
                    if (!activity.getPackageName().equals(latest.packageName)) {
                        throw new IllegalStateException("Update package mismatch: "
                                + latest.packageName);
                    }
                    if (latest.versionCode > current.versionCode) {
                        if (!interactive && shouldSuppressUpdatePrompt(activity, latest)) {
                            ModDebugLog.module("update", "silent update prompt suppressed version="
                                    + latest.versionName + " code=" + latest.versionCode);
                            return;
                        }
                        runOnUi(activity, new Runnable() {
                            public void run() {
                                showUpdateAvailable(activity, latest, current);
                            }
                        });
                    } else if (interactive) {
                        runOnUi(activity, new Runnable() {
                            public void run() {
                                toast(activity, "You are already on the latest version.");
                            }
                        });
                    }
                } catch (final Throwable error) {
                    ModDebugLog.module("update", "update check failed", error);
                    if (interactive) {
                        runOnUi(activity, new Runnable() {
                            public void run() {
                                toast(activity, "Update check failed: " + readable(error));
                            }
                        });
                    }
                } finally {
                    checking = false;
                }
            }
        }, "YCS2UpdateCheck").start();
    }

    private static void showUpdateAvailable(final Activity activity,
                                            final UpdateInfo latest,
                                            PackageInfo current) {
        String size = latest.apkSize > 0 ? "\nSize: " + formatBytes(latest.apkSize) : "";
        new AlertDialog.Builder(activity)
                .setTitle("Update available")
                .setMessage("Installed: " + current.versionName + " (" + current.versionCode + ")"
                        + "\nLatest: " + latest.versionName + " (" + latest.versionCode + ")"
                        + size
                        + "\n\nThe APK will download now, then Android will ask you to approve installing it.")
                .setPositiveButton("Download update", new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialog, int which) {
                        startDownload(activity, latest);
                    }
                })
                .setNegativeButton("Later", new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialog, int which) {
                        recordUpdateDismissed(activity, latest);
                    }
                })
                .setOnCancelListener(new DialogInterface.OnCancelListener() {
                    public void onCancel(DialogInterface dialog) {
                        recordUpdateDismissed(activity, latest);
                    }
                })
                .show();
    }

    private static boolean shouldSuppressUpdatePrompt(Context context, UpdateInfo latest) {
        SharedPreferences preferences = prefs(context);
        if (preferences.getInt(K_DISMISSED_VERSION_CODE, 0) == latest.versionCode) {
            return true;
        }
        long downloadId = preferences.getLong(K_DOWNLOAD_ID, -1L);
        int downloadVersion = preferences.getInt(K_DOWNLOAD_VERSION_CODE, 0);
        return downloadId >= 0L && downloadVersion >= latest.versionCode;
    }

    private static void recordUpdateDismissed(Context context, UpdateInfo latest) {
        prefs(context).edit()
                .putInt(K_DISMISSED_VERSION_CODE, latest.versionCode)
                .apply();
        ModDebugLog.module("update", "update prompt dismissed version="
                + latest.versionName + " code=" + latest.versionCode);
    }

    private static UpdateInfo fetchUpdateInfo() throws Exception {
        HttpURLConnection connection = (HttpURLConnection) new URL(UPDATE_MANIFEST_URL)
                .openConnection();
        connection.setConnectTimeout(10000);
        connection.setReadTimeout(20000);
        connection.setUseCaches(false);
        connection.setRequestProperty("Accept", "application/json");
        connection.setRequestProperty("User-Agent", "YCS2ModUpdater/1.0");
        int status = connection.getResponseCode();
        if (status < 200 || status >= 300) {
            throw new IllegalStateException("HTTP " + status);
        }
        InputStream input = null;
        try {
            input = connection.getInputStream();
            JSONObject json = new JSONObject(readString(input));
            UpdateInfo info = new UpdateInfo();
            info.packageName = json.optString("package_name", "");
            info.versionCode = json.optInt("version_code", 0);
            info.versionName = json.optString("version_name", "");
            info.apkName = json.optString("apk_name", "jcs2-update.apk");
            info.apkUrl = json.optString("apk_url", "");
            info.apkSha256 = json.optString("apk_sha256", "");
            info.apkSize = json.optLong("apk_size", 0L);
            if (info.packageName.length() == 0
                    || info.versionCode <= 0
                    || info.versionName.length() == 0
                    || info.apkUrl.length() == 0) {
                throw new IllegalStateException("Update manifest is incomplete");
            }
            return info;
        } finally {
            closeQuietly(input);
            connection.disconnect();
        }
    }

    private static void startDownload(final Activity activity, final UpdateInfo info) {
        try {
            DownloadManager manager = (DownloadManager) activity.getSystemService(Context.DOWNLOAD_SERVICE);
            if (manager == null) throw new IllegalStateException("Download manager is unavailable");
            DownloadManager.Request request = new DownloadManager.Request(Uri.parse(info.apkUrl));
            request.setTitle("YCS2 update " + info.versionName);
            request.setDescription(info.apkName);
            request.setMimeType(APK_MIME);
            request.setNotificationVisibility(
                    DownloadManager.Request.VISIBILITY_VISIBLE_NOTIFY_COMPLETED);
            request.setAllowedOverRoaming(true);
            if (Build.VERSION.SDK_INT >= 16) request.setAllowedOverMetered(true);
            request.setDestinationInExternalFilesDir(
                    activity, Environment.DIRECTORY_DOWNLOADS, info.apkName);
            final long id = manager.enqueue(request);
            prefs(activity).edit()
                    .putLong(K_DOWNLOAD_ID, id)
                    .putString(K_DOWNLOAD_SHA256, info.apkSha256)
                    .putInt(K_DOWNLOAD_VERSION_CODE, info.versionCode)
                    .remove(K_DISMISSED_VERSION_CODE)
                    .remove(K_INSTALL_PROMPTED_DOWNLOAD_ID)
                    .remove(K_INSTALL_PERMISSION_PROMPTED_VERSION_CODE)
                    .apply();
            ModDebugLog.module("update", "download started id=" + id
                    + " version=" + info.versionName + " url=" + info.apkUrl);
            registerDownloadReceiver(activity, id);
            showDownloadProgress(activity, id);
        } catch (Throwable error) {
            ModDebugLog.module("update", "download start failed", error);
            toast(activity, "Could not start update download: " + readable(error));
        }
    }

    private static void registerDownloadReceiver(final Activity activity, final long id) {
        final BroadcastReceiver receiver = new BroadcastReceiver() {
            public void onReceive(Context context, Intent intent) {
                long completed = intent == null ? -1L
                        : intent.getLongExtra(DownloadManager.EXTRA_DOWNLOAD_ID, -1L);
                if (completed != id) return;
                try {
                    activity.unregisterReceiver(this);
                } catch (Throwable ignored) {
                }
                installDownloadedApk(activity, id, false);
            }
        };
        try {
            activity.registerReceiver(receiver,
                    new IntentFilter(DownloadManager.ACTION_DOWNLOAD_COMPLETE));
        } catch (Throwable error) {
            ModDebugLog.module("update", "download receiver registration failed", error);
        }
    }

    private static boolean resumePendingInstall(Activity activity, boolean interactive) {
        long id = prefs(activity).getLong(K_DOWNLOAD_ID, -1L);
        if (id < 0L) return false;
        return installDownloadedApk(activity, id, interactive);
    }

    private static boolean installDownloadedApk(final Activity activity,
                                                final long id,
                                                boolean interactive) {
        if (downloadAlreadyInstalled(activity)) {
            clearDownload(activity);
            return false;
        }
        DownloadManager manager = (DownloadManager) activity.getSystemService(Context.DOWNLOAD_SERVICE);
        if (manager == null) return false;
        Cursor cursor = null;
        try {
            cursor = manager.query(new DownloadManager.Query().setFilterById(id));
            if (cursor == null || !cursor.moveToFirst()) {
                clearDownload(activity);
                return false;
            }
            int status = cursor.getInt(cursor.getColumnIndexOrThrow(DownloadManager.COLUMN_STATUS));
            if (status == DownloadManager.STATUS_PENDING
                    || status == DownloadManager.STATUS_PAUSED
                    || status == DownloadManager.STATUS_RUNNING) {
                registerDownloadReceiver(activity, id);
                if (interactive) showDownloadProgress(activity, id);
                return true;
            }
            if (status != DownloadManager.STATUS_SUCCESSFUL) {
                clearDownload(activity);
                if (interactive) toast(activity, "Update download failed. Please try again.");
                return false;
            }
            String expectedSha = prefs(activity).getString(K_DOWNLOAD_SHA256, "");
            if (expectedSha.length() > 0) {
                String actualSha = sha256(manager, id);
                if (!expectedSha.equalsIgnoreCase(actualSha)) {
                    manager.remove(id);
                    clearDownload(activity);
                    toast(activity, "Downloaded update did not match its checksum.");
                    ModDebugLog.module("update", "checksum mismatch expected="
                            + expectedSha + " actual=" + actualSha);
                    return false;
                }
            }
            if (!canInstallPackages(activity)) {
                maybePromptInstallPermission(activity, interactive);
                return true;
            }
            long promptedId = prefs(activity).getLong(K_INSTALL_PROMPTED_DOWNLOAD_ID, -1L);
            if (promptedId == id) {
                ModDebugLog.module("update", "pending installer already opened id=" + id);
                return true;
            }
            Uri apk = manager.getUriForDownloadedFile(id);
            if (apk == null) throw new IllegalStateException("Downloaded APK URI unavailable");
            Intent install = new Intent(Intent.ACTION_VIEW);
            install.setDataAndType(apk, APK_MIME);
            install.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
            install.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            activity.startActivity(install);
            prefs(activity).edit().putLong(K_INSTALL_PROMPTED_DOWNLOAD_ID, id).apply();
            ModDebugLog.module("update", "installer opened for download id=" + id);
            return true;
        } catch (Throwable error) {
            ModDebugLog.module("update", "install downloaded apk failed", error);
            if (interactive) toast(activity, "Could not open installer: " + readable(error));
            return false;
        } finally {
            if (cursor != null) cursor.close();
        }
    }

    private static void showDownloadProgress(final Activity activity, final long id) {
        final DownloadManager manager =
                (DownloadManager) activity.getSystemService(Context.DOWNLOAD_SERVICE);
        if (manager == null) {
            toast(activity, "Download manager is unavailable.");
            return;
        }

        final TextView status = new TextView(activity);
        status.setText("Starting download...");

        final ProgressBar progress = new ProgressBar(
                activity, null, android.R.attr.progressBarStyleHorizontal);
        progress.setMax(PROGRESS_MAX);
        progress.setIndeterminate(true);

        LinearLayout layout = new LinearLayout(activity);
        layout.setOrientation(LinearLayout.VERTICAL);
        int padding = dp(activity, 20);
        layout.setPadding(padding, padding, padding, 0);
        layout.addView(status);
        layout.addView(progress);

        final Handler handler = new Handler(Looper.getMainLooper());
        final boolean[] active = new boolean[]{true};
        final Runnable[] poller = new Runnable[1];

        final AlertDialog dialog = new AlertDialog.Builder(activity)
                .setTitle("Downloading update")
                .setView(layout)
                .setNegativeButton("Hide", null)
                .setNeutralButton("Cancel download", null)
                .create();
        dialog.setOnShowListener(new DialogInterface.OnShowListener() {
            public void onShow(DialogInterface unused) {
                dialog.getButton(AlertDialog.BUTTON_NEUTRAL)
                        .setOnClickListener(new android.view.View.OnClickListener() {
                            public void onClick(android.view.View view) {
                                active[0] = false;
                                handler.removeCallbacks(poller[0]);
                                manager.remove(id);
                                clearDownload(activity);
                                dialog.dismiss();
                                toast(activity, "Update download cancelled.");
                                ModDebugLog.module("update", "download cancelled id=" + id);
                            }
                        });
            }
        });
        dialog.setOnDismissListener(new DialogInterface.OnDismissListener() {
            public void onDismiss(DialogInterface unused) {
                active[0] = false;
                handler.removeCallbacks(poller[0]);
            }
        });

        poller[0] = new Runnable() {
            public void run() {
                if (!active[0] || activity.isFinishing()) return;
                DownloadProgress state = readDownloadProgress(manager, id);
                if (!state.exists) {
                    active[0] = false;
                    clearDownload(activity);
                    dialog.dismiss();
                    toast(activity, "Update download was not found.");
                    return;
                }

                updateProgressViews(status, progress, state);
                if (state.status == DownloadManager.STATUS_SUCCESSFUL) {
                    active[0] = false;
                    handler.removeCallbacks(this);
                    status.setText("Download complete. Opening installer...");
                    dialog.dismiss();
                    installDownloadedApk(activity, id, true);
                } else if (state.status == DownloadManager.STATUS_FAILED) {
                    active[0] = false;
                    clearDownload(activity);
                    dialog.dismiss();
                    toast(activity, "Update download failed. Please try again.");
                } else {
                    handler.postDelayed(this, PROGRESS_POLL_MS);
                }
            }
        };

        dialog.show();
        poller[0].run();
    }

    private static DownloadProgress readDownloadProgress(DownloadManager manager, long id) {
        DownloadProgress progress = new DownloadProgress();
        Cursor cursor = null;
        try {
            cursor = manager.query(new DownloadManager.Query().setFilterById(id));
            if (cursor == null || !cursor.moveToFirst()) return progress;
            progress.exists = true;
            progress.status = cursor.getInt(
                    cursor.getColumnIndexOrThrow(DownloadManager.COLUMN_STATUS));
            progress.downloaded = readLongColumn(
                    cursor, DownloadManager.COLUMN_BYTES_DOWNLOADED_SO_FAR);
            progress.total = readLongColumn(cursor, DownloadManager.COLUMN_TOTAL_SIZE_BYTES);
            progress.reason = readIntColumn(cursor, DownloadManager.COLUMN_REASON);
            return progress;
        } catch (Throwable error) {
            ModDebugLog.module("update", "download progress query failed", error);
            return progress;
        } finally {
            if (cursor != null) cursor.close();
        }
    }

    private static void updateProgressViews(TextView status,
                                            ProgressBar progress,
                                            DownloadProgress state) {
        boolean hasTotal = state.total > 0L;
        progress.setIndeterminate(!hasTotal
                && state.status != DownloadManager.STATUS_SUCCESSFUL
                && state.status != DownloadManager.STATUS_FAILED);
        if (hasTotal) {
            long clamped = Math.max(0L, Math.min(state.downloaded, state.total));
            progress.setProgress((int) ((clamped * PROGRESS_MAX) / state.total));
        }

        String bytes = hasTotal
                ? formatBytes(Math.max(0L, state.downloaded)) + " / " + formatBytes(state.total)
                : formatBytes(Math.max(0L, state.downloaded));
        if (state.status == DownloadManager.STATUS_PENDING) {
            status.setText("Waiting to start... " + bytes);
        } else if (state.status == DownloadManager.STATUS_PAUSED) {
            status.setText("Paused... " + bytes);
        } else if (state.status == DownloadManager.STATUS_SUCCESSFUL) {
            progress.setIndeterminate(false);
            progress.setProgress(PROGRESS_MAX);
            status.setText("Download complete. Opening installer...");
        } else if (state.status == DownloadManager.STATUS_FAILED) {
            progress.setIndeterminate(false);
            status.setText("Download failed.");
        } else {
            status.setText("Downloading... " + bytes);
        }
    }

    private static boolean downloadAlreadyInstalled(Context context) {
        int downloadVersion = prefs(context).getInt(K_DOWNLOAD_VERSION_CODE, 0);
        if (downloadVersion <= 0) return false;
        int currentVersion = currentVersionCode(context);
        return currentVersion >= downloadVersion;
    }

    private static int currentVersionCode(Context context) {
        try {
            PackageInfo info = context.getPackageManager()
                    .getPackageInfo(context.getPackageName(), 0);
            return info.versionCode;
        } catch (Throwable error) {
            ModDebugLog.module("update", "could not read current version", error);
            return 0;
        }
    }

    private static void maybePromptInstallPermission(Activity activity, boolean interactive) {
        SharedPreferences preferences = prefs(activity);
        int version = preferences.getInt(K_DOWNLOAD_VERSION_CODE, 0);
        int promptedVersion = preferences.getInt(K_INSTALL_PERMISSION_PROMPTED_VERSION_CODE, 0);
        if (!interactive && version > 0 && promptedVersion == version) {
            ModDebugLog.module("update", "install permission prompt already shown version="
                    + version);
            return;
        }
        preferences.edit()
                .putInt(K_INSTALL_PERMISSION_PROMPTED_VERSION_CODE, version)
                .apply();
        promptInstallPermission(activity);
    }

    private static boolean canInstallPackages(Context context) {
        if (Build.VERSION.SDK_INT < 26) return true;
        try {
            Method method = PackageManager.class.getMethod("canRequestPackageInstalls");
            Object result = method.invoke(context.getPackageManager());
            return Boolean.TRUE.equals(result);
        } catch (Throwable ignored) {
            return true;
        }
    }

    private static void promptInstallPermission(final Activity activity) {
        new AlertDialog.Builder(activity)
                .setTitle("Allow YCS2 updates")
                .setMessage("Android needs permission for this app to install downloaded APK updates. "
                        + "After enabling it, return here and tap Check for updates.")
                .setPositiveButton("Open settings", new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialog, int which) {
                        try {
                            Intent intent = new Intent(
                                    "android.settings.MANAGE_UNKNOWN_APP_SOURCES",
                                    Uri.parse("package:" + activity.getPackageName()));
                            activity.startActivity(intent);
                        } catch (Throwable error) {
                            ModDebugLog.module("update", "unknown sources settings failed", error);
                            toast(activity, "Open Android settings and allow installs for YCS2.");
                        }
                    }
                })
                .setNegativeButton("Later", null)
                .show();
    }

    private static String sha256(DownloadManager manager, long id) throws Exception {
        ParcelFileDescriptor descriptor = null;
        FileInputStream input = null;
        try {
            descriptor = manager.openDownloadedFile(id);
            input = new FileInputStream(descriptor.getFileDescriptor());
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] buffer = new byte[65536];
            int count;
            while ((count = input.read(buffer)) != -1) {
                digest.update(buffer, 0, count);
            }
            return hex(digest.digest());
        } finally {
            closeQuietly(input);
            if (descriptor != null) {
                try {
                    descriptor.close();
                } catch (Throwable ignored) {
                }
            }
        }
    }

    private static String readString(InputStream input) throws Exception {
        BufferedReader reader = new BufferedReader(new InputStreamReader(input, "UTF-8"));
        StringBuilder out = new StringBuilder();
        char[] buffer = new char[4096];
        int count;
        while ((count = reader.read(buffer)) != -1) {
            out.append(buffer, 0, count);
            if (out.length() > MAX_MANIFEST_CHARS) {
                throw new IllegalStateException("Update manifest is too large");
            }
        }
        String text = out.toString();
        if (text.length() > 0 && text.charAt(0) == '\ufeff') {
            return text.substring(1);
        }
        return text;
    }

    private static String hex(byte[] bytes) {
        StringBuilder out = new StringBuilder(bytes.length * 2);
        for (int i = 0; i < bytes.length; i++) {
            int value = bytes[i] & 0xff;
            if (value < 16) out.append('0');
            out.append(Integer.toHexString(value));
        }
        return out.toString();
    }

    private static String formatBytes(long bytes) {
        if (bytes < 1024L * 1024L) return (bytes / 1024L) + " KB";
        return String.format(Locale.US, "%.1f MB", bytes / 1024.0 / 1024.0);
    }

    private static String readable(Throwable error) {
        String message = error.getMessage();
        return message == null || message.length() == 0
                ? error.getClass().getSimpleName() : message;
    }

    private static int dp(Context context, int value) {
        return Math.round(value * context.getResources().getDisplayMetrics().density);
    }

    private static long readLongColumn(Cursor cursor, String column) {
        int index = cursor.getColumnIndex(column);
        if (index < 0 || cursor.isNull(index)) return -1L;
        return cursor.getLong(index);
    }

    private static int readIntColumn(Cursor cursor, String column) {
        int index = cursor.getColumnIndex(column);
        if (index < 0 || cursor.isNull(index)) return 0;
        return cursor.getInt(index);
    }

    private static SharedPreferences prefs(Context context) {
        return context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    private static void clearDownload(Context context) {
        prefs(context).edit()
                .remove(K_DOWNLOAD_ID)
                .remove(K_DOWNLOAD_SHA256)
                .remove(K_DOWNLOAD_VERSION_CODE)
                .remove(K_INSTALL_PROMPTED_DOWNLOAD_ID)
                .remove(K_INSTALL_PERMISSION_PROMPTED_VERSION_CODE)
                .apply();
    }

    private static void runOnUi(Activity activity, Runnable runnable) {
        if (activity.isFinishing()) return;
        activity.runOnUiThread(runnable);
    }

    private static void toast(final Context context, final String text) {
        Toast.makeText(context, text, Toast.LENGTH_LONG).show();
    }

    private static void closeQuietly(java.io.Closeable closeable) {
        if (closeable == null) return;
        try {
            closeable.close();
        } catch (Throwable ignored) {
        }
    }

    private static final class UpdateInfo {
        String packageName;
        int versionCode;
        String versionName;
        String apkName;
        String apkUrl;
        String apkSha256;
        long apkSize;
    }

    private static final class DownloadProgress {
        boolean exists;
        int status;
        long downloaded = -1L;
        long total = -1L;
        int reason;
    }
}
