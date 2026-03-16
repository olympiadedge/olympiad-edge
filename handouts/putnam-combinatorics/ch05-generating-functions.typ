// Chapter 5: Generating Functions

= Generating Functions

== Core Definitions

#definition[
  *Ordinary Generating Function (OGF).* Given a sequence $(a_0, a_1, a_2, dots)$, its OGF is the formal power series $A(x) = sum_(n >= 0) a_n x^n$. We write $[x^n] A(x) = a_n$ for coefficient extraction.
]

#definition[
  *Exponential Generating Function (EGF).* The EGF of $(a_0, a_1, a_2, dots)$ is $hat(A)(x) = sum_(n >= 0) a_n x^n / n!$. EGFs are natural when the sequence counts _labeled_ structures.
]

#definition[
  *Formal Power Series.* We treat $A(x)$ as an algebraic object --- convergence does not matter. Two series are equal iff they agree coefficient-by-coefficient. The ring of formal power series $QQ[[x]]$ supports addition, multiplication, and (when $a_0 eq.not 0$) multiplicative inverses.
]

#definition[
  *Coefficient Extraction.* The operator $[x^n]$ extracts the coefficient of $x^n$. Key identity: $[x^n] frac(1, (1 - x)^k) = binom(n + k - 1, k - 1)$.
]

#tldr[
  OGFs encode sequences as power series. Multiply OGFs = convolve sequences. EGFs handle labeled objects (multiply EGFs = interleave labeled structures). Extract answers via $[x^n]$.
]

== Key Techniques

=== The Product Principle for OGFs

#theorem[
  If $A(x)$ is the OGF for choosing from structure $cal(A)$ and $B(x)$ for structure $cal(B)$, then $A(x) dot B(x)$ is the OGF for the combined structure where the sizes add. That is, $[x^n](A(x) B(x)) = sum_(k=0)^(n) a_k b_(n-k)$.
]

#trickbox[
  When a combinatorial problem decomposes an object into independent parts whose sizes add up to $n$, multiply the corresponding OGFs and extract $[x^n]$.
]

#conceptbox(title: "Common OGFs")[
  - $frac(1, 1 - x) = sum x^n$ (all 1s) #h(2em) - $(1 + x)^k = sum binom(k, n) x^n$
  - $frac(1, (1 - x)^k) = sum binom(n+k-1, k-1) x^n$ #h(2em) - Catalan: $frac(1 - sqrt(1 - 4 x), 2 x)$
]

=== Partial Fractions

#stratbox[
  To extract $[x^n]$ from a rational generating function $P(x) / Q(x)$, factor $Q(x) = product (1 - r_i x)$ and decompose into partial fractions. Each term $frac(A_i, 1 - r_i x)$ contributes $A_i r_i^n$ to $[x^n]$. This converts a GF problem into a linear recurrence solution.
]

#trapbox[
  When factoring $Q(x)$, remember that the convention for GFs uses $frac(1, 1 - r x)$ (not $frac(1, x - r)$). Also, repeated roots require terms like $frac(A, (1 - r x)^2)$, which contribute $A (n + 1) r^n$ to $[x^n]$.
]

=== The Snake Oil Method

#conceptbox(title: "Snake Oil")[
  To evaluate a sum $S_n = sum_k f(n, k)$ involving binomial coefficients: (1) Identify a free parameter $k$; (2) Form the generating function $F(x) = sum_n S_n x^n$ by swapping summation order; (3) Evaluate the inner sum in closed form; (4) Extract $[x^n]$.
]

#trickbox[
  Snake oil works best when the sum has one "free" variable to sum over and the other terms form a recognizable GF (geometric, binomial, etc.). Look for sums like $sum_k binom(n, k) binom(m, k)$ or $sum_k binom(k, r) x^k$.
]

=== Catalan Numbers

#theorem[
  The $n$th Catalan number $C_n = frac(1, n + 1) binom(2 n, n)$ satisfies $C(x) = 1 + x C(x)^2$ and counts: balanced parenthesizations, binary trees with $n$ internal nodes, Dyck paths of length $2 n$, triangulations of an $(n+2)$-gon, and many more structures.
]

#tldr[
  If your answer satisfies $f(x) = 1 + x f(x)^2$, it is Catalan. The closed form is $C_n = frac(1, n + 1) binom(2 n, n)$.
]

#trapbox[
  The quadratic formula for $C(x) = 1 + x C(x)^2$ gives two roots. You must pick the one with $C(0) = 1$, which is $C(x) = frac(1 - sqrt(1 - 4 x), 2 x)$. The other root diverges.
]

=== EGF Techniques

#stratbox[
  Use EGFs when objects are labeled and you interleave two labeled structures. The EGF product rule says: if $hat(A)(x)$ counts labeled $cal(A)$-structures and $hat(B)(x)$ counts labeled $cal(B)$-structures, then $hat(A)(x) hat(B)(x)$ counts ways to partition a label set into an $cal(A)$-part and a $cal(B)$-part.
]

#conceptbox(title: "Common EGFs")[
  - $e^x = sum x^n / n!$ (every subset, one structure per size)
  - $e^x - 1$ (nonempty subsets)
  - $-ln(1 - x) = sum_(n >= 1) x^n / n$ (EGF for $(n-1)!$, i.e., cycles)
  - $frac(1, 1 - x)$ (EGF for $n!$, i.e., permutations)
]

== Problems

#drill-header("Generating Functions")

=== Problem 1
#difficulty(1)
#prob(1)[
  Find a closed form for $sum_(k=0)^(n) binom(n, k)^2$.
]

#hint(1)[
  Interpret $binom(n, k)^2$ as $binom(n, k) binom(n, n - k)$. What is the combinatorial meaning?
]

#hint(2)[
  By Vandermonde's identity, $sum_k binom(n, k) binom(n, n - k) = [x^n] (1 + x)^n (1 + x)^n = [x^n] (1 + x)^(2 n)$.
]

#hint(3)[
  The answer is $binom(2 n, n)$. Alternatively, use the GF: $(1 + x)^n$ has $[x^k] = binom(n, k)$, and the product $(1 + x)^(2 n)$ gives the convolution.
]

#solution[
  Note $binom(n, k)^2 = binom(n, k) binom(n, n-k)$. By the product of GFs:
  $ sum_(k=0)^(n) binom(n, k)^2 = [x^n](1 + x)^n (1 + x)^n = [x^n](1 + x)^(2 n) = binom(2 n, n). $
]

=== Problem 2
#difficulty(1)
#putnam(2003, "B2")[
  Let $n$ be a positive integer. Starting with the sequence $1, 1\/2, 1\/3, dots, 1\/n$, form a new sequence of $n - 1$ terms by taking the arithmetic mean of consecutive terms. Continue until a single number $a_n$ remains. Prove that $a_n < 2 / n$.
]

#hint(1)[
  Write out what happens for small $n$. Each step averages consecutive terms. Can you express the final value as a weighted combination of the original $1\/k$ terms?
]

#hint(2)[
  After all reductions, $a_n = sum_(k=1)^(n) w_k dot 1\/k$ where $w_k = binom(n - 1, k - 1) / 2^(n-1)$ are binomial weights (this follows from the iterated averaging). So $a_n = frac(1, 2^(n-1)) sum_(k=1)^(n) binom(n-1, k-1) / k$.
]

#hint(3)[
  Rewrite $binom(n-1, k-1) / k = binom(n, k) / n$ (verify this identity). Then $a_n = frac(1, n dot 2^(n-1)) sum_(k=1)^(n) binom(n, k) = frac(2^n - 1, n dot 2^(n-1)) = frac(2(2^n - 1), n dot 2^n) < 2\/n$.
]

#solution[
  After $n - 1$ rounds of averaging, the final value is a weighted average of the original terms with binomial weights:
  $ a_n = frac(1, 2^(n-1)) sum_(k=1)^(n) binom(n-1, k-1) frac(1, k). $

  We use the identity $frac(1, k) binom(n-1, k-1) = frac(1, n) binom(n, k)$, which follows from $binom(n-1, k-1) = frac((n-1)!, (k-1)! (n-k)!)$ and $binom(n, k) = frac(n!, k! (n-k)!) = frac(n, k) binom(n-1, k-1)$.

  Substituting:
  $ a_n = frac(1, n dot 2^(n-1)) sum_(k=1)^(n) binom(n, k) = frac(2^n - 1, n dot 2^(n-1)). $

  Since $2^n - 1 < 2^n$, we get $a_n < frac(2^n, n dot 2^(n-1)) = frac(2, n)$. $square$
]

=== Problem 3
#difficulty(2)
#prob(3)[
  Use generating functions to prove that the number of ways to tile a $2 times n$ board with $1 times 2$ dominoes equals the Fibonacci number $F_(n+1)$.
]

#hint(1)[
  Let $a_n$ be the number of tilings. Set up a recurrence by considering what covers the leftmost column.
]

#hint(2)[
  If a vertical domino covers column 1, the remaining board is $2 times (n - 1)$, giving $a_(n-1)$ tilings. If two horizontal dominoes cover columns 1--2, the remaining board is $2 times (n - 2)$, giving $a_(n-2)$. So $a_n = a_(n-1) + a_(n-2)$ with $a_0 = 1, a_1 = 1$.
]

#hint(3)[
  The OGF is $A(x) = frac(1, 1 - x - x^2)$. Factor the denominator and use partial fractions to extract $[x^n] A(x)$ and confirm it matches the Fibonacci formula.
]

#solution[
  Let $a_n$ count the tilings of a $2 times n$ board. The leftmost column is covered either by a vertical domino (leaving a $2 times (n-1)$ board) or by the left halves of two horizontal dominoes (forcing columns 1--2, leaving $2 times (n-2)$). So $a_n = a_(n-1) + a_(n-2)$ with $a_0 = 1$ (empty board) and $a_1 = 1$.

  The OGF satisfies $A(x) = 1 + x A(x) + x^2 A(x)$, giving $A(x) = frac(1, 1 - x - x^2)$.

  This is the OGF for the Fibonacci numbers (shifted): $F_1 = 1, F_2 = 1, F_3 = 2, dots$, confirming $a_n = F_(n+1)$.

  By partial fractions (roots $phi.alt = frac(1+sqrt(5), 2)$, $psi = frac(1-sqrt(5), 2)$), $a_n = frac(phi.alt^(n+1) - psi^(n+1), sqrt(5))$.
]

=== Problem 4
#difficulty(2)
#prob(4)[
  Find the ordinary generating function for the Catalan numbers and use it to prove that $C_n = frac(1, n + 1) binom(2 n, n)$.
]

#hint(1)[
  The Catalan numbers satisfy $C_0 = 1$ and $C_n = sum_(k=0)^(n-1) C_k C_(n-1-k)$. This convolution suggests setting up a functional equation for the OGF $C(x) = sum_(n >= 0) C_n x^n$.
]

#hint(2)[
  The recurrence translates to $C(x) = 1 + x C(x)^2$. Solve this quadratic in $C(x)$ using the quadratic formula, choosing the root with $C(0) = 1$.
]

#hint(3)[
  You get $C(x) = frac(1 - sqrt(1 - 4 x), 2 x)$. Now expand $sqrt(1 - 4 x)$ using the generalized binomial theorem: $(1 - 4 x)^(1\/2) = sum_(n >= 0) binom(1\/2, n) (-4 x)^n$. Extract $[x^n] C(x)$ and simplify to get $frac(1, n + 1) binom(2 n, n)$.
]

#solution[
  Let $C(x) = sum_(n >= 0) C_n x^n$. The convolution recurrence $C_n = sum_(k=0)^(n-1) C_k C_(n-1-k)$ (for $n >= 1$, with $C_0 = 1$) gives $C(x) - 1 = x C(x)^2$, i.e.,
  $ C(x) = 1 + x C(x)^2. $

  Solving: $x C(x)^2 - C(x) + 1 = 0$, so $C(x) = frac(1 plus.minus sqrt(1 - 4 x), 2 x)$. Since $C(0) = 1$, we take the minus sign: $C(x) = frac(1 - sqrt(1 - 4 x), 2 x)$.

  By the generalized binomial theorem, $(1 - 4 x)^(1\/2) = sum_(n >= 0) binom(1\/2, n) (-4 x)^n$. One computes:
  $ binom(1\/2, n) = frac((1\/2)(1\/2 - 1) dots.c (1\/2 - n + 1), n!) = frac((-1)^(n-1), 2^(2 n - 1) n) binom(2 n - 2, n - 1) quad (n >= 1). $

  After simplification, $[x^n] C(x) = frac(1, n + 1) binom(2 n, n) = C_n$. $square$
]

=== Problem 5
#difficulty(2)
#prob(5)[
  Use generating functions to solve the recurrence $a_n = 3 a_(n-1) + 2^n$ for $n >= 1$, with $a_0 = 1$.
]

#hint(1)[
  Define $A(x) = sum_(n >= 0) a_n x^n$. Multiply both sides of the recurrence by $x^n$ and sum over $n >= 1$.
]

#hint(2)[
  The left side gives $A(x) - a_0 = A(x) - 1$. The right side splits into $3 x A(x) + sum_(n >= 1) 2^n x^n = 3 x A(x) + frac(2 x, 1 - 2 x)$.
]

#hint(3)[
  Solve for $A(x) = frac(1, (1 - 3 x)(1 - 2 x))$. Use partial fractions to extract $[x^n]$.
]

#solution[
  Let $A(x) = sum_(n >= 0) a_n x^n$. From $a_n = 3 a_(n-1) + 2^n$ for $n >= 1$:
  $ A(x) - 1 = 3 x A(x) + frac(2 x, 1 - 2 x). $

  Solving: $A(x)(1 - 3 x) = 1 + frac(2 x, 1 - 2 x) = frac(1 - 2 x + 2 x, 1 - 2 x) = frac(1, 1 - 2 x)$.

  So $A(x) = frac(1, (1 - 2 x)(1 - 3 x))$.

  By partial fractions: $frac(1, (1 - 2 x)(1 - 3 x)) = frac(A, 1 - 2 x) + frac(B, 1 - 3 x)$. Setting $x = 1\/2$: $A(1 - 3\/2)^(-1)$... we use the cover-up method. At $1 - 2 x = 0$ (i.e., $x = 1\/2$): $A = frac(1, 1 - 3\/2) = -2$. At $1 - 3 x = 0$ (i.e., $x = 1\/3$): $B = frac(1, 1 - 2\/3) = 3$.

  Therefore $A(x) = frac(-2, 1 - 2 x) + frac(3, 1 - 3 x)$, giving $a_n = 3^(n+1) - 2^(n+1)$.

  *Check:* $a_0 = 3 - 2 = 1$. $a_1 = 9 - 4 = 5 = 3 dot 1 + 2 = 5$. $a_2 = 27 - 8 = 19 = 3 dot 5 + 4 = 19$. $checkmark$

  The answer is $bold(a_n = 3^(n+1) - 2^(n+1))$. $square$
]

=== Problem 6
#difficulty(3)
#prob(6)[
  *(Snake Oil.)* Evaluate $sum_(k=0)^(m) binom(n, k) binom(k, m - k)$ in closed form, where $n >= m >= 0$.
]

#hint(1)[
  The "snake oil" method: introduce a generating function in one of the parameters. Try forming $F(x) = sum_(m >= 0) S_m x^m$ where $S_m = sum_(k) binom(n, k) binom(k, m - k)$.
]

#hint(2)[
  Swap the order of summation. For fixed $k$, the inner sum over $m$ involves $binom(k, m - k) x^m$. Substitute $j = m - k$ to get $x^k sum_(j >= 0) binom(k, j) x^j = x^k (1 + x)^k$.
]

#hint(3)[
  So $F(x) = sum_(k=0)^(n) binom(n, k) x^k (1 + x)^k = (1 + x(1 + x))^n = (1 + x + x^2)^n$. Now extract $[x^m]$ from $(1 + x + x^2)^n$.
]

#solution[
  Let $S_m = sum_(k=0)^(m) binom(n, k) binom(k, m - k)$. Form the generating function:
  $ F(x) = sum_(m >= 0) S_m x^m = sum_(m >= 0) sum_(k=0)^(m) binom(n, k) binom(k, m - k) x^m. $

  Swap summation order and substitute $j = m - k$:
  $ F(x) = sum_(k=0)^(n) binom(n, k) sum_(j >= 0) binom(k, j) x^(j + k) = sum_(k=0)^(n) binom(n, k) x^k (1 + x)^k. $

  This is the binomial expansion of $(1 + x(1 + x))^n = (1 + x + x^2)^n$.

  Therefore $S_m = [x^m](1 + x + x^2)^n$.

  By the multinomial theorem:
  $ [x^m](1 + x + x^2)^n = sum_(a + b + c = n, \ b + 2 c = m) frac(n!, a! b! c!), $
  where the sum is over non-negative integers $a, b, c$ with $a + b + c = n$ and $b + 2 c = m$. Equivalently, $a = n - m + c$ and $b = m - 2 c$, so:
  $ sum_(k=0)^(m) binom(n, k) binom(k, m - k) = bold(sum_(c = 0)^(floor(m\/2)) frac(n!, (n - m + c)! (m - 2 c)! c!)). $

  In particular, for $m = n$ this gives the tribonacci-like coefficient $[x^n](1 + x + x^2)^n$. $square$
]
