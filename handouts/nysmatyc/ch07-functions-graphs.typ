// ════════════════════════════════════════════════════════════
// Chapter 7 — Functions & Graphs Speed
// ════════════════════════════════════════════════════════════

= Functions & Graphs Speed

#tldr[Function problems on NYSMATYC are almost always "plug in and simplify." Domain/range, composition, inverses, and transformations — each has a 10-second pattern. Don't overthink.]

== Domain and Range

#speedbox[
  *Domain restrictions — scan for these three:*
  1. *Denominator $eq.not 0$:* set denominator $eq.not 0$ and exclude.
  2. *Square root $>= 0$:* set radicand $>= 0$.
  3. *Logarithm $> 0$:* set argument $> 0$.

  That's it. If none of these appear, the domain is all reals.
]

#trickbox[*On MC, eliminate fast.* If the question asks for the domain of $f(x) = sqrt(x - 3) / (x - 5)$, you need $x >= 3$ AND $x eq.not 5$. Scan the choices for the one that says $[3, 5) union (5, infinity)$.]

#trapbox[*Range is harder than domain.* For range, don't try to "see" it — either solve $y = f(x)$ for $x$ and find which $y$ values work, or use your calculator to graph it and read off the range.]

#conceptbox(title: "Range Shortcuts")[
  - $f(x) = a x^2 + b x + c$: vertex gives min/max → range is $[f(- b / (2 a)), infinity)$ or $(-infinity, f(- b / (2 a))]$.
  - $f(x) = a / (x - h) + k$: range is $(-infinity, k) union (k, infinity)$.
  - $f(x) = sqrt(g(x))$: range starts at 0 (or higher if $g$ has a restricted domain).
]

== Composition of Functions

#speedbox[
  *$(f compose g)(x) = f(g(x))$: plug $g(x)$ into $f$.* Work from the inside out.

  For numerical evaluation: compute the inner function first, then plug into the outer.
  - $f(x) = x^2 + 1$, $g(x) = 3 x$. Find $f(g(2))$: $g(2) = 6$, $f(6) = 37$.

  For algebraic composition: substitute the entire expression.
  - $f(g(x)) = f(3 x) = (3 x)^2 + 1 = 9 x^2 + 1$.
]

#trapbox[*Order matters.* $f(g(x)) eq.not g(f(x))$ in general. Always check which is the outer function. "$(f compose g)$" means $f$ is outer, $g$ is inner.]

#trickbox[*$f(f(x))$ problems.* If $f(x) = 2 x + 3$, then $f(f(x)) = f(2 x + 3) = 2(2 x + 3) + 3 = 4 x + 9$. Just plug in mechanically. Don't try to be clever — speed comes from being systematic.]

== Inverse Functions

#speedbox[
  *To find $f^(-1)(x)$:*
  1. Write $y = f(x)$.
  2. Swap $x$ and $y$.
  3. Solve for $y$.

  *Speed shortcut:* If you need $f^(-1)(a)$ for a specific value $a$, just solve $f(x) = a$. Don't find the full inverse formula.
]

#conceptbox(title: "Inverse Properties")[
  - $f(f^(-1)(x)) = x$ and $f^(-1)(f(x)) = x$.
  - The graph of $f^(-1)$ is the reflection of $f$ across $y = x$.
  - Domain of $f^(-1)$ $=$ Range of $f$, and vice versa.
  - $(f compose g)^(-1) = g^(-1) compose f^(-1)$ (reverse order).
]

#trickbox[*When the problem gives $f$ and asks for $f^(-1)(k)$, back-solve.* If $f(x) = x^3 + 2$ and you need $f^(-1)(10)$, solve $x^3 + 2 = 10$: $x^3 = 8$, $x = 2$. You never need the general formula.]

#trapbox[*Not every function has an inverse.* $f$ must be one-to-one (pass the horizontal line test). If the problem asks for an inverse of $f(x) = x^2$, they usually restrict the domain to $x >= 0$.]

== Graph Transformations

#speedbox[
  Starting from $y = f(x)$:
  - $f(x) + k$: shift *up* by $k$
  - $f(x) - k$: shift *down* by $k$
  - $f(x - h)$: shift *right* by $h$ #h(1em) (note: *minus* goes *right*)
  - $f(x + h)$: shift *left* by $h$
  - $-f(x)$: reflect over *$x$-axis*
  - $f(-x)$: reflect over *$y$-axis*
  - $a f(x)$: vertical stretch by $a$ (compress if $0 < a < 1$)
  - $f(a x)$: horizontal compress by $a$ (stretch if $0 < a < 1$)
]

#trapbox[*The horizontal shift is backwards from what you'd expect.* $f(x - 3)$ shifts *right* 3, not left. Think: "what $x$ value makes the input to $f$ equal to 0?" That's $x = 3$, which is to the right.]

#trickbox[*Reading transformations from equations.* If the problem says "$g(x) = 2 f(x - 1) + 3$," read the transformations in order: shift right 1, stretch vertically by 2, shift up 3. On MC, trace what happens to a key point (like the vertex or an intercept).]

== Symmetry and Periodicity

#speedbox[
  - *Even function:* $f(-x) = f(x)$. Symmetric about the $y$-axis.
  - *Odd function:* $f(-x) = -f(x)$. Symmetric about the origin.

  Quick checks: $x^2, |x|, cos x$ are even. $x^3, x, sin x, tan x$ are odd.
]

#trickbox[*Testing even/odd on MC.* Plug in one value. If $f(-2) = f(2)$, it might be even. If $f(-2) = -f(2)$, it might be odd. This eliminates most wrong answers instantly.]

#conceptbox(title: "Periodicity")[
  $f$ is periodic with period $T$ if $f(x + T) = f(x)$ for all $x$. To evaluate $f$ at a large input, reduce modulo the period.

  Example: $sin(1000 pi / 3)$. Period of sine is $2 pi$. $1000 / 3 = 333.overline(3)$, so $1000 pi / 3 = 166 dot 2 pi + 2 pi / 3$. Thus $sin(1000 pi / 3) = sin(2 pi / 3) = sqrt(3) / 2$.
]

== Logarithmic and Exponential Functions

#speedbox[
  *Key equivalence:* $log_b(x) = y <==> b^y = x$. Convert between forms instantly.

  *Change of base:* $log_b(x) = ln(x) / ln(b) = log(x) / log(b)$. Essential for calculator use.
]

#conceptbox(title: "Log Properties (Must Be Instant)")[
  $log_b(m n) = log_b(m) + log_b(n)$ #h(3em) $log_b(m / n) = log_b(m) - log_b(n)$\
  $log_b(m^k) = k log_b(m)$ #h(3em) $log_b(1) = 0$ #h(3em) $log_b(b) = 1$\
  $b^(log_b(x)) = x$ #h(3em) $log_b(b^x) = x$
]

#trickbox[*Stacked logs.* $log_2(log_3(81)) = log_2(log_3(3^4)) = log_2(4) = 2$. Work from the inside out.]

#trapbox[*$log(a + b) eq.not log(a) + log(b)$.* There is NO addition rule for logs. This is the most common log error on the test. Logs distribute over multiplication, not addition.]

#speedbox[
  *Solving exponential equations:*
  - Same base? Set exponents equal: $2^(3 x) = 2^7 arrow.r.double 3 x = 7$.
  - Different bases? Take log of both sides: $3^x = 5 arrow.r.double x = log(5) / log(3)$. Calculator does the rest.
  - Quadratic in disguise? $4^x - 3 dot 2^x + 2 = 0$ becomes $(2^x)^2 - 3(2^x) + 2 = 0$. Let $u = 2^x$ and factor.
]

#stratbox[
  *NYSMATYC Functions Decision Tree:*
  - Domain question → scan for denominators, square roots, logs
  - $f(g(a))$ for a specific $a$ → compute inside-out (15 seconds)
  - Find $f^(-1)(k)$ → solve $f(x) = k$ directly (don't find the full inverse)
  - Graph transformation → apply shifts/reflections to a key point
  - Even/odd → test $f(-x)$ vs $f(x)$ and $-f(x)$
  - Log/exp equation → convert form or take logs of both sides
]

== Speed Drill — Functions & Graphs

#drill-header[Functions & Graphs]

#prob(1)[#difficulty(1) What is the domain of $f(x) = sqrt(2 x - 6)$?]
#mcq[$x > 3$][$x >= 3$][$x >= 6$][$x > 0$][$x >= -3$]

#speedsolution("10s")[Set $2 x - 6 >= 0$: $x >= 3$. Answer: *(B)*.]

#prob(2)[#difficulty(1) If $f(x) = 3 x - 1$ and $g(x) = x^2$, find $f(g(2))$.]
#mcq[$11$][$25$][$35$][$8$][$17$]

#speedsolution("10s")[$g(2) = 4$. $f(4) = 3(4) - 1 = bold(11)$. Answer: *(A)*.]

#prob(3)[#difficulty(1) If $f(x) = 5 x + 3$, find $f^(-1)(18)$.]
#mcq[$3$][$4$][$87$][$93$][$15$]

#speedsolution("15s")[Solve $5 x + 3 = 18$: $5 x = 15$, $x = bold(3)$. Answer: *(A)*.]

#prob(4)[#difficulty(1) The graph of $y = (x - 2)^2 + 5$ is the graph of $y = x^2$ shifted:]
#mcq[right 2, up 5][left 2, up 5][right 5, up 2][left 2, down 5][right 2, down 5]

#speedsolution("10s")[$x - 2$ inside means right 2. $+ 5$ outside means up 5. Answer: *(A)*.]

#prob(5)[#difficulty(2) If $f(x) = (2 x + 1) / (x - 3)$, find $f^(-1)(x)$.]
#mcq[$(3 x + 1) / (x - 2)$][$(x + 3) / (2 x - 1)$][$(3 x - 1) / (x + 2)$][$(x - 1) / (2 x + 3)$][$(2 x - 3) / (x + 1)$]

#speedsolution("40s")[Swap: $x = (2 y + 1) / (y - 3)$. Multiply: $x(y - 3) = 2 y + 1$, so $x y - 3 x = 2 y + 1$, thus $y(x - 2) = 3 x + 1$, $y = bold((3 x + 1) / (x - 2))$. Answer: *(A)*.]

#prob(6)[#difficulty(2) If $f(x) = x^3 - x$, which statement is true?]
#mcq[$f$ is even][$f$ is odd][$f$ is neither even nor odd][$f$ is both even and odd][$f$ is periodic]

#speedsolution("15s")[Check: $f(-x) = (-x)^3 - (-x) = -x^3 + x = -(x^3 - x) = -f(x)$. So $f$ is *odd*. Answer: *(B)*.]

#prob(7)[#difficulty(2) Solve $log_2(x - 1) + log_2(x + 1) = 3$.]
#mcq[$3$][$-3$][$plus.minus 3$][$5$][$2$]

#speedsolution("30s")[Combine: $log_2((x - 1)(x + 1)) = 3$, so $(x - 1)(x + 1) = 8$, thus $x^2 - 1 = 8$, $x^2 = 9$, $x = plus.minus 3$. But $x - 1 > 0$ requires $x > 1$, so $x = bold(3)$. Answer: *(A)*.]

#prob(8)[#difficulty(2) If $f(x) = 2^x$, what is $f(x + 3) / f(x - 1)$?]
#mcq[$16$][$8$][$4$][$2^4$][$2^(2 x + 2)$]

#speedsolution("15s")[$f(x + 3) / f(x - 1) = 2^(x + 3) / 2^(x - 1) = 2^((x + 3) - (x - 1)) = 2^4 = bold(16)$. Note *(A)* and *(D)* are the same value. Answer: *(A)*.]

#prob(9)[#difficulty(3) Let $f(x) = a x + b$ where $f(f(x)) = 4 x + 9$. Find $a + b$.]
#mcq[$5$][$4$][$7$][$6$][$3$]

#speedsolution("30s")[$f(f(x)) = a(a x + b) + b = a^2 x + a b + b = 4 x + 9$. So $a^2 = 4$, giving $a = 2$ (take positive since a linear function with $a = -2$ gives $a^2 = 4$ too, but check: if $a = -2$, $a b + b = -2 b + b = -b = 9$, $b = -9$, $a + b = -11$ — not in choices). For $a = 2$: $2 b + b = 9$, $b = 3$. $a + b = bold(5)$. Answer: *(A)*.]

#prob(10)[#difficulty(3) If $f(x) = 2^x + 2^(-x)$ and $f(a) = 5$, find $f(2 a)$.]
#mcq[$23$][$25$][$20$][$10$][$50$]

#speedsolution("30s")[Note $f(2 a) = 2^(2 a) + 2^(-2 a) = (2^a)^2 + (2^(-a))^2 = (2^a + 2^(-a))^2 - 2 = f(a)^2 - 2 = 25 - 2 = bold(23)$. The key identity: $x^2 + y^2 = (x + y)^2 - 2 x y$, and here $2^a dot 2^(-a) = 1$. Answer: *(A)*.]
