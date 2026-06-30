import re
from pathlib import Path

data = Path("decompiled/lib/arm64-v8a/libtrueaxis.so").read_bytes()
strings = [s.decode("ascii", "ignore") for s in re.findall(rb"[\x20-\x7e]{4,}", data)]
keywords = ("replay", "score", "saved", "high", ".dat", "/data", "Replays", "Scores")
for text in sorted(set(strings)):
    low = text.lower()
    if any(k.lower() in low for k in keywords):
        print(text)
