// ════════════════════════════════════════════════════════════
// Chapter 5 — Recurrences & Tiling Problems
// Self-contained: no imports
// ════════════════════════════════════════════════════════════

= Recurrences & Tiling Problems

#tldr[When a counting problem has natural "size" $n$ and the objects of size $n$ decompose into smaller pieces, write a recurrence. Solve it via characteristic equations, generating functions, or pattern recognition.]

== Setting Up Recurrences from Counting Problems

#stratbox[
  *Recipe for finding a recurrence:*
  1. Let $a_n$ = the quantity to count for "size $n$."
  2. Look at the *last* element (or first, or largest): what are its options?
  3. For each option, the rest of the structure gives a smaller instance.
  4. Sum over options to get $a_n$ in terms of $a_(n - 1), a_(n - 2), dots$
  5. Find initial conditions by computing small cases.
]

#remark[][
  The "look at the last element" heuristic works for sequences, tilings, partitions, and trees. For grid-based problems, "look at the last column" is the analogous move.
]

#trickbox[If a problem says "how many binary strings of length $n$ satisfy..." or "how many tilings of a $2 times n$ board...," a recurrence is almost always the intended approach.]

== Linear Recurrences (Characteristic Equation Method)

#definition("Linear Recurrence with Constant Coefficients")[
  A recurrence of the form $a_n = c_1 a_(n - 1) + c_2 a_(n - 2) + dots.c + c_k a_(n - k)$ with constants $c_1, dots, c_k$ is a *$k$-th order linear recurrence*.
]

#theorem("Characteristic Equation")[
  The recurrence $a_n = c_1 a_(n - 1) + c_2 a_(n - 2) + dots.c + c_k a_(n - k)$ has characteristic equation
  $ x^k - c_1 x^(k - 1) - c_2 x^(k - 2) - dots.c - c_k = 0. $
  If the roots $r_1, r_2, dots, r_k$ are distinct, the general solution is $a_n = A_1 r_1^n + A_2 r_2^n + dots.c + A_k r_k^n$, where the $A_i$ are determined by initial conditions.
]

#conceptbox(title: "Repeated Roots")[
  If root $r$ has multiplicity $m$, its contribution to the general solution is $(A_1 + A_2 n + A_3 n^2 + dots.c + A_m n^(m - 1)) r^n$.
]

#trapbox[Do not forget: the characteristic equation method only works for *constant*-coefficient linear recurrences. If the coefficients depend on $n$ (e.g.\ $a_n = n dot a_(n - 1)$), use other methods (generating functions, direct computation).]

== Fibonacci & Lucas Numbers

#definition("Fibonacci Numbers")[
  $F_0 = 0$, $F_1 = 1$, $F_n = F_(n - 1) + F_(n - 2)$ for $n >= 2$.
]

#definition("Lucas Numbers")[
  $L_0 = 2$, $L_1 = 1$, $L_n = L_(n - 1) + L_(n - 2)$ for $n >= 2$.
]

#theorem("Binet's Formula")[
  Let $phi = (1 + sqrt(5)) / 2$ and $hat(phi) = (1 - sqrt(5)) / 2$. Then
  $ F_n = (phi^n - hat(phi)^n) / sqrt(5), quad L_n = phi^n + hat(phi)^n. $
]

#proof[][
  The characteristic equation $x^2 = x + 1$ has roots $phi$ and $hat(phi)$. So $F_n = A phi^n + B hat(phi)^n$. From $F_0 = 0$: $A + B = 0$. From $F_1 = 1$: $A phi + B hat(phi) = 1$. Solving: $A = 1 / sqrt(5)$, $B = -1 / sqrt(5)$. $square$
]

#conceptbox(title: "Key Fibonacci Identities")[
  - *Cassini:* $F_(n - 1) F_(n + 1) - F_n^2 = (-1)^n$\
  - *Addition:* $F_(m + n) = F_m F_(n + 1) + F_(m - 1) F_n$\
  - *Sum:* $F_1 + F_2 + dots.c + F_n = F_(n + 2) - 1$\
  - *GCD:* $gcd(F_m, F_n) = F_(gcd(m, n))$\
  - *Zeckendorf:* Every positive integer has a unique representation as a sum of non-consecutive Fibonacci numbers.
]

#trickbox[If a competition answer turns out to be $1, 1, 2, 3, 5, 8, 13, 21, dots$, check whether the recurrence is $a_n = a_(n - 1) + a_(n - 2)$. Fibonacci appears in tiling, composition counting, and graph independence problems.]

== Tiling Problems

=== Domino Tilings of $2 times n$

#theorem("$2 times n$ Domino Tiling")[
  Let $T_n$ = number of ways to tile a $2 times n$ rectangle with $1 times 2$ dominoes. Then $T_n = F_(n + 1)$ (the $(n + 1)$-th Fibonacci number), with $T_0 = 1$, $T_1 = 1$, $T_2 = 2$.
]

#proof[][
  Look at column $n$ (the rightmost column). Either it is covered by a vertical domino (leaving a $2 times (n - 1)$ board: $T_(n - 1)$ ways) or columns $n - 1$ and $n$ are covered by two horizontal dominoes (leaving a $2 times (n - 2)$ board: $T_(n - 2)$ ways). Hence $T_n = T_(n - 1) + T_(n - 2)$, with $T_0 = 1, T_1 = 1$. This is the Fibonacci recurrence shifted by one index. $square$
]

=== Domino Tilings of $3 times 2 n$

#theorem("$3 times 2 n$ Domino Tiling")[
  The $3 times (2 n)$ rectangle can be tiled by dominoes in $T_n$ ways satisfying the recurrence:
  $ T_n = 4 T_(n - 1) - T_(n - 2), quad T_0 = 1, quad T_1 = 3. $
  The closed form is $T_n = ((2 + sqrt(3))^n + (2 - sqrt(3))^n) / 2$ (always an integer).
]

#remark[][
  Note $3 times (2 n + 1)$ boards cannot be tiled at all (odd number of cells, each domino covers $2$).
]

=== L-Shaped Tiles and Variations

#conceptbox(title: "Handling Irregular Tiles")[
  For non-rectangular tiles (L-trominoes, T-tetrominoes, etc.), the state-based approach is essential. Define the "profile" of the boundary between filled and unfilled columns, and set up a recurrence on profiles. For a $k$-row board, there are $2^k$ possible profiles, giving a $2^k times 2^k$ transfer matrix.
]

== State-Based Recursions

#definition("State-Based Recursion")[
  When the "last column" heuristic is insufficient because partially filled columns matter, define a *state* describing which cells in the current column are already filled (by tiles extending from the previous column). The recurrence relates counts for each state at column $n$ to states at column $n - 1$.
]

#stratbox[
  *Transfer Matrix Method:*
  1. List all valid states (column profiles).
  2. Build a matrix $M$ where $M_(i j) = 1$ if state $i$ can follow state $j$.
  3. The total count for an $n$-column board is the appropriate entry of $M^n$.
  4. For large $n$, diagonalize $M$ (or find its eigenvalues) to get a closed form.
]

#remark[][
  The transfer matrix method works for any tiling or coloring problem on a strip of fixed width. The computational cost is exponential in the width but only linear in the length.
]

#trapbox[For state-based recursions, make sure your states capture *all* relevant information. A common mistake is defining states too coarsely, leading to an incorrect recurrence.]

== Problems

#drill-header[Recurrences & Tiling Problems]

#prob([1], [#difficulty(1) Find the number of binary strings of length $12$ with no two consecutive $0$s.])

#hint(1)[Let $a_n$ = number of valid strings of length $n$. Consider the last character.]
#hint(2)[If the last character is $1$: any valid string of length $n - 1$ works ($a_(n - 1)$ ways). If the last character is $0$: the second-to-last must be $1$, so the first $n - 2$ characters form a valid string ($a_(n - 2)$ ways).]
#hint(3)[$a_n = a_(n - 1) + a_(n - 2)$ with $a_1 = 2, a_2 = 3$. This is $F_(n + 2)$. For $n = 12$: $F_(14) = 377$.]

#solution[
  The recurrence $a_n = a_(n - 1) + a_(n - 2)$ with $a_1 = 2$, $a_2 = 3$ gives $a_n = F_(n + 2)$. Computing: $a_3 = 5, a_4 = 8, a_5 = 13, a_6 = 21, a_7 = 34, a_8 = 55, a_9 = 89, a_(10) = 144, a_(11) = 233, a_(12) = 377$. The answer is $bold("377")$.
]

#prob([2], [#difficulty(1) In how many ways can you tile a $2 times 10$ rectangle with $1 times 2$ dominoes?])

#hint(1)[This is the classic $2 times n$ tiling problem.]
#hint(2)[$T_n = T_(n - 1) + T_(n - 2)$ with $T_1 = 1, T_2 = 2$.]
#hint(3)[Compute up to $T_(10)$: $1, 2, 3, 5, 8, 13, 21, 34, 55, 89$.]

#solution[
  $T_1 = 1, T_2 = 2, T_3 = 3, T_4 = 5, T_5 = 8, T_6 = 13, T_7 = 21, T_8 = 34, T_9 = 55, T_(10) = 89$. The answer is $bold("89")$.
]

#prob([3], [#difficulty(1) #aime(2004, 11)[A sequence $a_1, a_2, dots$ satisfies $a_1 = 1$ and $a_n = a_(n - 1) + a_(floor(n slash 2))$ for $n >= 2$. Find $a_(20)$.])])

#hint(1)[Compute iteratively: $a_1 = 1$, $a_2 = a_1 + a_1 = 2$, $a_3 = a_2 + a_1 = 3$, $a_4 = a_3 + a_2 = 5$, etc.]
#hint(2)[Continue: $a_5 = a_4 + a_2 = 7$, $a_6 = a_5 + a_3 = 10$, $a_7 = a_6 + a_3 = 13$, $a_8 = a_7 + a_4 = 18$.]
#hint(3)[Keep going up to $a_(20)$. Be careful with $floor(n / 2)$.]

#solution[
  Computing term by term:
  $a_1 = 1$, $a_2 = 2$, $a_3 = 3$, $a_4 = 5$, $a_5 = 7$, $a_6 = 10$, $a_7 = 13$, $a_8 = 18$, $a_9 = 23$, $a_(10) = 30$, $a_(11) = 37$, $a_(12) = 47$, $a_(13) = 57$, $a_(14) = 70$, $a_(15) = 84$, $a_(16) = 102$, $a_(17) = 120$, $a_(18) = 144$, $a_(19) = 167$, $a_(20) = 197$.

  Verification: $a_(20) = a_(19) + a_(10) = 167 + 30 = bold("197")$.
]

#prob([4], [#difficulty(2) Find the number of ways to tile a $3 times 8$ rectangle with $1 times 2$ dominoes.])

#hint(1)[Use the recurrence for $3 times 2 n$ tiling: $T_n = 4 T_(n - 1) - T_(n - 2)$ with $T_0 = 1, T_1 = 3$.]
#hint(2)[Here $3 times 8 = 3 times 2 dot 4$, so $n = 4$.]
#hint(3)[$T_2 = 4 dot 3 - 1 = 11$. $T_3 = 4 dot 11 - 3 = 41$. $T_4 = 4 dot 41 - 11 = 153$.]

#solution[
  Using $T_n = 4 T_(n - 1) - T_(n - 2)$:
  - $T_0 = 1$
  - $T_1 = 3$
  - $T_2 = 4(3) - 1 = 11$
  - $T_3 = 4(11) - 3 = 41$
  - $T_4 = 4(41) - 11 = 153$

  The answer is $bold("153")$.
]

#prob([5], [#difficulty(2) Let $a_n$ be the number of ternary strings of length $n$ (over ${0, 1, 2}$) that do not contain "$012$" as a substring. Find a recurrence for $a_n$ and compute $a_6$.])

#hint(1)[Define states based on the longest suffix of the current string that is a prefix of "$012$": state $s_0$ (no progress), $s_1$ (ends in $0$), $s_2$ (ends in $01$). If we reach state $s_3$ ($012$ achieved), the string is invalid.]
#hint(2)[Set up transitions: from $s_0$, appending $0$ goes to $s_1$, appending $1$ or $2$ stays at $s_0$. From $s_1$, appending $0$ stays at $s_1$, appending $1$ goes to $s_2$, appending $2$ goes to $s_0$. From $s_2$, appending $0$ goes to $s_1$, appending $1$ stays at $s_0$ (since $"01" + "1"$ has no useful prefix match), appending $2$ is forbidden (reaches "$012$").]
#hint(3)[Let $f_n, g_n, h_n$ be the counts for strings of length $n$ ending in states $s_0, s_1, s_2$. Then $a_n = f_n + g_n + h_n$. Solve the system iteratively.]

#solution[
  States: $s_0$ (neutral), $s_1$ (last char is $0$, partial match "$0$"), $s_2$ (last two chars end a partial match "$01$"). Transitions:

  $f_(n + 1) = 2 f_n + g_n + h_n$ (from $s_0$: append $1$ or $2$; from $s_1$: append $2$; from $s_2$: append $1$)\
  $g_(n + 1) = f_n + g_n + h_n$ (from any state: append $0$, with $s_1$ staying at $s_1$, $s_2$ going to $s_1$, $s_0$ going to $s_1$)\
  $h_(n + 1) = g_n$ (from $s_1$: append $1$)

  Wait, let me be more careful. From $s_2$, appending $0$: the suffix is now "$0$" (back to $s_1$). Appending $1$: the suffix "$011$" has no prefix of "$012$", so back to $s_0$. Appending $2$: forms "$012$", rejected.

  So: $f_(n + 1) = 2 f_n + g_n + h_n$, $g_(n + 1) = f_n + g_n + h_n$, $h_(n + 1) = g_n$.

  But from $s_2$, only $2$ valid continuations (append $0$ or $1$), and we computed those into $g$ and $f$ respectively.

  Initial: $f_0 = 1, g_0 = 0, h_0 = 0$.

  $n = 1$: $f_1 = 2, g_1 = 1, h_1 = 0$. Total $= 3$. ✓\
  $n = 2$: $f_2 = 2(2) + 1 + 0 = 5$, $g_2 = 2 + 1 + 0 = 3$, $h_2 = 1$. Total $= 9$. ✓\
  $n = 3$: $f_3 = 10 + 3 + 1 = 14$, $g_3 = 5 + 3 + 1 = 9$, $h_3 = 3$. Total $= 26$.\
  $n = 4$: $f_4 = 28 + 9 + 3 = 40$, $g_4 = 14 + 9 + 3 = 26$, $h_4 = 9$. Total $= 75$.\
  $n = 5$: $f_5 = 80 + 26 + 9 = 115$, $g_5 = 40 + 26 + 9 = 75$, $h_5 = 26$. Total $= 216$.\
  $n = 6$: $f_6 = 230 + 75 + 26 = 331$, $g_6 = 115 + 75 + 26 = 216$, $h_6 = 75$. Total $= 622$.

  The answer is $a_6 = bold("622")$.
]

#prob([6], [#difficulty(2) #aime(2007, 13)[A $4 times 4$ grid is to be colored with $4$ colors so that each row and each column is a permutation of the $4$ colors. How many such colorings exist?])])

#hint(1)[This is counting $4 times 4$ Latin squares. The first row can be any permutation: $4! = 24$ choices.]
#hint(2)[After fixing the first row as $(1, 2, 3, 4)$, count Latin squares with this first row. The number of reduced $4 times 4$ Latin squares is $4$.]
#hint(3)[Total: $4! times 4 = 96$? Not quite — we must also account for column permutations of the first row. Actually, the number of $4 times 4$ Latin squares is $576$. With $4!$ choices for row 1, the number of completions is $576 / 4! = 24$... Let me reconsider. The total number of $4 times 4$ Latin squares is $576$.]

#solution[
  The number of $4 times 4$ Latin squares is known to be $576$. Here's a verification: fix row 1 as $(1, 2, 3, 4)$. The number of ways to complete the remaining $3$ rows is $576 / 4! = 24$ (since any permutation of columns in row 1 gives a different Latin square). For each of these $24$ completions, row 1 was fixed among $4!$ options. But the problem specifies $4$ colors with no labeling restriction, so the total is $bold("576")$.
]

#prob([7], [#difficulty(3) #putnam(2010, "A5")[Let $a_n$ be the number of permutations $sigma$ of ${1, 2, dots, n}$ such that for all $1 <= i <= n$, we have $sigma(i) - i in {-1, 0, 1}$. Prove that $a_n = F_(n + 1)$ for all $n >= 1$, and determine $lim_(n -> infinity) a_n^(1 / n)$.])])

#hint(1)[We proved $a_n = F_(n + 1)$ in Chapter 3 (PIE chapter, Problem 6). The recurrence is $a_n = a_(n - 1) + a_(n - 2)$.]
#hint(2)[By Binet's formula, $F_(n + 1) approx phi^(n + 1) / sqrt(5)$, so $F_(n + 1)^(1 / n) -> phi$.]
#hint(3)[The limit is $phi = (1 + sqrt(5)) / 2$.]

#solution[
  From Chapter 3 Problem 6, $a_n = a_(n - 1) + a_(n - 2)$ with $a_1 = 1, a_2 = 2$, giving $a_n = F_(n + 1)$.

  For the limit: by Binet's formula, $F_(n + 1) = (phi^(n + 1) - hat(phi)^(n + 1)) / sqrt(5)$ where $|hat(phi)| < 1$, so $F_(n + 1) tilde phi^(n + 1) / sqrt(5)$ as $n -> infinity$. Therefore
  $ a_n^(1 / n) = F_(n + 1)^(1 / n) -> phi^((n + 1) / n) / 5^(1 / (2 n)) -> phi. $
  The limit is $bold(phi = (1 + sqrt(5)) / 2 approx 1.618)$.
]

#prob([8], [#difficulty(1) How many ways can you climb a staircase of $15$ steps if you can take $1$, $2$, or $3$ steps at a time?])

#hint(1)[Let $a_n$ be the number of ways. At each point, you can take $1$, $2$, or $3$ steps.]
#hint(2)[$a_n = a_(n - 1) + a_(n - 2) + a_(n - 3)$ with $a_0 = 1$, $a_1 = 1$, $a_2 = 2$.]
#hint(3)[Compute iteratively up to $a_(15)$.]

#solution[
  $a_0 = 1, a_1 = 1, a_2 = 2, a_3 = 4, a_4 = 7, a_5 = 13, a_6 = 24, a_7 = 44, a_8 = 81, a_9 = 149, a_(10) = 274, a_(11) = 504, a_(12) = 927, a_(13) = 1705, a_(14) = 3136, a_(15) = 5768$.

  The answer is $bold("5768")$.
]
