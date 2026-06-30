from elftools.elf.elffile import ELFFile
from capstone import Cs, CS_ARCH_ARM64, CS_MODE_LITTLE_ENDIAN

PATH = "decompiled/lib/arm64-v8a/libtrueaxis.so"
elf = ELFFile(open(PATH, "rb"))
text = elf.get_section_by_name(".text")
base = text["sh_addr"]
data = text.data()
md = Cs(CS_ARCH_ARM64, CS_MODE_LITTLE_ENDIAN)

sym_addr = {}
for sn in (".dynsym", ".symtab"):
    s = elf.get_section_by_name(sn)
    if not s:
        continue
    for x in s.iter_symbols():
        if x.name:
            sym_addr[x.name] = x["st_value"]

addr = sym_addr["_ZN6Replay11UpdateGhostEf"]
off = addr - base
print(f"UpdateGhost @ {addr:#x}")
count = 0
for insn in md.disasm(data[off : off + 0x400], addr):
    print(f"{insn.address:#x}: {insn.mnemonic:8} {insn.op_str}")
    count += 1
    if insn.mnemonic == "ret" and count > 30:
        break
