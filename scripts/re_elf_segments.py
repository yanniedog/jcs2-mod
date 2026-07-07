#!/usr/bin/env python3
from elftools.elf.elffile import ELFFile

e = ELFFile(open("decompiled/lib/arm64-v8a/libtrueaxis.so", "rb"))
for i, seg in enumerate(e.iter_segments()):
    if seg["p_type"] == "PT_LOAD":
        print(
            i,
            hex(seg["p_vaddr"]),
            hex(seg["p_offset"]),
            hex(seg["p_filesz"]),
            hex(seg["p_memsz"]),
            seg["p_flags"],
        )
