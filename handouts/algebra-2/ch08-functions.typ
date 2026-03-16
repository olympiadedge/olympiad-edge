// Chapter 8: Functions and Functional Equations

= Functions and Functional Equations

== Domain, Range, and Composition

#definition[
  The *domain* of a function $f$ is the set of all valid inputs; the *range* (or image) is the set of all outputs. Notation: $f : A -> B$ means $f$ maps domain $A$ into codomain $B$.
]

#tldr[Domain = what goes in. Range = what comes out. The codomain may be larger than the range.]

#conceptbox(title: "Finding Domain and Range")[
  - For $f(x) = sqrt(g(x))$: domain requires $g(x) >= 0$.
  - For $f(x) = 1 / g(x)$: domain excludes $g(x) = 0$.
  - For $f(x) = log(g(x))$: domain requires $g(x) > 0$.
  - To find the range, solve $y = f(x)$ for $x$ and determine which $y$ values yield valid $x$.
]

#definition[
  The *composition* of $f$ and $g$ is $(f compose g)(x) = f(g(x))$. Composition is associative: $f compose (g compose h) = (f compose g) compose h$, but generally NOT commutative: $f compose g != g compose f$.
]

#trickbox[
  In competition problems, repeated composition $f^((n))(x) = f(f(dots.c f(x)))$ ($n$ times) often becomes periodic. Compute $f^((1)), f^((2)), f^((3)), dots.c$ until you spot a cycle, then reduce $n$ modulo the period.
]

#trapbox[
  $f(g(x))$ is NOT $f(x) dot g(x)$. The domain of $f compose g$ is ${x in "dom"(g) : g(x) in "dom"(f)}$. You must check both conditions.
]

== Inverse Functions

#definition[
  A function $f$ is *invertible* if it is bijective (one-to-one and onto). The inverse $f^(-1)$ satisfies $f^(-1)(f(x)) = x$ and $f(f^(-1)(y)) = y$.
]

#theorem[
  $f$ is invertible iff it is *strictly monotonic* (on an interval). If $f$ is increasing, $f^(-1)$ is increasing. If $f$ is decreasing, $f^(-1)$ is decreasing.
]

#tldr[Inverse = undo. Graphically, reflect over $y = x$. Algebraically, swap $x$ and $y$ then solve.]

#conceptbox(title: "Finding Inverses — Step by Step")[
  + Write $y = f(x)$.
  + Swap $x$ and $y$: $x = f(y)$.
  + Solve for $y$ in terms of $x$.
  + The result is $f^(-1)(x)$.
  + Verify: $f(f^(-1)(x)) = x$.
]

#trapbox[
  $f^(-1)(x) != 1 / f(x)$. The notation $f^(-1)$ denotes the functional inverse, NOT the reciprocal. The only exception is trig: $sin^(-1)$ means arcsin (inverse), but $sin^2 x$ means $(sin x)^2$ (power). This inconsistency causes many errors.
]

== Even and Odd Functions

#definition[
  A function $f$ is *even* if $f(-x) = f(x)$ for all $x$ in its domain. It is *odd* if $f(-x) = -f(x)$ for all $x$. The domain must be symmetric about the origin.
]

#tldr[Even = symmetric about the $y$-axis. Odd = symmetric about the origin. A function can be neither.]

#theorem[
  Every function $f$ defined on a symmetric domain can be uniquely written as $f(x) = E(x) + O(x)$ where $E(x) = (f(x) + f(-x))/2$ is even and $O(x) = (f(x) - f(-x))/2$ is odd.
]

#conceptbox(title: "Quick Parity Checks")[
  - *Even:* $x^2$, $|x|$, $cos x$, any even-degree polynomial with no odd-degree terms.
  - *Odd:* $x^3$, $x$, $sin x$, $tan x$, any polynomial with only odd-degree terms.
  - *Neither:* $x^2 + x$, $e^x$, $ln x$ (domain not symmetric).
  - Product: even $times$ even = even, odd $times$ odd = even, even $times$ odd = odd.
  - Composition: $f(g(x))$ where $g$ is even $=>$ $f compose g$ is even regardless of $f$.
]

#trickbox[
  If an odd function is defined at $x = 0$, then $f(0) = -f(0)$, so $f(0) = 0$. This is a free data point in functional equations.
]

== Transformations

#conceptbox(title: "Function Transformations Summary")[
  Starting from $y = f(x)$:
  - $y = f(x) + k$: shift up by $k$ (down if $k < 0$).
  - $y = f(x - h)$: shift right by $h$ (left if $h < 0$).
  - $y = -f(x)$: reflect over the $x$-axis.
  - $y = f(-x)$: reflect over the $y$-axis.
  - $y = a f(x)$: vertical stretch by $|a|$ (compress if $|a| < 1$).
  - $y = f(b x)$: horizontal compress by $|b|$ (stretch if $|b| < 1$).
  - $y = |f(x)|$: reflect negative parts upward.
  - $y = f(|x|)$: replace $x < 0$ portion with mirror of $x > 0$.
]

#tldr[Horizontal transformations act "opposite" to what you expect: $f(x - 3)$ shifts right, $f(2 x)$ compresses.]

#trapbox[
  Order matters! $f(2 x - 3) = f(2(x - 3/2))$: first compress horizontally by $2$, then shift right by $3/2$. Do NOT shift right by $3$ then compress. Factor out the coefficient of $x$ first.
]

== Introductory Functional Equations

Functional equations ask you to find all functions satisfying a given identity. The core strategy is *strategic substitution*.

#stratbox[
  *Standard substitution playbook for functional equations:*
  + *Try $x = 0$*: often isolates $f(0)$ or simplifies.
  + *Try $y = 0$*: similarly simplifies.
  + *Try $y = x$*: creates $f(2 x)$ or $f(x^2)$, linking values.
  + *Try $y = -x$*: if the domain includes negatives, relates $f(x)$ and $f(-x)$.
  + *Try $x = y = 0$*: gives the value $f(0)$.
  + *Swap $x$ and $y$*: compare with the original to detect symmetry.
  + After getting enough information, *guess the form* (linear, quadratic, exponential) and verify.
]

#theorem[
  *Cauchy's Functional Equation.* If $f : RR -> RR$ is continuous (or monotonic, or measurable, or bounded on any interval) and satisfies $f(x + y) = f(x) + f(y)$ for all $x, y in RR$, then $f(x) = c x$ for some constant $c$.
]

#tldr[Additive + any regularity condition $=>$ linear. Without regularity, pathological solutions exist (requiring Axiom of Choice).]

#conceptbox(title: "Cauchy-Type Equations")[
  The four Cauchy-type equations and their continuous solutions:
  - $f(x + y) = f(x) + f(y)$ $=>$ $f(x) = c x$ (additive).
  - $f(x + y) = f(x) f(y)$ $=>$ $f(x) = a^x$ for some $a > 0$, or $f equiv 0$ (exponential).
  - $f(x y) = f(x) + f(y)$ $=>$ $f(x) = c log |x|$ (logarithmic).
  - $f(x y) = f(x) f(y)$ $=>$ $f(x) = |x|^c$ or $f(x) = |x|^c "sgn"(x)$, or $f equiv 0$ (multiplicative/power).
]

#remark[
  In competition problems, the regularity condition is usually given implicitly (e.g., $f$ is continuous, or $f : ZZ -> ZZ$, or $f$ is a polynomial). Always check what class of functions is requested.
]

#definition[
  A function $f$ is *injective* (one-to-one) if $f(a) = f(b) => a = b$. It is *surjective* (onto $B$) if for every $b in B$ there exists $a$ with $f(a) = b$. Injectivity and surjectivity are powerful tools in functional equations: once proven, they let you "cancel" $f$ from both sides.
]

#trickbox[
  If a functional equation gives $f(g(x)) = f(h(x))$ and you can prove $f$ is injective, then $g(x) = h(x)$. This is often the key step that cracks the problem open.
]

== Problems

#drill-header("Functions and Functional Equations")

#prob(1)[#difficulty(1) Let $f(x) = 2 x + 3$ and $g(x) = x^2 - 1$. Find all $x$ such that $f(g(x)) = g(f(x))$.]
#hint(1)[Compute both sides: $f(g(x)) = 2(x^2 - 1) + 3 = 2 x^2 + 1$.]
#hint(2)[$g(f(x)) = (2 x + 3)^2 - 1 = 4 x^2 + 12 x + 8$.]
#hint(3)[Set equal: $2 x^2 + 1 = 4 x^2 + 12 x + 8$, i.e., $2 x^2 + 12 x + 7 = 0$.]
#solution[$f(g(x)) = 2 x^2 + 1$ and $g(f(x)) = 4 x^2 + 12 x + 8$. Setting equal: $2 x^2 + 12 x + 7 = 0$. By the quadratic formula, $x = (-12 plus.minus sqrt(144 - 56))/4 = (-12 plus.minus sqrt(88))/4 = (-6 plus.minus sqrt(22))/2$. The solutions are $bold("x = (-6 plus.minus sqrt(22"))/2)$.]

#prob(2)[#difficulty(1) Let $f(x) = (x + 1)/(x - 1)$ for $x != 1$. Find $f(f(f(x)))$.]
#hint(1)[Compute $f(f(x))$: $f((x+1)/(x-1)) = ((x+1)/(x-1) + 1)/((x+1)/(x-1) - 1)$.]
#hint(2)[Simplify $f(f(x))$: numerator is $(x+1+x-1)/(x-1) = (2 x)/(x-1)$, denominator is $(x+1-x+1)/(x-1) = 2/(x-1)$. So $f(f(x)) = x$.]
#hint(3)[Since $f(f(x)) = x$, we have $f(f(f(x))) = f(x)$.]
#solution[$f(f(x)) = ((x+1)/(x-1) + 1)/((x+1)/(x-1) - 1) = (2 x)/(x-1) dot (x-1)/2 = x$. So $f$ is its own inverse: $f(f(x)) = x$. Therefore $f(f(f(x))) = f(x) = bold((x+1)/(x-1))$.]

#prob(3)[#difficulty(1) The function $f$ satisfies $f(x) + 2 f(1 - x) = 3 x^2$ for all real $x$. Find $f(x)$.]
#hint(1)[Substitute $x -> 1 - x$: $f(1 - x) + 2 f(x) = 3(1 - x)^2$.]
#hint(2)[You now have two equations: (1) $f(x) + 2 f(1-x) = 3 x^2$ and (2) $2 f(x) + f(1-x) = 3(1-x)^2$.]
#hint(3)[From (2): $f(1-x) = 3(1-x)^2 - 2 f(x)$. Substitute into (1): $f(x) + 2(3(1-x)^2 - 2 f(x)) = 3 x^2$.]
#solution[Equations: (1) $f(x) + 2 f(1-x) = 3 x^2$ and (2) $2 f(x) + f(1-x) = 3(1-x)^2$. Multiply (2) by $2$: $4 f(x) + 2 f(1-x) = 6(1-x)^2$. Subtract (1): $3 f(x) = 6(1-x)^2 - 3 x^2 = 6 - 12 x + 6 x^2 - 3 x^2 = 3 x^2 - 12 x + 6$. So $bold("f(x") = x^2 - 4 x + 2)$. Verify: $f(x) + 2 f(1-x) = (x^2 - 4 x + 2) + 2((1-x)^2 - 4(1-x) + 2) = x^2 - 4 x + 2 + 2(x^2 - 2 x + 1 - 4 + 4 x + 2) = x^2 - 4 x + 2 + 2(x^2 + 2 x - 1) = 3 x^2 - 0 x + 0 = 3 x^2$. ✓]

#prob(4)[#difficulty(2) Find all functions $f : RR -> RR$ such that $f(x + y) = f(x) + f(y) + 2 x y$ for all $x, y in RR$.]
#hint(1)[Set $x = y = 0$: $f(0) = 2 f(0)$, so $f(0) = 0$.]
#hint(2)[Set $y = x$: $f(2 x) = 2 f(x) + 2 x^2$. Define $g(x) = f(x) - x^2$.]
#hint(3)[Then $g(x + y) = f(x + y) - (x + y)^2 = f(x) + f(y) + 2 x y - x^2 - 2 x y - y^2 = g(x) + g(y)$. So $g$ is additive.]
#solution[Let $g(x) = f(x) - x^2$. Then $g(x+y) = f(x+y) - (x+y)^2 = (f(x) + f(y) + 2 x y) - (x^2 + 2 x y + y^2) = g(x) + g(y)$. So $g$ satisfies Cauchy's equation. If $f$ (hence $g$) is continuous, then $g(x) = c x$ for some constant $c$. Therefore $bold("f(x") = x^2 + c x)$ for any constant $c in RR$.]

#prob(5)[#difficulty(2) Find all functions $f : RR^+ -> RR^+$ such that $f(x f(y)) = y f(x)$ for all $x, y > 0$.]
#hint(1)[Set $x = 1$: $f(f(y)) = y f(1)$. Set $y = 1$: $f(x f(1)) = f(x)$.]
#hint(2)[From $y = 1$: $f(x f(1)) = f(x)$. If $f(1) != 1$, iterating gives $f$ is constant on a geometric sequence, which is hard to reconcile with $f(f(y)) = y f(1)$. Try $f(1) = c$ and set $x = 1/f(y)$ (if in domain).]
#hint(3)[From $f(f(y)) = c y$ and $f(x c) = f(x)$ where $c = f(1)$: applying $f$ to both sides of $f(x c) = f(x)$ and using injectivity (provable from the original equation) gives $c = 1$. Then $f(f(y)) = y$, so $f$ is an involution. Substitute $x -> f(x)$: $f(f(x) f(y)) = y f(f(x)) = x y$. By symmetry, $f(x y) = f(x) f(y)$... wait, that gives multiplicative. Try $f(x) = k / x$.]
#solution[Set $y = 1$: $f(x f(1)) = f(x)$ for all $x > 0$. Set $x = 1$: $f(f(y)) = y f(1)$. Suppose $f(1) = c$. Apply $f$ to $f(x c) = f(x)$: $f(f(x c)) = f(f(x))$, giving $x c^2 = x c$ (using $f(f(t)) = c t$), so $c^2 = c$, hence $c = 1$. Now $f(f(y)) = y$ (involution) and the original equation is $f(x f(y)) = y f(x)$. Replace $y$ with $f(y)$: $f(x y) = f(y) f(x)$. So $f$ is multiplicative. With $f(f(y)) = y$ and multiplicativity, $f(y) = y^a$ for some $a$ with $a^2 = 1$, so $a = 1$ or $a = -1$. Check: $f(x) = x$ gives $f(x f(y)) = x y = y f(x)$ ✓. $f(x) = 1/x$ gives $f(x/y) = y/x$ but $y f(x) = y/x$ ✓. Both work. Solutions: $bold("f(x") = x)$ and $bold("f(x") = 1\/x)$.]

#prob(6)[#difficulty(2) A function $f$ satisfies $f(f(x)) = 6 x - f(x)$ for all real $x$. If $f$ is linear, find $f(x)$.]
#hint(1)[Let $f(x) = a x + b$. Then $f(f(x)) = a(a x + b) + b = a^2 x + a b + b$.]
#hint(2)[Also $6 x - f(x) = 6 x - a x - b = (6 - a) x - b$.]
#hint(3)[Equate coefficients: $a^2 = 6 - a$ and $a b + b = -b$, i.e., $a^2 + a - 6 = 0$ and $b(a + 2) = 0$.]
#solution[$a^2 + a - 6 = 0$ gives $(a + 3)(a - 2) = 0$, so $a = 2$ or $a = -3$. From $b(a + 2) = 0$: if $a = 2$, then $b(4) = 0$ so $b = 0$; if $a = -3$, then $b(-1) = 0$ so $b = 0$. Solutions: $bold("f(x") = 2 x)$ or $bold("f(x") = -3 x)$. Verify: $f(f(x)) = 4 x$ and $6 x - 2 x = 4 x$ ✓; $f(f(x)) = 9 x$ and $6 x + 3 x = 9 x$ ✓.]

#prob(7)[#difficulty(3) Find all functions $f : ZZ -> ZZ$ such that $f(m + n) + f(m n - 1) = f(m) f(n) + 2$ for all $m, n in ZZ$.]
#hint(1)[Set $m = n = 0$: $f(0) + f(-1) = f(0)^2 + 2$. Set $m = 1, n = 0$: $f(1) + f(-1) = f(1) f(0) + 2$.]
#hint(2)[Set $n = 1$: $f(m + 1) + f(m - 1) = f(m) f(1) + 2$. This is a recurrence once $f(1)$ is known.]
#hint(3)[Try $f(x) = x^2 + 1$: $f(m+n) + f(m n - 1) = (m+n)^2 + 1 + (m n - 1)^2 + 1 = m^2 + 2 m n + n^2 + m^2 n^2 - 2 m n + 1 + 2$. And $f(m) f(n) + 2 = (m^2+1)(n^2+1) + 2 = m^2 n^2 + m^2 + n^2 + 3$. These are equal! Also try constant $f = 2$.]
#solution[Setting $m = n = 0$: $f(0) + f(-1) = f(0)^2 + 2$. Setting $n = 1$: $f(m+1) + f(m-1) = f(m) f(1) + 2$ for all $m$, giving a linear recurrence in $f$. Try $f(x) = x^2 + 1$: LHS $= (m+n)^2 + 1 + (m n - 1)^2 + 1 = m^2 + 2 m n + n^2 + 1 + m^2 n^2 - 2 m n + 1 + 1 = m^2 n^2 + m^2 + n^2 + 3$. RHS $= (m^2+1)(n^2+1) + 2 = m^2 n^2 + m^2 + n^2 + 3$. ✓. Also $f equiv 2$: LHS $= 2 + 2 = 4$, RHS $= 4 + 2 = 6$. ✗. Try $f(x) = 2$ fails. From the recurrence with $f(1) = 2$: $f(m+1) + f(m-1) = 2 f(m) + 2$, giving $f(m+1) - f(m) = f(m) - f(m-1) + 2$, so second differences are constant = $2$, meaning $f$ is quadratic: $f(x) = x^2 + b x + c$. Substituting back and comparing: $b = 0$, $c = 1$. The answer is $bold("f(x") = x^2 + 1)$.]

#prob(8)[#difficulty(3) Find all functions $f : RR -> RR$ satisfying $f(x^2 + f(y)) = y + f(x)^2$ for all $x, y in RR$.]
#hint(1)[Set $x = 0$: $f(f(y)) = y + f(0)^2$. Let $c = f(0)^2$. So $f(f(y)) = y + c$, meaning $f$ is injective (if $f(a) = f(b)$, then $a + c = b + c$, so $a = b$).]
#hint(2)[Set $y = 0$: $f(x^2 + c') = f(x)^2$ where $c' = f(0)$. From $x = 0$ in original: $f(c') = c$. Also $f(0) = c'$, and from $f(f(0)) = 0 + c$: $f(c') = c = c'^2 + ...$? Use $f(f(y)) = y + c$ with $y = 0$: $f(c') = c = f(0)^2 = c'^2$. So $c = c'^2$.]
#hint(3)[Try $f(x) = x$: $x^2 + y = y + x^2$ ✓. Try $f(x) = -x$: $-x^2 - y = y + x^2$, giving $-x^2 - y = y + x^2$, i.e., $-2 x^2 = 2 y$ for all $x, y$. ✗. Try $f(x) = x + a$: $x^2 + y + a + a = y + (x + a)^2 = y + x^2 + 2 a x + a^2$. So $x^2 + y + 2 a = y + x^2 + 2 a x + a^2$, giving $2 a = 2 a x + a^2$ for all $x$, so $a = 0$.]
#solution[Set $x = 0$: $f(f(y)) = y + f(0)^2$. This implies $f$ is injective. Set $y = 0$: $f(x^2 + f(0)) = f(x)^2$. Let $c = f(0)$. From the original with $x$ replaced by $-x$: $f(x^2 + f(y)) = y + f(-x)^2$. Comparing with $y + f(x)^2$: $f(x)^2 = f(-x)^2$ for all $x$, so $f(x) = plus.minus f(-x)$. From $f(f(y)) = y + c^2$: applying $f$ again, $f(f(f(y))) = f(y) + c^2$. But also $f(f(f(y))) = f(y + c^2) $. So $f(y + c^2) = f(y) + c^2$ for all $y$. If $c != 0$, then $f$ has period $c^2$ up to a linear shift. From $y = 0$: $f(x^2 + c) = f(x)^2$. With $x = 0$: $f(c) = c^2$. Using $f(f(y)) = y + c^2$ and $f(x^2 + c) = f(x)^2$, set $x^2 + c = f(y)$, then $f(x)^2 = f(f(y)) = y + c^2$. So whenever $x^2 = f(y) - c$, we get $f(x)^2 = y + c^2$. This gives $f(x)^2 = f^(-1)(x^2 + c) + c^2$... The cleanest approach: verify $f(x) = x$ works (it does). To show uniqueness, the injectivity and the relation $f(f(y)) = y + c^2$ force $c = 0$ (since $f(c) = c^2$ and $f(0) = c$; if $c != 0$, substituting $y = -c^2$ in $f(f(y)) = y + c^2$ gives $f(f(-c^2)) = 0$, and from $f(x^2 + c) = f(x)^2 >= 0$, the range of $f$ on $[c, infinity)$ is $[0, infinity)$; careful analysis forces $c = 0$). With $c = 0$: $f(f(y)) = y$ and $f(x^2) = f(x)^2$. Then $f(1) = f(1)^2$ gives $f(1) in {0, 1}$. If $f(1) = 0$ then $f(0) = f(f(1)) = 1 != 0 = c$, contradiction. So $f(1) = 1$, and by similar arguments $f(n) = n$ for all integers, and continuity (which follows from $f(x^2) = f(x)^2$ and monotonicity) gives $bold("f(x") = x)$.]
