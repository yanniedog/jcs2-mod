package com.trueaxis.modmenu;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ClipData;
import android.content.ClipboardManager;
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
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.os.Build;
import android.util.Log;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.FrameLayout;
import android.widget.ImageView;
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
    private static final String K_REPLAY_CAMERA_MODE = "replay_camera_mode";
    // First managed mode value; spinner index 0 maps to this (Orbit). Matches
    // replay_camera::MODE_ORBIT on the native side.
    private static final int REPLAY_CAMERA_MODE_FIRST = 1;
    private static final String[] REPLAY_CAMERA_MODE_NAMES = {
            "Orbit", "Helicopter (track-locked)", "GoPro (car-locked)",
            "Trackside (static cameras)" };
    private static final String K_ORBIT_RADIUS = "orbit_radius";
    private static final String K_ORBIT_SPEED = "orbit_speed";
    private static final String K_ORBIT_HEIGHT = "orbit_height";
    private static final int DEFAULT_ORBIT_RADIUS = 8;
    private static final int DEFAULT_ORBIT_SPEED = 72;
    private static final int DEFAULT_ORBIT_HEIGHT = 42;
    private static final String K_TRACKSIDE_SIDE_MODE = "trackside_side_mode";
    private static final String K_TRACKSIDE_SIDE_DIST = "trackside_side_dist";
    private static final String K_TRACKSIDE_HEIGHT = "trackside_height";
    private static final String K_TRACKSIDE_MIN_DIST = "trackside_min_dist";
    private static final String K_TRACKSIDE_MAX_DIST = "trackside_max_dist";
    private static final String[] TRACKSIDE_SIDE_NAMES = {
            "Alternate sides", "Left side only", "Right side only" };
    private static final int DEFAULT_TRACKSIDE_SIDE_DIST = 11;
    private static final int DEFAULT_TRACKSIDE_HEIGHT = 7;
    private static final int DEFAULT_TRACKSIDE_MIN_DIST = 35;
    private static final int DEFAULT_TRACKSIDE_MAX_DIST = 55;
    private static final String K_CAMERA_CYCLE = "camera_cycle";
    private static final String K_CAMERA_CYCLE_SECONDS = "camera_cycle_seconds";
    private static final int DEFAULT_CAMERA_CYCLE_SECONDS = 10;
    private static final String K_REPLAY_SWARM = "replay_swarm";
    private static final String K_RACE_SWARM = "race_ghost_swarm";
    private static final String K_SWARM_CATALOG = "swarm_catalog_paths";
    private static final int SWARM_CATALOG_MAX = 32;
    private static final String K_SPLIT_ALPHA = "split_alpha";
    private static final String K_SPLIT_X = "split_x";
    private static final String K_SPLIT_Y = "split_y";
    private static final String REPO_URL = "https://github.com/yanniedog/jcs2-mod";
    private static final String DISCORD_URL = "https://discord.gg/stBdE2Tfs2";
    private static final String DONATE_SOLANA_ADDRESS =
            "F6mjNXKBKzjmKTK1Z9cWabFHZYtxMg8rojuNuppX2EG1";
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
        view.setTextColor(Color.WHITE);
        view.setBackgroundDrawable(background(Color.rgb(48, 56, 68), dp(c, 10)));
        view.setPadding(dp(c, 12), dp(c, 8), dp(c, 12), dp(c, 8));
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

    private static Button iconLinkButton(final Activity a, int color, Drawable icon,
            String contentDescription, final View.OnClickListener listener) {
        Button view = new Button(a);
        view.setText("");
        view.setContentDescription(contentDescription);
        view.setGravity(Gravity.CENTER);
        view.setMinHeight(0);
        view.setMinimumHeight(0);
        view.setMinWidth(0);
        view.setMinimumWidth(0);
        int pad = dp(a, 9);
        view.setPadding(pad, pad, pad, pad);
        view.setBackgroundDrawable(background(color, dp(a, 10)));
        int iconSize = dp(a, 22);
        icon.setBounds(0, 0, iconSize, iconSize);
        view.setCompoundDrawables(icon, null, null, null);
        view.setOnClickListener(listener);
        return view;
    }

    private static Button miniIconButton(final Activity a, Drawable icon,
            String contentDescription, final View.OnClickListener listener) {
        Button view = new Button(a);
        view.setText("");
        view.setContentDescription(contentDescription);
        view.setGravity(Gravity.CENTER);
        view.setMinHeight(0);
        view.setMinimumHeight(0);
        view.setMinWidth(0);
        view.setMinimumWidth(0);
        int pad = dp(a, 4);
        view.setPadding(pad, pad, pad, pad);
        view.setBackgroundDrawable(background(Color.rgb(40, 46, 54), dp(a, 6)));
        int iconSize = dp(a, 16);
        icon.setBounds(0, 0, iconSize, iconSize);
        view.setCompoundDrawables(icon, null, null, null);
        view.setOnClickListener(listener);
        return view;
    }

    private static void addButtonRow(Activity a, LinearLayout card, Button left, Button right) {
        LinearLayout row = new LinearLayout(a);
        row.setOrientation(LinearLayout.HORIZONTAL);
        LinearLayout.LayoutParams cell = new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f);
        cell.setMargins(0, dp(a, 2), 0, dp(a, 2));
        if (left != null) {
            row.addView(left, cell);
        }
        if (right != null) {
            row.addView(right, cell);
        }
        card.addView(row, fill());
    }

    private static void showDonateDialog(final Activity a) {
        ModDebugLog.module("launcher", "donate modal opened address=" + DONATE_SOLANA_ADDRESS);
        LinearLayout content = new LinearLayout(a);
        content.setOrientation(LinearLayout.VERTICAL);
        content.setPadding(dp(a, 16), dp(a, 12), dp(a, 16), dp(a, 4));

        TextView title = label(a, "Fuel the development", 16, Color.rgb(255, 128, 0));
        title.setPadding(0, 0, 0, dp(a, 4));
        content.addView(title);

        TextView lead = label(a,
                "Scan the QR or copy the wallet to support the mod.",
                11, Color.rgb(170, 178, 185));
        lead.setPadding(0, 0, 0, dp(a, 8));
        content.addView(lead);

        TextView walletLabel = label(a, "Solana (SOL) wallet", 12, Color.WHITE);
        walletLabel.setPadding(0, 0, 0, dp(a, 2));
        content.addView(walletLabel);

        TextView address = label(a, DONATE_SOLANA_ADDRESS, 9, Color.rgb(210, 216, 222));
        address.setTypeface(Typeface.MONOSPACE);
        if (Build.VERSION.SDK_INT >= 16) {
            address.setTextIsSelectable(true);
        }
        address.setPadding(0, 0, 0, dp(a, 6));
        content.addView(address);

        final TextView copyStatus = label(a, "", 10, Color.rgb(120, 220, 140));
        copyStatus.setPadding(0, 0, 0, dp(a, 4));
        copyStatus.setVisibility(View.GONE);
        content.addView(copyStatus);

        Button copy = button(a, "Copy address");
        copy.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                try {
                    ClipboardManager clipboard = (ClipboardManager) a.getSystemService(
                            Context.CLIPBOARD_SERVICE);
                    clipboard.setPrimaryClip(ClipData.newPlainText(
                            "Solana wallet", DONATE_SOLANA_ADDRESS));
                    ModDebugLog.module("launcher", "donate address copied");
                    copyStatus.setText("Value copied!");
                    copyStatus.setVisibility(View.VISIBLE);
                } catch (Throwable error) {
                    ModDebugLog.module("launcher", "donate address copy failed", error);
                    Toast.makeText(a, DONATE_SOLANA_ADDRESS, Toast.LENGTH_LONG).show();
                }
            }
        });
        content.addView(copy, fill());

        FrameLayout qrWrap = new FrameLayout(a);
        qrWrap.setBackgroundDrawable(background(Color.WHITE, dp(a, 8)));
        qrWrap.setPadding(dp(a, 12), dp(a, 12), dp(a, 12), dp(a, 12));
        ImageView qr = new ImageView(a);
        int qrPx = dp(a, 220);
        qr.setImageBitmap(QrCodeEncoder.encode(DONATE_SOLANA_ADDRESS, qrPx));
        qr.setAdjustViewBounds(true);
        qrWrap.addView(qr, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT,
                Gravity.CENTER));
        LinearLayout.LayoutParams qrLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        qrLp.gravity = Gravity.CENTER_HORIZONTAL;
        qrLp.topMargin = dp(a, 8);
        content.addView(qrWrap, qrLp);

        new AlertDialog.Builder(a)
                .setView(content)
                .setPositiveButton("Done", null)
                .show();
    }

    private static TextView sectionHeader(Context c, String text) {
        TextView view = label(c, text.toUpperCase(java.util.Locale.US), 11,
                Color.rgb(255, 152, 64));
        view.setTypeface(view.getTypeface(), android.graphics.Typeface.BOLD);
        if (android.os.Build.VERSION.SDK_INT >= 21) {
            view.setLetterSpacing(0.08f);
        }
        view.setPadding(0, 0, 0, dp(c, 6));
        return view;
    }

    /** Rounded section container: gives the menu its card-based modern look. */
    private static LinearLayout subCard(Context c) {
        LinearLayout box = new LinearLayout(c);
        box.setOrientation(LinearLayout.VERTICAL);
        box.setPadding(dp(c, 12), dp(c, 10), dp(c, 12), dp(c, 10));
        box.setBackgroundDrawable(background(Color.rgb(28, 33, 41), dp(c, 12)));
        return box;
    }

    private static void addSubCard(Context c, LinearLayout parent, LinearLayout box) {
        LinearLayout.LayoutParams lp = fill();
        lp.topMargin = dp(c, 8);
        parent.addView(box, lp);
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

    /** Active replay camera mode (native replay_camera::MODE_*); defaults to Orbit. */
    public static int replayCameraMode(Context c) {
        int mode = prefs(c).getInt(K_REPLAY_CAMERA_MODE, REPLAY_CAMERA_MODE_FIRST);
        int last = REPLAY_CAMERA_MODE_FIRST + REPLAY_CAMERA_MODE_NAMES.length - 1;
        return (mode >= REPLAY_CAMERA_MODE_FIRST && mode <= last)
                ? mode
                : REPLAY_CAMERA_MODE_FIRST;
    }

    public static boolean replaySwarmEnabled(Context c) {
        applyMenuDefaults(c);
        // Default ON: the picker is inert until ghosts are actually selected,
        // so there is no cost, and OFF made the feature undiscoverable.
        return prefs(c).getBoolean(K_REPLAY_SWARM, true);
    }

    public static boolean raceSwarmEnabled(Context c) {
        return prefs(c).getBoolean(K_RACE_SWARM, false);
    }

    /** Test-harness setter (automation launch extra). */
    public static void setReplaySwarmEnabled(Context c, boolean enabled) {
        prefs(c).edit().putBoolean(K_REPLAY_SWARM, enabled).apply();
    }

    public static void setRaceSwarmEnabled(Context c, boolean enabled) {
        prefs(c).edit().putBoolean(K_RACE_SWARM, enabled).apply();
    }

    /** Harness-only: auto-apply every catalog replay as a ghost in the viewer. */
    public static boolean swarmAutoApplyEnabled(Context c) {
        return prefs(c).getBoolean("swarm_autoapply", false);
    }

    public static void setSwarmAutoApply(Context c, boolean enabled) {
        prefs(c).edit().putBoolean("swarm_autoapply", enabled).apply();
    }

    /** Ghost pack: relative replay paths auto-loaded at every level start. */
    public static String[] ghostPackPaths(Context c) {
        String joined = prefs(c).getString("ghost_pack_paths", "");
        if (joined == null || joined.length() == 0) {
            return new String[0];
        }
        return joined.split("\n");
    }

    public static void setGhostPackPaths(Context c, java.util.List<String> paths) {
        StringBuilder joined = new StringBuilder();
        int kept = 0;
        for (String path : paths) {
            if (path == null || path.length() == 0 || kept >= 7) {
                continue;
            }
            if (joined.length() > 0) joined.append('\n');
            joined.append(path);
            kept++;
        }
        prefs(c).edit().putString("ghost_pack_paths", joined.toString()).apply();
    }

    /** Orbit camera stand-off radius in world units. */
    public static int orbitRadius(Context c) {
        return clamp(prefs(c).getInt(K_ORBIT_RADIUS, DEFAULT_ORBIT_RADIUS), 4, 40);
    }

    /** Orbit rotation speed in degrees per second. */
    public static int orbitSpeed(Context c) {
        return clamp(prefs(c).getInt(K_ORBIT_SPEED, DEFAULT_ORBIT_SPEED), 5, 180);
    }

    /** Orbit camera height as an elevation angle above the car, degrees. */
    public static int orbitHeight(Context c) {
        return clamp(prefs(c).getInt(K_ORBIT_HEIGHT, DEFAULT_ORBIT_HEIGHT), 10, 80);
    }

    /** Trackside side selection: 0 alternate, 1 left, 2 right. */
    public static int tracksideSideMode(Context c) {
        return clamp(prefs(c).getInt(K_TRACKSIDE_SIDE_MODE, 0), 0, 2);
    }

    public static int tracksideSideDist(Context c) {
        return clamp(prefs(c).getInt(K_TRACKSIDE_SIDE_DIST, DEFAULT_TRACKSIDE_SIDE_DIST), 2, 40);
    }

    public static int tracksideHeight(Context c) {
        return clamp(prefs(c).getInt(K_TRACKSIDE_HEIGHT, DEFAULT_TRACKSIDE_HEIGHT), 1, 40);
    }

    /** Distance ahead of the car a fresh trackside camera is placed (min distance). */
    public static int tracksideMinDist(Context c) {
        return clamp(prefs(c).getInt(K_TRACKSIDE_MIN_DIST, DEFAULT_TRACKSIDE_MIN_DIST), 10, 150);
    }

    /** Distance from the camera that triggers the cut to the next one (max distance). */
    public static int tracksideMaxDist(Context c) {
        int min = tracksideMinDist(c);
        int max = clamp(prefs(c).getInt(K_TRACKSIDE_MAX_DIST, DEFAULT_TRACKSIDE_MAX_DIST), 20, 300);
        return Math.max(max, min + 10);
    }

    public static boolean cameraCycleEnabled(Context c) {
        return prefs(c).getBoolean(K_CAMERA_CYCLE, false);
    }

    public static int cameraCycleSeconds(Context c) {
        return clamp(prefs(c).getInt(K_CAMERA_CYCLE_SECONDS, DEFAULT_CAMERA_CYCLE_SECONDS), 3, 60);
    }

    /** Replay paths remembered for the swarm picker (newline-separated pref). */
    public static String[] swarmCatalogPaths(Context c) {
        String joined = prefs(c).getString(K_SWARM_CATALOG, "");
        if (joined == null || joined.length() == 0) {
            return new String[0];
        }
        return joined.split("\n");
    }

    /** Merge newly seen replay paths into the persisted swarm catalog. */
    public static void rememberSwarmCatalogPaths(Context c, java.util.List<String> paths) {
        java.util.LinkedHashSet<String> merged = new java.util.LinkedHashSet<String>();
        for (String existing : swarmCatalogPaths(c)) {
            if (existing.length() > 0) merged.add(existing);
        }
        boolean changed = false;
        for (String path : paths) {
            if (path != null && path.length() > 0 && merged.size() < SWARM_CATALOG_MAX
                    && merged.add(path)) {
                changed = true;
            }
        }
        if (!changed) {
            return;
        }
        StringBuilder joined = new StringBuilder();
        for (String path : merged) {
            if (joined.length() > 0) joined.append('\n');
            joined.append(path);
        }
        prefs(c).edit().putString(K_SWARM_CATALOG, joined.toString()).apply();
        ModDebugLog.module("swarm", "catalog persisted count=" + merged.size());
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
            root.setPadding(dp(a, 12), dp(a, 10), dp(a, 12), dp(a, 10));

            TextView title = label(a, DISPLAY_NAME, 20, Color.rgb(255, 128, 0));
            title.setGravity(Gravity.CENTER);
            title.setPadding(0, 0, 0, dp(a, 2));
            root.addView(title);

            TextView version = label(a, buildSummary(a), 10, Color.rgb(210, 216, 222));
            version.setGravity(Gravity.CENTER);
            version.setPadding(0, 0, 0, dp(a, 2));
            root.addView(version);

            TextView subtitle = label(a,
                    "Updates, custom liveries, and replay tools before launch.",
                    10, Color.rgb(170, 178, 185));
            subtitle.setGravity(Gravity.CENTER);
            subtitle.setPadding(0, 0, 0, dp(a, 6));
            root.addView(subtitle);

            LinearLayout links = new LinearLayout(a);
            links.setOrientation(LinearLayout.HORIZONTAL);
            links.setGravity(Gravity.CENTER);
            links.setPadding(0, 0, 0, dp(a, 6));
            LinearLayout.LayoutParams iconLp = new LinearLayout.LayoutParams(
                    dp(a, 42), dp(a, 42));
            iconLp.setMargins(dp(a, 5), 0, dp(a, 5), 0);
            int githubBg = Color.rgb(36, 41, 46);
            int discordBg = Color.rgb(88, 101, 242);
            int donateBg = Color.rgb(20, 25, 35);
            links.addView(iconLinkButton(a, githubBg,
                    new GitHubIconDrawable(Color.WHITE, githubBg), "GitHub",
                    new View.OnClickListener() {
                        public void onClick(View v) {
                            try {
                                ModDebugLog.module("launcher", "open link url=" + REPO_URL);
                                a.startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(REPO_URL)));
                            } catch (Throwable error) {
                                ModDebugLog.module("launcher", "open link failed url=" + REPO_URL, error);
                                Toast.makeText(a, REPO_URL, Toast.LENGTH_LONG).show();
                            }
                        }
                    }), iconLp);
            links.addView(iconLinkButton(a, donateBg, new SolanaDonateIconDrawable(),
                    "Donate", new View.OnClickListener() {
                        public void onClick(View v) {
                            ModDebugLog.module("launcher", "donate icon clicked");
                            showDonateDialog(a);
                        }
                    }), iconLp);
            links.addView(iconLinkButton(a, discordBg,
                    new DiscordIconDrawable(Color.WHITE, discordBg), "Discord",
                    new View.OnClickListener() {
                        public void onClick(View v) {
                            try {
                                ModDebugLog.module("launcher", "open link url=" + DISCORD_URL);
                                a.startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(DISCORD_URL)));
                            } catch (Throwable error) {
                                ModDebugLog.module("launcher", "open link failed url=" + DISCORD_URL, error);
                                Toast.makeText(a, DISCORD_URL, Toast.LENGTH_LONG).show();
                            }
                        }
                    }), iconLp);
            root.addView(links);

            ScrollView scroll = new ScrollView(a);
            scroll.setFillViewport(true);
            LinearLayout card = new LinearLayout(a);
            card.setOrientation(LinearLayout.VERTICAL);
            card.setPadding(dp(a, 2), 0, dp(a, 2), dp(a, 8));

            LinearLayout toolsCard = subCard(a);
            addSubCard(a, card, toolsCard);
            toolsCard.addView(sectionHeader(a, "Mod tools"));

            Button liveries = button(a, "Custom liveries");
            liveries.setOnClickListener(new View.OnClickListener() {
                public void onClick(View v) {
                    ModDebugLog.module("launcher", "custom livery editor clicked");
                    showLiveryManager(a);
                }
            });
            Button updates = button(a, "Check updates");
            updates.setOnClickListener(new View.OnClickListener() {
                public void onClick(View v) {
                    ModDebugLog.module("launcher", "manual update check clicked");
                    UpdateManager.checkNow(a);
                }
            });
            addButtonRow(a, toolsCard, liveries, updates);

            TextView coreNote = label(a,
                    "Always on: purchase compatibility, expanded checkpoints, blue flame ID.",
                    9, Color.rgb(150, 158, 165));
            coreNote.setPadding(0, dp(a, 4), 0, dp(a, 2));
            toolsCard.addView(coreNote);

            LinearLayout cameraCard = subCard(a);
            addSubCard(a, card, cameraCard);
            cameraCard.addView(sectionHeader(a, "Replay camera"));
            addCheckBox(a, cameraCard,
                    "Enable gesture free camera during replays",
                    K_REPLAY_FREE_CAMERA, true);

            TextView cameraModeLabel = label(a, "Camera mode", 11, Color.rgb(210, 216, 222));
            cameraModeLabel.setPadding(0, dp(a, 4), 0, 0);
            cameraCard.addView(cameraModeLabel, fill());
            final Spinner cameraMode = new Spinner(a);
            ArrayAdapter<String> cameraModeAdapter = new ArrayAdapter<String>(a,
                    android.R.layout.simple_spinner_item, REPLAY_CAMERA_MODE_NAMES);
            cameraModeAdapter.setDropDownViewResource(
                    android.R.layout.simple_spinner_dropdown_item);
            cameraMode.setAdapter(cameraModeAdapter);
            cameraMode.setSelection(replayCameraMode(a) - REPLAY_CAMERA_MODE_FIRST);

            // Per-mode parameter groups; only the group for the selected mode is
            // shown so the menu never displays irrelevant options.
            final Runnable applyOrbitTuning = new Runnable() {
                public void run() {
                    try {
                        RequiredPatches.setReplayOrbitTuning(
                                orbitRadius(a), orbitSpeed(a), orbitHeight(a));
                    } catch (Throwable ignored) {
                    }
                }
            };
            final LinearLayout orbitParams = new LinearLayout(a);
            orbitParams.setOrientation(LinearLayout.VERTICAL);
            orbitParams.setPadding(dp(a, 12), 0, 0, 0);
            addSeek(a, orbitParams, "Orbit radius", K_ORBIT_RADIUS,
                    DEFAULT_ORBIT_RADIUS, 4, 40, " units", applyOrbitTuning);
            addSeek(a, orbitParams, "Rotation speed", K_ORBIT_SPEED,
                    DEFAULT_ORBIT_SPEED, 5, 180, " deg/s", applyOrbitTuning);
            addSeek(a, orbitParams, "Camera height", K_ORBIT_HEIGHT,
                    DEFAULT_ORBIT_HEIGHT, 10, 80, " deg", applyOrbitTuning);

            final Runnable applyTracksideTuning = new Runnable() {
                public void run() {
                    try {
                        RequiredPatches.setReplayTracksideTuning(tracksideSideMode(a),
                                tracksideSideDist(a), tracksideHeight(a),
                                tracksideMinDist(a), tracksideMaxDist(a));
                    } catch (Throwable ignored) {
                    }
                }
            };
            final LinearLayout tracksideParams = new LinearLayout(a);
            tracksideParams.setOrientation(LinearLayout.VERTICAL);
            tracksideParams.setPadding(dp(a, 12), 0, 0, 0);
            TextView sideLabel = label(a, "Camera side", 11, Color.rgb(210, 216, 222));
            sideLabel.setPadding(0, dp(a, 4), 0, 0);
            tracksideParams.addView(sideLabel, fill());
            final Spinner sideMode = new Spinner(a);
            ArrayAdapter<String> sideAdapter = new ArrayAdapter<String>(a,
                    android.R.layout.simple_spinner_item, TRACKSIDE_SIDE_NAMES);
            sideAdapter.setDropDownViewResource(
                    android.R.layout.simple_spinner_dropdown_item);
            sideMode.setAdapter(sideAdapter);
            sideMode.setSelection(tracksideSideMode(a));
            sideMode.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
                public void onItemSelected(AdapterView<?> parent, View view, int position,
                                           long id) {
                    prefs(a).edit().putInt(K_TRACKSIDE_SIDE_MODE, position).apply();
                    applyTracksideTuning.run();
                }

                public void onNothingSelected(AdapterView<?> parent) {
                }
            });
            tracksideParams.addView(sideMode, fill());
            addSeek(a, tracksideParams, "Distance from track", K_TRACKSIDE_SIDE_DIST,
                    DEFAULT_TRACKSIDE_SIDE_DIST, 2, 40, " units", applyTracksideTuning);
            addSeek(a, tracksideParams, "Height above track", K_TRACKSIDE_HEIGHT,
                    DEFAULT_TRACKSIDE_HEIGHT, 1, 40, " units", applyTracksideTuning);
            addSeek(a, tracksideParams, "Camera placed ahead (min distance)",
                    K_TRACKSIDE_MIN_DIST, DEFAULT_TRACKSIDE_MIN_DIST, 10, 150, " units",
                    applyTracksideTuning);
            addSeek(a, tracksideParams, "Switch to next camera at (max distance)",
                    K_TRACKSIDE_MAX_DIST, DEFAULT_TRACKSIDE_MAX_DIST, 20, 300, " units",
                    applyTracksideTuning);

            final TextView noParamsNote = label(a,
                    "No extra settings for this mode. Drag to change the view, pinch to zoom.",
                    9, Color.rgb(150, 158, 165));
            noParamsNote.setPadding(dp(a, 12), dp(a, 4), 0, 0);

            cameraMode.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
                public void onItemSelected(AdapterView<?> parent, View view, int position,
                                           long id) {
                    int mode = position + REPLAY_CAMERA_MODE_FIRST;
                    prefs(a).edit().putInt(K_REPLAY_CAMERA_MODE, mode).apply();
                    boolean orbit = mode == REPLAY_CAMERA_MODE_FIRST;
                    boolean trackside = position == REPLAY_CAMERA_MODE_NAMES.length - 1;
                    orbitParams.setVisibility(orbit ? View.VISIBLE : View.GONE);
                    tracksideParams.setVisibility(trackside ? View.VISIBLE : View.GONE);
                    noParamsNote.setVisibility(orbit || trackside ? View.GONE : View.VISIBLE);
                    // Apply live if the native lib is loaded; install-time apply covers
                    // the cold-start case.
                    try {
                        RequiredPatches.setReplayCameraMode(mode);
                    } catch (Throwable ignored) {
                    }
                }

                public void onNothingSelected(AdapterView<?> parent) {
                }
            });
            cameraCard.addView(cameraMode, fill());
            cameraCard.addView(orbitParams, fill());
            cameraCard.addView(tracksideParams, fill());
            cameraCard.addView(noParamsNote, fill());
            int initialMode = replayCameraMode(a);
            boolean initOrbit = initialMode == REPLAY_CAMERA_MODE_FIRST;
            boolean initTrackside = initialMode
                    == REPLAY_CAMERA_MODE_FIRST + REPLAY_CAMERA_MODE_NAMES.length - 1;
            orbitParams.setVisibility(initOrbit ? View.VISIBLE : View.GONE);
            tracksideParams.setVisibility(initTrackside ? View.VISIBLE : View.GONE);
            noParamsNote.setVisibility(initOrbit || initTrackside ? View.GONE : View.VISIBLE);

            final LinearLayout cycleParams = new LinearLayout(a);
            cycleParams.setOrientation(LinearLayout.VERTICAL);
            cycleParams.setPadding(dp(a, 12), 0, 0, 0);
            final Runnable applyCycle = new Runnable() {
                public void run() {
                    cycleParams.setVisibility(
                            cameraCycleEnabled(a) ? View.VISIBLE : View.GONE);
                    try {
                        RequiredPatches.setReplayCameraCycle(
                                cameraCycleEnabled(a), cameraCycleSeconds(a));
                    } catch (Throwable ignored) {
                    }
                }
            };
            addCheckBox(a, cameraCard,
                    "Auto-cycle camera modes during a replay",
                    K_CAMERA_CYCLE, false, applyCycle);
            addSeek(a, cycleParams, "Seconds per camera mode", K_CAMERA_CYCLE_SECONDS,
                    DEFAULT_CAMERA_CYCLE_SECONDS, 3, 60, " s", applyCycle);
            cycleParams.setVisibility(cameraCycleEnabled(a) ? View.VISIBLE : View.GONE);
            cameraCard.addView(cycleParams, fill());

            LinearLayout swarmCard = subCard(a);
            addSubCard(a, card, swarmCard);
            swarmCard.addView(sectionHeader(a, "Replay swarm"));
            TextView swarmHelp = label(a,
                    "Watch or race several replays at once. Saved replays are found "
                            + "automatically. In game: open View Replay on a level, tap the "
                            + "SWARM button (top right), tick ghost replays, Apply.",
                    9, Color.rgb(170, 178, 185));
            swarmHelp.setPadding(0, 0, 0, dp(a, 2));
            swarmCard.addView(swarmHelp);
            final LinearLayout swarmExtras = new LinearLayout(a);
            swarmExtras.setOrientation(LinearLayout.VERTICAL);
            swarmExtras.setPadding(dp(a, 12), 0, 0, 0);
            addCheckBox(a, swarmCard,
                    "Enable replay swarm picker during passive replays",
                    K_REPLAY_SWARM, true, new Runnable() {
                        public void run() {
                            swarmExtras.setVisibility(
                                    replaySwarmEnabled(a) ? View.VISIBLE : View.GONE);
                        }
                    });
            addCheckBox(a, swarmExtras,
                    "Race against the selected swarm ghosts",
                    K_RACE_SWARM, false, new Runnable() {
                        public void run() {
                            try {
                                RequiredPatches.setReplayRaceSwarmEnabled(raceSwarmEnabled(a));
                            } catch (Throwable ignored) {
                            }
                        }
                    });
            swarmExtras.setVisibility(replaySwarmEnabled(a) ? View.VISIBLE : View.GONE);
            swarmCard.addView(swarmExtras, fill());

            TextView packHelp = label(a,
                    "Ghost pack: every finished race is archived automatically. Pick up "
                            + "to 7 archived replays; they ride along as coloured ghost "
                            + "cars in every replay AND every race.",
                    9, Color.rgb(170, 178, 185));
            packHelp.setPadding(0, dp(a, 6), 0, dp(a, 2));
            swarmCard.addView(packHelp);
            final Button packButton = button(a,
                    "Choose ghost pack (" + ghostPackPaths(a).length + " selected)");
            packButton.setOnClickListener(new View.OnClickListener() {
                public void onClick(View v) {
                    showGhostPackPicker(a, packButton);
                }
            });
            swarmCard.addView(packButton, fill());

            LinearLayout splitCard = subCard(a);
            addSubCard(a, card, splitCard);
            LinearLayout splitHeaderRow = new LinearLayout(a);
            splitHeaderRow.setOrientation(LinearLayout.HORIZONTAL);
            splitHeaderRow.setGravity(Gravity.CENTER_VERTICAL);
            TextView splitHeader = sectionHeader(a, "Replay split HUD");
            splitHeaderRow.addView(splitHeader, new LinearLayout.LayoutParams(
                    0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f));

            final LinearLayout displaySliders = new LinearLayout(a);
            displaySliders.setOrientation(LinearLayout.VERTICAL);
            displaySliders.setPadding(dp(a, 12), 0, 0, 0);
            displaySliders.setVisibility(View.GONE);
            addSeek(a, displaySliders, "Text transparency", K_SPLIT_ALPHA,
                    DEFAULT_SPLIT_ALPHA, 10, 100, "%");
            addSeek(a, displaySliders, "Horizontal position", K_SPLIT_X,
                    DEFAULT_SPLIT_X, 0, 360, " dp");
            addSeek(a, displaySliders, "Vertical position", K_SPLIT_Y,
                    DEFAULT_SPLIT_Y, 0, 180, " dp");

            final Button displayToggle = miniIconButton(a,
                    new DisplayIconDrawable(Color.rgb(210, 216, 222)),
                    "Show display position sliders",
                    new View.OnClickListener() {
                        public void onClick(View v) {
                            boolean show = displaySliders.getVisibility() != View.VISIBLE;
                            displaySliders.setVisibility(show ? View.VISIBLE : View.GONE);
                            ModDebugLog.module("launcher", "split display sliders toggled visible="
                                    + show);
                        }
                    });
            splitHeaderRow.addView(displayToggle, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT));
            splitCard.addView(splitHeaderRow, fill());

            TextView splitHelp = label(a,
                    "Compares your run with the saved replay ghost when timing is available.",
                    9, Color.rgb(170, 178, 185));
            splitHelp.setPadding(0, 0, 0, dp(a, 2));
            splitCard.addView(splitHelp);

            final LinearLayout splitOptions = new LinearLayout(a);
            splitOptions.setOrientation(LinearLayout.VERTICAL);
            splitOptions.setPadding(dp(a, 12), 0, 0, 0);

            addCheckBox(a, splitCard,
                    "Enable checkpoint/sector deltas vs saved replay ghost",
                    K_CHECKPOINT_SPLITS, true, new Runnable() {
                        public void run() {
                            updateSplitOptionsVisibility(a, splitOptions, displaySliders,
                                    displayToggle);
                        }
                    });

            addCheckBox(a, splitOptions,
                    "Show consecutive splits as an on-screen list",
                    K_SPLIT_LIST, true);
            addCheckBox(a, splitOptions,
                    "Use sector deltas instead of checkpoint deltas",
                    K_SPLIT_SECTOR_DELTA, false);

            updateSplitOptionsVisibility(a, splitOptions, displaySliders, displayToggle);
            splitCard.addView(splitOptions, fill());
            splitCard.addView(displaySliders, fill());

            scroll.addView(card, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT));
            root.addView(scroll, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, 0, 1.0f));

            Button play = button(a, "Start game");
            play.setTextSize(14.0f);
            play.setTextColor(Color.BLACK);
            play.setBackgroundDrawable(background(Color.rgb(255, 128, 0), dp(a, 8)));
            play.setPadding(dp(a, 16), dp(a, 10), dp(a, 16), dp(a, 10));
            LinearLayout.LayoutParams playLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            playLp.topMargin = dp(a, 8);
            play.setOnClickListener(new View.OnClickListener() {
                public void onClick(View v) {
                    ModDebugLog.module("launcher", "play button invoking onPlay");
                    onPlay.run();
                }
            });
            root.addView(play, playLp);

            LinearLayout footer = new LinearLayout(a);
            footer.setGravity(Gravity.CENTER);
            footer.setPadding(0, dp(a, 4), 0, 0);
            footer.addView(miniIconButton(a,
                    new BugIconDrawable(Color.rgb(180, 188, 195)),
                    "Upload debug logs",
                    new View.OnClickListener() {
                        public void onClick(View v) {
                            ModDebugLog.module("launcher", "upload debug logs clicked");
                            DebugLogExporter.uploadNow(a);
                        }
                    }), new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT));
            root.addView(footer);

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
        checkBox.setPadding(0, dp(c, 2), 0, 0);
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

    /** Multi-select dialog over the archived replay library (ghost pack). */
    private static void showGhostPackPicker(final Activity a, final Button packButton) {
        try {
            RequiredPatches.archiveNewSlotReplays(a);
        } catch (Throwable ignored) {
        }
        final java.util.List<java.io.File> library = RequiredPatches.swarmLibraryFiles(a);
        if (library.isEmpty()) {
            new AlertDialog.Builder(a)
                    .setTitle("No archived replays yet")
                    .setMessage("Finish a race first - every finished race is archived "
                            + "automatically and shows up here.")
                    .setPositiveButton("OK", null)
                    .show();
            return;
        }
        final java.util.HashSet<String> selected =
                new java.util.HashSet<String>(java.util.Arrays.asList(ghostPackPaths(a)));
        final String[] labels = new String[library.size()];
        final boolean[] checks = new boolean[library.size()];
        java.text.SimpleDateFormat fmt =
                new java.text.SimpleDateFormat("d MMM HH:mm", java.util.Locale.US);
        for (int i = 0; i < library.size(); i++) {
            java.io.File file = library.get(i);
            String slot = file.getName().length() >= 3
                    ? file.getName().substring(1, 3) : "??";
            labels[i] = "Level slot " + slot + " - " + fmt.format(
                    new java.util.Date(file.lastModified()));
            checks[i] = selected.contains("swarm_replays/" + file.getName());
        }
        new AlertDialog.Builder(a)
                .setTitle("Ghost pack (max 7)")
                .setMultiChoiceItems(labels, checks,
                        new android.content.DialogInterface.OnMultiChoiceClickListener() {
                            public void onClick(android.content.DialogInterface d,
                                                int which, boolean isChecked) {
                                checks[which] = isChecked;
                            }
                        })
                .setNegativeButton("Cancel", null)
                .setNeutralButton("Clear", new android.content.DialogInterface.OnClickListener() {
                    public void onClick(android.content.DialogInterface d, int which) {
                        setGhostPackPaths(a, new java.util.ArrayList<String>());
                        try {
                            RequiredPatches.applyGhostPack(a);
                        } catch (Throwable ignored) {
                        }
                        packButton.setText("Choose ghost pack (0 selected)");
                    }
                })
                .setPositiveButton("Save", new android.content.DialogInterface.OnClickListener() {
                    public void onClick(android.content.DialogInterface d, int which) {
                        java.util.ArrayList<String> picked = new java.util.ArrayList<String>();
                        for (int i = 0; i < checks.length; i++) {
                            if (checks[i]) {
                                picked.add("swarm_replays/" + library.get(i).getName());
                            }
                        }
                        setGhostPackPaths(a, picked);
                        try {
                            RequiredPatches.applyGhostPack(a);
                        } catch (Throwable ignored) {
                        }
                        int count = ghostPackPaths(a).length;
                        packButton.setText("Choose ghost pack (" + count + " selected)");
                        if (picked.size() > 7) {
                            Toast.makeText(a, "Only the first 7 picks are used.",
                                    Toast.LENGTH_LONG).show();
                        }
                    }
                })
                .show();
    }

    private static void updateSplitOptionsVisibility(Context c, View content,
                                                     View displaySliders, View displayToggle) {
        applyMenuDefaults(c);
        boolean enabled = prefs(c).getBoolean(K_CHECKPOINT_SPLITS, true);
        content.setVisibility(enabled ? View.VISIBLE : View.GONE);
        if (displayToggle != null) {
            displayToggle.setVisibility(enabled ? View.VISIBLE : View.GONE);
        }
        if (!enabled && displaySliders != null) {
            displaySliders.setVisibility(View.GONE);
        }
    }

    private static LinearLayout addSeek(final Context c, LinearLayout card, String label,
                                        final String key, int defaultValue, final int min,
                                        int max, final String suffix) {
        return addSeek(c, card, label, key, defaultValue, min, max, suffix, null);
    }

    private static LinearLayout addSeek(final Context c, LinearLayout card, String label,
                                        final String key, int defaultValue, final int min,
                                        int max, final String suffix,
                                        final Runnable afterChange) {
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
                if (afterChange != null) {
                    afterChange.run();
                }
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
            float s = size / 24.0f;

            // GitHub mark: round head, cat ears, and lower tentacles (Simple Icons proportions).
            path.reset();
            path.moveTo(x + 12.0f * s, y + 2.2f * s);
            path.cubicTo(x + 8.0f * s, y + 2.2f * s, x + 4.8f * s, y + 4.5f * s,
                    x + 3.8f * s, y + 8.0f * s);
            path.cubicTo(x + 2.0f * s, y + 8.3f * s, x + 0.8f * s, y + 9.0f * s,
                    x + 0.5f * s, y + 10.0f * s);
            path.cubicTo(x + 0.5f * s, y + 12.5f * s, x + 2.5f * s, y + 14.8f * s,
                    x + 5.2f * s, y + 15.0f * s);
            path.cubicTo(x + 5.8f * s, y + 16.0f * s, x + 6.8f * s, y + 17.0f * s,
                    x + 8.2f * s, y + 17.5f * s);
            path.cubicTo(x + 7.8f * s, y + 18.2f * s, x + 7.0f * s, y + 19.0f * s,
                    x + 6.0f * s, y + 19.5f * s);
            path.cubicTo(x + 7.5f * s, y + 19.8f * s, x + 9.0f * s, y + 19.2f * s,
                    x + 10.2f * s, y + 18.5f * s);
            path.cubicTo(x + 11.0f * s, y + 18.7f * s, x + 11.8f * s, y + 18.8f * s,
                    x + 12.0f * s, y + 18.8f * s);
            path.cubicTo(x + 12.2f * s, y + 18.8f * s, x + 13.0f * s, y + 18.7f * s,
                    x + 13.8f * s, y + 18.5f * s);
            path.cubicTo(x + 15.0f * s, y + 19.2f * s, x + 16.5f * s, y + 19.8f * s,
                    x + 18.0f * s, y + 19.5f * s);
            path.cubicTo(x + 17.0f * s, y + 19.0f * s, x + 16.2f * s, y + 18.2f * s,
                    x + 15.8f * s, y + 17.5f * s);
            path.cubicTo(x + 17.2f * s, y + 17.0f * s, x + 18.2f * s, y + 16.0f * s,
                    x + 18.8f * s, y + 15.0f * s);
            path.cubicTo(x + 21.5f * s, y + 14.8f * s, x + 23.5f * s, y + 12.5f * s,
                    x + 23.5f * s, y + 10.0f * s);
            path.cubicTo(x + 23.2f * s, y + 9.0f * s, x + 22.0f * s, y + 8.3f * s,
                    x + 20.2f * s, y + 8.0f * s);
            path.cubicTo(x + 19.2f * s, y + 4.5f * s, x + 16.0f * s, y + 2.2f * s,
                    x + 12.0f * s, y + 2.2f * s);
            path.close();
            canvas.drawPath(path, paint);

            path.reset();
            path.moveTo(x + 7.5f * s, y + 1.0f * s);
            path.lineTo(x + 5.0f * s, y + 4.5f * s);
            path.lineTo(x + 8.5f * s, y + 5.5f * s);
            path.close();
            canvas.drawPath(path, paint);

            path.reset();
            path.moveTo(x + 16.5f * s, y + 1.0f * s);
            path.lineTo(x + 19.0f * s, y + 4.5f * s);
            path.lineTo(x + 15.5f * s, y + 5.5f * s);
            path.close();
            canvas.drawPath(path, paint);
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
            float s = size / 24.0f;

            // Discord Clyde: wide rounded controller shape with eye cutouts.
            path.reset();
            path.moveTo(x + 4.0f * s, y + 6.5f * s);
            path.cubicTo(x + 4.0f * s, y + 4.0f * s, x + 6.5f * s, y + 2.5f * s,
                    x + 9.0f * s, y + 2.5f * s);
            path.cubicTo(x + 10.0f * s, y + 1.5f * s, x + 11.5f * s, y + 1.0f * s,
                    x + 12.0f * s, y + 1.0f * s);
            path.cubicTo(x + 12.5f * s, y + 1.0f * s, x + 14.0f * s, y + 1.5f * s,
                    x + 15.0f * s, y + 2.5f * s);
            path.cubicTo(x + 17.5f * s, y + 2.5f * s, x + 20.0f * s, y + 4.0f * s,
                    x + 20.0f * s, y + 6.5f * s);
            path.cubicTo(x + 21.0f * s, y + 8.5f * s, x + 21.5f * s, y + 10.5f * s,
                    x + 21.0f * s, y + 12.5f * s);
            path.cubicTo(x + 19.5f * s, y + 13.5f * s, x + 18.0f * s, y + 14.0f * s,
                    x + 16.5f * s, y + 13.5f * s);
            path.lineTo(x + 15.0f * s, y + 15.0f * s);
            path.lineTo(x + 13.5f * s, y + 13.8f * s);
            path.cubicTo(x + 12.9f * s, y + 14.0f * s, x + 12.0f * s, y + 14.0f * s,
                    x + 11.1f * s, y + 13.8f * s);
            path.lineTo(x + 9.6f * s, y + 15.0f * s);
            path.lineTo(x + 8.1f * s, y + 13.5f * s);
            path.cubicTo(x + 6.6f * s, y + 14.0f * s, x + 5.1f * s, y + 13.5f * s,
                    x + 3.6f * s, y + 12.5f * s);
            path.cubicTo(x + 3.1f * s, y + 10.5f * s, x + 3.6f * s, y + 8.5f * s,
                    x + 4.0f * s, y + 6.5f * s);
            path.close();
            canvas.drawPath(path, paint);
            canvas.drawCircle(x + 8.8f * s, y + 9.0f * s, 1.6f * s, cutout);
            canvas.drawCircle(x + 15.2f * s, y + 9.0f * s, 1.6f * s, cutout);
        }
    }

    private static class SolanaDonateIconDrawable extends Drawable {
        private final Paint bar1 = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint bar2 = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint bar3 = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path path = new Path();

        SolanaDonateIconDrawable() {
            bar1.setStyle(Paint.Style.FILL);
            bar1.setColor(Color.rgb(0, 255, 163));
            bar2.setStyle(Paint.Style.FILL);
            bar2.setColor(Color.rgb(153, 69, 255));
            bar3.setStyle(Paint.Style.FILL);
            bar3.setColor(Color.rgb(220, 31, 255));
        }

        public void draw(Canvas canvas) {
            Rect b = getBounds();
            float size = Math.min(b.width(), b.height());
            float x = b.left + (b.width() - size) / 2.0f;
            float y = b.top + (b.height() - size) / 2.0f;
            float s = size / 24.0f;
            // Solana mark: three staggered horizontal parallelograms slanting up-right.
            drawSolanaBar(canvas, x + 2.0f * s, y + 4.0f * s, 13.0f * s, 3.2f * s, 3.5f * s, bar1);
            drawSolanaBar(canvas, x + 5.5f * s, y + 10.0f * s, 13.0f * s, 3.2f * s, 3.5f * s, bar2);
            drawSolanaBar(canvas, x + 9.0f * s, y + 16.0f * s, 13.0f * s, 3.2f * s, 3.5f * s, bar3);
        }

        private void drawSolanaBar(Canvas canvas, float left, float top, float width,
                float height, float slant, Paint paint) {
            path.reset();
            path.moveTo(left, top + height);
            path.lineTo(left + slant, top);
            path.lineTo(left + slant + width, top);
            path.lineTo(left + width, top + height);
            path.close();
            canvas.drawPath(path, paint);
        }

        public void setAlpha(int alpha) {
            bar1.setAlpha(alpha);
            bar2.setAlpha(alpha);
            bar3.setAlpha(alpha);
        }

        public void setColorFilter(ColorFilter colorFilter) {
            bar1.setColorFilter(colorFilter);
            bar2.setColorFilter(colorFilter);
            bar3.setColorFilter(colorFilter);
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

    private static class DisplayIconDrawable extends Drawable {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path path = new Path();

        DisplayIconDrawable(int color) {
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeWidth(1.6f);
            paint.setStrokeCap(Paint.Cap.ROUND);
            paint.setStrokeJoin(Paint.Join.ROUND);
            paint.setColor(color);
        }

        public void draw(Canvas canvas) {
            Rect b = getBounds();
            float size = Math.min(b.width(), b.height());
            float x = b.left + (b.width() - size) / 2.0f;
            float y = b.top + (b.height() - size) / 2.0f;
            float s = size / 24.0f;
            float stroke = 1.6f * s;
            paint.setStrokeWidth(stroke);

            RectF screen = new RectF(x + 3.0f * s, y + 4.0f * s,
                    x + 21.0f * s, y + 15.0f * s);
            canvas.drawRoundRect(screen, 1.5f * s, 1.5f * s, paint);

            path.reset();
            path.moveTo(x + 10.0f * s, y + 15.0f * s);
            path.lineTo(x + 8.0f * s, y + 19.0f * s);
            path.lineTo(x + 16.0f * s, y + 19.0f * s);
            path.lineTo(x + 14.0f * s, y + 15.0f * s);
            canvas.drawPath(path, paint);

            path.reset();
            path.moveTo(x + 7.0f * s, y + 19.0f * s);
            path.lineTo(x + 17.0f * s, y + 19.0f * s);
            canvas.drawPath(path, paint);
        }

        public void setAlpha(int alpha) {
            paint.setAlpha(alpha);
        }

        public void setColorFilter(ColorFilter colorFilter) {
            paint.setColorFilter(colorFilter);
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

    private static class BugIconDrawable extends Drawable {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path path = new Path();

        BugIconDrawable(int color) {
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeWidth(1.5f);
            paint.setStrokeCap(Paint.Cap.ROUND);
            paint.setColor(color);
        }

        public void draw(Canvas canvas) {
            Rect b = getBounds();
            float size = Math.min(b.width(), b.height());
            float x = b.left + (b.width() - size) / 2.0f;
            float y = b.top + (b.height() - size) / 2.0f;
            float s = size / 24.0f;
            float stroke = 1.5f * s;
            paint.setStrokeWidth(stroke);

            canvas.drawCircle(x + 12.0f * s, y + 13.0f * s, 4.5f * s, paint);
            canvas.drawCircle(x + 12.0f * s, y + 6.5f * s, 2.2f * s, paint);

            path.reset();
            path.moveTo(x + 10.5f * s, y + 4.5f * s);
            path.lineTo(x + 9.0f * s, y + 2.0f * s);
            path.moveTo(x + 13.5f * s, y + 4.5f * s);
            path.lineTo(x + 15.0f * s, y + 2.0f * s);
            canvas.drawPath(path, paint);

            path.reset();
            path.moveTo(x + 8.0f * s, y + 11.0f * s);
            path.lineTo(x + 4.5f * s, y + 9.0f * s);
            path.moveTo(x + 8.0f * s, y + 13.5f * s);
            path.lineTo(x + 4.0f * s, y + 13.5f * s);
            path.moveTo(x + 8.0f * s, y + 16.0f * s);
            path.lineTo(x + 4.5f * s, y + 18.0f * s);
            path.moveTo(x + 16.0f * s, y + 11.0f * s);
            path.lineTo(x + 19.5f * s, y + 9.0f * s);
            path.moveTo(x + 16.0f * s, y + 13.5f * s);
            path.lineTo(x + 20.0f * s, y + 13.5f * s);
            path.moveTo(x + 16.0f * s, y + 16.0f * s);
            path.lineTo(x + 19.5f * s, y + 18.0f * s);
            canvas.drawPath(path, paint);
        }

        public void setAlpha(int alpha) {
            paint.setAlpha(alpha);
        }

        public void setColorFilter(ColorFilter colorFilter) {
            paint.setColorFilter(colorFilter);
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

}
