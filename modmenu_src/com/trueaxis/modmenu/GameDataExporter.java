package com.trueaxis.modmenu;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.widget.Toast;

import java.io.BufferedInputStream;
import java.lang.reflect.Method;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

/**
 * Packages local stats / pending replay queue files for manual backup or sharing.
 * This is the practical substitute until a Play Console entry exists for the mod.
 */
final class GameDataExporter {
    private static final String AUTHORITY_SUFFIX = ".moddata";
    private static final int BUFFER_SIZE = 8192;

    private GameDataExporter() {
    }

    static void exportNow(final Activity activity) {
        ModDebugLog.module("game-data-export", "export started");
        new Thread(new Runnable() {
            public void run() {
                try {
                    final File zip = buildExportZip(activity);
                    ModDebugLog.module("game-data-export", "export complete path="
                            + zip.getAbsolutePath() + " bytes=" + zip.length());
                    activity.runOnUiThread(new Runnable() {
                        public void run() {
                            shareZip(activity, zip);
                        }
                    });
                } catch (final Throwable error) {
                    ModDebugLog.module("game-data-export", "export failed", error);
                    activity.runOnUiThread(new Runnable() {
                        public void run() {
                            toast(activity, "Export failed: " + readable(error));
                        }
                    });
                }
            }
        }, "YCS2GameDataExport").start();
    }

    private static File buildExportZip(Activity activity) throws Exception {
        List<File> files = LocalGameDataCatalog.listFiles(activity);
        if (files.isEmpty()) {
            throw new IllegalStateException("No local stats or replay queue files found");
        }

        File cacheDir = activity.getCacheDir();
        if (cacheDir == null) {
            throw new IllegalStateException("Cache directory unavailable");
        }
        File exportsDir = new File(cacheDir, "exports");
        if (!exportsDir.exists() && !exportsDir.mkdirs()) {
            throw new IllegalStateException("Could not create export directory");
        }

        String stamp = new SimpleDateFormat("yyyyMMdd-HHmmss", Locale.US).format(new Date());
        File zip = new File(exportsDir, "jcs2-local-data-" + stamp + ".zip");

        ZipOutputStream zipOutput = null;
        try {
            zipOutput = new ZipOutputStream(new BufferedOutputStream(new FileOutputStream(zip)));
            byte[] buffer = new byte[BUFFER_SIZE];
            for (File file : files) {
                ZipEntry entry = new ZipEntry(file.getName());
                entry.setTime(file.lastModified());
                zipOutput.putNextEntry(entry);
                BufferedInputStream input = null;
                try {
                    input = new BufferedInputStream(new FileInputStream(file));
                    int read;
                    while ((read = input.read(buffer)) >= 0) {
                        zipOutput.write(buffer, 0, read);
                    }
                } finally {
                    closeQuietly(input);
                }
                zipOutput.closeEntry();
            }
            zipOutput.finish();
        } finally {
            closeQuietly(zipOutput);
        }
        return zip;
    }

    private static void shareZip(Activity activity, File zip) {
        try {
            String authority = activity.getPackageName() + AUTHORITY_SUFFIX;
            Uri uri = fileProviderUri(activity, authority, zip);
            Intent intent = new Intent(Intent.ACTION_SEND);
            intent.setType("application/zip");
            intent.putExtra(Intent.EXTRA_STREAM, uri);
            intent.putExtra(Intent.EXTRA_SUBJECT, "JCS2 local stats/replay data");
            intent.putExtra(Intent.EXTRA_TEXT,
                    "Local Jet Car Stunts 2 stats and pending score/replay queue files. "
                            + "These are not Play Games cloud saves.");
            intent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
            activity.startActivity(Intent.createChooser(intent, "Share local game data"));
            toast(activity, "Export ready — choose a destination.");
        } catch (Throwable error) {
            ModDebugLog.module("game-data-export", "share failed", error);
            toast(activity, "Could not share export: " + readable(error));
        }
    }

    private static Uri fileProviderUri(Context context, String authority, File file)
            throws Exception {
        Class<?> providerClass = Class.forName("android.support.v4.content.FileProvider");
        Method getUri = providerClass.getMethod(
                "getUriForFile", Context.class, String.class, File.class);
        Object result = getUri.invoke(null, context, authority, file);
        if (!(result instanceof Uri)) {
            throw new IllegalStateException("FileProvider returned no URI");
        }
        return (Uri) result;
    }

    private static String readable(Throwable error) {
        String message = error.getMessage();
        return message == null || message.length() == 0
                ? error.getClass().getSimpleName() : message;
    }

    private static void toast(Activity activity, String text) {
        Toast.makeText(activity, text, Toast.LENGTH_LONG).show();
    }

    private static void closeQuietly(java.io.Closeable closeable) {
        if (closeable == null) {
            return;
        }
        try {
            closeable.close();
        } catch (Throwable ignored) {
        }
    }
}
