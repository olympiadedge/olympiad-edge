// ════════════════════════════════════════════════════════════
// Chapter 2 — Quadratics Deep Dive
// ════════════════════════════════════════════════════════════

= Quadratics

== The Quadratic Formula and Discriminant

#definition("Quadratic Formula")[
  The roots of $a x^2 + b x + c = 0$ (with $a eq.not 0$) are
  $ x = (-b plus.minus sqrt(b^2 - 4 a c)) / (2 a) $
  The quantity $Delta = b^2 - 4 a c$ is the *discriminant*.
]

#tldr[$Delta > 0$: two distinct real roots. $Delta = 0$: one repeated root. $Delta < 0$: no real roots (two complex conjugate roots).]

#trapbox[Don't forget the $2 a$ in the denominator — it's $2 a$, not $2$. Also, if the problem says "real roots," you need $Delta gt.eq 0$, which _includes_ the repeated-root case.]

#remark[The discriminant is your best friend in competition math. It converts "does a solution exist?" into an inequality you can solve.]

== Completing the Square and Optimization

Every quadratic can be rewritten in *vertex form*:
$ a x^2 + b x + c = a (x + b / (2 a))^2 + (c - b^2 / (4 a)) $

The vertex is at $x = -b / (2 a)$, and the extreme value is $c - b^2 / (4 a)$.

#tldr[Completing the square converts $a x^2 + b x + c$ into $a (x - h)^2 + k$, revealing the vertex $(h, k)$ and the min/max value $k$.]

#trickbox[*Optimization shortcut.* When a competition asks "find the minimum (or maximum) value of a quadratic expression," jump straight to $k = c - b^2 / (4 a)$. If $a > 0$, $k$ is the minimum; if $a < 0$, $k$ is the maximum. No calculus needed.]

#theorem("Sum of Squares Trick")[
  If you can write an expression as a sum of squares plus a constant — for example $2(x - 3)^2 + 5$ — then the minimum is the constant (here, 5). This extends to multivariable problems: $f(x, y) = (x - 1)^2 + (y + 2)^2 + 7$ has minimum $7$.
]

== Vieta's Formulas for Quadratics

For $a x^2 + b x + c = 0$ with roots $r$ and $s$:
$ r + s = -b / a, quad r s = c / a $

This pair of equations is astonishingly powerful. Any symmetric expression in $r, s$ can be computed from just these two quantities.

*Common derived identities:*
- $r^2 + s^2 = (r + s)^2 - 2 r s$
- $|r - s| = sqrt((r + s)^2 - 4 r s) = sqrt(Delta) / |a|$
- $1 / r + 1 / s = (r + s) / (r s)$
- $r^2 s + r s^2 = r s (r + s)$

#tldr[You can compute _any_ symmetric function of two roots using only $r + s$ and $r s$. Memorize the identity for $r^2 + s^2$ — it appears constantly.]

#stratbox[
  *When to use Vieta's vs. the quadratic formula:*
  - Need the _actual roots_? Use the formula.
  - Need a _symmetric combination_ of roots (sum, product, sum of squares)? Use Vieta's — it's faster and avoids ugly radicals.
  - Need to _construct_ a quadratic with given root properties? Use Vieta's in reverse: $x^2 - (r + s) x + r s = 0$.
]

== Discriminant as a Competition Tool

The discriminant is not just for classifying roots. In competitions, you often force conditions on $Delta$ to constrain parameters.

#trickbox[*Forcing integer solutions.* If a quadratic $a x^2 + b x + c = 0$ must have integer roots and $a = 1$, then $Delta = b^2 - 4 c$ must be a perfect square. This transforms the problem into a number theory question: "for which values of $c$ is $b^2 - 4 c$ a perfect square?"]

*Key patterns:*
- A quadratic in a parameter is always real $arrow.r.double$ $Delta gt.eq 0$ gives a bound on that parameter.
- A system has a solution $arrow.r.double$ after substitution, the resulting quadratic has $Delta gt.eq 0$.
- Tangency of a line and a parabola $arrow.r.double$ $Delta = 0$ (exactly one intersection).

#trapbox[When using $Delta gt.eq 0$ to find a range, remember to check that the endpoints actually work. Sometimes $Delta = 0$ gives a valid answer; sometimes the problem requires _distinct_ roots ($Delta > 0$), which excludes the boundary.]

== Hidden Quadratics

Many competition problems _look_ non-quadratic but become quadratic after a clever substitution.

*Common disguises:*
- *Quartic:* $x^4 - 5 x^2 + 6 = 0$ — substitute $u = x^2$.
- *Symmetric rational:* $x + 1 / x = 5$ — multiply through or let $u = x + 1 / x$.
- *Exponential:* $4^x - 3 dot 2^x + 2 = 0$ — let $u = 2^x$.
- *Trigonometric:* $2 cos^2 theta - 3 cos theta + 1 = 0$ — let $u = cos theta$.
- *Nested radical:* $sqrt(x) + sqrt(x + 5) = 5$ — isolate one radical, square, repeat.

#definition("Hidden Quadratic")[
  A *hidden quadratic* (or *quadratic in disguise*) is an equation that becomes $a u^2 + b u + c = 0$ after substituting $u = g(x)$ for some function $g$.
]

#tldr[If the exponents in your equation form the pattern $2 k, k, 0$ (like $x^4, x^2, 1$ or $9^x, 3^x, 1$), substitute $u = x^k$ or $u = 3^x$ and solve a standard quadratic.]

#trapbox[After solving for $u$, you must _back-substitute_ to get $x$. And check the domain: $u = 2^x$ is always positive, so discard negative $u$ values. Similarly, $u = x^2$ requires $u gt.eq 0$.]

== Problems

#drill-header[Quadratics]

#prob(1)[#difficulty(1) Find the vertex of the parabola $y = 2 x^2 - 12 x + 23$.]

#hint(1)[Complete the square or use $h = -b / (2 a)$.]
#hint(2)[$h = 12 / 4 = 3$. Then $k = 2(9) - 12(3) + 23$.]
#hint(3)[$k = 18 - 36 + 23 = 5$.]

#solution[$h = -(-12) / (2 dot 2) = 3$ and $k = 2(3)^2 - 12(3) + 23 = 18 - 36 + 23 = 5$. The vertex is $bold("(3, 5"))$.]

#prob(2)[#difficulty(1) Find the sum $1 / r + 1 / s$ where $r, s$ are the roots of $3 x^2 + 7 x - 5 = 0$.]

#hint(1)[Express $1 / r + 1 / s$ in terms of $r + s$ and $r s$.]
#hint(2)[$1 / r + 1 / s = (r + s) / (r s)$.]
#hint(3)[Vieta's: $r + s = -7 / 3$, $r s = -5 / 3$.]

#solution[$1 / r + 1 / s = (r + s) / (r s) = (-7 \/ 3) / (-5 \/ 3) = bold(7 / 5)$.]

#prob(3)[#difficulty(2) For how many integers $k$ does $x^2 + k x + 2024$ have two distinct positive integer roots?]

#hint(1)[If roots are $r, s > 0$ with $r s = 2024$, list the factor pairs of $2024$.]
#hint(2)[$2024 = 2^3 dot 11 dot 23$. The positive factor pairs $(r, s)$ with $r lt.eq s$ are: $(1, 2024)$, $(2, 1012)$, $(4, 506)$, $(8, 253)$, $(11, 184)$, $(22, 92)$, $(23, 88)$, $(44, 46)$.]
#hint(3)[For distinct roots, $r eq.not s$, so all 8 pairs work. Each gives $k = -(r + s)$, and all sums are distinct.]

#solution[We need $r s = 2024$ with $r, s$ distinct positive integers. Since $2024 = 2^3 dot 11 dot 23$, it has $(3 + 1)(1 + 1)(1 + 1) = 16$ positive divisors, giving $8$ factor pairs with $r lt.eq s$. Since $2024$ is not a perfect square, all pairs have $r eq.not s$. Each pair gives a distinct value $k = -(r + s) < 0$. The answer is $bold("8")$.]

#prob(4)[#difficulty(2) Solve $4^x - 6 dot 2^x + 8 = 0$.]

#hint(1)[Recognize a hidden quadratic: $4^x = (2^x)^2$.]
#hint(2)[Let $u = 2^x$. Then $u^2 - 6 u + 8 = 0$.]
#hint(3)[Factor: $(u - 2)(u - 4) = 0$, so $u = 2$ or $u = 4$.]

#solution[Let $u = 2^x$. The equation becomes $u^2 - 6 u + 8 = (u - 2)(u - 4) = 0$. So $2^x = 2$ giving $x = 1$, or $2^x = 4$ giving $x = 2$. The solutions are $bold("x = 1 "and" x = 2")$.]

#prob(5)[#difficulty(2) Find all real values of $m$ such that $x^2 + 2 m x + m + 6 = 0$ has two distinct real roots that are both negative.]

#hint(1)[Three conditions: $Delta > 0$, sum of roots $< 0$, product of roots $> 0$.]
#hint(2)[Sum $= -2 m < 0$ gives $m > 0$. Product $= m + 6 > 0$ gives $m > -6$. Combined with $m > 0$, we need $m > 0$.]
#hint(3)[Discriminant: $4 m^2 - 4(m + 6) > 0$, i.e., $m^2 - m - 6 > 0$, i.e., $(m - 3)(m + 2) > 0$. Since $m > 0$, this requires $m > 3$.]

#solution[We need: (i) $Delta = 4 m^2 - 4 m - 24 > 0$, so $m^2 - m - 6 > 0$, giving $m > 3$ or $m < -2$. (ii) Sum of roots $= -2 m < 0$, so $m > 0$. (iii) Product of roots $= m + 6 > 0$, so $m > -6$. Intersecting: $bold("m > 3")$.]

#prob(6)[#difficulty(3) Let $a$ and $b$ be real numbers such that the quadratic $x^2 + a x + b = 0$ has roots $r$ and $s$ satisfying $r + 1 / s = s + 1 / r = 2$. Find $a + b$.]

#hint(1)[From $r + 1 / s = 2$ and $s + 1 / r = 2$, subtract the equations.]
#hint(2)[Subtracting: $(r - s) + (1 / s - 1 / r) = 0$, so $(r - s)(1 - 1 / (r s)) = 0$.]
#hint(3)[Either $r = s$, or $r s = 1$. If $r s = 1$, then from $r + 1 / s = 2$ we get $r + r = 2$, so $r = 1$ and $s = 1$. Either way $r = s = 1$.]

#solution[Subtracting the two equations: $(r - s)(1 - 1 / (r s)) = 0$. *Case 1:* $r = s$. Then $r + 1 / r = 2$, so $r^2 - 2 r + 1 = 0$, giving $r = 1$. *Case 2:* $r s = 1$. Then $r + 1 / s = r + r = 2$, so $r = 1$, $s = 1$. In both cases $r = s = 1$. By Vieta's, $a = -(r + s) = -2$ and $b = r s = 1$. So $a + b = bold(-1)$.]

#prob(7)[#difficulty(3) Find the minimum value of $x^2 + y^2$ subject to $x + y = x y$, where $x, y$ are real and $x y eq.not 0$.]

#hint(1)[From $x + y = x y$, let $s = x + y$ and $p = x y$. Then $s = p$.]
#hint(2)[$x^2 + y^2 = s^2 - 2 p = s^2 - 2 s$. Minimize $f(s) = s^2 - 2 s$.]
#hint(3)[The vertex of $f(s) = s^2 - 2 s$ is at $s = 1$ with $f(1) = -1$. But check: $x, y$ real requires $Delta = s^2 - 4 p = s^2 - 4 s gt.eq 0$, so $s lt.eq 0$ or $s gt.eq 4$.]

#solution[Let $s = x + y = x y = p$. Then $x^2 + y^2 = s^2 - 2 s$. For $x, y$ to be real, $s^2 - 4 s gt.eq 0$, giving $s lt.eq 0$ or $s gt.eq 4$. On $s lt.eq 0$: $f(s) = s^2 - 2 s = s(s - 2) gt.eq 0$ (since $s lt.eq 0$ implies $s - 2 < 0$, actually $f(s) gt.eq 0$ with $f(0)$ excluded). The infimum on $s lt.eq 0$ approaches $0$ but $s = 0$ is excluded ($x y eq.not 0$). On $s gt.eq 4$: $f(s) = s^2 - 2 s gt.eq 16 - 8 = 8$, achieved at $s = 4$ where $x = y = 2$. So the minimum is $bold("8")$.]

#prob(8)[#difficulty(3) For how many real values of $c$ does the system $y = x^2 + 1$ and $x = y^2 + c$ have exactly one solution?]

#hint(1)[Substitute $y = x^2 + 1$ into $x = y^2 + c$ to get a single equation in $x$.]
#hint(2)[You get $x = (x^2 + 1)^2 + c = x^4 + 2 x^2 + 1 + c$. The condition is that $x^4 + 2 x^2 - x + (1 + c) = 0$ has exactly one real solution.]
#hint(3)[Analyze the function $g(x) = x^4 + 2 x^2 - x + 1$ and note that exactly one solution means $-c = g(x)$ is tangent to $g$. Study $g'(x) = 4 x^3 + 4 x - 1$.]

#solution[Substituting gives $x^4 + 2 x^2 - x + 1 + c = 0$, so $c = -(x^4 + 2 x^2 - x + 1)$. Let $g(x) = x^4 + 2 x^2 - x + 1$. Then $g'(x) = 4 x^3 + 4 x - 1$. Since $g''(x) = 12 x^2 + 4 > 0$, $g'$ is strictly increasing, so $g$ has exactly one critical point (a global minimum). The equation $g(x) = -c$ has exactly one real solution when $-c$ equals the global minimum of $g$. Since $g'$ has exactly one real root $x_0$ and $g$ is strictly convex-like (one local min, no local max, tending to $+infinity$), the horizontal line $y = -c$ is tangent to $g$ at exactly one value of $c$. The answer is $bold("1")$.]
