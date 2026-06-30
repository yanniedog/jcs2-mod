from elftools.elf.elffile import ELFFile

elf = ELFFile(open("decompiled/lib/arm64-v8a/libtrueaxis.so", "rb"))
targets = [0x3378C8, 0x337850, 0x3378A0]
seen = set()
for sn in (".dynsym", ".symtab"):
    s = elf.get_section_by_name(sn)
    if not s:
        continue
    for x in s.iter_symbols():
        v = x["st_value"]
        if v in targets and v not in seen:
            seen.add(v)
            print(f"{x.name} = {v:#x}")

# nearest symbols
for target in (0x3378C8,):
    best = None
    for sn in (".dynsym", ".symtab"):
        s = elf.get_section_by_name(sn)
        if not s:
            continue
        for x in s.iter_symbols():
            v = x["st_value"]
            if v <= target and (best is None or v > best[0]):
                best = (v, x.name)
    print(f"nearest below {target:#x}: {best}")
