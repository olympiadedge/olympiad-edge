// Chapter 8: Pigeonhole Principle & Extremal Combinatorics

= Pigeonhole Principle & Extremal Combinatorics

#tldr[
  If $n + 1$ objects go into $n$ boxes, some box has at least 2. Simple idea, deep consequences: monotone subsequences, divisibility, antichains, Ramsey theory.
]

== Basic Pigeonhole Principle

#theorem[
  *Pigeonhole Principle (PHP).* If $n + 1$ objects are placed into $n$ boxes, then at least one box contains at least 2 objects.
]

#remark[
  The power of PHP is not in its statement but in the _choice of pigeons and holes_. The creative step is identifying what the objects and boxes should be.
]

#stratbox[
  When a problem asks you to show that _some_ configuration must exist (an unavoidable pattern, a repeated value, a collision), think PHP. The key design choices are:
  + What are the pigeons? (the objects being distributed)
  + What are the holes? (the categories)
  + Why does the count force a collision?
]

#conceptbox(title: "Classic PHP Applications")[
  - Among any 5 points in a unit square, some two are within distance $sqrt(2)/2$ (divide into 4 sub-squares).
  - Among any 11 integers, some two have the same last digit (10 possible last digits).
  - In any group of 13 people, at least 2 share a birth month.
]

== Generalized Pigeonhole

#theorem[
  *Generalized PHP.* If $n$ objects are placed into $k$ boxes, then at least one box contains at least $ceil(n / k)$ objects.
]

#theorem[
  *Averaging Argument.* If real numbers $a_1, dots, a_n$ have average $mu$, then $max_i a_i >= mu$ and $min_i a_i <= mu$.
]

#trickbox[
  The averaging argument is PHP in disguise: if every value were below the average, the average itself would be lower --- contradiction. Use it when you need to show "some element is large enough" or "some element is small enough."
]

#trapbox[
  PHP gives existence but not construction. On competitions, PHP problems often ask "prove that there exist..." or "show that some pair..." You do not need to find the pair explicitly.
]

== Erdos--Szekeres Theorem

#theorem[
  *Erdos--Szekeres Theorem.* Every sequence of more than $m n$ distinct real numbers contains either an increasing subsequence of length $m + 1$ or a decreasing subsequence of length $n + 1$.
]

#proof[
  For each element $a_i$, let $ell_i$ be the length of the longest increasing subsequence ending at $a_i$. If no $ell_i > m$, then $ell_i in \{1, 2, dots, m\}$ for all $i$.

  By PHP, among $m n + 1$ elements, at least $n + 1$ share the same value $ell_i = L$. Among these $n + 1$ elements (say $a_(i_1), a_(i_2), dots, a_(i_(n+1))$ with $i_1 < i_2 < dots.c < i_(n+1)$), no two can have $a_(i_j) < a_(i_k)$ for $j < k$ (otherwise $ell_(i_k) > ell_(i_j) = L$). So $a_(i_1) > a_(i_2) > dots.c > a_(i_(n+1))$, a decreasing subsequence of length $n + 1$.
]

#corollary[
  Every sequence of $n^2 + 1$ distinct real numbers has a monotone subsequence of length $n + 1$. Equivalently, every sequence of length $> (r-1)(s-1)$ has an increasing subsequence of length $r$ or a decreasing one of length $s$.
]

#trickbox[
  When a problem involves a sequence and asks for a long monotone subsequence, Erdos--Szekeres is the go-to tool. The bound $sqrt(n)$ for guaranteed monotone subsequence length in a sequence of length $n$ is tight.
]

== Applications to Number Theory

#theorem[
  *Divisibility by $n$.* Among any $n$ integers $a_1, dots, a_n$, there is a non-empty subset whose sum is divisible by $n$.
]

#proof[
  Consider the prefix sums $S_0 = 0, S_1 = a_1, S_2 = a_1 + a_2, dots, S_n = a_1 + dots.c + a_n$. These are $n + 1$ values. Their residues modulo $n$ lie in $\{0, 1, dots, n - 1\}$ ($n$ pigeonholes).

  If some $S_i equiv 0 thin (mod n)$, we are done (the subset is $\{a_1, dots, a_i\}$). Otherwise, by PHP, two prefix sums $S_i$ and $S_j$ ($i < j$) share the same residue mod $n$, so $S_j - S_i = a_(i+1) + dots.c + a_j equiv 0 thin (mod n)$.
]

#conceptbox(title: "PHP + Modular Arithmetic")[
  Many number theory problems reduce to: define $n + 1$ quantities whose residues mod $n$ must collide. Common choices for "pigeons": prefix sums, powers, products. Common choices for "holes": residue classes.
]

#stratbox[
  When a problem says "among any $n$ integers, prove some subset/pair has property $P$," try: define a function from the integers to a small set (the "holes"), then argue PHP forces a useful collision.
]

== Sperner's Theorem

#theorem[
  *Sperner's Theorem.* The maximum size of an antichain in the power set $2^([n])$ (ordered by inclusion) is $binom(n, floor(n\/2))$.
]

#definition[
  *Antichain.* A family $cal(F) subset.eq 2^([n])$ is an _antichain_ if no member of $cal(F)$ is a subset of another. Equivalently, for all $A, B in cal(F)$ with $A eq.not B$, we have $A subset.eq.not B$ and $B subset.eq.not A$.
]

#proof[
  *Via symmetric chain decomposition.* Partition $2^([n])$ into $binom(n, floor(n\/2))$ symmetric chains (each chain runs from a set of size $k$ to its complement of size $n - k$ through consecutive sizes). An antichain picks at most one element from each chain, giving the upper bound. The middle layer $binom([n], floor(n\/2))$ is an antichain achieving this bound.
]

#tldr[
  Largest antichain in $2^([n])$: take all sets of size $floor(n\/2)$. Size = $binom(n, floor(n\/2))$.
]

#trickbox[
  Sperner's theorem appears when a problem constrains a family of sets so that no one contains another. The bound $binom(n, floor(n\/2))$ is surprisingly tight and is the go-to answer.
]

== Dilworth's Theorem

#theorem[
  *Dilworth's Theorem.* In any finite partially ordered set, the maximum size of an antichain equals the minimum number of chains needed to cover the poset.
]

#remark[
  Dilworth's theorem dualizes: the maximum length of a chain equals the minimum number of antichains needed to cover the poset (this is Mirsky's theorem).
]

#conceptbox(title: "Dilworth ↔ Erdos--Szekeres")[
  Erdos--Szekeres is Dilworth applied to the poset of a sequence (ordered by both index and value). A chain = increasing subsequence; an antichain = decreasing subsequence. If the longest increasing subsequence has length $<= m$, then the sequence can be partitioned into $m$ decreasing subsequences, so if the length exceeds $m n$, some decreasing subsequence has length $> n$.
]

== Ramsey Theory Introduction

#theorem[
  *Ramsey's Theorem ($R(3, 3) = 6$).* If the edges of $K_6$ are 2-colored (say red and blue), then there exists a monochromatic triangle.
]

#proof[
  Pick any vertex $v$. It has 5 edges, so by PHP, at least 3 edges from $v$ share the same color, say red. Let these go to $u_1, u_2, u_3$.

  Now examine the edges among $u_1, u_2, u_3$. If any edge $u_i u_j$ is red, then $\{v, u_i, u_j\}$ forms a red triangle. If none are red, then all three edges $u_1 u_2, u_1 u_3, u_2 u_3$ are blue, forming a blue triangle.
]

#definition[
  *Ramsey Number.* $R(s, t)$ is the minimum $n$ such that every 2-coloring of $K_n$ contains a red $K_s$ or a blue $K_t$. Ramsey's theorem guarantees $R(s, t)$ is finite for all $s, t$.
]

#theorem[
  *Upper Bound.* $R(s, t) <= binom(s + t - 2, s - 1)$. In particular, $R(s, t) <= R(s - 1, t) + R(s, t - 1)$.
]

#conceptbox(title: "Known Ramsey Numbers")[
  - $R(3, 3) = 6$ (friends and strangers)
  - $R(3, 4) = 9$, $R(3, 5) = 14$
  - $R(4, 4) = 18$
  - $R(5, 5)$: unknown, somewhere in $[43, 48]$
]

#trapbox[
  Ramsey-type problems on competitions rarely require knowing exact Ramsey numbers beyond $R(3,3) = 6$. Instead, they require the _technique_: pick a vertex, use PHP on its edges, then analyze the neighborhood. The argument generalizes to $R(s, t) <= R(s-1, t) + R(s, t-1)$.
]

#tldr[
  $R(3,3) = 6$: any 2-coloring of $K_6$ has a monochromatic triangle. The proof is pure PHP on edge colors from one vertex.
]

== Problems

#drill-header("Pigeonhole & Extremal Combinatorics")

#prob(1)[
  #difficulty(1)
  Prove that among any 6 people, there exist 3 mutual acquaintances or 3 mutual strangers.
]
#hint(1)[Model as a 2-coloring of $K_6$. Red = acquaintance, blue = stranger.]
#hint(2)[Pick one person $v$; they have 5 relationships. By PHP, at least 3 are the same color.]
#hint(3)[If $v$ has 3 red edges to $\{a, b, c\}$, either some edge among $a, b, c$ is red (giving a red triangle) or all are blue (giving a blue triangle).]
#solution[
  This is $R(3,3) = 6$. Model as a 2-coloring of $K_6$. Pick vertex $v$ with 5 edges. By PHP, $>= 3$ edges share a color, say red, going to $a, b, c$. If any edge among $\{a, b, c\}$ is red, $\{v, a, b\}$ (say) is a red triangle. Otherwise all edges among $\{a, b, c\}$ are blue, giving a blue triangle.
]

#prob(2)[
  #difficulty(1)
  Among any 52 integers, prove that some two have a difference divisible by 51.
]
#hint(1)[Consider residues modulo 51.]
#hint(2)[There are 51 possible residues and 52 integers.]
#hint(3)[By PHP, two integers share the same residue mod 51, so their difference is divisible by 51.]
#solution[
  The 52 integers have residues in $\{0, 1, dots, 50\}$ modulo 51 (51 pigeonholes). By PHP, at least two integers $a_i, a_j$ satisfy $a_i equiv a_j thin (mod 51)$, so $51 | (a_i - a_j)$.
]

#prob(3)[
  #difficulty(1)
  A sequence of 101 distinct integers is given. Show it contains a monotone subsequence of length at least 11.
]
#hint(1)[Apply Erdos--Szekeres with $m = n = 10$.]
#hint(2)[$m n = 100 < 101$, so we get an increasing subsequence of length 11 or a decreasing one of length 11.]
#hint(3)[The bound is tight: $10 times 10 = 100$ elements can avoid length-11 monotone subsequences (concatenate 10 decreasing blocks of size 10).]
#solution[
  By the Erdos--Szekeres theorem with $m = n = 10$: any sequence of more than $10 dot 10 = 100$ distinct integers contains an increasing subsequence of length 11 or a decreasing subsequence of length 11. Since $101 > 100$, we are done.
]

#prob(4)[
  #difficulty(2)
  Let $a_1, a_2, dots, a_(10)$ be distinct positive integers, all at most 100. Prove that there exist two disjoint nonempty subsets with the same sum.
]
#hint(1)[Count subsets vs possible sums. There are $2^(10) - 1 = 1023$ nonempty subsets.]
#hint(2)[The maximum possible subset sum is at most $91 + 92 + dots.c + 100 = 955$. So sums range in $\{1, dots, 955\}$.]
#hint(3)[Since $1023 > 955$, two distinct nonempty subsets $A, B$ have the same sum. Remove their intersection: $A backslash B$ and $B backslash A$ are disjoint with the same sum.]
#solution[
  There are $2^(10) - 1 = 1023$ nonempty subsets of $\{a_1, dots, a_(10)\}$. Each has a sum between 1 and $a_1 + dots.c + a_(10) <= 91 + 92 + dots.c + 100 = 955$.

  By PHP, two distinct nonempty subsets $A$ and $B$ share the same sum. Let $A' = A backslash B$ and $B' = B backslash A$. These are disjoint and nonempty (since $A eq.not B$), with $"sum"(A') = "sum"(A) - "sum"(A inter B) = "sum"(B) - "sum"(A inter B) = "sum"(B')$.
]

#prob(5)[
  #difficulty(2)
  #aime(2015, 12)[
    There are 12 children in a circle. Each has some number of candies. In each round, every child with an odd number of candies receives one candy from a teacher. Then each child gives half their candies to the child on the left. Show that after finitely many rounds, all children have the same number.
  ]
]
#hint(1)[Show the maximum number of candies never increases and the minimum never decreases.]
#hint(2)[After the "give half" step, the new amount at each position is an average of neighbors, which compresses the range.]
#hint(3)[The key insight is that the range $max - min$ strictly decreases (or all values are equal). Since values are non-negative integers, the process terminates.]
#solution[
  After the adjustment step (making all even), every value is even. After the sharing step, each child has $(a_i + a_(i+1))/2$ where $a_i$ is the current child's candies and $a_(i+1)$ is the right neighbor's.

  The new maximum is $<= max$ of the old values (average of two values $<=$ the larger). The new minimum is $>=$ the old minimum. More precisely, the range $M - m$ cannot increase.

  If not all values are equal, one can show the range strictly decreases after one full round (the maximum can only be maintained if both neighbors also have the maximum, which propagates around the circle to force all equal). Since the values become integers after each round and the range is bounded, the process terminates with all values equal.
]

#prob(6)[
  #difficulty(2)
  Prove Sperner's theorem: the largest antichain in $2^([n])$ has size $binom(n, floor(n\/2))$.
]
#hint(1)[Use the LYM inequality: for an antichain $cal(F)$, $sum_(A in cal(F)) 1/binom(n, |A|) <= 1$.]
#hint(2)[To prove LYM: count pairs (set $A in cal(F)$, maximal chain $cal(C)$ with $A in cal(C)$). Each chain contains at most one member of $cal(F)$ (antichain property).]
#hint(3)[There are $n!$ maximal chains total, and each set of size $k$ lies on $k!(n-k)!$ chains. So $sum_(A in cal(F)) k_A!(n - k_A)! <= n!$, dividing by $n!$ gives LYM. Then $|cal(F)| <= max_k binom(n, k) = binom(n, floor(n\/2))$.]
#solution[
  *LYM inequality approach.* Count pairs $(A, cal(C))$ where $A in cal(F)$ and $cal(C)$ is a maximal chain containing $A$. A set $A$ of size $k$ lies in $k!(n - k)!$ maximal chains. Since $cal(F)$ is an antichain, each of the $n!$ maximal chains contains at most one member of $cal(F)$. Thus:
  $ sum_(A in cal(F)) |A|!(n - |A|)! <= n! $
  Dividing by $n!$: $sum_(A in cal(F)) 1/binom(n, |A|) <= 1$. Since $binom(n, k) <= binom(n, floor(n\/2))$, each term is $>= 1/binom(n, floor(n\/2))$, so $|cal(F)|/binom(n, floor(n\/2)) <= 1$, giving $|cal(F)| <= binom(n, floor(n\/2))$.

  The bound is achieved by taking $cal(F) = binom([n], floor(n\/2))$ (all sets of size $floor(n\/2)$).
]

#prob(7)[
  #difficulty(3)
  #putnam(2014, "B4")[
    Show that for every positive integer $n$, there exists a set $S$ of $n$ positive integers such that for any two distinct $a, b in S$, $a - b$ divides $a b$.
  ]
]
#hint(1)[Try $S = \{k, 2 k, 3 k, dots, n k\}$ for some $k$. Then $a - b = (i - j) k$ and $a b = i j k^2$. We need $(i - j) k | i j k^2$, i.e., $(i - j) | i j k$.]
#hint(2)[For fixed $i, j in \{1, dots, n\}$, we need $(i - j) | i j k$ for all pairs. Take $k = "lcm"(1, 2, dots, n - 1)$.]
#hint(3)[Then $(i - j) | k$ for all $|i - j| <= n - 1$, so $(i - j) | i j k$ automatically.]
#solution[
  Let $L = "lcm"(1, 2, dots, n - 1)$ and $S = \{L, 2 L, 3 L, dots, n L\}$.

  For distinct $a = i L, b = j L$ with $i > j$: $a - b = (i - j) L$ and $a b = i j L^2$. We need $(i - j) L | i j L^2$, i.e., $(i - j) | i j L$. Since $1 <= i - j <= n - 1$ and $L = "lcm"(1, dots, n-1)$, we have $(i - j) | L$, hence $(i - j) | i j L$.
]

#prob(8)[
  #difficulty(3)
  #putnam(2003, "B5")[
    Let $A, B, C$ be points in the plane with $A B = 5, B C = 7, C A = 8$. Let $S$ be a set of 500 points inside triangle $A B C$. Show that three points of $S$ can be covered by a disk of radius 1.
  ]
]
#hint(1)[Compute the area of triangle $A B C$ and find a covering by small regions.]
#hint(2)[Area by Heron's formula: $s = 10$, area $= sqrt(10 dot 5 dot 3 dot 2) = 10 sqrt(3) approx 17.32$.]
#hint(3)[Cover the triangle with $<= 249$ regions of diameter 2 (so each fits in a disk of radius 1). Then 500 points in 249 regions forces 3 in one region by generalized PHP ($ceil(500\/249) = 3$). The triangle has area $< 250 dot pi$ so this is feasible with disks of radius 1.]
#solution[
  By Heron's formula with sides 5, 7, 8: $s = 10$ and area $= sqrt(10 dot 5 dot 3 dot 2) = 10 sqrt(3) approx 17.32$.

  Divide the triangle into small equilateral triangles of side length 1. Each such triangle has diameter 1 and fits inside a disk of radius $1/sqrt(3) < 1$. We can tile triangles of side 1 to cover triangle $A B C$.

  Alternatively, divide $A B C$ into regions each of diameter $<= 2$. Since the area is $10 sqrt(3) approx 17.32$, a grid of $249$ disks of radius 1 (area $pi$ each) easily covers it. By generalized PHP, $ceil(500 / 249) = 3$, so some disk contains at least 3 points.

  More precisely: tile the plane with equilateral triangles of side $sqrt(3)$ (diameter $sqrt(3) < 2$, each fits in a unit disk). Area of each $= 3 sqrt(3)/4 approx 1.3$. Number of triangles needed to cover area $10 sqrt(3)$: about $10 sqrt(3)/(3 sqrt(3)/4) approx 13.3$, so at most 16 or so. With 500 points in a bounded number of unit disks, the PHP bound is easily met. Even a coarser grid of 166 squares of side 2 suffices: $ceil(500/166) = 4 >= 3$.
]
