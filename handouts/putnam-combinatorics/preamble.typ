// Document setup, styling, macros, title page, TOC
#import "@preview/ctheorems:1.1.3": *
#show: thmrules

#set document(title: "Putnam Combinatorics — Olympiad Edge", author: "Olympiad Edge")
#set page(
  paper: "us-letter",
  margin: (top: 0.6in, bottom: 0.55in, left: 0.6in, right: 0.6in),
  header: context {
    if counter(page).get().first() > 2 {
      set text(size: 7pt, fill: rgb("#1B2A4A"))
      grid(
        columns: (1fr, 1fr),
        align(left)[_Olympiad Edge — Putnam Combinatorics_],
        align(right)[_Page #counter(page).display()_],
      )
      line(length: 100%, stroke: 0.4pt + rgb("#1B2A4A"))
    }
  },
  footer: context {
    if counter(page).get().first() > 2 {
      set text(size: 6pt, fill: rgb("#888888"))
      align(center)[© 2026 Olympiad Edge · olympiadedge.academy]
    }
  },
)

#set text(font: "New Computer Modern", size: 10pt)
#set par(justify: true, leading: 0.55em)
#set block(spacing: 0.6em)
#set heading(numbering: "1.1.")
#show heading.where(level: 1): it => {
  pagebreak(weak: true)
  block(
    width: 100%,
    fill: rgb("#1B2A4A"),
    inset: (x: 10pt, y: 8pt),
    radius: 3pt,
    text(fill: white, size: 14pt, weight: "bold")[#it.body]
  )
  v(4pt)
}
#show heading.where(level: 2): it => {
  v(6pt)
  block(
    width: 100%,
    stroke: (bottom: 1.5pt + rgb("#C5963A")),
    inset: (bottom: 3pt),
    text(fill: rgb("#1B2A4A"), size: 11pt, weight: "bold")[#it.body]
  )
  v(3pt)
}
#show heading.where(level: 3): it => {
  v(4pt)
  text(fill: rgb("#C5963A"), size: 10pt, weight: "bold")[#sym.triangle.stroked.r #it.body]
  v(2pt)
}

// ── Color Palette ──
#let navy = rgb("#1B2A4A")
#let gold = rgb("#C5963A")
#let lightgold = rgb("#FFF8EC")
#let lightnavy = rgb("#EBF0F7")
#let green = rgb("#2D6A4F")
#let lightgreen = rgb("#E8F5E9")
#let red = rgb("#C62828")
#let lightred = rgb("#FFEBEE")
#let purple = rgb("#6A1B9A")
#let lightpurple = rgb("#F3E5F5")
#let teal = rgb("#00695C")
#let lightteal = rgb("#E0F2F1")

// ── Theorem Environments (via ctheorems) ──
#let theorem = thmbox("theorem", "Theorem", fill: lightnavy, stroke: (left: 2pt + navy))
#let lemma = thmbox("theorem", "Lemma", fill: lightnavy, stroke: (left: 2pt + navy))
#let corollary = thmbox("theorem", "Corollary", fill: lightnavy, stroke: (left: 2pt + navy))
#let definition = thmbox("definition", "Definition", fill: lightteal, stroke: (left: 2pt + teal))
#let proposition = thmbox("theorem", "Proposition", fill: lightnavy, stroke: (left: 2pt + navy))
#let remark = thmplain("remark", "Remark").with(numbering: none)
#let proof = thmproof("proof", "Proof")

// ── Styled Boxes ──
#let conceptbox(title: "Key Concept", body) = block(
  width: 100%, fill: lightnavy, stroke: 1pt + navy, radius: 3pt, inset: 8pt,
  [#text(fill: navy, weight: "bold", size: 9.5pt)[#title] #v(2pt) #body]
)

#let trickbox(body) = block(
  width: 100%, fill: lightgold, stroke: 1pt + gold, radius: 3pt, inset: 8pt,
  [#text(fill: gold, weight: "bold", size: 9.5pt)[Pattern Trigger] #v(2pt) #body]
)

#let trapbox(body) = block(
  width: 100%, fill: lightred, stroke: 1pt + red, radius: 3pt, inset: 8pt,
  [#text(fill: red, weight: "bold", size: 9.5pt)[Common Trap] #v(2pt) #body]
)

#let tldr(body) = block(
  width: 100%, fill: lightgreen, stroke: 1pt + green, radius: 3pt, inset: 8pt,
  [#text(fill: green, weight: "bold", size: 9.5pt)[TLDR] #v(2pt) #text(size: 9.5pt)[#body]]
)

#let stratbox(body) = block(
  width: 100%, fill: lightpurple, stroke: 1pt + purple, radius: 3pt, inset: 8pt,
  [#text(fill: purple, weight: "bold", size: 9.5pt)[Strategy] #v(2pt) #body]
)

// ── Problem & Solution Macros ──
#let prob(n, body) = block(
  width: 100%, inset: (left: 2pt, y: 2pt),
  [#text(weight: "bold", fill: navy, size: 10pt)[#n.] #body]
)

#let putnam(year, id, body) = block(
  width: 100%, fill: luma(248), stroke: (left: 3pt + gold), inset: (left: 8pt, y: 4pt), radius: (right: 3pt),
  [#text(weight: "bold", fill: navy, size: 10pt)[Putnam #year #id] #h(1fr) #text(fill: gold, size: 8pt, weight: "bold")[COMPETITION] #v(2pt) #body]
)

#let hint(n, body) = block(
  width: 100%, fill: luma(245), inset: 5pt, radius: 2pt,
  [#text(size: 8.5pt, fill: luma(80))[Hint #n: #body]]
)

#let solution(body) = block(
  width: 100%, stroke: (left: 2.5pt + green), inset: (left: 7pt, y: 3pt),
  [#text(size: 9pt)[*Solution.* #body]]
)

#let drill-header(title) = {
  v(4pt)
  block(
    width: 100%, fill: navy, inset: (x: 8pt, y: 5pt), radius: (top: 3pt),
    text(fill: gold, weight: "bold", size: 10pt)[ACTIVE RECALL — #title]
  )
}

#let difficulty(level) = {
  let stars = if level == 1 { "★☆☆" } else if level == 2 { "★★☆" } else { "★★★" }
  let label = if level == 1 { "A1–A2" } else if level == 2 { "A3–B3" } else { "B4–B6" }
  let col = if level == 1 { green } else if level == 2 { gold } else { red }
  text(fill: col, size: 8.5pt, weight: "bold")[#stars #label]
}

// ════════════════════════════════════════════════════════════
// TITLE PAGE
// ════════════════════════════════════════════════════════════
#page(header: none, footer: none, margin: (top: 1.8in, bottom: 1in))[
  #align(center)[
    #block(width: 85%, fill: navy, inset: (x: 24pt, y: 28pt), radius: 8pt)[
      #text(fill: gold, size: 30pt, weight: "bold")[PUTNAM]
      #v(2pt)
      #text(fill: white, size: 18pt)[Combinatorics]
      #v(10pt)
      #line(length: 50%, stroke: 1pt + gold)
      #v(10pt)
      #text(fill: gold, size: 12pt, weight: "bold")[OLYMPIAD EDGE]
      #v(4pt)
      #text(fill: white, size: 10pt)[Competition Mathematics · Self-Study Edition]
    ]
    #v(10pt)
    #block(width: 80%, inset: 12pt)[
      #text(size: 10.5pt, fill: navy)[
        Reverse-engineered solutions with escalating hints. \
        Every theorem invoked gets a one-line TLDR. \
        Pattern recognition first — theory serves the problem.
        #v(8pt)
        *Target: Putnam Honorable Mention (48+ points)*
        #v(6pt)
        #text(size: 9pt, fill: luma(100))[
          Sources: Kedlaya Putnam Archive, Stanley (Enumerative Combinatorics), \
          Evan Chen (Napkin), Yufei Zhao (MIT), AoPS, past Putnam exams 1985–2024.
        ]
      ]
    ]
    #v(12pt)
    #text(size: 9pt, fill: luma(120))[Version 1.0 · March 2026 · For self-study]
  ]
]

// ════════════════════════════════════════════════════════════
// TABLE OF CONTENTS
// ════════════════════════════════════════════════════════════
#set page(header: none, footer: none)
#text(size: 20pt, fill: navy, weight: "bold")[Table of Contents]
#v(4pt)
#outline(indent: 1.5em, depth: 2)

