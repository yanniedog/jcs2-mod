#!/usr/bin/env python3
from elftools.elf.elffile import ELFFile
from capstone import Cs, CS_ARCH_ARM64, CS_MODE_ARM

SITE = 0x1bc818
f = open("decompiled/lib/arm64-v8a/libtrueaxis.so", "rb")
e = ELFFile(f)
text = e.get_section_by_name(".text")
base = text["sh_addr"]
data = text.data()
md = Cs(CS_ARCH_ARM64, CS_MODE_ARM)
md.detail = True
off = SITE - base
raw = data[off : off + 4]
print("raw", raw.hex())
for ins in md.disasm(raw, SITE):
    print(ins.mnemonic, ins.op_str)
    if ins.operands:
        for op in ins.operands:
            print(" ", op.type, getattr(op, "imm", None))
f.close()
