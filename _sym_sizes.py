from elftools.elf.elffile import ELFFile

PATH = "decompiled/lib/arm64-v8a/libtrueaxis.so"
elf = ELFFile(open(PATH, "rb"))

for name in (
    "g_pReplay",
    "FormFactory_ViewReplay",
    "_ZN6Replay16ReplayDecompressEv",
    "_ZN6Replay29ReplayDecompressAndSetUpGhostEv",
    "_ZN11CarGraphics12LoadGhostCarEPKc",
):
    for sn in (".dynsym", ".symtab"):
        s = elf.get_section_by_name(sn)
        if not s:
            continue
        for x in s.iter_symbols():
            if x.name == name:
                print(f"{name} = {x['st_value']:#x} size={x['st_size']}")
                break

# SavedScoreAndReplay size from ViewReplay stride 0x60
print("SavedScoreAndReplay stride guess = 0x60")
