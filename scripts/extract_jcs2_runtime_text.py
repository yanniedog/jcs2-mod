#!/usr/bin/env python3
"""Extract and validate JCS2 runtime text against screenshot evidence."""

from __future__ import annotations

import argparse
import html
import json
import math
import re
import subprocess
import sys
import textwrap
import xml.etree.ElementTree as ET
from dataclasses import dataclass, asdict
from pathlib import Path
from typing import Iterable

import cv2
import numpy as np
from PIL import Image, ImageDraw, ImageFont


BOUNDS_RE = re.compile(r"\[(\d+),(\d+)\]\[(\d+),(\d+)\]")
COMMON_OCR_TOKENS = {
    "axis", "connect", "facebook", "game", "help", "leaderboards",
    "login", "options", "play", "profile", "replays", "scores",
    "start", "true",
}


def normalize_text(value: str) -> str:
    value = value or ""
    value = value.replace("\u00a0", " ")
    value = re.sub(r"[^a-zA-Z0-9]+", " ", value)
    return re.sub(r"\s+", " ", value).strip().lower()


def token_score(expected: str, actual: str) -> float:
    expected_norm = normalize_text(expected)
    actual_norm = normalize_text(actual)
    if not expected_norm:
        return 1.0
    if expected_norm in actual_norm:
        return 1.0
    exp_tokens = expected_norm.split()
    act_tokens = set(actual_norm.split())
    if not exp_tokens:
        return 1.0
    overlap = sum(1 for token in exp_tokens if token in act_tokens)
    token_ratio = overlap / len(exp_tokens)
    seq_ratio = __import__("difflib").SequenceMatcher(None, expected_norm, actual_norm).ratio()
    return max(token_ratio, seq_ratio)


def parse_bounds(bounds: str) -> tuple[int, int, int, int] | None:
    match = BOUNDS_RE.search(bounds or "")
    if not match:
        return None
    return tuple(int(match.group(i)) for i in range(1, 5))  # type: ignore[return-value]


def is_crop_nonblank(image: Image.Image) -> bool:
    if image.width <= 0 or image.height <= 0:
        return False
    arr = np.array(image.convert("L"))
    if arr.size == 0:
        return False
    return float(np.std(arr)) >= 2.0 or float(np.max(arr) - np.min(arr)) >= 8.0


def is_black_frame(image: Image.Image) -> bool:
    arr = np.array(image.convert("L"))
    if arr.size == 0:
        return True
    return float(np.mean(arr)) < 3.0 and float(np.std(arr)) < 2.0


def preprocess_for_ocr(image: Image.Image, scale: int = 3) -> Image.Image:
    rgb = image.convert("RGB")
    if scale > 1:
        rgb = rgb.resize((rgb.width * scale, rgb.height * scale), Image.Resampling.LANCZOS)
    arr = np.array(rgb)
    gray = cv2.cvtColor(arr, cv2.COLOR_RGB2GRAY)
    gray = cv2.fastNlMeansDenoising(gray, None, 10, 7, 21)
    _, thresh = cv2.threshold(gray, 0, 255, cv2.THRESH_BINARY + cv2.THRESH_OTSU)
    return Image.fromarray(thresh)


def run_tesseract(tesseract: str, image: Image.Image, psm: str, timeout: int) -> str:
    temp_dir = Path.cwd() / "_apk_build" / "ocr-temp"
    temp_dir.mkdir(parents=True, exist_ok=True)
    base = temp_dir / f"ocr-{abs(hash((image.width, image.height, image.tobytes()[:64])))}"
    png = base.with_suffix(".png")
    image.save(png)
    try:
        proc = subprocess.run(
            [tesseract, str(png), "stdout", "--psm", psm, "-l", "eng"],
            check=False,
            text=True,
            encoding="utf-8",
            errors="replace",
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            timeout=timeout,
        )
    except subprocess.TimeoutExpired:
        return ""
    finally:
        try:
            png.unlink()
        except OSError:
            pass
    if proc.returncode != 0:
        return ""
    return (proc.stdout or "").strip()


def run_full_screenshot_ocr(tesseract: str, image: Image.Image, include_rotations: bool, timeout: int) -> str:
    parts: list[str] = []
    angles = [0, 90, 270] if include_rotations else [0]
    for angle in angles:
        candidate = image.rotate(angle, expand=True) if angle else image
        text = run_tesseract(tesseract, preprocess_for_ocr(candidate, scale=1), "11", timeout)
        if text:
            label = f"[rotation {angle}]"
            parts.append(f"{label}\n{text}")
    return "\n".join(parts).strip()


def split_ocr_sections(full_ocr: str) -> list[tuple[str, str]]:
    sections: list[tuple[str, list[str]]] = []
    current_label = "rotation 0"
    current_lines: list[str] = []
    for raw_line in (full_ocr or "").splitlines():
        line = raw_line.strip()
        if line.startswith("[rotation ") and line.endswith("]"):
            if current_lines:
                sections.append((current_label, current_lines))
            current_label = line.strip("[]")
            current_lines = []
            continue
        current_lines.append(raw_line)
    if current_lines:
        sections.append((current_label, current_lines))
    return [(label, "\n".join(lines)) for label, lines in sections]


def score_ocr_section(text: str) -> float:
    score = 0.0
    for raw_line in (text or "").splitlines():
        line = raw_line.strip()
        norm = normalize_text(line)
        if len(norm) < 3:
            continue
        letters = sum(1 for ch in line if ch.isalpha())
        visible = max(1, sum(1 for ch in line if not ch.isspace()))
        alpha_ratio = letters / visible
        tokens = norm.split()
        score += min(len(norm), 48) * max(0.1, alpha_ratio)
        score += 40.0 * sum(1 for token in tokens if token in COMMON_OCR_TOKENS)
    return score


def collect_ocr_text_lines(full_ocr: str, limit: int = 12) -> list[str]:
    sections = split_ocr_sections(full_ocr)
    if sections:
        _, selected_text = max(sections, key=lambda item: score_ocr_section(item[1]))
    else:
        selected_text = full_ocr
    lines: list[str] = []
    common_lines: list[str] = []
    seen: set[str] = set()
    for raw_line in (selected_text or "").splitlines():
        line = raw_line.strip()
        if not line or line.startswith("[rotation "):
            continue
        norm = normalize_text(line)
        if len(norm) < 3 or norm in seen:
            continue
        seen.add(norm)
        if any(token in COMMON_OCR_TOKENS for token in norm.split()):
            common_lines.append(line)
        else:
            lines.append(line)
    selected_lines = common_lines if common_lines else lines
    if common_lines and len(common_lines) < min(limit, 6):
        selected_lines = common_lines + lines[: max(0, min(limit, 6) - len(common_lines))]
    return selected_lines[:limit]


@dataclass
class TextNode:
    text: str
    source: str
    bounds: list[int]
    class_name: str
    resource_id: str
    crop_nonblank: bool = False
    crop_ocr: str = ""
    match_score: float = 0.0
    status: str = "partial"


def collect_xml_text_nodes(xml_path: Path) -> list[TextNode]:
    if not xml_path.exists() or xml_path.stat().st_size == 0:
        return []
    try:
        root = ET.parse(xml_path).getroot()
    except ET.ParseError:
        return []
    nodes: list[TextNode] = []
    for elem in root.iter("node"):
        raw_text = elem.attrib.get("text") or ""
        content_desc = elem.attrib.get("content-desc") or ""
        source = "text" if raw_text.strip() else "content-desc"
        text = raw_text.strip() or content_desc.strip()
        if not text:
            continue
        bounds = parse_bounds(elem.attrib.get("bounds", ""))
        if not bounds:
            continue
        x1, y1, x2, y2 = bounds
        if x2 <= x1 or y2 <= y1:
            continue
        nodes.append(
            TextNode(
                text=text,
                source=source,
                bounds=[x1, y1, x2, y2],
                class_name=elem.attrib.get("class", ""),
                resource_id=elem.attrib.get("resource-id", ""),
            )
        )
    return nodes


def draw_overlay(
    image: Image.Image,
    nodes: Iterable[TextNode],
    issues: list[str],
    output: Path,
) -> None:
    overlay = image.convert("RGB")
    draw = ImageDraw.Draw(overlay)
    try:
        font = ImageFont.truetype("arial.ttf", 10)
    except OSError:
        font = ImageFont.load_default()
    colors = {"verified": (0, 160, 60), "partial": (220, 140, 0), "failed": (220, 40, 40)}
    for idx, node in enumerate(nodes, 1):
        x1, y1, x2, y2 = node.bounds
        color = colors.get(node.status, colors["partial"])
        draw.rectangle([x1, y1, x2, y2], outline=color, width=2)
        label = f"{idx}:{node.status}:{node.text[:24]}"
        label_y = max(0, y1 - 12)
        draw.rectangle([x1, label_y, min(image.width, x1 + 6 * len(label) + 6), y1], fill=(0, 0, 0))
        draw.text((x1 + 2, label_y), label, fill=color, font=font)
    if issues:
        y = 2
        for issue in issues[:6]:
            msg = issue[:78]
            draw.rectangle([2, y, min(image.width - 2, 8 + 6 * len(msg)), y + 12], fill=(0, 0, 0))
            draw.text((5, y), msg, fill=(255, 80, 80), font=font)
            y += 13
    output.parent.mkdir(parents=True, exist_ok=True)
    overlay.save(output)


def extract(args: argparse.Namespace) -> int:
    screenshot = Path(args.screenshot)
    xml_path = Path(args.xml) if args.xml else Path("__missing__.xml")
    out_json = Path(args.out_json)
    out_ocr = Path(args.out_ocr)
    out_overlay = Path(args.out_overlay)

    image = Image.open(screenshot).convert("RGB")
    issues: list[str] = []
    if args.expect_width and image.width != args.expect_width:
        issues.append(f"width {image.width} != expected {args.expect_width}")
    if args.expect_height and image.height != args.expect_height:
        issues.append(f"height {image.height} != expected {args.expect_height}")
    black = is_black_frame(image)
    if black:
        issues.append("screenshot is black/blank")

    nodes = collect_xml_text_nodes(xml_path)
    full_ocr = ""
    if args.tesseract:
        full_ocr = run_full_screenshot_ocr(args.tesseract, image, include_rotations=(len(nodes) == 0), timeout=args.ocr_timeout)

    required_text = [text for text in args.require_text if text]
    for node in nodes:
        node_is_required = any(token_score(required, node.text) >= 0.9 for required in required_text)
        x1, y1, x2, y2 = node.bounds
        in_bounds = x1 >= 0 and y1 >= 0 and x2 <= image.width and y2 <= image.height
        if not in_bounds:
            node.status = "failed"
            issues.append(f"xml text bounds outside screenshot: {node.text!r} {node.bounds}")
            continue
        crop = image.crop((x1, y1, x2, y2))
        node.crop_nonblank = is_crop_nonblank(crop)
        if not node.crop_nonblank:
            node.status = "failed"
            issues.append(f"xml text crop is blank: {node.text!r} {node.bounds}")
            continue
        if args.tesseract and crop.width >= 4 and crop.height >= 4:
            node.crop_ocr = run_tesseract(args.tesseract, preprocess_for_ocr(crop, scale=4), "7", args.ocr_timeout)
        node.match_score = max(token_score(node.text, node.crop_ocr), token_score(node.text, full_ocr))
        if node.match_score >= args.match_threshold:
            node.status = "verified"
        elif args.required and node_is_required:
            node.status = "failed"
            issues.append(f"ocr mismatch for xml text: {node.text!r} crop_ocr={node.crop_ocr!r}")
        else:
            node.status = "partial"

    for text in required_text:
        score = max(
            token_score(text, full_ocr),
            max([token_score(text, n.text) for n in nodes], default=0.0),
            max([token_score(text, n.crop_ocr) for n in nodes], default=0.0),
        )
        if score < args.match_threshold:
            issues.append(f"required text not verified visually: {text!r}")

    if issues:
        status = "failed" if args.required else "partial"
    elif nodes and all(node.status == "verified" for node in nodes):
        status = "verified"
    elif nodes or full_ocr:
        status = "partial"
    else:
        status = "partial"

    data = {
        "screenshot": str(screenshot),
        "xml": str(xml_path) if xml_path.exists() else None,
        "width": image.width,
        "height": image.height,
        "black_frame": black,
        "text_status": status,
        "issues": issues,
        "full_ocr": full_ocr,
        "ocr_text": collect_ocr_text_lines(full_ocr),
        "verified_text": [node.text for node in nodes if node.status == "verified"],
        "partial_text": [node.text for node in nodes if node.status == "partial"],
        "failed_text": [node.text for node in nodes if node.status == "failed"],
        "xml_text_nodes": [asdict(node) for node in nodes],
    }
    out_json.parent.mkdir(parents=True, exist_ok=True)
    out_json.write_text(json.dumps(data, indent=2), encoding="utf-8")
    ocr_lines = ["# full screenshot OCR", full_ocr, "", "# crop OCR"]
    for idx, node in enumerate(nodes, 1):
        ocr_lines.append(f"{idx}. xml={node.text!r} status={node.status} score={node.match_score:.2f}")
        ocr_lines.append(f"   crop_ocr={node.crop_ocr!r}")
    out_ocr.write_text("\n".join(ocr_lines), encoding="utf-8")
    draw_overlay(image, nodes, issues, out_overlay)
    return 2 if status == "failed" and args.required else 0


def self_test(args: argparse.Namespace) -> int:
    imports = {"PIL": True, "cv2": True, "numpy": True}
    result = {"imports": imports, "tesseract": None}
    if args.tesseract:
        image = Image.new("RGB", (220, 80), "white")
        draw = ImageDraw.Draw(image)
        draw.text((10, 25), "Start game", fill="black")
        text = run_tesseract(args.tesseract, preprocess_for_ocr(image, scale=3), "6", args.ocr_timeout)
        result["tesseract"] = {"text": text, "score": token_score("Start game", text)}
        if token_score("Start game", text) < 0.6:
            print(json.dumps(result, indent=2))
            return 2
    print(json.dumps(result, indent=2))
    return 0


def contact_sheet(args: argparse.Namespace) -> int:
    image_args = list(args.images)
    if args.list_file:
        image_args.extend(Path(args.list_file).read_text(encoding="utf-8").splitlines())
    images = [Path(p) for p in image_args if p and Path(p).exists()]
    if not images:
        return 0
    thumbs: list[tuple[Path, Image.Image]] = []
    thumb_w = args.thumb_width
    thumb_h = args.thumb_height
    for path in images:
        img = Image.open(path).convert("RGB")
        img.thumbnail((thumb_w, thumb_h), Image.Resampling.LANCZOS)
        canvas = Image.new("RGB", (thumb_w, thumb_h + 22), "white")
        canvas.paste(img, ((thumb_w - img.width) // 2, 0))
        draw = ImageDraw.Draw(canvas)
        draw.text((2, thumb_h + 4), path.name[:42], fill="black")
        thumbs.append((path, canvas))
    cols = max(1, args.columns)
    rows = math.ceil(len(thumbs) / cols)
    sheet = Image.new("RGB", (cols * thumb_w, rows * (thumb_h + 22)), "white")
    for idx, (_, thumb) in enumerate(thumbs):
        x = (idx % cols) * thumb_w
        y = (idx // cols) * (thumb_h + 22)
        sheet.paste(thumb, (x, y))
    output = Path(args.output)
    output.parent.mkdir(parents=True, exist_ok=True)
    sheet.save(output)
    return 0


def audit_html(args: argparse.Namespace) -> int:
    json_args = list(args.json_files)
    if args.list_file:
        json_args.extend(Path(args.list_file).read_text(encoding="utf-8").splitlines())
    json_files = [Path(p) for p in json_args if p and Path(p).exists()]
    rows = []
    for path in json_files:
        data = json.loads(path.read_text(encoding="utf-8"))
        screenshot = Path(data["screenshot"])
        overlay = path.with_suffix(".overlay.png")
        if not overlay.exists():
            overlay = screenshot.with_name(screenshot.stem + ".overlay.png")
        issues = "<br>".join(html.escape(issue) for issue in data.get("issues", []))
        verified = "<br>".join(html.escape(t) for t in data.get("verified_text", [])[:12])
        partial = "<br>".join(html.escape(t) for t in data.get("partial_text", [])[:12])
        rows.append(
            f"<tr><td>{html.escape(screenshot.name)}</td>"
            f"<td>{html.escape(data.get('text_status', ''))}</td>"
            f"<td><img src='{html.escape(str(overlay.relative_to(Path(args.base_dir))))}'></td>"
            f"<td><b>Verified</b><br>{verified}<br><b>Partial</b><br>{partial}</td>"
            f"<td>{issues}</td></tr>"
        )
    doc = textwrap.dedent(
        """\
        <!doctype html>
        <html>
        <head>
          <meta charset="utf-8">
          <style>
            body {{ font-family: Segoe UI, Arial, sans-serif; margin: 16px; }}
            table {{ border-collapse: collapse; width: 100%; }}
            td, th {{ border: 1px solid #ccc; padding: 6px; vertical-align: top; }}
            img {{ max-width: 480px; image-rendering: pixelated; }}
          </style>
        </head>
        <body>
          <h1>JCS2 text/visual audit</h1>
          <table>
            <tr><th>Step</th><th>Status</th><th>Overlay</th><th>Text</th><th>Issues</th></tr>
            {rows}
          </table>
        </body>
        </html>
        """
    ).format(rows="\n".join(rows))
    output = Path(args.output)
    output.write_text(doc, encoding="utf-8")
    return 0


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description=__doc__)
    sub = parser.add_subparsers(dest="command", required=True)

    extract_p = sub.add_parser("extract")
    extract_p.add_argument("--screenshot", required=True)
    extract_p.add_argument("--xml")
    extract_p.add_argument("--out-json", required=True)
    extract_p.add_argument("--out-ocr", required=True)
    extract_p.add_argument("--out-overlay", required=True)
    extract_p.add_argument("--tesseract", required=True)
    extract_p.add_argument("--expect-width", type=int, default=480)
    extract_p.add_argument("--expect-height", type=int, default=320)
    extract_p.add_argument("--required", action="store_true")
    extract_p.add_argument("--require-text", action="append", default=[])
    extract_p.add_argument("--match-threshold", type=float, default=0.62)
    extract_p.add_argument("--ocr-timeout", type=int, default=20)
    extract_p.set_defaults(func=extract)

    self_p = sub.add_parser("self-test")
    self_p.add_argument("--tesseract", required=True)
    self_p.add_argument("--ocr-timeout", type=int, default=20)
    self_p.set_defaults(func=self_test)

    sheet_p = sub.add_parser("contact-sheet")
    sheet_p.add_argument("--output", required=True)
    sheet_p.add_argument("--columns", type=int, default=3)
    sheet_p.add_argument("--thumb-width", type=int, default=240)
    sheet_p.add_argument("--thumb-height", type=int, default=160)
    sheet_p.add_argument("--list-file")
    sheet_p.add_argument("images", nargs="*")
    sheet_p.set_defaults(func=contact_sheet)

    html_p = sub.add_parser("audit-html")
    html_p.add_argument("--output", required=True)
    html_p.add_argument("--base-dir", required=True)
    html_p.add_argument("--list-file")
    html_p.add_argument("json_files", nargs="*")
    html_p.set_defaults(func=audit_html)
    return parser


def main(argv: list[str]) -> int:
    parser = build_parser()
    args = parser.parse_args(argv)
    return int(args.func(args))


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
