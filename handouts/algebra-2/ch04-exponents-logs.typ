// ════════════════════════════════════════════════════════════
// Chapter 4 — Exponents and Logarithms
// ════════════════════════════════════════════════════════════

= Exponents and Logarithms

== Exponent Laws and Rational Exponents

#definition("Exponentiation")[
  For $a > 0$ and any real $x$, the expression $a^x$ is defined. The key laws are:
  - $a^m dot a^n = a^(m + n)$
  - $(a^m)^n = a^(m n)$
  - $a^m / a^n = a^(m - n)$
  - $(a b)^n = a^n b^n$
  - $a^0 = 1$ (for $a eq.not 0$), and $a^(-n) = 1 / a^n$.
]

Rational exponents: $a^(m / n) = root(n, a^m)$. In particular, $a^(1 / 2) = sqrt(a)$ and $a^(1 / 3) = root(3, a)$.

#tldr[Exponent laws convert multiplication into addition, powers into multiplication, and division into subtraction — all at the level of exponents. Master them cold.]

#trapbox[$0^0$ is technically undefined in most competition contexts (though some conventions define it as $1$). More practically: $(-2)^(1 / 2)$ is not real. When a problem says $a^x$, unless stated otherwise, assume $a > 0$.]

== Logarithm Definition and Laws

#definition("Logarithm")[
  For $a > 0$, $a eq.not 1$, and $x > 0$: $log_a x = y$ means $a^y = x$. In words: $log_a x$ is the exponent you put on $a$ to get $x$.
]

*Logarithm laws* (direct consequences of exponent laws):
- $log_a (x y) = log_a x + log_a y$
- $log_a (x / y) = log_a x - log_a y$
- $log_a (x^k) = k log_a x$
- $log_a 1 = 0$ and $log_a a = 1$

#tldr[Logs turn multiplication into addition, division into subtraction, and powers into multiplication. They are the _inverse_ of exponentiation: $log_a (a^x) = x$ and $a^(log_a x) = x$.]

#theorem("Logarithm–Exponent Duality")[
  The following are equivalent statements:
  $ a^y = x quad arrow.l.r.double quad y = log_a x $
  This duality is the single most important thing about logs. When stuck, rewrite one form as the other.
]

#trapbox[$log_a x$ is only defined for $x > 0$ and $a > 0$ with $a eq.not 1$. A common competition mistake: solving $log(x^2) = 2 log x$ and forgetting that $log x$ requires $x > 0$, while $log(x^2)$ is defined for all $x eq.not 0$. The correct identity is $log(x^2) = 2 log |x|$.]

== Change of Base Formula

#theorem("Change of Base")[
  For any valid bases $a, b$ and argument $x > 0$:
  $ log_a x = (log_b x) / (log_b a) $
  A powerful special case: $log_a b = 1 / (log_b a)$.
]

#tldr[Change of base: $log_a x = ln x / ln a$. To flip a log base, use $log_a b = 1 / (log_b a)$.]

This formula is essential for two reasons:
1. It lets you convert any log to natural log (or common log) for computation.
2. It reveals hidden structure in products and sums of logs with different bases.

#trickbox[*Pattern trigger: product of logs with "chaining" bases.* $log_a b dot log_b c = log_a c$. This is immediate from change of base: $(ln b / ln a)(ln c / ln b) = ln c / ln a$. When you see a chain of logs, the intermediate bases cancel like dominoes.]

== Solving Exponential and Log Equations

=== Exponential Equations

*Strategy 1: Common base.* Rewrite both sides with the same base, then equate exponents.
$ 8^x = 4^(x + 1) arrow.r 2^(3 x) = 2^(2 x + 2) arrow.r 3 x = 2 x + 2 arrow.r x = 2 $

*Strategy 2: Take logarithms.* When you can't match bases, apply $log$ to both sides.
$ 3^x = 7 arrow.r x = log_3 7 = ln 7 / ln 3 $

=== Logarithmic Equations

Always verify solutions against the domain ($x > 0$ for $log x$, argument $> 0$).

$ log_2 (x - 1) + log_2 (x + 1) = 3 arrow.r log_2 ((x - 1)(x + 1)) = 3 arrow.r x^2 - 1 = 8 arrow.r x = 3 $
(Reject $x = -3$ since $x - 1 > 0$ requires $x > 1$.)

#stratbox[
  *Solving log equations:*
  + Combine logs using sum/difference rules.
  + Convert to exponential form.
  + Solve the resulting algebraic equation.
  + *Check domain* — reject extraneous solutions where any log argument would be non-positive.
]

#trapbox[Extraneous solutions are _extremely_ common in log equations. Every time you solve one, plug your answer back in to verify the arguments of all logarithms are positive.]

== Competition Log Tricks

=== Stacking Logs

$log_a (log_b x) = c$ means $log_b x = a^c$, which means $x = b^(a^c)$.

Stacked logs grow _incredibly_ fast. $log_2 (log_2 (log_2 x)) = 1$ gives $log_2 (log_2 x) = 2$, then $log_2 x = 4$, then $x = 16$.

=== Products of Logs

A frequently tested identity:
$ log_a b dot log_b c dot log_c d = log_a d $
This chain rule follows directly from change of base. It appears in problems where you multiply logs with "linked" bases.

#trickbox[*Pattern trigger: sum of logs with different bases.* Convert everything to the same base using change of base, then factor or simplify. For instance: $log_2 3 + log_4 9 = log_2 3 + (2 log_2 3) / (2) = 2 log_2 3$.]

=== Telescoping with Logs

$ sum_(k=1)^(n) log_k (k + 1) = sum_(k=1)^(n) (ln(k + 1)) / (ln k) $

This doesn't telescope directly, but the _product_ does:
$ product_(k=1)^(n) log_k (k + 1) = (ln 2) / (ln 1) dot (ln 3) / (ln 2) dot dots.c dot (ln(n + 1)) / (ln n) $
Wait — $ln 1 = 0$, so the first term is undefined. But starting from $k = 2$:
$ product_(k=2)^(n) log_k (k + 1) = (ln(n + 1)) / (ln 2) = log_2 (n + 1) $

#tldr[Products of logs with consecutive bases telescope via change of base. Sums of logs within a single base simplify to the log of a product.]

=== Comparing Magnitudes

To compare $2^(100)$ and $3^(75)$, take logs: $100 ln 2 approx 69.3$ vs. $75 ln 3 approx 82.4$. So $3^(75) > 2^(100)$.

== Problems

#drill-header[Exponents and Logarithms]

#prob(1)[#difficulty(1) Simplify $log_8 32$.]

#hint(1)[Write both $8$ and $32$ as powers of $2$.]
#hint(2)[$8 = 2^3$, $32 = 2^5$.]
#hint(3)[$log_(2^3) 2^5 = 5 / 3$.]

#solution[$log_8 32 = log_(2^3) (2^5) = 5 / 3$. Alternatively, $8^x = 32 arrow.r 2^(3 x) = 2^5 arrow.r x = bold(5 / 3)$.]

#prob(2)[#difficulty(1) Solve $2^(x + 3) = 3^x$.]

#hint(1)[Take $ln$ of both sides.]
#hint(2)[$(x + 3) ln 2 = x ln 3$.]
#hint(3)[Solve for $x$: $x ln 2 + 3 ln 2 = x ln 3$, so $x(ln 3 - ln 2) = 3 ln 2$.]

#solution[Taking natural logs: $(x + 3) ln 2 = x ln 3$. Expanding: $x ln 2 + 3 ln 2 = x ln 3$. Rearranging: $x (ln 3 - ln 2) = 3 ln 2$, so $bold("x = (3 ln 2") / (ln 3 - ln 2)) approx 5.13$.]

#prob(3)[#difficulty(2) Compute $log_2 3 dot log_3 4 dot log_4 5 dot log_5 8$.]

#hint(1)[Use the chain rule: the product of linked logs telescopes.]
#hint(2)[$log_2 3 dot log_3 4 dot log_4 5 dot log_5 8 = log_2 8$.]
#hint(3)[$log_2 8 = 3$.]

#solution[By the chain rule for logarithms, $log_a b dot log_b c = log_a c$. Applying repeatedly: $log_2 3 dot log_3 4 dot log_4 5 dot log_5 8 = log_2 8 = bold(3)$.]

#prob(4)[#difficulty(2) If $log_6 15 = a$ and $log_6 10 = b$, find $log_6 2$ in terms of $a$ and $b$.]

#hint(1)[Note $15 = 3 dot 5$ and $10 = 2 dot 5$, so $15 / 10 = 3 / 2$.]
#hint(2)[$log_6 (15 / 10) = a - b = log_6 3 - log_6 2$. Also $log_6 6 = log_6 2 + log_6 3 = 1$.]
#hint(3)[From $log_6 3 - log_6 2 = a - b$ and $log_6 3 + log_6 2 = 1$: add to get $2 log_6 3 = 1 + a - b$.]

#solution[Let $x = log_6 2$ and $y = log_6 3$. Then $x + y = log_6 6 = 1$. Also, $a = log_6 15 = y + log_6 5$ and $b = log_6 10 = x + log_6 5$. Subtracting: $a - b = y - x$. Combined with $x + y = 1$: solving gives $x = (1 - a + b) / 2$. So $bold("log_6 2 = (1 + b - a") / 2)$.]

#prob(5)[#difficulty(2) Solve $log_3 (x + 4) + log_3 (x - 2) = 3$.]

#hint(1)[Combine: $log_3 ((x + 4)(x - 2)) = 3$.]
#hint(2)[$(x + 4)(x - 2) = 27$, so $x^2 + 2 x - 8 = 27$.]
#hint(3)[$x^2 + 2 x - 35 = 0 arrow.r (x + 7)(x - 5) = 0$. Check domain.]

#solution[Combining: $(x + 4)(x - 2) = 3^3 = 27$. So $x^2 + 2 x - 35 = 0$, giving $(x + 7)(x - 5) = 0$. Domain requires $x + 4 > 0$ and $x - 2 > 0$, so $x > 2$. Thus $x = -7$ is extraneous, and the answer is $bold("x = 5")$.]

#prob(6)[#difficulty(2) If $2^a = 3^b = 6^c$, express $c$ in terms of $a$ and $b$.]

#hint(1)[Set the common value to $k$: $2 = k^(1 / a)$, $3 = k^(1 / b)$, $6 = k^(1 / c)$.]
#hint(2)[Since $6 = 2 dot 3$: $k^(1 / c) = k^(1 / a) dot k^(1 / b) = k^(1 / a + 1 / b)$.]
#hint(3)[Therefore $1 / c = 1 / a + 1 / b$.]

#solution[Let $2^a = 3^b = 6^c = k$. Then $2 = k^(1 / a)$ and $3 = k^(1 / b)$, so $6 = 2 dot 3 = k^(1 / a + 1 / b)$. But also $6 = k^(1 / c)$. Therefore $1 / c = 1 / a + 1 / b$, giving $bold("c = (a b") / (a + b))$.]

#prob(7)[#difficulty(3) Compute $product_(k=2)^(63) log_k (k + 1)$.]

#hint(1)[Convert each factor using change of base: $log_k (k + 1) = (ln(k + 1)) / (ln k)$.]
#hint(2)[The product telescopes: $(ln 3 / ln 2)(ln 4 / ln 3)(ln 5 / ln 4) dots.c (ln 64 / ln 63)$.]
#hint(3)[After cancellation: $ln 64 / ln 2 = log_2 64 = 6$.]

#solution[$product_(k=2)^(63) log_k (k + 1) = product_(k=2)^(63) (ln(k + 1)) / (ln k)$. This telescopes: all intermediate terms cancel, leaving $ln 64 / ln 2 = log_2 64 = bold(6)$.]

#prob(8)[#difficulty(3) Find all real $x$ satisfying $(log_2 x)^2 - log_2 (x^4) + 3 = 0$.]

#hint(1)[Let $t = log_2 x$. Then $log_2 (x^4) = 4 t$.]
#hint(2)[The equation becomes $t^2 - 4 t + 3 = 0$.]
#hint(3)[Factor: $(t - 1)(t - 3) = 0$, so $t = 1$ or $t = 3$.]

#solution[Let $t = log_2 x$. The equation becomes $t^2 - 4 t + 3 = (t - 1)(t - 3) = 0$. So $t = 1$ giving $x = 2$, or $t = 3$ giving $x = 8$. Both satisfy $x > 0$. The solutions are $bold("x = 2 "and" x = 8")$.]
