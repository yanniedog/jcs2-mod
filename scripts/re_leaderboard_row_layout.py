#!/usr/bin/env python3
"""Disassemble leaderboard row usage in libtrueaxis.so (read-only RE helper)."""
from elftools.elf.elffile import ELFFile
from capstone import Cs, CS_ARCH_ARM64, CS_MODE_ARM
from capstone.arm64 import ARM64_INS_BL, ARM64_OP_IMM

PATH = "decompiled/lib/arm64-v8a/libtrueaxis.so"

def main():
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

    targets = [
        "_ZN21UiFormLevelProperties35PopulateLeaderboardForRealThisTimeEv",
        "_ZN21UiFormLevelProperties10ViewReplayEP15UiControlButton",
        "_ZN21UiFormLevelProperties19OnViewReplayClickedEP15UiControlButton",
    ]
    for fn in targets:
        if fn not in syms:
            print("missing", fn)
            continue
        addr, size = syms[fn]
        off = addr - base
        print("\n##", fn, hex(addr), "size", hex(size))
        for ins in md.disasm(data[off : off + min(size, 0x900)], addr):
            extra = ""
            if ins.id == ARM64_INS_BL and ins.operands and ins.operands[0].type == ARM64_OP_IMM:
                t = ins.operands[0].imm
                extra = " ; " + byaddr.get(t, "") + " " + hex(t)
            if fn.endswith("PopulateLeaderboardForRealThisTimeEv"):
                if ins.mnemonic not in ("ldr", "str", "add", "mov", "bl", "cmp", "cbz", "cbnz"):
                    continue
                if "#0x16" not in ins.op_str and "#0x160" not in ins.op_str and ins.mnemonic != "bl":
                    continue
            print(f"{ins.address:08x}: {ins.mnemonic:7s} {ins.op_str}{extra}")
    f.close()

if __name__ == "__main__":
    main()
