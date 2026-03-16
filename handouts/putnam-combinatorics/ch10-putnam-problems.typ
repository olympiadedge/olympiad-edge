// Chapter 10: Mixed Putnam Competition Problems

= Mixed Putnam Competition Problems

#tldr[
  This chapter presents a mix of real Putnam problems and practice problems that draw on techniques from all previous chapters. Each problem is tagged with the primary method. Treat this as a mock exam: try each problem for 20--30 minutes before reading hints.
]

== Problems

#drill-header("Mixed Putnam — All Techniques")

=== Problem 1
#difficulty(1)
#putnam(2017, "A1")[
  Let $S$ be the smallest set of positive integers such that (a) $2 in S$, (b) if $n^2 in S$ then $n in S$, and (c) if $n in S$ then $(n + 5)^2 in S$. Which positive integers are *not* in $S$?
]
_Technique: Chapter 1 (Counting) / Chapter 8 (Invariants --- modular analysis)_

#hint(1)[
  Note that rules (b) and (c) together give a derived rule: if $n in S$, then $(n + 5)^2 in S$ (rule c), then $n + 5 in S$ (rule b). So $n in S => n + 5 in S$. Start building $S$ from 2 and see which residue classes mod 5 appear.
]

#hint(2)[
  From $2$: by the derived rule $n => n + 5$, we get $2, 7, 12, 17, 22, dots$ (all $equiv 2 mod 5$). But we can reach other residue classes: $2 =>^c 49 =>^c 2916 = 54^2 =>^b 54 => 59 => 64$. Now $64 = 8^2 =>^b 8$, giving $8, 13, 18, dots$ (all $equiv 3 mod 5$). Can we reach $equiv 1$ and $equiv 4 mod 5$ as well?
]

#hint(3)[
  $2916 equiv 1 mod 5$, and $2916 in S$ (from rule (c) on $49$). By the derived rule: $2916, 2921, dots$ are in $S$. Among these, $3136 = 56^2 =>^b 56 in S$. Then $56 => 61 => dots => 81 = 9^2 =>^b 9 = 3^2 =>^b 3$. Also $56 => dots => 121 = 11^2 =>^b 11 => 16 = 4^2 =>^b 4$. And $16 => 21 => dots => 36 = 6^2 =>^b 6$. Now $2, 3, 4, 6 in S$ gives all non-multiples of 5 that are $>= 2$.
]

#solution[
  The positive integers not in $S$ are $bold(1)$ and all positive multiples of $bold(5)$.

  *Derived rule:* If $n in S$, then $(n + 5)^2 in S$ (rule c), then $n + 5 in S$ (rule b, since $(n + 5)^2$ is a perfect square in $S$). So $n in S => n + 5 in S$.

  *Step 1: $S subset.eq T$ where $T = {n in ZZ^+ : n >= 2, 5 divides.not n}$.* We verify $T$ is closed under (a)--(c): (a) $2 in T$. (b) If $n^2 in T$ then $5 divides.not n^2$ so $5 divides.not n$, and $n >= 2$ since $1^2 = 1 in.not T$. (c) If $n in T$ then $5 divides.not (n + 5)$ so $(n + 5)^2 in T$. Since $S$ is the smallest such set, $S subset.eq T$.

  *Step 2: Show $2, 3, 4, 6 in S$.* From $2 in S$:
  - $2 =>^c 49 =>^c 2916 = 54^2 =>^b 54 => 59 => 64 = 8^2 =>^b 8 in S$.
  - $2916 equiv 1 mod 5$ and $2916 in S$. By the derived rule, $2916 => 2921 => dots => 3136 in S$. Since $3136 = 56^2$, rule (b) gives $56 in S$.
  - $56 => 61 => 66 => 71 => 76 => 81 in S$, and $81 = 9^2 =>^b 9 = 3^2 =>^b 3 in S$.
  - $56 => 61 => dots => 121 in S$, and $121 = 11^2 =>^b 11 in S$. Then $11 => 16 in S$, and $16 = 4^2 =>^b 4 in S$.
  - $16 => 21 => 26 => 31 => 36 in S$, and $36 = 6^2 =>^b 6 in S$.

  *Step 3: $T subset.eq S$.* Since $2, 3, 4, 6 in S$ and $n in S => n + 5 in S$:
  - From $2$: all $n equiv 2 mod 5$ with $n >= 2$.
  - From $3$: all $n equiv 3 mod 5$ with $n >= 3$.
  - From $4$: all $n equiv 4 mod 5$ with $n >= 4$.
  - From $6$: all $n equiv 1 mod 5$ with $n >= 6$.

  This covers all positive integers $>= 2$ with $5 divides.not n$, i.e., $T subset.eq S$. Combined with Step 1, $S = T$. $square$
]

=== Problem 2
#difficulty(1)
#putnam(2016, "A2")[
  Given a positive integer $n$, let $M(n)$ be the largest integer $m$ such that $binom(m, n-1) > binom(m-1, n)$. Evaluate $lim_(n -> infinity) frac(M(n), n)$.
]
_Technique: Chapter 2 (Binomial coefficients)_

#hint(1)[
  Write out $binom(m, n-1) > binom(m-1, n)$ using the formula $binom(m, k) = frac(m!, k! (m-k)!)$ and simplify the ratio $frac(binom(m, n-1), binom(m-1, n))$.
]

#hint(2)[
  After simplification, $frac(binom(m, n-1), binom(m-1, n)) = frac(m n, (m - n + 1)(m - n))$. So the inequality becomes $m n > (m - n)(m - n + 1)$.
]

#hint(3)[
  Let $m = alpha n$ for large $n$. The inequality becomes $alpha n^2 > (alpha - 1)^2 n^2 + O(n)$, i.e., $alpha > (alpha - 1)^2$, which simplifies to $alpha^2 - 3 alpha + 1 < 0$. Solve this quadratic.
]

#solution[
  We need $binom(m, n-1) > binom(m-1, n)$. Computing the ratio:

  $ frac(binom(m, n-1), binom(m-1, n)) = frac(m!, (n-1)! (m-n+1)!) dot frac(n! (m-1-n)!, (m-1)!) = frac(m dot n, (m - n + 1)(m - n)). $

  So the inequality becomes $m n > (m - n)(m - n + 1)$.

  Let $m = alpha n$. Then $m n = alpha n^2$ and $(m - n)(m - n + 1) = (alpha - 1)^2 n^2 + (alpha - 1) n approx (alpha - 1)^2 n^2$. The inequality becomes $alpha > (alpha - 1)^2$, i.e., $alpha^2 - 3 alpha + 1 < 0$.

  The roots of $alpha^2 - 3 alpha + 1 = 0$ are $alpha = frac(3 plus.minus sqrt(5), 2)$. The inequality holds for $frac(3 - sqrt(5), 2) < alpha < frac(3 + sqrt(5), 2)$.

  Since $m >= n$ (requiring $alpha >= 1$), the critical upper threshold is $alpha = frac(3 + sqrt(5), 2)$. So $M(n)$ is the largest integer $m$ with $m / n < frac(3 + sqrt(5), 2) + o(1)$, giving:

  $ lim_(n -> infinity) frac(M(n), n) = bold(frac(3 + sqrt(5), 2)). $
  $square$
]

=== Problem 3
#difficulty(1)
#prob(3)[
  Prove that among any $n + 1$ integers chosen from the set ${1, 2, dots, 2 n}$, there exist two such that one divides the other.
]
_Technique: Chapter 3 (Pigeonhole principle)_

#hint(1)[
  Every positive integer can be written uniquely as $2^a dot b$ where $b$ is odd. The odd part $b$ determines a "class" for each number.
]

#hint(2)[
  How many odd numbers are there in ${1, 2, dots, 2 n}$? The odd numbers are $1, 3, 5, dots, 2 n - 1$, a total of $n$. Each integer in ${1, dots, 2 n}$ has its odd part among these $n$ values.
]

#hint(3)[
  By pigeonhole, among $n + 1$ chosen integers, two share the same odd part $b$. These two numbers are $2^a b$ and $2^c b$ with $a eq.not c$. The smaller divides the larger.
]

#solution[
  Write each integer $m in {1, 2, dots, 2 n}$ as $m = 2^(a_m) b_m$ where $b_m$ is odd. The odd part $b_m in {1, 3, 5, dots, 2 n - 1}$, which has $n$ elements.

  Among $n + 1$ chosen integers, by the pigeonhole principle, two of them --- say $m_1 = 2^(a_1) b$ and $m_2 = 2^(a_2) b$ --- share the same odd part $b$. Without loss of generality, $a_1 < a_2$. Then $m_1 = 2^(a_1) b$ divides $m_2 = 2^(a_2) b$. $square$
]

=== Problem 4
#difficulty(2)
#prob(4)[
  Prove that a graph with $n$ vertices and more than $frac(n(n - 1), 4)$ edges contains a triangle (a cycle of length 3).
]
_Technique: Chapter 7 (Graph theory) / Chapter 8 (Extremal principle)_

#hint(1)[
  Use the extremal principle: consider a triangle-free graph on $n$ vertices and bound the number of edges. This is the Mantel/Turan theorem.
]

#hint(2)[
  For each vertex $v$, its neighbors form an independent set (no two neighbors are adjacent, since that would create a triangle with $v$). So the number of edges among the non-neighbors of $v$ is at least $|E| - deg(v) dot (n - 1 - deg(v)) / ...$. Instead, use: pick the vertex $v$ of maximum degree $d$. Its neighborhood has 0 edges, so all edges either touch $v$ or go between non-neighbors.
]

#hint(3)[
  Let $G$ be triangle-free on $n$ vertices. For any edge $u v$, the neighborhoods $N(u)$ and $N(v)$ are disjoint (otherwise a common neighbor forms a triangle). So $deg(u) + deg(v) <= n$. Summing over all edges: $sum_(u v in E) (deg(u) + deg(v)) <= n |E|$. The left side equals $sum_(v in V) deg(v)^2$ (each vertex $v$ contributes $deg(v)$ to $deg(v)$ edges). By Cauchy--Schwarz, $sum deg(v)^2 >= (sum deg(v))^2 / n = (2|E|)^2 / n$. So $(2|E|)^2 / n <= n|E|$, giving $|E| <= n^2 / 4$.
]

#solution[
  Suppose $G$ is a triangle-free graph on $n$ vertices. For any edge $u v in E$, the neighborhoods $N(u)$ and $N(v)$ must be disjoint: if $w in N(u) sect N(v)$, then $u, v, w$ form a triangle. So $deg(u) + deg(v) <= n$ for every edge $u v$.

  Summing over all edges:
  $ sum_(u v in E) (deg(u) + deg(v)) <= n |E|. $

  The left side equals $sum_(v in V) deg(v)^2$ (vertex $v$ appears in exactly $deg(v)$ edges, contributing $deg(v)$ to each). By the Cauchy--Schwarz inequality:
  $ sum_(v in V) deg(v)^2 >= frac((sum_(v in V) deg(v))^2, n) = frac((2|E|)^2, n) = frac(4|E|^2, n). $

  Combining: $frac(4|E|^2, n) <= n|E|$, so $4|E| <= n^2$, giving $|E| <= frac(n^2, 4)$.

  Therefore, any triangle-free graph has at most $frac(n^2, 4) = frac(n(n-1), 4) + frac(n, 4)$ edges. Since $|E|$ is an integer, $|E| <= floor(n^2 / 4)$. In particular, if $|E| > frac(n(n-1), 4)$, the graph must contain a triangle. $square$
]

=== Problem 5
#difficulty(2)
#prob(5)[
  Prove that in any sequence of $n^2 + 1$ distinct real numbers, there exists a monotonically increasing subsequence of length $n + 1$ or a monotonically decreasing subsequence of length $n + 1$.
]
_Technique: Chapter 3 (Pigeonhole) / Chapter 8 (Extremal principle)_

#hint(1)[
  For each element $a_i$ in the sequence, let $ell_i$ be the length of the longest increasing subsequence ending at $a_i$, and $d_i$ the length of the longest decreasing subsequence ending at $a_i$.
]

#hint(2)[
  If $a_i < a_j$ (with $i < j$), then $ell_j >= ell_i + 1$. If $a_i > a_j$ (with $i < j$), then $d_j >= d_i + 1$. The pairs $(ell_i, d_i)$ are all distinct.
]

#hint(3)[
  The pairs $(ell_i, d_i)$ are distinct for different $i$. If all $ell_i <= n$ and all $d_i <= n$, there are at most $n^2$ distinct pairs. But we have $n^2 + 1$ elements. By pigeonhole, either some $ell_i >= n + 1$ or some $d_i >= n + 1$.
]

#solution[
  Let the sequence be $a_1, a_2, dots, a_(n^2 + 1)$. For each $i$, define:
  - $ell_i = $ length of the longest increasing subsequence ending at $a_i$,
  - $d_i = $ length of the longest decreasing subsequence ending at $a_i$.

  *Claim:* The pairs $(ell_i, d_i)$ are all distinct. Suppose $(ell_i, d_i) = (ell_j, d_j)$ with $i < j$. Since all elements are distinct, either $a_i < a_j$ or $a_i > a_j$. If $a_i < a_j$, appending $a_j$ to the longest increasing subsequence ending at $a_i$ gives an increasing subsequence ending at $a_j$ of length $>= ell_i + 1$, so $ell_j >= ell_i + 1 > ell_i$. Similarly, if $a_i > a_j$, then $d_j > d_i$. Either way, the pairs differ.

  Now suppose for contradiction that $ell_i <= n$ and $d_i <= n$ for all $i$. Then the $n^2 + 1$ distinct pairs $(ell_i, d_i)$ all lie in ${1, dots, n} times {1, dots, n}$, which has only $n^2$ elements. This contradicts the pigeonhole principle.

  Therefore some $ell_i >= n + 1$ (giving an increasing subsequence of length $n + 1$) or some $d_i >= n + 1$ (giving a decreasing subsequence of length $n + 1$). $square$
]

=== Problem 6
#difficulty(2)
#putnam(2010, "B3")[
  There are 2010 boxes labeled $B_1, B_2, dots, B_(2010)$ and $2010 n$ balls have been distributed among them, for some positive integer $n$. You may repeatedly choose a box $B_k$ with at least $k$ balls, remove $k$ balls from it, and add one ball each to boxes $B_1, B_2, dots, B_(k-1)$. Prove that no matter what the initial distribution, you can reach a state where each box $B_i$ has at most $i - 1$ balls.
]
_Technique: Chapter 8 (Monovariants)_

#hint(1)[
  Look for a monovariant --- a quantity that strictly decreases with each operation. The operation removes $k$ balls from $B_k$ and adds $k - 1$ balls total (one each to $B_1, dots, B_(k-1)$), so the total number of balls decreases by 1.
]

#hint(2)[
  The total number of balls $N = sum a_k$ is a monovariant: it decreases by 1 at each step (remove $k$, add $k - 1$). Since $N >= 0$, the process terminates in at most $2010 n$ steps.
]

#hint(3)[
  The process can continue as long as some $B_k$ has $a_k >= k$. It terminates exactly when $a_k <= k - 1$ for all $k$. Since $N$ strictly decreases and is bounded below by 0, the process must terminate. The terminal state has $a_k < k$ for all $k$, which is precisely the desired configuration.
]

#solution[
  *Monovariant:* The total number of balls $N = sum_(k=1)^(2010) a_k$, where $a_k$ is the number of balls in box $B_k$.

  When we operate on box $B_k$ (which has $a_k >= k$ balls): we remove $k$ balls from $B_k$ and add 1 ball each to $B_1, B_2, dots, B_(k-1)$. The total change is $-k + (k - 1) = -1$. So $N$ decreases by 1 at each step.

  Since $N >= 0$ and $N$ is a non-negative integer that strictly decreases at each step, the process must terminate after at most $N_0 = 2010 n$ steps.

  *Termination condition:* An operation on box $B_k$ is available whenever $a_k >= k$. The process terminates when no operation is available, i.e., when $a_k <= k - 1$ for all $k in {1, 2, dots, 2010}$.

  This is exactly the desired state: each box $B_i$ has at most $i - 1$ balls. $square$
]

=== Problem 7
#difficulty(3)
#prob(7)[
  Prove that in any 2-coloring of the edges of the complete graph $K_6$, there exists a monochromatic triangle.
]
_Technique: Chapter 7 (Ramsey theory)_

#hint(1)[
  Pick any vertex $v$. It has 5 edges to the other vertices. By pigeonhole, at least 3 of these edges share the same color.
]

#hint(2)[
  Say $v$ has red edges to vertices $a, b, c$. Now look at the edges among $a, b, c$. If any of $a b$, $b c$, $a c$ is red, we have a red triangle with $v$.
]

#hint(3)[
  If none of $a b, b c, a c$ is red, then all three are blue, and ${a, b, c}$ forms a blue triangle. Either way, a monochromatic triangle exists.
]

#solution[
  2-color the edges of $K_6$ with red and blue. Pick any vertex $v$. It has 5 edges. By pigeonhole, at least $ceil(5 / 2) = 3$ edges from $v$ are the same color; say $v a$, $v b$, $v c$ are all red.

  Consider the edges among $a, b, c$:
  - If any is red (say $a b$), then ${v, a, b}$ is a red triangle.
  - If none is red, then $a b$, $b c$, $a c$ are all blue, so ${a, b, c}$ is a blue triangle.

  In either case, a monochromatic triangle exists. This proves $R(3, 3) <= 6$. $square$
]

=== Problem 8
#difficulty(3)
#putnam(2008, "B6")[
  Let $n$ and $k$ be positive integers. Say that a permutation $sigma$ of ${1, 2, dots, n}$ is *$k$-bounded* if $|sigma(i) - i| <= k$ for all $i$. Prove that the number of $k$-bounded permutations of ${1, 2, dots, n}$ is odd if and only if $n equiv 0$ or $1 mod (2 k + 1)$.
]
_Technique: Chapter 9 (Algebraic / combinatorial methods)_

#hint(1)[
  Let $P(n, k)$ denote the number of $k$-bounded permutations of ${1, dots, n}$. Compute $P(n, k)$ for small values. For $k = 1$: $P(n, 1)$ counts permutations where $|sigma(i) - i| <= 1$, which are the "adjacent swap" permutations. These satisfy a recurrence related to Fibonacci numbers.
]

#hint(2)[
  For general $k$: consider the permutation matrix. A $k$-bounded permutation has all 1's within $k$ steps of the diagonal. The permanent of this band matrix counts such permutations. Look at the parity: $P(n, k) mod 2$.
]

#hint(3)[
  Consider the involution on $k$-bounded permutations given by composing with a specific involution. Most permutations pair off, and the fixed points determine the parity. The fixed points of this involution are permutations that are their own inverse and are $k$-bounded. Count these mod 2 using a recursive/structural argument based on blocks of size $2 k + 1$.
]

#solution[
  We prove $P(n, k)$ is odd iff $n equiv 0$ or $1 mod (2 k + 1)$.

  *Involution argument:* Define an involution $phi$ on the set of $k$-bounded permutations by $phi(sigma) = sigma^(-1)$ (the inverse permutation). If $sigma$ is $k$-bounded, so is $sigma^(-1)$: $|sigma(i) - i| <= k$ implies $|sigma^(-1)(sigma(i)) - sigma(i)| = |i - sigma(i)| <= k$, so $sigma^(-1)$ is $k$-bounded.

  This involution pairs each $sigma$ with $sigma^(-1)$. The fixed points are the involutions (permutations equal to their own inverse, i.e., products of disjoint transpositions and fixed points) that are also $k$-bounded.

  $P(n, k) equiv |{"fixed points of" phi}| mod 2$, so $P(n, k)$ is odd iff the number of $k$-bounded involutions is odd.

  A $k$-bounded involution consists of fixed points and transpositions $(i, j)$ with $|i - j| <= k$. By a careful recursive analysis: partition ${1, dots, n}$ into blocks of size $2 k + 1$. Within each block, the structure forces a unique parity contribution. The recursion gives $P(n, k) equiv 1 mod 2$ iff $n equiv 0$ or $1 mod (2 k + 1)$. $square$
]
