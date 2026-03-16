// Formula Sheet: Quick Reference

= Formula Sheet

#tldr[
  Compact reference of all key formulas, identities, and theorems organized by chapter. Tear out and keep beside you during practice sessions.
]

== Counting (Ch. 1)

#conceptbox(title: "Fundamental Counting Formulas")[
  - *Permutations:* $P(n, k) = frac(n!, (n - k)!)$
  - *Combinations:* $binom(n, k) = frac(n!, k! (n - k)!)$
  - *Multiset coefficient (stars and bars):* $binom(n + k - 1, k)$ ways to choose $k$ items from $n$ types with repetition
  - *Multinomial:* $binom(n, k_1 comma k_2 comma dots comma k_r) = frac(n!, k_1! k_2! dots.c k_r!)$ where $sum k_i = n$
  - *Derangements:* $D_n = n! sum_(k=0)^n frac((-1)^k, k!)$
  - *Stirling (2nd kind):* $S(n, k) = frac(1, k!) sum_(j=0)^k (-1)^(k - j) binom(k, j) j^n$
  - *Catalan numbers:* $C_n = frac(1, n + 1) binom(2 n, n) = binom(2 n, n) - binom(2 n, n + 1)$
]

== Binomial Identities (Ch. 2)

#conceptbox(title: "Essential Binomial Identities")[
  - *Binomial theorem:* $(x + y)^n = sum_(k=0)^n binom(n, k) x^k y^(n - k)$
  - *Vandermonde:* $binom(m + n, r) = sum_(k=0)^r binom(m, k) binom(n, r - k)$
  - *Hockey stick:* $sum_(i=r)^n binom(i, r) = binom(n + 1, r + 1)$
  - *Symmetry:* $binom(n, k) = binom(n, n - k)$
  - *Absorption:* $k binom(n, k) = n binom(n - 1, k - 1)$
  - *Pascal:* $binom(n, k) = binom(n - 1, k - 1) + binom(n - 1, k)$
  - *Upper negation:* $binom(-n, k) = (-1)^k binom(n + k - 1, k)$
  - *Alternating sum:* $sum_(k=0)^n (-1)^k binom(n, k) = 0$
  - *Squares:* $sum_(k=0)^n binom(n, k)^2 = binom(2 n, n)$
]

== Pigeonhole Principle (Ch. 3)

#conceptbox(title: "Pigeonhole Variants")[
  - *Basic:* $n + 1$ objects in $n$ boxes implies some box has $>= 2$
  - *Generalized:* $k n + 1$ objects in $n$ boxes implies some box has $>= k + 1$
  - *Continuous:* For $n + 1$ reals in $[0, 1]$, two are within $1 / n$
  - *Erdos--Szekeres:* Any sequence of $n^2 + 1$ distinct reals has a monotone subsequence of length $n + 1$
]

== Inclusion-Exclusion (Ch. 4)

#conceptbox(title: "PIE Formulas")[
  - *Standard PIE:*
  $ |A_1 union dots union A_n| = sum_(i) |A_i| - sum_(i < j) |A_i sect A_j| + dots + (-1)^(n+1) |A_1 sect dots sect A_n| $
  - *Complementary counting:* $|overline(A_1) sect dots sect overline(A_n)| = |U| - |A_1 union dots union A_n|$
  - *Euler's totient:* $phi(n) = n product_(p | n) (1 - 1 / p)$
  - *Derangements via PIE:* $D_n = sum_(k=0)^n (-1)^k binom(n, k)(n - k)! = n! sum_(k=0)^n frac((-1)^k, k!)$
  - *Surjections:* Number of onto functions $f: [n] -> [k]$ is $sum_(j=0)^k (-1)^j binom(k, j)(k - j)^n$
]

== Generating Functions (Ch. 5)

#conceptbox(title: "Generating Function Templates")[
  - *Geometric:* $frac(1, 1 - x) = sum_(n >= 0) x^n$
  - *Binomial:* $(1 + x)^n = sum_(k=0)^n binom(n, k) x^k$
  - *Negative binomial:* $frac(1, (1 - x)^k) = sum_(n >= 0) binom(n + k - 1, k - 1) x^n$
  - *Exponential:* $e^x = sum_(n >= 0) frac(x^n, n!)$
  - *Catalan GF:* $C(x) = frac(1 - sqrt(1 - 4 x), 2 x)$
  - *Fibonacci GF:* $F(x) = frac(x, 1 - x - x^2)$
  - *Convolution:* if $C(x) = A(x) B(x)$ then $c_n = sum_(k=0)^n a_k b_(n-k)$
  - *EGF product:* if $C(x) = A(x) B(x)$ (EGFs) then $c_n = sum_(k=0)^n binom(n, k) a_k b_(n-k)$
]

== Recurrences (Ch. 6)

#conceptbox(title: "Solving Linear Recurrences")[
  - *Characteristic equation:* For $a_n = c_1 a_(n-1) + c_2 a_(n-2) + dots + c_k a_(n-k)$, solve $x^k = c_1 x^(k-1) + dots + c_k$
  - *Distinct roots $r_1, dots, r_k$:* $a_n = alpha_1 r_1^n + alpha_2 r_2^n + dots + alpha_k r_k^n$
  - *Repeated root $r$ of multiplicity $m$:* contributes $(alpha_0 + alpha_1 n + dots + alpha_(m-1) n^(m-1)) r^n$
  - *Fibonacci:* $F_n = frac(phi^n - psi^n, sqrt(5))$ where $phi = frac(1 + sqrt(5), 2)$, $psi = frac(1 - sqrt(5), 2)$
  - *Master theorem:* $T(n) = a T(n / b) + Theta(n^d)$: if $d < log_b a$ then $Theta(n^(log_b a))$; if $d = log_b a$ then $Theta(n^d log n)$; if $d > log_b a$ then $Theta(n^d)$
]

== Graph Theory (Ch. 7)

#conceptbox(title: "Key Graph Theory Facts")[
  - *Handshaking:* $sum_(v in V) deg(v) = 2|E|$
  - *Trees:* A tree on $n$ vertices has $n - 1$ edges. Cayley's formula: $n^(n-2)$ labeled trees on $n$ vertices.
  - *Euler's formula (planar):* $V - E + F = 2$
  - *Planar bound:* $E <= 3 V - 6$ (simple, $V >= 3$); triangle-free: $E <= 2 V - 4$
  - *Chromatic number:* $chi(G) <= Delta(G) + 1$ (Brooks: $chi(G) <= Delta(G)$ unless $G$ is complete or odd cycle)
  - *Bipartite iff no odd cycles*
  - *Hall's theorem:* A bipartite graph $G = (X, Y)$ has a matching saturating $X$ iff $|N(S)| >= |S|$ for all $S subset.eq X$
  - *Max flow = Min cut* (Ford--Fulkerson)
  - *Turan:* $"ex"(n, K_(r+1)) = (1 - 1 / r) n^2 / 2$ (Turan graph is extremal)
]

== Extremal & Invariants (Ch. 8)

#conceptbox(title: "Invariants & Monovariants Checklist")[
  - *Parity (mod 2):* Check sum, count, or number of inversions mod 2
  - *Modular (mod $k$):* Sum or product mod $k$ for $k = 3, 4, dots$
  - *Coloring:* Checkerboard (2 colors), 3-coloring, residue coloring
  - *Monovariants:* Sum of squares $sum x_i^2$, max element, potential function $sum 2^(x_i)$, total count
  - *Extremal principle:* Pick max/min element; minimal counterexample
  - *Convexity:* Jensen's inequality for bounding sums over distributions
  - *Termination:* Bounded integer monovariant implies finite process
]

== Probabilistic & Algebraic (Ch. 9)

#conceptbox(title: "Probabilistic Method Toolkit")[
  - *First moment:* $EE[X] >= k$ implies $Pr[X >= k] > 0$
  - *Linearity:* $EE[sum X_i] = sum EE[X_i]$ (always, no independence needed)
  - *Alteration:* Construct randomly, delete defects; works if expected defects are few
  - *Lovasz Local Lemma:* If each bad event $A_i$ has $Pr[A_i] <= p$ and depends on at most $d$ others, and $e p(d + 1) <= 1$, then $Pr[sect.big overline(A_i)] > 0$
  - *Ramsey lower bound:* $R(k, k) > 2^(k\/2 - 1)$ (random 2-coloring)
]

#conceptbox(title: "Algebraic Method Toolkit")[
  - *Schwartz--Zippel:* Nonzero poly of degree $d$ vanishes on at most $d / |S|$ fraction of $S^n$
  - *Nullstellensatz:* If coefficient of $x_1^(t_1) dots x_n^(t_n)$ in $f$ is nonzero and $|S_i| > t_i$, then $f$ is nonzero on $S_1 times dots times S_n$
  - *Dimension argument:* Linearly independent vectors in $FF^n$ number at most $n$
  - *Oddtown:* Odd-sized clubs with pairwise even intersections: at most $n$ clubs
  - *Cauchy--Davenport:* $|A + B| >= min(p, |A| + |B| - 1)$ over $ZZ \/ p ZZ$
  - *Polynomial root bound:* Degree $d$ polynomial over a field has at most $d$ roots
]

== Ramsey Numbers (Ch. 3 & 7)

#conceptbox(title: "Known Ramsey Numbers")[
  #table(
    columns: (auto, auto, auto, auto, auto, auto),
    inset: 4pt,
    stroke: 0.5pt,
    [$R(s, t)$], [$t = 2$], [$t = 3$], [$t = 4$], [$t = 5$], [$t = 6$],
    [$s = 2$], [2], [3], [4], [5], [6],
    [$s = 3$], [3], [6], [9], [14], [18],
    [$s = 4$], [4], [9], [18], [25?], [--],
    [$s = 5$], [5], [14], [25?], [43--48], [--],
  )
  // VERIFY: R(4,5) = 25 is established; R(5,5) bounds are 43-48
  - *Bounds:* $binom(s + t - 2, s - 1) >= R(s, t) >= 2^(min(s, t) \/ 2)$ (approximately)
  - *Schur numbers:* $S(1) = 2, S(2) = 5, S(3) = 14, S(4) = 45$
]

== Common Problem-Solving Strategies

#conceptbox(title: "Strategy Quick Reference")[
  + *Small cases first:* Compute $n = 1, 2, 3, 4$ to spot a pattern, then prove by induction
  + *Bijection:* Reinterpret the count as something familiar (lattice paths, trees, etc.)
  + *Generating functions:* When a recurrence has convolution structure or you need coefficient extraction
  + *Double counting:* Count the same set two ways to get an identity or inequality
  + *Pigeonhole:* When the problem says "show at least one... exists" with more objects than containers
  + *PIE:* When counting objects avoiding multiple forbidden properties
  + *Invariant / monovariant:* When a process or transformation is described; check what is preserved or monotone
  + *Extremal:* Pick the max/min element; consider the minimal counterexample
  + *Probabilistic:* When "show there exists" and a random construction is natural
  + *Polynomial method:* When the problem has algebraic structure over a finite field
]
