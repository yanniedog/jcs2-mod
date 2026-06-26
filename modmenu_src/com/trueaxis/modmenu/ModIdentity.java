package com.trueaxis.modmenu;

import android.content.Context;

import java.io.ByteArrayOutputStream;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Locale;

public final class ModIdentity {
    private static final String PREFIX = "(YCS2) ";
    private static volatile boolean prefixEnabled;

    private ModIdentity() {
    }

    public static void configure(Context context) {
        try {
            prefixEnabled = ModMenu.ycs2PrefixEnabled(context);
            ModDebugLog.module("identity", "prefixEnabled=" + prefixEnabled);
        } catch (Throwable error) {
            prefixEnabled = false;
            ModDebugLog.module("identity", "configure failed; prefix disabled", error);
        }
    }

    public static String prefixDisplayName(String value) {
        if (!prefixEnabled || value == null || value.length() == 0 || value.startsWith(PREFIX)) {
            return value;
        }
        return PREFIX + value;
    }

    public static byte[] prepareSubmissionBytes(boolean urlencoded, String url, byte[] data) {
        if (!prefixEnabled || !urlencoded || data == null || data.length == 0) {
            return data;
        }
        try {
            String body = new String(data, "UTF-8");
            String rewritten = prefixUrlEncodedNames(body);
            if (rewritten.equals(body)) {
                return data;
            }
            ModDebugLog.module("identity", "prefixed urlencoded submission url=" + url
                    + " old_bytes=" + data.length + " new_bytes=" + rewritten.getBytes("UTF-8").length);
            return rewritten.getBytes("UTF-8");
        } catch (Throwable error) {
            ModDebugLog.module("identity", "submission prefix failed url=" + url, error);
            return data;
        }
    }

    private static String prefixUrlEncodedNames(String body) throws Exception {
        String[] parts = body.split("&", -1);
        boolean changed = false;
        ByteArrayOutputStream out = new ByteArrayOutputStream(body.length() + 32);
        for (int i = 0; i < parts.length; i++) {
            if (i > 0) out.write('&');
            String part = parts[i];
            int equals = part.indexOf('=');
            if (equals <= 0) {
                out.write(part.getBytes("UTF-8"));
                continue;
            }
            String key = URLDecoder.decode(part.substring(0, equals), "UTF-8");
            String value = URLDecoder.decode(part.substring(equals + 1), "UTF-8");
            if (isNameKey(key) && value.length() > 0 && !value.startsWith(PREFIX)) {
                value = PREFIX + value;
                changed = true;
            }
            out.write(URLEncoder.encode(key, "UTF-8").getBytes("UTF-8"));
            out.write('=');
            out.write(URLEncoder.encode(value, "UTF-8").getBytes("UTF-8"));
        }
        return changed ? new String(out.toByteArray(), "UTF-8") : body;
    }

    private static boolean isNameKey(String key) {
        String normalized = key == null ? "" : key.toLowerCase(Locale.US);
        return normalized.equals("name")
                || normalized.equals("username")
                || normalized.equals("user_name")
                || normalized.equals("display_name")
                || normalized.equals("player_name")
                || normalized.equals("level_name")
                || normalized.equals("levelname")
                || normalized.equals("title")
                || normalized.endsWith("[name]")
                || normalized.endsWith("_name");
    }
}
