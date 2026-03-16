// ════════════════════════════════════════════════════════════
// Chapter 3 — Sequences and Series
// ════════════════════════════════════════════════════════════

= Sequences and Series

== Arithmetic Sequences and Series

#definition("Arithmetic Sequence")[
  A sequence $a_1, a_2, a_3, dots$ is *arithmetic* if the difference between consecutive terms is constant: $a_(n+1) - a_n = d$ for all $n$. The general term is $a_n = a_1 + (n - 1) d$.
]

The sum of the first $n$ terms:
$ S_n = n / 2 (a_1 + a_n) = n / 2 (2 a_1 + (n - 1) d) $

#tldr[Arithmetic series: multiply the number of terms by the average of the first and last. That's it: $S = n dot (a_1 + a_n) / 2$.]

#trickbox[*Pairing trick.* When computing $1 + 2 + dots.c + 100$, pair first with last: $1 + 100 = 101$, $2 + 99 = 101$, etc. You get $50$ pairs each summing to $101$, so $S = 5050$. This works for any arithmetic series and is the fastest mental-math approach.]

#trapbox[Off-by-one errors are the silent killer. The number of integers from $a$ to $b$ inclusive is $b - a + 1$, not $b - a$. Always verify with a small example: from $3$ to $7$ there are $5$ integers, and $7 - 3 + 1 = 5$. Good.]

== Geometric Sequences and Series

#definition("Geometric Sequence")[
  A sequence is *geometric* if each term is a fixed multiple of the previous: $a_(n+1) / a_n = r$ for all $n$. The general term is $a_n = a_1 r^(n-1)$.
]

*Finite sum:*
$ S_n = a_1 dot (r^n - 1) / (r - 1), quad r eq.not 1 $

*Infinite sum* (when $|r| < 1$):
$ S_infinity = a_1 / (1 - r) $

#tldr[Finite geometric: $S_n = a_1 (r^n - 1) / (r - 1)$. Infinite geometric ($|r| < 1$): $S = a_1 / (1 - r)$. These are among the most-used formulas in competition math.]

#theorem("Geometric Mean Inequality")[
  In a geometric sequence, every term is the geometric mean of its neighbors: $a_n^2 = a_(n-1) dot a_(n+1)$. Conversely, if three terms satisfy $b^2 = a c$, they _could_ be consecutive terms of a geometric sequence.
]

#trapbox[The infinite geometric sum formula _only_ works when $|r| < 1$. If $|r| gt.eq 1$, the series diverges. Also, $r$ can be negative — the series $1 - 1/2 + 1/4 - 1/8 + dots.c$ has $r = -1 / 2$ and sum $= 1 / (1 + 1/2) = 2 / 3$.]

== Telescoping Sums and Products

A *telescoping sum* is one where most terms cancel in pairs:
$ sum_(k=1)^(n) (f(k) - f(k + 1)) = f(1) - f(n + 1) $

#trickbox[*Pattern trigger: fractions with consecutive-integer denominators.* When you see $1 / (k(k + 1))$, decompose via partial fractions: $1 / (k(k + 1)) = 1 / k - 1 / (k + 1)$. The sum telescopes to $1 - 1 / (n + 1) = n / (n + 1)$.]

*Common telescoping decompositions:*
- $1 / (k(k + 1)) = 1 / k - 1 / (k + 1)$
- $1 / (k(k + 2)) = 1 / 2 (1 / k - 1 / (k + 2))$
- $sqrt(k + 1) - sqrt(k) = 1 / (sqrt(k + 1) + sqrt(k))$ (rationalizing)

*Telescoping products* work similarly:
$ product_(k=1)^(n) (k + 1) / k = (n + 1) / 1 = n + 1 $

#tldr[If a sum has terms of the form $f(k) - f(k + 1)$, everything cancels except the first and last. Partial fractions are the main tool for creating telescoping structure.]

#stratbox[
  *Telescoping detection:*
  + See a sum of fractions? Try partial fractions.
  + See a sum of differences like $sqrt(k + 1) - sqrt(k)$? It already telescopes.
  + See a product of ratios? Write out the first few terms — cancellation often appears.
  + If stuck, try writing $a_k = f(k) - f(k - 1)$ for some clever $f$.
]

== Recursive Sequences

=== Linear Recurrences

A *linear recurrence* has the form $a_n = c_1 a_(n-1) + c_2 a_(n-2) + dots.c + c_k a_(n-k)$.

For a second-order recurrence $a_n = p a_(n-1) + q a_(n-2)$, the *characteristic equation* is:
$ r^2 = p r + q, quad "i.e.," quad r^2 - p r - q = 0 $

#theorem("Closed Form from Characteristic Roots")[
  If the characteristic equation $r^2 - p r - q = 0$ has distinct roots $r_1, r_2$, then
  $ a_n = A r_1^n + B r_2^n $
  where $A, B$ are determined by initial conditions. If $r_1 = r_2 = r$ (repeated root), then $a_n = (A + B n) r^n$.
]

#tldr[To solve $a_n = p a_(n-1) + q a_(n-2)$: write the characteristic equation $r^2 - p r - q = 0$, find its roots, then the general term is a linear combination of $r_1^n$ and $r_2^n$.]

*Example: Fibonacci.* $F_n = F_(n-1) + F_(n-2)$. Characteristic equation: $r^2 - r - 1 = 0$, roots $r = (1 plus.minus sqrt(5)) / 2$. This gives Binet's formula:
$ F_n = (phi^n - psi^n) / sqrt(5), quad phi = (1 + sqrt(5)) / 2, quad psi = (1 - sqrt(5)) / 2 $

#remark[In competitions, you rarely need to derive Binet's formula. More often, you compute several terms of a recurrence and spot a pattern, or you use the recurrence to prove a property by induction.]

== Finite Differences and Polynomial Sequences

If $a_n$ is a polynomial of degree $d$ in $n$, then the $d$-th finite differences are constant.

Define $Delta a_n = a_(n+1) - a_n$ (first difference), $Delta^2 a_n = Delta(Delta a_n)$ (second difference), etc.

#theorem("Finite Difference Test")[
  A sequence $a_0, a_1, a_2, dots$ is given by a polynomial of degree $d$ if and only if $Delta^d a_n$ is constant (and $Delta^(d-1) a_n$ is not constant).
]

*Example:* For $a_n = n^2$: the sequence is $0, 1, 4, 9, 16, 25, dots$
- First differences: $1, 3, 5, 7, 9, dots$
- Second differences: $2, 2, 2, 2, dots$ — constant! Degree 2 confirmed.

#tldr[Take repeated differences. If the $d$-th differences are all the same, the sequence is degree-$d$ polynomial. This also gives a way to find the next term without finding the polynomial explicitly.]

#trickbox[*Competition shortcut.* If you're told a sequence is polynomial and given $d + 1$ values, you can find the next term by extending the difference table. No need to solve for the polynomial — just propagate differences backward.]

== Problems

#drill-header[Sequences and Series]

#prob(1)[#difficulty(1) Find the sum $3 + 7 + 11 + 15 + dots.c + 199$.]

#hint(1)[This is arithmetic with $a_1 = 3$, $d = 4$, $a_n = 199$.]
#hint(2)[Find $n$: $199 = 3 + (n - 1) dot 4$ gives $n = 50$.]
#hint(3)[$S = 50 / 2 dot (3 + 199) = 25 dot 202$.]

#solution[Arithmetic sequence: $a_1 = 3$, $d = 4$, $a_n = 199$. Number of terms: $n = (199 - 3) / 4 + 1 = 50$. Sum: $S = 50 dot (3 + 199) / 2 = 50 dot 101 = bold(5050)$.]

#prob(2)[#difficulty(1) Compute $sum_(k=1)^(infinity) 3 / 5^k$.]

#hint(1)[This is an infinite geometric series.]
#hint(2)[$a_1 = 3 / 5$, $r = 1 / 5$.]
#hint(3)[$S = a_1 / (1 - r) = (3 \/ 5) / (4 \/ 5)$.]

#solution[Infinite geometric series with $a_1 = 3 / 5$ and $r = 1 / 5$. $S = (3 / 5) / (1 - 1 / 5) = (3 / 5) / (4 / 5) = bold(3 / 4)$.]

#prob(3)[#difficulty(2) Compute $sum_(k=1)^(100) 1 / (k (k + 1))$.]

#hint(1)[Partial fraction: $1 / (k(k + 1)) = 1 / k - 1 / (k + 1)$.]
#hint(2)[The sum telescopes.]
#hint(3)[$S = 1 - 1 / 101$.]

#solution[By partial fractions, $1 / (k(k + 1)) = 1 / k - 1 / (k + 1)$. The sum telescopes: $S = (1 - 1 / 2) + (1 / 2 - 1 / 3) + dots.c + (1 / 100 - 1 / 101) = 1 - 1 / 101 = bold(100 / 101)$.]

#prob(4)[#difficulty(2) A geometric sequence has $a_3 = 12$ and $a_6 = 96$. Find $a_1$.]

#hint(1)[$a_n = a_1 r^(n-1)$, so $a_6 / a_3 = r^3$.]
#hint(2)[$r^3 = 96 / 12 = 8$, so $r = 2$.]
#hint(3)[$a_3 = a_1 r^2 = 4 a_1 = 12$, so $a_1 = 3$.]

#solution[$a_6 / a_3 = r^3 = 96 / 12 = 8$, giving $r = 2$. Then $a_1 = a_3 / r^2 = 12 / 4 = bold(3)$.]

#prob(5)[#difficulty(2) The sequence $a_1 = 1$, $a_2 = 3$, $a_n = 3 a_(n-1) - 2 a_(n-2)$ for $n gt.eq 3$. Find a closed form for $a_n$.]

#hint(1)[Characteristic equation: $r^2 - 3 r + 2 = 0$.]
#hint(2)[Roots: $r = 1$ and $r = 2$. So $a_n = A dot 1^n + B dot 2^n = A + B dot 2^n$.]
#hint(3)[Initial conditions: $a_1 = A + 2 B = 1$, $a_2 = A + 4 B = 3$. Solve: $B = 1$, $A = -1$.]

#solution[Characteristic equation: $r^2 - 3 r + 2 = 0 arrow.r (r - 1)(r - 2) = 0$. General form: $a_n = A + B dot 2^n$. From $a_1 = 1$: $A + 2 B = 1$. From $a_2 = 3$: $A + 4 B = 3$. Solving: $B = 1$, $A = -1$. Therefore $bold("a_n = 2^n - 1")$. Check: $a_1 = 1$, $a_2 = 3$, $a_3 = 7 = 3 dot 3 - 2 dot 1$. Correct.]

#prob(6)[#difficulty(2) Compute $sum_(k=1)^(n) k dot 2^k$.]

#hint(1)[This is an arithmetico-geometric sum. Use the multiply-and-shift trick: let $S = sum k dot 2^k$ and consider $2 S = sum k dot 2^(k+1)$.]
#hint(2)[Compute $S - 2 S = -S = sum k dot 2^k - sum k dot 2^(k+1)$. Re-index the second sum.]
#hint(3)[After re-indexing and simplifying: $-S = 1 dot 2 + 1 dot 4 + 1 dot 8 + dots.c + 1 dot 2^n - n dot 2^(n+1)$. The geometric part sums to $2^(n+1) - 2$.]

#solution[Let $S = sum_(k=1)^(n) k dot 2^k$. Then $2 S = sum_(k=1)^(n) k dot 2^(k+1) = sum_(k=2)^(n+1) (k - 1) dot 2^k$. Subtracting: $S - 2 S = -S = 1 dot 2 + sum_(k=2)^(n) 2^k - n dot 2^(n+1)$. The geometric sum is $2 + 4 + dots.c + 2^n = 2^(n+1) - 2$. So $-S = 2^(n+1) - 2 - n dot 2^(n+1) = (1 - n) 2^(n+1) - 2$. Therefore $bold("S = (n - 1") dot 2^(n+1) + 2)$.]

#prob(7)[#difficulty(3) The sequence $a_0, a_1, a_2, a_3, a_4$ is $2, 5, 12, 23, 38$. Assuming $a_n$ is a polynomial in $n$, find $a_5$.]

#hint(1)[Build a finite difference table.]
#hint(2)[First differences: $3, 7, 11, 15$. Second differences: $4, 4, 4$. Constant at level 2, so $a_n$ is quadratic.]
#hint(3)[The next first difference is $15 + 4 = 19$, so $a_5 = 38 + 19$.]

#solution[Difference table: \
$a_n$: $2, 5, 12, 23, 38$ \
$Delta$: $3, 7, 11, 15$ \
$Delta^2$: $4, 4, 4$ \
Second differences are constant, so $a_n$ is quadratic. Next first difference: $15 + 4 = 19$. Therefore $a_5 = 38 + 19 = bold(57)$. (One can verify: $a_n = 2 n^2 + n + 2$.)]

#prob(8)[#difficulty(3) Compute $product_(k=2)^(100) (1 - 1 / k^2)$.]

#hint(1)[Factor: $1 - 1 / k^2 = (k - 1)(k + 1) / k^2$.]
#hint(2)[Write out the product: $product_(k=2)^(100) (k - 1) / k dot (k + 1) / k$.]
#hint(3)[Separate into two telescoping products: $product (k - 1) / k$ and $product (k + 1) / k$.]

#solution[$1 - 1 / k^2 = (k - 1)(k + 1) / k^2$. The product becomes:
$ product_(k=2)^(100) (k - 1) / k dot product_(k=2)^(100) (k + 1) / k $
The first product telescopes to $1 / 100$. The second telescopes to $101 / 2$. So the answer is $1 / 100 dot 101 / 2 = bold(101 / 200)$.]
