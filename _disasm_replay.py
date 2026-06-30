from elftools.elf.elffile import ELFFile
from capstone import Cs, CS_ARCH_ARM64, CS_MODE_LITTLE_ENDIAN

PATH = "decompiled/lib/arm64-v8a/libtrueaxis.so"
elf = ELFFile(open(PATH, "rb"))
text = elf.get_section_by_name(".text")
base = text["sh_addr"]
data = text.data()
md = Cs(CS_ARCH_ARM64, CS_MODE_LITTLE_ENDIAN)
md.detail = True


def sym(name):
    for sn in (".dynsym", ".symtab"):
        s = elf.get_section_by_name(sn)
        if not s:
            continue
        for x in s.iter_symbols():
            if x.name == name:
                return x["st_value"]
    return None


def disasm(name, max_insns=80):
    addr = sym(name)
    if addr is None:
        print(f"-- {name}: not found")
        return
    print(f"\n==== {name} @ 0x{addr:x} ====")
    off = addr - base
    count = 0
    for insn in md.disasm(data[off : off + 0x400], addr):
        print(f"0x{insn.address:x}: {insn.mnemonic:8} {insn.op_str}")
        count += 1
        if insn.mnemonic == "ret" and count > 5:
            break
        if count >= max_insns:
            print("... truncated")
            break


for fn in (
    "_ZN4Game18GetLocalReplayDataEiiii",
    "_ZN4Game10ViewReplayEPhPc",
    "_ZN4Game11RenderGhostEv",
    "_ZN6Replay11UpdateGhostEf",
    "_ZN3Car11RenderGhostERKN2TA6MFrameE",
    "_ZN6Replay29ReplayDecompressAndSetUpGhostEv",
    "_ZN6Replay17GetGhostTransformEv",
    "_ZN6Replay4LoadEPKc",
):
    disasm(fn, 60)
