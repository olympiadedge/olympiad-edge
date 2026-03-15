# CLAUDE.md — Project Instructions for Claude Code

## What This Is
Putnam Linear Algebra handout for Olympiad Edge. Self-study edition targeting Putnam honorable mention (48+ points). ADHD-optimized with escalating hints, TLDR theorem cards, and pattern-first pedagogy.

## Build
```bash
python build.py          # concatenates all .typ files → compiles PDF
python build.py --check  # concatenate only, no compile
```
Output: `Putnam_Linear_Algebra_Olympiad_Edge.pdf`

## Architecture
- `preamble.typ` contains ALL macros, styling, theorem environments (via ctheorems), title page, and TOC.
- `build.py` concatenates all chapter files (in order) into `_build.typ`, then runs `typst compile`.
- Chapter files are self-contained content — no imports or cross-references.

## File Naming Convention
- `ch##-topic.typ` — content chapters
- `formula-sheet.typ` — reference sheet

## Editing Rules
1. **Always run `python build.py` after editing** to verify compilation.
2. **Typst gotchas to avoid:**
   - `$ab$` is parsed as variable `ab`, not `a*b`. Write `$a b$` with a space.
   - `bold(a, b)` fails — `bold` takes one argument. Use `bold("a, b")` for multi-value.
   - `*text*` inside `$math$` doesn't make bold — it's multiplication.
   - Forward slashes in `*bold*` context: use `\/` to escape.
3. **Macro reference** (defined in `preamble.typ`):
   - `#conceptbox(title: "...")[...]` — navy concept box
   - `#trickbox[...]` — gold pattern trigger box
   - `#trapbox[...]` — red common trap box
   - `#tldr[...]` — green one-line theorem summary
   - `#stratbox[...]` — purple strategy box
   - `#prob(n)[...]` — numbered problem
   - `#putnam(year, "A1")[...]` — tagged Putnam problem
   - `#hint(n)[...]` — escalating hint (n = 1, 2, 3)
   - `#solution[...]` — green-bordered solution
   - `#drill-header("Title")` — navy/gold drill section header
   - `#difficulty(1|2|3)` — star rating (1=A1-A2, 2=A3-B3, 3=B4-B6)
   - `#theorem[...]`, `#lemma[...]`, `#definition[...]`, `#proof[...]` — formal environments

## Style Guidelines
- **Reverse-engineer format**: Problem → Pattern Trigger → Escalating Hints → TLDR of theorem → Full Solution
- **ADHD-optimized**: Pattern recognition first, concise TLDR, escalating hints (3 levels)
- **Difficulty starred**: ★☆☆ A1-A2, ★★☆ A3-B3, ★★★ B4-B6
- **Colors**: Navy #1B2A4A, Gold #C5963A, consistent throughout
- **Branding**: "OLYMPIAD EDGE" in headers

## Answer Verification
When adding new problems, flag any answer you're less than 100% confident about with a "VERIFY" comment so the author can spot-check.

## Git Workflow
After any edit:
```bash
python build.py
git add -A
git commit -m "descriptive message"
```
