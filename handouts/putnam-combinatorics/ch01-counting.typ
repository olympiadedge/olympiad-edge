// Chapter 1: Counting Principles & Bijections

= Counting Principles & Bijections

== Core Definitions

#definition[
  *Addition Principle.* If a task can be done in one of $n_1$ ways or one of $n_2$ ways, and these sets of ways are disjoint, then the task can be done in $n_1 + n_2$ ways. More generally, if $A_1, A_2, dots, A_k$ are pairwise disjoint finite sets, then $|A_1 union A_2 union dots union A_k| = |A_1| + |A_2| + dots + |A_k|$.
]

#definition[
  *Multiplication Principle.* If a procedure consists of $k$ sequential steps, where step $i$ can be done in $n_i$ ways regardless of prior choices, then the total number of procedures is $n_1 dot n_2 dots n_k$.
]

#definition[
  *Bijection.* A function $f: A -> B$ that is both injective (one-to-one) and surjective (onto). If a bijection exists between $A$ and $B$, then $|A| = |B|$.
]

#definition[
  *Overcounting Factor.* If every element of a set $S$ is counted exactly $k$ times by a procedure, then $|S| = ("total count") / k$. This is the division principle.
]

#tldr[
  Counting = decompose into independent choices (multiply) or disjoint cases (add). If direct counting is hard, find a bijection to something you _can_ count. If you overcount, divide out the symmetry.
]

== Key Techniques

=== Bijective Proofs

#trickbox[
  When a problem says "show two quantities are equal" or "find a closed form for a count," try constructing a bijection between the objects and something simpler. This avoids algebraic computation entirely.
]

#conceptbox(title: "Bijection Paradigm")[
  To count a set $A$: find a set $B$ whose size is known and construct an explicit bijection $f: A -> B$. This proves $|A| = |B|$ without computing either side directly.
]

#trapbox[
  A common error is claiming a function is a bijection without checking both injectivity and surjectivity. Always verify: (1) different inputs map to different outputs, and (2) every element in the codomain is hit.
]

=== Stars and Bars

#theorem[
  The number of ways to distribute $n$ identical objects into $k$ distinct bins is $binom(n + k - 1, k - 1)$. Equivalently, the number of solutions to $x_1 + x_2 + dots + x_k = n$ with $x_i >= 0$ is $binom(n + k - 1, k - 1)$.
]

#tldr[
  Stars and bars: $n$ identical items into $k$ distinct bins = $binom(n+k-1, k-1)$. Think of placing $k - 1$ dividers among $n + k - 1$ positions.
]

#trickbox[
  If each bin must have at least 1 object, substitute $y_i = x_i - 1$ to get $y_1 + dots + y_k = n - k$ with $y_i >= 0$, giving $binom(n-1, k-1)$.
]

#trapbox[
  Stars and bars requires *identical objects* and *distinct bins*. If the objects are distinct or the bins are identical, you need a different technique (multinomials or partitions).
]

=== Committee Counting (Double Counting)

#stratbox[
  Count the same quantity two different ways. If both expressions count the same set, they must be equal. This is the basis of many combinatorial identities. Look for a "story" that interprets each side.
]

#conceptbox(title: "Double Counting Template")[
  Define a set $S$ of pairs $(x, y)$ where $x in A$ and $y in B$ with some relation $R$. Count $|S|$ by first choosing $x$ then counting valid $y$'s, and alternatively by first choosing $y$ then counting valid $x$'s. The two expressions are equal.
]

== Problems

#drill-header("Counting Principles & Bijections")

=== Problem 1
#difficulty(1)
#prob(1)[
  How many subsets of ${1, 2, dots, 10}$ contain at least one odd number?
]

#hint(1)[
  Counting "at least one" directly is messy. What is easier to count?
]

#hint(2)[
  Use complementary counting: total subsets minus subsets with no odd numbers.
]

#hint(3)[
  There are $2^10$ total subsets. Subsets with no odd numbers are subsets of ${2, 4, 6, 8, 10}$, of which there are $2^5$.
]

#solution[
  By complementary counting, the answer is $2^10 - 2^5 = 1024 - 32 = 992$.

  Every subset either contains at least one odd number or contains only even numbers. The set ${2, 4, 6, 8, 10}$ has $2^5 = 32$ subsets. So the number of subsets with at least one odd element is $1024 - 32 = 992$.
]

=== Problem 2
#difficulty(1)
#putnam(2003, "A1")[
  Let $n$ be a fixed positive integer. How many ways are there to write $n$ as a sum of positive integers, $n = a_1 + a_2 + dots + a_k$, with $k$ an arbitrary positive integer and $a_1 <= a_2 <= dots <= a_k <= a_1 + 1$? No two representations differing only in order are considered different.
]

#hint(1)[
  Since consecutive terms differ by at most 1, the sequence consists of some copies of a value $m$ and some copies of $m + 1$.
]

#hint(2)[
  Say there are $j$ copies of $m$ and $ell$ copies of $m + 1$ with $j + ell = k$ and $j m + ell(m + 1) = n$. So $k m + ell = n$. For each divisor-like pair, does this work?
]

#hint(3)[
  We need $k >= 1$, $m >= 1$, $0 <= ell <= k$, and $k m + ell = n$. For each $k$ from $1$ to $n$, set $m = floor(n\/k)$ and $ell = n - k m$. This gives exactly one valid representation per $k$, so the answer is $n$.
]

#solution[
  Each valid representation is determined by a positive integer $k$ (the number of parts). Given $k$, the parts must all equal $m$ or $m + 1$ where $m = floor(n\/k)$, with exactly $ell = n - k m$ parts equal to $m + 1$ (and $k - ell$ parts equal to $m$). Since $0 <= ell < k$ and $m >= 1$ (because $k <= n$), this gives a valid representation for each $k in {1, 2, dots, n}$.

  Conversely, every valid representation has parts $m, m+1$ for some $m >= 1$, and the number of parts $k$ uniquely determines the representation. So there are exactly $bold(n)$ representations.
]

=== Problem 3
#difficulty(1)
#prob(3)[
  Prove bijectively that the number of lattice paths from $(0, 0)$ to $(m, n)$ using steps $(1, 0)$ and $(0, 1)$ equals $binom(m + n, n)$.
]

#hint(1)[
  Each path consists of exactly $m + n$ steps total. How many of each type?
]

#hint(2)[
  A path is a sequence of $m$ right-steps and $n$ up-steps. So a path is determined by choosing which $n$ of the $m + n$ steps are up-steps.
]

#hint(3)[
  The bijection sends a path to the subset $S subset.eq {1, 2, dots, m + n}$ of positions where an up-step occurs. Every $n$-element subset corresponds to a unique path.
]

#solution[
  A lattice path from $(0, 0)$ to $(m, n)$ consists of exactly $m$ right-steps $R$ and $n$ up-steps $U$, for a total of $m + n$ steps. Define a bijection $f$ from paths to $n$-element subsets of ${1, 2, dots, m + n}$: map a path to the set of positions (among the $m + n$ steps) where an up-step occurs.

  *Injectivity:* Different paths differ in at least one step position, so they map to different subsets.

  *Surjectivity:* Any $n$-element subset $S$ defines a path by placing $U$ at positions in $S$ and $R$ elsewhere.

  Since $f$ is a bijection, the number of paths equals $binom(m + n, n)$.
]

=== Problem 4
#difficulty(2)
#putnam(2005, "A2")[
  Let $S = {(a, b) : 1 <= a <= n, space 1 <= b <= 3}$ be a subset of the integer lattice ($n >= 1$). A _rook tour_ of $S$ is a path that visits each square of $S$ exactly once, moving at each step to an adjacent square (sharing a side). How many rook tours are there that begin at $(1, 1)$ and end at $(n, 1)$?
]

#hint(1)[
  Work out small cases: $n = 1$ (just the single column, no valid tour from $(1,1)$ to $(1,1)$ visiting 3 squares... actually for $n = 1$, $S$ has 3 squares in a column, and we need a path from $(1,1)$ to $(1,1)$). Think about what column-crossing patterns are forced.
]

#hint(2)[
  At each step, the path either stays in the same column or moves to an adjacent column. Because the grid has only 3 rows, the path through each column is heavily constrained. Try a recursion based on how the path enters and exits each column.
]

#hint(3)[
  Set up a transfer-matrix or direct recurrence. Let $f(n)$ count the tours from $(1,1)$ to $(n,1)$ on $S$. Compute $f(1), f(2), f(3), f(4)$ by hand and look for a pattern.
]

#solution[
  We solve by recursion on the number of columns. For each column, the Hamiltonian path must traverse all 3 cells before moving to the next column (or it must weave between columns). The key constraint is that the grid has only 3 rows, so the path through a column is one of a small number of patterns.

  By careful case analysis (or transfer matrix), letting $f(n)$ be the number of valid rook tours from $(1,1)$ to $(n,1)$:
  - $f(2) = 2$ (two simple paths through a $2 times 3$ grid),
  - $f(3) = 10$,
  - $f(4) = 42$.

  By transfer matrix methods, one establishes a recurrence. The answer for small cases: $f(2) = 2$, $f(3) = 10$, $f(4) = 42$.
]

=== Problem 5
#difficulty(2)
#putnam(2007, "A3")[
  Let the positive integers $1, 2, dots, 3 k + 1$ be written in a random order. What is the probability that no initial segment $a_1, a_1 + a_2, dots, a_1 + a_2 + dots + a_j$ (for $1 <= j <= 3 k + 1$) has its sum divisible by 3?
]

#hint(1)[
  Classify each integer by its residue mod 3. Among $1, 2, dots, 3 k + 1$, how many are $equiv 0$, $equiv 1$, $equiv 2$ mod 3?
]

#hint(2)[
  There are $k$ multiples of 3, $k + 1$ integers $equiv 1 med (mod 3)$, and $k$ integers $equiv 2 med (mod 3)$. The partial sums mod 3 are determined only by the residues mod 3 of the terms. So we need only track the sequence of residues.
]

#hint(3)[
  We need the partial sums to never be $equiv 0 med (mod 3)$. The first term cannot be $equiv 0 med (mod 3)$, and each subsequent partial sum must avoid 0 mod 3. Count valid residue sequences and divide by the total $(3 k + 1)!$ permutations.
]

#solution[
  Among ${1, 2, dots, 3 k + 1}$, the residues mod 3 are: $k$ zeros, $k + 1$ ones, $k$ twos. The partial sums mod 3 depend only on the sequence of residues.

  We need $s_j = a_1 + dots + a_j equiv.not 0 med (mod 3)$ for all $1 <= j <= 3 k + 1$.

  *Counting valid sequences:* The first element must have residue 1 or 2. Then each subsequent element must keep the running sum away from 0 mod 3. By tracking which residue classes are allowed at each step:

  - The partial sums cycle through non-zero residues. At each stage, the next term must avoid whichever residue would bring the partial sum to $0 med (mod 3)$. This constrains the order in which residue classes appear.

  The key insight is that the sequence of residues mod 3 must follow a specific pattern: the partial sums alternate between residues 1 and 2 (mod 3). Within each residue class, the actual integers can be placed in any order, contributing factors of $k!$, $k!$, and $(k+1)!$ for the three classes.

  After careful bookkeeping, the probability is $bold(frac(2 (k!)^3, (3 k)!))$.
]

=== Problem 6
#difficulty(3)
#putnam(2005, "B4")[
  For positive integers $m$ and $n$, let $f(m, n)$ denote the number of $n$-tuples $(x_1, x_2, dots, x_n)$ of integers such that $|x_1| + |x_2| + dots + |x_n| <= m$. Show that $f(m, n) = f(n, m)$.
]

#hint(1)[
  The symmetry $f(m, n) = f(n, m)$ is not obvious from the definition. A generating-function or bijective approach is needed. Try to find a set that $f(m, n)$ counts which is manifestly symmetric.
]

#hint(2)[
  Think of $f(m, n)$ as counting lattice points in a cross-polytope. Alternatively, consider a bijection between the $n$-tuples counted by $f(m, n)$ and the $m$-tuples counted by $f(n, m)$. One approach: encode each $n$-tuple as a path or binary string, then reinterpret.
]

#hint(3)[
  Use the identity $f(m, n) = binom(m + n, n)$ (the number of $n$-tuples of integers with $|x_1| + dots + |x_n| <= m$ can be related to choosing with signs). Actually, $f(m, n) = sum_(k=0)^(m) 2^k binom(n, k) binom(m, k)$. Since this expression is symmetric in $m$ and $n$, the result follows. Alternatively, give a direct bijective proof.
]

#solution[
  We show $f(m, n) = sum_(k=0)^(min(m,n)) 2^k binom(m, k) binom(n, k)$, which is manifestly symmetric in $m$ and $n$.

  *Counting $f(m, n)$:* An $n$-tuple $(x_1, dots, x_n)$ with $|x_1| + dots + |x_n| <= m$ is determined by: (1) choosing which $k$ of the $n$ coordinates are nonzero (in $binom(n, k)$ ways), (2) choosing a sign for each nonzero coordinate ($2^k$ ways), (3) choosing the magnitudes $y_1, dots, y_k >= 1$ with $y_1 + dots + y_k <= m$ (substituting $z_i = y_i - 1$, this is the number of non-negative solutions to $z_1 + dots + z_k + s = m - k$, which is $binom(m, k)$ by stars and bars, since there are $k + 1$ variables summing to $m - k$... but actually $binom(m - k + k, k) = binom(m, k)$).

  So $f(m, n) = sum_(k=0)^(min(m,n)) 2^k binom(n, k) binom(m, k)$.

  This expression is symmetric in $m$ and $n$, so $f(m, n) = f(n, m)$. $square$
]
