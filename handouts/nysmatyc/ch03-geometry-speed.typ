// ════════════════════════════════════════════════════════════
// Chapter 3 — Geometry Speed Techniques
// ════════════════════════════════════════════════════════════

= Geometry Speed Techniques

Geometry on NYSMATYC tests precalculus-level coordinate and Euclidean geometry. The fastest path is almost always a formula you've memorized or a ratio shortcut.

== Area Formulas You Must Know Instantly

#conceptbox(title: "Instant-Recall Area Formulas")[
  - *Triangle:* $A = 1 / 2 b h$, or $A = 1 / 2 a b sin C$, or Heron's: $A = sqrt(s(s - a)(s - b)(s - c))$
  - *Trapezoid:* $A = 1 / 2 (b_1 + b_2) h$
  - *Circle:* $A = pi r^2$, circumference $= 2 pi r$
  - *Sector:* $A = 1 / 2 r^2 theta$ (radians) or $A = (theta / 360) pi r^2$ (degrees)
  - *Regular polygon ($n$ sides, side $s$):* $A = (n s^2) / (4 tan(pi / n))$
  - *Equilateral triangle (side $s$):* $A = (s^2 sqrt(3)) / 4$
]

#prob(1)[#difficulty(1) What is the area of a triangle with base 10 and height 7?]
#mcq($17$, $35$, $45$, $70$, $140$)

#speedsolution("~5s")[$1 / 2 (10)(7) = 35$. *Answer: (B).*]

#prob(2)[#difficulty(2) A sector of a circle with radius 6 has a central angle of $60 degree$. What is the area of the sector?]
#mcq($3 pi$, $6 pi$, $9 pi$, $12 pi$, $36 pi$)

#speedsolution("~10s")[$60 / 360 = 1 / 6$ of the full circle. Area $= 1 / 6 dot pi(6)^2 = 6 pi$. *Answer: (B).*]

== Coordinate Geometry Shortcuts

#speedbox[
  *Distance:* $d = sqrt((x_2 - x_1)^2 + (y_2 - y_1)^2)$. For MCQ, often compare $d^2$ to avoid the square root.\
  *Midpoint:* $M = ((x_1 + x_2) / 2, (y_1 + y_2) / 2)$.\
  *Slope:* $m = (y_2 - y_1) / (x_2 - x_1)$. Parallel $arrow.r.double$ same slope. Perpendicular $arrow.r.double$ slopes multiply to $-1$.
]

#prob(3)[#difficulty(1) What is the distance between $(1, 2)$ and $(4, 6)$?]
#mcq($3$, $4$, $5$, $6$, $7$)

#speedsolution("~10s")[$d = sqrt(9 + 16) = sqrt(25) = 5$. Recognize the $3$-$4$-$5$ right triangle. *Answer: (C).*]

#trickbox[
  Memorize common Pythagorean triples: $3$-$4$-$5$, $5$-$12$-$13$, $8$-$15$-$17$, $7$-$24$-$25$. On MCQ, if $d^2$ matches one of these, skip the square root.
]

#prob(4)[#difficulty(2) A line passes through $(2, 3)$ and is perpendicular to $y = 2 x + 1$. What is its $y$-intercept?]
#mcq($1$, $2$, $3$, $4$, $5$)

#speedsolution("~20s")[Perpendicular slope $= -1 / 2$. Using point $(2, 3)$: $y - 3 = -1 / 2 (x - 2)$, so $y = -x / 2 + 4$. The $y$-intercept is $4$. *Answer: (D).*]

== Similar Triangles & Proportional Reasoning

#speedbox[
  *Scale factor shortcut:* If two similar figures have a linear scale factor of $k$, then:\
  - Perimeters scale by $k$\
  - Areas scale by $k^2$\
  - Volumes scale by $k^3$\
  This saves enormous time vs. computing areas from scratch.
]

#prob(5)[#difficulty(2) Two similar triangles have corresponding sides in the ratio $3 : 5$. If the area of the smaller triangle is 18, what is the area of the larger?]
#mcq($30$, $36$, $42$, $50$, $54$)

#speedsolution("~10s")[Area ratio $= (5 / 3)^2 = 25 / 9$. Larger area $= 18 dot 25 / 9 = 50$. *Answer: (D).*]

#solution[Let the smaller triangle have base $b$ and height $h$, so $1 / 2 b h = 18$. The larger has base $5 b / 3$ and height $5 h / 3$, so area $= 1 / 2 dot 5 b / 3 dot 5 h / 3 = 25 / 9 dot 1 / 2 b h = 25 / 9 dot 18 = 50$. Same result, more steps.]

== Circle Theorems for Speed

#conceptbox(title: "Circle Speed Facts")[
  - *Inscribed Angle Theorem:* An inscribed angle is half the central angle subtending the same arc.
  - *Angle in a semicircle:* An inscribed angle subtending a diameter is $90 degree$.
  - *Power of a Point:* For two chords intersecting inside a circle: $A P dot P B = C P dot P D$.
  - *Tangent-Radius:* A tangent is perpendicular to the radius at the point of tangency.
]

#prob(6)[#difficulty(2) In a circle, a central angle of $120 degree$ subtends arc $A B$. What is the measure of the inscribed angle subtending the same arc from the opposite side?]
#mcq($30 degree$, $60 degree$, $90 degree$, $120 degree$, $240 degree$)

#speedsolution("~10s")[Inscribed angle $= 1 / 2$ of central angle $= 60 degree$. *Answer: (B).*]

#prob(7)[#difficulty(3) Two chords of a circle intersect at point $P$ inside the circle. One chord is divided into segments of length 3 and 8. The other chord is divided into segments of length 4 and $x$. Find $x$.]
#mcq($5$, $6$, $7$, $8$, $9$)

#speedsolution("~15s")[Power of a Point: $3 dot 8 = 4 dot x$, so $x = 24 / 4 = 6$. *Answer: (B).*]

== Lattice Point Counting: Pick's Theorem

#speedbox[
  *Pick's Theorem:* For a polygon with vertices at lattice points:\
  $A = I + B / 2 - 1$\
  where $I$ = interior lattice points, $B$ = boundary lattice points.\
  *Reverse use:* Given vertices, count $B$ and compute $A$ via the shoelace formula, then find $I$.
]

#prob(8)[#difficulty(3) A triangle has vertices at $(0, 0)$, $(4, 0)$, and $(0, 3)$. How many lattice points are strictly inside the triangle?]
#mcq($2$, $3$, $4$, $5$, $6$)

#speedsolution("~30s")[Shoelace area: $A = 1 / 2 |4 dot 3| = 6$. Boundary points: bottom edge has 5 (including endpoints), left edge has 4, hypotenuse from $(4, 0)$ to $(0, 3)$: $gcd(4, 3) + 1 = 2$ points (endpoints counted). Total $B = 5 + 4 + 2 - 3 = 8$ (subtract 3 shared vertices counted twice). Actually: $B = (4 + 1) + (3 - 1) + (gcd(4, 3) - 1) = 5 + 2 + 0 = 7$. Wait — count carefully: bottom has 5, left has 4, hypotenuse: $gcd(4, 3) + 1 = 2$ points total, so $gcd(4,3) - 1 = 0$ interior boundary points. $B = 4 + 2 + 0 + 3 = 9$. Hmm, let me just count: boundary points on each edge (not counting vertices) are $4, 2, 0$, plus 3 vertices $= 9$. No: bottom edge from $(0,0)$ to $(4,0)$: 3 interior points. Left edge from $(0,0)$ to $(0,3)$: 2 interior points. Hypotenuse from $(4,0)$ to $(0,3)$: $gcd(4,3) - 1 = 0$ interior points. $B = 3 + 2 + 0 + 3 = 8$. Pick's: $6 = I + 8 / 2 - 1 = I + 3$, so $I = 3$. *Answer: (B).*]

// VERIFY: Lattice points strictly inside: (1,1), (2,1), (1,2) — that's 3. Confirmed.

== Analytic Geometry Shortcuts

#conceptbox(title: "Distance from Point to Line")[
  Distance from $(x_0, y_0)$ to line $a x + b y + c = 0$:\
  $d = |a x_0 + b y_0 + c| / sqrt(a^2 + b^2)$\
  Memorize this formula — it appears frequently.
]

#conceptbox(title: "Shoelace Formula")[
  Area of a polygon with vertices $(x_1, y_1), dots, (x_n, y_n)$:\
  $A = 1 / 2 |sum_(i=1)^(n) (x_i y_(i+1) - x_(i+1) y_i)|$\
  where $(x_(n+1), y_(n+1)) = (x_1, y_1)$.
]

#prob(9)[#difficulty(2) What is the distance from the point $(3, 4)$ to the line $3 x + 4 y - 12 = 0$?]
#mcq($1$, $13 / 5$, $3$, $17 / 5$, $5$)

#speedsolution("~15s")[$d = |3(3) + 4(4) - 12| / sqrt(9 + 16) = |9 + 16 - 12| / 5 = 13 / 5$. *Answer: (B).*]

#prob(10)[#difficulty(3) Find the area of the triangle with vertices $(0, 0)$, $(5, 1)$, and $(2, 4)$.]
#mcq($7$, $9$, $11$, $14$, $18$)

#speedsolution("~20s")[Shoelace: $A = 1 / 2 |0 dot 1 - 5 dot 0 + 5 dot 4 - 2 dot 1 + 2 dot 0 - 0 dot 4| = 1 / 2 |0 + 18 + 0| = 9$. *Answer: (B).*]

// VERIFY: Shoelace detail: (0)(1)-(5)(0)=0, (5)(4)-(2)(1)=18, (2)(0)-(0)(4)=0. Sum=18. A=18/2=9. Confirmed.

#solution[You could compute lengths of all three sides and use Heron's formula: $a = sqrt(26)$, $b = sqrt(25) = 5$... this is significantly slower.]

#tldr[Memorize area formulas and Pythagorean triples for instant recall. Use the scale-factor-squared rule for similar figures. Power of a Point and inscribed angle theorem each save minutes. The shoelace formula and point-to-line distance are must-know for coordinate geometry.]
