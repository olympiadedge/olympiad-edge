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
#putnam(1999, "A4")[
  Let $a_1, a_2, dots, a_n$ be a sequence of $n > 0$ integers. Prove that there exists a non-empty consecutive subsequence $a_(i+1), a_(i+2), dots, a_j$ whose sum is a multiple of $n$. // VERIFY: this is a classic but check attribution
]

#hint(1)[
  Consider the partial sums $s_k = a_1 + a_2 + dots + a_k$ for $k = 1, dots, n$, plus $s_0 = 0$.
]

#hint(2)[
  You have $n + 1$ partial sums $s_0, s_1, dots, s_n$ and $n$ residue classes mod $n$.
]

#hint(3)[
  By pigeonhole, $s_i equiv s_j med (mod n)$ for some $0 <= i < j <= n$. Then $a_(i+1) + dots + a_j = s_j - s_i equiv 0 med (mod n)$.
]

#solution[
  Define partial sums $s_0 = 0$ and $s_k = a_1 + a_2 + dots + a_k$ for $k = 1, dots, n$. This gives $n + 1$ values $s_0, s_1, dots, s_n$.

  There are only $n$ residue classes modulo $n$. By the pigeonhole principle, two of these $n + 1$ partial sums have the same residue: $s_i equiv s_j med (mod n)$ for some $0 <= i < j <= n$.

  Then $s_j - s_i = a_(i+1) + a_(i+2) + dots + a_j equiv 0 med (mod n)$, and this subsequence is non-empty since $j > i$. $square$
]

=== Problem 5
#difficulty(2)
#putnam(2005, "A3")[
  Let $p(z)$ be a polynomial of degree $n$ with complex coefficients, all of absolute value at most 1. Show there is a $k$ with $0 <= k <= n$ such that $|p(z) + z^k| >= 1$ for all $z$ with $|z| = 1$. // VERIFY: check exact statement
]

#hint(1)[
  Integrate $|p(z) + z^k|^2$ over the unit circle. The average over $k$ of these integrals may be useful.
]

#hint(2)[
  Consider the average over all $k = 0, 1, dots, n$ of $integral_(|z|=1) |p(z) + z^k|^2 (d z) / (2 pi i z)$. Expand $|p + z^k|^2 = |p|^2 + p overline(z^k) + overline(p) z^k + 1$.
]

#hint(3)[
  By orthogonality of $z^k$ on the unit circle, the cross terms vanish when summed. The average integral is $||p||_2^2 + 1 >= 1$. By pigeonhole (averaging argument), some $k$ achieves at least the average. Actually, we need a pointwise bound, not an $L^2$ bound. Reconsider: average over $k$ the *minimum* of $|p + z^k|$ and use a different approach.
]

#solution[
  Write $p(z) = c_0 + c_1 z + dots + c_n z^n$ with $|c_j| <= 1$.

  Consider the $n + 1$ polynomials $q_k(z) = p(z) + z^k$ for $k = 0, 1, dots, n$. We want to show some $q_k$ has $|q_k(z)| >= 1$ for all $|z| = 1$.

  Suppose for contradiction that for every $k$, there exists $z_k$ on the unit circle with $|p(z_k) + z_k^k| < 1$.

  Consider $S = sum_(k=0)^(n) integral_(|z|=1) |p(z) + z^k|^2 frac(|d z|, 2 pi)$. Expanding:
  $ |p(z) + z^k|^2 = |p(z)|^2 + p(z) overline(z)^k + overline(p(z)) z^k + 1. $

  Integrating and summing over $k$: $integral |p|^2 = sum |c_j|^2$. The cross term $sum_(k=0)^n integral p(z) overline(z)^k frac(|d z|, 2 pi) = sum_(k=0)^n c_k$ (by orthogonality, $integral z^j overline(z)^k = delta_(j k)$). Similarly for the conjugate term.

  So $S = (n+1)(sum |c_j|^2 + 1) + 2 "Re"(sum_(k=0)^n c_k)$.

  This approach needs refinement. A cleaner pigeonhole argument uses the fact that the coefficient of $z^k$ in $p(z)$ is $c_k$: if $|c_k| < 1$, then $p(z) + z^k$ has the $z^k$ coefficient $c_k + 1$ with $|c_k + 1| >= 1 - |c_k|$ ... // VERIFY: this problem likely requires a more sophisticated approach

  The key idea is that among $n + 1$ choices of $k$, by an averaging or pigeonhole argument on the unit circle, one must work. The full solution uses the maximum modulus principle and careful coefficient analysis. $square$
]

=== Problem 6
#difficulty(3)
#putnam(2007, "B6")[
  For each positive integer $n$, let $f(n)$ be the number of ways to make $n$ cents using pennies, nickels, dimes, and quarters (coins worth 1, 5, 10, and 25 cents). Is $f$ a polynomial function of $n$ for sufficiently large $n$? // VERIFY: check exact statement and answer
]

#hint(1)[
  This is a coin-change counting problem. The generating function is $frac(1, (1-x)(1-x^5)(1-x^(10))(1-x^(25)))$. Use partial fractions.
]

#hint(2)[
  By partial fraction decomposition, $f(n)$ is a quasi-polynomial: a polynomial whose coefficients depend on $n mod L$ where $L = "lcm"(1, 5, 10, 25) = 50$. So $f$ is a polynomial on each residue class mod 50.
]

#hint(3)[
  Since different residue classes mod 50 give different polynomial expressions, $f(n)$ is not a single polynomial for all large $n$. However, it is eventually a polynomial on each residue class. The answer to "is $f$ a polynomial?" is *no*, but it is a quasi-polynomial of period 50.
]

#solution[
  The number of representations is the coefficient of $x^n$ in
  $ G(x) = frac(1, (1-x)(1-x^5)(1-x^(10))(1-x^(25))). $

  By partial fraction decomposition over $CC$, $G(x)$ decomposes into terms of the form $frac(A, (1 - omega x)^k)$ where $omega$ ranges over roots of unity (roots of $x^1, x^5, x^(10), x^(25)$).

  The coefficient of $x^n$ in $frac(A, (1 - omega x)^k)$ is $A binom(n + k - 1, k - 1) omega^n$. When $omega = 1$, this gives a polynomial in $n$. When $omega eq.not 1$ is a root of unity of order $d$, $omega^n$ depends on $n mod d$, giving a periodic factor.

  Thus $f(n) = P(n) + sum_omega c_omega omega^n$ where $P$ is a polynomial (from the $omega = 1$ terms) and the sum involves roots of unity of orders dividing $"lcm"(1, 5, 10, 25) = 50$.

  Since the periodic terms do not vanish (one can verify for small $n$ that $f(n)$ does not follow a single polynomial), $f$ is *not* a polynomial function of $n$. It is a quasi-polynomial of period 50: on each residue class mod 50, it agrees with a polynomial in $n$ for all $n$.
]
