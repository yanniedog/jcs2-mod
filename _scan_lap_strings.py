#!/usr/bin/env python3
import re
import sys

path = sys.argv[1] if len(sys.argv) > 1 else r"decompiled/lib/arm64-v8a/libtrueaxis.so"
with open(path, "rb") as f:
    data = f.read()

seen = set()
for match in re.finditer(rb"[\x20-\x7e]{4,}", data):
    s = match.group(0)
    low = s.lower()
    if b"lap" not in low:
        continue
    text = s.decode("ascii", "replace")
    if text in seen:
        continue
    seen.add(text)
    print(text)
