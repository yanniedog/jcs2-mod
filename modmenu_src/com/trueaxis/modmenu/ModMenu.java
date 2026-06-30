package com.trueaxis.modmenu;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.os.Build;
import android.util.Log;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.SeekBar;
import android.widget.ScrollView;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Properties;

/**
 * Mod settings for the JCS2 community mod.
 * The launcher exposes game launch, custom livery tools, updates, and replay split tools.
 */
public class ModMenu {
    private static final String PREFS = "jcs_mod";
    private static final String K_MENU_DEFAULTS_VERSION = "menu_defaults_version";
    private static final String K_CAR = "livery_car";
    private static final String K_CHECKPOINT_SPLITS = "checkpoint_splits";
    private static final String K_SPLIT_LIST = "split_list";
    private static final String K_SPLIT_SECTOR_DELTA = "split_sector_delta";
    private static final String K_REPLAY_FREE_CAMERA = "replay_free_camera";
    private static final String K_REPLAY_SWARM = "replay_swarm";
    private static final String K_SPLIT_ALPHA = "split_alpha";
    private static final String K_SPLIT_X = "split_x";
    private static final String K_SPLIT_Y = "split_y";
    private static final String REPO_URL = "https://github.com/yanniedog/jcs2-mod";
    private static final String DISCORD_URL = "https://discord.gg/stBdE2Tfs2";
    private static final String DISPLAY_NAME = "JCS2 Community Mod";
    private static final int REQUEST_IMPORT = 7301;
    private static final int REQUEST_EXPORT = 7302;
    private static final int TEXTURE_SIZE = 512;
    private static final int MENU_DEFAULTS_VERSION = 5;
    private static final int DEFAULT_SPLIT_ALPHA = 90;
    private static final int DEFAULT_SPLIT_X = 88;
    private static final int DEFAULT_SPLIT_Y = 39;

    private static final String[] CAR_NAMES = {
            "Buggy", "Original jetcar", "Jet", "Mini", "Sports", "Stock", "Truck"
    };
    private static final String[] CAR_TEXTURES = {
            "cars/buggy/buggy1.png",
            "cars/original/rocketcar1.png",
            "cars/jet/jet1.png",
            "cars/mini/mini1.png",
            "cars/sports/sportscar1.png",
            "cars/stock/stock1.png",
            "cars/truck/truck1.png"
    };

    private static int dp(Context c, int value) {
        return (int) (value * c.getResources().getDisplayMetrics().density + 0.5f);
    }

    private static GradientDrawable background(int color, float radius) {
        GradientDrawable result = new GradientDrawable();
        result.setColor(color);
        result.setCornerRadius(radius);
        return result;
    }

    private static TextView label(Context c, String text, int size, int color) {
        TextView view = new TextView(c);
        view.setText(text);
        view.setTextSize((float) size);
        view.setTextColor(color);
        return view;
    }

    private static Button button(Context c, String text) {
        Button view = new Button(c);
        view.setText(text);
        view.setTextSize(11.0f);
        view.setAllCaps(false);
        view.setMinHeight(0);
        view.setMinimumHeight(0);
        view.setPadding(dp(c, 10), dp(c, 7), dp(c, 10), dp(c, 7));
        return view;
    }

    private static Button linkButton(final Activity a, String text, int color, Drawable icon,
            final String url) {
        Button view = button(a, text);
        view.setTextColor(Color.WHITE);
        view.setTextSize(12.0f);
        view.setGravity(Gravity.CENTER);
        view.setBackgroundDrawable(background(color, dp(a, 8)));
        int iconSize = dp(a, 18);
        icon.setBounds(0, 0, iconSize, iconSize);
        view.setCompoundDrawables(icon, null, null, null);
        view.setCompoundDrawablePadding(dp(a, 7));
        view.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                try {
                    ModDebugLog.module("launcher", "open link url=" + url);
                    a.startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(url)));
                } catch (Throwable error) {
                    ModDebugLog.module("launcher", "open link failed url=" + url, error);
                    Toast.makeText(a, url, Toast.LENGTH_LONG).show();
                }
            }
        });
        return view;
    }

    private static TextView sectionHeader(Context c, String text) {
        TextView view = label(c, text, 13, Color.rgb(255, 128, 0));
        view.setPadding(0, dp(c, 12), 0, dp(c, 4));
        return view;
    }

    private static LinearLayout.LayoutParams fill() {
        return new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
    }


    private static File customTexture(Context c, int car) {
        return new File(c.getFilesDir(), CAR_TEXTURES[car]);
    }

    /** Secondary copy under external files dir, in case the engine resolves liveries there. */
    private static File externalTexture(Context c, int car) {
        File base = c.getExternalFilesDir(null);
        return base == null ? null : new File(base, CAR_TEXTURES[car]);
    }

    // ---- Public accessors for the in-app livery designer. ----
    public static int carCount() {
        return CAR_NAMES.length;
    }

    public static String carName(int car) {
        return car >= 0 && car < CAR_NAMES.length ? CAR_NAMES[car] : "Car";
    }

    public static String carAssetPath(int car) {
        return CAR_TEXTURES[car];
    }

    public static File carCustomFile(Context c, int car) {
        return customTexture(c, car);
    }

    public static int textureSize() {
        return TEXTURE_SIZE;
    }

    /** Loads the current livery for editing: the saved custom one if present, else the bundled asset. */
    public static Bitmap loadEditableLivery(Context c, int car) {
        ModDebugLog.install(c);
        File custom = customTexture(c, car);
        InputStream input = null;
        try {
            ModDebugLog.module("livery", "load editable car=" + carName(car)
                    + " customExists=" + custom.isFile()
                    + " asset=" + CAR_TEXTURES[car]);
            input = custom.isFile()
                    ? new java.io.FileInputStream(custom)
                    : c.getAssets().open(CAR_TEXTURES[car]);
            BitmapFactory.Options options = new BitmapFactory.Options();
            options.inPreferredConfig = Bitmap.Config.ARGB_8888;
            Bitmap decoded = BitmapFactory.decodeStream(input, null, options);
            if (decoded == null) {
                ModDebugLog.module("livery", "decode returned null car=" + carName(car));
                return null;
            }
            Bitmap mutable = decoded.copy(Bitmap.Config.ARGB_8888, true);
            if (mutable != decoded) decoded.recycle();
            ModDebugLog.module("livery", "loaded editable car=" + carName(car)
                    + " size=" + mutable.getWidth() + "x" + mutable.getHeight());
            return mutable;
        } catch (Throwable t) {
            Log.e("YCS2Mod", "Could not load livery for editing", t);
            ModDebugLog.module("livery", "Could not load livery for editing car=" + carName(car), t);
            return null;
        } finally {
            closeQuietly(input);
        }
    }

    /** Saves a designed/edited bitmap as the car's livery (internal + external mirror). */
    public static void saveDesignedLivery(Context c, int car, Bitmap bitmap) throws Exception {
        ModDebugLog.install(c);
        ModDebugLog.module("livery", "save designed car=" + carName(car)
                + " bitmap=" + bitmap.getWidth() + "x" + bitmap.getHeight());
        Bitmap scaled = bitmap.getWidth() == TEXTURE_SIZE && bitmap.getHeight() == TEXTURE_SIZE
                ? bitmap
                : Bitmap.createScaledBitmap(bitmap, TEXTURE_SIZE, TEXTURE_SIZE, true);
        try {
            writeLivery(customTexture(c, car), scaled);
            mirrorExternal(c, car, scaled);
            ModDebugLog.module("livery", "save designed complete car=" + carName(car));
        } finally {
            if (scaled != bitmap) scaled.recycle();
        }
    }

    private static int selectedCar(Context c) {
        int car = prefs(c).getInt(K_CAR, 1);
        return car >= 0 && car < CAR_TEXTURES.length ? car : 1;
    }

    private static void rememberCar(Context c, Spinner spinner) {
        prefs(c).edit().putInt(K_CAR, spinner.getSelectedItemPosition()).apply();
    }

    private static void toast(Context c, String text) {
        Toast.makeText(c, text, Toast.LENGTH_LONG).show();
    }

    private static void closeQuietly(java.io.Closeable closeable) {
        if (closeable == null) return;
        try {
            closeable.close();
        } catch (Throwable ignored) {
        }
    }

    public static SharedPreferences prefs(Context c) {
        return c.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    private static void applyMenuDefaults(Context c) {
        SharedPreferences preferences = prefs(c);
        if (preferences.getInt(K_MENU_DEFAULTS_VERSION, 0) >= MENU_DEFAULTS_VERSION) {
            return;
        }
        SharedPreferences.Editor editor = preferences.edit()
                .putBoolean(K_CHECKPOINT_SPLITS, true)
                .putBoolean(K_SPLIT_LIST, true)
                .putBoolean(K_SPLIT_SECTOR_DELTA, false)
                .putBoolean(K_REPLAY_FREE_CAMERA, true)
                .remove("split_realtime")
                .remove("ghost_route")
                .remove("ghost_route_alpha")
                .remove("ghost_route_thickness")
                .remove("ycs2_prefix")
                .remove("experimental_visible")
                .remove("experimental_ack")
                .putInt(K_MENU_DEFAULTS_VERSION, MENU_DEFAULTS_VERSION);
        if (!preferences.contains(K_SPLIT_ALPHA)) {
            editor.putInt(K_SPLIT_ALPHA, DEFAULT_SPLIT_ALPHA);
        }
        if (!preferences.contains(K_SPLIT_X)) {
            editor.putInt(K_SPLIT_X, DEFAULT_SPLIT_X);
        }
        if (!preferences.contains(K_SPLIT_Y)) {
            editor.putInt(K_SPLIT_Y, DEFAULT_SPLIT_Y);
        }
        editor.apply();
    }

    public static boolean checkpointSplitsEnabled(Context c) {
        applyMenuDefaults(c);
        return prefs(c).getBoolean(K_CHECKPOINT_SPLITS, true);
    }

    public static boolean splitListEnabled(Context c) {
        applyMenuDefaults(c);
        return prefs(c).getBoolean(K_SPLIT_LIST, true);
    }

    public static boolean sectorSplitsEnabled(Context c) {
        applyMenuDefaults(c);
        return checkpointSplitsEnabled(c) && prefs(c).getBoolean(K_SPLIT_SECTOR_DELTA, false);
    }

    public static boolean replayFreeCameraEnabled(Context c) {
        applyMenuDefaults(c);
        return prefs(c).getBoolean(K_REPLAY_FREE_CAMERA, true);
    }

    public static boolean replaySwarmEnabled(Context c) {
        applyMenuDefaults(c);
        return prefs(c).getBoolean(K_REPLAY_SWARM, false);
    }

    public static int splitAlphaPercent(Context c) {
        applyMenuDefaults(c);
        return clamp(prefs(c).getInt(K_SPLIT_ALPHA, DEFAULT_SPLIT_ALPHA), 10, 100);
    }

    public static int splitXdp(Context c) {
        applyMenuDefaults(c);
        return clamp(prefs(c).getInt(K_SPLIT_X, DEFAULT_SPLIT_X), 0, 360);
    }

    public static int splitYdp(Context c) {
        applyMenuDefaults(c);
        return clamp(prefs(c).getInt(K_SPLIT_Y, DEFAULT_SPLIT_Y), 0, 180);
    }

    public static boolean ycs2PrefixEnabled(Context c) {
        return false;
    }

    private static int clamp(int value, int min, int max) {
        return Math.max(min, Math.min(max, value));
    }

    public static void validateCustomLiveriesForGame(Context c) {
        ModDebugLog.install(c);
        for (int car = 0; car < CAR_TEXTURES.length; car++) {
            validateCustomLiveryFile(customTexture(c, car), car, "internal");
            File external = externalTexture(c, car);
            if (external != null) validateCustomLiveryFile(external, car, "external");
        }
    }

    private static void validateCustomLiveryFile(File file, int car, String location) {
        if (file == null || !file.isFile()) return;
        try {
            BitmapFactory.Options bounds = new BitmapFactory.Options();
            bounds.inJustDecodeBounds = true;
            BitmapFactory.decodeFile(file.getAbsolutePath(), bounds);
            boolean valid = bounds.outWidth == TEXTURE_SIZE && bounds.outHeight == TEXTURE_SIZE;
            ModDebugLog.module("livery", "validate " + location
                    + " car=" + carName(car)
                    + " path=" + file.getAbsolutePath()
                    + " size=" + bounds.outWidth + "x" + bounds.outHeight
                    + " bytes=" + file.length()
                    + " valid=" + valid);
            if (!valid) quarantineLivery(file, car, location, "invalid-size-or-decode");
        } catch (Throwable error) {
            ModDebugLog.module("livery", "validate failed " + location
                    + " car=" + carName(car) + " path=" + file.getAbsolutePath(), error);
            quarantineLivery(file, car, location, "exception");
        }
    }

    private static void quarantineLivery(File file, int car, String location, String reason) {
        File quarantine = new File(file.getParentFile(),
                file.getName() + ".bad-" + System.currentTimeMillis());
        boolean renamed = false;
        try {
            renamed = file.renameTo(quarantine);
            if (!renamed) renamed = file.delete();
        } catch (Throwable error) {
            ModDebugLog.module("livery", "quarantine failed " + location
                    + " car=" + carName(car)
                    + " reason=" + reason
                    + " path=" + file.getAbsolutePath(), error);
            return;
        }
        ModDebugLog.module("livery", "quarantined " + location
                + " car=" + carName(car)
                + " reason=" + reason
                + " path=" + file.getAbsolutePath()
                + " target=" + quarantine.getAbsolutePath()
                + " success=" + renamed);
    }

    /**
     * Full-screen pre-launch mod menu shown before the native game (and splash) starts.
     * Replay HUD controls are configured before launch so gameplay is not obscured by menus.
     */
    public static void showPreLaunchMenu(final Activity a, final Runnable onPlay) {
        ModDebugLog.install(a);
        applyMenuDefaults(a);
        ModDebugLog.module("launcher", "show pre-launch menu checkpointSplits="
                + checkpointSplitsEnabled(a));
        ModIdentity.configure(a);
        try {
            LinearLayout root = new LinearLayout(a);
            root.setOrientation(LinearLayout.VERTICAL);
            root.setBackgroundColor(Color.rgb(13, 17, 23));
            root.setPadding(dp(a, 20), dp(a, 16), dp(a, 20), dp(a, 16));

            TextView title = label(a, DISPLAY_NAME, 23, Color.rgb(255, 128, 0));
            title.setGravity(Gravity.CENTER);
            title.setPadding(0, 0, 0, dp(a, 2));
            root.addView(title);

            TextView version = label(a, buildSummary(a), 11, Color.rgb(210, 216, 222));
            version.setGravity(Gravity.CENTER);
            version.setPadding(0, 0, 0, dp(a, 3));
            root.addView(version);

            TextView subtitle = label(a,
                    "A community mod for Jet Car Stunts 2 with updates, custom liveries, and replay split tools before launch.",
                    11, Color.rgb(170, 178, 185));
            subtitle.setGravity(Gravity.CENTER);
            subtitle.setPadding(0, 0, 0, dp(a, 8));
            root.addView(subtitle);

            LinearLayout links = new LinearLayout(a);
            links.setOrientation(LinearLayout.HORIZONTAL);
            links.setGravity(Gravity.CENTER);
            links.setPadding(0, 0, 0, dp(a, 10));
            LinearLayout.LayoutParams gitHubLinkParams = new LinearLayout.LayoutParams(
                    0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f);
            gitHubLinkParams.setMargins(dp(a, 4), 0, dp(a, 4), 0);
            LinearLayout.LayoutParams discordLinkParams = new LinearLayout.LayoutParams(
                    0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f);
            discordLinkParams.setMargins(dp(a, 4), 0, dp(a, 4), 0);
            links.addView(linkButton(a, "GitHub", Color.rgb(36, 41, 46),
                    new GitHubIconDrawable(Color.WHITE, Color.rgb(36, 41, 46)), REPO_URL),
                    gitHubLinkParams);
            links.addView(linkButton(a, "Discord", Color.rgb(88, 101, 242),
                    new DiscordIconDrawable(Color.WHITE, Color.rgb(88, 101, 242)), DISCORD_URL),
                    discordLinkParams);
            root.addView(links);

            ScrollView scroll = new ScrollView(a);
            scroll.setFillViewport(true);
            LinearLayout card = new LinearLayout(a);
            card.setOrientation(LinearLayout.VERTICAL);
            card.setPadding(dp(a, 16), dp(a, 10), dp(a, 16), dp(a, 14));
            card.setBackgroundDrawable(background(Color.rgb(28, 32, 38), dp(a, 10)));

            card.addView(sectionHeader(a, "Mod tools"));

            Button liveries = button(a, "Custom liveries");
            liveries.setOnClickListener(new View.OnClickListener() {
                public void onClick(View v) {
                    ModDebugLog.module("launcher", "custom livery editor clicked");
                    showLiveryManager(a);
                }
            });
            card.addView(liveries, fill());

            Button updates = button(a, "Check for updates");
            updates.setOnClickListener(new View.OnClickListener() {
                public void onClick(View v) {
                    ModDebugLog.module("launcher", "manual update check clicked");
                    UpdateManager.checkNow(a);
                }
            });
            card.addView(updates, fill());

            Button uploadLogs = button(a, "Upload debug logs");
            uploadLogs.setOnClickListener(new View.OnClickListener() {
                public void onClick(View v) {
                    ModDebugLog.module("launcher", "upload debug logs clicked");
                    DebugLogExporter.uploadNow(a);
                }
            });
            card.addView(uploadLogs, fill());

            card.addView(sectionHeader(a, "Cloud sync (Play Games)"));
            TextView playGamesStatus = label(a, PlayGamesAssessment.signInStatus(a), 10,
                    Color.rgb(255, 196, 120));
            playGamesStatus.setPadding(0, 0, 0, dp(a, 2));
            card.addView(playGamesStatus);
            TextView playGamesLeaderboards = label(a,
                    "Leaderboards: " + PlayGamesAssessment.leaderboardFeasibility(),
                    10, Color.rgb(170, 178, 185));
            playGamesLeaderboards.setPadding(0, 0, 0, dp(a, 2));
            card.addView(playGamesLeaderboards);
            TextView playGamesReplays = label(a,
                    "Replays: " + PlayGamesAssessment.replayFeasibility(),
                    10, Color.rgb(170, 178, 185));
            playGamesReplays.setPadding(0, 0, 0, dp(a, 4));
            card.addView(playGamesReplays);
            TextView localBackup = label(a, PlayGamesAssessment.localBackupStatus(a),
                    10, Color.rgb(210, 216, 222));
            localBackup.setPadding(0, 0, 0, dp(a, 4));
            card.addView(localBackup);
            Button exportData = button(a, "Export local stats / replay queue");
            exportData.setOnClickListener(new View.OnClickListener() {
                public void onClick(View v) {
                    ModDebugLog.module("launcher", "local game data export clicked");
                    GameDataExporter.exportNow(a);
                }
            });
            card.addView(exportData, fill());

            TextView coreNote = label(a,
                    "Always on: purchase compatibility, expanded checkpoint capacity, and blue flame identification. Replay files are not rewritten.",
                    10, Color.rgb(150, 158, 165));
            coreNote.setPadding(0, dp(a, 9), 0, dp(a, 2));
            card.addView(coreNote);

            card.addView(sectionHeader(a, "Replay free camera"));
            addCheckBox(a, card,
                    "Enable gesture free camera during replays",
                    K_REPLAY_FREE_CAMERA, true);

            card.addView(sectionHeader(a, "Replay swarm mode"));
            TextView swarmHelp = label(a,
                    "Overlay multiple passive replays on the same track. Open a replay in-game, "
                            + "tap Swarm, choose one primary replay and any extra ghost replays.",
                    10, Color.rgb(170, 178, 185));
            swarmHelp.setPadding(0, 0, 0, dp(a, 2));
            card.addView(swarmHelp);
            addCheckBox(a, card,
                    "Enable replay swarm picker during passive replays",
                    K_REPLAY_SWARM, false);

            card.addView(sectionHeader(a, "Replay split HUD"));
            TextView splitHelp = label(a,
                    "Compares your run with the saved replay ghost when checkpoint timing is available.",
                    10, Color.rgb(170, 178, 185));
            splitHelp.setPadding(0, 0, 0, dp(a, 2));
            card.addView(splitHelp);

            final LinearLayout splitOptions = new LinearLayout(a);
            splitOptions.setOrientation(LinearLayout.VERTICAL);
            splitOptions.setPadding(dp(a, 12), 0, 0, 0);

            addCheckBox(a, card,
                    "Enable checkpoint/sector deltas vs saved replay ghost",
                    K_CHECKPOINT_SPLITS, true, new Runnable() {
                        public void run() {
                            updateSplitOptionsVisibility(a, splitOptions);
                        }
                    });

            addCheckBox(a, splitOptions,
                    "Show consecutive splits as an on-screen list",
                    K_SPLIT_LIST, true);
            addCheckBox(a, splitOptions,
                    "Use sector deltas instead of checkpoint deltas",
                    K_SPLIT_SECTOR_DELTA, false);

            TextView displayLabel = label(a, "Display", 11, Color.rgb(210, 216, 222));
            displayLabel.setPadding(0, dp(a, 6), 0, 0);
            splitOptions.addView(displayLabel, fill());
            addSeek(a, splitOptions, "Text transparency", K_SPLIT_ALPHA,
                    DEFAULT_SPLIT_ALPHA, 10, 100, "%");
            addSeek(a, splitOptions, "Horizontal position", K_SPLIT_X,
                    DEFAULT_SPLIT_X, 0, 360, " dp");
            addSeek(a, splitOptions, "Vertical position", K_SPLIT_Y,
                    DEFAULT_SPLIT_Y, 0, 180, " dp");

            updateSplitOptionsVisibility(a, splitOptions);
            card.addView(splitOptions, fill());

            scroll.addView(card, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT));
            root.addView(scroll, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, 0, 1.0f));

            Button play = button(a, "Start game");
            play.setTextSize(14.0f);
            play.setTextColor(Color.BLACK);
            play.setBackgroundDrawable(background(Color.rgb(255, 128, 0), dp(a, 8)));
            play.setPadding(dp(a, 16), dp(a, 12), dp(a, 16), dp(a, 12));
            LinearLayout.LayoutParams playLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            playLp.topMargin = dp(a, 12);
            play.setOnClickListener(new View.OnClickListener() {
                public void onClick(View v) {
                    ModDebugLog.module("launcher", "play button invoking onPlay");
                    onPlay.run();
                }
            });
            root.addView(play, playLp);

            a.setContentView(root);
        } catch (Throwable t) {
            Log.e("YCS2Mod", "Could not show pre-launch mod menu", t);
            ModDebugLog.module("launcher", "Could not show pre-launch mod menu; falling back to game", t);
            onPlay.run();
        }
    }

    private static String buildSummary(Context c) {
        try {
            android.content.pm.PackageInfo info =
                    c.getPackageManager().getPackageInfo(c.getPackageName(), 0);
            String summary = "Version " + info.versionName + " | Build " + info.versionCode;
            String buildDate = buildDateUtc(c);
            if (buildDate.length() > 0) {
                summary += " | Built " + buildDate;
            }
            return summary;
        } catch (Throwable error) {
            return "Version unknown";
        }
    }

    private static String buildDateUtc(Context c) {
        InputStream input = null;
        try {
            input = c.getAssets().open("ycs2-build-info.properties");
            Properties properties = new Properties();
            properties.load(input);
            return properties.getProperty("build_date_utc", "").trim();
        } catch (Throwable ignored) {
            return "";
        } finally {
            closeQuietly(input);
        }
    }

    private static CheckBox addCheckBox(final Context c, LinearLayout card, String text,
                                        final String key, boolean defaultValue) {
        return addCheckBox(c, card, text, key, defaultValue, null);
    }

    private static CheckBox addCheckBox(final Context c, LinearLayout card, String text,
                                        final String key, boolean defaultValue,
                                        final Runnable afterChange) {
        final CheckBox checkBox = new CheckBox(c);
        checkBox.setText(text);
        checkBox.setTextColor(Color.WHITE);
        checkBox.setTextSize(11.0f);
        checkBox.setChecked(prefs(c).getBoolean(key, defaultValue));
        checkBox.setPadding(0, dp(c, 4), 0, 0);
        checkBox.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                prefs(c).edit().putBoolean(key, checkBox.isChecked()).apply();
                if (afterChange != null) {
                    afterChange.run();
                }
                ModDebugLog.module("launcher", "option toggled key=" + key
                        + " value=" + checkBox.isChecked());
            }
        });
        card.addView(checkBox, fill());
        return checkBox;
    }

    private static void updateSplitOptionsVisibility(Context c, View content) {
        applyMenuDefaults(c);
        content.setVisibility(prefs(c).getBoolean(K_CHECKPOINT_SPLITS, true)
                ? View.VISIBLE : View.GONE);
    }

    private static LinearLayout addSeek(final Context c, LinearLayout card, String label,
                                        final String key, int defaultValue, final int min,
                                        int max, final String suffix) {
        LinearLayout row = new LinearLayout(c);
        row.setOrientation(LinearLayout.VERTICAL);
        final TextView value = label(c, "", 10, Color.rgb(210, 216, 222));
        final SeekBar seekBar = new SeekBar(c);
        seekBar.setMax(max - min);
        seekBar.setProgress(clamp(prefs(c).getInt(key, defaultValue), min, max) - min);
        updateSeekLabel(value, label, min + seekBar.getProgress(), suffix);
        seekBar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                int newValue = min + progress;
                prefs(c).edit().putInt(key, newValue).apply();
                updateSeekLabel(value, label, newValue, suffix);
                ModDebugLog.module("launcher", "option changed key=" + key + " value=" + newValue);
            }

            public void onStartTrackingTouch(SeekBar seekBar) {
            }

            public void onStopTrackingTouch(SeekBar seekBar) {
            }
        });
        value.setPadding(0, dp(c, 4), 0, 0);
        row.addView(value, fill());
        row.addView(seekBar, fill());
        card.addView(row, fill());
        return row;
    }

    private static void updateSeekLabel(TextView view, String label, int value, String suffix) {
        view.setText(label + ": " + value + suffix);
    }

    public static void showLiveryManager(final Activity a) {
        ModDebugLog.install(a);
        ModDebugLog.module("livery", "open manager selectedCar=" + carName(selectedCar(a)));
        try {
            final LinearLayout manager = new LinearLayout(a);
            manager.setOrientation(LinearLayout.VERTICAL);
            manager.setPadding(dp(a, 18), dp(a, 4), dp(a, 18), dp(a, 4));

            TextView help = label(a,
                    "Design a livery in the app, upload any PNG/JPG, or export the exact UV " +
                            "texture to edit elsewhere. Liveries are 512x512 PNG and apply after a restart.",
                    11, Color.DKGRAY);
            help.setPadding(0, 0, 0, dp(a, 8));
            manager.addView(help);

            final Spinner cars = new Spinner(a);
            ArrayAdapter<String> adapter = new ArrayAdapter<String>(a,
                    android.R.layout.simple_spinner_item, CAR_NAMES);
            adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
            cars.setAdapter(adapter);
            cars.setSelection(selectedCar(a));
            manager.addView(cars, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

            final TextView status = label(a, "", 11, Color.DKGRAY);
            status.setPadding(0, dp(a, 5), 0, dp(a, 5));
            manager.addView(status);

            Button design = button(a, "Ã°Å¸Å½Â¨  Open livery designer");
            design.setTextSize(13.0f);
            design.setTextColor(Color.WHITE);
            design.setBackgroundDrawable(background(Color.rgb(255, 128, 0), dp(a, 8)));
            design.setOnClickListener(new View.OnClickListener() {
                public void onClick(View v) {
                    rememberCar(a, cars);
                    try {
                        Intent intent = new Intent(a, LiveryDesignerActivity.class);
                        intent.putExtra(LiveryDesignerActivity.EXTRA_CAR, cars.getSelectedItemPosition());
                        a.startActivity(intent);
                    } catch (Throwable t) {
                        toast(a, "Could not open the designer.");
                    }
                }
            });
            LinearLayout.LayoutParams designLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            designLp.bottomMargin = dp(a, 8);
            manager.addView(design, designLp);

            LinearLayout actions = new LinearLayout(a);
            actions.setOrientation(LinearLayout.HORIZONTAL);
            final Button upload = button(a, "Upload");
            final Button export = button(a, "Export / edit");
            final Button restore = button(a, "Restore default");
            actions.addView(upload, new LinearLayout.LayoutParams(0,
                    ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f));
            actions.addView(export, new LinearLayout.LayoutParams(0,
                    ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f));
            actions.addView(restore, new LinearLayout.LayoutParams(0,
                    ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f));
            manager.addView(actions);

            final Runnable refresh = new Runnable() {
                public void run() {
                    int car = cars.getSelectedItemPosition();
                    status.setText(customTexture(a, car).isFile()
                            ? "Active livery: custom"
                            : "Active livery: bundled default");
                }
            };
            cars.setOnItemSelectedListener(new android.widget.AdapterView.OnItemSelectedListener() {
                public void onItemSelected(android.widget.AdapterView<?> parent, View view,
                                           int position, long id) {
                    rememberCar(a, cars);
                    ModDebugLog.module("livery", "manager selected car=" + carName(position)
                            + " customExists=" + customTexture(a, position).isFile());
                    refresh.run();
                }

                public void onNothingSelected(android.widget.AdapterView<?> parent) {
                }
            });
            refresh.run();

            upload.setOnClickListener(new View.OnClickListener() {
                public void onClick(View v) {
                    rememberCar(a, cars);
                    try {
                        ModDebugLog.module("livery", "launch import picker car="
                                + carName(selectedCar(a)));
                        Intent intent = new Intent(Build.VERSION.SDK_INT >= 19
                                ? "android.intent.action.OPEN_DOCUMENT" : Intent.ACTION_GET_CONTENT);
                        intent.addCategory(Intent.CATEGORY_OPENABLE);
                        intent.setType("image/*");
                        a.startActivityForResult(intent, REQUEST_IMPORT);
                    } catch (Throwable t) {
                        ModDebugLog.module("livery", "launch import picker failed", t);
                        toast(a, "No file picker available on this device.");
                    }
                }
            });
            export.setOnClickListener(new View.OnClickListener() {
                public void onClick(View v) {
                    rememberCar(a, cars);
                    if (Build.VERSION.SDK_INT < 19) {
                        toast(a, "Export requires Android 4.4 or newer.");
                        return;
                    }
                    int car = selectedCar(a);
                    try {
                        ModDebugLog.module("livery", "launch export picker car=" + carName(car));
                        Intent intent = new Intent("android.intent.action.CREATE_DOCUMENT");
                        intent.addCategory(Intent.CATEGORY_OPENABLE);
                        intent.setType("image/png");
                        intent.putExtra(Intent.EXTRA_TITLE,
                                "jcs2-" + CAR_NAMES[car].toLowerCase().replace(' ', '-') + "-livery.png");
                        a.startActivityForResult(intent, REQUEST_EXPORT);
                    } catch (Throwable t) {
                        ModDebugLog.module("livery", "launch export picker failed", t);
                        toast(a, "No file picker available on this device.");
                    }
                }
            });
            restore.setOnClickListener(new View.OnClickListener() {
                public void onClick(View v) {
                    int car = cars.getSelectedItemPosition();
                    ModDebugLog.module("livery", "restore default car=" + carName(car));
                    deleteCustomLivery(a, car);
                    refresh.run();
                    toast(a, CAR_NAMES[car] + " restored. Restart the game to apply.");
                }
            });

            new AlertDialog.Builder(a)
                    .setTitle("Custom liveries - all cars")
                    .setView(manager)
                    .setNegativeButton("Close", null)
                    .show();
        } catch (Throwable t) {
            Log.e("YCS2Mod", "Could not open livery manager", t);
            ModDebugLog.module("livery", "Could not open livery manager", t);
            toast(a, "Could not open livery manager.");
        }
    }

    public static boolean handleActivityResult(Activity a, int requestCode, int resultCode,
                                               Intent data) {
        if (requestCode != REQUEST_IMPORT && requestCode != REQUEST_EXPORT) return false;
        ModDebugLog.install(a);
        ModDebugLog.module("livery", "handle result request=" + requestCode
                + " result=" + resultCode
                + " hasData=" + (data != null)
                + " hasUri=" + (data != null && data.getData() != null));
        if (resultCode != Activity.RESULT_OK || data == null || data.getData() == null) return true;
        Uri uri = data.getData();
        int car = selectedCar(a);
        try {
            if (requestCode == REQUEST_IMPORT) {
                ModDebugLog.module("livery", "import result uri=" + uri + " car=" + carName(car));
                importLivery(a, uri, car);
                toast(a, CAR_NAMES[car] + " livery imported. Restart the game to apply.");
            } else {
                ModDebugLog.module("livery", "export result uri=" + uri + " car=" + carName(car));
                exportLivery(a, uri, car);
                toast(a, CAR_NAMES[car] + " livery exported for editing.");
            }
            ModDebugLog.module("livery", "activity result handled successfully request=" + requestCode);
        } catch (Throwable t) {
            Log.e("YCS2Mod", "Livery file operation failed", t);
            ModDebugLog.module("livery", "Livery file operation failed", t);
            toast(a, "Livery operation failed: " + t.getMessage());
        }
        return true;
    }

    private static void importLivery(Context c, Uri uri, int car) throws Exception {
        ModDebugLog.module("livery", "import start car=" + carName(car) + " uri=" + uri);
        Bitmap source = decodeSampled(c, uri);
        if (source == null) throw new IllegalArgumentException("Unsupported image");
        Bitmap scaled = null;
        try {
            ModDebugLog.module("livery", "import decoded source="
                    + source.getWidth() + "x" + source.getHeight());
            scaled = Bitmap.createScaledBitmap(source, TEXTURE_SIZE, TEXTURE_SIZE, true);
            writeLivery(customTexture(c, car), scaled);
            mirrorExternal(c, car, scaled);
            ModDebugLog.module("livery", "import complete car=" + carName(car));
        } finally {
            if (scaled != null && scaled != source) scaled.recycle();
            source.recycle();
        }
    }

    /** Decodes an image, downsampling huge sources so we never OOM on import. */
    private static Bitmap decodeSampled(Context c, Uri uri) throws Exception {
        ModDebugLog.module("livery", "decode probe uri=" + uri);
        BitmapFactory.Options bounds = new BitmapFactory.Options();
        bounds.inJustDecodeBounds = true;
        InputStream probe = null;
        try {
            probe = c.getContentResolver().openInputStream(uri);
            BitmapFactory.decodeStream(probe, null, bounds);
        } finally {
            closeQuietly(probe);
        }
        int sample = 1;
        int largest = Math.max(bounds.outWidth, bounds.outHeight);
        while (largest / sample > TEXTURE_SIZE * 2) sample *= 2;
        ModDebugLog.module("livery", "decode bounds width=" + bounds.outWidth
                + " height=" + bounds.outHeight + " sample=" + sample);

        BitmapFactory.Options options = new BitmapFactory.Options();
        options.inSampleSize = sample;
        options.inPreferredConfig = Bitmap.Config.ARGB_8888;
        InputStream input = null;
        try {
            input = c.getContentResolver().openInputStream(uri);
            return BitmapFactory.decodeStream(input, null, options);
        } finally {
            closeQuietly(input);
        }
    }

    /** Atomically writes a bitmap as a PNG to target (via a .tmp + rename). */
    private static void writeLivery(File target, Bitmap bitmap) throws Exception {
        ModDebugLog.module("livery", "write livery target=" + target.getAbsolutePath()
                + " bitmap=" + bitmap.getWidth() + "x" + bitmap.getHeight());
        File parent = target.getParentFile();
        if (parent == null || (!parent.isDirectory() && !parent.mkdirs())) {
            throw new IllegalStateException("Could not create livery folder");
        }
        File temp = new File(target.getPath() + ".tmp");
        FileOutputStream output = null;
        try {
            output = new FileOutputStream(temp);
            if (!bitmap.compress(Bitmap.CompressFormat.PNG, 100, output)) {
                throw new IllegalStateException("Could not encode PNG");
            }
            output.flush();
            closeQuietly(output);
            output = null;
            if (target.exists() && !target.delete()) {
                throw new IllegalStateException("Could not replace old livery");
            }
            if (!temp.renameTo(target)) throw new IllegalStateException("Could not save livery");
            ModDebugLog.module("livery", "write livery complete target=" + target.getAbsolutePath()
                    + " bytes=" + target.length());
        } finally {
            closeQuietly(output);
            if (temp.exists()) temp.delete();
        }
    }

    /** Best-effort mirror of a livery to external files dir; failures are non-fatal. */
    private static void mirrorExternal(Context c, int car, Bitmap bitmap) {
        try {
            File external = externalTexture(c, car);
            if (external != null) {
                ModDebugLog.module("livery", "mirror external car=" + carName(car)
                        + " target=" + external.getAbsolutePath());
                writeLivery(external, bitmap);
            } else {
                ModDebugLog.module("livery", "mirror external skipped; no external files dir");
            }
        } catch (Throwable error) {
            ModDebugLog.module("livery", "mirror external failed car=" + carName(car), error);
        }
    }

    private static void exportLivery(Context c, Uri uri, int car) throws Exception {
        ModDebugLog.module("livery", "export start car=" + carName(car) + " uri=" + uri);
        InputStream input = null;
        OutputStream output = null;
        int total = 0;
        try {
            File custom = customTexture(c, car);
            input = custom.isFile()
                    ? new java.io.FileInputStream(custom)
                    : c.getAssets().open(CAR_TEXTURES[car]);
            output = c.getContentResolver().openOutputStream(uri);
            if (output == null) throw new IllegalStateException("Could not open export destination");
            byte[] buffer = new byte[16384];
            int count;
            while ((count = input.read(buffer)) != -1) {
                output.write(buffer, 0, count);
                total += count;
            }
            output.flush();
            ModDebugLog.module("livery", "export complete car=" + carName(car)
                    + " bytes=" + total + " custom=" + custom.isFile());
        } finally {
            closeQuietly(input);
            closeQuietly(output);
        }
    }

    /** Removes the custom livery (internal + external mirror) for one car. */
    public static void deleteCustomLivery(Context c, int car) {
        ModDebugLog.install(c);
        File custom = customTexture(c, car);
        if (custom.exists()) {
            boolean deleted = custom.delete();
            ModDebugLog.module("livery", "delete internal car=" + carName(car)
                    + " path=" + custom.getAbsolutePath() + " deleted=" + deleted);
        }
        File external = externalTexture(c, car);
        if (external != null && external.exists()) {
            boolean deleted = external.delete();
            ModDebugLog.module("livery", "delete external car=" + carName(car)
                    + " path=" + external.getAbsolutePath() + " deleted=" + deleted);
        }
    }

    public static void resetAllCustomLiveries(Context c) {
        ModDebugLog.install(c);
        ModDebugLog.module("livery", "reset all custom liveries");
        for (int car = 0; car < CAR_TEXTURES.length; car++) {
            deleteCustomLivery(c, car);
        }
    }

    private abstract static class LinkIconDrawable extends Drawable {
        final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        final Paint cutout = new Paint(Paint.ANTI_ALIAS_FLAG);
        final Path path = new Path();

        LinkIconDrawable(int color, int background) {
            paint.setStyle(Paint.Style.FILL);
            paint.setColor(color);
            cutout.setStyle(Paint.Style.FILL);
            cutout.setColor(background);
        }

        public void setAlpha(int alpha) {
            paint.setAlpha(alpha);
            cutout.setAlpha(alpha);
        }

        public void setColorFilter(ColorFilter colorFilter) {
            paint.setColorFilter(colorFilter);
            cutout.setColorFilter(colorFilter);
        }

        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }

        public int getIntrinsicWidth() {
            return 24;
        }

        public int getIntrinsicHeight() {
            return 24;
        }
    }

    private static class GitHubIconDrawable extends LinkIconDrawable {
        GitHubIconDrawable(int color, int background) {
            super(color, background);
        }

        public void draw(Canvas canvas) {
            Rect b = getBounds();
            float size = Math.min(b.width(), b.height());
            float x = b.left + (b.width() - size) / 2.0f;
            float y = b.top + (b.height() - size) / 2.0f;
            float cx = x + size * 0.5f;
            float cy = y + size * 0.5f;

            path.reset();
            path.moveTo(x + size * 0.24f, y + size * 0.30f);
            path.lineTo(x + size * 0.18f, y + size * 0.08f);
            path.lineTo(x + size * 0.38f, y + size * 0.20f);
            path.lineTo(x + size * 0.62f, y + size * 0.20f);
            path.lineTo(x + size * 0.82f, y + size * 0.08f);
            path.lineTo(x + size * 0.76f, y + size * 0.30f);
            path.close();
            canvas.drawPath(path, paint);
            canvas.drawCircle(cx, cy, size * 0.34f, paint);
            RectF chin = new RectF(cx - size * 0.15f, y + size * 0.67f,
                    cx + size * 0.15f, y + size * 0.93f);
            canvas.drawRoundRect(chin, size * 0.08f, size * 0.08f, paint);
        }
    }

    private static class DiscordIconDrawable extends LinkIconDrawable {
        DiscordIconDrawable(int color, int background) {
            super(color, background);
        }

        public void draw(Canvas canvas) {
            Rect b = getBounds();
            float size = Math.min(b.width(), b.height());
            float x = b.left + (b.width() - size) / 2.0f;
            float y = b.top + (b.height() - size) / 2.0f;

            path.reset();
            path.moveTo(x + size * 0.24f, y + size * 0.27f);
            path.cubicTo(x + size * 0.36f, y + size * 0.19f,
                    x + size * 0.64f, y + size * 0.19f,
                    x + size * 0.76f, y + size * 0.27f);
            path.cubicTo(x + size * 0.86f, y + size * 0.37f,
                    x + size * 0.90f, y + size * 0.55f,
                    x + size * 0.82f, y + size * 0.72f);
            path.cubicTo(x + size * 0.73f, y + size * 0.78f,
                    x + size * 0.62f, y + size * 0.72f,
                    x + size * 0.57f, y + size * 0.66f);
            path.lineTo(x + size * 0.43f, y + size * 0.66f);
            path.cubicTo(x + size * 0.38f, y + size * 0.72f,
                    x + size * 0.27f, y + size * 0.78f,
                    x + size * 0.18f, y + size * 0.72f);
            path.cubicTo(x + size * 0.10f, y + size * 0.55f,
                    x + size * 0.14f, y + size * 0.37f,
                    x + size * 0.24f, y + size * 0.27f);
            path.close();
            canvas.drawPath(path, paint);
            canvas.drawCircle(x + size * 0.39f, y + size * 0.50f, size * 0.055f, cutout);
            canvas.drawCircle(x + size * 0.61f, y + size * 0.50f, size * 0.055f, cutout);
            RectF smile = new RectF(x + size * 0.43f, y + size * 0.57f,
                    x + size * 0.57f, y + size * 0.63f);
            canvas.drawRoundRect(smile, size * 0.03f, size * 0.03f, cutout);
        }
    }

}
