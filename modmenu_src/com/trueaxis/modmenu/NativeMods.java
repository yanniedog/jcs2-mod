package com.trueaxis.modmenu;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.text.InputType;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import java.util.Map;

public final class NativeMods {
    public static final int BOOL = 1;
    public static final int INT = 2;
    public static final int FLOAT = 3;
    public static final int FUNC = 4;
    public static final int CALL_INT = 5;

    private static final class Spec {
        final int id;
        final int type;
        final String category;
        final String label;
        final boolean danger;

        Spec(int id, int type, String category, String label) {
            this(id, type, category, label, false);
        }

        Spec(int id, int type, String category, String label, boolean danger) {
            this.id = id;
            this.type = type;
            this.category = category;
            this.label = label;
            this.danger = danger;
        }
    }

    private static final Spec[] SPECS = {
            new Spec(42, FUNC, "Unlocks & monetization", "Levels_IsPurchased return (ON = owned)"),
            new Spec(43, FUNC, "Unlocks & monetization", "Store_IsItemPurchased return (ON = owned)"),
            new Spec(44, FUNC, "Unlocks & monetization", "IsItemPurchased return (ON = owned)"),
            new Spec(45, FUNC, "Unlocks & monetization", "Level editor unlocked return (ON = unlocked)"),
            new Spec(0, BOOL, "Unlocks & monetization", "g_bUnLockAll (ON = unlock all)"),
            new Spec(46, FUNC, "Level editor limits", "MaxUserLevelsReached return (OFF = unlimited)"),
            new Spec(19, INT, "Level editor limits", "Maximum checkpoint times"),
            new Spec(20, INT, "Level editor limits", "Maximum text buffer size"),
            new Spec(34, FLOAT, "Gameplay tuning", "Ready-set-go countdown seconds"),
            new Spec(35, FLOAT, "Gameplay tuning", "G-sensor responsiveness"),
            new Spec(36, FLOAT, "Gameplay tuning", "Screen tilt"),
            new Spec(37, FLOAT, "Gameplay tuning", "Sensor difference"),
            new Spec(14, BOOL, "Gameplay tuning", "Rocket fuel empty message"),
            new Spec(32, INT, "Gameplay tuning", "Freestyle best trick score"),
            new Spec(33, INT, "Gameplay tuning", "In-air stunt counter"),
            new Spec(1, BOOL, "Cheat & debug flags", "Hyper ballistic"),
            new Spec(2, BOOL, "Cheat & debug flags", "AI on player car"),
            new Spec(3, BOOL, "Cheat & debug flags", "AI enabled"),
            new Spec(4, BOOL, "Cheat & debug flags", "Fast forward"),
            new Spec(5, BOOL, "Cheat & debug flags", "Show replay"),
            new Spec(6, BOOL, "Cheat & debug flags", "Screenshot mode"),
            new Spec(7, BOOL, "Cheat & debug flags", "In-game level editor"),
            new Spec(8, BOOL, "Cheat & debug flags", "Disable dynamic cube mapping"),
            new Spec(9, BOOL, "Cheat & debug flags", "Sound loops off"),
            new Spec(10, BOOL, "Cheat & debug flags", "Flip screen"),
            new Spec(11, BOOL, "Cheat & debug flags", "Rotate screen"),
            new Spec(12, BOOL, "Rendering & performance", "Prevent 30fps switch"),
            new Spec(13, BOOL, "Rendering & performance", "Dynamic reflections"),
            new Spec(16, BOOL, "Rendering & performance", "Frame rate flag"),
            new Spec(17, BOOL, "Rendering & performance", "Default frame rate flag"),
            new Spec(18, BOOL, "Rendering & performance", "Default dynamic reflections"),
            new Spec(21, INT, "Rendering & performance", "Frame delay"),
            new Spec(22, INT, "Rendering & performance", "MSAA sample count"),
            new Spec(26, INT, "Rendering & performance", "Requested red bits"),
            new Spec(27, INT, "Rendering & performance", "Requested green bits"),
            new Spec(28, INT, "Rendering & performance", "Requested blue bits"),
            new Spec(29, INT, "Rendering & performance", "Requested alpha bits"),
            new Spec(30, INT, "Rendering & performance", "Requested depth bits"),
            new Spec(31, INT, "Rendering & performance", "Requested stencil bits"),
            new Spec(38, FLOAT, "Rendering & performance", "30fps timer wait"),
            new Spec(39, FLOAT, "Rendering & performance", "60fps timer wait"),
            new Spec(40, FLOAT, "Rendering & performance", "Near clip plane"),
            new Spec(41, FLOAT, "Rendering & performance", "Far clip plane"),
            new Spec(0, CALL_INT, "Physics capacity", "Maximum collisions", true),
            new Spec(1, CALL_INT, "Physics capacity", "Maximum object pairs", true),
            new Spec(2, CALL_INT, "Physics capacity", "Maximum moving objects", true),
            new Spec(23, INT, "Replay & ghost", "Replay size", true),
            new Spec(24, INT, "Replay & ghost", "Ghost size", true),
            new Spec(25, INT, "Replay & ghost", "Last replay size", true),
            new Spec(15, BOOL, "Replay & ghost", "Keep replay hack"),
            new Spec(47, BOOL, "Anti-piracy - advanced", "g_bIAPCrack", true),
            new Spec(48, BOOL, "Anti-piracy - advanced", "g_bIAPCrackDisableStore", true),
    };

    private static boolean loaded;

    static {
        try {
            System.loadLibrary("jcs2mod");
            loaded = true;
        } catch (Throwable ignored) {
            loaded = false;
        }
    }

    private NativeMods() {
    }

    private static native boolean available(int id);
    private static native boolean setBool(int id, boolean value);
    private static native boolean setInt(int id, int value);
    private static native boolean setFloat(int id, float value);
    private static native boolean reset(int id);
    private static native void resetAll();
    private static native boolean callInt(int id, int value);
    private static native boolean resetCall(int id);

    private static int dp(Context c, int value) {
        return (int) (value * c.getResources().getDisplayMetrics().density + 0.5f);
    }

    private static String modeKey(Spec spec) {
        return modeKey(spec.type, spec.id);
    }

    private static String valueKey(Spec spec) {
        return valueKey(spec.type, spec.id);
    }

    private static String modeKey(int type, int id) {
        return "native_mode_" + type + "_" + id;
    }

    private static String valueKey(int type, int id) {
        return "native_value_" + type + "_" + id;
    }

    // ---- Curated "quick cheat" helpers used by the boot config screen. ----
    // These persist into the same keys applySaved() reads, so a quick cheat and
    // the matching row in the full list always agree, and everything is applied
    // by applySaved() when the game starts.

    public static boolean isQuickBoolOn(Context c, int type, int id) {
        return ModMenu.prefs(c).getInt(modeKey(type, id), -1) == 1;
    }

    public static boolean isQuickNumberOn(Context c, int type, int id, String onValue) {
        return onValue.equals(ModMenu.prefs(c).getString(valueKey(type, id), null));
    }

    public static void quickBool(Context c, int type, int id, boolean on) {
        SharedPreferences.Editor e = ModMenu.prefs(c).edit();
        if (on) e.putInt(modeKey(type, id), 1);
        else e.remove(modeKey(type, id));
        e.apply();
    }

    public static void quickNumber(Context c, int type, int id, String onValue, boolean on) {
        SharedPreferences.Editor e = ModMenu.prefs(c).edit();
        if (on) e.putString(valueKey(type, id), onValue);
        else e.remove(valueKey(type, id));
        e.apply();
    }

    /**
     * Drives the native unlock symbols from the master "Unlock everything" toggle:
     * the IsPurchased functions (ids 42-45) and g_bUnLockAll (id 0).
     */
    public static void setNativeUnlock(Context c, boolean on) {
        quickBool(c, FUNC, 42, on);
        quickBool(c, FUNC, 43, on);
        quickBool(c, FUNC, 44, on);
        quickBool(c, FUNC, 45, on);
        quickBool(c, BOOL, 0, on);
    }

    private static boolean isAvailable(Spec spec) {
        return loaded && (spec.type == CALL_INT || available(spec.id));
    }

    public static void applySaved(Context c) {
        if (!loaded) return;
        SharedPreferences p = ModMenu.prefs(c);
        for (Spec spec : SPECS) {
            if (!isAvailable(spec)) continue;
            if (spec.type == BOOL || spec.type == FUNC) {
                int mode = p.getInt(modeKey(spec), -1);
                if (mode >= 0) setBool(spec.id, mode == 1);
            } else {
                String value = p.getString(valueKey(spec), null);
                if (value == null) continue;
                try {
                    if (spec.type == FLOAT) setFloat(spec.id, Float.parseFloat(value));
                    else if (spec.type == CALL_INT) callInt(spec.id, Integer.parseInt(value));
                    else setInt(spec.id, Integer.parseInt(value));
                } catch (Throwable ignored) {
                }
            }
        }
        // Master "Unlock everything" forces the native unlock symbols on, so a user
        // who just ticks that one box on the boot screen unlocks native content too.
        if (ModMenu.unlockAll(c)) {
            setBool(42, true);
            setBool(43, true);
            setBool(44, true);
            setBool(45, true);
            setBool(0, true);
        }
    }

    public static void show(final Activity a) {
        if (!loaded) {
            Toast.makeText(a, "Native mod bridge did not load.", Toast.LENGTH_LONG).show();
            return;
        }
        ScrollView scroll = new ScrollView(a);
        LinearLayout content = new LinearLayout(a);
        content.setOrientation(LinearLayout.VERTICAL);
        content.setPadding(dp(a, 12), dp(a, 4), dp(a, 12), dp(a, 12));
        scroll.addView(content);

        TextView intro = text(a,
                "Changes apply immediately where the engine supports it and persist across launches. " +
                        "Use DEFAULT to restore the captured original value. Restart after changing startup/render settings.",
                11, Color.DKGRAY);
        intro.setPadding(0, 0, 0, dp(a, 8));
        content.addView(intro);

        String category = "";
        for (Spec spec : SPECS) {
            if (!category.equals(spec.category)) {
                category = spec.category;
                TextView heading = text(a, category, 14, Color.rgb(255, 105, 0));
                heading.setPadding(0, dp(a, 10), 0, dp(a, 3));
                content.addView(heading);
                if (category.startsWith("Anti-piracy")) {
                    content.addView(text(a,
                            "Danger: these flags may disable the store or trigger crack handling. DEFAULT is safest.",
                            10, Color.rgb(180, 30, 30)));
                }
            }
            content.addView(spec.type == BOOL || spec.type == FUNC
                    ? booleanRow(a, spec) : numberRow(a, spec));
        }

        Button resetAllButton = button(a, "RESET ALL MODS AND LIVERIES TO DEFAULT");
        resetAllButton.setTextColor(Color.rgb(180, 20, 20));
        resetAllButton.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                new AlertDialog.Builder(a)
                        .setTitle("Reset all modifications?")
                        .setMessage("This restores captured native defaults, clears saved overrides, and removes all custom liveries.")
                        .setPositiveButton("Reset all", new DialogInterface.OnClickListener() {
                            public void onClick(DialogInterface dialog, int which) {
                                resetAll();
                                clearSaved(a);
                                ModMenu.resetAllCustomLiveries(a);
                                ModMenu.resetBaseMods(a);
                                Toast.makeText(a, "Defaults restored. Restart the game.", Toast.LENGTH_LONG).show();
                            }
                        })
                        .setNegativeButton("Cancel", null)
                        .show();
            }
        });
        content.addView(resetAllButton);

        AlertDialog dialog = new AlertDialog.Builder(a)
                .setTitle("Interactive native mods")
                .setView(scroll)
                .setNegativeButton("Close", null)
                .create();
        dialog.setOnShowListener(new DialogInterface.OnShowListener() {
            public void onShow(DialogInterface ignored) {
                android.view.Window window = dialog.getWindow();
                if (window != null) {
                    window.setLayout(Math.min(dp(a, 760), a.getResources().getDisplayMetrics().widthPixels),
                            Math.min(dp(a, 520), a.getResources().getDisplayMetrics().heightPixels));
                }
            }
        });
        dialog.show();
    }

    private static String stateSuffix(int mode) {
        return mode == 1 ? "  [ON]" : mode == 0 ? "  [OFF]" : "";
    }

    private static View booleanRow(final Activity a, final Spec spec) {
        LinearLayout row = row(a);
        int savedMode = ModMenu.prefs(a).getInt(modeKey(spec), -1);
        final TextView status = text(a, spec.label + stateSuffix(savedMode), 11,
                spec.danger ? Color.rgb(160, 30, 30) : Color.DKGRAY);
        row.addView(status);
        LinearLayout actions = new LinearLayout(a);
        actions.setOrientation(LinearLayout.HORIZONTAL);
        Button off = button(a, "OFF");
        Button def = button(a, "DEFAULT");
        Button on = button(a, "ON");
        actions.addView(off, weighted());
        actions.addView(def, weighted());
        actions.addView(on, weighted());
        row.addView(actions);

        View.OnClickListener listener = new View.OnClickListener() {
            public void onClick(View view) {
                int mode = view.getId();
                boolean ok;
                if (mode == -1) ok = reset(spec.id);
                else ok = setBool(spec.id, mode == 1);
                if (ok) {
                    SharedPreferences.Editor e = ModMenu.prefs(a).edit();
                    if (mode == -1) e.remove(modeKey(spec));
                    else e.putInt(modeKey(spec), mode);
                    e.apply();
                    status.setText(spec.label + "  [" + (mode == -1 ? "DEFAULT" : mode == 1 ? "ON" : "OFF") + "]");
                } else {
                    toast(a, spec.label + " is unavailable.");
                }
            }
        };
        off.setId(0);
        def.setId(-1);
        on.setId(1);
        off.setOnClickListener(listener);
        def.setOnClickListener(listener);
        on.setOnClickListener(listener);
        return row;
    }

    private static View numberRow(final Activity a, final Spec spec) {
        LinearLayout row = row(a);
        TextView label = text(a, spec.label + (spec.danger ? "  (advanced)" : ""), 11,
                spec.danger ? Color.rgb(160, 30, 30) : Color.DKGRAY);
        row.addView(label);
        LinearLayout actions = new LinearLayout(a);
        actions.setOrientation(LinearLayout.HORIZONTAL);
        final EditText value = new EditText(a);
        value.setSingleLine(true);
        value.setText(ModMenu.prefs(a).getString(valueKey(spec), ""));
        value.setHint(spec.type == FLOAT ? "decimal value" : "integer value");
        value.setTextSize(11.0f);
        value.setInputType(InputType.TYPE_CLASS_NUMBER |
                InputType.TYPE_NUMBER_FLAG_SIGNED |
                (spec.type == FLOAT ? InputType.TYPE_NUMBER_FLAG_DECIMAL : 0));
        actions.addView(value, new LinearLayout.LayoutParams(0, dp(a, 42), 1.7f));
        Button apply = button(a, "APPLY");
        Button def = button(a, "DEFAULT");
        actions.addView(apply, weighted());
        actions.addView(def, weighted());
        row.addView(actions);
        apply.setOnClickListener(new View.OnClickListener() {
            public void onClick(View ignored) {
                try {
                    String raw = value.getText().toString().trim();
                    boolean ok;
                    if (spec.type == FLOAT) ok = setFloat(spec.id, Float.parseFloat(raw));
                    else if (spec.type == CALL_INT) ok = callInt(spec.id, Integer.parseInt(raw));
                    else ok = setInt(spec.id, Integer.parseInt(raw));
                    if (!ok) throw new IllegalStateException("unavailable");
                    ModMenu.prefs(a).edit().putString(valueKey(spec), raw).apply();
                    toast(a, spec.label + " applied.");
                } catch (Throwable t) {
                    toast(a, "Enter a valid value for " + spec.label + ".");
                }
            }
        });
        def.setOnClickListener(new View.OnClickListener() {
            public void onClick(View ignored) {
                boolean ok = spec.type == CALL_INT ? resetCall(spec.id) : reset(spec.id);
                if (ok) {
                    value.setText("");
                    ModMenu.prefs(a).edit().remove(valueKey(spec)).apply();
                    toast(a, spec.label + " restored.");
                } else {
                    toast(a, spec.label + " is unavailable.");
                }
            }
        });
        return row;
    }

    private static LinearLayout row(Context c) {
        LinearLayout row = new LinearLayout(c);
        row.setOrientation(LinearLayout.VERTICAL);
        row.setPadding(0, dp(c, 3), 0, dp(c, 3));
        return row;
    }

    private static LinearLayout.LayoutParams weighted() {
        return new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f);
    }

    private static TextView text(Context c, String value, int size, int color) {
        TextView text = new TextView(c);
        text.setText(value);
        text.setTextSize((float) size);
        text.setTextColor(color);
        return text;
    }

    private static Button button(Context c, String text) {
        Button button = new Button(c);
        button.setText(text);
        button.setTextSize(9.0f);
        button.setGravity(Gravity.CENTER);
        button.setMinHeight(0);
        button.setMinimumHeight(0);
        button.setPadding(4, 2, 4, 2);
        return button;
    }

    private static void toast(Context c, String text) {
        Toast.makeText(c, text, Toast.LENGTH_SHORT).show();
    }

    private static void clearSaved(Context c) {
        SharedPreferences p = ModMenu.prefs(c);
        SharedPreferences.Editor e = p.edit();
        for (Map.Entry<String, ?> item : p.getAll().entrySet()) {
            if (item.getKey().startsWith("native_")) e.remove(item.getKey());
        }
        e.apply();
    }
}
