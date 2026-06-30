package com.trueaxis.modmenu;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;
import android.widget.Toast;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

/**
 * Uploads the mod debug log buffer to paste.rs and shows the resulting link.
 */
final class DebugLogExporter {
    private static final String PASTE_URL = "https://paste.rs/";
    private static final int MAX_PASTE_BYTES = 350 * 1024;
    private static final int CONNECT_TIMEOUT_MS = 10000;
    private static final int READ_TIMEOUT_MS = 30000;
    private static boolean uploading;

    private DebugLogExporter() {
    }

    static void uploadNow(final Activity activity) {
        if (uploading) {
            toast(activity, "Debug log upload is already running.");
            return;
        }
        uploading = true;
        ModDebugLog.module("debug-export", "upload started");
        toast(activity, "Uploading debug logs...");
        new Thread(new Runnable() {
            public void run() {
                try {
                    final String pasteUrl = uploadToPasteRs(preparePayload());
                    ModDebugLog.module("debug-export", "upload complete url=" + pasteUrl);
                    runOnUi(activity, new Runnable() {
                        public void run() {
                            showUploadResult(activity, pasteUrl);
                        }
                    });
                } catch (final Throwable error) {
                    ModDebugLog.module("debug-export", "upload failed", error);
                    runOnUi(activity, new Runnable() {
                        public void run() {
                            toast(activity, "Debug log upload failed: " + readable(error));
                        }
                    });
                } finally {
                    uploading = false;
                }
            }
        }, "YCS2DebugLogUpload").start();
    }

    private static String preparePayload() throws Exception {
        String content = ModDebugLog.readExportContent();
        byte[] bytes = content.getBytes("UTF-8");
        if (bytes.length <= MAX_PASTE_BYTES) {
            return content;
        }
        ModDebugLog.module("debug-export", "truncating payload bytes=" + bytes.length
                + " limit=" + MAX_PASTE_BYTES);
        int end = Math.min(content.length(), MAX_PASTE_BYTES);
        while (end > 0 && (content.charAt(end - 1) & 0xFC00) == 0xD800) {
            end--;
        }
        return content.substring(0, end)
                + "\n\n--- TRUNCATED: paste.rs size limit (" + MAX_PASTE_BYTES + " bytes) ---\n";
    }

    private static String uploadToPasteRs(String payload) throws Exception {
        HttpURLConnection connection = (HttpURLConnection) new URL(PASTE_URL).openConnection();
        connection.setConnectTimeout(CONNECT_TIMEOUT_MS);
        connection.setReadTimeout(READ_TIMEOUT_MS);
        connection.setUseCaches(false);
        connection.setDoOutput(true);
        connection.setRequestMethod("POST");
        connection.setRequestProperty("Content-Type", "text/plain; charset=utf-8");
        connection.setRequestProperty("User-Agent", "YCS2ModDebugLog/1.0");
        OutputStream output = null;
        try {
            output = connection.getOutputStream();
            output.write(payload.getBytes("UTF-8"));
            output.flush();
        } finally {
            closeQuietly(output);
        }

        int status = connection.getResponseCode();
        InputStream input = status >= 200 && status < 300
                ? connection.getInputStream() : connection.getErrorStream();
        String response = readString(input).trim();
        connection.disconnect();
        if (status != 201 && status != 206) {
            throw new IllegalStateException("HTTP " + status
                    + (response.length() > 0 ? ": " + response : ""));
        }
        if (response.length() == 0) {
            throw new IllegalStateException("Paste service returned an empty URL");
        }
        if (status == 206) {
            ModDebugLog.module("debug-export", "paste.rs partial upload status=" + status
                    + " url=" + response);
        }
        return normalizePasteUrl(response);
    }

    private static String normalizePasteUrl(String response) {
        if (response.startsWith("http://") || response.startsWith("https://")) {
            return response;
        }
        if (response.startsWith("/")) {
            return "https://paste.rs" + response;
        }
        return "https://paste.rs/" + response;
    }

    private static void showUploadResult(final Activity activity, final String pasteUrl) {
        new AlertDialog.Builder(activity)
                .setTitle("Debug logs uploaded")
                .setMessage("Share this link when reporting issues:\n\n" + pasteUrl)
                .setPositiveButton("Open link", new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialog, int which) {
                        openLink(activity, pasteUrl);
                    }
                })
                .setNeutralButton("Copy link", new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialog, int which) {
                        copyLink(activity, pasteUrl);
                    }
                })
                .setNegativeButton("Close", null)
                .show();
    }

    private static void openLink(Activity activity, String url) {
        try {
            ModDebugLog.module("debug-export", "open link url=" + url);
            activity.startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(url)));
        } catch (Throwable error) {
            ModDebugLog.module("debug-export", "open link failed url=" + url, error);
            toast(activity, url);
        }
    }

    private static void copyLink(Context context, String url) {
        try {
            ClipboardManager clipboard = (ClipboardManager) context.getSystemService(
                    Context.CLIPBOARD_SERVICE);
            if (clipboard == null) throw new IllegalStateException("Clipboard unavailable");
            clipboard.setPrimaryClip(ClipData.newPlainText("YCS2 debug log", url));
            ModDebugLog.module("debug-export", "copied link url=" + url);
            toast(context, "Link copied to clipboard.");
        } catch (Throwable error) {
            ModDebugLog.module("debug-export", "copy link failed url=" + url, error);
            toast(context, "Could not copy link: " + readable(error));
        }
    }

    private static String readString(InputStream input) throws Exception {
        if (input == null) return "";
        BufferedReader reader = null;
        try {
            reader = new BufferedReader(new InputStreamReader(input, "UTF-8"));
            StringBuilder builder = new StringBuilder();
            char[] buffer = new char[4096];
            int read;
            while ((read = reader.read(buffer)) >= 0) {
                builder.append(buffer, 0, read);
            }
            return builder.toString();
        } finally {
            closeQuietly(reader);
            closeQuietly(input);
        }
    }

    private static String readable(Throwable error) {
        String message = error.getMessage();
        return message == null || message.length() == 0
                ? error.getClass().getSimpleName() : message;
    }

    private static void runOnUi(Activity activity, Runnable runnable) {
        if (activity.isFinishing()) return;
        activity.runOnUiThread(runnable);
    }

    private static void toast(Context context, String text) {
        Toast.makeText(context, text, Toast.LENGTH_LONG).show();
    }

    private static void closeQuietly(java.io.Closeable closeable) {
        if (closeable == null) return;
        try {
            closeable.close();
        } catch (Throwable ignored) {
        }
    }
}
