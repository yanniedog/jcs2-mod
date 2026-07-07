#!/usr/bin/env python3
data = open("decompiled/lib/arm64-v8a/libtrueaxis.so", "rb").read()
for off in [0x2beda6, 0x2a203f1, 0x2a203c8]:
    end = data.find(b"\x00", off)
    print(hex(off), data[off:end])
