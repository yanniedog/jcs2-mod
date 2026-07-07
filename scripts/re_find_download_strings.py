#!/usr/bin/env python3
data = open("decompiled/lib/arm64-v8a/libtrueaxis.so", "rb").read()
for s in [b"d=%d", b"scoreId", b"&scoreId", b"GetRawFile", b"replay", b"d="]:
    idx = 0
    while True:
        i = data.find(s, idx)
        if i < 0:
            break
        ctx = data[max(0, i - 20) : i + len(s) + 40]
        print(hex(i), s, repr(ctx))
        idx = i + 1
