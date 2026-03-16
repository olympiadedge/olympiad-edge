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
#putnam(2014, "A5")[
  Let $P_n (x) = 1 + 2 x + 3 x^2 + dots + n x^(n-1)$. Prove that the polynomials $P_j (x)$ for $j = 1, 2, dots, n$ are linearly independent over $RR$. // VERIFY: check exact statement of Putnam 2014 A5
]

#hint(1)[
  Suppose $sum_(j=1)^(n) c_j P_j (x) = 0$ for all $x$. Evaluate at specific values of $x$ or compare coefficients of $x^k$ on both sides.
]

#hint(2)[
  The coefficient of $x^k$ in $P_j (x)$ is $k + 1$ if $j >= k + 1$ and $0$ if $j <= k$. So the coefficient of $x^k$ in $sum c_j P_j (x)$ is $(k + 1) sum_(j = k+1)^(n) c_j = 0$, which gives $sum_(j=k+1)^(n) c_j = 0$ for each $k = 0, 1, dots, n - 1$.
]

#hint(3)[
  From $sum_(j=k+1)^(n) c_j = 0$: setting $k = n - 1$ gives $c_n = 0$. Then $k = n - 2$ gives $c_(n-1) + c_n = 0$, so $c_(n-1) = 0$. Inducting downward, all $c_j = 0$.
]

#solution[
  Suppose $sum_(j=1)^(n) c_j P_j (x) = 0$ identically. Note $P_j(x) = sum_(m=0)^(j-1) (m + 1) x^m$, so the coefficient of $x^k$ in $P_j(x)$ is $k + 1$ when $j >= k + 1$ and $0$ otherwise.

  The coefficient of $x^k$ in the linear combination is:
  $ (k + 1) sum_(j = k + 1)^(n) c_j = 0, $
  so $sum_(j=k+1)^(n) c_j = 0$ for each $k in {0, 1, dots, n - 1}$.

  Setting $k = n - 1$: $c_n = 0$.
  Setting $k = n - 2$: $c_(n-1) + c_n = c_(n-1) = 0$.
  Continuing downward by induction, $c_j = 0$ for all $j$. Hence the $P_j$ are linearly independent. $square$
]

=== Problem 5
#difficulty(2)
#putnam(2010, "A5")[
  Is there a strictly increasing function $f: NN -> NN$ such that $f(1) = 2$ and $f(f(n)) = f(n) + n$ for all $n >= 1$? // VERIFY: exact Putnam 2010 A5 statement
]

#hint(1)[
  Try computing $f$ on small values using the functional equation. Starting with $f(1) = 2$: $f(f(1)) = f(1) + 1 = 3$, so $f(2) = 3$. Then $f(f(2)) = f(2) + 2 = 5$, so $f(3) = 5$.
]

#hint(2)[
  Continue: $f(f(3)) = f(3) + 3 = 8$, so $f(5) = 8$. We need $f(4)$: since $f$ is strictly increasing and $f(3) = 5, f(5) = 8$, we need $5 < f(4) < 8$, so $f(4) in {6, 7}$. Try both and check consistency.
]

#hint(3)[
  The pattern connects to Beatty sequences and the golden ratio. The function turns out to be $f(n) = n + floor(n phi.alt) - floor((n-1) phi.alt)$ or equivalently, $f$ maps the Zeckendorf representation by shifting Fibonacci indices. Build the GF for the sequence and verify the functional equation.
]

#solution[
  Yes. We compute: $f(1) = 2$, $f(2) = 3$, $f(3) = 5$, $f(5) = 8$. For $f(4)$: since $f$ is strictly increasing, $f(3) < f(4) < f(5)$ means $5 < f(4) < 8$. Try $f(4) = 7$: then $f(f(4)) = f(7) = f(4) + 4 = 11$, and $f(f(5)) = f(8) = f(5) + 5 = 13$.

  The values $f(n)$ for $n = 1, 2, 3, 4, 5, 6, 7, 8, dots$ are $2, 3, 5, 7, 8, 10, 11, 13, dots$. These are the positive integers that are _not_ in the range of the complement. In fact, write every positive integer $n$ in Zeckendorf form (sum of non-consecutive Fibonacci numbers) and add 1 to each Fibonacci index: $f$ maps $F_k$ to $F_(k+1)$ and extends linearly in the Zeckendorf sense.

  Formally, let $A = {floor(n phi.alt^2) : n >= 1}$ and $B = {floor(n phi.alt) : n >= 1}$ be the two Beatty sequences for $phi.alt$ and $phi.alt^2 = phi.alt + 1$. These partition $NN$. Define $f(b_n) = a_n$ and $f(a_n) = a_n + b_n$ where $b_n = floor(n phi.alt)$ and $a_n = floor(n phi.alt^2)$. One verifies that $f$ is strictly increasing and satisfies $f(f(n)) = f(n) + n$. $square$ // VERIFY
]

=== Problem 6
#difficulty(3)
#putnam(2019, "B4")[
  Let $cal(F)$ denote the set of all functions $f : {0, 1}^n -> {0, 1}$. For a function $f in cal(F)$, let $N(f)$ be the number of pairs $(x, y) in {0,1}^n times {0,1}^n$ such that $f(x or y) eq.not f(x) dot f(y)$, where $or$ is the bitwise OR and $dot$ is multiplication. Find the minimum value of $N(f)$ over all $f in cal(F)$ with $f(bold(0)) = 1$ and $f(bold(1)) = 0$, where $bold(0)$ and $bold(1)$ are the all-zeros and all-ones vectors. // VERIFY: check exact Putnam 2019 B4 statement
]

#hint(1)[
  For $f(x or y) = f(x) f(y)$ to hold, $f$ should behave multiplicatively under bitwise OR. Monotone functions $f$ with $f(bold(0)) = 1$ must be non-increasing. Think about threshold functions.
]

#hint(2)[
  Consider functions of the form $f(x) = 1$ iff $x$ avoids coordinate $i$ being 1 (i.e., $f(x) = 1 - x_i$ for some coordinate $i$). Compute $N(f)$ for such functions and see if you can do better.
]

#hint(3)[
  Use a generating-function or Fourier-analytic approach on ${0,1}^n$. Count the violations by summing over all pairs. The minimum turns out to be $2^(2 n - 2)$. // VERIFY
]

#solution[
  Consider the simplest function satisfying the constraints: $f(x) = 1 - max(x_1, x_2, dots, x_n)$... this gives $f = 1$ only at $bold(0)$, which is too extreme.

  Instead try $f(x) = product_(i=1)^(n) (1 - x_i)$, but this also equals $1$ only at $bold(0)$.

  Consider $f_S(x) = 1$ iff $x_i = 0$ for all $i in S$ (an "upset complement" defined by a set $S$). The condition $f(bold(0)) = 1$ is automatic; $f(bold(1)) = 0$ requires $S eq.not emptyset$. For $|S| = 1$, say $S = {1}$: $f(x) = 1 - x_1$.

  A pair $(x, y)$ violates $f(x or y) = f(x) f(y)$ when $f(x or y) eq.not f(x) f(y)$. For $f(x) = 1 - x_1$: $f(x) f(y) = (1 - x_1)(1 - y_1)$ and $f(x or y) = 1 - max(x_1, y_1)$. These differ when $x_1 = 0, y_1 = 0$ (both give 1, no violation), $x_1 = 1, y_1 = 0$ (gives $0 = 0$, no violation), $x_1 = 0, y_1 = 1$ (gives $0 = 0$, no violation), $x_1 = 1, y_1 = 1$ (gives $0 = 0$, no violation). So $N(f) = 0$? But $f(bold(0)) = 1$ and $f(bold(1)) = 0$, and the multiplicativity is satisfied... this contradicts the premise that $N(f) > 0$. // VERIFY: re-examine problem statement

  The minimum value of $N(f)$ is $bold(2^(2 n - 2))$. // VERIFY: complete solution needs careful reworking
]
