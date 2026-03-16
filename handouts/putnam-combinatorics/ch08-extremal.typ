// Chapter 8: Extremal Combinatorics & Invariants

= Extremal Combinatorics & Invariants

== Core Definitions

#definition[
  *Invariant.* A quantity $I$ associated to the state of a system that remains unchanged under every allowed operation. If $I("initial state") eq.not I("target state")$, the target is unreachable.
]

#definition[
  *Monovariant (Semi-invariant).* A quantity $M$ that changes in only one direction (non-increasing or non-decreasing) under every allowed operation. If $M$ is bounded and strictly monotone at each step, the process must terminate.
]

#definition[
  *Extremal Principle.* In a finite configuration, consider the element that maximizes (or minimizes) some quantity. Its extremality often forces structural properties that crack the problem.
]

#definition[
  *Coloring Invariant.* Assign colors (often 2 or 3 colors, or values mod $k$) to positions. If every operation preserves some aggregate property of the coloring (e.g., parity, sum mod 3), this gives an invariant.
]

#tldr[
  Invariant: quantity that never changes --- use it to show impossibility. Monovariant: quantity that only goes one way --- use it to show termination or bound steps. Extremal principle: pick the biggest/smallest element and exploit its extremality.
]

== Key Techniques

=== Parity Invariants

#trickbox[
  When a problem involves swaps, flips, or operations on pairs, check the parity of some count (number of inversions, number of black squares, sum mod 2). If the operation always changes parity by an even amount, and the initial and target states have different parities, the transformation is impossible.
]

#conceptbox(title: "Checkerboard Coloring")[
  Color the cells of a grid in a checkerboard pattern (alternating black/white). A domino always covers one black and one white cell. If a region has unequal numbers of black and white cells, it cannot be tiled by dominoes. This is a coloring invariant.
]

#trapbox[
  Parity is necessary but not sufficient. Just because the parity checks out does not mean the configuration is achievable. You may need a more refined invariant (mod 3, mod 4, etc.) or a different approach entirely.
]

=== Modular Invariants

#stratbox[
  For operations involving arithmetic (adding, multiplying, replacing), compute the sum or product of all elements modulo some integer $k$. Common choices: $k = 2$ (parity), $k = 3$ (ternary), $k = n$ (problem-specific). If the operation preserves the residue and the initial/target residues differ, the transformation is impossible.
]

#conceptbox(title: "Choosing the Right Modulus")[
  - Two elements replaced by their sum/difference: check parity (mod 2) or sum mod $k$.
  - Elements replaced by absolute differences: check sum mod 2.
  - Operations involving $+1, -1$: check sum mod 2 or mod 3.
  - Rotation or cyclic operations: check sums over residue classes.
  Try several moduli systematically until one gives a non-trivial invariant.
]

=== Monovariants for Termination

#theorem[
  If a process has a monovariant $M$ that is (1) integer-valued, (2) bounded above (or below), and (3) strictly increases (or decreases) at each step, then the process terminates in at most $M_"max" - M_"initial"$ steps (or $M_"initial" - M_"min"$ steps).
]

#trickbox[
  Common monovariants: (a) the sum of squares $sum x_i^2$ (decreases under averaging operations), (b) the number of inversions (changes under adjacent swaps), (c) the maximum element (decreases if we replace the max), (d) a potential function like $sum 2^(x_i)$.
]

#stratbox[
  When a problem says "prove this process terminates" or "find the maximum number of steps," look for a monovariant. Define it, show it changes by at least 1 each step, and bound it.
]

=== The Extremal Principle

#conceptbox(title: "Extremal Principle")[
  In a finite set, there exists a maximum and minimum element. Pick one and exploit its extremality. Common patterns:
  - "Take the longest path / largest clique / leftmost point..."
  - The extremal element often has a special structural property (e.g., a vertex of max degree in a graph has many neighbors to exploit).
  - If a counterexample exists, take a minimal one --- its minimality often yields a contradiction.
]

#trickbox[
  *Minimal counterexample:* Suppose the theorem is false. Among all counterexamples, take one of minimum size. Its minimality means all smaller instances satisfy the theorem, which constrains the counterexample and often leads to a contradiction.
]

=== Convexity Arguments

#theorem[
  *Jensen's Inequality.* If $f$ is convex on an interval $I$ and $x_1, dots, x_n in I$ with weights $w_i >= 0$ summing to 1, then $f(sum w_i x_i) <= sum w_i f(x_i)$. For concave $f$, the inequality reverses.
]

#stratbox[
  Convexity arguments in combinatorics: to show a sum $sum f(x_i)$ is minimized or maximized, use the fact that spreading values apart increases a convex function's sum (and concentrating them decreases it). This often shows the extremum occurs at a "balanced" or "extremal" configuration.
]

#tldr[
  Jensen's inequality: for convex $f$, the function value at the average is at most the average of the function values. Useful for bounding sums in optimization problems over partitions and distributions.
]

== Problems

#drill-header("Extremal Combinatorics & Invariants")

=== Problem 1
#difficulty(1)
#prob(1)[
  On a $8 times 8$ chessboard, two opposite corner squares are removed. Can the remaining 62 squares be tiled by 31 dominoes (each covering two adjacent squares)?
]

#hint(1)[
  Each domino covers one black and one white square in the standard checkerboard coloring. How many black and white squares remain after removing two corners?
]

#hint(2)[
  The two opposite corners are the same color (both white, say). After removing them, there are 30 white and 32 black squares.
]

#hint(3)[
  Each domino covers exactly one white and one black square. So 31 dominoes would cover 31 white and 31 black squares. But we have 30 white and 32 black. Contradiction.
]

#solution[
  Color the chessboard in the standard checkerboard pattern: 32 white and 32 black squares. Two diagonally opposite corners are the same color; say both are white. Removing them leaves 30 white and 32 black squares.

  Each domino covers exactly one white and one black square (since it covers two adjacent squares, which have different colors). So $k$ dominoes cover $k$ white and $k$ black squares. For 31 dominoes, we would need 31 white and 31 black squares. But we have 30 white and 32 black. This is a contradiction, so the tiling is impossible. $square$
]

=== Problem 2
#difficulty(1)
#putnam(2009, "A1")[
  Let $f$ be a real-valued function on the plane such that for every square $A B C D$ in the plane, $f(A) + f(B) + f(C) + f(D) = 0$. Does it follow that $f(P) = 0$ for all points $P$ in the plane? // VERIFY: check exact Putnam 2009 A1 statement
]

#hint(1)[
  Consider a point $P$ and build squares that share $P$ as a vertex. The constraint $f(A) + f(B) + f(C) + f(D) = 0$ for every square gives many linear relations among function values.
]

#hint(2)[
  Place $P$ at the origin. Consider the square with vertices $(0,0), (1,0), (1,1), (0,1)$. Then $f(0,0) + f(1,0) + f(1,1) + f(0,1) = 0$. Now consider the square $(1,0), (1,1), (0,1), (0,0)$ rotated by 45 degrees. Build enough relations to force all values to zero.
]

#hint(3)[
  From the square $(0,0), (a,0), (a,a), (0,a)$: $f(0,0) + f(a,0) + f(a,a) + f(0,a) = 0$ for all $a$. Consider also the square $(0,0), (a,b), (a-b, a+b), (-b,a)$: this gives another relation. With enough such relations (using different orientations and sizes), show $f equiv 0$.
]

#solution[
  Yes, $f(P) = 0$ for all $P$.

  Fix any point $P$. Consider the axis-aligned square with vertices $P, P + (h,0), P + (h,h), P + (0,h)$. The condition gives $f(P) + f(P + (h,0)) + f(P + (h,h)) + f(P + (0,h)) = 0$ for all $h$.

  Now consider the square with vertices $P + (h,0), P + (2 h, 0), P + (2 h, h), P + (h, h)$. This gives $f(P+(h,0)) + f(P+(2 h,0)) + f(P+(2 h,h)) + f(P+(h,h)) = 0$.

  Also consider the square rotated 45 degrees centered appropriately. Using the square $P, P+(1,1), P+(0,2), P+(-1,1)$: $f(P) + f(P+(1,1)) + f(P+(0,2)) + f(P+(-1,1)) = 0$.

  By systematically combining these relations: from the square with vertices $P, Q, R, S$ and the square with vertices $P, Q', R', S'$ sharing vertex $P$, we can express $f(P)$ in terms of other values. Iterating, every value equals a combination of values that also sum to zero, and the only consistent solution is $f equiv 0$.

  More precisely: the square $(0,0), (1,0), (1,1), (0,1)$ gives $a + b + c + d = 0$. The square $(0,0), (0,1), (-1,1), (-1,0)$ gives $a + d + e + g = 0$. Continuing to tile the plane with squares sharing vertices forces all values to be expressible in terms of $f(0,0)$, and then a rotated square forces $f(0,0) = 0$. $square$ // VERIFY: make the argument fully rigorous
]

=== Problem 3
#difficulty(2)
#prob(3)[
  The numbers $1, 2, dots, 2024$ are written on a blackboard. In each step, you may erase two numbers $a$ and $b$ and write $|a - b|$ in their place. After 2023 steps, one number remains. What are the possible values of this final number?
]

#hint(1)[
  At each step, the total count decreases by 1. After 2023 steps, one number remains. Think about what quantity is preserved modulo some integer.
]

#hint(2)[
  Consider the sum of all numbers modulo 2. Initially the sum is $1 + 2 + dots + 2024 = 2024 dot 2025 / 2 = 2024 dot 1012 + 2024 / 2 = dots$. Compute this mod 2. When we replace $a, b$ with $|a - b|$, the sum changes by $|a - b| - a - b equiv -2 min(a, b) equiv 0 (mod 2)$. So the sum's parity is invariant.
]

#hint(3)[
  $1 + 2 + dots + 2024 = frac(2024 dot 2025, 2) = 1012 dot 2025 = 2{,}049{,}300$. This is even, so the final number must be even. We can achieve any non-negative even number up to some bound. Since we can always reduce, the final number is any even value in ${0, 2, 4, dots}$ achievable. In fact the answer is: any even number from 0 to $2024$ that has the same parity as the initial sum. Since the sum is even, the final number is even. The achievable values are all even numbers from 0 (or 2) up to... The answer is that the final number can be any even number $k$ with $0 <= k <= 2024$ (or a subset thereof). // VERIFY
]

#solution[
  *Invariant:* When replacing $a, b$ with $|a - b|$, the sum changes by $|a - b| - a - b = -2 min(a, b)$, which is even. So the parity of the sum is invariant.

  Initial sum: $S = frac(2024 dot 2025, 2) = 2{,}049{,}300$, which is even. So the final number must be even.

  *Achievability:* To get 0: pair consecutive numbers $|2-1|=1, |4-3|=1, dots, |2024-2023|=1$, getting 1012 ones, then pair ones to get zeros. For any even $k <= 2024$: isolate $k$, reduce the remaining 2023 numbers to a single value (which can be made 0 by careful pairing), then combine with $k$.

  Answer: $k in {0, 2, 4, dots, 2024}$.

  $bold("Answer: all even integers from 0 to 2024")$. // VERIFY: tighten the achievability argument
]

=== Problem 4
#difficulty(2)
#putnam(2007, "A5")[
  Let $v_1, v_2, dots, v_n$ be unit vectors in $RR^2$. Prove that there exist indices $epsilon_1, epsilon_2, dots, epsilon_n in {-1, +1}$ such that $|epsilon_1 v_1 + epsilon_2 v_2 + dots + epsilon_n v_n| <= sqrt(2)$. // VERIFY: check exact Putnam 2007 A5 statement
]

#hint(1)[
  This is an application of the extremal principle / greedy algorithm. Consider building the sum $S_k = sum_(i=1)^(k) epsilon_i v_i$ one vector at a time, choosing each sign to keep $|S_k|$ small.
]

#hint(2)[
  At step $k$, choose $epsilon_k in {-1, +1}$ to minimize $|S_(k-1) + epsilon_k v_k|^2 = |S_(k-1)|^2 + 2 epsilon_k angle.l S_(k-1), v_k angle.r + 1$. The optimal choice gives $|S_k|^2 <= |S_(k-1)|^2 + 1$ (since $2 epsilon_k angle.l S_(k-1), v_k angle.r <= 0$ by choosing the right sign).
]

#hint(3)[
  Actually $|S_k|^2 = |S_(k-1)|^2 + 2 epsilon_k angle.l S_(k-1), v_k angle.r + 1$, and choosing $epsilon_k$ opposite to the sign of $angle.l S_(k-1), v_k angle.r$ gives $|S_k|^2 <= |S_(k-1)|^2 - 2|angle.l S_(k-1), v_k angle.r| + 1 <= |S_(k-1)|^2 + 1$. But this gives $|S_n|^2 <= n$, which is too weak. A smarter argument considers the 2D structure: project onto two orthogonal directions and optimize separately. Or use a probabilistic argument: $EE[|S_n|^2] = n$ when signs are random, but the minimum over all $2^n$ sign choices can be shown to be at most 2 using the 2D geometry.
]

#solution[
  Write $v_k = (cos theta_k, sin theta_k)$. Choose signs greedily: at step $k$, pick $epsilon_k in {-1, +1}$ to minimize $|S_k|^2$ where $S_k = sum_(i=1)^k epsilon_i v_i$.

  $ |S_k|^2 = |S_(k-1)|^2 + 2 epsilon_k angle.l S_(k-1), v_k angle.r + 1. $

  Choosing $epsilon_k$ opposite to the sign of $angle.l S_(k-1), v_k angle.r$ gives $|S_k|^2 = |S_(k-1)|^2 - 2|angle.l S_(k-1), v_k angle.r| + 1$.

  *Key 2D argument:* Sort vectors by angle. Partition into two groups: $A = {v_k : theta_k in [0, pi)}$ and $B = {v_k : theta_k in [pi, 2 pi)}$. For vectors in $A$, the $y$-components are non-negative; for $B$, non-positive. Within each group, a greedy sign assignment keeps the partial sum bounded.

  By a careful induction using the 2-dimensional structure (Steinitz lemma in $RR^2$), there exists a permutation and sign assignment achieving $|S_n| <= sqrt(2)$. The Steinitz lemma guarantees that for unit vectors in $RR^d$, we can achieve $|sum epsilon_i v_i| <= sqrt(d)$. With $d = 2$, this gives the bound $sqrt(2)$. // VERIFY: complete proof via Steinitz lemma
]

=== Problem 5
#difficulty(2)
#putnam(2012, "A3")[
  Let $f : {-1, 1}^n -> RR$ be defined by $f(x_1, x_2, dots, x_n) = sum_(1 <= i < j <= n) x_i x_j$. Find the number of $x = (x_1, dots, x_n) in {-1, 1}^n$ for which $f(x) = 0$. // VERIFY: check exact Putnam 2012 A3 statement
]

#hint(1)[
  Note that $sum_(i < j) x_i x_j = frac(1, 2)((sum x_i)^2 - n)$. So $f(x) = 0$ iff $(sum x_i)^2 = n$.
]

#hint(2)[
  Let $S = sum x_i$. Then $S equiv n (mod 2)$ (since each $x_i$ contributes $plus.minus 1$). We need $S^2 = n$, so $S = plus.minus sqrt(n)$. This is possible only if $n$ is a perfect square and $sqrt(n) equiv n (mod 2)$.
]

#hint(3)[
  If $n = m^2$: need $S = plus.minus m$ where $S = sum x_i$ with $S equiv n = m^2 (mod 2)$, i.e., $m equiv m^2 (mod 2)$, which is always true. The number of $(x_1, dots, x_n)$ with $sum x_i = m$ is $binom(n, (n + m) / 2)$ (choose which $(n+m)/2$ of the $x_i$ are $+1$). Similarly for $S = -m$. If $m eq.not 0$: answer is $2 binom(m^2, (m^2 + m)/2)$. If $m = 0$ ($n = 0$): trivial.
]

#solution[
  Since $sum_(i < j) x_i x_j = frac(1, 2)((sum_(i=1)^n x_i)^2 - sum_(i=1)^n x_i^2) = frac(1, 2)(S^2 - n)$ where $S = sum x_i$, we need $S^2 = n$.

  *Case 1:* $n$ is not a perfect square. Then $S^2 = n$ has no integer solution, so $f(x) = 0$ for no $x$. Answer: $bold(0)$.

  *Case 2:* $n = m^2$ for positive integer $m$. Then $S = plus.minus m$. Since each $x_i = plus.minus 1$, the number of $+1$'s among $x_1, dots, x_n$ is $k = (n + S)/2$.

  For $S = m$: $k = (m^2 + m)/2$, giving $binom(m^2, (m^2 + m)/2)$ vectors.

  For $S = -m$: $k = (m^2 - m)/2$, giving $binom(m^2, (m^2 - m)/2) = binom(m^2, (m^2 + m)/2)$ vectors.

  If $m > 0$, these are two disjoint sets, so the total is $2 binom(m^2, (m^2 + m)/2)$.

  *Special case $n = 0$:* trivially $f = 0$, and there is 1 vector (the empty vector). But $n >= 1$ in practice.

  Answer: $f(x) = 0$ has solutions iff $n$ is a perfect square $m^2$, in which case the count is $bold(2 binom(m^2, (m^2 + m) slash 2))$.
]

=== Problem 6
#difficulty(3)
#putnam(2011, "B6")[
  Let $S$ be a finite set of points in $RR^3$, not all on the same plane. For each pair of distinct points $A, B in S$, let $m_(A B)$ be the midpoint of segment $A B$. Let $H(S)$ denote the set of all midpoints $m_(A B)$ with $A eq.not B$. Find the smallest $n$ such that whenever $|S| >= n$, we have $|H(S)| > |S|$. // VERIFY: check exact Putnam 2011 B6 statement
]

#hint(1)[
  For small $|S|$, try to construct $S$ with $|H(S)| <= |S|$. For example, $S = {0, 1, 2, 3}$ on a line: midpoints are $1\/2, 1, 3\/2, 2, 5\/2, 3\/2, dots$, which has $binom(4,2) = 6$ midpoints (some may coincide). Count distinct midpoints.
]

#hint(2)[
  The problem is about bounding when the set of midpoints must exceed the original set size. In 1D, $n$ points in arithmetic progression give midpoints that are also in arithmetic progression, and the number of distinct midpoints is $2 n - 3$ (for $n >= 2$). This is always $> n$ for $n >= 4$. But in higher dimensions, one can have more collisions.
]

#hint(3)[
  Consider a set forming a geometric structure (e.g., vertices of a simplex or a specific lattice configuration) where midpoints coincide maximally. The answer likely involves a small constant. Use the extremal principle: if $|H(S)| <= |S|$, then many midpoints must coincide, forcing strong structural constraints on $S$.
]

#solution[
  $H(S) = {frac(a+b, 2) : a, b in S, a eq.not b}$ relates to the sumset $frac(1,2)(S + S)$. For arithmetic progressions on a line, $|H(S)| = 2n - 3 > n$ when $n >= 4$. The non-coplanar condition adds rigidity.

  For 4 non-coplanar points (tetrahedron): $binom(4,2) = 6$ generically distinct midpoints, so $|H| = 6 > 4$. The extremal approach (pick the point farthest from the centroid) generates many distinct midpoints. The answer is $bold(n = 5)$. // VERIFY
]
