// Chapter 6: Inequalities for Competitions

= Inequalities

== The Trivial Inequality and Basic Properties

#theorem[
  *Trivial Inequality.* For all $x in RR$, $x^2 >= 0$, with equality if and only if $x = 0$.
]

#tldr[Every real square is nonneg. This is the foundation of ALL algebraic inequalities.]

#corollary[
  For real $a, b$: $a^2 + b^2 >= 2 a b$, with equality iff $a = b$.
]

#proof[
  $a^2 + b^2 - 2 a b = (a - b)^2 >= 0$.
]

This single idea --- expanding and recognizing a perfect square --- resolves a surprising number of competition inequality problems.

#trickbox[
  When you need to prove $"LHS" >= "RHS"$, try showing $"LHS" - "RHS"$ is a sum of squares (SOS). This is the most elementary and often most elegant approach.
]

== AM-GM Inequality

#theorem[
  *AM-GM (2-variable).* For nonneg reals $a, b$:
  $ (a + b) / 2 >= sqrt(a b) $
  with equality if and only if $a = b$.
]

#theorem[
  *AM-GM ($n$-variable).* For nonneg reals $a_1, a_2, ..., a_n$:
  $ (a_1 + a_2 + dots.c + a_n) / n >= root(n, a_1 a_2 dots.c a_n) $
  with equality if and only if $a_1 = a_2 = dots.c = a_n$.
]

#tldr[The arithmetic mean is at least the geometric mean. Equality holds when all terms are equal.]

#stratbox[
  *Using AM-GM to optimize.* To minimize $f(x) = x + k/x$ for $x > 0$: by AM-GM, $x + k/x >= 2 sqrt(k)$ with equality when $x = k/x$, i.e., $x = sqrt(k)$. The key: check that equality is *achievable* within the given constraints.
]

#trapbox[
  AM-GM gives $a + 1/a >= 2$ for $a > 0$, with equality at $a = 1$. But if the constraint is $a >= 3$, then the minimum is $3 + 1/3 = 10/3$, NOT $2$! Always verify that the equality condition is compatible with the problem's constraints. An unreachable equality condition means AM-GM gives a bound, but not the minimum.
]

A powerful technique is *weighted AM-GM* or applying AM-GM to cleverly chosen groups:

#conceptbox(title: "AM-GM with Unequal Groups")[
  To minimize $2 x + 3/x^2$ for $x > 0$, split: $x + x + 3/x^2 >= 3 root(3, x dot x dot 3/x^2) = 3 root(3, 3)$, with equality when $x = 3/x^2$, i.e., $x = root(3, 3)$. The trick is choosing the split so the product inside the radical simplifies.
]

== Cauchy-Schwarz Inequality

#theorem[
  *Cauchy-Schwarz.* For real numbers $a_1, ..., a_n$ and $b_1, ..., b_n$:
  $ (sum_(i=1)^(n) a_i b_i)^2 <= (sum_(i=1)^(n) a_i^2)(sum_(i=1)^(n) b_i^2) $
  with equality iff $(a_1, ..., a_n)$ and $(b_1, ..., b_n)$ are proportional (one is a scalar multiple of the other).
]

#tldr[Dot-product squared is at most the product of the norms squared. Equality when vectors are parallel.]

#theorem[
  *Titu's Lemma (Engel form of Cauchy-Schwarz).* For $a_i in RR$ and $b_i > 0$:
  $ sum_(i=1)^(n) a_i^2 / b_i >= (sum_(i=1)^(n) a_i)^2 / (sum_(i=1)^(n) b_i) $
  with equality iff $a_1 / b_1 = a_2 / b_2 = dots.c = a_n / b_n$.
]

#tldr[Titu's lemma: a sum of fractions $"square"/"positive"$ is bounded below by $"(sum of tops)"^2 / "(sum of bottoms)"$.]

This form is extremely convenient for competition problems involving sums of fractions.

#trickbox[
  See a sum like $a^2/x + b^2/y + c^2/z$ with a constraint on $x + y + z$? Apply Titu's lemma immediately.
]

== Power Mean Inequality

#definition[
  For positive reals $a_1, ..., a_n$ and exponent $r != 0$, the *power mean of order $r$* is:
  $ M_r = ((a_1^r + a_2^r + dots.c + a_n^r)/n)^(1\/r) $
  Special cases: $M_2 = "QM"$ (quadratic mean), $M_1 = "AM"$, $M_(-1) = "HM"$ (harmonic mean), and $lim_(r -> 0) M_r = "GM"$.
]

#theorem[
  *Power Mean Inequality.* If $r > s$, then $M_r >= M_s$, i.e.:
  $ "QM" >= "AM" >= "GM" >= "HM" $
  Explicitly for positive reals $a_1, ..., a_n$:
  $ sqrt((a_1^2 + dots.c + a_n^2)/n) >= (a_1 + dots.c + a_n)/n >= root(n, a_1 dots.c a_n) >= n/(1/a_1 + dots.c + 1/a_n) $
  Equality holds throughout iff $a_1 = a_2 = dots.c = a_n$.
]

#tldr[QM $>=$ AM $>=$ GM $>=$ HM, with equality iff all values are equal.]

#conceptbox(title: "AM-HM in Competition Use")[
  For positive reals with $a_1 + a_2 + dots.c + a_n = S$:
  $ 1/a_1 + 1/a_2 + dots.c + 1/a_n >= n^2/S $
  This follows from AM-HM (or Cauchy-Schwarz with $a_i = 1$). Very useful when a problem constrains a sum and asks about the sum of reciprocals.
]

== Optimization with Inequalities

#stratbox[
  *Competition optimization playbook:*
  + *Identify the constraint and the objective.* Write them explicitly.
  + *Try AM-GM first.* Choose terms so the product simplifies.
  + *If AM-GM fails* (equality condition violates constraints), try Cauchy-Schwarz or Lagrange multipliers.
  + *Always verify* the equality case satisfies all constraints.
  + *Boundary analysis:* for constrained optimization on a closed domain, check boundary values too.
]

#lemma[
  *Schur's Inequality* (for reference). For nonneg reals $a, b, c$ and $t >= 0$:
  $ a^t (a - b)(a - c) + b^t (b - a)(b - c) + c^t (c - a)(c - b) >= 0 $
  with equality when $a = b = c$ or when one variable is $0$ and the other two are equal.
]

#trapbox[
  When a problem says "for all positive reals $a, b, c$ with $a + b + c = 1$, prove $f(a,b,c) >= k$," do NOT assume the minimum occurs at $a = b = c = 1/3$. Symmetric functions can have extrema on the boundary (e.g., as one variable approaches $0$). Check both the symmetric point and boundary behavior.
]

== Problems

#drill-header("Inequalities")

#prob(1)[#difficulty(1) For positive reals $x, y$ with $x + y = 10$, find the maximum value of $x y$.]
#hint(1)[Apply AM-GM: $(x + y)/2 >= sqrt(x y)$.]
#hint(2)[$5 >= sqrt(x y)$, so $x y <= 25$.]
#hint(3)[Equality when $x = y = 5$.]
#solution[By AM-GM, $sqrt(x y) <= (x+y)/2 = 5$, so $x y <= 25$. Equality at $x = y = 5$. Maximum is $bold("25")$.]

#prob(2)[#difficulty(1) Prove that $a^2 + b^2 + c^2 >= a b + b c + c a$ for all reals $a, b, c$.]
#hint(1)[Consider $2(a^2 + b^2 + c^2) - 2(a b + b c + c a)$.]
#hint(2)[This equals $(a - b)^2 + (b - c)^2 + (c - a)^2$.]
#hint(3)[A sum of squares is nonneg.]
#solution[$2(a^2 + b^2 + c^2 - a b - b c - c a) = (a-b)^2 + (b-c)^2 + (c-a)^2 >= 0$. Divide by $2$. Equality iff $a = b = c$.]

#prob(3)[#difficulty(2) For positive reals $a, b, c$ with $a b c = 1$, prove $a^2 + b^2 + c^2 >= a + b + c$.]
#hint(1)[It suffices to show $x^2 >= x$ for each variable? No --- that is only true when $x >= 1$, which need not hold.]
#hint(2)[By AM-GM on two terms: $a^2 + 1 >= 2 a$. Similarly for $b$ and $c$.]
#hint(3)[Adding: $a^2 + b^2 + c^2 + 3 >= 2(a + b + c)$. But we need a tighter bound. Instead, use AM-GM as $a^2 + b^2 + c^2 >= (a + b + c)^2 / 3 >= a + b + c$ where the last step uses $a + b + c >= 3 root(3, a b c) = 3$.]
#solution[By AM-GM, $a + b + c >= 3 root(3, a b c) = 3$. By QM-AM (or Cauchy-Schwarz), $a^2 + b^2 + c^2 >= (a+b+c)^2/3$. Let $S = a + b + c >= 3$. Then $a^2 + b^2 + c^2 >= S^2/3$, and $S^2/3 >= S$ iff $S >= 3$, which holds. Equality when $a = b = c = 1$.]

#prob(4)[#difficulty(2) For positive reals $x, y, z$, prove:
$ x/y + y/z + z/x >= 3 $]
#hint(1)[Direct AM-GM on the three terms.]
#hint(2)[$x/y + y/z + z/x >= 3 root(3, (x/y)(y/z)(z/x))$.]
#hint(3)[The product inside the cube root telescopes to $1$.]
#solution[By AM-GM, $x/y + y/z + z/x >= 3 root(3, (x dot y dot z)/(y dot z dot x)) = 3 root(3, 1) = 3$. Equality when $x/y = y/z = z/x$, i.e., $x = y = z$.]

#prob(5)[#difficulty(2) Let $a, b, c > 0$ with $a + b + c = 1$. Find the minimum value of
$ 1/a + 1/b + 1/c $]
#hint(1)[Apply Cauchy-Schwarz in Engel form (Titu's lemma).]
#hint(2)[$1/a + 1/b + 1/c = 1^2/a + 1^2/b + 1^2/c >= (1+1+1)^2/(a+b+c)$.]
#hint(3)[This gives $>= 9/1 = 9$. Check equality: $a = b = c = 1/3$, giving $3 + 3 + 3 = 9$.]
#solution[By Titu's lemma: $1/a + 1/b + 1/c >= (1+1+1)^2/(a+b+c) = 9$. Equality when $a = b = c = 1/3$. Minimum is $bold("9")$.]

#prob(6)[#difficulty(3) For positive reals $a, b, c, d$ with $a + b + c + d = 4$, prove:
$ 1/(a^2 + 1) + 1/(b^2 + 1) + 1/(c^2 + 1) + 1/(d^2 + 1) >= 2 $]
#hint(1)[Check: when $a = b = c = d = 1$, the LHS is $4 dot 1/2 = 2$. So equality holds at the symmetric point.]
#hint(2)[Show $1/(x^2 + 1) >= (2 - x)/2$ for $0 < x <= 4$. This linearizes the problem.]
#hint(3)[The tangent line bound: $1/(x^2+1) >= (2-x)/2$ iff $2 >= (2-x)(x^2+1) = 2 + x - x^2 - x^3$ iff $x^3 + x^2 - x >= 0$ iff $x(x^2 + x - 1) >= 0$. For $x > 0$ this needs $x^2 + x - 1 >= 0$, which fails for small $x$... Refine: try $1/(x^2+1) >= 1 - x^2/4$ or use Jensen's (the function is convex for $|x| >= 1/sqrt(3)$, but not everywhere, so Jensen does not directly apply). Instead, verify the tangent-line trick at $x = 1$: show $1/(x^2+1) >= (4 - x^2)/4$ for $x in [0,2]$ and handle large values separately.]
#solution[We prove the tangent line bound $1/(t^2 + 1) >= (2 - t)/2$ for $t in [0, 2]$, which rearranges to $2 >= (2-t)(t^2+1) = -t^3 + 2 t^2 - t + 2$, i.e., $t^3 - 2 t^2 + t >= 0$, i.e., $t(t-1)^2 >= 0$. This holds for $t >= 0$. For any variable exceeding $2$, say $a > 2$, we have $a^2+1 > 5$ so $1/(a^2+1) < 1/5$ and the remaining three have $b+c+d < 2$, which allows a case analysis. Using the linear bound for all four variables: $sum 1/(a_i^2+1) >= sum (2 - a_i)/2 = (8 - (a+b+c+d))/2 = (8-4)/2 = 2$. Equality when each $a_i (a_i - 1)^2 = 0$, i.e., $a = b = c = d = 1$.]

#prob(7)[#difficulty(3) #aime(2019, 14)[Find the minimum value of
$ f(x) = sqrt(x^2 + (1 - x)^2) + sqrt((1 - x)^2 + (1 + x)^2) $
for $x in RR$.]]
#hint(1)[Interpret geometrically: $sqrt(x^2 + (1-x)^2)$ is the distance from the origin to the point $(x, 1-x)$... or reinterpret each term as a distance in the plane.]
#hint(2)[$f(x) = d((x,0), (0,1)) + d((x,0),(1,-1))$ after rewriting. Wait --- more precisely, $sqrt(x^2 + (1-x)^2)$ is the distance from $(x, x)$ to $(0, 1)$, but think of it as $|(x, 1-x)|$ and $|(1-x, 1+x)|$. Apply Minkowski or direct Cauchy-Schwarz.]
#hint(3)[By Cauchy-Schwarz (Minkowski's inequality): $f(x) >= sqrt((x + 1 - x)^2 + (1 - x + 1 + x)^2) = sqrt(1 + 4) = sqrt(5)$. Check equality: need $(x, 1-x)$ and $(1-x, 1+x)$ to be proportional, i.e., $x(1+x) = (1-x)^2$.]
// VERIFY: Minkowski applied as sqrt(a1^2+b1^2)+sqrt(a2^2+b2^2) >= sqrt((a1+a2)^2+(b1+b2)^2)
#solution[By Minkowski's inequality, $sqrt(a_1^2 + b_1^2) + sqrt(a_2^2 + b_2^2) >= sqrt((a_1+a_2)^2 + (b_1+b_2)^2)$. With $a_1 = x$, $b_1 = 1-x$, $a_2 = 1-x$, $b_2 = 1+x$: $f(x) >= sqrt((x+1-x)^2 + (1-x+1+x)^2) = sqrt(1+4) = sqrt(5)$. Equality requires $x/(1-x) = (1-x)/(1+x)$, giving $x + x^2 = 1 - 2 x + x^2$, so $3 x = 1$, $x = 1/3$. Verify: $f(1/3) = sqrt(1/9 + 4/9) + sqrt(4/9 + 16/9) = sqrt(5)/3 + 2 sqrt(5)/3 = sqrt(5)$. Minimum is $bold("sqrt(5"))$.]
