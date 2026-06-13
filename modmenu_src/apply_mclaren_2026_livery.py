from colorsys import hsv_to_rgb, rgb_to_hsv
from pathlib import Path

from PIL import Image


ROOT = Path(__file__).resolve().parents[1]
TEXTURE = ROOT / "decompiled/assets/cars/original/rocketcar1.png"

# UV islands used as the restrained teal accents around the papaya bodywork.
TEAL_ACCENTS = (
    (255, 215, 305, 281),
    (417, 224, 511, 263),
    (422, 324, 495, 411),
)


def in_accent(x: int, y: int) -> bool:
    return any(left <= x < right and top <= y < bottom for left, top, right, bottom in TEAL_ACCENTS)


def main() -> None:
    image = Image.open(TEXTURE).convert("RGBA")
    pixels = image.load()

    for y in range(image.height):
        for x in range(image.width):
            red, green, blue, alpha = pixels[x, y]
            if alpha == 0:
                continue

            hue, saturation, value = rgb_to_hsv(red / 255.0, green / 255.0, blue / 255.0)
            warm_body = (
                value > 0.35
                and red > green * 1.25
                and red > blue * 1.25
                and red - min(green, blue) > 45
            )

            if warm_body:
                target_hue = 0.49 if in_accent(x, y) else 0.082
                target_saturation = 0.82 if in_accent(x, y) else 0.96
                out = hsv_to_rgb(target_hue, target_saturation, max(value, 0.78))
                pixels[x, y] = tuple(round(channel * 255) for channel in out) + (alpha,)
            elif max(red, green, blue) - min(red, green, blue) < 3 and 35 <= red <= 65:
                # Shift the flat dark body panels from neutral grey to anthracite.
                scale = red / 47.0
                pixels[x, y] = (
                    min(255, round(29 * scale)),
                    min(255, round(33 * scale)),
                    min(255, round(36 * scale)),
                    alpha,
                )

    image.save(TEXTURE, optimize=True)


if __name__ == "__main__":
    main()
