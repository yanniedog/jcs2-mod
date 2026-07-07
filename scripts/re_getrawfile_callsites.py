#!/usr/bin/env python3
from elftools.elf.elffile import ELFFile
from capstone import Cs, CS_ARCH_ARM64, CS_MODE_ARM
from capstone.arm64 import ARM64_INS_BL, ARM64_OP_IMM

PATH = "decompiled/lib/arm64-v8a/libtrueaxis.so"
TARGET = "_Z19TaServer_GetRawFilePKcPFvS0_bPvES1_S0_"

f = open(PATH, "rb")
e = ELFFile(f)
syms = {}
for sec in e.iter_sections():
    if sec["sh_type"] not in ("SHT_DYNSYM", "SHT_SYMTAB"):
        continue
    for sym in sec.iter_symbols():
        if sym.entry.st_value:
            syms[sym.name] = sym.entry.st_value
target = syms[TARGET]
text = e.get_section_by_name(".text")
base = text["sh_addr"]
data = text.data()
md = Cs(CS_ARCH_ARM64, CS_MODE_ARM)
md.detail = True
for sec in e.iter_sections():
    if sec.name != ".text":
        continue
for caller_name, (addr, size) in [(n, (syms[n], 0)) for n in syms if syms[n]]:
    pass

# scan all bl to target
hits = []
for off in range(0, len(data) - 4, 4):
    insn = int.from_bytes(data[off : off + 4], "little")
    if (insn & 0xFC000000) != 0x94000000:
        continue
    imm = insn & 0x03FFFFFF
    if imm & 0x02000000:
        imm |= 0xFC000000
    dest = (base + off + (imm << 2)) & 0xFFFFFFFFFFFFFFFF
    if dest == target:
        hits.append(base + off)

byaddr = {v: k for k, v in syms.items()}
print("call sites:", len(hits))
for site in hits[:8]:
    print(hex(site), byaddr.get(site, "?"))
    off = site - base
    for ins in md.disasm(data[off - 0x30 : off + 4], site - 0x30):
        mark = ">>>" if ins.address == site else "   "
        print(f"{mark} {ins.address:08x}: {ins.mnemonic:7s} {ins.op_str}")
    print()
f.close()
