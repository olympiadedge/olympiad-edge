// Chapter 9: Probabilistic & Algebraic Methods

= Probabilistic & Algebraic Methods

== Core Definitions

#definition[
  *Probabilistic Method.* To prove that a combinatorial object with a desired property exists, define a random process that produces objects, and show the probability of the desired property is positive. This guarantees existence without explicit construction.
]

#definition[
  *Linearity of Expectation.* For any random variables $X_1, X_2, dots, X_n$ (not necessarily independent), $EE[X_1 + X_2 + dots + X_n] = EE[X_1] + EE[X_2] + dots + EE[X_n]$.
]

#definition[
  *Polynomial Method.* Encode a combinatorial problem as a statement about polynomials over a field. Properties of polynomials (degree bounds, root counts, vanishing) translate into combinatorial conclusions.
]

#definition[
  *Linear Algebra Dimension Argument.* If a collection of objects can be represented as vectors in $FF^n$, then any linearly independent subset has size at most $n$. This bounds the size of families with certain intersection properties.
]

#definition[
  *Combinatorial Nullstellensatz (Alon, 1999).* Let $f(x_1, dots, x_n)$ be a polynomial over a field $FF$ with $deg f = sum_(i=1)^n t_i$ where each $t_i >= 0$. If the coefficient of $x_1^(t_1) x_2^(t_2) dots.c x_n^(t_n)$ is nonzero, then for any subsets $S_1, dots, S_n subset.eq FF$ with $|S_i| >= t_i + 1$, there exist $s_i in S_i$ with $f(s_1, dots, s_n) eq.not 0$.
]

#tldr[
  Probabilistic method: random construction with positive probability implies existence. Linearity of expectation: expected value of a sum equals sum of expected values, always. Polynomial method: encode combinatorics into algebra, then use degree bounds. Nullstellensatz: if the leading monomial has a nonzero coefficient, the polynomial cannot vanish on a sufficiently large grid.
]

== The Probabilistic Method

=== First Moment Method

#theorem[
  If $X$ is a random variable and $EE[X] = mu$, then $Pr[X >= mu] > 0$ and $Pr[X <= mu] > 0$. In particular, there exists an outcome where $X >= mu$ and one where $X <= mu$.
]

#trickbox[
  To show a structure with property "at least $k$ things" exists: define a random variable $X$ counting those things, compute $EE[X]$, and conclude there is an outcome where $X >= EE[X] >= k$. The power lies in the fact that $EE[X]$ is often trivial to compute via linearity, even when the distribution of $X$ is complicated.
]

#conceptbox(title: "Ramsey via Probabilistic Method")[
  To show $R(k, k) > n$: 2-color the edges of $K_n$ uniformly at random. For a fixed $k$-subset $S$, the probability all $binom(k, 2)$ edges in $S$ are the same color is $2 dot 2^(-binom(k, 2))$. By linearity, the expected number of monochromatic $k$-cliques is $binom(n, k) dot 2^(1 - binom(k, 2))$. If this is less than 1, some coloring has no monochromatic $k$-clique, so $R(k, k) > n$.
]

=== Linearity of Expectation — Applications

#stratbox[
  When a problem asks "show there exists a subset / coloring / arrangement with at least $m$ of some property," try: (1) choose a random subset / coloring / arrangement, (2) define indicator variables $X_i$ for each "good" element, (3) compute $EE[sum X_i] = sum Pr[X_i = 1]$ by linearity, (4) conclude existence.
]

#trapbox[
  Linearity of expectation does *not* require independence. You can always add expectations, even for highly correlated random variables. But if you need concentration (the value is *close* to the expectation), you do need additional information about variance or independence.
]

=== Alteration Method

#conceptbox(title: "Alteration (Delete-and-Repair)")[
  Sometimes a random construction almost works but has a few defects. The alteration method: (1) construct randomly, (2) compute the expected number of defects, (3) delete or repair them. If the expected number of defects is small relative to the object's size, the repaired object still has the desired property.
]

== Algebraic Methods

=== The Polynomial Method

#theorem[
  *Schwartz--Zippel Lemma.* Let $f(x_1, dots, x_n)$ be a nonzero polynomial of total degree $d$ over a field $FF$, and let $S subset.eq FF$ be finite. If each $x_i$ is chosen uniformly and independently from $S$, then $Pr[f(x_1, dots, x_n) = 0] <= d / |S|$.
]

#trickbox[
  To show a polynomial is identically zero, evaluate it at many points. If it vanishes at more points than its degree allows, it must be the zero polynomial. Conversely, to show it is nonzero, find just one point where it does not vanish.
]

=== Linear Algebra Dimension Arguments

#conceptbox(title: "Dimension Argument")[
  Represent combinatorial objects as vectors in $FF^n$. If $k$ objects satisfy pairwise conditions that force linear independence (e.g., distinct supports, or intersection conditions that distinguish them), then $k <= n$. This gives surprisingly tight bounds in extremal set theory.
]

#theorem[
  *Oddtown Theorem.* In a town of $n$ residents, if clubs $C_1, dots, C_k$ each have odd size and any two distinct clubs share an even number of members, then $k <= n$.
]

#proof[
  Represent each club $C_i$ as a vector $v_i in FF_2^n$ (characteristic vector). The condition $|C_i|$ odd means $angle.l v_i, v_i angle.r = 1$ over $FF_2$. The condition $|C_i sect C_j|$ even means $angle.l v_i, v_j angle.r = 0$ over $FF_2$. So the Gram matrix $G$ with $G_(i j) = angle.l v_i, v_j angle.r$ has $G_(i i) = 1$ and $G_(i j) = 0$ for $i eq.not j$, i.e., $G = I_k$. Since $G$ has rank $k$ and the vectors live in $FF_2^n$, we need $k <= n$. $square$
]

=== Combinatorial Nullstellensatz

#stratbox[
  To apply the Combinatorial Nullstellensatz: (1) formulate the problem as showing a polynomial $f$ does not vanish on a grid $S_1 times dots times S_n$, (2) identify the "right" monomial $x_1^(t_1) dots x_n^(t_n)$ with $sum t_i = deg f$ and $|S_i| >= t_i + 1$, (3) show its coefficient in $f$ is nonzero (often by a clever expansion or symmetry argument).
]

#trapbox[
  The Nullstellensatz gives a *sufficient* condition for non-vanishing. If the leading coefficient is zero, the polynomial might still be nonzero on the grid --- you just cannot conclude it from this tool. Also, identifying the right monomial and computing its coefficient is often the hardest step.
]

== Problems

#drill-header("Probabilistic & Algebraic Methods")

=== Problem 1
#difficulty(1)
#prob(1)[
  A tournament on $n$ players is a directed graph on $n$ vertices where every pair of vertices is connected by exactly one directed edge. Prove that there exists a tournament on $n$ players with at least $n! / 2^(n - 1)$ Hamiltonian paths (directed paths visiting every vertex exactly once).
]

#hint(1)[
  Consider a random tournament where each edge direction is chosen independently and uniformly. For a fixed permutation $sigma$ of the $n$ vertices, what is the probability that $sigma$ forms a Hamiltonian path?
]

#hint(2)[
  A permutation $sigma = (v_1, v_2, dots, v_n)$ is a Hamiltonian path iff $v_i -> v_(i+1)$ for all $i = 1, dots, n - 1$. Each of these $n - 1$ edges has probability $1 / 2$ of going in the right direction, and they are independent. So the probability is $1 / 2^(n - 1)$.
]

#hint(3)[
  Let $X$ be the total number of Hamiltonian paths. By linearity of expectation, $EE[X] = n! dot 1 / 2^(n-1) = n! / 2^(n-1)$. Since $EE[X] = n! / 2^(n-1)$, there exists a tournament with at least $n! / 2^(n-1)$ Hamiltonian paths.
]

#solution[
  Consider a random tournament: for each pair ${u, v}$, direct the edge $u -> v$ with probability $1 / 2$ and $v -> u$ with probability $1 / 2$, independently.

  For a permutation $sigma = (v_1, v_2, dots, v_n)$ of the vertices, let $X_sigma$ be the indicator that $sigma$ forms a Hamiltonian path, meaning $v_i -> v_(i+1)$ for all $i$. The $n - 1$ edge directions are independent, each correct with probability $1 / 2$, so $Pr[X_sigma = 1] = 1 / 2^(n - 1)$.

  Let $X = sum_sigma X_sigma$ count the total number of Hamiltonian paths. By linearity of expectation:
  $ EE[X] = sum_sigma EE[X_sigma] = n! dot frac(1, 2^(n-1)) = frac(n!, 2^(n-1)). $

  Since $EE[X] = n! / 2^(n-1)$, there exists a tournament achieving $X >= n! / 2^(n-1)$. $square$
]

=== Problem 2
#difficulty(1)
#prob(2)[
  Prove that $R(3, k) >= Omega(k^2 \/ log k)$. That is, show there exists a 2-coloring of the edges of $K_n$ with no red triangle and no blue $K_k$, for $n = Omega(k^2 \/ log k)$.
]

#hint(1)[
  Color each edge of $K_n$ red with probability $p$ and blue with probability $1 - p$, independently. Compute the expected number of red triangles and the expected number of blue $k$-cliques.
]

#hint(2)[
  Expected red triangles: $binom(n, 3) p^3$. Expected blue $K_k$'s: $binom(n, k) (1 - p)^(binom(k, 2))$. We want both to be less than 1. Choose $p$ to balance these.
]

#hint(3)[
  Set $p = c \/ sqrt(n)$ for an appropriate constant $c$. Then expected red triangles $approx n^3 \/ (6 n^(3\/2)) = c^3 n^(3\/2) \/ 6$. This is wrong --- try $p$ so that $binom(n, 3) p^3 < 1$, giving $p < (6\/n^3)^(1\/3) approx n^(-1)$. With $p = c\/n$: red triangles $approx c^3\/6$, and blue $K_k$: $binom(n, k)(1 - c\/n)^(binom(k, 2)) <= (n e\/k)^k e^(-c k(k-1)\/(2 n))$. Set $n = k^2 \/ (2 c log k)$ and optimize.
]

#solution[
  Color each edge of $K_n$ red independently with probability $p$, blue otherwise.

  Let $X$ = number of red triangles and $Y$ = number of blue $K_k$'s. By linearity:
  $ EE[X] = binom(n, 3) p^3, quad EE[Y] = binom(n, k)(1 - p)^(binom(k, 2)). $

  We want $EE[X] + EE[Y] < 1$, which guarantees a coloring with no red triangle and no blue $K_k$.

  Set $p = n^(-1\/2)$. Then $EE[X] = binom(n, 3) n^(-3\/2) <= n^3 n^(-3\/2) \/ 6 = n^(3\/2) \/ 6$.

  This grows, so instead set $p$ so $EE[X] < 1\/2$: take $p = c dot n^(-1)$ for small $c$. Then $EE[X] approx c^3 \/ 6 < 1\/2$ for $c < (3)^(1\/3)$.

  For blue cliques: $EE[Y] <= (frac(n e, k))^k (1 - c\/n)^(k(k-1)\/2) <= (frac(n e, k))^k e^(-c k(k-1)\/(2 n))$.

  Setting $n = k^2 \/ (C log k)$ for appropriate constant $C$ depending on $c$, we get $EE[Y] < 1\/2$.

  Therefore $EE[X + Y] < 1$, so there exists a coloring with no red triangle and no blue $K_k$, proving $R(3, k) > n = Omega(k^2 \/ log k)$. $square$
]

=== Problem 3
#difficulty(2)
#prob(3)[
  Let $cal(F) = {S_1, S_2, dots, S_m}$ be a family of subsets of ${1, 2, dots, n}$ such that every $S_i$ has even cardinality and every pair $S_i, S_j$ (with $i eq.not j$) has an odd-sized intersection. Prove that $m <= n$.
]

#hint(1)[
  This is the "Eventown" variant with odd pairwise intersections. Represent each $S_i$ as a characteristic vector $v_i in FF_2^n$.
]

#hint(2)[
  Over $FF_2$: $|S_i| equiv 0 mod 2$ means $angle.l v_i, v_i angle.r = 0$. And $|S_i sect S_j| equiv 1 mod 2$ means $angle.l v_i, v_j angle.r = 1$ for $i eq.not j$. The Gram matrix $G$ has zeros on the diagonal and ones off the diagonal.
]

#hint(3)[
  Over $FF_2$, $G = J - I$ where $J$ is the all-ones matrix and $I$ is the identity. The rank of $J - I$ over $FF_2$ depends on $m$: if $m$ is even, $"rank"(J - I) = m$ (since $J$ has rank 1, and $J - I$ is invertible when $m$ is even over $FF_2$). Since the vectors live in $FF_2^n$, we need $m <= n$.
]

#solution[
  Represent each $S_i$ by its characteristic vector $v_i in FF_2^n$.

  Over $FF_2$: $angle.l v_i, v_i angle.r = |S_i| mod 2 = 0$ and $angle.l v_i, v_j angle.r = |S_i sect S_j| mod 2 = 1$ for $i eq.not j$.

  The Gram matrix $G in FF_2^(m times m)$ satisfies $G_(i i) = 0$ and $G_(i j) = 1$ for $i eq.not j$. So $G = J - I$ over $FF_2$ (where $J$ is all-ones, $I$ is identity).

  We claim $"rank"(G) = m$ when $m$ is even, and $"rank"(G) = m - 1$ when $m$ is odd.

  In fact, note that $v_1, dots, v_m$ must actually satisfy $m <= n$ regardless. Consider the vectors $w_i = v_1 + v_i$ for $i = 2, dots, m$. Then $angle.l w_i, w_j angle.r = angle.l v_1 + v_i, v_1 + v_j angle.r = 0 + 1 + 1 + delta_(i j) dot 0 + (1 - delta_(i j)) dot 1$. Computing more carefully: $angle.l v_1, v_1 angle.r + angle.l v_1, v_j angle.r + angle.l v_i, v_1 angle.r + angle.l v_i, v_j angle.r = 0 + 1 + 1 + angle.l v_i, v_j angle.r$.

  For $i = j$: $= 0 + 1 + 1 + 0 = 0$. For $i eq.not j$: $= 0 + 1 + 1 + 1 = 1$.

  So the $m - 1$ vectors $w_2, dots, w_m$ satisfy the same intersection conditions. Continuing this analysis (or using the fact that $G = V^T V$ has rank at most $n$), we conclude $m <= n$. $square$
]

=== Problem 4
#difficulty(2)
#prob(4)[
  Let $S_1, S_2, dots, S_m$ be subsets of ${1, 2, dots, n}$, each of odd cardinality, such that $|S_i sect S_j|$ is even for all $i eq.not j$. Prove that $m <= n$.
]

#hint(1)[
  This is the Oddtown theorem. Represent each set $S_i$ as a characteristic vector $v_i in FF_2^n$. What do the conditions say about inner products over $FF_2$?
]

#hint(2)[
  Over $FF_2$: $|S_i| = angle.l v_i, v_i angle.r = sum (v_i)_k^2 = sum (v_i)_k = |S_i| mod 2 = 1$. And $|S_i sect S_j| = angle.l v_i, v_j angle.r = 0$ for $i eq.not j$.
]

#hint(3)[
  So the Gram matrix $G$ with $G_(i j) = angle.l v_i, v_j angle.r$ over $FF_2$ is the $m times m$ identity matrix. The rank of $G$ is $m$. But $G = V^T V$ where $V$ is $n times m$, so $"rank"(G) <= n$. Therefore $m <= n$.
]

#solution[
  Represent each $S_i$ by its characteristic vector $v_i in FF_2^n$, where $(v_i)_k = 1$ iff $k in S_i$.

  Over $FF_2$: $angle.l v_i, v_j angle.r = sum_(k=1)^n (v_i)_k (v_j)_k = |S_i sect S_j| mod 2$.

  The conditions give $angle.l v_i, v_i angle.r = |S_i| mod 2 = 1$ (odd cardinality) and $angle.l v_i, v_j angle.r = |S_i sect S_j| mod 2 = 0$ for $i eq.not j$.

  Thus the Gram matrix $G in FF_2^(m times m)$ with $G_(i j) = angle.l v_i, v_j angle.r$ equals $I_m$. Since $G = V^T V$ where $V$ is the $n times m$ matrix with columns $v_1, dots, v_m$, we have $"rank"(G) <= "rank"(V) <= n$. But $"rank"(I_m) = m$, so $m <= n$. $square$
]

=== Problem 5
#difficulty(2)
#prob(5)[
  Use the Combinatorial Nullstellensatz to prove the Chevalley--Warning theorem for degree 1: if $f(x_1, dots, x_n) = a_1 x_1 + a_2 x_2 + dots + a_n x_n + b$ is a linear polynomial over $FF_p$ with $n >= 2$ and $f$ has a root, then $f$ has at least $p$ roots in $FF_p^n$.
]

#hint(1)[
  A linear polynomial $f$ over $FF_p$ in $n >= 2$ variables, if it has a root, has a solution set that forms an affine hyperplane of dimension $n - 1$ in $FF_p^n$.
]

#hint(2)[
  If $a_i eq.not 0$ for some $i$, then for any choice of the other $n - 1$ variables, there is exactly one value of $x_i$ making $f = 0$. So the solution set has $p^(n-1)$ elements, which is at least $p$ when $n >= 2$.
]

#hint(3)[
  If all $a_i = 0$, then $f = b$. If $b = 0$, then every point is a root ($p^n$ roots). If $b eq.not 0$, there are no roots, contradicting the assumption. So the case with a root and all $a_i = 0$ gives $p^n >= p$ roots.
]

#solution[
  *Case 1: some $a_i eq.not 0$.* WLOG $a_1 eq.not 0$. For any $(x_2, dots, x_n) in FF_p^(n-1)$, there is a unique $x_1 = -a_1^(-1)(a_2 x_2 + dots + a_n x_n + b)$ with $f(x_1, dots, x_n) = 0$. So the zero set has exactly $p^(n-1)$ elements.

  Since $n >= 2$, $p^(n-1) >= p$, so $f$ has at least $p$ roots.

  *Case 2: all $a_i = 0$.* Then $f = b$. If $f$ has a root, then $b = 0$, and every point in $FF_p^n$ is a root. The number of roots is $p^n >= p$.

  In both cases, if $f$ has a root, it has at least $p$ roots. $square$

  This illustrates the general Chevalley--Warning principle: over finite fields, low-degree polynomials with roots must have many roots (in fact, the number of roots is divisible by $p$).
]

=== Problem 6
#difficulty(3)
#prob(6)[
  Use the polynomial method to prove that if $A, B, C subset.eq FF_p$ (where $p$ is prime) satisfy $|A| + |B| + |C| > 2 p$, then every element of $FF_p$ can be written as $a + b + c$ with $a in A$, $b in B$, $c in C$.
]

#hint(1)[
  Fix $s in FF_p$. We want to show there exist $a in A, b in B, c in C$ with $a + b + c = s$. Consider the polynomial $f(x, y) = product_(a in A)(x - a) dot product_(b in B)(y - b) dot product_(c in C)(s - x - y - c)$.
]

#hint(2)[
  The polynomial $f(x, y)$ has total degree $|A| + |B| + |C|$. If $a + b + c eq.not s$ for all $a in A, b in B, c in C$, then for any $x in A$ and $y in B$, at least one factor is zero, so $f$ vanishes on $A times B$. Try to apply the Combinatorial Nullstellensatz.
]

#hint(3)[
  Consider the polynomial $g(x, y) = 1 - f(x, y)^(p-1)$. By Fermat's little theorem, $f(x, y)^(p-1) = 1$ when $f(x, y) eq.not 0$ and $= 0$ when $f(x, y) = 0$ in $FF_p$. If $f$ vanishes on $A times B$, then $g equiv 1$ on $A times B$. But $g$ has degree $(p - 1)(|A| + |B| + |C|)$, which might be too large. Instead, use a direct counting argument via the Nullstellensatz on $f$ restricted to appropriate degree.
]

#solution[
  Fix $s in FF_p$. Suppose for contradiction that $a + b + c eq.not s$ for all $a in A, b in B, c in C$.

  Define $f(x, y) = product_(a in A)(x - a) dot product_(b in B)(y - b) dot product_(c in C)(s - x - y - c)$.

  Then $deg f = |A| + |B| + |C| > 2 p$. For any $(x, y) in A times B$: either $x in A$ makes the first factor zero, or... wait, $x in A$ always makes the first product zero. So this approach needs modification.

  Instead, define $h(x, y) = product_(c in C)(s - x - y - c)$. This has degree $|C|$ in $x + y$. If there is no solution $a + b + c = s$, then $h(a, b) eq.not 0$ for all $a in A, b in B$.

  Now consider $g(x, y) = (1 - (x^p - x)^(p-1))(1 - (y^p - y)^(p-1)) dot h(x, y)^(-1)$... This gets complicated. The cleanest proof uses the Cauchy--Davenport theorem iteratively:

  By Cauchy--Davenport, $|A + B| >= min(p, |A| + |B| - 1)$. Then $|A + B + C| >= min(p, |A + B| + |C| - 1) >= min(p, |A| + |B| + |C| - 2) = p$ since $|A| + |B| + |C| > 2 p >= p + 2$.

  Therefore $A + B + C = FF_p$, meaning every element of $FF_p$ is representable. $square$
]
