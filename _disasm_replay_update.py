from elftools.elf.elffile import ELFFile
from capstone import Cs, CS_ARCH_ARM64, CS_MODE_LITTLE_ENDIAN

PATH = "decompiled/lib/arm64-v8a/libtrueaxis.so"
elf = ELFFile(open(PATH, "rb"))
text = elf.get_section_by_name(".text")
base = text["sh_addr"]
data = text.data()
md = Cs(CS_ARCH_ARM64, CS_MODE_LITTLE_ENDIAN)
md.detail = False

got = {}
for rs in (".rela.dyn", ".rela.plt"):
    s = elf.get_section_by_name(rs)
    if not s:
        continue
    st = elf.get_section(s["sh_link"])
    for r in s.iter_relocations():
        nm = st.get_symbol(r["r_info_sym"]).name
        if nm:
            got[r["r_offset"]] = nm

sym_addr = {}
for sn in (".dynsym", ".symtab"):
    s = elf.get_section_by_name(sn)
    if not s:
        continue
    for x in s.iter_symbols():
        if x.name:
            sym_addr[x.name] = x["st_value"]

addr = sym_addr["_ZN6Replay6UpdateEP3Carfi"]
off = addr - base
adrp_regs = {}
print(f"Replay::Update @ {addr:#x}")
for insn in md.disasm(data[off : off + 0x500], addr):
    print(f"{insn.address:#x}: {insn.mnemonic:8} {insn.op_str}")
    if insn.mnemonic == "ret":
        break
