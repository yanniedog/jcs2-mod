#!/usr/bin/env python3
import re
import sys

path = sys.argv[1] if len(sys.argv) > 1 else r"decompiled/lib/arm64-v8a/libtrueaxis.so"
with open(path, "rb") as f:
    data = f.read()

patterns = [
    rb"Lap[s]?",
    rb"lap[s]?",
    rb"NUM_LAP",
    rb"NumLap",
    rb"num lap",
    rb"Number of laps",
    rb"Track type",
    rb"Circuit",
    rb"Point to point",
]
seen = set()
for match in re.finditer(rb"[\x20-\x7e]{3,}", data):
    s = match.group(0)
    if not any(re.search(p, s) for p in patterns):
        continue
    text = s.decode("ascii", "replace")
    if text in seen:
        continue
    seen.add(text)
    print(text)
