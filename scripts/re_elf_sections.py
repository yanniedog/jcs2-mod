#!/usr/bin/env python3
from elftools.elf.elffile import ELFFile

e = ELFFile(open("decompiled/lib/arm64-v8a/libtrueaxis.so", "rb"))
for s in e.iter_sections():
    if s["sh_flags"] & 0x4:
        print(s.name, hex(s["sh_addr"]), hex(s["sh_offset"]), hex(s["sh_size"]))
