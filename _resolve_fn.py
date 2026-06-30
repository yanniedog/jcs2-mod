from elftools.elf.elffile import ELFFile

PATH = "decompiled/lib/arm64-v8a/libtrueaxis.so"
elf = ELFFile(open(PATH, "rb"))
target = 0xC05D0
for sn in (".dynsym", ".symtab"):
    s = elf.get_section_by_name(sn)
    if not s:
        continue
    for x in s.iter_symbols():
        if x["st_info"]["type"] != "STT_FUNC":
            continue
        if x["st_value"] <= target < x["st_value"] + max(x["st_size"], 1):
            print(f"0x{target:x} in {x.name}")
            break
