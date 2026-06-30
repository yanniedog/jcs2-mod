package com.trueaxis.modmenu;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.GradientDrawable;
import android.os.Bundle;
import android.util.Log;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.ScaleGestureDetector;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.HorizontalScrollView;
import android.widget.LinearLayout;
import android.widget.SeekBar;
import android.widget.TextView;
import android.widget.Toast;

import java.util.ArrayList;

/**
 * A self-contained on-device livery designer. The user paints directly on the car's
 * 512x512 UV texture (started from the current livery) with brush/eraser/shape/fill/text
 * tools, undo/redo and a colour picker, then saves it as the car's custom livery.
 */
public class LiveryDesignerActivity extends Activity {
    public static final String EXTRA_CAR = "car";

    private static final int BG = Color.rgb(13, 17, 23);
    private static final int PANEL = Color.rgb(28, 32, 38);
    private static final int ACCENT = Color.rgb(255, 128, 0);
    private static final int[] SWATCHES = {
            Color.BLACK, Color.WHITE, Color.rgb(120, 120, 120),
            Color.rgb(220, 40, 40), ACCENT, Color.rgb(245, 210, 40),
            Color.rgb(40, 180, 70), Color.rgb(40, 120, 230), Color.rgb(150, 60, 210),
            Color.rgb(240, 120, 180), Color.rgb(120, 70, 30), Color.rgb(0, 200, 200)
    };

    private int car;
    private DesignView canvas;
    private View colorPreview;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        ModDebugLog.install(this);
        car = getIntent() != null ? getIntent().getIntExtra(EXTRA_CAR, 0) : 0;
        ModDebugLog.module("designer", "onCreate car=" + ModMenu.carName(car)
                + " savedState=" + (savedInstanceState != null));

        Bitmap start = ModMenu.loadEditableLivery(this, car);
        if (start == null) {
            ModDebugLog.module("designer", "editable livery unavailable; creating blank texture");
            start = Bitmap.createBitmap(ModMenu.textureSize(), ModMenu.textureSize(),
                    Bitmap.Config.ARGB_8888);
        }

        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(BG);
        root.setPadding(dp(8), dp(6), dp(8), dp(6));

        TextView title = text(ModMenu.carName(car) + " Ã¢â‚¬â€ livery designer", 16, ACCENT);
        title.setPadding(dp(4), 0, 0, dp(4));
        root.addView(title);

        canvas = new DesignView(this, start);

        root.addView(buildToolRow());
        root.addView(buildColorRow());
        root.addView(buildSizeRow());

        FrameLayout stage = new FrameLayout(this);
        stage.setPadding(dp(2), dp(4), dp(2), dp(4));
        stage.addView(canvas, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        root.addView(stage, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, 0, 1.0f));

        root.addView(buildBottomBar());

        setContentView(root);
        canvas.setColorListener(new DesignView.ColorListener() {
            public void onColorPicked(int color) {
                ModDebugLog.module("designer", "picked color=" + color);
                setColor(color);
            }
        });
        setColor(SWATCHES[3]);
        ModDebugLog.logRuntime("designer ready");
    }

    private View buildToolRow() {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        final String[] names = {"Brush", "Eraser", "Fill", "Line", "Rect", "Pick", "Text"};
        final int[] tools = {DesignView.BRUSH, DesignView.ERASER, DesignView.FILL,
                DesignView.LINE, DesignView.RECT, DesignView.PICK, DesignView.TEXT};
        final Button[] buttons = new Button[names.length];
        for (int i = 0; i < names.length; i++) {
            final int tool = tools[i];
            final int index = i;
            Button b = toolButton(names[i]);
            b.setOnClickListener(new View.OnClickListener() {
                public void onClick(View v) {
                    canvas.setTool(tool);
                    for (int j = 0; j < buttons.length; j++) {
                        buttons[j].setBackgroundDrawable(pill(j == index ? ACCENT : PANEL));
                        buttons[j].setTextColor(j == index ? Color.BLACK : Color.WHITE);
                    }
                }
            });
            buttons[i] = b;
            row.addView(b);
        }
        buttons[0].setBackgroundDrawable(pill(ACCENT));
        buttons[0].setTextColor(Color.BLACK);
        HorizontalScrollView scroll = new HorizontalScrollView(this);
        scroll.setHorizontalScrollBarEnabled(false);
        scroll.addView(row);
        return scroll;
    }

    private View buildColorRow() {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(dp(2), dp(4), dp(2), dp(2));

        colorPreview = new View(this);
        colorPreview.setBackgroundDrawable(pill(Color.WHITE));
        row.addView(colorPreview, new LinearLayout.LayoutParams(dp(28), dp(20)));

        LinearLayout swatches = new LinearLayout(this);
        swatches.setOrientation(LinearLayout.HORIZONTAL);
        for (int i = 0; i < SWATCHES.length; i++) {
            final int color = SWATCHES[i];
            View sw = new View(this);
            sw.setBackgroundDrawable(pill(color));
            sw.setOnClickListener(new View.OnClickListener() {
                public void onClick(View v) {
                    setColor(color);
                }
            });
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(dp(22), dp(22));
            lp.leftMargin = dp(4);
            swatches.addView(sw, lp);
        }
        Button custom = toolButton("RGB");
        custom.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                showColorPicker();
            }
        });
        swatches.addView(custom);

        HorizontalScrollView scroll = new HorizontalScrollView(this);
        scroll.setHorizontalScrollBarEnabled(false);
        scroll.addView(swatches);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(0,
                ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f);
        lp.leftMargin = dp(8);
        row.addView(scroll, lp);
        return row;
    }

    private View buildSizeRow() {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.addView(text("Size", 12, Color.rgb(170, 178, 185)));
        SeekBar bar = new SeekBar(this);
        bar.setMax(80);
        bar.setProgress(10);
        canvas.setStrokeWidth(10);
        bar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                canvas.setStrokeWidth(Math.max(1, progress));
            }

            public void onStartTrackingTouch(SeekBar seekBar) {
            }

            public void onStopTrackingTouch(SeekBar seekBar) {
            }
        });
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(0,
                ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f);
        lp.leftMargin = dp(8);
        row.addView(bar, lp);
        return row;
    }

    private View buildBottomBar() {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setPadding(0, dp(4), 0, 0);

        Button undo = toolButton("Undo");
        undo.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                canvas.undo();
            }
        });
        Button redo = toolButton("Redo");
        redo.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                canvas.redo();
            }
        });
        Button revert = toolButton("Revert");
        revert.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                confirmRevert();
            }
        });
        Button cancel = toolButton("Cancel");
        cancel.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                finish();
            }
        });
        Button save = toolButton("SAVE");
        save.setBackgroundDrawable(pill(ACCENT));
        save.setTextColor(Color.BLACK);
        save.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                save();
            }
        });

        row.addView(undo, even());
        row.addView(redo, even());
        row.addView(revert, even());
        row.addView(cancel, even());
        row.addView(save, even());
        return row;
    }

    private void confirmRevert() {
        ModDebugLog.module("designer", "confirm revert car=" + ModMenu.carName(car));
        new AlertDialog.Builder(this)
                .setTitle("Revert to bundled livery?")
                .setMessage("Discards your edits and starts again from the original car texture.")
                .setPositiveButton("Revert", new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialog, int which) {
                        ModDebugLog.module("designer", "revert confirmed car=" + ModMenu.carName(car));
                        Bitmap original = ModMenu.loadEditableLivery(
                                LiveryDesignerActivity.this, ModMenu.carCount() > car ? car : 0);
                        if (original != null) {
                            canvas.replaceBitmap(original);
                            ModDebugLog.module("designer", "revert loaded original car=" + ModMenu.carName(car));
                        } else {
                            ModDebugLog.module("designer", "revert original load returned null car="
                                    + ModMenu.carName(car));
                        }
                    }
                })
                .setNegativeButton("Keep editing", null)
                .show();
    }

    private void save() {
        try {
            ModDebugLog.module("designer", "save clicked car=" + ModMenu.carName(car)
                    + " bitmap=" + canvas.getBitmap().getWidth() + "x"
                    + canvas.getBitmap().getHeight());
            ModMenu.saveDesignedLivery(this, car, canvas.getBitmap());
            Toast.makeText(this, ModMenu.carName(car)
                    + " livery saved. Restart the game to see it.", Toast.LENGTH_LONG).show();
            ModDebugLog.module("designer", "save complete car=" + ModMenu.carName(car));
            finish();
        } catch (Throwable t) {
            Log.e("YCS2Mod", "Could not save designed livery", t);
            ModDebugLog.module("designer", "Could not save designed livery", t);
            Toast.makeText(this, "Could not save livery: " + t.getMessage(), Toast.LENGTH_LONG).show();
        }
    }

    private void setColor(int color) {
        canvas.setColor(color);
        if (colorPreview != null) colorPreview.setBackgroundDrawable(pill(color));
    }

    private void showColorPicker() {
        final int start = canvas.getColor();
        ModDebugLog.module("designer", "open color picker start=" + start);
        LinearLayout box = new LinearLayout(this);
        box.setOrientation(LinearLayout.VERTICAL);
        box.setPadding(dp(16), dp(12), dp(16), dp(4));
        final View preview = new View(this);
        preview.setBackgroundDrawable(pill(start));
        box.addView(preview, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(30)));

        final int[] rgb = {Color.red(start), Color.green(start), Color.blue(start)};
        final String[] labels = {"R", "G", "B"};
        final SeekBar[] bars = new SeekBar[3];
        for (int i = 0; i < 3; i++) {
            final int channel = i;
            LinearLayout line = new LinearLayout(this);
            line.setOrientation(LinearLayout.HORIZONTAL);
            line.setGravity(Gravity.CENTER_VERTICAL);
            line.addView(text(labels[i], 13, Color.DKGRAY));
            SeekBar bar = new SeekBar(this);
            bar.setMax(255);
            bar.setProgress(rgb[i]);
            bar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
                public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                    rgb[channel] = progress;
                    preview.setBackgroundDrawable(pill(Color.rgb(rgb[0], rgb[1], rgb[2])));
                }

                public void onStartTrackingTouch(SeekBar seekBar) {
                }

                public void onStopTrackingTouch(SeekBar seekBar) {
                }
            });
            bars[i] = bar;
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(0,
                    ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f);
            lp.leftMargin = dp(8);
            line.addView(bar, lp);
            box.addView(line);
        }
        new AlertDialog.Builder(this)
                .setTitle("Custom colour")
                .setView(box)
                .setPositiveButton("Use", new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialog, int which) {
                        setColor(Color.rgb(rgb[0], rgb[1], rgb[2]));
                    }
                })
                .setNegativeButton("Cancel", null)
                .show();
    }

    // ---- small UI helpers ----

    private int dp(int value) {
        return (int) (value * getResources().getDisplayMetrics().density + 0.5f);
    }

    private TextView text(String value, int size, int color) {
        TextView view = new TextView(this);
        view.setText(value);
        view.setTextSize(size);
        view.setTextColor(color);
        return view;
    }

    private Button toolButton(String label) {
        Button b = new Button(this);
        b.setText(label);
        b.setAllCaps(false);
        b.setTextSize(12.0f);
        b.setTextColor(Color.WHITE);
        b.setMinHeight(0);
        b.setMinimumHeight(0);
        b.setMinWidth(0);
        b.setMinimumWidth(0);
        b.setPadding(dp(10), dp(6), dp(10), dp(6));
        b.setBackgroundDrawable(pill(PANEL));
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.rightMargin = dp(4);
        b.setLayoutParams(lp);
        return b;
    }

    private LinearLayout.LayoutParams even() {
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(0,
                ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f);
        lp.rightMargin = dp(4);
        return lp;
    }

    private static GradientDrawable pill(int color) {
        GradientDrawable d = new GradientDrawable();
        d.setColor(color);
        d.setCornerRadius(12);
        d.setStroke(2, Color.argb(60, 255, 255, 255));
        return d;
    }

    /** The paint surface: holds the 512x512 bitmap and maps screen touches onto it. */
    static final class DesignView extends View {
        static final int BRUSH = 0, ERASER = 1, FILL = 2, LINE = 3, RECT = 4, PICK = 5, TEXT = 6;

        interface ColorListener {
            void onColorPicked(int color);
        }

        private final Bitmap checker;
        private Bitmap bitmap;
        private Canvas bitmapCanvas;
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint blit = new Paint(Paint.FILTER_BITMAP_FLAG);
        private final PorterDuffXfermode clear = new PorterDuffXfermode(PorterDuff.Mode.CLEAR);

        private final ArrayList<Bitmap> undo = new ArrayList<Bitmap>();
        private final ArrayList<Bitmap> redo = new ArrayList<Bitmap>();
        private static final int MAX_UNDO = 12;

        private int tool = BRUSH;
        private int color = Color.RED;
        private float strokeWidth = 10f;

        private final RectF dst = new RectF();
        private float fitScale = 1f;
        private float zoom = 1f;
        private float panX;
        private float panY;
        private int viewW;
        private int viewH;
        private static final float MIN_ZOOM = 1f;
        private static final float MAX_ZOOM = 8f;
        private final Path stroke = new Path();
        private float startX, startY, curX, curY;
        private boolean dragging;
        private boolean multiTouchActive;
        private float lastMidX;
        private float lastMidY;
        private ColorListener colorListener;
        private final ScaleGestureDetector scaleDetector;

        DesignView(Context c, Bitmap initial) {
            super(c);
            bitmap = initial.isMutable() ? initial
                    : initial.copy(Bitmap.Config.ARGB_8888, true);
            bitmapCanvas = new Canvas(bitmap);
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeCap(Paint.Cap.ROUND);
            paint.setStrokeJoin(Paint.Join.ROUND);
            checker = makeChecker();
            scaleDetector = new ScaleGestureDetector(c,
                    new ScaleGestureDetector.SimpleOnScaleGestureListener() {
                        @Override
                        public boolean onScale(ScaleGestureDetector detector) {
                            float oldZoom = zoom;
                            float newZoom = Math.max(MIN_ZOOM,
                                    Math.min(MAX_ZOOM, zoom * detector.getScaleFactor()));
                            if (newZoom != oldZoom) {
                                applyZoomAt(newZoom, detector.getFocusX(), detector.getFocusY());
                                invalidate();
                            }
                            return true;
                        }
                    });
        }

        void setColorListener(ColorListener l) {
            colorListener = l;
        }

        void setTool(int t) {
            tool = t;
        }

        void setColor(int c) {
            color = c;
        }

        int getColor() {
            return color;
        }

        void setStrokeWidth(float w) {
            strokeWidth = w;
        }

        Bitmap getBitmap() {
            return bitmap;
        }

        void replaceBitmap(Bitmap next) {
            pushUndo();
            bitmap = next.isMutable() ? next : next.copy(Bitmap.Config.ARGB_8888, true);
            bitmapCanvas = new Canvas(bitmap);
            invalidate();
        }

        void undo() {
            if (undo.isEmpty()) return;
            redo.add(copy(bitmap));
            bitmap = undo.remove(undo.size() - 1);
            bitmapCanvas = new Canvas(bitmap);
            invalidate();
        }

        void redo() {
            if (redo.isEmpty()) return;
            undo.add(copy(bitmap));
            bitmap = redo.remove(redo.size() - 1);
            bitmapCanvas = new Canvas(bitmap);
            invalidate();
        }

        private void pushUndo() {
            undo.add(copy(bitmap));
            if (undo.size() > MAX_UNDO) {
                Bitmap dropped = undo.remove(0);
                dropped.recycle();
            }
            for (int i = 0; i < redo.size(); i++) redo.get(i).recycle();
            redo.clear();
        }

        private static Bitmap copy(Bitmap b) {
            return b.copy(Bitmap.Config.ARGB_8888, true);
        }

        @Override
        protected void onSizeChanged(int w, int h, int oldW, int oldH) {
            viewW = w;
            viewH = h;
            fitScale = Math.min(w, h) / (float) bitmap.getWidth();
            updateDst();
        }

        private float effectiveScale() {
            return fitScale * zoom;
        }

        private void updateDst() {
            float side = bitmap.getWidth() * effectiveScale();
            float left = viewW / 2f + panX - side / 2f;
            float top = viewH / 2f + panY - side / 2f;
            dst.set(left, top, left + side, top + side);
        }

        private void applyZoomAt(float newZoom, float focusX, float focusY) {
            float oldScale = effectiveScale();
            float bx = (focusX - dst.left) / oldScale;
            float by = (focusY - dst.top) / oldScale;
            zoom = newZoom;
            if (zoom <= MIN_ZOOM) {
                zoom = MIN_ZOOM;
                panX = 0f;
                panY = 0f;
                updateDst();
                return;
            }
            float newScale = effectiveScale();
            float side = bitmap.getWidth() * newScale;
            panX = focusX - bx * newScale - viewW / 2f + side / 2f;
            panY = focusY - by * newScale - viewH / 2f + side / 2f;
            clampPan();
            updateDst();
        }

        private void clampPan() {
            if (zoom <= MIN_ZOOM) {
                panX = 0f;
                panY = 0f;
                return;
            }
            float side = bitmap.getWidth() * effectiveScale();
            float maxPanX = Math.max(0f, (side - viewW) / 2f);
            float maxPanY = Math.max(0f, (side - viewH) / 2f);
            panX = Math.max(-maxPanX, Math.min(maxPanX, panX));
            panY = Math.max(-maxPanY, Math.min(maxPanY, panY));
        }

        @Override
        protected void onDraw(Canvas c) {
            c.drawBitmap(checker, null, dst, null);
            c.drawBitmap(bitmap, null, dst, blit);
            if (dragging && (tool == LINE || tool == RECT)) {
                paint.setXfermode(null);
                paint.setColor(color);
                paint.setStrokeWidth(strokeWidth * effectiveScale());
                paint.setStyle(tool == RECT ? Paint.Style.FILL : Paint.Style.STROKE);
                if (tool == LINE) {
                    c.drawLine(viewX(startX), viewY(startY), viewX(curX), viewY(curY), paint);
                } else {
                    c.drawRect(Math.min(viewX(startX), viewX(curX)), Math.min(viewY(startY), viewY(curY)),
                            Math.max(viewX(startX), viewX(curX)), Math.max(viewY(startY), viewY(curY)), paint);
                }
            }
        }

        private float viewX(float bx) {
            return dst.left + bx * effectiveScale();
        }

        private float viewY(float by) {
            return dst.top + by * effectiveScale();
        }

        private float bmpX(float vx) {
            return (vx - dst.left) / effectiveScale();
        }

        private float bmpY(float vy) {
            return (vy - dst.top) / effectiveScale();
        }

        @Override
        public boolean onTouchEvent(MotionEvent e) {
            scaleDetector.onTouchEvent(e);
            int action = e.getActionMasked();
            int pointers = e.getPointerCount();

            if (pointers >= 2) {
                dragging = false;
                if (action == MotionEvent.ACTION_POINTER_UP) {
                    multiTouchActive = false;
                    return true;
                }
                float midX = 0f;
                float midY = 0f;
                for (int i = 0; i < pointers; i++) {
                    midX += e.getX(i);
                    midY += e.getY(i);
                }
                midX /= pointers;
                midY /= pointers;

                if (action == MotionEvent.ACTION_POINTER_DOWN) {
                    lastMidX = midX;
                    lastMidY = midY;
                    multiTouchActive = true;
                } else if (action == MotionEvent.ACTION_MOVE && multiTouchActive) {
                    panX += midX - lastMidX;
                    panY += midY - lastMidY;
                    lastMidX = midX;
                    lastMidY = midY;
                    clampPan();
                    updateDst();
                    invalidate();
                }
                return true;
            }

            if (action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL) {
                multiTouchActive = false;
                dragging = false;
            }

            if (scaleDetector.isInProgress()) {
                return true;
            }

            float bx = bmpX(e.getX());
            float by = bmpY(e.getY());
            switch (e.getAction()) {
                case MotionEvent.ACTION_DOWN:
                    onDown(bx, by);
                    break;
                case MotionEvent.ACTION_MOVE:
                    onMove(bx, by);
                    break;
                case MotionEvent.ACTION_UP:
                    onUp(bx, by);
                    break;
                default:
                    return false;
            }
            return true;
        }

        private void onDown(float bx, float by) {
            startX = curX = bx;
            startY = curY = by;
            if (tool == PICK) {
                pickColor(bx, by);
                return;
            }
            if (tool == TEXT) {
                promptText(bx, by);
                return;
            }
            if (tool == FILL) {
                pushUndo();
                floodFill(Math.round(bx), Math.round(by), color);
                invalidate();
                return;
            }
            pushUndo();
            dragging = true;
            if (tool == BRUSH || tool == ERASER) {
                stroke.reset();
                stroke.moveTo(bx, by);
                applyStrokePaint();
                bitmapCanvas.drawPoint(bx, by, paint);
                invalidate();
            }
        }

        private void onMove(float bx, float by) {
            if (!dragging) return;
            curX = bx;
            curY = by;
            if (tool == BRUSH || tool == ERASER) {
                applyStrokePaint();
                bitmapCanvas.drawLine(startX, startY, bx, by, paint);
                startX = bx;
                startY = by;
            }
            invalidate();
        }

        private void onUp(float bx, float by) {
            if (!dragging) return;
            dragging = false;
            // start* stays at the down point for LINE/RECT (only BRUSH mutates it).
            if (tool == LINE) {
                paint.setXfermode(null);
                paint.setColor(color);
                paint.setStrokeWidth(strokeWidth);
                paint.setStyle(Paint.Style.STROKE);
                bitmapCanvas.drawLine(startX, startY, bx, by, paint);
            } else if (tool == RECT) {
                paint.setXfermode(null);
                paint.setColor(color);
                paint.setStyle(Paint.Style.FILL);
                bitmapCanvas.drawRect(Math.min(startX, bx), Math.min(startY, by),
                        Math.max(startX, bx), Math.max(startY, by), paint);
            }
            invalidate();
        }

        private void applyStrokePaint() {
            paint.setStrokeWidth(strokeWidth);
            paint.setStyle(Paint.Style.STROKE);
            if (tool == ERASER) {
                paint.setXfermode(clear);
                paint.setColor(Color.TRANSPARENT);
            } else {
                paint.setXfermode(null);
                paint.setColor(color);
            }
        }

        private void pickColor(float bx, float by) {
            int x = clampX(Math.round(bx));
            int y = clampY(Math.round(by));
            int c = bitmap.getPixel(x, y);
            color = c;
            if (colorListener != null) colorListener.onColorPicked(c);
        }

        private void promptText(final float bx, final float by) {
            final EditText input = new EditText(getContext());
            input.setHint("Text / number");
            new AlertDialog.Builder(getContext())
                    .setTitle("Add text")
                    .setView(input)
                    .setPositiveButton("Place", new DialogInterface.OnClickListener() {
                        public void onClick(DialogInterface dialog, int which) {
                            String s = input.getText().toString();
                            if (s.length() == 0) return;
                            ModDebugLog.module("designer", "place text length=" + s.length());
                            pushUndo();
                            Paint tp = new Paint(Paint.ANTI_ALIAS_FLAG);
                            tp.setColor(color);
                            tp.setTextSize(Math.max(16f, strokeWidth * 3f));
                            tp.setTextAlign(Paint.Align.CENTER);
                            bitmapCanvas.drawText(s, bx, by, tp);
                            invalidate();
                        }
                    })
                    .setNegativeButton("Cancel", null)
                    .show();
        }

        private int clampX(int x) {
            return x < 0 ? 0 : x >= bitmap.getWidth() ? bitmap.getWidth() - 1 : x;
        }

        private int clampY(int y) {
            return y < 0 ? 0 : y >= bitmap.getHeight() ? bitmap.getHeight() - 1 : y;
        }

        /** Simple stack-based flood fill with a small tolerance. */
        private void floodFill(int sx, int sy, int replacement) {
            int w = bitmap.getWidth();
            int h = bitmap.getHeight();
            if (sx < 0 || sy < 0 || sx >= w || sy >= h) return;
            int[] pixels = new int[w * h];
            bitmap.getPixels(pixels, 0, w, 0, 0, w, h);
            int target = pixels[sy * w + sx];
            if (target == replacement) return;
            int[] stack = new int[w * h];
            int top = 0;
            stack[top++] = sy * w + sx;
            while (top > 0) {
                int p = stack[--top];
                if (pixels[p] != target) continue;
                int px = p % w;
                int left = px;
                int right = px;
                int rowStart = p - px;
                while (left > 0 && pixels[rowStart + left - 1] == target) left--;
                while (right < w - 1 && pixels[rowStart + right + 1] == target) right++;
                for (int x = left; x <= right; x++) {
                    int idx = rowStart + x;
                    pixels[idx] = replacement;
                    if (idx - w >= 0 && pixels[idx - w] == target) stack[top++] = idx - w;
                    if (idx + w < pixels.length && pixels[idx + w] == target) stack[top++] = idx + w;
                }
            }
            bitmap.setPixels(pixels, 0, w, 0, 0, w, h);
        }

        private Bitmap makeChecker() {
            int size = 16;
            Bitmap b = Bitmap.createBitmap(size * 2, size * 2, Bitmap.Config.ARGB_8888);
            Canvas c = new Canvas(b);
            Paint p = new Paint();
            p.setColor(Color.rgb(70, 76, 84));
            c.drawRect(0, 0, size * 2, size * 2, p);
            p.setColor(Color.rgb(54, 60, 68));
            c.drawRect(0, 0, size, size, p);
            c.drawRect(size, size, size * 2, size * 2, p);
            return b;
        }
    }
}
