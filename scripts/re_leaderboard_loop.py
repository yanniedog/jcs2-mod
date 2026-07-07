#!/usr/bin/env python3
from elftools.elf.elffile import ELFFile
from capstone import Cs, CS_ARCH_ARM64, CS_MODE_ARM

PATH = "decompiled/lib/arm64-v8a/libtrueaxis.so"
START = 0x1bae00
END = 0x1bb120

f = open(PATH, "rb")
e = ELFFile(f)
text = e.get_section_by_name(".text")
base = text["sh_addr"]
data = text.data()
md = Cs(CS_ARCH_ARM64, CS_MODE_ARM)
off = START - base
for ins in md.disasm(data[off : END - base], START):
    print(f"{ins.address:08x}: {ins.mnemonic:7s} {ins.op_str}")
f.close()
