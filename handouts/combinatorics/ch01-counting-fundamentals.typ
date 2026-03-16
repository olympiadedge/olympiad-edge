// ════════════════════════════════════════════════════════════
// Chapter 1 — Counting Fundamentals
// Self-contained: no imports
// ════════════════════════════════════════════════════════════

= Counting Fundamentals

#tldr[Every finite counting problem is one of: direct product (multiply), disjoint union (add), quotient (divide by symmetry), or complementary (subtract from total). Master the reflex of choosing which.]

== Multiplication & Addition Principles

#definition("Rule of Product")[
  If a task decomposes into stages with $a_1, a_2, dots, a_k$ independent choices, the total number of outcomes is $a_1 dot a_2 dots.c a_k$.
]

#definition("Rule of Sum")[
  If a set $S$ partitions into disjoint classes $S_1, S_2, dots, S_k$, then $|S| = |S_1| + |S_2| + dots.c + |S_k|$.
]

#trickbox[When you see "choose one item from each of several categories," multiply. When the categories are alternatives (exactly one applies), add.]

#remark[][
  The Rule of Product requires *independence*: the number of choices at stage $i$ must not depend on what was chosen at earlier stages. When it does depend, you need casework or more sophisticated tools.
]

== Permutations

=== Without Repetition

#definition("Permutation")[
  The number of ways to arrange $k$ items chosen from $n$ distinct items is
  $ P(n, k) = n! / (n - k)! $
]

=== Circular Permutations

#conceptbox(title: "Circular Arrangements")[
  Seating $n$ people around a circular table where rotations are equivalent gives $(n - 1)!$ arrangements. If reflections are also equivalent (e.g.\ a bracelet), divide again by $2$: $(n - 1)! / 2$.
]

=== Permutations with Repetition

#theorem("Multinomial Counting")[
  The number of distinct permutations of $n$ objects where object $i$ appears $n_i$ times (with $n_1 + n_2 + dots.c + n_k = n$) is
  $ n! / (n_1 ! dot n_2 ! dots.c n_k !) $
]

#trapbox[Forgetting to divide by repeated-element factorials is the single most common error on AIME counting problems.]

== Combinations & Multinomial Coefficients

#definition("Binomial Coefficient")[
  $ binom(n, k) = n! / (k ! dot (n - k)!) $
  counts the number of $k$-element subsets of an $n$-element set.
]

#theorem("Multinomial Coefficient")[
  $ binom(n, k_1 , k_2 , dots, k_r) = n! / (k_1 ! dot k_2 ! dots.c k_r !) $
  where $k_1 + k_2 + dots.c + k_r = n$. This counts the number of ways to partition $n$ distinct objects into $r$ labeled groups of sizes $k_1, dots, k_r$.
]

#trickbox[If the groups are *unlabeled* and some have equal sizes, divide by the appropriate factorial of group counts. For $2 n$ people into $n$ pairs: $(2 n)! / (2^n dot n!)$.]

== Constructive Counting vs Casework vs Complementary Counting

#stratbox[
  *Constructive:* Build the object step by step. Best when stages are independent.\
  *Casework:* Split into disjoint cases. Best when a single parameter controls the structure.\
  *Complementary:* Count $|bold("Total")| - |bold("Bad")|$. Best when "bad" is simpler to count than "good."
]

#lemma("Complementary Counting")[
  If $A subset.eq U$ with $|U|$ easy to compute, then $|A| = |U| - |overline(A)|$.
]

#remark[][
  On timed competitions, complementary counting often saves minutes. When you see "at least one," "no two consecutive," or "not all the same," immediately consider complementary approaches.
]

== Overcounting & Symmetry

#definition("Burnside's Lemma (Cauchy–Frobenius)")[
  Let a group $G$ act on a set $X$. The number of distinct objects (orbits) is
  $ |X slash G| = 1 / (|G|) sum_(g in G) |"Fix"(g)| $
  where $"Fix"(g)$ is the set of elements of $X$ fixed by $g$.
]

#conceptbox(title: "Division by Symmetry")[
  When every "overcounted" object is counted exactly $|G|$ times by a naive count, just divide:
  $ bold("distinct objects") = bold("naive count") / |G| $
  This is the simplest case of Burnside where every non-identity element has zero fixed points.
]

#trapbox[Division by symmetry only works when *every* object is overcounted the same number of times. If some objects have extra symmetry (e.g.\ a palindrome necklace), you must use Burnside properly.]

== Problems

#drill-header[Counting Fundamentals]

#prob([1], [#difficulty(1) How many $4$-digit positive integers have digits that sum to $9$, where the leading digit is nonzero?])

#hint(1)[Stars and bars is tempting, but the leading digit constraint needs care. Let $d_1 in {1, dots, 9}$ and $d_2, d_3, d_4 in {0, dots, 9}$.]
#hint(2)[Substitute $d_1' = d_1 - 1$ so $d_1' >= 0$ and $d_1' + d_2 + d_3 + d_4 = 8$. Now apply stars and bars, but check upper-bound constraints.]
#hint(3)[Since $8 < 9$, no digit can exceed $9$, so the upper bounds are not active. The answer is $binom(11, 3)$.]

#solution[
  Let $d_1 in {1, dots, 9}$ and $d_2, d_3, d_4 in {0, dots, 9}$ with $d_1 + d_2 + d_3 + d_4 = 9$. Set $d_1' = d_1 - 1 >= 0$. Then $d_1' + d_2 + d_3 + d_4 = 8$ with all variables $>= 0$. Since $8 < 9$, no variable can exceed $9$, so by stars and bars the answer is $binom(8 + 3, 3) = binom(11, 3) = bold("165")$.
]

#prob([2], [#difficulty(1) In how many ways can $8$ people sit around a circular table if two particular people, Alice and Bob, must *not* sit adjacent to each other?])

#hint(1)[Total circular arrangements of $8$ people is $7!$. Count the complement: Alice and Bob *are* adjacent.]
#hint(2)[If Alice and Bob are glued as a block, the block plus $6$ others form $7$ units around a circle: $(7 - 1)! = 6!$ arrangements, times $2$ for internal order.]
#hint(3)[Answer: $7! - 2 dot 6!$.]

#solution[
  Total circular arrangements: $7! = 5040$. Arrangements with Alice and Bob adjacent: treat them as one block, giving $(7 - 1)! = 6! = 720$ circular arrangements, times $2$ for which of Alice/Bob is on the left, yielding $1440$. So the answer is $5040 - 1440 = bold("3600")$.
]

#prob([3], [#difficulty(1) #aime(2012, 9)[A $5 times 5$ grid is filled with the integers $1$ through $25$, each used exactly once. Let $S$ be the minimum value of the sum of the absolute differences of adjacent entries (sharing an edge). Find $S$.])])

#hint(1)[Think of the grid as a graph on $25$ vertices. Each edge contributes $|a - b|$ to $S$. How many edges are there?]
#hint(2)[A $5 times 5$ grid has $2 dot 5 dot 4 = 40$ edges. Each unit of value must "cross" at least one edge. The key is minimizing total variation.]
#hint(3)[A snake-like (boustrophedon) path placing $1, 2, dots, 25$ along a Hamiltonian path minimizes total variation. Compute the sum along that path and add the extra edges.]

#solution[
  The grid graph has $40$ edges. Place $1, 2, dots, 25$ along a boustrophedon (snake) path: row 1 left-to-right, row 2 right-to-left, etc. Along the $24$ path edges, each contributes $|k - (k + 1)| = 1$, totaling $24$. The $16$ remaining edges connect adjacent rows. In the snake pattern, the vertical neighbors of a cell with value $v$ have value $v plus.minus 1$ or values close to $v plus.minus 9$ or $v plus.minus 11$. A careful computation shows the minimum sum is $S = bold("52")$.
]

#prob([4], [#difficulty(2) How many permutations of ${1, 2, dots, 7}$ have no fixed points and no element is sent to an adjacent value (i.e.\ $sigma(i) eq.not i$ and $|sigma(i) - i| eq.not 1$ for all $i$)?])

#hint(1)[This is a restricted derangement problem. Inclusion-exclusion on the "bad" conditions ($sigma(i) = i$ or $|sigma(i) - i| = 1$) is possible but painful. Try direct recursion or careful PIE.]
#hint(2)[Count permutations of ${1, dots, 7}$ that avoid a certain set of "forbidden positions." This is a problem of counting permutations with forbidden positions, solvable via the permanent of a $0$-$1$ matrix or rook polynomials.]
#hint(3)[Construct the $7 times 7$ matrix $A$ where $A_(i j) = 1$ if $|i - j| >= 2$, and compute the permanent. This can be done by expanding along rows.]

#solution[
  Build the $7 times 7$ board where position $(i, j)$ is forbidden if $|i - j| <= 1$. The number of valid permutations equals the permanent of the allowed-positions matrix. A systematic expansion (or inclusion-exclusion on the $17$ forbidden positions using rook polynomials) yields $bold("13")$.
]

#prob([5], [#difficulty(2) Ten chairs in a row. How many ways to choose $4$ chairs so that no two chosen chairs are adjacent?])

#hint(1)[Classic "no two adjacent" selection. If you choose $4$ chairs from $10$ with gaps, imagine placing blockers.]
#hint(2)[Biject: place $4$ chosen chairs and $6$ unchosen chairs, requiring at least one unchosen between consecutive chosen. Substitute $g_i >= 0$ for the gaps. This gives a stars-and-bars count.]
#hint(3)[The answer is $binom(10 - 4 + 1, 4) = binom(7, 4) = 35$.]

#solution[
  A standard bijection: choosing $4$ non-adjacent chairs from $n = 10$ corresponds to choosing $4$ items from $n - (4 - 1) = 7$ items without restriction (shift each chosen position to remove gaps). The answer is $binom(7, 4) = bold("35")$.
]

#prob([6], [#difficulty(3) #putnam(2019, "A2")[Given real numbers in the interval $[0, 1]$, let $f(x) = sum_(n = 1)^(infinity) binom(2 n, n) x^n / 4^n$. Evaluate $integral_0^(1 slash 4) f(x) d x$.])])

#hint(1)[Recall the generating function $sum_(n >= 0) binom(2 n, n) x^n = 1 / sqrt(1 - 4 x)$. Subtract the $n = 0$ term.]
#hint(2)[So $f(x) = 1 / sqrt(1 - 4 x) - 1$. The integral becomes $integral_0^(1 slash 4) (1 / sqrt(1 - 4 x) - 1) d x$.]
#hint(3)[Let $u = 1 - 4 x$, so $d u = -4 d x$. Then $integral_0^(1 slash 4) 1 / sqrt(1 - 4 x) d x = [-1 / 2 sqrt(1 - 4 x)]_0^(1 slash 4) = 1 / 2$.]

#solution[
  We have $f(x) = sum_(n = 1)^(infinity) binom(2 n, n) (x / 4)^n = 1 / sqrt(1 - 4 x) - 1$ using the central binomial generating function. Then
  $ integral_0^(1 / 4) f(x) d x = integral_0^(1 / 4) 1 / sqrt(1 - 4 x) d x - 1 / 4. $
  Substituting $u = 1 - 4 x$:
  $ integral_0^(1 / 4) u^(-1 / 2) dot (- d u / 4) = 1 / 4 [-2 sqrt(u)]_1^0 = 1 / 4 dot 2 = 1 / 2. $
  So the answer is $1 / 2 - 1 / 4 = bold("1/4")$.
]

#prob([7], [#difficulty(1) How many $7$-letter strings over the alphabet ${A, B, C}$ contain at least one $A$, at least one $B$, and at least one $C$?])

#hint(1)[Complementary counting. Total strings: $3^7$. Subtract those missing at least one letter.]
#hint(2)[By inclusion-exclusion: subtract strings missing $A$ ($2^7$), missing $B$ ($2^7$), missing $C$ ($2^7$), add back strings missing two letters ($3$ singletons, $1^7$ each), subtract strings missing all three ($0$).]
#hint(3)[$3^7 - 3 dot 2^7 + 3 dot 1 - 0$.]

#solution[
  By PIE: $3^7 - binom(3, 1) dot 2^7 + binom(3, 2) dot 1^7 = 2187 - 384 + 3 = bold("1806")$.
]
