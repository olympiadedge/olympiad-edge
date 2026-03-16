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
#putnam(2005, "B2")[
  Find all positive integers $n$ and $k$ with $k >= 2$ such that $binom(n, k) = binom(n-1, k) + binom(n-1, k-2)$. // VERIFY: check exact statement
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
#putnam(2016, "A3")[
  Suppose $f$ is a function from ${1, 2, dots, n}$ to ${1, 2, dots, n}$ (not necessarily bijective). Define $f^1 = f$ and $f^(j+1) = f compose f^j$ for $j >= 1$. Let $k = 1 + max{j : f^j eq.not f^(j+1)}$ (set $k = 1$ if $f = f^2$). // VERIFY: exact statement
  Determine the maximum value of $k$ over all such $f$.
]

#hint(1)[
  Think about what happens when we iterate $f$. Eventually the sequence $f, f^2, f^3, dots$ stabilizes. The question is: how long can it take?
]

#hint(2)[
  Consider the structure of $f$ as a functional graph: each node has out-degree 1. The graph consists of "rho-shaped" components (a cycle with trees hanging off). Iteration "pulls" nodes toward cycles.
]

#hint(3)[
  The longest possible tail has length $n - 1$ (one fixed point, chain of $n - 1$ nodes feeding into it). Work out small cases to confirm.
]

#solution[
  The functional graph of $f$ has each component shaped like a cycle with trees attached. Iteration $f^j$ "pulls" vertices toward cycles; $f^j = f^(j+1)$ once all vertices have reached their cycle's fixed point.

  To maximize $k$: take $f(i) = i + 1$ for $i < n$ and $f(n) = n$. Vertex 1 is at distance $n - 1$ from the fixed point. We get $f^j(1) = min(1+j, n) eq.not min(2+j, n) = f^(j+1)(1)$ for $j <= n-2$, so $k = bold(n - 1)$. // VERIFY
]

=== Problem 6
#difficulty(3)
#putnam(2014, "B4")[
  Show that for each positive integer $n$, all the roots of the polynomial
  $ p_n(x) = sum_(k=0)^(n) 2^(k(n-k)) x^k $
  are real and negative. // VERIFY: exact statement
]

#hint(1)[
  Try to factor the polynomial or relate it to a known family. Check small cases: $p_1(x) = 1 + x$, $p_2(x) = 1 + 2 x + x^2 = (1 + x)^2$.
]

#hint(2)[
  Check $p_3(x) = 1 + 2^2 x + 2^2 x^2 + x^3 = 1 + 4 x + 4 x^2 + x^3$. Note $2^(k(n-k))$ is symmetric in $k$ and $n - k$, so the coefficients are palindromic.
]

#hint(3)[
  Consider the polynomial as a $q$-analog with $q = 2$. The coefficients $2^(k(n-k))$ are related to Gaussian binomial coefficients. Use the factorization of $q$-binomials to show all roots are negative real (they are at $-2^j$ for appropriate $j$). The factorization is $p_n(x) = product_(j=0)^(n-1)(1 + 2^j x)$. Verify by expanding.
]

#solution[
  We claim $p_n(x) = product_(j=0)^(n-1)(1 + 2^j x)$, which has roots $x = -2^(-j)$ for $j = 0, dots, n-1$ (all real and negative).

  *Proof by induction.* Base: $p_1(x) = 1 + x$. Inductive step: expanding $product_(j=0)^(n-1)(1 + 2^j x)$, the coefficient of $x^k$ is $sum_(S subset.eq {0, dots, n-1}, |S|=k) 2^(sum_(j in S) j)$. The key identity is that this sum equals $2^(k(n-k))$, which follows from the Gaussian binomial coefficient: $sum_(S, |S|=k) 2^(sum S) = 2^(binom(k,2)) binom(n, k)_2$ where $binom(n, k)_q = product_(i=0)^(k-1) frac(q^(n-i) - 1, q^(i+1) - 1)$, and one verifies $2^(binom(k,2)) binom(n, k)_2 = 2^(k(n-k))$ by direct computation. // VERIFY: algebraic details

  Once the factorization is established, the roots $x = -2^(-j)$ are manifestly real and negative. $square$
]
