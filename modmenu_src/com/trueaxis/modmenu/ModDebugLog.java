package com.trueaxis.modmenu;

import android.app.Activity;
import android.app.ActivityManager;
import android.app.Application;
import android.content.ComponentCallbacks2;
import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.res.Configuration;
import android.os.Build;
import android.os.Bundle;
import android.os.Debug;
import android.os.Environment;
import android.os.Process;
import android.util.Log;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

final class ModDebugLog {
    private static final String TAG = "YCS2Mod";
    private static final String PUBLIC_DIR = "YCS2CommunityMod/logs";
    private static final String FILE_NAME = "ycs2_mod_debug.log";
    private static final String NATIVE_FILE_NAME = "ycs2_mod_native_crash.log";
    private static final String WRITE_EXTERNAL_STORAGE = "android.permission.WRITE_EXTERNAL_STORAGE";
    private static final int LOG_STORAGE_PERMISSION_REQUEST = 4202;
    private static final Object LOCK = new Object();

    private static boolean installed;
    private static boolean lifecycleInstalled;
    private static boolean componentCallbacksInstalled;
    private static File file;
    private static File nativeFile;
    private static File fallbackFile;
    private static File logDir;
    private static boolean publicLogDir;

    private ModDebugLog() {
    }

    static void install(Context context) {
        synchronized (LOCK) {
            if (installed) {
                if (!publicLogDir && permissionGranted(context, WRITE_EXTERNAL_STORAGE)) {
                    refreshStorageTargetLocked(context, "install re-entry after storage permission");
                }
                installLifecycleLocked(context);
                return;
            }
            Context appContext = context.getApplicationContext() != null
                    ? context.getApplicationContext() : context;
            File fallbackDir = new File(context.getFilesDir(), "logs");
            ensureDirectory(fallbackDir);
            fallbackFile = new File(fallbackDir, FILE_NAME);
            logDir = chooseLogDirectory(context, appContext, fallbackDir);
            publicLogDir = isPublicSharedLogDir(logDir);
            file = new File(logDir, FILE_NAME);
            nativeFile = new File(logDir, NATIVE_FILE_NAME);
            installed = true;

            final Thread.UncaughtExceptionHandler previous =
                    Thread.getDefaultUncaughtExceptionHandler();
            Thread.setDefaultUncaughtExceptionHandler(new Thread.UncaughtExceptionHandler() {
                public void uncaughtException(Thread thread, Throwable throwable) {
                    log("UNCAUGHT thread=" + thread.getName(), throwable);
                    if (previous != null) {
                        previous.uncaughtException(thread, throwable);
                    }
                }
            });

            log("debug log started path=" + file.getAbsolutePath()
                    + " native_path=" + nativeFile.getAbsolutePath()
                    + " public_shared_log_dir=" + publicLogDir
                    + " user_visible_folder_hint=Internal storage/YCS2CommunityMod/logs"
                    + " fallback_path=" + fallbackFile.getAbsolutePath()
                    + " files_dir=" + context.getFilesDir()
                    + " external_files_dir=" + appContext.getExternalFilesDir(null)
                    + " writable=" + logDir.canWrite()
                    + " usable_bytes=" + logDir.getUsableSpace()
                    + " sdk=" + Build.VERSION.SDK_INT
                    + " release=" + Build.VERSION.RELEASE
                    + " fingerprint=" + Build.FINGERPRINT
                    + " device=" + Build.MANUFACTURER + "/" + Build.MODEL
                    + " app=" + packageSummary(appContext)
                    + " pid=" + Process.myPid()
                    + " tid=" + Process.myTid()
                    + " process=" + processName());
            logRuntime("startup");
            logPermissionState(context);
            logHistoricalExitReasons(appContext);
            installLifecycleLocked(appContext);
            installComponentCallbacksLocked(appContext);
        }
    }

    static void module(String module, String message) {
        log("[" + module + "] " + message);
    }

    static void module(String module, String message, Throwable throwable) {
        log("[" + module + "] " + message, throwable);
    }

    static void lifecycle(Activity activity, String event) {
        module("lifecycle", activity.getClass().getName() + " " + event
                + " finishing=" + activity.isFinishing());
    }

    static void logRuntime(String reason) {
        Runtime runtime = Runtime.getRuntime();
        long used = runtime.totalMemory() - runtime.freeMemory();
        log("runtime " + reason
                + " thread=" + Thread.currentThread().getName()
                + " used=" + used
                + " free=" + runtime.freeMemory()
                + " total=" + runtime.totalMemory()
                + " max=" + runtime.maxMemory()
                + " nativeHeap=" + Debug.getNativeHeapAllocatedSize());
    }

    static File nativeCrashFile() {
        return nativeFile;
    }

    static void log(String message) {
        synchronized (LOCK) {
            Log.i(TAG, message);
            if (file == null) return;
            PrintWriter writer = null;
            try {
                writer = new PrintWriter(new FileWriter(file, true));
                writer.println(prefix() + message);
            } catch (Throwable error) {
                Log.e(TAG, "Could not write mod debug log to " + file, error);
                writeFallback("LOG WRITE FAILURE target=" + file + " message=" + message, error);
            } finally {
                if (writer != null) writer.close();
            }
        }
    }

    static void log(String message, Throwable throwable) {
        synchronized (LOCK) {
            Log.e(TAG, message, throwable);
            if (file == null) return;
            PrintWriter writer = null;
            try {
                writer = new PrintWriter(new FileWriter(file, true));
                writer.println(prefix() + message);
                throwable.printStackTrace(writer);
            } catch (Throwable error) {
                Log.e(TAG, "Could not write mod debug log to " + file, error);
                writeFallback("LOG WRITE FAILURE target=" + file + " message=" + message, error);
                writeFallback(message, throwable);
            } finally {
                if (writer != null) writer.close();
            }
        }
    }

    static File file() {
        return file;
    }

    static void requestSharedLogPermission(Activity activity) {
        synchronized (LOCK) {
            if (publicLogDir) {
                return;
            }
            if (permissionGranted(activity, WRITE_EXTERNAL_STORAGE)) {
                refreshStorageTargetLocked(activity, "storage permission already granted");
                return;
            }
            if (Build.VERSION.SDK_INT < 23) {
                log("shared log permission request skipped sdk=" + Build.VERSION.SDK_INT);
                return;
            }
            try {
                Method method = Activity.class.getMethod(
                        "requestPermissions",
                        String[].class,
                        int.class);
                method.invoke(activity, new String[] { WRITE_EXTERNAL_STORAGE },
                        LOG_STORAGE_PERMISSION_REQUEST);
                log("requested shared log folder permission permission=" + WRITE_EXTERNAL_STORAGE
                        + " request=" + LOG_STORAGE_PERMISSION_REQUEST);
            } catch (Throwable error) {
                log("Could not request shared log folder permission", error);
            }
        }
    }

    static void onRequestPermissionsResult(
            Activity activity,
            int requestCode,
            String[] permissions,
            int[] grantResults) {
        if (requestCode != LOG_STORAGE_PERMISSION_REQUEST) return;
        synchronized (LOCK) {
            StringBuilder result = new StringBuilder();
            if (permissions != null && grantResults != null) {
                for (int i = 0; i < permissions.length && i < grantResults.length; i++) {
                    if (i > 0) result.append(",");
                    result.append(permissions[i]).append("=").append(grantResults[i]);
                }
            }
            log("shared log folder permission result request=" + requestCode
                    + " results=" + result);
            refreshStorageTargetLocked(activity, "storage permission result");
        }
    }

    private static File chooseLogDirectory(Context context, Context appContext, File fallbackDir) {
        File externalRoot = Environment.getExternalStorageDirectory();
        File[] candidates = new File[] {
                externalRoot == null ? null : new File(externalRoot, PUBLIC_DIR),
                new File("/storage/emulated/0/" + PUBLIC_DIR),
                new File("/sdcard/" + PUBLIC_DIR),
                new File(Environment.getExternalStoragePublicDirectory(
                        Environment.DIRECTORY_DOWNLOADS), PUBLIC_DIR),
                appContext.getExternalFilesDir(null) == null
                        ? null : new File(appContext.getExternalFilesDir(null), "logs"),
                fallbackDir
        };
        for (int i = 0; i < candidates.length; i++) {
            File candidate = candidates[i];
            if (isWritableDirectory(candidate)) {
                Log.i(TAG, "debug log directory selected index=" + i + " path=" + candidate);
                return candidate;
            }
            Log.w(TAG, "debug log directory unavailable index=" + i + " path=" + candidate);
        }
        ensureDirectory(fallbackDir);
        return fallbackDir;
    }

    private static void refreshStorageTargetLocked(Context context, String reason) {
        Context appContext = context.getApplicationContext() != null
                ? context.getApplicationContext() : context;
        File fallbackDir = fallbackFile == null
                ? new File(context.getFilesDir(), "logs")
                : fallbackFile.getParentFile();
        ensureDirectory(fallbackDir);
        File newDir = chooseLogDirectory(context, appContext, fallbackDir);
        boolean newPublic = isPublicSharedLogDir(newDir);
        File newFile = new File(newDir, FILE_NAME);
        if (file != null && file.equals(newFile)) {
            log("debug log storage refresh unchanged reason=" + reason
                    + " path=" + newFile.getAbsolutePath()
                    + " public_shared_log_dir=" + newPublic);
            return;
        }

        File oldFile = file;
        File oldNativeFile = nativeFile;
        logDir = newDir;
        publicLogDir = newPublic;
        file = newFile;
        nativeFile = new File(newDir, NATIVE_FILE_NAME);
        copyPreviousLog(oldFile, file);
        log("debug log storage moved reason=" + reason
                + " old_path=" + oldFile
                + " old_native_path=" + oldNativeFile
                + " new_path=" + file.getAbsolutePath()
                + " new_native_path=" + nativeFile.getAbsolutePath()
                + " public_shared_log_dir=" + publicLogDir
                + " user_visible_folder_hint=Internal storage/YCS2CommunityMod/logs");
    }

    private static boolean isWritableDirectory(File dir) {
        if (dir == null) return false;
        try {
            if (!ensureDirectory(dir) || !dir.isDirectory() || !dir.canWrite()) return false;
            File probe = new File(dir, ".ycs2_mod_log_probe");
            PrintWriter writer = null;
            try {
                writer = new PrintWriter(new FileWriter(probe, false));
                writer.println("probe");
            } finally {
                if (writer != null) writer.close();
            }
            if (probe.exists() && !probe.delete()) {
                Log.w(TAG, "Could not delete log probe " + probe);
            }
            return true;
        } catch (Throwable error) {
            Log.w(TAG, "debug log directory probe failed path=" + dir, error);
            return false;
        }
    }

    private static boolean ensureDirectory(File dir) {
        return dir != null && (dir.isDirectory() || dir.mkdirs() || dir.isDirectory());
    }

    private static boolean isPublicSharedLogDir(File dir) {
        if (dir == null) return false;
        String path = dir.getAbsolutePath();
        return path.equals("/storage/emulated/0/" + PUBLIC_DIR)
                || path.equals("/sdcard/" + PUBLIC_DIR)
                || path.endsWith("/" + PUBLIC_DIR);
    }

    private static void writeFallback(String message, Throwable throwable) {
        if (fallbackFile == null || fallbackFile.equals(file)) return;
        PrintWriter writer = null;
        try {
            ensureDirectory(fallbackFile.getParentFile());
            writer = new PrintWriter(new FileWriter(fallbackFile, true));
            writer.println(prefix() + message);
            if (throwable != null) throwable.printStackTrace(writer);
        } catch (Throwable ignored) {
            Log.e(TAG, "Could not write fallback mod debug log to " + fallbackFile, ignored);
        } finally {
            if (writer != null) writer.close();
        }
    }

    private static void copyPreviousLog(File source, File target) {
        if (source == null || target == null || source.equals(target) || !source.isFile()) return;
        InputStream input = null;
        OutputStream output = null;
        try {
            ensureDirectory(target.getParentFile());
            input = new FileInputStream(source);
            output = new FileOutputStream(target, true);
            byte[] buffer = new byte[4096];
            int read;
            while ((read = input.read(buffer)) > 0) {
                output.write(buffer, 0, read);
            }
            output.flush();
        } catch (Throwable error) {
            Log.e(TAG, "Could not copy previous mod debug log from " + source + " to " + target, error);
            writeFallback("Could not copy previous mod debug log source=" + source
                    + " target=" + target, error);
        } finally {
            try {
                if (input != null) input.close();
            } catch (Throwable ignored) {
            }
            try {
                if (output != null) output.close();
            } catch (Throwable ignored) {
            }
        }
    }

    private static void logPermissionState(Context context) {
        log("permission WRITE_EXTERNAL_STORAGE=" + permissionState(context,
                WRITE_EXTERNAL_STORAGE)
                + " READ_EXTERNAL_STORAGE=" + permissionState(context,
                "android.permission.READ_EXTERNAL_STORAGE")
                + " external_storage_state=" + Environment.getExternalStorageState());
    }

    private static boolean permissionGranted(Context context, String permission) {
        return permissionState(context, permission).equals("0");
    }

    private static String permissionState(Context context, String permission) {
        try {
            return String.valueOf(context.checkCallingOrSelfPermission(permission));
        } catch (Throwable error) {
            return "unavailable:" + error.getClass().getSimpleName();
        }
    }

    private static void installLifecycleLocked(Context context) {
        if (lifecycleInstalled) return;
        Context appContext = context.getApplicationContext();
        if (!(appContext instanceof Application)) return;
        lifecycleInstalled = true;
        ((Application) appContext).registerActivityLifecycleCallbacks(
                new Application.ActivityLifecycleCallbacks() {
                    public void onActivityCreated(Activity activity, Bundle state) {
                        lifecycle(activity, "created savedState=" + (state != null));
                    }

                    public void onActivityStarted(Activity activity) {
                        lifecycle(activity, "started");
                    }

                    public void onActivityResumed(Activity activity) {
                        lifecycle(activity, "resumed");
                        logRuntime("resume " + activity.getClass().getSimpleName());
                    }

                    public void onActivityPaused(Activity activity) {
                        lifecycle(activity, "paused");
                    }

                    public void onActivityStopped(Activity activity) {
                        lifecycle(activity, "stopped");
                    }

                    public void onActivitySaveInstanceState(Activity activity, Bundle outState) {
                        lifecycle(activity, "saveInstanceState");
                    }

                    public void onActivityDestroyed(Activity activity) {
                        lifecycle(activity, "destroyed");
                    }
                });
    }

    private static void installComponentCallbacksLocked(Context context) {
        if (componentCallbacksInstalled) return;
        Context appContext = context.getApplicationContext();
        if (!(appContext instanceof Application)) return;
        componentCallbacksInstalled = true;
        ((Application) appContext).registerComponentCallbacks(new ComponentCallbacks2() {
            public void onConfigurationChanged(Configuration newConfig) {
                log("configuration changed orientation=" + newConfig.orientation
                        + " keyboard=" + newConfig.keyboard
                        + " navigation=" + newConfig.navigation);
            }

            public void onLowMemory() {
                log("LOW MEMORY callback");
                logRuntime("onLowMemory");
            }

            public void onTrimMemory(int level) {
                log("trim memory level=" + level);
                logRuntime("onTrimMemory " + level);
            }
        });
    }

    private static void logHistoricalExitReasons(Context context) {
        if (Build.VERSION.SDK_INT < 30) {
            log("process exit history unavailable sdk=" + Build.VERSION.SDK_INT);
            return;
        }
        try {
            ActivityManager manager =
                    (ActivityManager) context.getSystemService(Context.ACTIVITY_SERVICE);
            if (manager == null) {
                log("process exit history unavailable; activity manager null");
                return;
            }
            Method method = manager.getClass().getMethod(
                    "getHistoricalProcessExitReasons",
                    String.class,
                    int.class,
                    int.class);
            Object value = method.invoke(manager, context.getPackageName(), 0, 5);
            if (!(value instanceof List)) {
                log("process exit history unavailable; unexpected result=" + value);
                return;
            }
            List<?> exits = (List<?>) value;
            log("process exit history count=" + exits.size());
            for (int index = 0; index < exits.size(); index++) {
                Object info = exits.get(index);
                log("process exit[" + index + "]"
                        + " reason=" + reflected(info, "getReason")
                        + " importance=" + reflected(info, "getImportance")
                        + " pid=" + reflected(info, "getPid")
                        + " pss=" + reflected(info, "getPss")
                        + " rss=" + reflected(info, "getRss")
                        + " timestamp=" + reflected(info, "getTimestamp")
                        + " process=" + reflected(info, "getProcessName")
                        + " description=" + reflected(info, "getDescription"));
            }
        } catch (Throwable error) {
            log("process exit history unavailable", error);
        }
    }

    private static Object reflected(Object target, String methodName) {
        if (target == null) return "null";
        try {
            Method method = target.getClass().getMethod(methodName);
            return method.invoke(target);
        } catch (Throwable error) {
            return "unavailable:" + error.getClass().getSimpleName();
        }
    }

    private static String packageSummary(Context context) {
        try {
            PackageInfo info = context.getPackageManager().getPackageInfo(context.getPackageName(), 0);
            return context.getPackageName() + "/" + info.versionName + "#" + info.versionCode;
        } catch (Throwable error) {
            return context.getPackageName() + "/unknown";
        }
    }

    private static String processName() {
        if (Build.VERSION.SDK_INT >= 28) {
            try {
                return Application.getProcessName();
            } catch (Throwable ignored) {
            }
        }
        return "unknown";
    }

    private static String timestamp() {
        return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS", Locale.US).format(new Date());
    }

    private static String prefix() {
        return timestamp()
                + " pid=" + Process.myPid()
                + " tid=" + Process.myTid()
                + " thread=" + Thread.currentThread().getName()
                + " ";
    }
}
