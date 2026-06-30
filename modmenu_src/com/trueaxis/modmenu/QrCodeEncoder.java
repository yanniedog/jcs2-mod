package com.trueaxis.modmenu;

import android.graphics.Bitmap;
import android.graphics.Color;

/**
 * Minimal QR Code encoder (byte mode, error correction M) for short text payloads.
 */
public final class QrCodeEncoder {
    private static final int[] DATA_CODEWORDS = {
            16, 28, 44, 62, 84, 106, 122, 152, 180, 213
    };
    private static final int[] ECC_CODEWORDS = {
            10, 16, 26, 18, 24, 28, 20, 24, 28, 26
    };
    private static final int[] NUM_BLOCKS = {
            1, 1, 1, 2, 2, 4, 4, 4, 4, 6
    };
    private static final int[] REMAINDER_BITS = {
            0, 7, 7, 7, 7, 7, 0, 0, 0, 0
    };

    private QrCodeEncoder() {
    }

    public static Bitmap encode(String text, int sizePx) {
        byte[] data = text.getBytes();
        int version = chooseVersion(data.length);
        boolean[][] modules = encodeVersion(version, data);
        return render(modules, sizePx);
    }

    private static int chooseVersion(int byteLen) {
        for (int version = 1; version <= 10; version++) {
            int capacity = DATA_CODEWORDS[version - 1];
            int neededBits = 4 + 8 + byteLen * 8 + 4;
            int neededCodewords = (neededBits + 7) / 8;
            if (neededCodewords <= capacity) {
                return version;
            }
        }
        return 10;
    }

    private static boolean[][] encodeVersion(int version, byte[] data) {
        int size = version * 4 + 17;
        boolean[][] modules = new boolean[size][size];
        boolean[][] isFunction = new boolean[size][size];
        drawFunctionPatterns(version, modules, isFunction);
        int[] codewords = makeCodewords(version, data);
        placeDataBits(modules, isFunction, codewords);
        int mask = chooseMask(version, modules, isFunction);
        applyMask(modules, isFunction, mask);
        drawFormatBits(modules, isFunction, mask);
        if (version >= 7) {
            drawVersionBits(version, modules, isFunction);
        }
        return modules;
    }

    private static int[] makeCodewords(int version, byte[] data) {
        int dataCapacity = DATA_CODEWORDS[version - 1];
        int numBlocks = NUM_BLOCKS[version - 1];
        int blockEcc = ECC_CODEWORDS[version - 1];
        int shortBlockLen = dataCapacity / numBlocks;
        int longBlocks = dataCapacity % numBlocks;

        int[] dataCodewords = new int[dataCapacity];
        int bitLen = 0;
        int[] bits = new int[dataCapacity * 8 + 32];
        bitLen = appendBits(bits, bitLen, 0x4, 4);
        bitLen = appendBits(bits, bitLen, data.length, version <= 9 ? 8 : 16);
        for (int i = 0; i < data.length; i++) {
            bitLen = appendBits(bits, bitLen, data[i] & 0xFF, 8);
        }
        bitLen = appendBits(bits, bitLen, 0, Math.min(4, dataCapacity * 8 - bitLen));
        while (bitLen % 8 != 0) {
            bitLen = appendBits(bits, bitLen, 0, 1);
        }
        for (int i = 0; i < dataCapacity; i++) {
            int value = 0;
            for (int j = 0; j < 8; j++) {
                value = (value << 1) | bits[i * 8 + j];
            }
            dataCodewords[i] = value;
        }
        for (int i = data.length; i < dataCapacity; i++) {
            dataCodewords[i] = (i % 2 == 0) ? 0xEC : 0x11;
        }

        int[][] blocks = new int[numBlocks][];
        int offset = 0;
        for (int i = 0; i < numBlocks; i++) {
            int blockDataLen = shortBlockLen + (i < longBlocks ? 1 : 0);
            blocks[i] = new int[blockDataLen + blockEcc];
            System.arraycopy(dataCodewords, offset, blocks[i], 0, blockDataLen);
            offset += blockDataLen;
            reedSolomon(blocks[i], blockDataLen, blockEcc);
        }

        int total = dataCapacity + numBlocks * blockEcc;
        int[] result = new int[total];
        int index = 0;
        int maxDataLen = shortBlockLen + (longBlocks > 0 ? 1 : 0);
        for (int col = 0; col < maxDataLen; col++) {
            for (int b = 0; b < numBlocks; b++) {
                if (col < blocks[b].length - blockEcc) {
                    result[index++] = blocks[b][col];
                }
            }
        }
        for (int col = 0; col < blockEcc; col++) {
            for (int b = 0; b < numBlocks; b++) {
                result[index++] = blocks[b][blocks[b].length - blockEcc + col];
            }
        }
        return result;
    }

    private static void placeDataBits(boolean[][] modules, boolean[][] isFunction, int[] codewords) {
        int size = modules.length;
        int bitIndex = 0;
        int totalBits = codewords.length * 8;
        for (int right = size - 1; right >= 1; right -= 2) {
            if (right == 6) {
                right = 5;
            }
            for (int vert = 0; vert < size; vert++) {
                int y = ((right + 1) / 2) % 2 == 0 ? size - 1 - vert : vert;
                for (int j = 0; j < 2; j++) {
                    int x = right - j;
                    if (isFunction[y][x]) {
                        continue;
                    }
                    if (bitIndex < totalBits) {
                        int bit = (codewords[bitIndex / 8] >>> (7 - (bitIndex % 8))) & 1;
                        modules[y][x] = bit == 1;
                        bitIndex++;
                    }
                }
            }
        }
    }

    private static int appendBits(int[] bits, int bitLen, int value, int count) {
        for (int i = count - 1; i >= 0; i--) {
            bits[bitLen++] = (value >>> i) & 1;
        }
        return bitLen;
    }

    private static void reedSolomon(int[] data, int dataLen, int eccLen) {
        int[] generator = new int[eccLen + 1];
        generator[0] = 1;
        int root = 1;
        for (int i = 0; i < eccLen; i++) {
            for (int j = eccLen; j >= 1; j--) {
                generator[j] = gfMul(generator[j], root) ^ generator[j - 1];
            }
            generator[0] = gfMul(generator[0], root);
            root = gfMul(root, 0x02);
        }
        int[] ecc = new int[eccLen];
        for (int i = 0; i < dataLen; i++) {
            int factor = data[i] ^ ecc[0];
            System.arraycopy(ecc, 1, ecc, 0, eccLen - 1);
            ecc[eccLen - 1] = 0;
            for (int j = 0; j < eccLen; j++) {
                ecc[j] ^= gfMul(generator[j + 1], factor);
            }
        }
        System.arraycopy(ecc, 0, data, dataLen, eccLen);
    }

    private static int gfMul(int a, int b) {
        int result = 0;
        for (int i = 0; i < 8; i++) {
            if ((b & 1) != 0) {
                result ^= a;
            }
            boolean high = (a & 0x80) != 0;
            a <<= 1;
            if (high) {
                a ^= 0x1D;
            }
            b >>>= 1;
        }
        return result & 0xFF;
    }

    private static void drawFunctionPatterns(int version, boolean[][] modules, boolean[][] isFunction) {
        int size = modules.length;
        drawFinder(modules, isFunction, 0, 0);
        drawFinder(modules, isFunction, size - 7, 0);
        drawFinder(modules, isFunction, 0, size - 7);
        for (int i = 0; i < 8; i++) {
            setModule(modules, isFunction, i, 7, false);
            setModule(modules, isFunction, 7, i, false);
            setModule(modules, isFunction, size - 8 + i, 7, false);
            setModule(modules, isFunction, 7, size - 8 + i, false);
            setModule(modules, isFunction, i, size - 8, false);
            setModule(modules, isFunction, size - 8, i, false);
        }
        for (int i = 8; i < size - 8; i += 2) {
            setModule(modules, isFunction, 6, i, false);
            setModule(modules, isFunction, i, 6, false);
        }
        int[] alignment = getAlignmentPositions(version);
        for (int i = 0; i < alignment.length; i++) {
            for (int j = 0; j < alignment.length; j++) {
                if ((i == 0 && j == 0) || (i == 0 && j == alignment.length - 1)
                        || (i == alignment.length - 1 && j == 0)) {
                    continue;
                }
                drawAlignment(modules, isFunction, alignment[i], alignment[j]);
            }
        }
        setModule(modules, isFunction, 8, size - 8, true);
        int remainder = REMAINDER_BITS[version - 1];
        for (int i = 0; i < remainder; i++) {
            setModule(modules, isFunction, size - 1 - i, size - 1, false);
        }
    }

    private static void drawFinder(boolean[][] modules, boolean[][] isFunction, int x, int y) {
        for (int dy = -1; dy <= 7; dy++) {
            for (int dx = -1; dx <= 7; dx++) {
                int xx = x + dx;
                int yy = y + dy;
                if (xx < 0 || yy < 0 || xx >= modules.length || yy >= modules.length) {
                    continue;
                }
                boolean on = (dx >= 0 && dx <= 6 && dy >= 0 && dy <= 6)
                        && (dx == 0 || dx == 6 || dy == 0 || dy == 6
                        || (dx >= 2 && dx <= 4 && dy >= 2 && dy <= 4));
                setModule(modules, isFunction, xx, yy, on);
            }
        }
    }

    private static void drawAlignment(boolean[][] modules, boolean[][] isFunction, int cx, int cy) {
        for (int dy = -2; dy <= 2; dy++) {
            for (int dx = -2; dx <= 2; dx++) {
                boolean on = Math.max(Math.abs(dx), Math.abs(dy)) != 1;
                setModule(modules, isFunction, cx + dx, cy + dy, on);
            }
        }
    }

    private static void setModule(boolean[][] modules, boolean[][] isFunction,
            int x, int y, boolean on) {
        modules[y][x] = on;
        isFunction[y][x] = true;
    }

    private static int[] getAlignmentPositions(int version) {
        if (version == 1) {
            return new int[0];
        }
        int count = version / 7 + 2;
        int step = version == 32 ? 26 : (version * 4 + count * 2 + 1) / (count * 2 - 2) * 2;
        int[] result = new int[count];
        result[0] = 6;
        for (int i = count - 1; i >= 1; i--) {
            result[i] = result[0] + step * (count - 1 - i);
        }
        return result;
    }

    private static int chooseMask(int version, boolean[][] modules, boolean[][] isFunction) {
        int bestMask = 0;
        int bestPenalty = Integer.MAX_VALUE;
        boolean[][] temp = new boolean[modules.length][modules.length];
        for (int mask = 0; mask < 8; mask++) {
            for (int y = 0; y < modules.length; y++) {
                System.arraycopy(modules[y], 0, temp[y], 0, modules.length);
            }
            applyMask(temp, isFunction, mask);
            drawFormatBits(temp, isFunction, mask);
            int penalty = maskPenalty(temp);
            if (penalty < bestPenalty) {
                bestPenalty = penalty;
                bestMask = mask;
            }
        }
        return bestMask;
    }

    private static void applyMask(boolean[][] modules, boolean[][] isFunction, int mask) {
        int size = modules.length;
        for (int y = 0; y < size; y++) {
            for (int x = 0; x < size; x++) {
                if (isFunction[y][x]) {
                    continue;
                }
                boolean invert;
                switch (mask) {
                    case 0: invert = (x + y) % 2 == 0; break;
                    case 1: invert = y % 2 == 0; break;
                    case 2: invert = x % 3 == 0; break;
                    case 3: invert = (x + y) % 3 == 0; break;
                    case 4: invert = (x / 3 + y / 2) % 2 == 0; break;
                    case 5: invert = (x * y) % 2 + (x * y) % 3 == 0; break;
                    case 6: invert = ((x * y) % 2 + (x * y) % 3) % 2 == 0; break;
                    default: invert = ((x + y) % 2 + (x * y) % 3) % 2 == 0; break;
                }
                if (invert) {
                    modules[y][x] = !modules[y][x];
                }
            }
        }
    }

    private static void drawFormatBits(boolean[][] modules, boolean[][] isFunction, int mask) {
        int size = modules.length;
        int data = (1 << 3) | mask;
        int bits = data << 10;
        for (int i = 5; i >= 0; i--) {
            bits = (bits << 1) ^ (((bits >>> 10) & 1) != 0 ? 0x537 : 0);
        }
        int format = (data << 10) | (bits & 0x3FF);
        for (int i = 0; i <= 5; i++) {
            setModule(modules, isFunction, 8, i, ((format >>> i) & 1) != 0);
        }
        setModule(modules, isFunction, 8, 7, ((format >>> 6) & 1) != 0);
        setModule(modules, isFunction, 8, 8, ((format >>> 7) & 1) != 0);
        setModule(modules, isFunction, 7, 8, ((format >>> 8) & 1) != 0);
        for (int i = 9; i < 15; i++) {
            setModule(modules, isFunction, 14 - i, 8, ((format >>> i) & 1) != 0);
        }
        for (int i = 0; i < 8; i++) {
            setModule(modules, isFunction, size - 1 - i, 8, ((format >>> i) & 1) != 0);
        }
        for (int i = 8; i < 15; i++) {
            setModule(modules, isFunction, 8, size - 15 + i, ((format >>> i) & 1) != 0);
        }
        setModule(modules, isFunction, 8, size - 8, true);
    }

    private static void drawVersionBits(int version, boolean[][] modules, boolean[][] isFunction) {
        int size = modules.length;
        int bits = version << 12;
        for (int i = 0; i < 6; i++) {
            bits = (bits << 1) ^ (((bits >>> 17) & 1) != 0 ? 0x1F25 : 0);
        }
        int rem = (version << 12) | (bits & 0xFFF);
        for (int i = 0; i < 18; i++) {
            boolean on = ((rem >>> i) & 1) != 0;
            int a = size - 11 + i % 3;
            int b = i / 3;
            setModule(modules, isFunction, a, b, on);
            setModule(modules, isFunction, b, a, on);
        }
    }

    private static int maskPenalty(boolean[][] modules) {
        int size = modules.length;
        int result = 0;
        for (int y = 0; y < size; y++) {
            boolean runColor = modules[y][0];
            int runLen = 1;
            for (int x = 1; x < size; x++) {
                if (modules[y][x] == runColor) {
                    runLen++;
                } else {
                    if (runLen >= 5) {
                        result += runLen - 2;
                    }
                    runColor = modules[y][x];
                    runLen = 1;
                }
            }
            if (runLen >= 5) {
                result += runLen - 2;
            }
        }
        for (int x = 0; x < size; x++) {
            boolean runColor = modules[0][x];
            int runLen = 1;
            for (int y = 1; y < size; y++) {
                if (modules[y][x] == runColor) {
                    runLen++;
                } else {
                    if (runLen >= 5) {
                        result += runLen - 2;
                    }
                    runColor = modules[y][x];
                    runLen = 1;
                }
            }
            if (runLen >= 5) {
                result += runLen - 2;
            }
        }
        return result;
    }

    private static Bitmap render(boolean[][] modules, int sizePx) {
        int count = modules.length;
        int quiet = 4;
        int dim = count + quiet * 2;
        int modulePx = Math.max(1, sizePx / dim);
        int bmpSize = modulePx * dim;
        Bitmap bitmap = Bitmap.createBitmap(bmpSize, bmpSize, Bitmap.Config.ARGB_8888);
        for (int y = 0; y < dim; y++) {
            for (int x = 0; x < dim; x++) {
                int mx = x - quiet;
                int my = y - quiet;
                boolean dark = mx >= 0 && my >= 0 && mx < count && my < count && modules[my][mx];
                int color = dark ? Color.BLACK : Color.WHITE;
                for (int py = 0; py < modulePx; py++) {
                    for (int px = 0; px < modulePx; px++) {
                        bitmap.setPixel(x * modulePx + px, y * modulePx + py, color);
                    }
                }
            }
        }
        return bitmap;
    }
}
