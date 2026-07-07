#!/usr/bin/env python3
from elftools.elf.elffile import ELFFile

f = open("decompiled/lib/arm64-v8a/libtrueaxis.so", "rb")
e = ELFFile(f)
for sec in e.iter_sections():
    if sec["sh_type"] not in ("SHT_DYNSYM", "SHT_SYMTAB"):
        continue
    for sym in sec.iter_symbols():
        n = sym.name
        if "g_leaderboard" in n or "g_p" in n and "Level" in n:
            print(n, hex(sym.entry.st_value), sym.entry.st_info.type)
f.close()
