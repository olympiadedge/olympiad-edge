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
#prob(2)[
  Let $t_n$ be the number of ways to tile a $2 times n$ board using $1 times 2$ dominoes. Find a recurrence for $t_n$ and derive a closed form.
]

#hint(1)[
  Consider the rightmost column of the $2 times n$ board. Either it is covered by a single vertical domino, or the last two columns are covered by two horizontal dominoes.
]

#hint(2)[
  If the last column has a vertical domino: the remaining board is $2 times (n - 1)$, giving $t_(n-1)$ tilings. If the last two columns have two horizontal dominoes: the remaining board is $2 times (n - 2)$, giving $t_(n-2)$ tilings. So $t_n = t_(n-1) + t_(n-2)$ with $t_1 = 1$, $t_2 = 2$.
]

#hint(3)[
  This is the Fibonacci recurrence shifted: $t_n = F_(n+1)$, where $F_k$ is the $k$th Fibonacci number ($F_1 = 1, F_2 = 1, F_3 = 2, dots$). The closed form is $t_n = frac(phi.alt^(n+1) - psi^(n+1), sqrt(5))$ where $phi.alt = (1 + sqrt(5))\/2$ and $psi = (1 - sqrt(5))\/2$.
]

#solution[
  Consider the rightmost column of a $2 times n$ board.

  *Case 1:* A vertical domino covers the rightmost column. The remaining board is $2 times (n - 1)$, with $t_(n-1)$ tilings.

  *Case 2:* Two horizontal dominoes cover the rightmost two columns. The remaining board is $2 times (n - 2)$, with $t_(n-2)$ tilings.

  These cases are disjoint and exhaustive, so $t_n = t_(n-1) + t_(n-2)$ with $t_1 = 1$ (one vertical domino) and $t_2 = 2$ (two verticals or two horizontals).

  The characteristic equation is $r^2 - r - 1 = 0$ with roots $phi.alt = frac(1 + sqrt(5), 2)$ and $psi = frac(1 - sqrt(5), 2)$. From initial conditions, $t_n = frac(phi.alt^(n+1) - psi^(n+1), sqrt(5)) = F_(n+1)$, the $(n + 1)$th Fibonacci number. $square$
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
  Substituting $a_n^((p)) = A n dot 2^n$: dividing by $2^(n-2)$ gives $4 A n - 10 A(n-1) + 6 A(n-2) = 4$, which simplifies to $-2 A = 4$, so $A = -2$.
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
#prob(4)[
  Let $C_n$ denote the $n$th Catalan number. Starting from $C_0 = 1$, derive the recurrence $C_(n+1) = sum_(k=0)^(n) C_k C_(n-k)$ and use it to compute $C_5$.
]

#hint(1)[
  Interpret $C_(n+1)$ as the number of ways to triangulate a convex $(n + 3)$-gon, or the number of valid sequences of $n + 1$ pairs of parentheses, or the number of full binary trees with $n + 1$ leaves.
]

#hint(2)[
  Use the parenthesization model. A valid sequence of $n + 1$ pairs of parentheses has a first matching pair. If the first open parenthesis matches at position $2 k + 2$, then the first $2 k + 2$ characters form a sub-expression with $k$ inner pairs, and the remaining $n - k$ pairs form another valid sequence.
]

#hint(3)[
  This gives $C_(n+1) = sum_(k=0)^(n) C_k C_(n - k)$. Compute: $C_0 = 1$, $C_1 = 1$, $C_2 = 2$, $C_3 = 5$, $C_4 = 14$, $C_5 = 42$.
]

#solution[
  We use the interpretation of $C_(n+1)$ as the number of valid parenthesizations with $n + 1$ pairs.

  Consider a valid sequence $s$ with $n + 1$ pairs of parentheses. The first character is an open parenthesis "(". Suppose its matching close parenthesis ")" is at position $2 k + 2$ (for some $0 <= k <= n$). Then:
  - Positions $2$ through $2 k + 1$ form a valid sub-sequence with $k$ pairs ($C_k$ choices).
  - Positions $2 k + 3$ through $2 n + 2$ form a valid sub-sequence with $n - k$ pairs ($C_(n - k)$ choices).

  Since $k$ ranges from 0 to $n$, we get the recurrence:
  $ C_(n+1) = sum_(k=0)^(n) C_k C_(n - k). $

  Computing from $C_0 = 1$:
  - $C_1 = C_0 C_0 = 1$
  - $C_2 = C_0 C_1 + C_1 C_0 = 2$
  - $C_3 = C_0 C_2 + C_1 C_1 + C_2 C_0 = 2 + 1 + 2 = 5$
  - $C_4 = C_0 C_3 + C_1 C_2 + C_2 C_1 + C_3 C_0 = 5 + 2 + 2 + 5 = 14$
  - $C_5 = C_0 C_4 + C_1 C_3 + C_2 C_2 + C_3 C_1 + C_4 C_0 = 14 + 5 + 4 + 5 + 14 = bold(42)$. $square$
]

=== Problem 5
#difficulty(3)
#prob(5)[
  The Tower of Hanoi has $n$ disks. Let $T_n$ be the minimum number of moves to transfer all $n$ disks from one peg to another. Find a recurrence for $T_n$, solve it, and prove that $T_n = 2^n - 1$ is optimal.
]

#hint(1)[
  To move $n$ disks from peg $A$ to peg $C$: first move the top $n - 1$ disks from $A$ to $B$ (using $C$ as auxiliary), then move the largest disk from $A$ to $C$, then move $n - 1$ disks from $B$ to $C$.
]

#hint(2)[
  This gives $T_n = 2 T_(n-1) + 1$ with $T_1 = 1$. To solve, let $S_n = T_n + 1$, then $S_n = 2 S_(n-1)$ with $S_1 = 2$, so $S_n = 2^n$ and $T_n = 2^n - 1$.
]

#hint(3)[
  For optimality: at some point the largest disk must move. Before it moves, all $n - 1$ smaller disks must be on a single peg (otherwise the largest cannot move). After it moves, all $n - 1$ must be reassembled. Each of these steps requires at least $T_(n-1)$ moves, plus 1 for the largest disk.
]

#solution[
  *Recurrence:* To move $n$ disks from peg $A$ to peg $C$:
  1. Move the top $n - 1$ disks from $A$ to $B$: at least $T_(n-1)$ moves.
  2. Move disk $n$ from $A$ to $C$: 1 move.
  3. Move $n - 1$ disks from $B$ to $C$: at least $T_(n-1)$ moves.

  This gives $T_n <= 2 T_(n-1) + 1$.

  *Optimality:* At some point, disk $n$ (the largest) must move. Before this, disks $1, dots, n - 1$ must all be off peg $A$ and off peg $C$ (since disk $n$ is on $A$ and must go to $C$), so they are all on peg $B$. Moving them there takes at least $T_(n-1)$ moves. Similarly, after disk $n$ moves, the $n - 1$ disks on $B$ must reach $C$, requiring at least $T_(n-1)$ more moves. Therefore $T_n >= 2 T_(n-1) + 1$.

  Combining: $T_n = 2 T_(n-1) + 1$ with $T_1 = 1$.

  *Closed form:* Let $S_n = T_n + 1$. Then $S_n = 2 S_(n-1)$ with $S_1 = 2$, so $S_n = 2^n$ and:
  $ T_n = bold(2^n - 1). $ $square$
]

=== Problem 6
#difficulty(3)
#prob(6)[
  A sequence satisfies $a_n = 5 a_(n-1) - 6 a_(n-2)$ for $n >= 2$, with $a_0 = 2$ and $a_1 = 5$. Find an explicit closed-form formula for $a_n$ and prove it by induction.
]

#hint(1)[
  The characteristic polynomial is $r^2 - 5 r + 6 = (r - 2)(r - 3) = 0$, with roots $r = 2$ and $r = 3$.
]

#hint(2)[
  The general solution is $a_n = alpha dot 2^n + beta dot 3^n$. From $a_0 = 2$: $alpha + beta = 2$. From $a_1 = 5$: $2 alpha + 3 beta = 5$. Solve to get $alpha = 1, beta = 1$.
]

#hint(3)[
  So $a_n = 2^n + 3^n$. Verify: $a_0 = 1 + 1 = 2$, $a_1 = 2 + 3 = 5$, $a_2 = 4 + 9 = 13$. Check: $5 dot 5 - 6 dot 2 = 25 - 12 = 13$. Correct.
]

#solution[
  The characteristic polynomial of $a_n = 5 a_(n-1) - 6 a_(n-2)$ is $r^2 - 5 r + 6 = (r - 2)(r - 3) = 0$.

  *General solution:* $a_n = alpha dot 2^n + beta dot 3^n$.

  *Initial conditions:*
  - $a_0 = 2$: $alpha + beta = 2$.
  - $a_1 = 5$: $2 alpha + 3 beta = 5$.

  Solving: $beta = 5 - 2(2 - beta) = 1$, so $beta = 1$ and $alpha = 1$.

  *Closed form:* $a_n = 2^n + 3^n$.

  *Proof by induction:* Base cases $a_0 = 2^0 + 3^0 = 2$ and $a_1 = 2^1 + 3^1 = 5$ are correct. For the inductive step, assume $a_(n-1) = 2^(n-1) + 3^(n-1)$ and $a_(n-2) = 2^(n-2) + 3^(n-2)$. Then:
  $ 5 a_(n-1) - 6 a_(n-2) = 5(2^(n-1) + 3^(n-1)) - 6(2^(n-2) + 3^(n-2)) $
  $ = 2^(n-2)(5 dot 2 - 6) + 3^(n-2)(5 dot 3 - 6) = 2^(n-2) dot 4 + 3^(n-2) dot 9 = 2^n + 3^n. $ $square$
]
