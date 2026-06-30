package com.trueaxis.modmenu;

import android.content.Context;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Locale;

/**
 * Locates Jet Car Stunts 2 local stats and pending score/replay queue files.
 * Names come from native symbols ({@code statsFile}, {@code statHeader}, etc.).
 */
final class LocalGameDataCatalog {
    private static final String[] KNOWN_NAMES = {
            "statHeader",
            "statsFile",
            "stats.bin",
            "statsbak.bin",
            "g_stats",
    };

    static final class Entry {
        final String name;
        final long bytes;
        final long lastModified;

        Entry(String name, long bytes, long lastModified) {
            this.name = name;
            this.bytes = bytes;
            this.lastModified = lastModified;
        }
    }

    static final class Summary {
        final int fileCount;
        final long totalBytes;
        final List<Entry> entries;

        Summary(int fileCount, long totalBytes, List<Entry> entries) {
            this.fileCount = fileCount;
            this.totalBytes = totalBytes;
            this.entries = entries;
        }
    }

    private LocalGameDataCatalog() {
    }

    static Summary summarize(Context context) {
        List<Entry> entries = listEntries(context);
        long total = 0L;
        for (Entry entry : entries) {
            total += entry.bytes;
        }
        return new Summary(entries.size(), total, entries);
    }

    static List<File> listFiles(Context context) {
        List<File> files = new ArrayList<File>();
        for (Entry entry : listEntries(context)) {
            File file = new File(context.getFilesDir(), entry.name);
            if (file.isFile()) {
                files.add(file);
            }
        }
        return files;
    }

    static List<Entry> listEntries(Context context) {
        File dir = context.getFilesDir();
        if (dir == null || !dir.isDirectory()) {
            return Collections.emptyList();
        }

        List<Entry> entries = new ArrayList<Entry>();
        addIfPresent(entries, dir, KNOWN_NAMES);

        File[] children = dir.listFiles();
        if (children != null) {
            for (File child : children) {
                if (!child.isFile()) {
                    continue;
                }
                String name = child.getName();
                if (matchesPattern(name) && !containsName(entries, name)) {
                    entries.add(new Entry(name, child.length(), child.lastModified()));
                }
            }
        }

        Collections.sort(entries, new Comparator<Entry>() {
            public int compare(Entry left, Entry right) {
                return left.name.compareToIgnoreCase(right.name);
            }
        });
        return entries;
    }

    static String formatBytes(long bytes) {
        if (bytes < 1024L) {
            return bytes + " B";
        }
        if (bytes < 1024L * 1024L) {
            return String.format(Locale.US, "%.1f KB", bytes / 1024.0);
        }
        return String.format(Locale.US, "%.2f MB", bytes / (1024.0 * 1024.0));
    }

    private static void addIfPresent(List<Entry> entries, File dir, String[] names) {
        for (String name : names) {
            File file = new File(dir, name);
            if (file.isFile()) {
                entries.add(new Entry(name, file.length(), file.lastModified()));
            }
        }
    }

    private static boolean matchesPattern(String name) {
        String lower = name.toLowerCase(Locale.US);
        if (lower.startsWith("stats") && lower.endsWith(".bin")) {
            return true;
        }
        if (lower.startsWith("statsbak") && lower.endsWith(".bin")) {
            return true;
        }
        return lower.equals("statheader")
                || lower.equals("statsfile")
                || lower.equals("stats.bin")
                || lower.equals("statsbak.bin")
                || lower.equals("g_stats");
    }

    private static boolean containsName(List<Entry> entries, String name) {
        for (Entry entry : entries) {
            if (entry.name.equals(name)) {
                return true;
            }
        }
        return false;
    }
}
