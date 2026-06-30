import re
from pathlib import Path

path = Path("decompiled/lib/arm64-v8a/libtrueaxis.so")
data = path.read_bytes()
patterns = [
    b"g_pInGameLevelEditor",
    b"g_pLevelEditor",
    b"InGameLevelEditor",
    b"UiFormPause",
]
for pat in patterns:
    hits = set()
    for m in re.finditer(re.escape(pat) + rb"[A-Za-z0-9_]*", data):
        s = m.group().decode("ascii", "ignore")
        if 3 < len(s) < 48:
            hits.add(s)
    print(pat.decode(), ":", sorted(hits))
