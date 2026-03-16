// Chapter 6: Generating Functions

= Generating Functions

#tldr[
  Generating functions turn counting problems into algebra. Encode a sequence as a power series, manipulate with algebra, extract coefficients. OGFs for unlabeled structures, EGFs for labeled ones.
]

== Ordinary Generating Functions (OGFs)

#definition[
  *Ordinary Generating Function.* Given a sequence $(a_0, a_1, a_2, dots)$, its _ordinary generating function_ (OGF) is the formal power series
  $ A(x) = sum_(n >= 0) a_n x^n. $
  We write $[x^n] A(x) = a_n$ for the operation of extracting the coefficient of $x^n$.
]

#definition[
  *Formal Power Series.* We treat $A(x)$ as a purely algebraic object in the ring $QQ[[x]]$. Convergence is irrelevant: two series are equal iff they agree coefficient-by-coefficient. When $a_0 eq.not 0$, the series has a multiplicative inverse.
]

#conceptbox(title: "Fundamental OGFs")[
  - *Geometric:* $display(frac(1, 1 - x) = sum_(n >= 0) x^n)$ #h(1em) (all-ones sequence)
  - *Binomial:* $display((1 + x)^k = sum_(n=0)^(k) binom(k, n) x^n)$
  - *Stars-and-bars:* $display(frac(1, (1 - x)^k) = sum_(n >= 0) binom(n + k - 1, k - 1) x^n)$
  - *Generalized binomial:* $display((1 + x)^alpha = sum_(n >= 0) binom(alpha, n) x^n)$ for any $alpha in RR$
]

#trickbox[
  Whenever a problem asks "how many ways to distribute $n$ identical objects into $k$ bins with constraints," write the OGF for each bin and multiply. The answer is $[x^n]$ of the product.
]

== Operations on OGFs

#theorem[
  *Convolution.* If $A(x) = sum a_n x^n$ and $B(x) = sum b_n x^n$, then
  $ [x^n](A(x) dot B(x)) = sum_(k=0)^(n) a_k b_(n - k). $
  Multiplying OGFs convolves their coefficient sequences.
]

#conceptbox(title: "OGF Operations Toolkit")[
  - *Right shift by $m$:* $x^m A(x)$ prepends $m$ zeros
  - *Scaling:* $A(c x)$ multiplies $a_n$ by $c^n$
  - *Differentiation:* $A'(x) = sum_(n >= 1) n a_n x^(n-1)$, so $x A'(x) = sum n a_n x^n$
  - *Integration:* $integral_0^x A(t) d t = sum_(n >= 0) frac(a_n, n + 1) x^(n+1)$
  - *Prefix sums:* $frac(A(x), 1 - x) = sum_(n >= 0) (sum_(k=0)^n a_k) x^n$
]

#trapbox[
  Differentiation of formal power series is purely algebraic, but the formulas mirror calculus. Do not confuse the formal derivative with convergence-based analysis. In particular, $A'(x)$ is defined even when $A(x)$ has zero radius of convergence.
]

== Solving Recurrences via Generating Functions

#stratbox[
  To solve a linear recurrence: (1) let $F(x) = sum a_n x^n$; (2) multiply the recurrence by $x^n$ and sum over $n$; (3) rewrite everything in terms of $F(x)$; (4) solve for $F(x)$ as a rational function; (5) extract $[x^n]$ via partial fractions.
]

#theorem[
  *Fibonacci GF.* The Fibonacci numbers $F_0 = 0, F_1 = 1, F_n = F_(n-1) + F_(n-2)$ have OGF
  $ F(x) = frac(x, 1 - x - x^2). $
]

#proof[
  Let $F(x) = sum_(n >= 0) F_n x^n$. From $F_n = F_(n-1) + F_(n-2)$ for $n >= 2$:
  $ sum_(n >= 2) F_n x^n = x sum_(n >= 2) F_(n-1) x^(n-1) + x^2 sum_(n >= 2) F_(n-2) x^(n-2). $
  The left side is $F(x) - F_0 - F_1 x = F(x) - x$. The right side is $x(F(x) - F_0) + x^2 F(x) = x F(x) + x^2 F(x)$. Thus $F(x) - x = x F(x) + x^2 F(x)$, giving $F(x)(1 - x - x^2) = x$.
]

#remark[
  The golden ratio appears when we factor $1 - x - x^2 = -(x - phi^(-1))(x + phi)$ where $phi = (1 + sqrt(5))/2$. Partial fractions then yield the Binet formula $F_n = (phi^n - psi^n)/sqrt(5)$ where $psi = (1 - sqrt(5))/2$.
]

== Partial Fractions for Extracting Coefficients

#theorem[
  *Partial Fraction Extraction.* If $F(x) = P(x)/Q(x)$ where $deg P < deg Q$ and $Q(x) = product_(i=1)^(k) (1 - r_i x)$ with distinct roots, then
  $ F(x) = sum_(i=1)^(k) frac(A_i, 1 - r_i x), quad "so" quad [x^n] F(x) = sum_(i=1)^(k) A_i r_i^n. $
]

#trapbox[
  Repeated roots require extra care. If $(1 - r x)^m$ divides $Q(x)$, the partial fraction includes terms $frac(A_j, (1 - r x)^j)$ for $j = 1, dots, m$. Then $[x^n] frac(1, (1 - r x)^j) = binom(n + j - 1, j - 1) r^n$.
]

#trickbox[
  For a linear recurrence $a_n = c_1 a_(n-1) + dots.c + c_k a_(n-k)$, the characteristic polynomial is $t^k - c_1 t^(k-1) - dots.c - c_k = 0$. The roots of the characteristic polynomial are exactly the $r_i$ in the partial fraction, and $a_n = sum A_i r_i^n$.
]

== The Snake Oil Method

#conceptbox(title: "Snake Oil (Wilf)")[
  To evaluate a combinatorial sum $S = sum_k f(n, k)$:
  + Identify a free parameter (usually $n$) and form $F(x) = sum_n S_n x^n$.
  + Interchange the order of summation.
  + Evaluate the inner sum in closed form using known GFs.
  + Extract $[x^n] F(x)$.
]

#theorem[
  *Vandermonde Convolution via Snake Oil.* $display(sum_(k=0)^(r) binom(m, k) binom(n, r - k) = binom(m + n, r))$.
]

#proof[
  The left side is $[x^r]((1 + x)^m (1 + x)^n) = [x^r](1 + x)^(m + n) = binom(m + n, r)$.
]

#stratbox[
  Snake oil is most powerful when the sum contains binomial coefficients with complementary indices (one goes up as the other goes down). Look for sums where the product of binomial GFs simplifies.
]

== Exponential Generating Functions (EGFs)

#definition[
  *Exponential Generating Function.* The EGF of $(a_0, a_1, a_2, dots)$ is
  $ hat(A)(x) = sum_(n >= 0) a_n frac(x^n, n!). $
  EGFs are natural for counting _labeled_ structures.
]

#theorem[
  *EGF Product Rule.* If $hat(A)(x)$ and $hat(B)(x)$ are EGFs for labeled structures $cal(A)$ and $cal(B)$, then $hat(A)(x) dot hat(B)(x)$ is the EGF for pairs $(alpha, beta)$ where $alpha in cal(A)$, $beta in cal(B)$, and the labels $\{1, dots, n\}$ are distributed among the two structures. The coefficient satisfies
  $ c_n = sum_(k=0)^(n) binom(n, k) a_k b_(n - k). $
]

#conceptbox(title: "Key EGFs")[
  - *Permutations:* $display(frac(1, 1 - x) = sum_(n >= 0) n! frac(x^n, n!))$ #h(1em) ($a_n = n!$)
  - *Derangements:* $display(frac(e^(-x), 1 - x) = sum_(n >= 0) D_n frac(x^n, n!))$ where $D_n = n! sum_(k=0)^n frac((-1)^k, k!)$
  - *Bell numbers:* $display(e^(e^x - 1) = sum_(n >= 0) B_n frac(x^n, n!))$
  - *Involutions:* $display(e^(x + x^2 \/ 2) = sum_(n >= 0) a_n frac(x^n, n!))$
]

#tldr[
  OGF: unlabeled structures, product = size convolution. EGF: labeled structures, product = label-distributing convolution. Snake oil: swap summation order in a GF to evaluate binomial sums.
]

#trickbox[
  If a problem says "labeled" or "distinguishable," think EGF. If it says "unlabeled" or "identical," think OGF. Derangements, permutations, and set partitions are EGF territory.
]

== Problems

#drill-header("Generating Functions")

#prob(1)[
  #difficulty(1)
  Find the number of ways to make change for 100 cents using pennies (1¢), nickels (5¢), and dimes (10¢).
]
#hint(1)[Write the OGF as a product of geometric series, one per denomination.]
#hint(2)[The OGF is $frac(1, (1 - x)(1 - x^5)(1 - x^10))$. You need $[x^100]$.]
#hint(3)[Use the fact that the number of ways to partition $n$ into parts of sizes 1, 5, 10 can be computed by iterating over the number of dimes (0 to 10), then nickels.]
#solution[
  For each choice of $d$ dimes ($0 <= d <= 10$) and $k$ nickels ($0 <= k <= (100 - 10 d)/5$), the remaining $(100 - 10 d - 5 k)$ cents are paid in pennies (exactly one way). So the count is $sum_(d=0)^(10) (floor.l (100 - 10 d)/5 floor.r + 1) = sum_(d=0)^(10) (2(10 - d) + 1) = sum_(j=0)^(10)(2 j + 1) = 121$.

  The answer is $bold(121)$.
]

#prob(2)[
  #difficulty(1)
  The sequence $(a_n)$ satisfies $a_0 = 1$, $a_1 = 3$, and $a_n = 4 a_(n-1) - 3 a_(n-2)$ for $n >= 2$. Find a closed form for $a_n$.
]
#hint(1)[Form the OGF $A(x) = sum a_n x^n$ and solve for it as a rational function.]
#hint(2)[You should get $A(x) = frac(1 - x, 1 - 4 x + 3 x^2) = frac(1 - x, (1 - x)(1 - 3 x))$.]
#hint(3)[After cancellation, $A(x) = frac(1, 1 - 3 x)$, so $a_n = 3^n$.]
#solution[
  Let $A(x) = sum a_n x^n$. Multiplying $a_n - 4 a_(n-1) + 3 a_(n-2) = 0$ by $x^n$ and summing for $n >= 2$:
  $ A(x) - 1 - 3 x - 4 x(A(x) - 1) + 3 x^2 A(x) = 0. $
  Thus $A(x)(1 - 4 x + 3 x^2) = 1 - x$, so $A(x) = frac(1 - x, (1 - x)(1 - 3 x)) = frac(1, 1 - 3 x)$.

  Therefore $a_n = 3^n$.
]

#prob(3)[
  #difficulty(2)
  Prove the Vandermonde identity: $display(sum_(k=0)^(r) binom(m, k) binom(n, r - k) = binom(m + n, r))$.
]
#hint(1)[Consider the coefficient of $x^r$ in a product of binomials.]
#hint(2)[$(1 + x)^m (1 + x)^n = (1 + x)^(m+n)$. Extract $[x^r]$ from both sides.]
#hint(3)[The left side of $(1+x)^m (1+x)^n$ gives $[x^r] = sum_k binom(m,k) binom(n, r-k)$ by the Cauchy product.]
#solution[
  We have $(1 + x)^(m + n) = (1 + x)^m (1 + x)^n$. Extracting $[x^r]$ from the right side via the Cauchy product formula:
  $ [x^r] ((1+x)^m (1+x)^n) = sum_(k=0)^(r) binom(m, k) binom(n, r - k). $
  From the left side, $[x^r](1+x)^(m+n) = binom(m+n, r)$. Equating gives the result.
]

#prob(4)[
  #difficulty(2)
  Let $D_n$ denote the number of derangements of $\{1, 2, dots, n\}$. Show that the EGF of $(D_n)$ is $e^(-x)/(1 - x)$.
]
#hint(1)[Use inclusion-exclusion: $D_n = n! sum_(k=0)^n (-1)^k / k!$.]
#hint(2)[The EGF of $n!$ is $1/(1-x)$ and the EGF of $(-1)^n$ is $e^(-x)$.]
#hint(3)[The EGF product rule says that multiplying EGFs corresponds to the binomial convolution $c_n = sum binom(n,k) a_k b_(n-k)$. Identify $a_k = (-1)^k$ and $b_j = j!$.]
#solution[
  By inclusion-exclusion, $D_n = sum_(k=0)^n binom(n, k) (-1)^k (n - k)!$. This is exactly the binomial convolution of $a_k = (-1)^k$ and $b_j = j!$. The EGF of $a_k$ is $sum (-1)^k x^k / k! = e^(-x)$, and the EGF of $b_j = j!$ is $sum j! x^j / j! = 1/(1 - x)$. By the EGF product rule, the EGF of $D_n$ is $e^(-x) / (1 - x)$.
]

#prob(5)[
  #difficulty(2)
  Find $[x^n] frac(1, (1 - x)^2 (1 - 2 x))$ using partial fractions.
]
#hint(1)[Decompose: $frac(1, (1 - x)^2 (1 - 2 x)) = frac(A, 1 - x) + frac(B, (1 - x)^2) + frac(C, 1 - 2 x)$.]
#hint(2)[Multiply through and compare coefficients. You should find $A = -1, B = -1, C = 1$ (using the convention $frac(1, (1 - r x)^k)$).]
#hint(3)[$[x^n] frac(1, (1-x)^2) = n + 1$ and $[x^n] frac(1, 1 - 2 x) = 2^n$.]
#solution[
  Partial fractions in the variable $x$: set $u = 1-x, v = 1-2x$. We need
  $ 1 = A(1-x)(1-2x) + B(1-2x) + C(1-x)^2. $
  Setting $x = 1$: $1 = B(-1)$, so $B = -1$. Setting $x = 1/2$: $1 = C(1/4)$, so $C = 4$. Setting $x = 0$: $1 = A + B + C = A - 1 + 4$, so $A = -2$.

  Thus $[x^n] = -2 dot 1^n + (-1)(n+1) dot 1^n + 4 dot 2^n = 2^(n+2) - n - 3$.

  The answer is $bold(2^(n+2) - n - 3)$.
]

#prob(6)[
  #difficulty(3)
  #putnam(2009, "B2")[
    A game on a $1 times n$ strip: a stone starts at position 1. On each turn, the stone moves right by 1 or 2 positions. Let $f(n)$ be the number of ways to reach position $n$. Find a closed form for $sum_(n=1)^(infinity) f(n) / 2^n$.
  ]
]
#hint(1)[Recognize that $f(n) = F_n$ (the $n$th Fibonacci number) since we either step by 1 or 2.]
#hint(2)[You need $sum_(n >= 1) F_n / 2^n = F(1/2)$ where $F(x) = x/(1 - x - x^2)$.]
#hint(3)[Evaluate $F(1/2) = (1/2)/(1 - 1/2 - 1/4) = (1/2)/(1/4) = 2$.]
#solution[
  The stone reaches position $n$ by compositions of 1s and 2s summing to $n - 1$. The count is $f(n) = F_n$ where $F_1 = 1, F_2 = 1, F_n = F_(n-1) + F_(n-2)$.

  The OGF is $F(x) = x/(1 - x - x^2)$ (shifted by 1 from the standard convention). We need $sum_(n >= 1) F_n (1/2)^n = F(1/2)/(1/2)... $

  More directly: $sum_(n >= 1) f(n) / 2^n$. Since $f(1) = 1, f(2) = 1, f(n) = f(n-1) + f(n-2)$, we let $S = sum_(n >= 1) f(n)/2^n$. Then
  $ S = f(1)/2 + f(2)/4 + sum_(n >= 3) (f(n-1) + f(n-2))/2^n = 1/2 + 1/4 + S/2 + S/4 - f(1)/4. $
  So $S = 1/2 + 1/4 + S/2 + S/4 - 1/4 = 1/2 + (3 S)/4$, giving $S/4 = 1/2$, hence $S = bold(2)$.
]

#prob(7)[
  #difficulty(3)
  Use the snake oil method to evaluate $display(sum_(k=0)^(n) binom(2 k, k) binom(2(n - k), n - k) 4^(-(n)))$.
]
#hint(1)[Recognize $binom(2 k, k) / 4^k$ as the coefficient $[x^k]$ of $1/sqrt(1 - x)$ evaluated appropriately.]
#hint(2)[The OGF of $binom(2 n, n)$ is $1/sqrt(1 - 4 x)$. So $binom(2 k, k)/4^k = [x^k](1/sqrt(1-x))$.]
#hint(3)[The sum is a convolution: $[x^n]((1/sqrt(1-x))^2) = [x^n](1/(1-x)) = 1$.]
#solution[
  The central binomial coefficient has OGF $sum_(n >= 0) binom(2 n, n) x^n = frac(1, sqrt(1 - 4 x))$. Thus $sum binom(2 n, n) (x/4)^n = frac(1, sqrt(1 - x))$.

  Our sum is $sum_(k=0)^n binom(2 k, k) 4^(-k) dot binom(2(n-k), n-k) 4^(-(n-k))$, which is the convolution $[x^n]((1/sqrt(1-x))^2) = [x^n](1/(1-x)) = 1$.

  The answer is $bold(1)$ for all $n >= 0$.
]
