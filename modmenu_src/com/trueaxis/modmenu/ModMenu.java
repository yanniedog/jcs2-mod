package com.trueaxis.modmenu;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Color;
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
 * Mod settings for the YCS2 (JCS2 mod) community build.
 * The launcher exposes only disclosure, game launch, and custom livery tools.
 */
public class ModMenu {
    private static final String PREFS = "jcs_mod";
    private static final String K_CAR = "livery_car";
    private static final String K_CHECKPOINT_SPLITS = "checkpoint_splits";
    private static final String K_SPLIT_LIST = "split_list";
    private static final String K_SPLIT_REALTIME = "split_realtime";
    private static final String K_SPLIT_SECTOR_DELTA = "split_sector_delta";
    private static final String K_SPLIT_ALPHA = "split_alpha";
    private static final String K_SPLIT_X = "split_x";
    private static final String K_SPLIT_Y = "split_y";
    private static final String K_GHOST_ROUTE = "ghost_route";
    private static final String K_GHOST_ROUTE_ALPHA = "ghost_route_alpha";
    private static final String K_GHOST_ROUTE_THICKNESS = "ghost_route_thickness";
    private static final String K_YCS2_PREFIX = "ycs2_prefix";
    private static final String K_EXPERIMENTAL_VISIBLE = "experimental_visible";
    private static final String K_EXPERIMENTAL_ACK = "experimental_ack";
    private static final String REPO_URL = "https://github.com/yanniedog/jcs2-mod";
    private static final String DISPLAY_NAME = "YCS2 (JCS2 mod)";
    private static final int REQUEST_IMPORT = 7301;
    private static final int REQUEST_EXPORT = 7302;
    private static final int TEXTURE_SIZE = 512;
    private static final int DEFAULT_SPLIT_ALPHA = 90;
    private static final int DEFAULT_SPLIT_X = 88;
    private static final int DEFAULT_SPLIT_Y = 39;
    private static final int DEFAULT_GHOST_ROUTE_ALPHA = 85;
    private static final int DEFAULT_GHOST_ROUTE_THICKNESS = 7;

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

    public static boolean checkpointSplitsEnabled(Context c) {
        return experimentalFeaturesEnabled(c) && prefs(c).getBoolean(K_CHECKPOINT_SPLITS, false);
    }

    public static boolean splitListEnabled(Context c) {
        return experimentalFeaturesEnabled(c) && prefs(c).getBoolean(K_SPLIT_LIST, false);
    }

    public static boolean realtimeSplitsEnabled(Context c) {
        return experimentalFeaturesEnabled(c) && prefs(c).getBoolean(K_SPLIT_REALTIME, false);
    }

    public static boolean sectorSplitsEnabled(Context c) {
        return checkpointSplitsEnabled(c) && prefs(c).getBoolean(K_SPLIT_SECTOR_DELTA, false);
    }

    public static int splitAlphaPercent(Context c) {
        return clamp(prefs(c).getInt(K_SPLIT_ALPHA, DEFAULT_SPLIT_ALPHA), 10, 100);
    }

    public static int splitXdp(Context c) {
        return clamp(prefs(c).getInt(K_SPLIT_X, DEFAULT_SPLIT_X), 0, 360);
    }

    public static int splitYdp(Context c) {
        return clamp(prefs(c).getInt(K_SPLIT_Y, DEFAULT_SPLIT_Y), 0, 180);
    }

    public static boolean ghostRouteEnabled(Context c) {
        return experimentalFeaturesEnabled(c) && prefs(c).getBoolean(K_GHOST_ROUTE, false);
    }

    public static int ghostRouteAlphaPercent(Context c) {
        return clamp(prefs(c).getInt(K_GHOST_ROUTE_ALPHA, DEFAULT_GHOST_ROUTE_ALPHA), 5, 100);
    }

    public static int ghostRouteThicknessDp(Context c) {
        return clamp(prefs(c).getInt(K_GHOST_ROUTE_THICKNESS, DEFAULT_GHOST_ROUTE_THICKNESS), 1, 16);
    }

    public static boolean ycs2PrefixEnabled(Context c) {
        return experimentalFeaturesEnabled(c) && prefs(c).getBoolean(K_YCS2_PREFIX, false);
    }

    private static boolean experimentalFeaturesEnabled(Context c) {
        return prefs(c).getBoolean(K_EXPERIMENTAL_VISIBLE, false)
                && prefs(c).getBoolean(K_EXPERIMENTAL_ACK, false);
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
     * Experimental HUD/disclosure controls are hidden until explicitly acknowledged.
     */
    public static void showPreLaunchMenu(final Activity a, final Runnable onPlay) {
        ModDebugLog.install(a);
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
                    "This is the YCS2 modified APK. Replays and leaderboard submissions originate from a modified client.",
                    11, Color.rgb(170, 178, 185));
            subtitle.setGravity(Gravity.CENTER);
            subtitle.setPadding(0, 0, 0, dp(a, 8));
            root.addView(subtitle);

            TextView repo = label(a, "GitHub repository: " + REPO_URL, 11, Color.rgb(88, 166, 255));
            repo.setGravity(Gravity.CENTER);
            repo.setPadding(0, 0, 0, dp(a, 10));
            repo.setOnClickListener(new View.OnClickListener() {
                public void onClick(View v) {
                    try {
                        ModDebugLog.module("launcher", "open repo url=" + REPO_URL);
                        a.startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(REPO_URL)));
                    } catch (Throwable error) {
                        ModDebugLog.module("launcher", "open repo failed", error);
                        Toast.makeText(a, REPO_URL, Toast.LENGTH_LONG).show();
                    }
                }
            });
            root.addView(repo);

            ScrollView scroll = new ScrollView(a);
            scroll.setFillViewport(true);
            LinearLayout card = new LinearLayout(a);
            card.setOrientation(LinearLayout.VERTICAL);
            card.setPadding(dp(a, 16), dp(a, 10), dp(a, 16), dp(a, 14));
            card.setBackgroundDrawable(background(Color.rgb(28, 32, 38), dp(a, 10)));

            card.addView(sectionHeader(a, "Community features"));

            Button liveries = button(a, "Custom livery editor");
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

            final LinearLayout experimental = new LinearLayout(a);
            experimental.setOrientation(LinearLayout.VERTICAL);

            final CheckBox showExperimental = new CheckBox(a);
            showExperimental.setText("Show buggy experimental features");
            showExperimental.setTextColor(Color.WHITE);
            showExperimental.setTextSize(11.0f);
            showExperimental.setChecked(prefs(a).getBoolean(K_EXPERIMENTAL_VISIBLE, false));
            showExperimental.setPadding(0, dp(a, 8), 0, 0);
            card.addView(showExperimental, fill());

            final CheckBox acknowledgeExperimental = new CheckBox(a);
            acknowledgeExperimental.setText("I understand: buggy, unstable, not ready.");
            acknowledgeExperimental.setTextColor(Color.rgb(255, 200, 120));
            acknowledgeExperimental.setTextSize(11.0f);
            acknowledgeExperimental.setChecked(prefs(a).getBoolean(K_EXPERIMENTAL_ACK, false));
            acknowledgeExperimental.setPadding(0, dp(a, 2), 0, 0);
            card.addView(acknowledgeExperimental, fill());

            showExperimental.setOnClickListener(new View.OnClickListener() {
                public void onClick(View v) {
                    prefs(a).edit().putBoolean(
                            K_EXPERIMENTAL_VISIBLE, showExperimental.isChecked()).apply();
                    ModIdentity.configure(a);
                    updateExperimentalVisibility(a, experimental);
                    ModDebugLog.module("launcher", "experimental section visible="
                            + showExperimental.isChecked());
                }
            });

            acknowledgeExperimental.setOnClickListener(new View.OnClickListener() {
                public void onClick(View v) {
                    prefs(a).edit().putBoolean(
                            K_EXPERIMENTAL_ACK, acknowledgeExperimental.isChecked()).apply();
                    ModIdentity.configure(a);
                    updateExperimentalVisibility(a, experimental);
                    ModDebugLog.module("launcher", "experimental section acknowledged="
                            + acknowledgeExperimental.isChecked());
                }
            });

            experimental.addView(sectionHeader(a, "Buggy experimental features"));
            TextView experimentalNote = label(a,
                    "These are unstable and unfinished.",
                    10, Color.rgb(255, 200, 120));
            experimentalNote.setPadding(0, 0, 0, dp(a, 4));
            experimental.addView(experimentalNote);

            addCheckBox(a, experimental, "Checkpoint/sector deltas vs raced replay ghost",
                    K_CHECKPOINT_SPLITS, false);

            experimental.addView(sectionHeader(a, "Split HUD options"));
            addCheckBox(a, experimental, "Sector delta mode (off: checkpoint delta)",
                    K_SPLIT_SECTOR_DELTA, false);
            addCheckBox(a, experimental, "Show consecutive splits as an on-screen list",
                    K_SPLIT_LIST, false);
            addCheckBox(a, experimental, "Continuously refresh the split readout while racing a ghost",
                    K_SPLIT_REALTIME, false);
            addSeek(a, experimental, "Split text transparency", K_SPLIT_ALPHA,
                    DEFAULT_SPLIT_ALPHA, 10, 100, "%");
            addSeek(a, experimental, "Split text horizontal position", K_SPLIT_X,
                    DEFAULT_SPLIT_X, 0, 360, " dp");
            addSeek(a, experimental, "Split text vertical position", K_SPLIT_Y,
                    DEFAULT_SPLIT_Y, 0, 180, " dp");

            experimental.addView(sectionHeader(a, "Ghost track line"));
            addCheckBox(a, experimental,
                    "Draw ghost track line (buggy/unstable)",
                    K_GHOST_ROUTE, false);
            addSeek(a, experimental, "Ghost track line transparency", K_GHOST_ROUTE_ALPHA,
                    DEFAULT_GHOST_ROUTE_ALPHA, 5, 100, "%");
            addSeek(a, experimental, "Ghost track line thickness", K_GHOST_ROUTE_THICKNESS,
                    DEFAULT_GHOST_ROUTE_THICKNESS, 1, 16, " dp");
            TextView routeNote = label(a,
                    "Read-only overlay; it should not alter replay, timing, score, physics, or controls.",
                    10, Color.rgb(150, 158, 165));
            routeNote.setPadding(0, dp(a, 4), 0, 0);
            experimental.addView(routeNote);

            experimental.addView(sectionHeader(a, "Disclosure"));
            addCheckBox(a, experimental,
                    "Prefix submitted names with (YCS2) where Java-side name fields are visible",
                    K_YCS2_PREFIX, false);
            updateExperimentalVisibility(a, experimental);
            card.addView(experimental, fill());

            TextView note = label(a,
                    "Always active: offline IAP ownership compatibility, 999 checkpoint-time capacity, and blue flame visual identification. Replay data is not modified.",
                    10, Color.rgb(150, 158, 165));
            note.setPadding(0, dp(a, 10), 0, 0);
            card.addView(note);

            scroll.addView(card, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT));
            root.addView(scroll, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, 0, 1.0f));

            Button play = button(a, "START GAME");
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

    private static void addCheckBox(final Context c, LinearLayout card, String text,
                                    final String key, boolean defaultValue) {
        final CheckBox checkBox = new CheckBox(c);
        checkBox.setText(text);
        checkBox.setTextColor(Color.WHITE);
        checkBox.setTextSize(11.0f);
        checkBox.setChecked(prefs(c).getBoolean(key, defaultValue));
        checkBox.setPadding(0, dp(c, 4), 0, 0);
        checkBox.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                prefs(c).edit().putBoolean(key, checkBox.isChecked()).apply();
                ModIdentity.configure(c);
                ModDebugLog.module("launcher", "option toggled key=" + key
                        + " value=" + checkBox.isChecked());
            }
        });
        card.addView(checkBox, fill());
    }

    private static void updateExperimentalVisibility(Context c, View content) {
        content.setVisibility(experimentalFeaturesEnabled(c) ? View.VISIBLE : View.GONE);
    }

    private static void addSeek(final Context c, LinearLayout card, String label,
                                final String key, int defaultValue, final int min,
                                int max, final String suffix) {
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
        card.addView(value, fill());
        card.addView(seekBar, fill());
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

}
