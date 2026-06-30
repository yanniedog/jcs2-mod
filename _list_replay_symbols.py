import struct
from pathlib import Path

data = Path("decompiled/lib/arm64-v8a/libtrueaxis.so").read_bytes()
section_offset = struct.unpack_from("<Q", data, 0x28)[0]
section_size = struct.unpack_from("<H", data, 0x3A)[0]
section_count = struct.unpack_from("<H", data, 0x3C)[0]
sections = [
    struct.unpack_from("<IIQQQQIIQQ", data, section_offset + i * section_size)
    for i in range(section_count)
]
keywords = ("ghost", "replay", "swarm", "showreplay")
for sec in sections:
    _, stype, _, _, sym_off, sym_sz, str_idx, _, _, entsz = sec
    if stype not in (2, 11) or entsz == 0:
        continue
    str_off = sections[str_idx][4]
    for off in range(sym_off, sym_off + sym_sz, entsz):
        name_off, _, _, _, val, _ = struct.unpack_from("<IBBHQQ", data, off)
        end = data.find(b"\0", str_off + name_off)
        name = data[str_off + name_off : end].decode("ascii", "ignore")
        low = name.lower()
        if any(k in low for k in keywords):
            print(f"{val:#x} {name}")
