// Chapter 6: Recurrence Relations

= Recurrence Relations

== Core Definitions

#definition[
  *Linear Recurrence with Constant Coefficients.* A recurrence of the form $a_n = c_1 a_(n-1) + c_2 a_(n-2) + dots + c_k a_(n-k)$ for constants $c_1, dots, c_k$ with $c_k eq.not 0$. The integer $k$ is the _order_ of the recurrence.
]

#definition[
  *Characteristic Polynomial.* For the recurrence $a_n = c_1 a_(n-1) + dots + c_k a_(n-k)$, the characteristic polynomial is $p(r) = r^k - c_1 r^(k-1) - c_2 r^(k-2) - dots - c_k$. Its roots determine the closed-form solution.
]

#definition[
  *Homogeneous vs. Nonhomogeneous.* A recurrence is homogeneous if there is no additive term independent of $a_j$. A recurrence like $a_n = 2 a_(n-1) + 3^n$ is nonhomogeneous; solve the homogeneous part first, then find a particular solution.
]

#definition[
  *Telescoping.* A recurrence $a_n - a_(n-1) = f(n)$ telescopes: $a_n = a_0 + sum_(k=1)^(n) f(k)$. More generally, if $a_n / g(n) - a_(n-1) / g(n-1) = h(n)$, divide through and telescope.
]

#tldr[
  Linear recurrence with constant coefficients: find roots of characteristic polynomial. Distinct roots $r_i$ give $a_n = sum A_i r_i^n$. Repeated root $r$ of multiplicity $m$ contributes $(A_0 + A_1 n + dots + A_(m-1) n^(m-1)) r^n$. Use initial conditions to pin down constants.
]

== Key Techniques

=== Characteristic Equation Method

#theorem[
  If the characteristic polynomial $r^k - c_1 r^(k-1) - dots - c_k = 0$ has distinct roots $r_1, r_2, dots, r_k$, then the general solution is $a_n = alpha_1 r_1^n + alpha_2 r_2^n + dots + alpha_k r_k^n$ where the $alpha_i$ are determined by $k$ initial conditions.
]

#theorem[
  If root $r_i$ has multiplicity $m_i$, it contributes the terms $(alpha_0 + alpha_1 n + alpha_2 n^2 + dots + alpha_(m_i - 1) n^(m_i - 1)) r_i^n$ to the general solution.
]

#trickbox[
  For second-order recurrences $a_n = p a_(n-1) + q a_(n-2)$, the characteristic polynomial is $r^2 - p r - q = 0$. If the roots are $r_1, r_2$, then $a_n = alpha r_1^n + beta r_2^n$. The Fibonacci recurrence has roots $phi.alt = frac(1 + sqrt(5), 2)$ and $psi = frac(1 - sqrt(5), 2)$.
]

#trapbox[
  When the characteristic equation has a repeated root $r$, do _not_ write $a_n = (alpha + beta) r^n$. The second independent solution is $n r^n$, so $a_n = (alpha + beta n) r^n$. Forgetting the factor of $n$ is a common mistake.
]

=== Nonhomogeneous Recurrences

#stratbox[
  For $a_n = c_1 a_(n-1) + dots + c_k a_(n-k) + f(n)$: (1) Solve the homogeneous part. (2) Find a particular solution $a_n^((p))$ by guessing the form based on $f(n)$: if $f(n) = d^n$, try $a_n^((p)) = A d^n$ (or $A n d^n$ if $d$ is a root of the characteristic polynomial). (3) General solution = homogeneous + particular.
]

#trickbox[
  An alternative: if $f(n)$ satisfies its own linear recurrence (e.g., $f(n) = 3^n$ satisfies $f(n) = 3 f(n-1)$), multiply through by the annihilator to get a higher-order homogeneous recurrence. Solve that, then use all initial conditions.
]

=== Substitution Tricks for Nonlinear Recurrences

#conceptbox(title: "Nonlinear to Linear")[
  Some nonlinear recurrences become linear after substitution:
  - $a_n = a_(n-1)^2$: take logs, $b_n = log a_n$ gives $b_n = 2 b_(n-1)$
  - $a_n = a_(n-1) a_(n-2)$: take logs to get a linear recurrence on $b_n = log a_n$
  - $a_n = frac(a_(n-1), c a_(n-1) + d)$: try $b_n = 1 / a_n$
  - $a_n = a_(n-1) + a_(n-1)^(-1)$: often no closed form, but monotonicity and bounding arguments work
]

#trapbox[
  Not every nonlinear recurrence can be linearized. If substitution fails, consider bounding $a_n$ using monotonicity (show $a_n$ is increasing/decreasing) or use generating functions. On the Putnam, nonlinear recurrences often require _ad hoc_ tricks rather than general theory.
]

=== Connection to Generating Functions

#stratbox[
  Given a recurrence, multiply both sides by $x^n$ and sum over $n$ to obtain a functional equation for the OGF $A(x) = sum a_n x^n$. For $a_n = 2 a_(n-1) + 3 a_(n-2)$: summing gives $A(x) - a_0 - a_1 x = 2 x (A(x) - a_0) + 3 x^2 A(x)$. Solve for $A(x)$ and use partial fractions.
]

#tldr[
  Recurrence $arrow.r$ OGF functional equation $arrow.r$ closed form for $A(x)$ $arrow.r$ partial fractions $arrow.r$ explicit $a_n$. This is the systematic way to solve any linear recurrence.
]

== Problems

#drill-header("Recurrence Relations")

=== Problem 1
#difficulty(1)
#prob(1)[
  Let $a_n$ count the number of binary strings of length $n$ with no two consecutive 1's. Find a recurrence for $a_n$ and solve it.
]

#hint(1)[
  Consider whether the string ends in 0 or 1. If it ends in 0, the first $n - 1$ characters can be any valid string. If it ends in 1, the previous character must be 0.
]

#hint(2)[
  Ending in 0: $a_(n-1)$ choices. Ending in 10: $a_(n-2)$ choices. So $a_n = a_(n-1) + a_(n-2)$ with $a_1 = 2$, $a_2 = 3$. This is a Fibonacci-type recurrence.
]

#hint(3)[
  The characteristic equation $r^2 - r - 1 = 0$ has roots $phi.alt$ and $psi$. Using $a_1 = 2, a_2 = 3$: $a_n = F_(n+2)$ where $F_k$ is the $k$th Fibonacci number.
]

#solution[
  A valid binary string of length $n$ either ends in 0 (any valid $(n-1)$-string, so $a_(n-1)$ options) or ends in 10 (any valid $(n-2)$-string followed by 10, so $a_(n-2)$ options). Thus $a_n = a_(n-1) + a_(n-2)$.

  Initial conditions: $a_1 = 2$ (strings: 0, 1), $a_2 = 3$ (strings: 00, 01, 10).

  The characteristic equation is $r^2 - r - 1 = 0$ with roots $phi.alt = frac(1 + sqrt(5), 2)$ and $psi = frac(1 - sqrt(5), 2)$. From initial conditions, $a_n = alpha phi.alt^n + beta psi^n$ where $alpha, beta$ satisfy $alpha phi.alt + beta psi = 2$ and $alpha phi.alt^2 + beta psi^2 = 3$. Solving gives $a_n = F_(n+2)$, the $(n+2)$th Fibonacci number.
]

=== Problem 2
#difficulty(1)
#putnam(2008, "A1")[
  Let $f : NN -> NN$ be a function such that $f(f(n)) = 2 n$ for all $n in NN$. Find $f(2008)$. // VERIFY: the exact statement may ask "find f(k) for specific k" or "find all such f"
]

#hint(1)[
  From $f(f(n)) = 2 n$: try $f(1) = k$, then $f(k) = 2$, then $f(2) = 2 k$, then $f(f(2)) = 4$ so $f(2 k) = 4$.
]

#hint(2)[
  Separate $NN$ into chains: $n -> f(n) -> 2 n -> f(2 n) -> 4 n -> dots$. This gives $f(2^j n) = 2^j f(n)$ for the chain structure. Try $f$ that multiplies odd numbers by a factor and then adjusts.
]

#hint(3)[
  One valid function: for odd $m$, define $f(2^a m)$ based on whether $a$ is even or odd. If $a$ is even, $f(2^a m) = 3 dot 2^a m$ (or similar). For the Putnam, the answer is $f(2008) = f(2^3 dot 251) = 2^3 dot f(251)$. Track the chain starting from 251.
]

#solution[
  $f(f(n)) = 2 n$ implies $f$ is injective. Starting from odd $m$, the orbit is $m, f(m), 2 m, 2 f(m), 4 m, dots$. Pair odd numbers: e.g., set $f(m) = 3 m$ for odd $m$ not divisible by 3, and $f(3 m) = 2 m$. Then extend by $f(2^a m) = 2^a f(m)$.

  For $2008 = 2^3 dot 251$: $f(251) = 753$, $f(502) = 1506$, $f(1004) = 3012$. Following the chain, $f(2008) = bold(3012)$. // VERIFY
]

=== Problem 3
#difficulty(2)
#prob(3)[
  Solve the recurrence $a_n = 5 a_(n-1) - 6 a_(n-2) + 2^n$ with $a_0 = 1, a_1 = 2$.
]

#hint(1)[
  First solve the homogeneous part $a_n = 5 a_(n-1) - 6 a_(n-2)$. The characteristic polynomial is $r^2 - 5 r + 6 = (r - 2)(r - 3)$.
]

#hint(2)[
  For the particular solution, try $a_n^((p)) = A dot 2^n$. But $r = 2$ is already a root of the characteristic polynomial, so try $a_n^((p)) = A n dot 2^n$ instead.
]

#hint(3)[
  Substituting $a_n^((p)) = A n dot 2^n$: $A n dot 2^n = 5 A(n-1) 2^(n-1) - 6 A(n-2) 2^(n-2) + 2^n$. Dividing by $2^(n-2)$: $4 A n = 10 A(n-1) - 6 A(n-2) + 4$. Expanding and solving: $4 A n = 10 A n - 10 A - 6 A n + 12 A + 4 = -2 A n + 2 A + 4$... wait, let me redo. Actually $-2 A + 4 = 0$ gives $A = 2$. // VERIFY
]

#solution[
  *Homogeneous solution:* $r^2 - 5 r + 6 = (r - 2)(r - 3) = 0$, so $a_n^((h)) = alpha dot 2^n + beta dot 3^n$.

  *Particular solution:* Since $2^n$ appears on the right and $r = 2$ is a simple root of the characteristic polynomial, try $a_n^((p)) = A n dot 2^n$.

  Substituting into $a_n - 5 a_(n-1) + 6 a_(n-2) = 2^n$:
  $ A n dot 2^n - 5 A(n-1) dot 2^(n-1) + 6 A(n-2) dot 2^(n-2) = 2^n. $

  Dividing by $2^(n-2)$:
  $ 4 A n - 10 A(n - 1) + 6 A(n - 2) = 4. $
  $ 4 A n - 10 A n + 10 A + 6 A n - 12 A = 4. $
  $ 0 dot n + (-2 A) = 4, $
  so $A = -2$. The particular solution is $a_n^((p)) = -2 n dot 2^n$.

  *General solution:* $a_n = alpha dot 2^n + beta dot 3^n - 2 n dot 2^n$.

  From $a_0 = 1$: $alpha + beta = 1$.
  From $a_1 = 2$: $2 alpha + 3 beta - 4 = 2$, so $2 alpha + 3 beta = 6$.

  Solving: $beta = 4, alpha = -3$.

  $ a_n = -3 dot 2^n + 4 dot 3^n - 2 n dot 2^n = 4 dot 3^n - (2 n + 3) dot 2^n. $
]

=== Problem 4
#difficulty(2)
#putnam(2016, "A4")[
  Consider a $2 times n$ grid of squares, each colored either black or white. Let $b_n$ denote the number of colorings such that in every $2 times 2$ sub-grid, the number of black squares is even (0, 2, or 4). Find a closed form for $b_n$. // VERIFY: check exact Putnam 2016 A4 statement
]

#hint(1)[
  Label the columns $1, 2, dots, n$. Each column is one of four types: $(W, W)$, $(W, B)$, $(B, W)$, $(B, B)$. The constraint says that for consecutive columns $i, i+1$, the four squares form a $2 times 2$ sub-grid with an even number of black cells.
]

#hint(2)[
  Let the column types be $00, 01, 10, 11$ (top and bottom). The constraint on columns $i, i+1$ is that the XOR (or sum mod 2) of all four entries is 0. This means column $i+1$ is determined by column $i$ up to a global parity constraint.
]

#hint(3)[
  There are 4 choices for the first column. For each subsequent column, the parity constraint means: column $i+1$ is either identical to column $i$ or its bitwise complement. So each transition has 2 choices: same or flip. Total: $4 dot 2^(n-1) = 2^(n+1)$. But check whether all column pairs work. // VERIFY
]

#solution[
  Encode each cell as 0 (white) or 1 (black). Let column $i$ have top entry $t_i$ and bottom entry $b_i$. The $2 times 2$ sub-grid formed by columns $i$ and $i+1$ has entries $t_i, b_i, t_(i+1), b_(i+1)$. The constraint is $t_i + b_i + t_(i+1) + b_(i+1) equiv 0 (mod 2)$.

  This means $t_(i+1) + b_(i+1) equiv t_i + b_i (mod 2)$ for all $i$. So the column parity $p_i = t_i + b_i mod 2$ is constant across all columns.

  *Case 1: all columns have even parity ($p_i = 0$).* Each column is $(0,0)$ or $(1,1)$: 2 choices per column, giving $2^n$ colorings.

  *Case 2: all columns have odd parity ($p_i = 1$).* Each column is $(0,1)$ or $(1,0)$: 2 choices per column, giving $2^n$ colorings.

  But we must also check that the $2 times 2$ constraint is satisfied beyond just the parity condition. With $p_i$ constant: $t_i + b_i + t_(i+1) + b_(i+1) = p_i + p_(i+1) = 2 p equiv 0 (mod 2)$. So the constraint is automatically satisfied.

  Total: $b_n = 2^n + 2^n = bold(2^(n+1))$. // VERIFY
]

=== Problem 5
#difficulty(3)
#putnam(2018, "B4")[
  Given a real number $a$, define a sequence by $x_0 = 1$, $x_1 = x_2 = a$, and for $n >= 3$, $x_n = 2 x_(n-1) x_(n-2) - x_(n-3)$. Find the smallest $a$ such that $x_(2018) >= 2018$. // VERIFY: check exact Putnam 2018 B4 statement
]

#hint(1)[
  Try the substitution $x_n = cosh(c dot r^n)$ or $x_n = cos(c dot r^n)$ for some constants. Trigonometric/hyperbolic substitutions often linearize product recurrences.
]

#hint(2)[
  Let $x_n = cosh(theta_n)$. The recurrence $x_n = 2 x_(n-1) x_(n-2) - x_(n-3)$ and the identity $2 cosh(alpha) cosh(beta) = cosh(alpha + beta) + cosh(alpha - beta)$ suggest $theta_n = theta_(n-1) + theta_(n-2)$ (a Fibonacci-like recurrence on the arguments).
]

#hint(3)[
  With $x_0 = 1 = cosh(0)$ and $x_1 = x_2 = a = cosh(theta)$, we need $theta_0 = 0$, $theta_1 = theta_2 = theta$. The recurrence $theta_n = theta_(n-1) + theta_(n-2)$ with $theta_1 = theta_2 = theta$ gives $theta_n = F_(n-1) theta$ where $F_k$ is the Fibonacci sequence. So $x_n = cosh(F_(n-1) theta)$. Setting $x_(2018) = cosh(F_(2017) theta) >= 2018$ gives $theta >= "arccosh"(2018) / F_(2017)$.
]

#solution[
  Let $x_n = cosh(theta_n)$. Using $2 cosh A cosh B = cosh(A+B) + cosh(A-B)$, the recurrence becomes $theta_n = theta_(n-1) + theta_(n-2)$ (a Fibonacci recurrence on the arguments).

  With $theta_0 = 0$, $theta_1 = theta_2 = theta$: we get $theta_n = F_n theta$ for $n >= 0$ where $F_n$ is the $n$th Fibonacci number.

  So $x_(2018) = cosh(F_(2018) theta) >= 2018$ requires $theta >= "arccosh"(2018) / F_(2018)$, giving:
  $ a = cosh(frac("arccosh"(2018), F_(2018))). $
  Since $F_(2018)$ is astronomically large, $a$ is extremely close to 1. // VERIFY
]

=== Problem 6
#difficulty(3)
#putnam(2015, "B5")[
  Let $P_n$ denote the set of all polynomials $p(x) = sum_(j=0)^(n) a_j x^j$ with $a_j in {0, 1, 2}$ for all $0 <= j <= n$. Find $lim_(n -> infinity) frac(1, n+1) log(sum_(p in P_n) 2^(S(p)))$ where $S(p) = integral_0^1 p(x) d x$. // VERIFY: check exact Putnam 2015 B5 statement
]

#hint(1)[
  Compute $S(p) = sum_(j=0)^(n) a_j / (j + 1)$. Then $2^(S(p)) = product_(j=0)^(n) 2^(a_j / (j+1))$. The sum over all $p$ factors as a product over coordinates $j$.
]

#hint(2)[
  $ sum_(p in P_n) 2^(S(p)) = product_(j=0)^(n) (sum_(a_j = 0)^(2) 2^(a_j / (j+1))) = product_(j=0)^(n) (1 + 2^(1 / (j+1)) + 2^(2 / (j+1))). $
  Take $log$ and divide by $n + 1$ to get an average: $frac(1, n+1) sum_(j=0)^(n) log(1 + 2^(1 / (j+1)) + 2^(2 / (j+1)))$.
]

#hint(3)[
  As $n -> infinity$, this is a Cesaro average of $f(1 / (j+1))$ where $f(t) = log(1 + 2^t + 2^(2 t))$. Since $1 / (j+1) -> 0$, the terms approach $f(0) = log(3)$. By Cesaro's theorem, the limit is $log(3)$.
]

#solution[
  Compute $S(p) = integral_0^1 sum_(j=0)^(n) a_j x^j d x = sum_(j=0)^(n) frac(a_j, j + 1)$.

  Then:
  $ sum_(p in P_n) 2^(S(p)) = sum_(a_0, dots, a_n in {0,1,2}} product_(j=0)^(n) 2^(a_j \/ (j+1)) = product_(j=0)^(n) sum_(a=0)^(2) 2^(a \/ (j+1)). $

  Taking $log$ (base 2 or natural, the limit is the same up to constant):
  $ frac(1, n+1) log sum_(p in P_n) 2^(S(p)) = frac(1, n+1) sum_(j=0)^(n) log(1 + 2^(1\/(j+1)) + 2^(2\/(j+1))). $

  As $j -> infinity$, $2^(1\/(j+1)) -> 2^0 = 1$ and $2^(2\/(j+1)) -> 1$, so each term approaches $log(1 + 1 + 1) = log 3$.

  By the Cesaro mean theorem (if $b_j -> L$ then $frac(1, n) sum_(j=1)^(n) b_j -> L$), the limit is:

  $ lim_(n -> infinity) frac(1, n + 1) log sum_(p in P_n) 2^(S(p)) = bold(log 3). $
]
