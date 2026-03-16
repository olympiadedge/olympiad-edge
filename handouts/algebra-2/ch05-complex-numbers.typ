// Chapter 5: Complex Numbers for Competitions

= Complex Numbers

== Arithmetic and the Complex Plane

#definition[
  A *complex number* is an expression $z = a + b i$ where $a, b in RR$ and $i^2 = -1$. The *real part* is $Re(z) = a$ and the *imaginary part* is $Im(z) = b$. The set of all complex numbers is $CC$.
]

#tldr[Complex numbers are points in the plane: $a + b i <-> (a, b)$.]

Arithmetic follows naturally from $i^2 = -1$:
$ (a + b i)(c + d i) = (a c - b d) + (a d + b c) i $

#conceptbox(title: "Geometric Meaning of Multiplication")[
  Multiplying by $z = r(cos theta + i sin theta)$ *scales* by $r$ and *rotates* by $theta$. This is the single most important insight about complex numbers in competitions. Multiplication by $i$ is a $90 degree$ counterclockwise rotation.
]

== Modulus and Conjugate

#definition[
  For $z = a + b i$: the *conjugate* is $overline(z) = a - b i$, and the *modulus* is $|z| = sqrt(a^2 + b^2)$.
]

#theorem[
  Key identities: (a) $z overline(z) = |z|^2$, (b) $|z w| = |z| |w|$, (c) $overline(z w) = overline(z) dot overline(w)$, (d) $z + overline(z) = 2 Re(z)$, (e) $z^(-1) = overline(z) / |z|^2$ for $z != 0$.
]

#tldr[$z overline(z) = |z|^2$ is the workhorse identity. It turns complex division into multiplication by the conjugate.]

#trickbox[
  When you see $|z - w|$ in a problem, think *distance* between points $z$ and $w$ in the complex plane. Equations like $|z - 1| = |z + i|$ describe perpendicular bisectors.
]

== Polar Form and De Moivre's Theorem

Every nonzero complex number has a polar form:
$ z = r(cos theta + i sin theta) = r e^(i theta) $
where $r = |z|$ and $theta = arg(z)$.

#theorem[
  *De Moivre's Theorem.* For any integer $n$:
  $ (cos theta + i sin theta)^n = cos(n theta) + i sin(n theta) $
]

#tldr[Raising to the $n$th power multiplies the angle by $n$ and raises the modulus to the $n$th power.]

#stratbox[
  *Trig identity factory.* Need $cos(3 theta)$ in terms of $cos theta$? Expand $(cos theta + i sin theta)^3$ with the binomial theorem, then match real and imaginary parts. This is faster than angle-addition formulas.
]

As a quick example, expanding $(cos theta + i sin theta)^3$ using the binomial theorem:
$ cos^3 theta + 3 i cos^2 theta sin theta - 3 cos theta sin^2 theta - i sin^3 theta $
Matching real parts: $cos(3 theta) = cos^3 theta - 3 cos theta sin^2 theta = 4 cos^3 theta - 3 cos theta$.

#trapbox[
  Be careful with $arg(z)$: it is only defined up to multiples of $2 pi$. The *principal argument* $"Arg"(z) in (-pi, pi]$ is the standard convention. When multiplying, angles add: $arg(z w) = arg(z) + arg(w)$, but the result may need reduction modulo $2 pi$.
]

== Roots of Unity

#definition[
  The *$n$th roots of unity* are the $n$ solutions to $z^n = 1$:
  $ omega_k = e^(2 pi i k \/ n) = cos(2 pi k / n) + i sin(2 pi k / n), quad k = 0, 1, ..., n - 1 $
  Writing $omega = e^(2 pi i \/ n)$, these are $1, omega, omega^2, ..., omega^(n-1)$.
]

#theorem[
  *Sum of roots of unity.* $1 + omega + omega^2 + dots.c + omega^(n-1) = 0$ for any primitive $n$th root of unity $omega$ (when $n >= 2$).
]

#proof[
  This is a geometric series: $sum_(k=0)^(n-1) omega^k = (omega^n - 1)/(omega - 1) = 0/(omega - 1) = 0$, since $omega^n = 1$ and $omega != 1$.
]

#tldr[The $n$th roots of unity are equally spaced on the unit circle, and their sum is zero (their centroid is the origin).]

#conceptbox(title: "Roots of Unity Filter")[
  For a polynomial $f(x) = sum a_k x^k$ and $omega$ a primitive $n$th root of unity:
  $ 1/n sum_(j=0)^(n-1) f(omega^j) = sum_(k equiv 0 med (mod n)) a_k $
  This "filters out" all coefficients whose index is not divisible by $n$. Extremely useful for extracting alternating sums or every-third-term sums from binomial expansions.
]

#lemma[
  The minimal polynomial of a primitive $n$th root of unity over $QQ$ is the *$n$th cyclotomic polynomial* $Phi_n (x)$, which has degree $phi(n)$ (Euler's totient). For prime $p$: $Phi_p (x) = x^(p-1) + x^(p-2) + dots.c + x + 1$.
]

#trickbox[
  The factorization $x^n - 1 = product_(d | n) Phi_d (x)$ is powerful for problems asking about factors of $x^n - 1$. For example, $x^(12) - 1 = Phi_1 Phi_2 Phi_3 Phi_4 Phi_6 Phi_(12)$ has six cyclotomic factors.
]

== Complex Conjugate Root Theorem

#theorem[
  If $p(x)$ is a polynomial with *real* coefficients and $z = a + b i$ is a root, then $overline(z) = a - b i$ is also a root (with the same multiplicity).
]

#tldr[Complex roots of real polynomials come in conjugate pairs.]

#corollary[
  A real polynomial of odd degree always has at least one real root.
]

This connects to Vieta's formulas: if $z$ and $overline(z)$ are roots of a real polynomial, their sum $z + overline(z) = 2 a$ and product $z overline(z) = a^2 + b^2$ are both real, giving the real quadratic factor $x^2 - 2 a x + (a^2 + b^2)$.

#trapbox[
  The conjugate root theorem requires *real* coefficients. A polynomial like $z^2 - 2 i z - 1 = (z - i)^2$ has $i$ as a double root but $-i$ is not a root.
]

== Problems

#drill-header("Complex Numbers")

#prob(1)[#difficulty(1) Compute $(1 + i)^8$.]
#hint(1)[Write $1 + i$ in polar form.]
#hint(2)[$|1 + i| = sqrt(2)$ and $arg(1 + i) = pi / 4$.]
#hint(3)[$(sqrt(2))^8 (cos(8 dot pi / 4) + i sin(8 dot pi / 4)) = 16(cos(2 pi) + i sin(2 pi))$.]
#solution[$1 + i = sqrt(2) e^(i pi \/ 4)$. By De Moivre: $(1+i)^8 = (sqrt(2))^8 e^(i dot 2 pi) = 16 dot 1 = bold(16)$.]

#prob(2)[#difficulty(1) If $z + 1/z = 1$, find $z^7 + 1/z^7$.]
#hint(1)[From $z + 1/z = 1$, multiply by $z$ to get $z^2 - z + 1 = 0$.]
#hint(2)[Solve: $z = (1 plus.minus i sqrt(3))/2 = e^(plus.minus i pi \/ 3)$. These are primitive 6th roots of unity.]
#hint(3)[Since $z^6 = 1$, we have $z^7 = z$ and $1/z^7 = 1/z$, so $z^7 + 1/z^7 = z + 1/z$.]
#solution[$z^2 - z + 1 = 0$ gives $z = e^(plus.minus i pi \/ 3)$, so $z^6 = 1$. Then $z^7 + 1/z^7 = z + 1/z = bold(1)$.]

#prob(3)[#difficulty(2) Find the value of $sum_(k=0)^(6) cos(2 pi k / 7)^2$.]
#hint(1)[Use the identity $cos^2 theta = (1 + cos(2 theta))/2$.]
#hint(2)[The sum becomes $7/2 + 1/2 sum_(k=0)^(6) cos(4 pi k / 7)$.]
#hint(3)[The remaining sum is $Re(sum_(k=0)^(6) omega^(2 k))$ where $omega = e^(2 pi i \/ 7)$. Since $omega^2$ is also a primitive 7th root of unity, this sum is $0$.]
#solution[$sum cos^2(2 pi k / 7) = 7/2 + 1/2 Re(sum_(k=0)^(6) e^(4 pi i k \/ 7))$. The inner sum is a complete set of 7th roots of unity (since $gcd(2,7)=1$), so it equals $0$. Answer: $bold("7\/2")$.]

#prob(4)[#difficulty(2) The roots of $x^4 - 4 x^3 + 11 x^2 - 14 x + 10 = 0$ include $1 + i$. Find all roots and factor the polynomial over $RR$.]
#hint(1)[Since coefficients are real and $1 + i$ is a root, $1 - i$ is also a root.]
#hint(2)[$(x - (1+i))(x - (1-i)) = x^2 - 2 x + 2$ is a factor. Divide.]
#hint(3)[Polynomial division gives $x^4 - 4 x^3 + 11 x^2 - 14 x + 10 = (x^2 - 2 x + 2)(x^2 - 2 x + 5)$.]
#solution[By the conjugate root theorem, $1 - i$ is a root. The factor from this pair is $x^2 - 2 x + 2$. Dividing: $(x^2 - 2 x + 2)(x^2 - 2 x + 5) = 0$. The second factor gives $x = 1 plus.minus 2 i$. All roots: $bold("1 plus.minus i, 1 plus.minus 2 i")$.]

#prob(5)[#difficulty(2) Using roots of unity, compute $binom(20, 0) + binom(20, 3) + binom(20, 6) + dots.c + binom(20, 18)$.]
#hint(1)[Let $omega = e^(2 pi i \/ 3)$. Use the roots of unity filter on $(1 + x)^20$ evaluated at $x = 1, omega, omega^2$.]
#hint(2)[$1/3 (2^20 + (1 + omega)^20 + (1 + omega^2)^20)$ extracts every third coefficient starting from index $0$.]
#hint(3)[$1 + omega = -omega^2 = e^(i pi \/ 3)$ has modulus $1$, so $(1+omega)^20 = e^(20 i pi \/ 3) = e^(2 i pi \/ 3) = omega^2$. Similarly $(1+omega^2)^20 = omega$. And $omega + omega^2 = -1$.]
#solution[By the roots of unity filter: $S = 1/3(2^20 + (1+omega)^20 + (1+omega^2)^20)$. Now $1 + omega = -omega^2$, so $(1+omega)^20 = (-1)^20 omega^40 = omega$. Similarly $(1+omega^2)^20 = omega^2$. So $S = 1/3(2^20 + omega + omega^2) = 1/3(1048576 - 1) = bold(349525)$.]

#prob(6)[#difficulty(3) Let $p(x) = x^4 + x^3 + x^2 + x + 1$. Find the remainder when $p(x^(12))$ is divided by $p(x)$.]
#hint(1)[Note that $p(x) = (x^5 - 1)/(x - 1)$, so the roots of $p$ are the primitive 5th roots of unity $omega, omega^2, omega^3, omega^4$.]
#hint(2)[For any root $omega^k$ of $p(x)$, we have $(omega^k)^5 = 1$, so $(omega^k)^(12) = (omega^k)^2$. Therefore $p(omega^(2 k))$ is what we need to evaluate.]
#hint(3)[Since $omega^(2 k)$ cycles through primitive 5th roots, $p(omega^(2 k)) = 0$ for each root. So $p(x)$ divides $p(x^(12))$ and the remainder is $0$... but verify by checking that the map $k |-> 2 k mod 5$ permutes ${1,2,3,4}$.]
#solution[The roots of $p(x)$ are $omega, omega^2, omega^3, omega^4$ where $omega = e^(2 pi i \/ 5)$. At each root: $p((omega^k)^(12)) = p(omega^(12 k)) = p(omega^(12 k mod 5))$. Since $12 equiv 2 mod 5$, we get $p(omega^(2 k))$. As $k$ ranges over $1,2,3,4$, so does $2 k mod 5$ (since $gcd(2,5)=1$). Each $omega^(2 k)$ is a root of $p$, so $p(omega^(2 k)) = 0$. Since $p(x^(12))$ vanishes at all four roots of $p(x)$ and $p(x)$ is irreducible, $p(x) | p(x^(12))$. The remainder is $bold("0")$.]

#prob(7)[#difficulty(3) Find the product $product_(k=1)^(6) (2 - 2 cos(2 pi k / 7))$.]
#hint(1)[Note $2 - 2 cos theta = |1 - e^(i theta)|^2$ since $|1 - e^(i theta)|^2 = (1 - cos theta)^2 + sin^2 theta = 2 - 2 cos theta$.]
#hint(2)[So the product equals $product_(k=1)^(6) |1 - omega^k|^2 = |product_(k=1)^(6) (1 - omega^k)|^2$ where $omega = e^(2 pi i \/ 7)$.]
#hint(3)[Since $x^7 - 1 = (x - 1) product_(k=1)^(6)(x - omega^k)$, evaluating at $x = 1$: $product_(k=1)^(6)(1 - omega^k) = lim_(x -> 1) (x^7 - 1)/(x - 1) = 7$.]
#solution[$product_(k=1)^(6)(2 - 2 cos(2 pi k\/7)) = product_(k=1)^(6) |1 - omega^k|^2 = |product_(k=1)^(6)(1-omega^k)|^2$. From the factorization $x^7 - 1 = (x-1)product_(k=1)^(6)(x - omega^k)$, substituting $x = 1$: $product_(k=1)^(6)(1-omega^k) = 7$. The answer is $7^2 = bold(49)$.]
