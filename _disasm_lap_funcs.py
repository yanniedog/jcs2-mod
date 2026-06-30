#!/usr/bin/env python3
"""Disassemble Car::SetLap and nearby Level lap-count usage."""
import sys

try:
    from elftools.elf.elffile import ELFFile
    from capstone import Cs, CS_ARCH_ARM64, CS_MODE_ARM
except ImportError as e:
    print(f"missing dependency: {e}", file=sys.stderr)
    sys.exit(1)

path = sys.argv[1] if len(sys.argv) > 1 else r"decompiled/lib/arm64-v8a/libtrueaxis.so"
targets = sys.argv[2:] or [
    "_ZN3Car6SetLapEi",
    "_ZN3Car13GetCurrentLapEv",
    "_ZN4Game14OnRaceFinishedEv",
    "_ZN4Game9LoadLevelEjNS_10DifficultyE",
]

with open(path, "rb") as f:
    elf = ELFFile(f)
    text = elf.get_section_by_name(".text")
    text_addr = text["sh_addr"]
    text_data = text.read()
    dynsym = elf.get_section_by_name(".dynsym")
    addrs = {}
    for sym in dynsym.iter_symbols():
        if sym.name in targets:
            addrs[sym.name] = (sym["st_value"], sym["st_size"])

md = Cs(CS_ARCH_ARM64, CS_MODE_ARM)
md.detail = True

for name in targets:
    if name not in addrs:
        print(f"=== {name}: NOT FOUND ===")
        continue
    addr, size = addrs[name]
    off = addr - text_addr
    chunk = text_data[off : off + max(size, 64)]
    print(f"=== {name} @ 0x{addr:x} size={size} ===")
    for insn in md.disasm(chunk, addr):
        print(f"0x{insn.address:08x}: {insn.mnemonic:8s} {insn.op_str}")
        if insn.address >= addr + size - 4:
            break
    print()
