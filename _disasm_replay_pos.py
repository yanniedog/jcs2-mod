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

# Map GOT entries
got = {}
for rs in (".rela.dyn",):
    s = elf.get_section_by_name(rs)
    if not s:
        continue
    st = elf.get_section(s["sh_link"])
    for r in s.iter_relocations():
        nm = st.get_symbol(r["r_info_sym"]).name
        if nm and "Replay" in nm or "Ghost" in nm or "g_n" in nm:
            got[r["r_offset"]] = nm

for name in ("g_nReplayPos", "g_nLastReplaySize", "g_nReplaySize", "g_nGhostPos", "g_nLastGhostPos", "g_nGhostSize"):
    print(f"{name} = {sym_addr.get(name, 'missing'):#x}" if name in sym_addr else f"{name} missing")

addr = sym_addr["_ZN6Replay6UpdateEP3Carfi"]
off = addr - base
print(f"\nReplay::Update @ {addr:#x} (first 120 insns with g_ refs)")
for insn in md.disasm(data[off : off + 0x800], addr):
    line = f"{insn.address:#x}: {insn.mnemonic:8} {insn.op_str}"
    if "g_" in line or "#0x5a" in line:
        print(line)
