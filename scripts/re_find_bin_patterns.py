#!/usr/bin/env python3
import re

d = open("decompiled/lib/arm64-v8a/libtrueaxis.so", "rb").read()
for m in re.finditer(rb"[a-zA-Z_][a-zA-Z0-9_%.]{2,30}\.bin", d):
    s = m.group().decode("ascii", "ignore")
    if any(k in s.lower() for k in ("replay", "score", "ghost", "r%")) or "%" in s:
        print(hex(m.start()), s)
