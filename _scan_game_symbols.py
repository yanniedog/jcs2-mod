#!/usr/bin/env python3
import re
import sys

path = sys.argv[1] if len(sys.argv) > 1 else r"decompiled/lib/arm64-v8a/libtrueaxis.so"
with open(path, "rb") as f:
    data = f.read()

keywords = [b"Level", b"Lap", b"Race", b"NumLap", b"GetUserLevel"]
seen = set()
for match in re.finditer(rb"[\x20-\x7e]{4,}", data):
    s = match.group(0)
    if not s.startswith(b"_ZN"):
        continue
    if not any(k in s for k in keywords):
        continue
    text = s.decode("ascii", "replace")
    if text in seen:
        continue
    seen.add(text)
    print(text)
