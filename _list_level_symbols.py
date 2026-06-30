#!/usr/bin/env python3
"""Find Level-related symbols and lap count fields in libtrueaxis.so."""
import re
import struct
import sys

try:
    from elftools.elf.elffile import ELFFile
except ImportError:
    print("pyelftools not installed", file=sys.stderr)
    sys.exit(1)

path = sys.argv[1] if len(sys.argv) > 1 else r"decompiled/lib/arm64-v8a/libtrueaxis.so"

with open(path, "rb") as f:
    elf = ELFFile(f)
    dynsym = elf.get_section_by_name(".dynsym")
    if dynsym is None:
        print("no dynsym")
        sys.exit(1)
    keywords = (
        b"Level",
        b"Lap",
        b"UserLevel",
        b"Levels_Get",
        b"GetUserLevel",
        b"NumLap",
        b"Race",
        b"Circuit",
    )
    for sym in dynsym.iter_symbols():
        name = sym.name.encode() if isinstance(sym.name, str) else sym.name
        if not name:
            continue
        if not any(k in name for k in keywords):
            continue
        print(f"0x{sym['st_value']:08x} {sym['st_size']:5d} {sym.name}")
