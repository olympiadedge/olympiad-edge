// ════════════════════════════════════════════════════════════
// Chapter 6 — Trigonometry Speed
// ════════════════════════════════════════════════════════════

= Trigonometry Speed

#tldr[Most NYSMATYC trig problems are unit circle lookups, identity applications, or inverse trig compositions. Memorize the table, know the key identities, and always draw the triangle for inverse trig.]

== Unit Circle Values You Must Have Memorized

#speedbox[
  You need these *cold* — no derivation, no thinking. If you have to re-derive $cos(pi / 6)$ during the test, you are losing time.

  #align(center)[
    #table(
      columns: 6,
      stroke: 0.5pt,
      inset: 5pt,
      [$theta$], [$0$], [$pi / 6$], [$pi / 4$], [$pi / 3$], [$pi / 2$],
      [$sin theta$], [$0$], [$1 / 2$], [$sqrt(2) / 2$], [$sqrt(3) / 2$], [$1$],
      [$cos theta$], [$1$], [$sqrt(3) / 2$], [$sqrt(2) / 2$], [$1 / 2$], [$0$],
      [$tan theta$], [$0$], [$sqrt(3) / 3$], [$1$], [$sqrt(3)$], [undef],
    )
  ]
]

#trickbox[*The $sqrt(1), sqrt(2), sqrt(3)$ pattern.* For sine at $0, pi / 6, pi / 4, pi / 3, pi / 2$: the numerators are $sqrt(0), sqrt(1), sqrt(2), sqrt(3), sqrt(4)$ — all over 2. Cosine is the reverse.]

#trapbox[Radians vs. degrees — always check which the problem uses. On NYSMATYC, both appear. If your calculator is in the wrong mode, you get garbage. *Check your mode before every trig calculation.*]

== Key Identities for Speed

=== Pythagorean Identities

$ sin^2 theta + cos^2 theta &= 1 \
  1 + tan^2 theta &= sec^2 theta \
  1 + cot^2 theta &= csc^2 theta $

=== Double Angle Formulas

$ sin(2 theta) &= 2 sin theta cos theta \
  cos(2 theta) &= cos^2 theta - sin^2 theta = 2 cos^2 theta - 1 = 1 - 2 sin^2 theta $

#speedbox[
  *The three forms of $cos(2 theta)$* are all useful. Pick whichever eliminates a variable:
  - Know $cos theta$ only? Use $2 cos^2 theta - 1$.
  - Know $sin theta$ only? Use $1 - 2 sin^2 theta$.
  - Know both? Use $cos^2 theta - sin^2 theta$.
]

=== Sum and Difference Formulas

$ sin(alpha plus.minus beta) &= sin alpha cos beta plus.minus cos alpha sin beta \
  cos(alpha plus.minus beta) &= cos alpha cos beta minus.plus sin alpha sin beta $

#trickbox[*Sum-to-product shortcut.* $sin 75° = sin(45° + 30°)$. Use the addition formula. But on a calculator-allowed test: *just type it in.* Save the formulas for when the problem asks for an exact value.]

=== Half-Angle (Occasionally Useful)

$ sin(theta / 2) = plus.minus sqrt((1 - cos theta) / 2), quad cos(theta / 2) = plus.minus sqrt((1 + cos theta) / 2) $

== Inverse Trig Shortcuts

#speedbox[
  *THE method for inverse trig compositions: DRAW THE RIGHT TRIANGLE.*

  To evaluate $sin(arctan(3 / 4))$:
  1. Let $theta = arctan(3 / 4)$, so $tan theta = 3 / 4$.
  2. Draw a right triangle: opposite $= 3$, adjacent $= 4$.
  3. Hypotenuse $= sqrt(9 + 16) = 5$.
  4. Read off: $sin theta = 3 / 5$. *Done.*

  This works for *every* composition of trig with inverse trig. No formulas needed.
]

#trapbox[*Range restrictions matter.* $arcsin$ returns values in $[-pi / 2, pi / 2]$, $arccos$ in $[0, pi]$, $arctan$ in $(-pi / 2, pi / 2)$. If a problem asks for $arcsin(sin(5 pi / 6))$, the answer is NOT $5 pi / 6$ — it's $pi / 6$, because $arcsin$ must return a value in $[-pi / 2, pi / 2]$.]

Common compositions to recognize instantly:

#conceptbox(title: "Inverse Trig Compositions")[
  - $sin(arccos x) = sqrt(1 - x^2)$ #h(2em) (draw triangle: adjacent $= x$, hyp $= 1$)
  - $cos(arcsin x) = sqrt(1 - x^2)$ #h(2em) (same triangle)
  - $tan(arcsin x) = x / sqrt(1 - x^2)$
  - $sin(arctan x) = x / sqrt(1 + x^2)$
  - $cos(arctan x) = 1 / sqrt(1 + x^2)$
]

== Solving Trig Equations

#speedbox[
  *Step 1:* Get one trig function isolated (factor, use identities).\
  *Step 2:* Solve for the angle using unit circle or calculator.\
  *Step 3:* List all solutions in the given interval.

  On MC tests, *back-solve*: plug each answer choice into the equation.
]

#trickbox[*Factoring trig equations.* Treat $sin theta$ like a variable. Example: $2 sin^2 theta - sin theta - 1 = 0$ factors as $(2 sin theta + 1)(sin theta - 1) = 0$. So $sin theta = -1 / 2$ or $sin theta = 1$.]

#trapbox[*Don't divide by trig functions.* If you divide $sin theta cos theta = sin theta$ by $sin theta$, you lose the solutions where $sin theta = 0$. Instead, move everything to one side: $sin theta cos theta - sin theta = 0$, then $sin theta (cos theta - 1) = 0$.]

== Law of Sines and Cosines

#conceptbox(title: "When to Use Which")[
  *Law of Sines:* $a / sin A = b / sin B = c / sin C$\
  Use when you know an angle and its opposite side plus one other piece.

  *Law of Cosines:* $c^2 = a^2 + b^2 - 2 a b cos C$\
  Use when you know two sides and the included angle (SAS) or all three sides (SSS).
]

#speedbox[
  *Quick decision:* Given SAS or SSS → Law of Cosines. Given AAS or ASA → Law of Sines. Given SSA → Law of Sines (watch for the ambiguous case).
]

#trickbox[*Area shortcut:* Area $= 1 / 2 dot a b sin C$. This is faster than finding the height when you have SAS.]

== Calculator Tricks for Trig

#speedbox[
  *When the problem asks for a decimal or a numerical answer, just compute directly.* Don't waste time on exact values when the calculator gives you the answer in 5 seconds.

  - Verify mode (degree vs. radian) *before* computing.
  - For $arcsin$, $arccos$, $arctan$: use the $sin^(-1)$, $cos^(-1)$, $tan^(-1)$ buttons.
  - For $sec theta$: compute $1 / cos theta$. There is no sec button on most calculators.
  - For exact-value problems: compute the decimal, then match to the answer choices.
]

#stratbox[
  *NYSMATYC Trig Decision Tree:*
  - Evaluate trig at standard angle → unit circle lookup (instant)
  - Inverse trig composition → *draw the right triangle* (30 seconds)
  - Solve trig equation → factor, then unit circle or calculator
  - Triangle problem → Law of Sines (AAS/ASA) or Law of Cosines (SAS/SSS)
  - Decimal answer needed → calculator (5 seconds)
  - Identity simplification → Pythagorean or double angle
]

== Speed Drill — Trigonometry

#drill-header[Trigonometry]

#prob(1)[#difficulty(1) What is the exact value of $sin(5 pi / 6)$?]
#mcq[$1 / 2$][$-1 / 2$][$sqrt(3) / 2$][$-sqrt(3) / 2$][$sqrt(2) / 2$]

#speedsolution("10s")[$5 pi / 6$ is in Q2, reference angle $pi / 6$. Sine is positive in Q2. $sin(5 pi / 6) = sin(pi / 6) = bold(1 / 2)$. Answer: *(A)*.]

#prob(2)[#difficulty(1) Find $cos(arcsin(3 / 5))$.]
#mcq[$3 / 5$][$4 / 5$][$5 / 3$][$4 / 3$][$3 / 4$]

#speedsolution("20s")[Draw the triangle: $sin theta = 3 / 5$ means opposite $= 3$, hypotenuse $= 5$, so adjacent $= 4$. Then $cos theta = bold(4 / 5)$. Answer: *(B)*.]

#prob(3)[#difficulty(1) If $tan theta = 2$ and $theta$ is in the first quadrant, find $sin theta$.]
#mcq[$2 sqrt(5) / 5$][$sqrt(5) / 5$][$2 / 3$][$1 / 2$][$sqrt(5) / 2$]

#speedsolution("20s")[Draw triangle: opposite $= 2$, adjacent $= 1$, hypotenuse $= sqrt(5)$. So $sin theta = 2 / sqrt(5) = bold(2 sqrt(5) / 5)$. Answer: *(A)*.]

#prob(4)[#difficulty(1) Simplify: $sin^2 theta + cos^2 theta + tan^2 theta$.]
#mcq[$1 + tan^2 theta$][$sec^2 theta$][$1$][$2$][$csc^2 theta$]

#speedsolution("10s")[$sin^2 theta + cos^2 theta = 1$, so the expression is $1 + tan^2 theta = bold(sec^2 theta)$. Both *(A)* and *(B)* are the same thing. Answer: *(B)*.]

#prob(5)[#difficulty(2) Find the exact value of $sin 75°$.]
#mcq[$(sqrt(6) + sqrt(2)) / 4$][$(sqrt(6) - sqrt(2)) / 4$][$sqrt(3) / 2$][$( 1 + sqrt(3)) / 2$][$sqrt(2) / 2$]

#speedsolution("30s")[$sin 75° = sin(45° + 30°) = sin 45° cos 30° + cos 45° sin 30° = (sqrt(2) / 2)(sqrt(3) / 2) + (sqrt(2) / 2)(1 / 2) = bold((sqrt(6) + sqrt(2)) / 4)$. Answer: *(A)*.]

#prob(6)[#difficulty(2) Solve $2 sin^2 x - 3 sin x + 1 = 0$ for $x in [0, 2 pi)$. How many solutions?]
#mcq[$2$][$3$][$4$][$1$][$5$]

#speedsolution("40s")[Factor: $(2 sin x - 1)(sin x - 1) = 0$. So $sin x = 1 / 2$ or $sin x = 1$. $sin x = 1 / 2$: $x = pi / 6, 5 pi / 6$ (2 solutions). $sin x = 1$: $x = pi / 2$ (1 solution). Total: $bold(3)$. Answer: *(B)*.]

#prob(7)[#difficulty(2) In triangle $A B C$, $a = 8$, $b = 5$, $C = 60°$. Find $c$.]
#mcq[$7$][$sqrt(89)$][$sqrt(69)$][$sqrt(49)$][$sqrt(59)$]

#speedsolution("30s")[Law of Cosines: $c^2 = a^2 + b^2 - 2 a b cos C = 64 + 25 - 2(8)(5)(1 / 2) = 89 - 40 = 49$. So $c = bold(7)$. Answer: *(A)*.]

#prob(8)[#difficulty(2) Find $tan(arccos(5 / 13))$.]
#mcq[$5 / 12$][$12 / 5$][$13 / 12$][$12 / 13$][$5 / 13$]

#speedsolution("20s")[Draw triangle: adjacent $= 5$, hypotenuse $= 13$, opposite $= 12$. So $tan theta = bold(12 / 5)$. Answer: *(B)*.]

#prob(9)[#difficulty(3) If $sin x + cos x = 7 / 5$, find $sin(2 x)$.]
#mcq[$24 / 25$][$7 / 25$][$49 / 25$][$48 / 50$][$1$]

#speedsolution("25s")[Square both sides: $sin^2 x + 2 sin x cos x + cos^2 x = 49 / 25$. Since $sin^2 x + cos^2 x = 1$: $1 + 2 sin x cos x = 49 / 25$. So $sin(2 x) = 2 sin x cos x = 49 / 25 - 1 = bold(24 / 25)$. Answer: *(A)*.]

#prob(10)[#difficulty(3) Find the exact value of $arctan(1) + arctan(2) + arctan(3)$.]
#mcq[$pi$][$3 pi / 4$][$pi / 2$][$5 pi / 4$][$2 pi / 3$]

#speedsolution("45s")[We know $arctan(1) = pi / 4$. Use the identity: $arctan(a) + arctan(b) = arctan((a + b) / (1 - a b)) + pi$ when $a b > 1$. For $a = 2, b = 3$: $a b = 6 > 1$, so $arctan(2) + arctan(3) = arctan((5) / (-5)) + pi = arctan(-1) + pi = -pi / 4 + pi = 3 pi / 4$. Total: $pi / 4 + 3 pi / 4 = bold(pi)$. Answer: *(A)*.]
