// Formula Sheet: NYSMATYC Quick Reference — Olympiad Edge

#set page(paper: "us-letter", margin: (top: 0.5in, bottom: 0.45in, left: 0.45in, right: 0.45in))
#set text(font: "New Computer Modern", size: 7.5pt)
#set par(justify: true, leading: 0.35em)
#set block(spacing: 0.3em)

#align(center)[#text(size: 13pt, weight: "bold", fill: rgb("#1B2A4A"))[NYSMATYC Quick Reference Sheet]]
#v(1pt)
#align(center)[#text(size: 8pt, fill: rgb("#C5963A"))[+4 correct · --0.5 wrong · 0 blank · 20 questions · 60 minutes · Calculators allowed]]
#v(2pt)
#line(length: 100%, stroke: 0.5pt + rgb("#C5963A"))
#v(3pt)

#let sectitle(body) = {
  v(2pt)
  block(
    width: 100%, fill: rgb("#EBF0F7"), inset: (x: 4pt, y: 2pt), radius: 2pt,
    text(size: 8pt, weight: "bold", fill: rgb("#1B2A4A"))[#body]
  )
  v(1pt)
}

#let mini(body) = text(size: 7pt, fill: luma(60))[#body]

#columns(2, gutter: 10pt)[

#sectitle[ALGEBRA]

*Quadratic Formula:* $x = (-b plus.minus sqrt(b^2 - 4 a c))/(2 a)$

*Discriminant:* $Delta = b^2 - 4 a c$. $Delta > 0$: 2 real. $Delta = 0$: 1 repeated. $Delta < 0$: complex.

*Vieta's (Quadratic):* $r_1 + r_2 = -b\/a$, $quad r_1 r_2 = c\/a$

*Vieta's (Cubic)* $x^3 + p x^2 + q x + r = 0$:
$r_1 + r_2 + r_3 = -p$, $quad sum r_i r_j = q$, $quad r_1 r_2 r_3 = -r$

*Power sums:* $r_1^2 + r_2^2 + r_3^2 = (sum r_i)^2 - 2 sum r_i r_j$

*Difference of squares:* $a^2 - b^2 = (a - b)(a + b)$

*Sum/diff of cubes:* $a^3 plus.minus b^3 = (a plus.minus b)(a^2 minus.plus a b + b^2)$

*Arithmetic series:* $S_n = n(a_1 + a_n)/2$, $quad a_n = a_1 + (n - 1) d$

*Geometric series:* $S_n = a_1(1 - r^n)/(1 - r)$, $quad S_infinity = a_1/(1 - r)$ for $|r| < 1$

*Useful sums:* $sum_(k=1)^n k = n(n+1)/2$, $quad sum_(k=1)^n k^2 = (n(n+1)(2 n+1))/6$

*Log laws:* $log(a b) = log a + log b$, $quad log(a/b) = log a - log b$
$log(a^r) = r log a$, $quad log_b a = (ln a)/(ln b) = 1/(log_a b)$

#sectitle[GEOMETRY]

*Triangle area:* $A = 1/2 dot b h = 1/2 dot a b sin C = sqrt(s(s-a)(s-b)(s-c))$
#mini[where $s = (a + b + c)/2$ (Heron's formula)]

*Trapezoid:* $A = 1/2 (b_1 + b_2) h$

*Circle:* $A = pi r^2$, $quad C = 2 pi r$, $quad "Sector area" = theta/(2 pi) dot pi r^2 = r^2 theta / 2$ #mini[(radians)]

*Regular $n$-gon:* $A = (n s^2)/(4 tan(pi\/n))$ #mini[($s$ = side length)]

*Distance:* $d = sqrt((x_2 - x_1)^2 + (y_2 - y_1)^2)$

*Midpoint:* $M = ((x_1 + x_2)/2, (y_1 + y_2)/2)$

*Slope:* $m = (y_2 - y_1)/(x_2 - x_1)$. Perpendicular slopes: $m_1 m_2 = -1$.

*Circle equation:* $(x - h)^2 + (y - k)^2 = r^2$
#mini[Complete the square from general form $x^2 + y^2 + D x + E y + F = 0$:]
#mini[Center $= (-D\/2, -E\/2)$, $r = sqrt(D^2/4 + E^2/4 - F)$]

*Pick's Theorem:* $A = I + B/2 - 1$ #mini[($I$ = interior lattice pts, $B$ = boundary pts)]

*Shoelace Formula:* $A = 1/2 |sum_(i=1)^n (x_i y_(i+1) - x_(i+1) y_i)|$

#sectitle[TRIGONOMETRY]

*Unit Circle Values:*
#block(inset: (left: 2pt))[
#table(
  columns: (auto, auto, auto, auto),
  inset: 2.5pt,
  stroke: 0.3pt + luma(180),
  [*$theta$*], [*$sin$*], [*$cos$*], [*$tan$*],
  [$0 degree$], [$0$], [$1$], [$0$],
  [$30 degree$], [$1/2$], [$sqrt(3)/2$], [$1/sqrt(3)$],
  [$45 degree$], [$sqrt(2)/2$], [$sqrt(2)/2$], [$1$],
  [$60 degree$], [$sqrt(3)/2$], [$1/2$], [$sqrt(3)$],
  [$90 degree$], [$1$], [$0$], [undef],
)
]

*Pythagorean:* $sin^2 theta + cos^2 theta = 1$
$1 + tan^2 theta = sec^2 theta$, $quad 1 + cot^2 theta = csc^2 theta$

*Double angle:*
$sin(2 theta) = 2 sin theta cos theta$
$cos(2 theta) = cos^2 theta - sin^2 theta = 2 cos^2 theta - 1 = 1 - 2 sin^2 theta$

*Half angle:* $sin^2(theta/2) = (1 - cos theta)/2$, $quad cos^2(theta/2) = (1 + cos theta)/2$

*Law of Sines:* $a/(sin A) = b/(sin B) = c/(sin C) = 2 R$

*Law of Cosines:* $c^2 = a^2 + b^2 - 2 a b cos C$

#colbreak()

#sectitle[COUNTING & PROBABILITY]

*Permutations:* $P(n, r) = n!/(n - r)!$

*Combinations:* $C(n, r) = n!/(r!(n - r)!)$

*Binomial Theorem:* $(a + b)^n = sum_(k=0)^n binom(n, k) a^(n-k) b^k$

*Pascal's Identity:* $binom(n, k) = binom(n-1, k-1) + binom(n-1, k)$

*Complementary counting:* $P(A) = 1 - P(overline(A))$

*Inclusion-Exclusion (2 sets):*
$|A union B| = |A| + |B| - |A sect B|$
$P(A union B) = P(A) + P(B) - P(A sect B)$

*Conditional:* $P(A | B) = P(A sect B) / P(B)$

*Independent events:* $P(A sect B) = P(A) dot P(B)$

*Expected value:* $E[X] = sum x_i dot P(x_i)$

#sectitle[NUMBER THEORY]

*Divisibility rules:*
#block(inset: (left: 2pt))[
#table(
  columns: (auto, 1fr),
  inset: 2pt,
  stroke: 0.3pt + luma(180),
  [*$n$*], [*Rule*],
  [$2$], [last digit even],
  [$3$], [digit sum div. by $3$],
  [$4$], [last two digits div. by $4$],
  [$5$], [last digit $0$ or $5$],
  [$6$], [div. by both $2$ and $3$],
  [$7$], [double last digit, subtract from rest],
  [$8$], [last three digits div. by $8$],
  [$9$], [digit sum div. by $9$],
  [$10$], [last digit $0$],
  [$11$], [alternating digit sum div. by $11$],
)
]

*Divisor count:* if $n = p_1^(a_1) dots.c p_k^(a_k)$, then
$tau(n) = (a_1 + 1)(a_2 + 1) dots.c (a_k + 1)$

*Divisor sum:* $sigma(n) = product_(i=1)^k (1 + p_i + p_i^2 + dots.c + p_i^(a_i))$

*GCD/LCM:* $gcd(a, b) dot "lcm"(a, b) = a b$

*Modular arithmetic:* $a equiv b mod n$ means $n | (a - b)$.
$(a + b) mod n = ((a mod n) + (b mod n)) mod n$
$(a b) mod n = ((a mod n)(b mod n)) mod n$

*Fermat's Little:* $a^(p-1) equiv 1 mod p$ #mini[(if $gcd(a, p) = 1$, $p$ prime)]

#sectitle[GUESSING STRATEGY]

#block(
  width: 100%, fill: rgb("#FFF8EC"), stroke: 1pt + rgb("#C5963A"), radius: 3pt, inset: 5pt,
)[
  #text(size: 7.5pt)[
  *Expected value per guess* (each wrong guess costs $0.50$):

  #table(
    columns: (auto, auto, auto, auto),
    inset: 2.5pt,
    stroke: 0.3pt + luma(180),
    [*Eliminated*], [*Choices left*], [*EV*], [*Action*],
    [$0$], [$5$], [$-0.30$], [*DON'T GUESS*],
    [$1$], [$4$], [$+0.13$], [*Marginal — skip*],
    [$2$], [$3$], [$+0.83$], [*GUESS*],
    [$3$], [$2$], [$+1.75$], [*DEFINITELY GUESS*],
    [$4$], [$1$], [$+4.00$], [*FREE POINTS*],
  )

  *Rule of thumb:* If you can eliminate $2$ or more choices, GUESS.
  If you cannot eliminate any, leave it BLANK.
  ]
]

#v(4pt)

#sectitle[QUICK TRICKS]

- *Difference of squares test:* if $a^2 - b^2$ appears, factor immediately.
- *Vieta's shortcut:* for $r_1^2 + r_2^2$, use $(r_1 + r_2)^2 - 2 r_1 r_2$.
- *Complement:* "at least one" = $1 -$ "none".
- *Parity:* odd $plus.minus$ odd = even. Check parity to eliminate choices.
- *Units digit:* powers of $2$: cycle $2, 4, 8, 6$. Powers of $3$: cycle $3, 9, 7, 1$.
- *Back-substitute:* plug answer choices into the problem.
- *Dimensional check:* area answers should be squared units.
- *Symmetry:* if $f(a, b) = f(b, a)$, try $a = b$ to estimate.

]
