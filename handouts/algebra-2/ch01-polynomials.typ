// ════════════════════════════════════════════════════════════
// Chapter 1 — Polynomials
// ════════════════════════════════════════════════════════════

= Polynomials

== Core Definitions

#definition("Polynomial")[
  A *polynomial* in $x$ is an expression $P(x) = a_n x^n + a_(n-1) x^(n-1) + dots.c + a_1 x + a_0$ where $a_n eq.not 0$. The *degree* is $n$, the *leading coefficient* is $a_n$, and the *constant term* is $a_0$.
]

#definition("Root / Zero")[
  A value $r$ is a *root* (or *zero*) of $P(x)$ if $P(r) = 0$. A polynomial of degree $n$ has at most $n$ roots over the reals (exactly $n$ over the complex numbers, counted with multiplicity).
]

#tldr[A degree-$n$ polynomial is pinned down by $n + 1$ coefficients and has exactly $n$ complex roots.]

#trapbox[Degree is defined by the _highest power with a nonzero coefficient_. The polynomial $0 x^5 + 3 x^2 - 1$ has degree 2, not 5. Also, the zero polynomial has no degree at all.]

== Factor Theorem & Remainder Theorem

#theorem("Remainder Theorem")[
  For any polynomial $P(x)$ and constant $c$, the remainder when $P(x)$ is divided by $(x - c)$ equals $P(c)$.
]

#theorem("Factor Theorem")[
  $(x - r)$ is a factor of $P(x)$ if and only if $P(r) = 0$.
]

#tldr[To test whether $r$ is a root, just plug in: $P(r) = 0$ means $(x - r)$ divides $P(x)$.]

These two results are workhorses. The Factor Theorem turns root-finding into evaluation, and the Remainder Theorem lets you compute remainders without long division.

#trickbox[*Rational Root Theorem shortcut.* If $P(x) = a_n x^n + dots.c + a_0$ has integer coefficients, every rational root $p / q$ (in lowest terms) satisfies $p | a_0$ and $q | a_n$. This slashes your search space — list divisors of $a_0$ and $a_n$, then test candidates via the Remainder Theorem.]

#remark[When a competition says "find all rational roots," the Rational Root Theorem gives you a _finite_ list of candidates. You still have to verify each one.]

== Vieta's Formulas

=== Quadratic Case

For $a x^2 + b x + c = 0$ with roots $r, s$:
$ r + s = -b / a, quad r s = c / a $

=== Cubic Case

For $a x^3 + b x^2 + c x + d = 0$ with roots $r, s, t$:
$ r + s + t = -b / a, quad r s + r t + s t = c / a, quad r s t = -d / a $

=== General Degree $n$

#theorem("Vieta's Formulas")[
  If $P(x) = a_n x^n + a_(n-1) x^(n-1) + dots.c + a_0$ has roots $r_1, r_2, dots, r_n$, then
  $ sum_(i) r_i = -a_(n-1) / a_n, quad sum_(i < j) r_i r_j = a_(n-2) / a_n, quad dots.c, quad r_1 r_2 dots.c r_n = (-1)^n a_0 / a_n $
  The $k$-th elementary symmetric polynomial $e_k$ of the roots equals $(-1)^k a_(n-k) / a_n$.
]

#tldr[Vieta's turns coefficient questions into symmetric polynomial questions — and vice versa. The signs alternate: plus, minus, plus, minus...]

#trapbox[The alternating sign is the #1 source of errors. For a _monic_ polynomial $x^n + c_(n-1) x^(n-1) + dots.c$, the sum of roots is $-c_(n-1)$ (note the minus). For the product, the sign is $(-1)^n c_0$. Write out the formula before computing — don't try to remember the sign by "feel."]

#stratbox[
  *When to use Vieta's:*
  - You're asked about sums/products of roots but _not_ the roots themselves.
  - You know symmetric expressions of the roots ($r^2 + s^2$, $r^3 + s^3$, etc.) and want to relate them to coefficients.
  - You want to construct a polynomial whose roots satisfy given conditions.
]

== Newton's Sums

Define the *power sums* $p_k = r_1^k + r_2^k + dots.c + r_n^k$ and the elementary symmetric polynomials $e_1, e_2, dots, e_n$ (from Vieta's).

Newton's identities relate them recursively:
$ p_1 &= e_1 \
  p_2 &= e_1 p_1 - 2 e_2 \
  p_3 &= e_1 p_2 - e_2 p_1 + 3 e_3 \
  p_k &= e_1 p_(k-1) - e_2 p_(k-2) + dots.c + (-1)^(k-1) k e_k $

#tldr[Newton's sums let you compute $r_1^k + r_2^k + dots.c + r_n^k$ from the coefficients without finding the roots.]

#trickbox[*Pattern trigger: "Find $r^k + s^k$."* Whenever you see a sum of powers of roots, think Newton's sums. For a quadratic with roots $r, s$: $r^2 + s^2 = (r + s)^2 - 2 r s$ and $r^3 + s^3 = (r + s)^3 - 3 r s (r + s)$. These are the first two cases of Newton's identities.]

=== Symmetric Polynomials

Any symmetric polynomial in the roots (one that doesn't change when you permute $r_1, dots, r_n$) can be expressed in terms of $e_1, dots, e_n$, hence in terms of the coefficients. This is the *Fundamental Theorem of Symmetric Polynomials*.

#remark[You almost never need to invoke the full theorem. In practice, you express the target in terms of $e_k$ by hand — usually just $e_1$ and $e_2$ suffice for quadratics.]

== Problems

#drill-header[Polynomials]

#prob(1)[#difficulty(1) Let $r$ and $s$ be the roots of $x^2 - 7 x + 3 = 0$. Find $r^2 + s^2$.]

#hint(1)[Use Vieta's to get $r + s$ and $r s$.]
#hint(2)[Recall $r^2 + s^2 = (r + s)^2 - 2 r s$.]
#hint(3)[Substitute: $7^2 - 2 dot 3$.]

#solution[By Vieta's, $r + s = 7$ and $r s = 3$. Then $r^2 + s^2 = (r + s)^2 - 2 r s = 49 - 6 = bold(43)$.]

#prob(2)[#difficulty(1) Find the remainder when $P(x) = x^{100} + x^{99} + dots.c + x + 1$ is divided by $x - 1$.]

#hint(1)[The Remainder Theorem says the remainder is $P(1)$.]
#hint(2)[Count how many terms $P(x)$ has.]
#hint(3)[$P(1) = 1 + 1 + dots.c + 1$ with 101 ones.]

#solution[By the Remainder Theorem, the remainder is $P(1) = 101 dot 1 = bold(101)$.]

#prob(3)[#difficulty(2) The polynomial $x^3 - 6 x^2 + 11 x - 6$ has three positive integer roots. Find all roots.]

#hint(1)[Use the Rational Root Theorem: candidates divide $6$.]
#hint(2)[Test $x = 1$: $1 - 6 + 11 - 6 = 0$. It's a root.]
#hint(3)[Factor out $(x - 1)$ and solve the remaining quadratic.]

#solution[$P(1) = 0$, so $(x - 1)$ is a factor. Dividing: $x^3 - 6 x^2 + 11 x - 6 = (x - 1)(x^2 - 5 x + 6) = (x - 1)(x - 2)(x - 3)$. The roots are $bold("1, 2, 3")$.]

#prob(4)[#difficulty(2) Let $r, s, t$ be the roots of $x^3 + 2 x^2 - 5 x + 3 = 0$. Find $r^2 + s^2 + t^2$.]

#hint(1)[By Vieta's: $r + s + t = -2$, $r s + r t + s t = -5$, $r s t = -3$.]
#hint(2)[Use the identity $r^2 + s^2 + t^2 = (r + s + t)^2 - 2(r s + r t + s t)$.]
#hint(3)[Substitute: $(-2)^2 - 2(-5) = 4 + 10$.]

#solution[$r^2 + s^2 + t^2 = (r + s + t)^2 - 2(r s + r t + s t) = 4 - 2(-5) = 4 + 10 = bold(14)$.]

#prob(5)[#difficulty(2) Find all rational roots of $2 x^3 - 3 x^2 - 11 x + 6 = 0$.]

#hint(1)[Rational Root Theorem: candidates are $plus.minus {1, 2, 3, 6} / {1, 2}$.]
#hint(2)[Test $x = 3$: $2(27) - 3(9) - 11(3) + 6 = 54 - 27 - 33 + 6 = 0$. Bingo.]
#hint(3)[Factor out $(x - 3)$, then factor the remaining quadratic $2 x^2 + 3 x - 2$.]

#solution[$x = 3$ is a root. Long division gives $2 x^3 - 3 x^2 - 11 x + 6 = (x - 3)(2 x^2 + 3 x - 2) = (x - 3)(2 x - 1)(x + 2)$. The rational roots are $bold("3, 1 / 2, -2")$.]

#prob(6)[#difficulty(3) Let $r, s$ be the roots of $x^2 - 3 x + 1 = 0$. Find $r^5 + s^5$.]

#hint(1)[We have $r + s = 3$ and $r s = 1$. Build the power sums recursively.]
#hint(2)[Newton's: $p_1 = 3$, $p_2 = 3 dot 3 - 2 dot 1 = 7$, $p_3 = 3 dot 7 - 1 dot 3 = 18$.]
#hint(3)[Continue: $p_4 = 3 dot 18 - 1 dot 7 = 47$, $p_5 = 3 dot 47 - 1 dot 18 = 123$.]

#solution[Using Vieta's, $r + s = 3$, $r s = 1$. Since $r, s$ satisfy $x^2 = 3 x - 1$, the power sums obey $p_k = 3 p_(k-1) - p_(k-2)$. Computing: $p_1 = 3$, $p_2 = 7$, $p_3 = 18$, $p_4 = 47$, $p_5 = 3 dot 47 - 18 = bold(123)$.]

#prob(7)[#difficulty(3) A monic cubic polynomial $P(x)$ satisfies $P(1) = 1$, $P(2) = 2$, $P(3) = 3$. Find $P(5)$.]

#hint(1)[Consider the polynomial $Q(x) = P(x) - x$. What are its roots?]
#hint(2)[$Q(1) = Q(2) = Q(3) = 0$, so $Q(x) = (x - 1)(x - 2)(x - 3)$.]
#hint(3)[Thus $P(x) = (x - 1)(x - 2)(x - 3) + x$. Evaluate at $x = 5$.]

#solution[Let $Q(x) = P(x) - x$. Then $Q$ is monic cubic with roots $1, 2, 3$, so $Q(x) = (x - 1)(x - 2)(x - 3)$. Therefore $P(x) = (x - 1)(x - 2)(x - 3) + x$, and $P(5) = 4 dot 3 dot 2 + 5 = 24 + 5 = bold(29)$.]

#prob(8)[#difficulty(3) The polynomial $P(x) = x^4 + a x^2 + b$ has roots $r_1, r_2, r_3, r_4$. If $r_1 r_2 = -1$ and $r_1 + r_2 = 0$, find $a + b$.]

#hint(1)[Since the polynomial has no $x^3$ or $x$ term, the sum of roots is $0$ and the sum of roots taken three at a time is $0$.]
#hint(2)[If $r_1 + r_2 = 0$ then $r_3 + r_4 = 0$ as well. Write $r_1 = t$, $r_2 = -t$, $r_3 = u$, $r_4 = -u$.]
#hint(3)[Then $r_1 r_2 = -t^2 = -1$ so $t^2 = 1$. By Vieta's, $a = -(t^2 + u^2 + "cross terms")$. The sum of products in pairs is $r_1 r_2 + r_1 r_3 + r_1 r_4 + r_2 r_3 + r_2 r_4 + r_3 r_4 = -t^2 - u^2 = a$.]

#solution[Write $r_1 = t, r_2 = -t, r_3 = u, r_4 = -u$. From $r_1 r_2 = -t^2 = -1$, we get $t^2 = 1$. The polynomial factors as $(x^2 - t^2)(x^2 - u^2) = x^4 - (t^2 + u^2) x^2 + t^2 u^2$. So $a = -(t^2 + u^2) = -(1 + u^2)$ and $b = t^2 u^2 = u^2$. Now $b = u^2$ and $a = -1 - u^2 = -1 - b$, so $a + b = bold(-1)$.]
