// Formula Sheet: Algebra II — Olympiad Edge

#set page(paper: "us-letter", margin: (top: 0.5in, bottom: 0.45in, left: 0.45in, right: 0.45in))
#set text(font: "New Computer Modern", size: 8pt)
#set par(justify: true, leading: 0.4em)
#set block(spacing: 0.35em)

#align(center)[#text(size: 14pt, weight: "bold", fill: rgb("#1B2A4A"))[Algebra II — Formula Reference Sheet]]
#v(2pt)
#line(length: 100%, stroke: 0.5pt + rgb("#C5963A"))
#v(4pt)

#let sectitle(body) = {
  v(2pt)
  text(size: 8.5pt, weight: "bold", fill: rgb("#1B2A4A"))[#body]
  v(1pt)
}

#columns(2, gutter: 12pt)[

#sectitle[POLYNOMIALS]

*Vieta's Formulas* for $P(x) = a_n x^n + dots.c + a_0$ with roots $r_1, ..., r_n$:
$ sum r_i = -a_(n-1)/a_n, quad sum_(i < j) r_i r_j = a_(n-2)/a_n, quad product r_i = (-1)^n a_0/a_n $

*Newton's Sums.* $p_k = sum r_i^k$, $e_j$ = elementary symm. polys:
$ p_1 = e_1, quad p_2 = e_1 p_1 - 2 e_2, quad p_k = sum_(j=1)^(k) (-1)^(j-1) e_j p_(k-j) $

*Factor Theorem:* $(x - c) | P(x)$ iff $P(c) = 0$.

*Remainder Theorem:* $P(x) div (x - c)$ has remainder $P(c)$.

*Rational Root Theorem:* if $p\/q$ is a root (reduced), then $p | a_0$ and $q | a_n$.

#sectitle[QUADRATICS]

For $a x^2 + b x + c = 0$: $x = (-b plus.minus sqrt(b^2 - 4 a c))/(2 a)$

*Discriminant* $Delta = b^2 - 4 a c$: $Delta > 0$ (2 real), $= 0$ (1 repeated), $< 0$ (complex pair).

*Completing the square:* $a x^2 + b x + c = a(x + b/(2 a))^2 + c - b^2/(4 a)$.

*Sum/Product:* $r_1 + r_2 = -b\/a$, $quad r_1 r_2 = c\/a$.

#sectitle[SEQUENCES AND SERIES]

*Arithmetic:* $a_n = a_1 + (n-1) d$, $quad S_n = n(a_1 + a_n)/2 = n(2 a_1 + (n-1) d)/2$.

*Geometric:* $a_n = a_1 r^(n-1)$, $quad S_n = a_1(1 - r^n)/(1 - r)$ for $r != 1$.

*Infinite geometric:* $S = a_1/(1 - r)$ for $|r| < 1$.

*Useful sums:*
$ sum_(k=1)^n k = n(n+1)/2, quad sum_(k=1)^n k^2 = (n(n+1)(2 n+1))/6, quad sum_(k=1)^n k^3 = (n(n+1)/2)^2 $

*Telescoping:* $sum_(k=1)^n (a_k - a_(k+1)) = a_1 - a_(n+1)$.

#sectitle[LOGARITHMS]

*Definition:* $log_b x = y <==> b^y = x$ ($b > 0$, $b != 1$, $x > 0$).

$ log(x y) = log x + log y, quad log(x/y) = log x - log y $
$ log(x^r) = r log x, quad log_b a = (ln a)/(ln b) = 1/(log_a b) $
$ log_b a = (log_c a)/(log_c b) quad "(change of base)" $
$ a^(log_a x) = x, quad log_a (a^x) = x $

#sectitle[COMPLEX NUMBERS]

*Polar form:* $z = r(cos theta + i sin theta) = r e^(i theta)$, $|z| = r$.

*Multiplication:* $r_1 e^(i theta_1) dot r_2 e^(i theta_2) = r_1 r_2 e^(i(theta_1 + theta_2))$.

*De Moivre:* $(cos theta + i sin theta)^n = cos(n theta) + i sin(n theta)$.

*Roots of unity:* the $n$th roots of unity are $omega^k = e^(2 pi i k\/n)$ for $k = 0, 1, ..., n - 1$.
$ sum_(k=0)^(n-1) omega^k = 0, quad product_(k=0)^(n-1)(z - omega^k) = z^n - 1 $
$ product_(k=1)^(n-1)(z - omega^k) = z^(n-1) + z^(n-2) + dots.c + 1 = (z^n - 1)/(z - 1) $

*Useful identities:* $|z|^2 = z overline(z)$, $quad overline(z_1 + z_2) = overline(z_1) + overline(z_2)$, $quad overline(z_1 z_2) = overline(z_1) overline(z_2)$.

#colbreak()

#sectitle[INEQUALITIES]

*AM-GM:* $(a_1 + dots.c + a_n)/n >= root(n, a_1 dots.c a_n)$, $quad a_i >= 0$. Eq. iff all equal.

*Cauchy-Schwarz:* $(sum a_i b_i)^2 <= (sum a_i^2)(sum b_i^2)$. Eq. iff proportional.

*Titu's Lemma:* $sum a_i^2/b_i >= (sum a_i)^2/(sum b_i)$ for $b_i > 0$.

*Power Mean:* $"QM" >= "AM" >= "GM" >= "HM"$. Eq. iff all equal.

Explicitly: $sqrt((sum a_i^2)/n) >= (sum a_i)/n >= root(n, product a_i) >= n/(sum 1/a_i)$.

*AM-HM:* $(sum a_i)(sum 1/a_i) >= n^2$.

*Schur ($t = 1$):* $a^2(a-b)(a-c) + "cyc" >= 0$ for $a, b, c >= 0$.

*Trivial inequality:* $x^2 >= 0$ for all $x in RR$.

*SOS method:* show LHS $-$ RHS $= sum ("squares") >= 0$.

#sectitle[SPECIAL FACTORIZATIONS]

$ x^n - y^n = (x - y)(x^(n-1) + x^(n-2) y + dots.c + y^(n-1)) $
$ x^n + y^n = (x + y)(x^(n-1) - x^(n-2) y + dots.c + y^(n-1)) quad (n "odd") $
$ x^2 - y^2 = (x - y)(x + y) $
$ x^3 plus.minus y^3 = (x plus.minus y)(x^2 minus.plus x y + y^2) $
$ x^3 + y^3 + z^3 - 3 x y z = (x + y + z)(x^2 + y^2 + z^2 - x y - y z - z x) $

*Corollary:* $x + y + z = 0 => x^3 + y^3 + z^3 = 3 x y z$.

*Sophie Germain:* $a^4 + 4 b^4 = (a^2 + 2 b^2 + 2 a b)(a^2 + 2 b^2 - 2 a b)$.

*SFFT:* $x y + a x + b y + a b = (x + b)(y + a)$.

For $1/m + 1/n = 1/k$: $(m - k)(n - k) = k^2$.

#sectitle[FLOOR, CEILING, FRACTIONAL PART]

$floor(x) <= x < floor(x) + 1$, $quad {x} = x - floor(x) in [0, 1)$.

$ceil(x) = -floor(-x)$, $quad floor(x + n) = floor(x) + n$ for $n in ZZ$.

$floor(x) + floor(-x) = cases(0 & x in ZZ, -1 & x in.not ZZ)$

${x + n} = {x}$ for $n in ZZ$, $quad {-x} = 1 - {x}$ for $x in.not ZZ$.

${x + y} = {{x} + {y}}$, $quad floor(x) + floor(y) <= floor(x + y) <= floor(x) + floor(y) + 1$.

*Hermite's Identity:* $sum_(k=0)^(n-1) floor(x + k/n) = floor(n x)$.

Special case: $floor(x) + floor(x + 1/2) = floor(2 x)$.

*Legendre's formula:* exponent of $p$ in $n!$ is $sum_(k >= 1) floor(n / p^k)$.

Integers in $[a, b]$: count $= floor(b) - ceil(a) + 1$.

#sectitle[FUNCTIONAL EQUATIONS — KEY SUBSTITUTIONS]

Try: $x = 0$, $y = 0$, $y = x$, $y = -x$, $x = y = 0$, swap $x <-> y$.

*Cauchy types* (continuous solutions):
- $f(x + y) = f(x) + f(y) => f(x) = c x$.
- $f(x + y) = f(x) f(y) => f(x) = a^x$ or $f equiv 0$.
- $f(x y) = f(x) + f(y) => f(x) = c log|x|$.
- $f(x y) = f(x) f(y) => f(x) = |x|^c$ or $f equiv 0$.
]
