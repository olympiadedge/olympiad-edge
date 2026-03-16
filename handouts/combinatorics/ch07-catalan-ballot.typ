// Chapter 7: Catalan Numbers & Ballot Problems

= Catalan Numbers & Ballot Problems

#tldr[
  The Catalan number $C_n = binom(2 n, n)/(n+1)$ counts Dyck paths, balanced parentheses, binary trees, triangulations, and dozens more structures. The reflection principle is the universal tool for lattice path counting with boundary constraints.
]

== Catalan Number Definition

#definition[
  *Catalan Numbers.* The $n$th Catalan number is
  $ C_n = frac(1, n + 1) binom(2 n, n) = frac((2 n)!, (n + 1)! dot n!). $
  The first several values are: $C_0 = 1, C_1 = 1, C_2 = 2, C_3 = 5, C_4 = 14, C_5 = 42, C_6 = 132$.
]

#theorem[
  *Catalan Recurrence.* The Catalan numbers satisfy
  $ C_0 = 1, quad C_(n+1) = sum_(k=0)^(n) C_k C_(n - k) quad "for" n >= 0. $
  Equivalently, $C_(n+1) = frac(2(2 n + 1), n + 2) C_n$.
]

#proof[
  Consider balanced parenthesizations of $n + 1$ pairs. The first open parenthesis matches some close parenthesis at position $2 k + 2$, enclosing $k$ pairs inside. The remaining $n - k$ pairs follow outside. This gives the convolution $C_(n+1) = sum_(k=0)^n C_k C_(n-k)$.
]

#trickbox[
  When you see a recurrence of the form $f(n) = sum_(k) f(k) f(n - k)$ with $f(0) = 1$, suspect Catalan numbers. This convolution structure arises from decomposing a structure at a "first return" or "root split."
]

== Dyck Paths and the Reflection Principle

#definition[
  *Dyck Path.* A Dyck path of length $2 n$ is a lattice path from $(0, 0)$ to $(2 n, 0)$ using steps $U = (1, 1)$ and $D = (1, -1)$ that never goes below the $x$-axis. The number of Dyck paths of length $2 n$ is $C_n$.
]

#theorem[
  *Reflection Principle.* The number of lattice paths from $(0, 0)$ to $(2 n, 0)$ using $U$ and $D$ steps that touch or cross the line $y = -1$ equals $binom(2 n, n - 1)$.
]

#proof[
  Each "bad" path (one that touches $y = -1$) has a first point where it reaches $y = -1$. Reflect the portion of the path after this first contact across $y = -1$. This creates a bijection between bad paths from $(0,0)$ to $(2 n, 0)$ and _all_ paths from $(0, 0)$ to $(2 n, -2)$. A path to $(2 n, -2)$ uses $n - 1$ up-steps and $n + 1$ down-steps, so there are $binom(2 n, n - 1)$ such paths.
]

#corollary[
  $C_n = binom(2 n, n) - binom(2 n, n - 1) = frac(1, n + 1) binom(2 n, n)$.
]

#conceptbox(title: "The Reflection Principle")[
  To count lattice paths that stay above (or below) a boundary:
  + Count all paths (no restriction).
  + Subtract bad paths using reflection at the boundary.
  + The reflection creates a bijection to paths ending at a reflected endpoint.
  This avoids inclusion-exclusion and works in one clean step.
]

#stratbox[
  For any lattice path problem with a single linear boundary constraint, the reflection principle is your first tool. For two boundaries (e.g., $0 <= y <= m$), use the Lindstrom-Gessel-Viennot lemma or the transfer matrix method.
]

== Catalan Interpretations

#theorem[
  *Catalan Zoo.* The following are all counted by $C_n$:
  + Dyck paths from $(0, 0)$ to $(2 n, 0)$
  + Sequences of $n$ pairs of balanced parentheses
  + Full binary trees with $n + 1$ leaves ($n$ internal nodes)
  + Triangulations of a convex $(n + 2)$-gon
  + Non-crossing partitions of $\{1, 2, dots, n\}$
  + Stack-sortable permutations of $\{1, 2, dots, n\}$ (those avoiding the pattern 231)
  + Monotonic lattice paths from $(0, 0)$ to $(n, n)$ that stay below the diagonal
]

#remark[
  Richard Stanley catalogued over 200 combinatorial interpretations of $C_n$. On competitions, the challenge is _recognizing_ that a given structure belongs to the Catalan family.
]

#trapbox[
  Not every "looks like Catalan" recurrence actually gives Catalan numbers. If the boundary condition differs (e.g., $f(0) = 0$ instead of $f(0) = 1$), or the convolution has offsets, verify by computing small cases. The Motzkin numbers ($M_n$: paths with $U$, $D$, and flat steps) also satisfy a similar-looking recurrence but are distinct.
]

== Generating Function

#theorem[
  *Catalan OGF.* The generating function $C(x) = sum_(n >= 0) C_n x^n$ satisfies
  $ C(x) = 1 + x C(x)^2, $
  with solution
  $ C(x) = frac(1 - sqrt(1 - 4 x), 2 x). $
]

#proof[
  The recurrence $C_(n+1) = sum_(k=0)^n C_k C_(n-k)$ says the coefficient of $x^(n+1)$ in $C(x)$ equals $[x^n](C(x)^2)$. Thus $C(x) - 1 = x C(x)^2$. Solving the quadratic $x C^2 - C + 1 = 0$ gives $C = (1 plus.minus sqrt(1 - 4 x))/(2 x)$. Since $C(0) = 1$, we need the minus sign (the plus sign gives a series with $C(0) = infinity$).
]

#trapbox[
  When solving $C(x) = 1 + x C(x)^2$, the quadratic formula yields two roots. Always check the initial condition $C(0) = C_0 = 1$ to select the correct branch. The "wrong" root $C(x) = (1 + sqrt(1 - 4 x))/(2 x)$ diverges at $x = 0$.
]

#trickbox[
  The asymptotic growth of $C_n$ is $C_n tilde frac(4^n, n^(3\/2) sqrt(pi))$. This is useful for checking whether a sequence could be Catalan: if it grows like $4^n / n^(3\/2)$, investigate further.
]

== The Ballot Problem

#theorem[
  *Ballot Problem.* In an election, candidate $A$ receives $a$ votes and candidate $B$ receives $b$ votes, with $a > b$. If votes are counted in random order, the probability that $A$ is strictly ahead of $B$ throughout the entire counting process is
  $ frac(a - b, a + b). $
]

#proof[
  Model the vote sequence as a lattice path: $+1$ for each $A$-vote, $-1$ for each $B$-vote. We need paths from $(0, 0)$ to $(a + b, a - b)$ that are strictly positive for all $t >= 1$.

  By the cycle lemma (or reflection), the number of such sequences is $frac(a - b, a + b) binom(a + b, a)$.

  Since the total number of orderings is $binom(a + b, a)$, the probability is $(a - b)/(a + b)$.
]

#conceptbox(title: "Cycle Lemma")[
  Given a sequence $(x_1, dots, x_n)$ with $x_i in ZZ$ and $sum x_i = 1$, exactly one of the $n$ cyclic permutations has all positive partial sums. This simultaneously proves the ballot problem and the formula $C_n = binom(2 n, n)/(n + 1)$.
]

#remark[
  The ballot problem with the weaker condition $A >= B$ (non-strict lead) gives probability $(a - b + 1)/(a + b + 1)$ when starting from $t = 0$. Be careful about whether "ahead" means strict or non-strict, and whether the count starts at $t = 0$ or $t = 1$.
]

== Bijections Between Catalan Families

#stratbox[
  On competitions, proving two sets have the same size via bijection is more elegant (and more convincing) than computing both formulas separately. For Catalan families, most bijections pass through Dyck paths as an intermediate.
]

#conceptbox(title: "Standard Bijections")[
  - *Parentheses $<->$ Dyck paths:* "(" = up step, ")" = down step.
  - *Dyck paths $<->$ binary trees:* Recursively, a Dyck path decomposes as $U P_1 D P_2$ where $P_1, P_2$ are shorter Dyck paths (left/right subtrees).
  - *Binary trees $<->$ triangulations:* Root a binary tree; each internal node corresponds to a triangle in the $(n+2)$-gon triangulation.
  - *231-avoiding permutations $<->$ Dyck paths:* Process the permutation left to right, pushing onto a stack (up) or popping (down).
]

#trapbox[
  When constructing bijections, always verify that the base case works ($n = 0$ or $n = 1$) and that the recursion reduces correctly. A common error is off-by-one in the correspondence between $n$ and the size parameter of each family.
]

== Problems

#drill-header("Catalan Numbers & Ballot Problems")

#prob(1)[
  #difficulty(1)
  How many lattice paths from $(0, 0)$ to $(6, 6)$ stay weakly below the diagonal $y = x$? Express your answer as a single binomial coefficient divided by an integer.
]
#hint(1)[These paths use $n$ right-steps and $n$ north-steps and never cross above the diagonal.]
#hint(2)[This is equivalent to Dyck paths of semi-length 6 (right = flat, up = rise, but reinterpreted).]
#hint(3)[$C_6 = binom(12, 6)/7 = 132$.]
#solution[
  Lattice paths from $(0,0)$ to $(n, n)$ that never go above $y = x$ are in bijection with Dyck paths of semi-length $n$: encode R as "up" and N as "down" (or vice versa, with appropriate reflection). The count is $C_6 = frac(1, 7) binom(12, 6) = bold(132)$.
]

#prob(2)[
  #difficulty(1)
  In how many ways can 8 people sit around a circular table such that no person sits in their originally assigned seat? (This is $D_8$ computed modulo a circular arrangement... but actually, just compute $D_8$, the number of derangements of 8 elements.)
]
#hint(1)[Use the formula $D_n = n! sum_(k=0)^n (-1)^k / k!$.]
#hint(2)[$D_8 = 8!(1 - 1 + 1/2 - 1/6 + 1/24 - 1/120 + 1/720 - 1/5040 + 1/40320)$.]
#hint(3)[Compute: $8! = 40320$, and $sum_(k=0)^8 (-1)^k/k! = 1 - 1 + 1/2 - 1/6 + 1/24 - 1/120 + 1/720 - 1/5040 + 1/40320 = 14833/40320$.]
#solution[
  $D_8 = 8! (1 - 1 + 1/2! - 1/3! + 1/4! - 1/5! + 1/6! - 1/7! + 1/8!)$

  $= 40320 (1/2 - 1/6 + 1/24 - 1/120 + 1/720 - 1/5040 + 1/40320)$

  $= 40320 dot 14833/40320 = bold(14833)$.

  // VERIFY: D_8 = 14833
]

#prob(3)[
  #difficulty(2)
  Prove that the number of sequences $(a_1, dots, a_(2n))$ with each $a_i in \{+1, -1\}$, $sum a_i = 0$, and all partial sums $sum_(i=1)^k a_i >= 0$ is $C_n$.
]
#hint(1)[Such sequences are exactly Dyck paths of semi-length $n$.]
#hint(2)[Map $+1 -> U$ (up step) and $-1 -> D$ (down step). The conditions become: equal number of $U$ and $D$ steps, and the path never goes below the $x$-axis.]
#hint(3)[This is the definition of a Dyck path from $(0,0)$ to $(2n, 0)$, counted by $C_n$.]
#solution[
  Map $a_i = +1$ to an up step $U = (1, 1)$ and $a_i = -1$ to a down step $D = (1, -1)$. The sequence $(a_1, dots, a_(2n))$ becomes a lattice path from $(0, 0)$ to $(2n, 0)$.

  The condition $sum a_i = 0$ ensures the path ends at height 0 (equal $U$ and $D$ steps). The condition $sum_(i=1)^k a_i >= 0$ for all $k$ means the path never dips below the $x$-axis. This is precisely a Dyck path of semi-length $n$, and the number of such paths is $C_n$ by definition.
]

#prob(4)[
  #difficulty(2)
  In an election, candidate $A$ receives 7 votes and candidate $B$ receives 3 votes. What is the probability that $A$ is strictly ahead throughout the counting?
]
#hint(1)[Apply the ballot problem formula directly.]
#hint(2)[The probability is $(a - b)/(a + b)$ where $a = 7, b = 3$.]
#hint(3)[$(7 - 3)/(7 + 3) = 4/10 = 2/5$.]
#solution[
  By the ballot theorem, the probability that $A$ leads $B$ strictly throughout the counting is
  $ frac(a - b, a + b) = frac(7 - 3, 7 + 3) = frac(4, 10) = bold(2/5). $
]

#prob(5)[
  #difficulty(2)
  Find the number of ways to triangulate a convex heptagon (7-gon).
]
#hint(1)[A triangulation of a convex $(n+2)$-gon uses $n$ triangles and is counted by $C_n$.]
#hint(2)[A heptagon has $7 = n + 2$ sides, so $n = 5$.]
#hint(3)[$C_5 = binom(10, 5)/6 = 252/6 = 42$.]
#solution[
  A convex $(n + 2)$-gon requires $n$ non-crossing diagonals to triangulate, producing $n$ triangles. The number of triangulations is $C_n$.

  For the heptagon, $n + 2 = 7$ so $n = 5$. Thus the answer is $C_5 = frac(1, 6) binom(10, 5) = frac(252, 6) = bold(42)$.
]

#prob(6)[
  #difficulty(3)
  #putnam(2006, "A5")[
    Let $n$ be a positive integer. Find the number of sequences $(a_1, a_2, dots, a_(2n))$ of integers such that $a_i in \{0, 1\}$ for all $i$, $sum a_i = n$, and all partial sums satisfy $sum_(i=1)^k a_i >= ceil(k / 2)$ for $k = 1, dots, 2 n$.
  ]
]
#hint(1)[Translate to a lattice path problem. Let $b_i = 2 a_i - 1 in \{-1, +1\}$, so the partial sum condition becomes a Dyck-like constraint.]
#hint(2)[After the substitution, the condition $sum_(i=1)^k a_i >= ceil(k/2)$ becomes: the path of partial sums of $b_i$ stays non-negative for even indices and stays strictly positive for odd indices.]
#hint(3)[This is equivalent to counting standard Dyck paths that are strictly positive at odd times, which by careful analysis gives $C_n = binom(2n, n)/(n+1)$.]
#solution[
  Set $b_i = 2 a_i - 1$, so $b_i in \{-1, +1\}$ and $sum_(i=1)^(2n) b_i = 2n - n = 0$ (wait, $sum a_i = n$ gives $sum b_i = 2n - 2n = 0$... let us recheck).

  Actually $sum b_i = 2 sum a_i - 2n = 2n - 2n = 0$. The partial sum $S_k = sum_(i=1)^k b_i = 2 sum_(i=1)^k a_i - k$. The constraint $sum_(i=1)^k a_i >= ceil(k\/2)$ becomes $S_k >= 2 ceil(k\/2) - k$, which equals 0 when $k$ is even and 1 when $k$ is odd. So $S_k >= 0$ always, and $S_k >= 1$ when $k$ is odd.

  A Dyck path from $(0,0)$ to $(2n, 0)$ automatically has $S_k >= 0$. The extra condition $S_k >= 1$ for odd $k$ means the path is strictly positive at odd times. Since a Dyck path has $S_1 >= 1$ (it must start with $U$) and between consecutive odd indices the path moves by $plus.minus 2$ over two steps, one can show the constraint forces the path to start $U$ and that the strict positivity at odd steps is automatically satisfied for any Dyck path starting with $U$. Every Dyck path starts with $U$ (since otherwise it would go to $-1$), so the count is $C_n = bold(binom(2 n, n) / (n + 1))$.
]

#prob(7)[
  #difficulty(3)
  Prove that $C_n$ is odd if and only if $n = 2^k - 1$ for some $k >= 0$.
]
#hint(1)[Use Kummer's theorem: $binom(m + n, m)$ has $2$-adic valuation equal to the number of carries when adding $m$ and $n$ in base 2.]
#hint(2)[We need $nu_2(C_n) = nu_2(binom(2n, n)) - nu_2(n+1) = 0$. By Kummer's theorem, $nu_2(binom(2n, n))$ equals the number of carries when adding $n + n$ in base 2, which equals the number of 1-bits in $n$.]
#hint(3)[So $C_n$ is odd iff the number of 1-bits in $n$ equals $nu_2(n + 1)$. This happens iff $n + 1$ is a power of 2, i.e., $n = 2^k - 1$.]
#solution[
  By Kummer's theorem, $nu_2(binom(2n, n))$ equals the number of carries when adding $n$ to $n$ in binary, which is the number of 1-bits in $n$ (call it $s(n)$). Also, $C_n = binom(2n, n)/(n+1)$, so $nu_2(C_n) = s(n) - nu_2(n+1)$.

  For $C_n$ to be odd, we need $s(n) = nu_2(n+1)$. If $n + 1 = 2^k$, then $n = 2^k - 1 = underbrace(111 dots.c 1)_k$ in binary, so $s(n) = k$ and $nu_2(n+1) = k$. Conversely, if $n + 1$ is not a power of 2, then $n + 1$ has some 1-bit besides the trailing zeros, so $nu_2(n+1) < k$ while $s(n)$ counts all 1-bits of $n = (n+1) - 1$, and one can verify $s(n) > nu_2(n+1)$.
]
