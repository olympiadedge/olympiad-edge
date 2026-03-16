// Formula Sheet: Combinatorics Quick Reference

= Combinatorics Quick Reference

#columns(2, gutter: 12pt)[

== Counting Basics

*Binomial coefficient:*
$ binom(n, k) = n! / (k! (n - k)!) $

*Permutations:* $P(n, k) = n! / (n - k)!$

*Multinomial:* $binom(n, k_1, k_2, dots, k_r) = n! / (k_1! k_2! dots.c k_r!)$

*Circular permutations:* $(n - 1)!$

*Stars and bars:* Non-neg integer solutions to $x_1 + dots + x_k = n$: $binom(n + k - 1, k - 1)$

*Lattice paths:* $(0,0) -> (m, n)$ using right/up steps: $binom(m + n, n)$

*PIE:*
$ |A_1 union dots union A_n| = sum |A_i| - sum |A_i inter A_j| + dots $

*Surjections:* $f: [n] ->> [k]$:
$ k! dot S(n, k) = sum_(j=0)^(k) (-1)^j binom(k, j) (k - j)^n $

*Derangements:*
$ D_n = n! sum_(k=0)^(n) (-1)^k / k! approx n! / e $

*Catalan numbers:*
$ C_n = 1 / (n + 1) binom(2 n, n) = binom(2 n, n) - binom(2 n, n + 1) $
First 10: $1, 1, 2, 5, 14, 42, 132, 429, 1430, 4862$

GF: $C(x) = (1 - sqrt(1 - 4 x)) / (2 x)$, \ satisfies $C = 1 + x C^2$.

== Identities

*Pascal's:* $binom(n, k) = binom(n-1, k-1) + binom(n-1, k)$

*Vandermonde:* $binom(m + n, r) = sum_(k=0)^(r) binom(m, k) binom(n, r - k)$

*Hockey Stick:* $sum_(i=0)^(r) binom(n + i, i) = binom(n + r + 1, r)$

*Binomial Theorem:*
$ (x + y)^n = sum_(k=0)^(n) binom(n, k) x^k y^(n-k) $

*Absorption:* $k binom(n, k) = n binom(n-1, k-1)$

*Upper summation:* $sum_(k=0)^(n) binom(k, r) = binom(n+1, r+1)$

*Alternating sum:* $sum_(k=0)^(n) (-1)^k binom(n, k) = 0$

*Row sum:* $sum_(k=0)^(n) binom(n, k) = 2^n$

*Squared sum:* $sum_(k=0)^(n) binom(n, k)^2 = binom(2 n, n)$

*Negative binomial:* $binom(-n, k) = (-1)^k binom(n + k - 1, k)$

== Generating Functions

*Key OGFs:*
- $1 / (1 - x) = sum_(n >= 0) x^n$
- $1 / (1 - x)^k = sum binom(n + k - 1, k - 1) x^n$
- $(1 + x)^n = sum binom(n, k) x^k$

*Key EGFs:*
- $e^x = sum x^n / n!$
- $e^x - 1$: nonempty subsets
- $1 / (1 - x)$: EGF for $n!$

*Fibonacci GF:*
$ F(x) = x / (1 - x - x^2), quad F_n = (phi^n - hat(phi)^n) / sqrt(5) $

*Catalan GF:* $C(x) = (1 - sqrt(1 - 4 x)) / (2 x)$

*Partial fractions template:*
$ [x^n] (P(x)) / (product (1 - r_i x)) = sum A_i r_i^n $

*Coefficient extraction:*
$ [x^n] 1 / (1 - r x)^m = binom(n + m - 1, m - 1) r^n $

*Snake Oil:* Swap sum order, recognize inner sum as known GF.

== Graph Theory

*Handshaking:* $sum_(v) deg(v) = 2 |E|$

*Euler's formula* (planar): $|V| - |E| + |F| = 2$
Corollary: $|E| <= 3 |V| - 6$

*Cayley's formula:* Labeled trees on $[n]$: $n^(n-2)$

*Hall's theorem:* Bipartite $G = (A, B, E)$ has matching saturating $A$ iff $|N(S)| >= |S|$ for all $S subset.eq A$.

*Ramsey numbers:*
- $R(3, 3) = 6$
- $R(3, 4) = 9$
- $R(3, 5) = 14$
- $R(4, 4) = 18$
- $R(s, t) <= binom(s + t - 2, s - 1)$

*Chromatic:* $chi(G) <= Delta(G) + 1$ (greedy). Brooks: $chi(G) <= Delta(G)$ unless $K_n$ or odd cycle.

*König's theorem:* In bipartite graphs, max matching $=$ min vertex cover.

== Burnside / Polya

*Burnside's Lemma:*
$ |X \/ G| = 1 / (|G|) sum_(g in G) |"Fix"(g)| $

*Necklaces* ($n$ beads, $k$ colors, rotations):
$ 1 / n sum_(d | n) phi(d) k^(n \/ d) $

*Bracelets* (rotations + reflections):
$ 1 / 2 N(n, k) + cases(
  1 / 2 k^((n+1) \/ 2) & n "odd",
  1 / 4 (k^(n\/2 + 1) + k^(n\/2)) & n "even"
) $

*Cycle Index:*
$ Z(G) = 1 / (|G|) sum_(g in G) product s_(i)^(c_i (g)) $
Substitute $s_i = k$ for unweighted count.

*Cube rotations:* 24 elements.
Faces: $(k^6 + 3 k^4 + 12 k^3 + 8 k^2) \/ 24$

*Tetrahedron rotations:* 12 elements.

== Extremal / Bounds

*Sperner's theorem:* Max antichain in $2^([n])$:
$ binom(n, floor(n \/ 2)) $

*Dilworth's theorem:* Min \# chains covering a poset $=$ max antichain size.

*Mirsky's theorem:* Min \# antichains covering $=$ longest chain.

*Erdős--Szekeres:* Any sequence of $n^2 + 1$ distinct reals has a monotone subsequence of length $n + 1$.

*Kővári--Sós--Turán:* $C_4$-free graph on $n$ vertices: $|E| <= (1 + sqrt(4 n - 3)) n \/ 4 approx n^(3\/2) \/ 2$

*Turán's theorem:* Max edges in $K_(r+1)$-free graph on $n$ vertices:
$ (1 - 1 / r) n^2 / 2 $

== Probabilistic Method

*Basic method:* $P("good") > 0 =>$ good exists.

*First moment:* $EE[X] < 1 =>$ some outcome has $X = 0$.

*Alteration:* Random build $+$ fix bad parts.

*Lovász Local Lemma* (symmetric): $e p (d + 1) <= 1 =>$ can avoid all bad events.

*Ramsey lower bound:* $R(k, k) > 2^(k \/ 2)$

*Hypergraph 2-coloring:* $m < 2^(k-1)$ edges of size $k =>$ 2-colorable.

*Independent set:* $alpha(G) >= n^2 \/ (4 m)$ (alteration method).

== Stirling & Partitions

*Stirling (2nd kind):* $S(n, k) =$ partitions of $[n]$ into $k$ nonempty blocks.
$ S(n, k) = k dot S(n-1, k) + S(n-1, k-1) $

*Bell numbers:* $B_n = sum_(k=0)^(n) S(n, k)$. First: $1, 1, 2, 5, 15, 52, 203$.

*Integer partitions $p(n)$:* GF: $product_(k >= 1) 1 / (1 - x^k)$.
$p(5) = 7$, $p(10) = 42$, $p(20) = 627$.

*Euler's pentagonal theorem:*
$ product_(k >= 1) (1 - x^k) = sum_(m = -infinity)^(infinity) (-1)^m x^(m(3 m - 1) \/ 2) $

*Stirling's approximation:*
$ n! approx sqrt(2 pi n) (n \/ e)^n $
Bounds: $(n\/e)^n < n! < e n (n\/e)^n$

]
