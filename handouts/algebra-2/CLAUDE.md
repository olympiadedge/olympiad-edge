# CLAUDE.md — Project Instructions for Claude Code

## What This Is
Algebra II competition math handout for Olympiad Edge. Self-study edition targeting AMC 12 Honor Roll / AIME qualification. ADHD-optimized with escalating hints, TLDR theorem cards, and pattern-first pedagogy.

## Build
```bash
python build.py          # concatenates all .typ files → compiles PDF
python build.py --check  # concatenate only, no compile
```
Output: `Algebra_II_Olympiad_Edge.pdf`

## Architecture
- `preamble.typ` contains ALL macros, styling, theorem environments (via ctheorems), title page, and TOC.
- `build.py` concatenates all chapter files (in order) into `_build.typ`, then runs `typst compile`.
- Chapter files are self-contained content — no imports or cross-references.

## File Naming Convention
- `ch##-topic.typ` — content chapters
- `formula-sheet.typ` — reference sheet

## Chapters
1. `ch01-polynomials.typ` — Polynomials, Vieta's, Newton's sums
2. `ch02-quadratics.typ` — Quadratics, discriminant, optimization
3. `ch03-sequences-series.typ` — Arithmetic, geometric, telescoping, recursions
4. `ch04-exponents-logs.typ` — Exponents and logarithms
5. `ch05-complex-numbers.typ` — Complex numbers, polar form, roots of unity
6. `ch06-inequalities.typ` — AM-GM, Cauchy-Schwarz, Power Mean
7. `ch07-special-factorizations.typ` — SFFT, Sophie Germain, sum/diff of powers
8. `ch08-functions.typ` — Composition, inverses, functional equations
9. `ch09-floor-ceiling.typ` — Floor, ceiling, fractional part
10. `ch10-competition-problems.typ` — Mixed AMC/AIME problems

## Editing Rules
1. **Always run `python build.py` after editing** to verify compilation.
2. **Typst gotchas to avoid:**
   - `$ab$` is parsed as variable `ab`, not `a*b`. Write `$a b$` with a space.
   - `bold(a, b)` fails — `bold` takes one argument. Use `bold("a, b")` for multi-value.
   - `*text*` inside `$math$` doesn't make bold — it's multiplication.
3. **Macro reference** (defined in `preamble.typ`):
   - `#conceptbox(title: "...")[...]` — navy concept box
   - `#trickbox[...]` — gold pattern trigger box
   - `#trapbox[...]` — red common trap box
   - `#tldr[...]` — green one-line theorem summary
   - `#stratbox[...]` — purple strategy box
   - `#prob(n)[...]` — numbered problem
   - `#amc(year, "A1")[...]` — tagged AMC problem
   - `#aime(year, id)[...]` — tagged AIME problem
   - `#hint(n)[...]` — escalating hint (n = 1, 2, 3)
   - `#solution[...]` — green-bordered solution
   - `#drill-header("Title")` — navy/gold drill section header
   - `#difficulty(1|2|3)` — star rating (1=AMC 10, 2=AMC 12, 3=AIME)
   - `#theorem[...]`, `#lemma[...]`, `#definition[...]`, `#proof[...]` — formal environments

## Style Guidelines
- **Reverse-engineer format**: Problem → Pattern Trigger → Escalating Hints → TLDR of theorem → Full Solution
- **ADHD-optimized**: Pattern recognition first, concise TLDR, escalating hints (3 levels)
- **Difficulty starred**: ★☆☆ AMC 10, ★★☆ AMC 12, ★★★ AIME
- **Colors**: Navy #1B2A4A, Gold #C5963A, consistent throughout
- **Branding**: "OLYMPIAD EDGE" in headers

## Answer Verification
When adding new problems, flag any answer you're less than 100% confident about with a "VERIFY" comment so the author can spot-check.
