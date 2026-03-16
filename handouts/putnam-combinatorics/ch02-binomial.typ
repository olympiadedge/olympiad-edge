// Chapter 2: Binomial Coefficients & Identities

= Binomial Coefficients & Identities

== Core Definitions

#definition[
  *Binomial Coefficient.* For non-negative integers $n >= k >= 0$,
  $ binom(n, k) = frac(n!, k!(n - k)!) $
  counts the number of $k$-element subsets of an $n$-element set.
]

#definition[
  *Binomial Theorem.* For any $x, y$ and non-negative integer $n$,
  $ (x + y)^n = sum_(k=0)^(n) binom(n, k) x^k y^(n-k). $
]

#tldr[
  $binom(n, k)$ counts subsets. The binomial theorem is the universal tool for extracting coefficients, proving identities, and connecting algebra to counting. Evaluate at special values ($x = 1$, $x = -1$, roots of unity) to pull out sums.
]

== Key Identities

=== Vandermonde's Identity

#theorem[
  For non-negative integers $m, n, r$,
  $ binom(m + n, r) = sum_(k=0)^(r) binom(m, k) binom(n, r - k). $
]

#tldr[
  Vandermonde: choosing $r$ items from $m + n$ = split into groups of $m$ and $n$, choose $k$ from first and $r - k$ from second, sum over $k$.
]

=== Hockey Stick Identity

#theorem[
  For non-negative integers $n >= r$,
  $ sum_(i=r)^(n) binom(i, r) = binom(n + 1, r + 1). $
]

#tldr[
  Hockey stick: the sum of a diagonal in Pascal's triangle equals the entry one step below and to the right of the last term.
]

#trickbox[
  When you see a sum of binomial coefficients along a diagonal of Pascal's triangle, apply hockey stick immediately. It often collapses telescoping sums.
]

=== Lucas' Theorem

#theorem[
  Let $p$ be prime. Write $n = sum n_i p^i$ and $k = sum k_i p^i$ in base $p$. Then
  $ binom(n, k) equiv product_i binom(n_i, k_i) med (mod p). $
  In particular, $binom(n, k) equiv 0 med (mod p)$ iff some base-$p$ digit of $k$ exceeds the corresponding digit of $n$.
]

#tldr[
  Lucas: $binom(n, k) mod p$ = product of $binom("digit of " n, "digit of " k)$ in base $p$. Zero iff any digit of $k$ exceeds the corresponding digit of $n$.
]

=== Kummer's Theorem

#theorem[
  The largest power of prime $p$ dividing $binom(m + n, m)$ equals the number of carries when adding $m$ and $n$ in base $p$.
]

#tldr[
  Kummer: $v_p (binom(m+n, m))$ = number of carries adding $m + n$ in base $p$. Powerful for $p$-adic valuation problems.
]

== Proof Techniques

=== Committee Arguments

#stratbox[
  To prove a binomial identity, tell a "committee story." Each side counts the same set of committees or selections. This avoids algebra and gives intuitive proofs. Example: $k binom(n, k) = n binom(n-1, k-1)$ because both sides count ways to choose a $k$-person committee from $n$ people and designate a chair.
]

=== Generating Functions

#conceptbox(title: "Generating Function Extract")[
  $[x^k](1 + x)^n = binom(n, k)$. Vandermonde follows from $(1+x)^m (1+x)^n = (1+x)^(m+n)$ by extracting $[x^r]$. For negative\/fractional exponents, use $binom(alpha, k) = frac(alpha(alpha - 1) dots (alpha - k + 1), k!)$.
]

== Problems

#drill-header("Binomial Coefficients & Identities")

=== Problem 1
#difficulty(1)
#prob(1)[
  Prove that $sum_(k=0)^(n) binom(n, k)^2 = binom(2 n, n)$.
]

#hint(1)[
  Use Vandermonde's identity with a clever choice of parameters.
]

#hint(2)[
  Set $m = n$ and $r = n$ in Vandermonde. Note $binom(n, n - k) = binom(n, k)$.
]

#hint(3)[
  Vandermonde gives $binom(2 n, n) = sum_(k=0)^(n) binom(n, k) binom(n, n - k) = sum_(k=0)^(n) binom(n, k)^2$.
]

#solution[
  By Vandermonde's identity with $m = n$, $r = n$:
  $ binom(2 n, n) = sum_(k=0)^(n) binom(n, k) binom(n, n - k). $
  Since $binom(n, n - k) = binom(n, k)$, this gives $binom(2 n, n) = sum_(k=0)^(n) binom(n, k)^2$. $square$

  *Committee proof:* Both sides count the ways to choose $n$ people from a group of $2 n$ (split into $n$ men and $n$ women). The left side chooses $k$ men and $n - k$ women, summed over $k$.
]

=== Problem 2
#difficulty(1)
#prob(2)[
  Show that $sum_(k=0)^(n) (-1)^k binom(n, k) = 0$ for $n >= 1$.
]

#hint(1)[
  Plug special values into the binomial theorem.
]

#hint(2)[
  Set $x = -1$, $y = 1$ in $(x + y)^n$.
]

#hint(3)[
  $((-1) + 1)^n = 0^n = 0 = sum_(k=0)^n (-1)^k binom(n, k)$.
]

#solution[
  Set $x = -1$, $y = 1$ in the binomial theorem: $0^n = sum_(k=0)^(n) (-1)^k binom(n, k) = 0$ for $n >= 1$. $square$

  *Combinatorial proof:* Even-sized and odd-sized subsets of ${1, dots, n}$ are equinumerous. Bijection: fix element $a$, map $S |-> S triangle.stroked {a}$.
]

=== Problem 3
#difficulty(2)
#prob(3)[
  Prove the identity $sum_(k=1)^(n) k^2 binom(n, k) = n(n + 1) 2^(n-2)$ for $n >= 2$.
]

#hint(1)[
  Write $k^2 = k(k-1) + k$ and split into two sums.
]

#hint(2)[
  Use the absorption identity: $k binom(n, k) = n binom(n-1, k-1)$. Apply it twice for the $k(k-1)$ term.
]

#hint(3)[
  $sum k(k-1) binom(n, k) = n(n-1) sum binom(n-2, k-2) = n(n-1) 2^(n-2)$. And $sum k binom(n, k) = n dot 2^(n-1)$. Add them: $n(n-1) 2^(n-2) + n dot 2^(n-1) = n 2^(n-2)(n - 1 + 2) = n(n+1) 2^(n-2)$.
]

#solution[
  Write $k^2 = k(k-1) + k$. Then:
  $ sum_(k=1)^(n) k^2 binom(n, k) = sum_(k=2)^(n) k(k-1) binom(n, k) + sum_(k=1)^(n) k binom(n, k). $

  For the second sum, use $k binom(n, k) = n binom(n-1, k-1)$:
  $ sum_(k=1)^(n) k binom(n, k) = n sum_(k=1)^(n) binom(n-1, k-1) = n dot 2^(n-1). $

  For the first sum, use $k(k-1) binom(n, k) = n(n-1) binom(n-2, k-2)$:
  $ sum_(k=2)^(n) k(k-1) binom(n, k) = n(n-1) sum_(k=2)^(n) binom(n-2, k-2) = n(n-1) dot 2^(n-2). $

  Adding: $n(n-1) 2^(n-2) + n dot 2^(n-1) = n dot 2^(n-2)(n - 1 + 2) = n(n+1) 2^(n-2).$ $square$
]

=== Problem 4
#difficulty(2)
#prob(4)[
  Find all positive integers $n$ and $k$ with $k >= 2$ such that $binom(n, k) = binom(n-1, k) + binom(n-1, k-2)$.
]

#hint(1)[
  Use Pascal's identity $binom(n, k) = binom(n-1, k) + binom(n-1, k-1)$ to simplify.
]

#hint(2)[
  Subtracting $binom(n-1, k)$ from both sides: $binom(n-1, k-1) = binom(n-1, k-2)$. When are two binomial coefficients of the same $n$ equal?
]

#hint(3)[
  $binom(m, a) = binom(m, b)$ iff $a = b$ or $a + b = m$. So either $k - 1 = k - 2$ (impossible) or $(k-1) + (k-2) = n - 1$, giving $n = 2 k - 2$.
]

#solution[
  By Pascal's identity, $binom(n, k) = binom(n-1, k-1) + binom(n-1, k)$. The given equation says $binom(n-1, k-1) + binom(n-1, k) = binom(n-1, k) + binom(n-1, k-2)$, so $binom(n-1, k-1) = binom(n-1, k-2)$.

  For $binom(m, a) = binom(m, b)$ with $m = n - 1$, $a = k - 1$, $b = k - 2$: we need $a = b$ (impossible since $a = b + 1$) or $a + b = m$, i.e., $(k - 1) + (k - 2) = n - 1$, giving $n = 2 k - 2$.

  We also need $k >= 2$ and $n >= k$, i.e., $2 k - 2 >= k$, so $k >= 2$. The solutions are all pairs $(n, k) = (2 k - 2, k)$ for integers $k >= 2$, i.e., $(2, 2), (4, 3), (6, 4), dots$
]

=== Problem 5
#difficulty(2)
#putnam(2016, "A2")[
  For a positive integer $n$, let $M(n)$ be the largest integer $m$ such that $binom(m, n-1) > binom(m-1, n)$. Evaluate $lim_(n -> infinity) frac(M(n), n)$.
]

#hint(1)[
  Write out the inequality $binom(m, n-1) > binom(m-1, n)$ explicitly and simplify. Use the ratio $binom(m, n-1) \/ binom(m-1, n)$.
]

#hint(2)[
  We have $frac(binom(m, n-1), binom(m-1, n)) = frac(m! \/ ((n-1)!(m-n+1)!), (m-1)! \/ (n!(m-1-n)!)) = frac(m n, (m - n + 1)(m - n))$. The inequality becomes $m n > (m - n + 1)(m - n)$.
]

#hint(3)[
  Setting $m = alpha n$ and letting $n -> infinity$, the inequality becomes $alpha > (alpha - 1)^2$, i.e., $alpha^2 - 3 alpha + 1 < 0$. The larger root is $alpha = (3 + sqrt(5))\/2$. So $M(n) \/ n -> (3 + sqrt(5))\/2$.
]

#solution[
  *Simplify the inequality.* $binom(m, n-1) > binom(m-1, n)$ becomes $frac(m!, (n-1)!(m-n+1)!) > frac((m-1)!, n!(m-1-n)!)$.

  Dividing: $frac(binom(m, n-1), binom(m-1, n)) = frac(m n, (m-n+1)(m-n))$. So the inequality is $m n > (m - n + 1)(m - n)$.

  Expanding the right side: $m^2 - 2 m n + n^2 + m - n$. The inequality becomes $m^2 - 3 m n + n^2 + m - n < 0$.

  *Find $M(n)$.* $M(n)$ is the largest $m$ with $m^2 - 3 m n + n^2 + m - n < 0$. Setting $m = alpha n$: $alpha^2 n^2 - 3 alpha n^2 + n^2 + alpha n - n < 0$, dividing by $n^2$: $alpha^2 - 3 alpha + 1 + O(1\/n) < 0$.

  The roots of $alpha^2 - 3 alpha + 1 = 0$ are $alpha = frac(3 plus.minus sqrt(5), 2)$. The inequality holds for $alpha in (frac(3 - sqrt(5), 2), frac(3 + sqrt(5), 2))$.

  So $M(n) \/ n -> frac(3 + sqrt(5), 2)$ as $n -> infinity$, and the answer is $bold(frac(3 + sqrt(5), 2))$.
]

=== Problem 6
#difficulty(3)
#prob(6)[
  Find $binom(100, 42) mod 7$.
]

#hint(1)[
  Use Lucas' theorem: for a prime $p$, $binom(n, k) equiv product_i binom(n_i, k_i) med (mod p)$ where $n_i$ and $k_i$ are the digits of $n$ and $k$ in base $p$.
]

#hint(2)[
  Convert $100$ and $42$ to base $7$. We have $100 = 2 dot 7^2 + 0 dot 7 + 2 = (2 0 2)_7$ and $42 = 1 dot 7^2 + 2 dot 7 + 0 = (1 2 0)_7$ (i.e., $42 = 49 + 14 = 63$... no: $42 = 0 dot 49 + 6 dot 7 + 0 = (0 6 0)_7$). Recompute carefully.
]

#hint(3)[
  $100 = 2 dot 49 + 0 dot 7 + 2 = (2, 0, 2)_7$. $42 = 0 dot 49 + 6 dot 7 + 0 = (0, 6, 0)_7$. By Lucas, $binom(100, 42) equiv binom(2, 0) dot binom(0, 6) dot binom(2, 0) med (mod 7)$. Since $binom(0, 6) = 0$ (digit of $k$ exceeds digit of $n$), the product is $0$.
]

#solution[
  We apply Lucas' theorem with $p = 7$.

  *Base-7 representations:* $100 = 2 dot 49 + 0 dot 7 + 2$, so $100 = (2, 0, 2)_7$. $42 = 0 dot 49 + 6 dot 7 + 0$, so $42 = (0, 6, 0)_7$.

  *Applying Lucas:*
  $ binom(100, 42) equiv binom(2, 0) dot binom(0, 6) dot binom(2, 0) med (mod 7). $

  Since $binom(0, 6) = 0$ (we cannot choose $6$ items from $0$), the entire product is $0$.

  Therefore $binom(100, 42) equiv bold(0) med (mod 7)$. $square$
]
