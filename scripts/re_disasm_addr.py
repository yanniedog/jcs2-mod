#!/usr/bin/env python3
from elftools.elf.elffile import ELFFile
from capstone import Cs, CS_ARCH_ARM64, CS_MODE_ARM

ADDR = 0xc1400
f = open("decompiled/lib/arm64-v8a/libtrueaxis.so", "rb")
e = ELFFile(f)
text = e.get_section_by_name(".text")
base = text["sh_addr"]
data = text.data()
md = Cs(CS_ARCH_ARM64, CS_MODE_ARM)
off = ADDR - base
for ins in md.disasm(data[off : off + 0x80], ADDR):
    print(f"{ins.address:08x}: {ins.mnemonic:7s} {ins.op_str}")
f.close()
