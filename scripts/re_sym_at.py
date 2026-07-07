#!/usr/bin/env python3
from elftools.elf.elffile import ELFFile

TARGET = 0xc1420
f = open("decompiled/lib/arm64-v8a/libtrueaxis.so", "rb")
e = ELFFile(f)
for sec in e.iter_sections():
    if sec["sh_type"] not in ("SHT_DYNSYM", "SHT_SYMTAB"):
        continue
    for sym in sec.iter_symbols():
        v = sym.entry.st_value
        s = sym.entry.st_size
        if v and s and v <= TARGET < v + s:
            print(sym.name, hex(v), hex(s))
f.close()
