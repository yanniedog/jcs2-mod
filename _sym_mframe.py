from elftools.elf.elffile import ELFFile

elf = ELFFile(open("decompiled/lib/arm64-v8a/libtrueaxis.so", "rb"))
for sn in (".dynsym", ".symtab"):
    s = elf.get_section_by_name(sn)
    if not s:
        continue
    for x in s.iter_symbols():
        n = x.name or ""
        if "MFrame" in n or "GhostTransform" in n or "SetOrient" in n:
            print(n)
