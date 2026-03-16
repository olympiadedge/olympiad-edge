// Chapter 7: Special Factorizations and Algebraic Manipulations

= Special Factorizations

== Difference of Squares, Cubes, and Higher Powers

The most fundamental factorization identity in all of competition math:

#theorem[
  *Difference of $n$th powers.* For any positive integer $n$:
  $ x^n - y^n = (x - y)(x^(n-1) + x^(n-2) y + x^(n-3) y^2 + dots.c + y^(n-1)) $
]

#tldr[$x^n - y^n$ always factors, with $(x - y)$ pulled out and the other factor being the "staircase" sum.]

The special cases matter most:
- $n = 2$: $x^2 - y^2 = (x - y)(x + y)$
- $n = 3$: $x^3 - y^3 = (x - y)(x^2 + x y + y^2)$

#trickbox[
  When you see a difference of large powers like $7^(20) - 1$, immediately think about what divides it. Since $7^(20) - 1 = (7^(10) - 1)(7^(10) + 1) = (7^5 - 1)(7^5 + 1)(7^(10) + 1) = dots.c$, you can systematically extract factors.
]

#conceptbox(title: "Factoring by Recognizing Hidden Differences")[
  Many competition expressions are differences of powers in disguise. For instance, $4^n - 1 = (2^n)^2 - 1^2$ and $8^n - 27^n = (2^n)^3 - (3^n)^3$. Always look for a common base.
]

== Sum of Cubes and Sum/Difference of $n$th Powers

#theorem[
  *Sum of cubes.* $x^3 + y^3 = (x + y)(x^2 - x y + y^2)$.
]

#theorem[
  *Sum of $n$th powers (odd $n$).* When $n$ is odd:
  $ x^n + y^n = (x + y)(x^(n-1) - x^(n-2) y + x^(n-3) y^2 - dots.c + y^(n-1)) $
  The signs alternate. Note: $x^n + y^n$ does NOT factor over the reals when $n$ is even (except by completing the square in special cases).
]

#tldr[$x^n + y^n$ factors with $(x + y)$ when $n$ is odd. When $n$ is even, it does not factor over $RR$.]

#theorem[
  *Three-variable identity:*
  $ x^3 + y^3 + z^3 - 3 x y z = (x + y + z)(x^2 + y^2 + z^2 - x y - y z - z x) $
]

#tldr[If $x + y + z = 0$, then $x^3 + y^3 + z^3 = 3 x y z$. This appears constantly in competitions.]

#corollary[
  If $a + b + c = 0$, then $a^3 + b^3 + c^3 = 3 a b c$.
]

#trickbox[
  See three cubes in a problem? Check whether the sum (or a related combination) of the bases is zero. If so, the cubic identity immediately simplifies.
]

== Simon's Favorite Factoring Trick (SFFT)

#theorem[
  *SFFT.* The expression $x y + a x + b y$ can be factored by adding and subtracting $a b$:
  $ x y + a x + b y + a b = (x + b)(y + a) $
  Equivalently: $x y + a x + b y = (x + b)(y + a) - a b$.
]

#tldr[Add $a b$ to both sides to make the left side factor. This turns Diophantine equations into divisor problems.]

#stratbox[
  *When to use SFFT.* Whenever you see a Diophantine equation of the form $x y + "stuff" = k$ where the "stuff" is linear in $x$ and $y$, rearrange to apply SFFT. The factored form $(x + b)(y + a) = k + a b$ converts the problem into finding divisor pairs of a fixed integer.
]

#definition[
  *Standard SFFT procedure for $1/m + 1/n = 1/k$:* Multiply through by $m n k$: $n k + m k = m n$, i.e., $m n - m k - n k = 0$. Add $k^2$: $(m - k)(n - k) = k^2$. Now enumerate divisor pairs of $k^2$.
]

#trapbox[
  After applying SFFT, do not forget to translate back. If $(x + 3)(y + 5) = 20$ and you need positive integers $x, y$, then $x + 3 >= 4$ and $y + 5 >= 6$, so the factor pair of $20$ must satisfy these constraints. Missing sign constraints is a common error.
]

== Sophie Germain Identity

#theorem[
  *Sophie Germain Identity:*
  $ a^4 + 4 b^4 = (a^2 + 2 b^2 + 2 a b)(a^2 + 2 b^2 - 2 a b) $
]

#proof[
  $a^4 + 4 b^4 = a^4 + 4 a^2 b^2 + 4 b^4 - 4 a^2 b^2 = (a^2 + 2 b^2)^2 - (2 a b)^2$, which is a difference of squares.
]

#tldr[The trick is to add and subtract $4 a^2 b^2$ to create a difference of squares. The pattern "$"something"^4 + 4 dot "something else"^4$" should trigger this identity.]

#trickbox[
  See $n^4 + 4^n$ where $n$ is odd? Write $4^n = 4 dot 4^(n-1) = 4 (2^(n-1))^4$ (works since $n$ is odd makes $n - 1$ even). Then Sophie Germain gives $n^4 + 4(2^(n-1))^4 = (n^2 + 2^n + n dot 2^((n+1)\/2))(dots.c)$... but more directly, for integer $n >= 2$, $n^4 + 4^n$ is always composite when $n$ is odd.
]

== Competition Factoring Strategies

#stratbox[
  *Factoring decision tree for competitions:*
  + *Difference of powers?* Use $x^n - y^n = (x - y)(dots.c)$.
  + *Sum of odd powers?* Use $x^n + y^n = (x + y)(dots.c)$.
  + *Sum of even powers?* Try Sophie Germain or completing the square.
  + *Mixed terms in two variables?* Look for SFFT.
  + *Three cubes?* Check if $x^3 + y^3 + z^3 - 3 x y z$ pattern applies.
  + *Symmetric expression?* Factor in terms of elementary symmetric polynomials $e_1, e_2, e_3$.
]

#conceptbox(title: "Telescoping via Partial Fractions")[
  Factorizations enable telescoping sums. For instance:
  $ 1/(n(n+1)) = 1/n - 1/(n+1) $
  More generally, $n^2 - 1 = (n-1)(n+1)$ gives $1/(n^2 - 1) = 1/2 (1/(n-1) - 1/(n+1))$. Always factor the denominator first.
]

#remark[
  The factorization $x^3 + y^3 + z^3 - 3 x y z = 1/2 (x + y + z)((x - y)^2 + (y - z)^2 + (z - x)^2)$ gives an alternative form that is useful for proving inequalities: if $x, y, z >= 0$, then $x^3 + y^3 + z^3 >= 3 x y z$.
]

== Problems

#drill-header("Special Factorizations")

#prob(1)[#difficulty(1) Factor $x^6 - 1$ completely over the integers.]
#hint(1)[Start with difference of squares: $x^6 - 1 = (x^3 - 1)(x^3 + 1)$.]
#hint(2)[Factor each cubic: $x^3 - 1 = (x - 1)(x^2 + x + 1)$ and $x^3 + 1 = (x + 1)(x^2 - x + 1)$.]
#hint(3)[Check that $x^2 + x + 1$ and $x^2 - x + 1$ are irreducible over $ZZ$ (discriminants $-3$ and $-3$).]
#solution[$x^6 - 1 = (x-1)(x+1)(x^2+x+1)(x^2-x+1)$. Both quadratics have negative discriminant so they are irreducible over $ZZ$.]

#prob(2)[#difficulty(1) Find all pairs of positive integers $(m, n)$ such that $1/m + 1/n = 1/6$.]
#hint(1)[Multiply by $6 m n$: $6 n + 6 m = m n$.]
#hint(2)[Rearrange: $m n - 6 m - 6 n = 0$. Apply SFFT: add $36$ to get $(m - 6)(n - 6) = 36$.]
#hint(3)[Find all factor pairs $(d_1, d_2)$ of $36$ with $d_1, d_2 > 0$ (since $m, n > 6$, both factors are positive). Then $m = d_1 + 6$, $n = d_2 + 6$.]
#solution[$(m-6)(n-6) = 36$. Factor pairs of $36$: $(1,36), (2,18), (3,12), (4,9), (6,6), (9,4), (12,3), (18,2), (36,1)$. So $(m,n) in {(7,42), (8,24), (9,18), (10,15), (12,12), (15,10), (18,9), (24,8), (42,7)}$. There are $bold("9")$ ordered pairs.]

#prob(3)[#difficulty(1) Prove that $n^4 + 4^n$ is composite for all integers $n >= 2$.]
#hint(1)[If $n$ is even, both $n^4$ and $4^n$ are even, so the sum is even and greater than $2$.]
#hint(2)[If $n$ is odd, write $4^n = 4 dot (2^((n-1)\/2))^4$. No --- simpler: $4^n = (2^(n\/2 + 1\/2))^2$... Actually, let $m = 2^((n-1)\/2)$ so $4 m^4 = 4 dot 2^(2(n-1)) = 2^(2 n) - 2^2$... Try Sophie Germain directly with $a = n$, $b = 2^((n-1)\/2)$.]
#hint(3)[Sophie Germain: $n^4 + 4(2^((n-1)\/2))^4 = (n^2 + 2^n + n dot 2^((n+1)\/2)) (n^2 + 2^n - n dot 2^((n+1)\/2))$. Wait --- let us be more careful. Set $b = 2^((n-1)\/2)$, then $4 b^4 = 4 dot 2^(2(n-1)) = 2^(2 n)  = 4^n$. Sophie Germain gives $(n^2 + 2 b^2 + 2 n b)(n^2 + 2 b^2 - 2 n b)$. Both factors exceed $1$ for $n >= 2$.]
#solution[*Even $n$:* both terms are even, so $n^4 + 4^n$ is even and $> 2$, hence composite. *Odd $n$:* let $b = 2^((n-1)\/2)$ (an integer since $n$ is odd). Then $4^n = 4 b^4$. By Sophie Germain: $n^4 + 4 b^4 = (n^2 + 2 b^2 + 2 n b)(n^2 + 2 b^2 - 2 n b)$. For $n >= 2$, the smaller factor $n^2 + 2 b^2 - 2 n b = (n - b)^2 + b^2 >= 1 + 1 = 2$ (checking: when $n = 3, b = 2$, the factor is $9 + 8 - 12 = 5 > 1$). So both factors exceed $1$.]

#prob(4)[#difficulty(2) Given $a + b + c = 0$ and $a^2 + b^2 + c^2 = 6$, find $a^4 + b^4 + c^4$.]
#hint(1)[From $a + b + c = 0$: $(a + b + c)^2 = a^2 + b^2 + c^2 + 2(a b + b c + c a) = 0$, so $a b + b c + c a = -3$.]
#hint(2)[$(a^2 + b^2 + c^2)^2 = a^4 + b^4 + c^4 + 2(a^2 b^2 + b^2 c^2 + c^2 a^2)$. We need $a^2 b^2 + b^2 c^2 + c^2 a^2$.]
#hint(3)[$(a b + b c + c a)^2 = a^2 b^2 + b^2 c^2 + c^2 a^2 + 2 a b c(a + b + c)$. Since $a + b + c = 0$, we get $a^2 b^2 + b^2 c^2 + c^2 a^2 = (-3)^2 = 9$.]
#solution[$a b + b c + c a = (0^2 - 6)/2 = -3$. Then $(a b + b c + c a)^2 = a^2 b^2 + b^2 c^2 + c^2 a^2 + 2 a b c(a + b + c) = a^2 b^2 + b^2 c^2 + c^2 a^2$, so $a^2 b^2 + b^2 c^2 + c^2 a^2 = 9$. Finally, $a^4 + b^4 + c^4 = (a^2 + b^2 + c^2)^2 - 2(a^2 b^2 + b^2 c^2 + c^2 a^2) = 36 - 18 = bold(18)$.]

#prob(5)[#difficulty(2) Find the sum $sum_(n=2)^(100) 1/(n^2 - 1)$.]
#hint(1)[Factor the denominator: $n^2 - 1 = (n - 1)(n + 1)$.]
#hint(2)[Partial fractions: $1/((n-1)(n+1)) = 1/2 (1/(n-1) - 1/(n+1))$.]
#hint(3)[This telescopes: $1/2 ((1/1 - 1/3) + (1/2 - 1/4) + (1/3 - 1/5) + dots.c + (1/99 - 1/101))$.]
#solution[$sum_(n=2)^(100) 1/(n^2-1) = 1/2 sum_(n=2)^(100)(1/(n-1) - 1/(n+1))$. Telescoping: $= 1/2 (1/1 + 1/2 - 1/100 - 1/101) = 1/2 (3/2 - 201/10100) = 1/2 dot (15150 - 201)/10100 = 1/2 dot 14949/10100 = 14949/20200$. Simplify: $gcd(14949, 20200)$. $14949 = 3 dot 4983 = 3 dot 3 dot 1661$ and $20200 = 8 dot 2525 = 8 dot 5 dot 505 = 8 dot 5 dot 5 dot 101$. And $1661 = ?$ Note $1661 / 101 = 16.4...$, not exact. So $gcd = 1$? Actually, let us recompute: the sum telescopes to $1/2(1 + 1/2 - 1/100 - 1/101) = 1/2 dot (10100 + 5050 - 101 - 100)/10100 = 1/2 dot 14949/10100 = bold(14949\/20200)$.]

#prob(6)[#difficulty(2) Solve the Diophantine equation $x^2 - y^2 = 91$ in positive integers.]
#hint(1)[Factor: $(x - y)(x + y) = 91$.]
#hint(2)[$91 = 1 times 91 = 7 times 13$. Since $x, y > 0$, we need $x + y > x - y > 0$ and both factors have the same parity.]
#hint(3)[$91 = 7 times 13$: $x - y = 7, x + y = 13$ gives $x = 10, y = 3$. Also $91 = 1 times 91$: $x - y = 1, x + y = 91$ gives $x = 46, y = 45$.]
#solution[$(x-y)(x+y) = 91$. Both factors are positive with $x + y > x - y$ and same parity. Factor pairs of $91$: $(1, 91)$ and $(7, 13)$. Both have matching parity (odd, odd). From $(1, 91)$: $x = 46, y = 45$. From $(7, 13)$: $x = 10, y = 3$. Solutions: $bold("(10, 3"))$ and $bold("(46, 45"))$.]

#prob(7)[#difficulty(3) Prove that for any integer $n >= 1$:
$ 1^3 + 2^3 + dots.c + n^3 = (1 + 2 + dots.c + n)^2 $]
#hint(1)[The right side is $(n(n+1)/2)^2 = n^2(n+1)^2/4$.]
#hint(2)[Prove by induction. Assume $sum_(k=1)^(n) k^3 = n^2(n+1)^2/4$, then show the formula for $n + 1$.]
#hint(3)[Adding $(n+1)^3$: $n^2(n+1)^2/4 + (n+1)^3 = (n+1)^2(n^2 + 4 n + 4)/4 = (n+1)^2(n+2)^2/4$. The factoring step $n^2 + 4 n + 4 = (n + 2)^2$ is the key.]
#solution[*Base case:* $n = 1$: $1 = 1$. *Inductive step:* assume $sum_(k=1)^(n) k^3 = n^2(n+1)^2\/4$. Then $sum_(k=1)^(n+1) k^3 = n^2(n+1)^2\/4 + (n+1)^3 = (n+1)^2/4 (n^2 + 4(n+1)) = (n+1)^2/4(n^2 + 4 n + 4) = (n+1)^2(n+2)^2\/4$. The critical factorization is $n^2 + 4 n + 4 = (n+2)^2$.]

#prob(8)[#difficulty(3) Let $p$ be a prime and $p | a^3 + b^3 + c^3 - 3 a b c$. Prove that $p | a + b + c$ or $p | (a - b)^2 + (b - c)^2 + (c - a)^2$.]
#hint(1)[Use the factorization $a^3 + b^3 + c^3 - 3 a b c = (a + b + c)(a^2 + b^2 + c^2 - a b - b c - c a)$.]
#hint(2)[Since $p$ is prime and divides the product, $p$ divides at least one factor.]
#hint(3)[The second factor equals $1/2 ((a-b)^2 + (b-c)^2 + (c-a)^2)$. If $p$ divides this and $p != 2$, then $p$ divides $(a-b)^2 + (b-c)^2 + (c-a)^2$. Handle $p = 2$ separately.]
#solution[By the factorization, $p | (a+b+c) dot 1/2 ((a-b)^2 + (b-c)^2 + (c-a)^2)$. Since $p$ is prime, either $p | (a + b + c)$ or $p | 1/2((a-b)^2 + (b-c)^2 + (c-a)^2)$. In the latter case, if $p$ is odd, then $p | (a-b)^2 + (b-c)^2 + (c-a)^2$. If $p = 2$: then $a^3 + b^3 + c^3 - 3 a b c$ is even. Note $a^3 equiv a mod 2$, so $a + b + c - 3 a b c equiv 0 mod 2$, hence $a + b + c equiv a b c mod 2$. If $a + b + c$ is odd, all three are odd, so $(a-b)^2 + (b-c)^2 + (c-a)^2$ is a sum of even squares, hence divisible by $2$ (in fact by $4$). So in all cases the conclusion holds.]
