#!/usr/bin/env python3
"""
Build script for NYSMATYC Math League Speed Handbook.
Concatenates all chapter .typ files into one, then compiles with Typst.

Usage:
    python3 build.py              # Build full PDF
    python3 build.py --check      # Just concatenate, don't compile
"""

import subprocess
import sys
import os

CHAPTERS = [
    "preamble.typ",
    "ch01-contest-strategy.typ",
    "ch02-algebra-speed.typ",
    "ch03-geometry-speed.typ",
    "ch04-counting-probability.typ",
    "ch05-number-theory.typ",
    "ch06-trig-speed.typ",
    "ch07-functions-graphs.typ",
    "ch08-practice-contest-1.typ",
    "ch09-practice-contest-2.typ",
    "formula-sheet.typ",
]

OUTPUT_TYP = "_build.typ"
OUTPUT_PDF = "NYSMATYC_Speed_Handbook_Olympiad_Edge.pdf"

def build():
    combined = []
    for chapter in CHAPTERS:
        if not os.path.exists(chapter):
            print(f"WARNING: {chapter} not found, skipping")
            continue
        with open(chapter, 'r', encoding='utf-8') as f:
            content = f.read()
        if content.startswith('// ') and '\n' in content:
            first_line = content.split('\n')[0]
            if not first_line.startswith('// =='):
                content = content.split('\n', 1)[1]
        combined.append(f"// ── {chapter} ──\n{content}\n")

    full = '\n'.join(combined)
    with open(OUTPUT_TYP, 'w', encoding='utf-8') as f:
        f.write(full)

    lines = full.count('\n')
    print(f"Concatenated {len(CHAPTERS)} files -> {OUTPUT_TYP} ({lines} lines)")

    if '--check' in sys.argv:
        print("Check mode — skipping compile")
        return

    print(f"Compiling {OUTPUT_TYP} -> {OUTPUT_PDF}...")
    result = subprocess.run(
        ['typst', 'compile', OUTPUT_TYP, OUTPUT_PDF],
        capture_output=True, text=True
    )

    if result.returncode != 0:
        print(f"COMPILE ERROR:\n{result.stderr}\n{result.stdout}")
        sys.exit(1)

    size = os.path.getsize(OUTPUT_PDF) / 1024
    try:
        from pypdf import PdfReader
        pages = len(PdfReader(OUTPUT_PDF).pages)
        print(f"OK: {OUTPUT_PDF}: {pages} pages, {size:.0f} KB")
    except ImportError:
        print(f"OK: {OUTPUT_PDF}: {size:.0f} KB (install pypdf for page count)")

if __name__ == '__main__':
    build()
