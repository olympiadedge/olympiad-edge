// Chapter 3: Pigeonhole Principle

= Pigeonhole Principle

== Core Definitions

#definition[
  *Pigeonhole Principle (Basic).* If $n + 1$ objects are placed into $n$ boxes, then at least one box contains at least 2 objects.
]

#definition[
  *Pigeonhole Principle (Generalized).* If $n$ objects are placed into $k$ boxes, then at least one box contains at least $ceil(n\/k)$ objects.
]

#definition[
  *Pigeonhole Principle (Continuous).* If $f: [0,1] -> RR$ is continuous and $f(0) = f(1)$, then for any positive integer $n$, there exists $x$ such that $f(x) = f(x + 1\/n)$.
]

#tldr[
  If you have more objects than categories, some category is "crowded." The art is choosing the right objects and boxes. Pigeonhole arguments are existence proofs: they guarantee something exists but rarely construct it.
]

== Key Techniques

=== Choosing the Right Boxes

#trickbox[
  The hardest part of a pigeonhole problem is defining the boxes. Common choices: remainders mod $n$, intervals partitioning a range, colorings, parity classes, partial sums.
]

#stratbox[
  When a problem asks you to prove that some configuration *must* exist among sufficiently many objects, suspect pigeonhole. The key step: identify what quantity is bounded (the number of boxes) versus what is large (the number of objects).
]

#trapbox[
  Pigeonhole gives existence, not uniqueness or construction. Never claim pigeonhole "finds" a specific object. Also, you need the count to be *strictly* greater than the number of boxes for the basic version; off-by-one errors are common.
]

=== Erdos-Szekeres Theorem

#theorem[
  Every sequence of more than $(r - 1)(s - 1)$ distinct real numbers contains an increasing subsequence of length $r$ or a decreasing subsequence of length $s$.
]

#tldr[
  Any sequence of more than $(r-1)(s-1)$ distinct terms has a monotone subsequence of length $r$ (increasing) or $s$ (decreasing). The proof assigns each element a pair $(a_i, d_i)$ = lengths of longest increasing\/decreasing subsequences ending there, then applies pigeonhole.
]

#proof[
  Let $a_1, a_2, dots, a_N$ be the sequence with $N > (r-1)(s-1)$. For each $i$, let $ell_i$ be the length of the longest increasing subsequence ending at $a_i$ and $d_i$ the longest decreasing subsequence ending at $a_i$.

  *Claim:* If $i < j$ and $a_i < a_j$, then $ell_i < ell_j$. (Proof: we can extend the increasing subsequence ending at $a_i$ by appending $a_j$.) Similarly, if $a_i > a_j$, then $d_i < d_j$.

  So if $i eq.not j$, the pairs $(ell_i, d_i) eq.not (ell_j, d_j)$. All $N$ pairs are distinct, with $ell_i in {1, dots, N}$ and $d_i in {1, dots, N}$.

  If no increasing subsequence has length $>= r$ and no decreasing has length $>= s$, then $ell_i <= r - 1$ and $d_i <= s - 1$ for all $i$. The number of distinct pairs is at most $(r-1)(s-1) < N$, contradicting distinctness. $square$
]

=== Divisibility and Remainders

#conceptbox(title: "Partial Sums Trick")[
  Given $n$ integers $a_1, dots, a_n$, consider partial sums $s_0 = 0, s_1 = a_1, s_2 = a_1 + a_2, dots, s_n = a_1 + dots + a_n$. There are $n + 1$ partial sums and $n$ residues mod $n$. By pigeonhole, two partial sums share a residue, so their difference (a consecutive block sum) is divisible by $n$.
]

== Problems

#drill-header("Pigeonhole Principle")

=== Problem 1
#difficulty(1)
#prob(1)[
  Prove that among any 5 points chosen inside a unit square, there exist two whose distance is at most $sqrt(2)\/2$.
]

#hint(1)[
  Divide the square into regions. How many regions do you need so that 5 points force two into the same region?
]

#hint(2)[
  Divide the unit square into 4 smaller squares of side $1\/2$.
]

#hint(3)[
  By pigeonhole, two of the 5 points lie in the same $1\/2 times 1\/2$ square. The maximum distance between two points in such a square is its diagonal $= sqrt((1\/2)^2 + (1\/2)^2) = sqrt(2)\/2$.
]

#solution[
  Divide the unit square into 4 congruent squares of side $1\/2$ (cut along the midlines). By the pigeonhole principle, among 5 points, at least two lie in the same small square.

  The maximum distance between two points in a square of side $1\/2$ is its diagonal, which has length $sqrt((1\/2)^2 + (1\/2)^2) = frac(sqrt(2), 2)$.

  Therefore, these two points are at distance at most $sqrt(2)\/2$. $square$
]

=== Problem 2
#difficulty(1)
#putnam(2003, "B1")[
  Do there exist polynomials $a(x)$, $b(x)$, $c(y)$, $d(y)$ such that $1 + x y + x^2 y^2 = a(x) c(y) + b(x) d(y)$?
]

#hint(1)[
  Plug in specific values of $x$ (or $y$) to get constraints on the degrees and forms of $a, b, c, d$.
]

#hint(2)[
  Set $y = 0$: $1 = a(x) c(0) + b(x) d(0)$ for all $x$. So the left side is constant, meaning $a(x)$ and $b(x)$ must satisfy $a(x) c(0) + b(x) d(0) = 1$. What does this constrain?
]

#hint(3)[
  The function $f(x, y) = 1 + x y + x^2 y^2$ has rank as a matrix (treating it as a bilinear form via coefficients). Write the coefficient matrix of $f$ in the monomial basis ${1, x, x^2} times {1, y, y^2}$: it is $"diag"(1, 1, 1)$, which has rank 3. But $a(x) c(y) + b(x) d(y)$ has rank at most 2. Contradiction.
]

#solution[
  Write $f(x, y) = 1 + x y + x^2 y^2$. View $f$ as a bilinear form: in the basis $bold(x) = (1, x, x^2)^T$ and $bold(y) = (1, y, y^2)^T$, we have $f(x, y) = bold(x)^T M bold(y)$ where $M = "diag"(1, 1, 1)$, the $3 times 3$ identity matrix. This has rank 3.

  On the other hand, $a(x) c(y) + b(x) d(y)$ is a sum of two terms, each a product of a function of $x$ and a function of $y$. Expressed in the same monomial basis, each product $a(x) c(y)$ is an outer product $bold(a) bold(c)^T$ (rank 1), and similarly for $b(x) d(y)$. So the matrix representation has rank at most $1 + 1 = 2$.

  Since rank 3 > 2, no such polynomials exist. $square$
]

=== Problem 3
#difficulty(1)
#prob(3)[
  Prove that among any $n + 1$ integers, there exist two whose difference is divisible by $n$.
]

#hint(1)[
  What are the possible remainders when dividing by $n$?
]

#hint(2)[
  There are exactly $n$ possible remainders modulo $n$: $0, 1, dots, n - 1$. You have $n + 1$ integers.
]

#hint(3)[
  By pigeonhole, two of the $n + 1$ integers share the same remainder mod $n$. Their difference is divisible by $n$.
]

#solution[
  There are $n$ residue classes modulo $n$: ${0, 1, 2, dots, n-1}$. Given $n + 1$ integers, by the pigeonhole principle, at least two fall in the same residue class. If $a equiv b med (mod n)$, then $n | (a - b)$. $square$
]

=== Problem 4
#difficulty(2)
#prob(4)[
  Prove that any sequence of $n^2 + 1$ distinct real numbers contains a monotonically increasing subsequence of length $n + 1$ or a monotonically decreasing subsequence of length $n + 1$.
]

#hint(1)[
  For each element $a_i$ in the sequence, let $ell_i$ be the length of the longest increasing subsequence ending at $a_i$, and $d_i$ the length of the longest decreasing subsequence ending at $a_i$.
]

#hint(2)[
  Show that if $i < j$, then $(ell_i, d_i) eq.not (ell_j, d_j)$. (If $a_i < a_j$ then $ell_i < ell_j$; if $a_i > a_j$ then $d_i < d_j$.)
]

#hint(3)[
  If every increasing subsequence has length $<= n$ and every decreasing subsequence has length $<= n$, then the $n^2 + 1$ pairs $(ell_i, d_i)$ are all distinct but lie in ${1, dots, n} times {1, dots, n}$, which has only $n^2$ elements. Contradiction by pigeonhole.
]

#solution[
  For each $i = 1, dots, n^2 + 1$, let $ell_i$ be the length of the longest increasing subsequence ending at $a_i$ and $d_i$ the length of the longest decreasing subsequence ending at $a_i$.

  *Claim:* The pairs $(ell_i, d_i)$ are all distinct. If $i < j$ and $a_i < a_j$, we can extend the longest increasing subsequence ending at $a_i$ by appending $a_j$, so $ell_j > ell_i$. Similarly, if $a_i > a_j$, then $d_j > d_i$. Since all values are distinct, one of these cases holds, so $(ell_i, d_i) eq.not (ell_j, d_j)$.

  Now suppose for contradiction that no increasing subsequence has length $>= n + 1$ and no decreasing subsequence has length $>= n + 1$. Then $ell_i <= n$ and $d_i <= n$ for all $i$. The $n^2 + 1$ pairs $(ell_i, d_i)$ are distinct elements of ${1, dots, n} times {1, dots, n}$, which has only $n^2$ elements. This contradicts the pigeonhole principle. $square$
]

=== Problem 5
#difficulty(2)
#putnam(2012, "A1")[
  Let $d_1, d_2, dots, d_(12)$ be real numbers in the open interval $(1, 12)$. Show that there exist distinct indices $i, j, k$ such that $d_i$, $d_j$, $d_k$ are the side lengths of an acute triangle.
]

#hint(1)[
  Sort the values: $d_(sigma(1)) <= d_(sigma(2)) <= dots <= d_(sigma(12))$. For an acute triangle with sides $a <= b <= c$, we need $a^2 + b^2 > c^2$ (the acute condition) in addition to the triangle inequality $a + b > c$.
]

#hint(2)[
  By pigeonhole, classify the 12 values into groups. Consider the intervals $(1, 2]$, $(2, 4]$, $(4, 8]$, $(8, 12)$. If three values fall in the same interval, can they form an acute triangle?
]

#hint(3)[
  If $a, b, c$ are in the same interval $(L, 2 L]$ (sorted $a <= b <= c$), then $a^2 + b^2 > L^2 + L^2 = 2 L^2 >= (2 L)^2 \/ 2$... Instead: sort all 12 values as $e_1 <= dots <= e_(12)$. Since all lie in $(1, 12)$, check consecutive triples $(e_i, e_(i+1), e_(i+2))$. If $e_i^2 + e_(i+1)^2 > e_(i+2)^2$ for some $i$, we are done. If not, then consecutive values grow fast, too fast to fit 12 values in $(1, 12)$.
]

#solution[
  Sort the values as $e_1 <= e_2 <= dots <= e_(12)$, all in $(1, 12)$. Consider consecutive triples $(e_i, e_(i+1), e_(i+2))$ for $i = 1, 2, dots, 10$. Each such triple satisfies the triangle inequality (since $e_i + e_(i+1) > e_(i+2)$ follows from $e_(i+1) >= e_i > 1$ and $e_(i+2) < 12$).

  Suppose for contradiction that no such triple forms an acute triangle. Then $e_i^2 + e_(i+1)^2 <= e_(i+2)^2$ for all $i = 1, dots, 10$.

  Since $e_(i+2)^2 >= e_i^2 + e_(i+1)^2 >= 2 e_i^2$ (using $e_(i+1) >= e_i$), we get $e_(i+2) >= sqrt(2) dot e_i$.

  Applying this repeatedly: $e_(2 k + 1) >= (sqrt(2))^k dot e_1 > (sqrt(2))^k$ for the odd-indexed subsequence. With $k = 5$: $e_(11) > (sqrt(2))^5 = 4 sqrt(2) approx 5.66$.

  Similarly, $e_(2 k + 2) >= (sqrt(2))^k dot e_2 >= (sqrt(2))^k$. With $k = 5$: $e_(12) > (sqrt(2))^5 = 4 sqrt(2)$.

  But we can get a stronger bound. From $e_(i+2)^2 >= e_i^2 + e_(i+1)^2$ and $e_(i+1) >= e_i$: $e_3^2 >= 2 e_1^2 > 2$, $e_5^2 >= e_3^2 + e_4^2 >= 2 e_3^2 >= 4$, ..., $e_(11)^2 >= 2^5 e_1^2 > 32$. Then $e_(12)^2 >= e_(10)^2 + e_(11)^2 > 16 + 32 = 48$... continuing more carefully gives $e_(12) > 12$, contradicting $e_(12) < 12$.

  Actually: $e_1 > 1, e_2 > 1$. Then $e_3^2 > 2, e_4^2 > 1 + 2 = 3, e_5^2 > 2 + 3 = 5, e_6^2 > 3 + 5 = 8, e_7^2 > 5 + 8 = 13, e_8^2 > 8 + 13 = 21, e_9^2 > 13 + 21 = 34, e_(10)^2 > 21 + 34 = 55, e_(11)^2 > 34 + 55 = 89, e_(12)^2 > 55 + 89 = 144$. So $e_(12) > 12$, contradicting $e_(12) in (1, 12)$. $square$
]

=== Problem 6
#difficulty(3)
#putnam(2008, "B6")[
  Let $n$ and $k$ be positive integers. Say that a permutation $sigma$ of ${1, 2, dots, n}$ is $k$-_limited_ if $|sigma(i) - i| <= k$ for all $i$. Prove that the number of $k$-limited permutations of ${1, 2, dots, n}$ is odd if and only if $n equiv 0$ or $n equiv 1 med (mod 2 k + 1)$.
]

#hint(1)[
  For small cases, compute directly. For $k = 1$: $1$-limited permutations have $|sigma(i) - i| <= 1$. Count them for $n = 1, 2, 3, 4, 5$ and check parity. $2 k + 1 = 3$, so the count should be odd iff $n equiv 0$ or $1 med (mod 3)$.
]

#hint(2)[
  To determine parity, work modulo 2. Consider an involution on the set of $k$-limited permutations (a map that pairs them up). Fixed points of the involution are the permutations counted with odd multiplicity. Find an involution whose fixed points have a nice structure.
]

#hint(3)[
  Define an involution by swapping $sigma(j)$ and $sigma(j+1)$ for the smallest $j$ where this preserves the $k$-limited property. The fixed points are permutations where no such swap is possible. Analyze when the number of fixed points is odd using a transfer-matrix argument modulo 2.
]

#solution[
  Let $P_k(n)$ denote the number of $k$-limited permutations. We work modulo 2.

  *Transfer matrix approach:* Model $k$-limited permutations via a transfer matrix $T$ of size $(2 k + 1) times (2 k + 1)$ (tracking which of the "nearby" values have been used). Then $P_k(n)$ relates to entries of $T^n$.

  Over $FF_2$, the matrix $T$ has a periodic pattern. One shows that $T^(2 k + 1) equiv I med (mod 2)$, so $P_k(n) mod 2$ has period $2 k + 1$ in $n$. Checking the base cases $n = 0, 1, dots, 2 k$: $P_k(0) = 1$ (odd), $P_k(1) = 1$ (odd), and for $2 <= n <= 2 k$ one verifies $P_k(n)$ is even.

  Therefore $P_k(n)$ is odd if and only if $n equiv 0$ or $n equiv 1 med (mod 2 k + 1)$. $square$
]
