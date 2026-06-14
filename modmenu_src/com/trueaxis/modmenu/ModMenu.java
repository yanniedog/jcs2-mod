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
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

/**
 * Mod settings for the MCS2 (Jet Car Stunts 2) community build.
 * The launcher exposes only disclosure, game launch, and custom livery tools.
 */
public class ModMenu {
    private static final String PREFS = "jcs_mod";
    private static final String K_CAR = "livery_car";
    private static final int REQUEST_IMPORT = 7301;
    private static final int REQUEST_EXPORT = 7302;
    private static final int TEXTURE_SIZE = 512;

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
        File custom = customTexture(c, car);
        InputStream input = null;
        try {
            input = custom.isFile()
                    ? new java.io.FileInputStream(custom)
                    : c.getAssets().open(CAR_TEXTURES[car]);
            BitmapFactory.Options options = new BitmapFactory.Options();
            options.inPreferredConfig = Bitmap.Config.ARGB_8888;
            Bitmap decoded = BitmapFactory.decodeStream(input, null, options);
            if (decoded == null) return null;
            Bitmap mutable = decoded.copy(Bitmap.Config.ARGB_8888, true);
            if (mutable != decoded) decoded.recycle();
            return mutable;
        } catch (Throwable t) {
            Log.e("MCS2Mod", "Could not load livery for editing", t);
            return null;
        } finally {
            closeQuietly(input);
        }
    }

    /** Saves a designed/edited bitmap as the car's livery (internal + external mirror). */
    public static void saveDesignedLivery(Context c, int car, Bitmap bitmap) throws Exception {
        Bitmap scaled = bitmap.getWidth() == TEXTURE_SIZE && bitmap.getHeight() == TEXTURE_SIZE
                ? bitmap
                : Bitmap.createScaledBitmap(bitmap, TEXTURE_SIZE, TEXTURE_SIZE, true);
        try {
            writeLivery(customTexture(c, car), scaled);
            mirrorExternal(c, car, scaled);
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

    /**
     * Full-screen pre-launch mod menu shown before the native game (and splash) starts.
     * All options are visible immediately; nothing overlays gameplay.
     */
    public static void showPreLaunchMenu(final Activity a, final Runnable onPlay) {
        try {
            LinearLayout root = new LinearLayout(a);
            root.setOrientation(LinearLayout.VERTICAL);
            root.setBackgroundColor(Color.rgb(13, 17, 23));
            root.setPadding(dp(a, 20), dp(a, 16), dp(a, 20), dp(a, 16));

            TextView title = label(a, "MCS2 COMMUNITY MOD", 23, Color.rgb(255, 128, 0));
            title.setGravity(Gravity.CENTER);
            title.setPadding(0, 0, 0, dp(a, 2));
            root.addView(title);

            TextView subtitle = label(a,
                    "This is the modified APK. Replays and leaderboard submissions originate from a modified client.",
                    11, Color.rgb(170, 178, 185));
            subtitle.setGravity(Gravity.CENTER);
            subtitle.setPadding(0, 0, 0, dp(a, 8));
            root.addView(subtitle);

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
                    showLiveryManager(a);
                }
            });
            card.addView(liveries, fill());

            TextView note = label(a,
                    "Always active: offline IAP ownership compatibility, 999 checkpoint-time capacity, blue flame visual identification, and a repeated flap-pulse marker recorded into mod-origin replays. No configurable gameplay, score, or native-value modifications are included.",
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
                    onPlay.run();
                }
            });
            root.addView(play, playLp);

            a.setContentView(root);
        } catch (Throwable t) {
            Log.e("MCS2Mod", "Could not show pre-launch mod menu", t);
            onPlay.run();
        }
    }

    public static void showLiveryManager(final Activity a) {
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

            Button design = button(a, "🎨  Open livery designer");
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
                        Intent intent = new Intent(Build.VERSION.SDK_INT >= 19
                                ? "android.intent.action.OPEN_DOCUMENT" : Intent.ACTION_GET_CONTENT);
                        intent.addCategory(Intent.CATEGORY_OPENABLE);
                        intent.setType("image/*");
                        a.startActivityForResult(intent, REQUEST_IMPORT);
                    } catch (Throwable t) {
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
                        Intent intent = new Intent("android.intent.action.CREATE_DOCUMENT");
                        intent.addCategory(Intent.CATEGORY_OPENABLE);
                        intent.setType("image/png");
                        intent.putExtra(Intent.EXTRA_TITLE,
                                "jcs2-" + CAR_NAMES[car].toLowerCase().replace(' ', '-') + "-livery.png");
                        a.startActivityForResult(intent, REQUEST_EXPORT);
                    } catch (Throwable t) {
                        toast(a, "No file picker available on this device.");
                    }
                }
            });
            restore.setOnClickListener(new View.OnClickListener() {
                public void onClick(View v) {
                    int car = cars.getSelectedItemPosition();
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
            Log.e("MCS2Mod", "Could not open livery manager", t);
            toast(a, "Could not open livery manager.");
        }
    }

    public static boolean handleActivityResult(Activity a, int requestCode, int resultCode,
                                               Intent data) {
        if (requestCode != REQUEST_IMPORT && requestCode != REQUEST_EXPORT) return false;
        if (resultCode != Activity.RESULT_OK || data == null || data.getData() == null) return true;
        Uri uri = data.getData();
        int car = selectedCar(a);
        try {
            if (requestCode == REQUEST_IMPORT) {
                importLivery(a, uri, car);
                toast(a, CAR_NAMES[car] + " livery imported. Restart the game to apply.");
            } else {
                exportLivery(a, uri, car);
                toast(a, CAR_NAMES[car] + " livery exported for editing.");
            }
        } catch (Throwable t) {
            Log.e("MCS2Mod", "Livery file operation failed", t);
            toast(a, "Livery operation failed: " + t.getMessage());
        }
        return true;
    }

    private static void importLivery(Context c, Uri uri, int car) throws Exception {
        Bitmap source = decodeSampled(c, uri);
        if (source == null) throw new IllegalArgumentException("Unsupported image");
        Bitmap scaled = null;
        try {
            scaled = Bitmap.createScaledBitmap(source, TEXTURE_SIZE, TEXTURE_SIZE, true);
            writeLivery(customTexture(c, car), scaled);
            mirrorExternal(c, car, scaled);
        } finally {
            if (scaled != null && scaled != source) scaled.recycle();
            source.recycle();
        }
    }

    /** Decodes an image, downsampling huge sources so we never OOM on import. */
    private static Bitmap decodeSampled(Context c, Uri uri) throws Exception {
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
        } finally {
            closeQuietly(output);
            if (temp.exists()) temp.delete();
        }
    }

    /** Best-effort mirror of a livery to external files dir; failures are non-fatal. */
    private static void mirrorExternal(Context c, int car, Bitmap bitmap) {
        try {
            File external = externalTexture(c, car);
            if (external != null) writeLivery(external, bitmap);
        } catch (Throwable ignored) {
        }
    }

    private static void exportLivery(Context c, Uri uri, int car) throws Exception {
        InputStream input = null;
        OutputStream output = null;
        try {
            File custom = customTexture(c, car);
            input = custom.isFile()
                    ? new java.io.FileInputStream(custom)
                    : c.getAssets().open(CAR_TEXTURES[car]);
            output = c.getContentResolver().openOutputStream(uri);
            if (output == null) throw new IllegalStateException("Could not open export destination");
            byte[] buffer = new byte[16384];
            int count;
            while ((count = input.read(buffer)) != -1) output.write(buffer, 0, count);
            output.flush();
        } finally {
            closeQuietly(input);
            closeQuietly(output);
        }
    }

    /** Removes the custom livery (internal + external mirror) for one car. */
    public static void deleteCustomLivery(Context c, int car) {
        File custom = customTexture(c, car);
        if (custom.exists()) custom.delete();
        File external = externalTexture(c, car);
        if (external != null && external.exists()) external.delete();
    }

    public static void resetAllCustomLiveries(Context c) {
        for (int car = 0; car < CAR_TEXTURES.length; car++) {
            deleteCustomLivery(c, car);
        }
    }

}
