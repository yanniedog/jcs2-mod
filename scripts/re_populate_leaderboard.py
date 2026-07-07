#!/usr/bin/env python3
from elftools.elf.elffile import ELFFile
from capstone import Cs, CS_ARCH_ARM64, CS_MODE_ARM
from capstone.arm64 import ARM64_INS_BL, ARM64_OP_IMM

PATH = "decompiled/lib/arm64-v8a/libtrueaxis.so"
FN = "_ZN21UiFormLevelProperties34PopulateLeaderboardForRealThisTimeEv"

f = open(PATH, "rb")
e = ELFFile(f)
syms = {}
for sec in e.iter_sections():
    if sec["sh_type"] not in ("SHT_DYNSYM", "SHT_SYMTAB"):
        continue
    for sym in sec.iter_symbols():
        if sym.entry.st_value and sym.entry.st_size:
            syms[sym.name] = (sym.entry.st_value, sym.entry.st_size)
byaddr = {v[0]: k for k, v in syms.items()}
text = e.get_section_by_name(".text")
base = text["sh_addr"]
data = text.data()
md = Cs(CS_ARCH_ARM64, CS_MODE_ARM)
md.detail = True
addr, size = syms[FN]
off = addr - base
print("##", FN, hex(addr))
for ins in md.disasm(data[off : off + min(size, 0xa00)], addr):
    extra = ""
    if ins.id == ARM64_INS_BL and ins.operands and ins.operands[0].type == ARM64_OP_IMM:
        t = ins.operands[0].imm
        extra = " ; " + byaddr.get(t, "") + " " + hex(t)
    if ins.mnemonic in ("ldr", "str", "add", "mov", "bl") or any(
        x in ins.op_str for x in ("#0x160", "#0x16c", "#0x168", "#0x164")
    ):
        print(f"{ins.address:08x}: {ins.mnemonic:7s} {ins.op_str}{extra}")
f.close()
