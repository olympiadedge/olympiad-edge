// Chapter 4: Inclusion-Exclusion

= Inclusion-Exclusion

== Core Definitions

#definition[
  *Inclusion-Exclusion Principle (PIE).* For finite sets $A_1, A_2, dots, A_n$,
  $ |A_1 union A_2 union dots union A_n| = sum_(i) |A_i| - sum_(i < j) |A_i sect A_j| + sum_(i < j < k) |A_i sect A_j sect A_k| - dots + (-1)^(n+1) |A_1 sect dots sect A_n|. $
  Equivalently, $ |overline(A_1) sect overline(A_2) sect dots sect overline(A_n)| = |U| - sum |A_i| + sum |A_i sect A_j| - dots $
  where $U$ is the universe and $overline(A_i) = U without A_i$.
]

#definition[
  *Derangement.* A permutation $sigma$ of ${1, 2, dots, n}$ with no fixed points: $sigma(i) eq.not i$ for all $i$. The number of derangements is denoted $D_n$.
]

#definition[
  *Euler's Totient Function.* $phi(n) = |{k : 1 <= k <= n, gcd(k, n) = 1}|$, the count of integers up to $n$ that are coprime to $n$.
]

#tldr[
  PIE counts elements in a union by adding single sets, subtracting pairs, adding triples, etc. Use the complementary form when counting elements satisfying *none* of several conditions (derangements, totient, surjections). The signs alternate.
]

== Key Applications

=== Derangements

#theorem[
  The number of derangements of $n$ elements is
  $ D_n = n! sum_(k=0)^(n) frac((-1)^k, k!) = n! (1 - 1 + frac(1, 2!) - frac(1, 3!) + dots + frac((-1)^n, n!)). $
  For large $n$, $D_n approx n! \/ e$.
]

#tldr[
  $D_n = n! sum_(k=0)^n (-1)^k \/ k! approx n! \/ e$ (round to nearest integer). Derived from PIE with $A_i$ = permutations fixing $i$.
]

#proof[
  Let $A_i$ be the set of permutations of ${1, dots, n}$ that fix $i$. Then $|A_i| = (n-1)!$, $|A_i sect A_j| = (n-2)!$, and in general $|A_(i_1) sect dots sect A_(i_k)| = (n-k)!$.

  There are $binom(n, k)$ ways to choose $k$ sets, so the sum over $k$-fold intersections is $binom(n, k)(n-k)! = n! \/ k!$.

  By PIE (complementary form), $D_n = |overline(A_1) sect dots sect overline(A_n)| = sum_(k=0)^(n) (-1)^k binom(n, k)(n - k)! = n! sum_(k=0)^(n) frac((-1)^k, k!).$ $square$
]

#trickbox[
  Whenever a problem says "no element maps to itself" or "no item is in its original position," the answer involves derangements. Also recognize disguised derangements: "no letter in correct envelope," "no student gets own exam."
]

=== Euler Totient via PIE

#theorem[
  If $n = p_1^(a_1) p_2^(a_2) dots p_r^(a_r)$, then
  $ phi(n) = n product_(p | n) (1 - 1\/p) = n (1 - 1\/p_1)(1 - 1\/p_2) dots (1 - 1\/p_r). $
]

#tldr[
  $phi(n) = n product_(p | n)(1 - 1\/p)$. Derived by PIE: let $A_i = {k <= n : p_i | k}$, then $|A_i| = n\/p_i$, and $phi(n) = n - sum n\/p_i + sum n\/(p_i p_j) - dots = n product(1 - 1\/p_i)$.
]

=== Surjections and Stirling Numbers

#theorem[
  The number of surjections from an $n$-element set onto a $k$-element set is
  $ S(n, k) dot k! = sum_(j=0)^(k) (-1)^j binom(k, j)(k - j)^n $
  where $S(n, k)$ is the Stirling number of the second kind (number of ways to partition $n$ elements into $k$ non-empty subsets).
]

#tldr[
  Surjections from $n$ to $k$: use PIE on $k^n$ total functions minus those missing at least one element of the codomain. Divide by $k!$ to get Stirling numbers $S(n, k)$.
]

#trapbox[
  The formula for surjections has alternating signs and can produce large intermediate values. For computation, be careful with signs. Also, $S(n, k)$ counts *unordered* partitions into $k$ blocks, while surjections count *ordered* ones, hence the factor of $k!$.
]

== Problems

#drill-header("Inclusion-Exclusion")

=== Problem 1
#difficulty(1)
#prob(1)[
  Find the number of permutations of ${1, 2, 3, 4, 5}$ that fix no element.
]

#hint(1)[
  This is exactly $D_5$, the number of derangements of 5 elements.
]

#hint(2)[
  Apply the formula $D_n = n! sum_(k=0)^n (-1)^k \/ k!$ with $n = 5$.
]

#hint(3)[
  $D_5 = 5!(1 - 1 + 1\/2 - 1\/6 + 1\/24 - 1\/120) = 120(1\/2 - 1\/6 + 1\/24 - 1\/120) = 120 dot 11\/30 = 44$.
]

#solution[
  $D_5 = 5! (1 - 1 + frac(1, 2!) - frac(1, 3!) + frac(1, 4!) - frac(1, 5!))$

  $= 120(frac(1, 2) - frac(1, 6) + frac(1, 24) - frac(1, 120))$

  $= 120 dot frac(60 - 20 + 5 - 1, 120) = 120 dot frac(44, 120) = bold(44).$ $square$
]

=== Problem 2
#difficulty(1)
#prob(2)[
  How many integers in ${1, 2, dots, 1000}$ are divisible by none of 2, 3, or 5?
]

#hint(1)[
  Use the complementary form of PIE. Let $A_2$, $A_3$, $A_5$ be the sets of multiples of $2$, $3$, $5$ respectively.
]

#hint(2)[
  $|A_2| = 500$, $|A_3| = 333$, $|A_5| = 200$, $|A_2 sect A_3| = |A_6| = 166$, $|A_2 sect A_5| = |A_(10)| = 100$, $|A_3 sect A_5| = |A_(15)| = 66$, $|A_2 sect A_3 sect A_5| = |A_(30)| = 33$.
]

#hint(3)[
  By PIE: answer $= 1000 - 500 - 333 - 200 + 166 + 100 + 66 - 33 = 266$.
]

#solution[
  Let $A_p = {k in {1, dots, 1000} : p | k}$. We want $|overline(A_2) sect overline(A_3) sect overline(A_5)|$.

  By PIE:
  $ |overline(A_2) sect overline(A_3) sect overline(A_5)| = 1000 - |A_2| - |A_3| - |A_5| + |A_2 sect A_3| + |A_2 sect A_5| + |A_3 sect A_5| - |A_2 sect A_3 sect A_5|. $

  Computing: $|A_p| = floor(1000\/p)$. Since $2, 3, 5$ are pairwise coprime, $|A_p sect A_q| = floor(1000\/(p q))$.

  $= 1000 - 500 - 333 - 200 + 166 + 100 + 66 - 33 = bold(266).$ $square$

  Note: $1000(1 - 1\/2)(1 - 1\/3)(1 - 1\/5) = 1000 dot 4\/15 approx 266.67$, confirming with floor corrections.
]

=== Problem 3
#difficulty(2)
#prob(3)[
  How many surjections are there from a 5-element set onto a 3-element set?
]

#hint(1)[
  Use the surjection formula with $n = 5$, $k = 3$.
]

#hint(2)[
  Surjections $= sum_(j=0)^(3) (-1)^j binom(3, j)(3 - j)^5$. Compute each term.
]

#hint(3)[
  $= binom(3, 0) dot 3^5 - binom(3, 1) dot 2^5 + binom(3, 2) dot 1^5 - binom(3, 3) dot 0^5 = 243 - 96 + 3 - 0 = 150$.
]

#solution[
  The number of surjections from ${1, 2, 3, 4, 5}$ onto ${a, b, c}$ is:
  $ sum_(j=0)^(3) (-1)^j binom(3, j)(3 - j)^5 = 1 dot 243 - 3 dot 32 + 3 dot 1 - 1 dot 0 = 243 - 96 + 3 = bold(150). $

  Check: $S(5,3) = 150\/6 = 25$, confirming the Stirling number. $square$
]

=== Problem 4
#difficulty(2)
#prob(4)[
  Count the number of surjections from ${1, 2, dots, 6}$ onto ${a, b, c, d}$. Express your answer as an explicit integer.
]

#hint(1)[
  Use the surjection formula with inclusion-exclusion. Let $A_i$ be the set of functions from ${1, dots, 6}$ to ${a, b, c, d}$ whose image misses the $i$th element.
]

#hint(2)[
  Surjections $= sum_(j=0)^(4) (-1)^j binom(4, j)(4 - j)^6$. Compute each term: $binom(4,0) dot 4^6 - binom(4,1) dot 3^6 + binom(4,2) dot 2^6 - binom(4,3) dot 1^6 + binom(4,4) dot 0^6$.
]

#hint(3)[
  $= 4096 - 4 dot 729 + 6 dot 64 - 4 dot 1 + 0 = 4096 - 2916 + 384 - 4 = 1560$.
]

#solution[
  The number of surjections from an $n$-element set onto a $k$-element set is $sum_(j=0)^(k) (-1)^j binom(k, j)(k - j)^n$.

  With $n = 6$, $k = 4$:
  $ sum_(j=0)^(4) (-1)^j binom(4, j)(4 - j)^6 = 1 dot 4096 - 4 dot 729 + 6 dot 64 - 4 dot 1 + 1 dot 0. $

  $= 4096 - 2916 + 384 - 4 = bold(1560).$ $square$

  As a check, the Stirling number $S(6, 4) = 1560 \/ 4! = 65$. $square$
]

=== Problem 5
#difficulty(2)
#prob(5)[
  Compute $phi(2520)$, where $phi$ is Euler's totient function. Express your answer using the prime factorization of 2520 and the PIE-based product formula.
]

#hint(1)[
  First find the prime factorization: $2520 = 2^3 dot 3^2 dot 5 dot 7$.
]

#hint(2)[
  Apply $phi(n) = n product_(p | n)(1 - 1\/p)$. The prime divisors are $2, 3, 5, 7$.
]

#hint(3)[
  $phi(2520) = 2520 dot (1 - 1\/2)(1 - 1\/3)(1 - 1\/5)(1 - 1\/7) = 2520 dot 1\/2 dot 2\/3 dot 4\/5 dot 6\/7$.
]

#solution[
  We have $2520 = 2^3 dot 3^2 dot 5 dot 7$. By the PIE-derived product formula:
  $ phi(2520) = 2520 (1 - 1\/2)(1 - 1\/3)(1 - 1\/5)(1 - 1\/7) $
  $ = 2520 dot frac(1, 2) dot frac(2, 3) dot frac(4, 5) dot frac(6, 7) = 2520 dot frac(48, 210) = 2520 dot frac(8, 35) = bold(576). $ $square$
]

=== Problem 6
#difficulty(3)
#prob(6)[
  At a circular table, $n$ married couples are to be seated such that men and women alternate, and no husband sits next to his wife. Find the number of such seatings (up to rotation) in terms of $n$, using inclusion-exclusion.
]

#hint(1)[
  Fix the women's positions (accounting for rotational symmetry). Then count the number of ways to seat the men in the remaining $n$ chairs such that no man sits next to his wife.
]

#hint(2)[
  After fixing women in alternating seats (one way, up to rotation), each man has two neighbors who are women. Man $i$ must not sit next to woman $i$. This is a restricted permutation problem. Let $A_i$ be the set of permutations of men where man $i$ sits adjacent to woman $i$.
]

#hint(3)[
  The problem reduces to a variant of the _probleme des menages_. The answer is the menage number $M_n$, which satisfies $M_n = n! sum_(k=0)^(n) (-1)^k frac(2 n, 2 n - k) binom(2 n - k, k) (n - k)! \/ n!$. For small $n$: $M_3 = 1$, $M_4 = 2$, $M_5 = 13$.
]

#solution[
  Fix the $n$ women in alternating seats around the table (one arrangement up to rotation). The $n$ remaining seats are for the men. Man $i$ must not sit in either of the two seats adjacent to woman $i$.

  This is the classical _probleme des menages_. Let $A_i$ be the set of permutations where man $i$ sits adjacent to woman $i$. By inclusion-exclusion on the forbidden adjacencies, the menage number is:
  $ M_n = n! sum_(k=0)^(n) (-1)^k frac(2 n, 2 n - k) binom(2 n - k, k) frac((n - k)!, n!). $

  Equivalently, $M_n = sum_(k=0)^(n) (-1)^k frac(2 n, 2 n - k) binom(2 n - k, k) (n - k)!$.

  The key insight is that the $k$-fold intersection $|A_(i_1) sect dots sect A_(i_k)|$ depends on the cyclic structure of the chosen indices. There are $frac(2 n, 2 n - k) binom(2 n - k, k)$ ways to choose $k$ non-adjacent positions on the cycle of $2 n$ seats, and $(n - k)!$ ways to assign the remaining men.

  For verification: $M_3 = 1$, $M_4 = 2$, $M_5 = 13$. $square$
]
