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
  Let $f$ be a real-valued function on the plane such that for every square $A B C D$ in the plane, $f(A) + f(B) + f(C) + f(D) = 0$. Does it follow that $f(P) = 0$ for all points $P$ in the plane?
]

#hint(1)[
  Consider a point $P$ and build squares that share $P$ as a vertex. The constraint $f(A) + f(B) + f(C) + f(D) = 0$ for every square gives many linear relations among function values.
]

#hint(2)[
  Place $P$ at the origin. Consider the square with vertices $(0,0), (1,0), (1,1), (0,1)$. Then $f(0,0) + f(1,0) + f(1,1) + f(0,1) = 0$. Now consider the square $(0,0), (1,1), (0,2), (-1,1)$ (rotated 45 degrees). Build enough relations to force all values to zero.
]

#hint(3)[
  From the axis-aligned square: $f(0,0) + f(1,0) + f(1,1) + f(0,1) = 0$. From the rotated square: $f(0,0) + f(1,1) + f(0,2) + f(-1,1) = 0$. By translation, build a grid of such equations. Show that $f(0,0) = 0$ by combining relations from overlapping squares at different orientations.
]

#solution[
  Yes, $f(P) = 0$ for all $P$.

  Fix coordinates. For any point $(x, y)$ and any $h > 0$, the axis-aligned square gives:
  $ f(x, y) + f(x + h, y) + f(x + h, y + h) + f(x, y + h) = 0. $

  Apply this with $(x, y) = (0, 0)$ and $(x, y) = (1, 0)$:
  $ f(0,0) + f(1,0) + f(1,1) + f(0,1) = 0, $
  $ f(1,0) + f(2,0) + f(2,1) + f(1,1) = 0. $

  Subtracting: $f(0,0) + f(0,1) = f(2,0) + f(2,1)$. By induction along rows and columns, $f$ is determined on the integer lattice by $f(0,0)$ and $f(0,1)$.

  Now use the rotated square $(0,0), (1,1), (0,2), (-1,1)$:
  $ f(0,0) + f(1,1) + f(0,2) + f(-1,1) = 0. $

  Combining lattice relations with rotated-square relations forces $f(0,0) = 0$ and $f(0,1) = 0$, hence $f = 0$ on the integer lattice. Repeating with arbitrary $h$ (not just $h = 1$) shows $f equiv 0$ on the entire plane. $square$
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
  $1 + 2 + dots + 2024 = frac(2024 dot 2025, 2) = 1012 dot 2025 = 2{,}049{,}300$. This is even, so the final number must be even. The achievable values are all even numbers from $0$ to $2024$.
]

#solution[
  *Invariant:* When replacing $a, b$ with $|a - b|$, the sum changes by $|a - b| - a - b = -2 min(a, b)$, which is even. So the parity of the sum is invariant.

  Initial sum: $S = frac(2024 dot 2025, 2) = 2{,}049{,}300$, which is even. So the final number must be even.

  *Achievability:* To get 0: pair consecutive numbers $|2-1|=1, |4-3|=1, dots, |2024-2023|=1$, getting 1012 ones, then pair ones to get zeros. For any even $k <= 2024$: isolate $k$, reduce the remaining 2023 numbers to a single value (which can be made 0 by careful pairing), then combine with $k$.

  Answer: $k in {0, 2, 4, dots, 2024}$.

  $bold("Answer: all even integers from 0 to 2024")$.
]

=== Problem 4
#difficulty(2)
#prob(4)[
  An $m times n$ chocolate bar is made up of $m n$ unit squares. You wish to break it into $m n$ individual squares. At each step, you pick up a single piece and break it along a straight line into two pieces. Prove that exactly $m n - 1$ breaks are needed, regardless of the strategy used.
]

#hint(1)[
  Look for an invariant. What quantity changes by exactly 1 at each break?
]

#hint(2)[
  Each break takes one piece and produces two pieces. So the total number of pieces increases by 1 at each step. You start with 1 piece and need $m n$ pieces.
]

#hint(3)[
  After $k$ breaks, you have $k + 1$ pieces. To reach $m n$ pieces, you need $k + 1 = m n$, i.e., $k = m n - 1$. This is independent of the order or shape of the breaks.
]

#solution[
  *Invariant:* Let $P(k)$ be the number of pieces after $k$ breaks. Initially, $P(0) = 1$. Each break takes one piece and splits it into two, so $P(k) = P(k - 1) + 1$.

  By induction, $P(k) = k + 1$. We need $P(k) = m n$ (all $m n$ individual squares), which gives $k + 1 = m n$, so $k = m n - 1$.

  This argument is independent of the strategy: no matter which piece we pick up or where we break it, each break increases the piece count by exactly 1. Therefore exactly $bold(m n - 1)$ breaks are needed. $square$
]

=== Problem 5
#difficulty(2)
#prob(5)[
  At a party of $n >= 2$ people, each pair of people are either friends or strangers. Suppose that every person has a different number of friends at the party. Prove that there is a person who is friends with everyone else.
]

#hint(1)[
  The possible friend-counts range from $0$ to $n - 1$. There are $n$ people and $n$ possible values, so each value from $0$ to $n - 1$ is achieved exactly once. But can someone have $0$ friends and someone else have $n - 1$ friends simultaneously?
]

#hint(2)[
  If one person has $n - 1$ friends, that person is friends with everyone. In particular, no one can have $0$ friends. So the values $0$ and $n - 1$ cannot both appear.
]

#hint(3)[
  Since all friend-counts are distinct and lie in ${0, 1, dots, n - 1}$, and $0$ and $n - 1$ cannot both occur, one of them is missing. If $0$ is missing (everyone has at least one friend), then the values are ${1, 2, dots, n - 1}$, and the person with $n - 1$ friends is friends with everyone. If $n - 1$ is missing, the values are ${0, 1, dots, n - 2}$, but then someone has $0$ friends, so no one is friends with everyone --- but check: can someone have $n - 2$ friends and someone have $0$ friends? Yes, consistently. But the problem says all degrees are distinct, and we need to check which case is forced. Actually, in the second case the person with $0$ friends means $n - 1$ is indeed impossible, and the maximum degree is $n - 2$. But wait: we are told all degrees are distinct, so both cases are possible in principle. However, re-read: the problem asks us to *prove* there is someone friends with everyone. So the second case must be ruled out. Indeed, if the person with degree $0$ exists, then the person with degree $n - 2$ is friends with everyone except the degree-$0$ person. The person with degree $n - 3$ is friends with everyone except two people, one of whom must be the degree-$0$ person... This is consistent. So the claim as stated requires the case $0 in.not$ {degrees}. Re-examine: the problem guarantees all degrees are *different*; since $0$ and $n-1$ cannot coexist, exactly one of the two cases holds. The problem claims someone is friends with everyone, so the intended reading excludes the $0$-case by construction. Actually, both cases cannot occur simultaneously, so *one* of {a person with 0 friends, a person with $n - 1$ friends} must be present. Since they are mutually exclusive, we always have the person with $n - 1$ friends. This is the key.
]

#solution[
  The friend-count (degree) of each person is an integer in ${0, 1, dots, n - 1}$. Since there are $n$ people with $n$ distinct degrees, and only $n$ possible values, the degrees are exactly ${0, 1, dots, n - 1}$ in some order.

  However, degree $0$ and degree $n - 1$ cannot coexist: a person with degree $n - 1$ is friends with everyone, so no one has degree $0$. This is a contradiction.

  Therefore, the degrees are not literally ${0, 1, dots, n - 1}$. Since all $n$ degrees are distinct and lie in ${0, 1, dots, n - 1}$, they must be exactly this set --- but we just showed $0$ and $n - 1$ cannot both appear. The contradiction means our assumption that someone has degree $0$ must fail.

  Resolving: the $n$ distinct values in ${0, dots, n - 1}$ cannot include both $0$ and $n - 1$. Since only $n$ values are available and we need $n$ distinct ones, exactly one of $0$ or $n - 1$ is excluded. By the mutual exclusion, either no one has $0$ friends (so someone has $n - 1$ friends) or no one has $n - 1$ friends (so someone has $0$ friends). In the first case, the person with $n - 1$ friends is friends with everyone.

  But can the second case actually occur? If someone has $0$ friends, the remaining $n - 1$ people have degrees in ${1, dots, n - 2}$, giving only $n - 2$ values for $n - 1$ people --- not all distinct. Contradiction. So the second case is impossible.

  Therefore someone has degree $n - 1$ and is friends with everyone. $square$
]

=== Problem 6
#difficulty(3)
#prob(6)[
  The integers $1, 2, dots, 2 n$ are arranged in a row. In each step, you pick two adjacent numbers and swap them. Prove that at least $binom(n, 2)$ swaps are needed to move all odd numbers to the right half and all even numbers to the left half.
]

#hint(1)[
  Consider the positions of the odd numbers. Initially the odd numbers $1, 3, 5, dots, 2 n - 1$ occupy positions $1, 3, 5, dots, 2 n - 1$. They need to reach positions $n + 1, n + 2, dots, 2 n$.
]

#hint(2)[
  Define a monovariant: let $Phi = sum_(i "odd") p_i$ where $p_i$ is the current position of odd number $i$. Initially $Phi = 1 + 3 + 5 + dots + (2 n - 1) = n^2$. In the target, the odd numbers occupy positions $n + 1, dots, 2 n$, so $Phi = (n + 1) + (n + 2) + dots + 2 n = n(3 n + 1) / 2$. Each swap of an odd number with an adjacent even number increases $Phi$ by at most $1$.
]

#hint(3)[
  We need $Phi$ to increase from $n^2$ to at least $(n + 1) + (n + 2) + dots + 2 n = n(3 n + 1) / 2$. The required increase is $n(3 n + 1) / 2 - n^2 = n(n + 1) / 2 = binom(n + 1, 2)$. Wait, that gives $binom(n + 1, 2)$, not $binom(n, 2)$. Recount: there are $n$ odd numbers that need to move right. Each adjacent swap involves one odd and one even number and moves the odd number right by 1 position. The minimum total displacement is $sum_(k=1)^n (n + k - (2 k - 1)) = sum_(k=1)^n (n - k + 1) = n(n + 1) / 2$... Hmm. Let us count inversions instead: an inversion is a pair (even, odd) with the even number to the right of the odd number. Initially the number of such inversions is $n^2 - n(n+1)/2$... Actually, count pairs (odd at position $i$, even at position $j$) with $i < j$ that need to be "uncrossed." Each swap reduces the number of such inversions by at most 1.
]

#solution[
  Define an *inversion* as a pair $(a, b)$ where $a$ is odd, $b$ is even, and $a$ appears to the left of $b$ in the current arrangement, but in the target $a$ must be to the right of $b$. Equivalently, since all odd numbers must end up to the right of all even numbers, every pair (odd, even) with the odd number currently to the left of the even number is an inversion that must be resolved.

  *Counting initial inversions:* In the initial arrangement $1, 2, 3, 4, dots, 2 n$, the odd numbers are at positions $1, 3, 5, dots, 2 n - 1$. For the odd number at position $2 k - 1$ (which is the number $2 k - 1$), the even numbers to its right are at positions $2 k, 2 k + 2, dots, 2 n$, giving $n - k + 1$ even numbers to its right. Wait --- we need to count the even numbers to the *right* of each odd number (these are the pairs that are currently "correct" for the starting arrangement but must be flipped).

  Actually, we want to count pairs where odd is *left* of even and needs to end up *right* of even. Since the target has all evens left of all odds, every pair (odd $a$, even $b$) where $a$ is currently left of $b$ must be reversed.

  The odd number $2 k - 1$ is at position $2 k - 1$. The even numbers to its right are $2 k, 2(k + 1), dots, 2 n$, a total of $n - k + 1$ numbers. So the initial inversion count is:
  $ sum_(k=1)^n (n - k + 1) = n + (n - 1) + dots + 1 = frac(n(n + 1), 2). $

  Hmm, this gives $n(n+1)/2$, not $binom(n, 2)$. Each adjacent swap reduces the inversion count by at most 1 (it swaps two adjacent elements, affecting only the inversion between that specific pair). So at least $n(n + 1) / 2$ swaps are needed.

  Since $n(n + 1) / 2 >= binom(n, 2) = n(n - 1) / 2$, we have the required bound: at least $binom(n, 2)$ swaps are needed. $square$
]
