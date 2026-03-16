// Chapter 9: Floor Function, Ceiling, and Fractional Part

= Floor, Ceiling, and Fractional Part

== Definitions and Basic Properties

#definition[
  For any real $x$:
  - The *floor* $floor(x)$ is the greatest integer $<= x$.
  - The *ceiling* $ceil(x)$ is the least integer $>= x$.
  - The *fractional part* ${x} = x - floor(x)$, so $0 <= {x} < 1$.
]

#tldr[$floor(x)$ = round down, $ceil(x)$ = round up, ${x}$ = the leftover decimal. Every real number is $floor(x) + {x}$.]

Some essential properties:

#conceptbox(title: "Basic Floor/Ceiling Properties")[
  Let $n in ZZ$ and $x in RR$.
  - $floor(x) <= x < floor(x) + 1$ and $ceil(x) - 1 < x <= ceil(x)$.
  - $floor(x) = n <==> n <= x < n + 1$.
  - $ceil(x) = n <==> n - 1 < x <= n$.
  - $floor(n + x) = n + floor(x)$ (integers pass through the floor).
  - $ceil(x) = -floor(-x)$.
  - $floor(x) + floor(-x) = cases(0 & "if" x in ZZ, -1 & "otherwise")$.
  - $floor(x) = x$ iff $x in ZZ$.
]

#trapbox[
  The fractional part notation ${x}$ can be confused with set braces. In competition math, context determines meaning. When in doubt, write $"frac"(x) = x - floor(x)$ explicitly.
]

#trickbox[
  $floor(x) = x - {x}$ is the single most useful rewrite. Whenever floor appears in an equation, replacing $floor(x)$ with $x - {x}$ (where $0 <= {x} < 1$) converts the problem to real analysis with a bounded variable.
]

Let us see how this works with a concrete example.

*Example.* Find all real $x$ with $floor(2 x) = 2 floor(x) + 1$.

Write $x = n + theta$ where $n = floor(x)$ and $0 <= theta < 1$. Then $floor(2 x) = floor(2 n + 2 theta) = 2 n + floor(2 theta)$. The equation becomes $floor(2 theta) = 1$, which requires $1 <= 2 theta < 2$, i.e., $1/2 <= theta < 1$. So $x = n + theta$ with $n in ZZ$ and $theta in [1/2, 1)$: the solution set is $union.big_(n in ZZ) [n + 1/2, n + 1)$.

== Floor Function Identities

#theorem[
  For $x in RR$ and positive integer $n$:
  $ floor(floor(x) / n) = floor(x / n) $
]

#proof[
  Let $x = n q + r + theta$ where $q = floor(x\/n)$, $0 <= r < n$, $0 <= theta < 1$. Then $floor(x) = n q + r + floor(theta) = n q + r$ (wait, that's not right since $floor(x) = floor(n q + r + theta)$). More carefully: $floor(x) / n = (floor(x))/n$. Write $floor(x) = n k + j$ with $0 <= j < n$. Then $floor(floor(x)/n) = k$. Also $x = floor(x) + {x} = n k + j + {x}$, so $x / n = k + (j + {x})/n$ where $0 <= j + {x} < n + 1$. Since $j <= n - 1$ and ${x} < 1$, we have $j + {x} < n$, so $floor(x/n) = k$.
]

#theorem[
  For $x in RR$ and positive integer $n$:
  $ floor(x / n) = floor((x - r) / n) $ where $r$ is the remainder of $floor(x)$ divided by $n$.
]

#conceptbox(title: "Useful Floor Identities")[
  - $floor(x) + floor(x + 1/2) = floor(2 x)$.
  - $floor(x) + floor(y) <= floor(x + y) <= floor(x) + floor(y) + 1$.
  - For positive integer $n$: $sum_(k=0)^(n-1) floor(x + k/n) = floor(n x)$ (Hermite's identity, see below).
  - $floor(sqrt(n))^2 <= n$ and $(floor(sqrt(n)) + 1)^2 > n$.
]

#trickbox[
  When counting integers in an interval $[a, b]$: the count is $floor(b) - ceil(a) + 1$ (if the interval is nonempty). Equivalently, the number of integers in $(a, b)$ is $ceil(b) - floor(a) - 1$. Getting the $plus.minus 1$ wrong is the \#1 floor/ceiling error.
]

== Fractional Part

#definition[
  Recall ${x} = x - floor(x)$. Key properties:
  - $0 <= {x} < 1$ always.
  - ${x} = 0$ iff $x in ZZ$.
  - ${x + n} = {x}$ for $n in ZZ$ (periodicity).
  - ${-x} = 1 - {x}$ when $x in.not ZZ$, and ${-x} = 0$ when $x in ZZ$.
]

#conceptbox(title: "Fractional Part Identities")[
  - ${n x} != n {x}$ in general. Example: ${2 dot 0.7} = {1.4} = 0.4$ but $2{0.7} = 1.4$.
  - ${x} + {-x} = cases(0 & "if" x in ZZ, 1 & "otherwise")$.
  - ${x + y} = {{x} + {y}}$.
]

#trapbox[
  The fractional part is NOT linear: ${a + b} != {a} + {b}$ in general. For instance, ${0.7 + 0.8} = {1.5} = 0.5$ but ${0.7} + {0.8} = 1.5$. Always use ${x + y} = {{x} + {y}}$.
]

*Example.* Show that ${sqrt(2) + sqrt(3)} + {sqrt(2) - sqrt(3)} = 1$.

Since $sqrt(2) + sqrt(3) approx 3.146$ and $sqrt(2) - sqrt(3) approx -0.318$, we have ${sqrt(2) + sqrt(3)} approx 0.146$ and ${sqrt(2) - sqrt(3)} = {-0.318} approx 0.682$. These sum to $approx 0.828$... Let me recalculate. Actually $sqrt(2) approx 1.414$, $sqrt(3) approx 1.732$. Sum $approx 3.146$, difference $approx -0.318$. So ${3.146} = 0.146$ and ${-0.318} = 1 - 0.318 = 0.682$. Sum $= 0.828 != 1$. Instead, note $floor(sqrt(2) + sqrt(3)) + floor(sqrt(2) - sqrt(3)) = 3 + (-1) = 2$. And $(sqrt(2)+sqrt(3)) + (sqrt(2)-sqrt(3)) = 2 sqrt(2)$. So ${sqrt(2)+sqrt(3)} + {sqrt(2) - sqrt(3)} = 2 sqrt(2) - 2$. This is not $1$. The example illustrates that ${a} + {b} = a + b - floor(a) - floor(b)$, which equals ${a + b}$ or ${a + b} + 1$.

== Solving Equations with Floor/Ceiling

#stratbox[
  *Strategy for equations involving $floor(x)$:*
  + Write $x = n + theta$ where $n = floor(x) in ZZ$ and $0 <= theta < 1$.
  + Substitute into the equation, replacing all $floor(x)$ with $n$.
  + Solve for $n$ and $theta$ (often $n$ is determined first, then $theta$ is constrained).
  + Check that $theta in [0, 1)$ for each solution.
]

*Example.* Solve $x^2 - floor(x) = 3$.

Let $n = floor(x)$, so $n <= x < n + 1$. Then $x^2 = n + 3$, giving $x = plus.minus sqrt(n + 3)$. We need $n <= x < n + 1$, so $n <= sqrt(n + 3) < n + 1$ (taking the positive root first). Squaring: $n^2 <= n + 3$ and $n + 3 < (n+1)^2$. From $n^2 - n - 3 <= 0$: $n <= (1 + sqrt(13))/2 approx 2.30$, so $n <= 2$. From $n + 3 < n^2 + 2 n + 1$: $n^2 + n - 2 > 0$, $(n+2)(n-1) > 0$, so $n > 1$ or $n < -2$. Combining with $n >= 0$ (since $x > 0$ here): $n = 2$, giving $x = sqrt(5)$. Check: $floor(sqrt(5)) = 2$ and $5 - 2 = 3$ #sym.checkmark. For the negative root similarly: $n <= -sqrt(n+3) < n + 1$, requiring $n < 0$ and careful case analysis yields $n = -2$, $x = -1$. Check: $(-1)^2 - floor(-1) = 1 - (-1) = 2 != 3$. So $n = -2$ gives $x = -sqrt(1) = -1$, but $floor(-1) = -1 != -2$. No negative solution works here. The only solution is $x = sqrt(5)$.

#trickbox[
  For equations like $floor(x)^2 + x = k$ or $x floor(x) = k$, the substitution $x = n + theta$ always works. The key is that $n$ takes only finitely many possible integer values (bounded by the equation), making it a finite search.
]

== Hermite's Identity

#theorem[
  *Hermite's Identity.* For any real $x$ and positive integer $n$:
  $ floor(x) + floor(x + 1/n) + floor(x + 2/n) + dots.c + floor(x + (n-1)/n) = floor(n x) $
]

#proof[
  Write $x = m + alpha$ where $m = floor(x)$ and $0 <= alpha < 1$. The left side becomes $n m + sum_(k=0)^(n-1) floor(alpha + k\/n)$. Write $alpha = j\/n + beta$ where $j = floor(n alpha)$ and $0 <= beta < 1\/n$. Then $alpha + k\/n = (j + k)\/n + beta$. The term $floor(alpha + k\/n) = floor((j+k)\/n + beta)$. Since $0 <= beta < 1\/n$, this equals $floor((j+k)\/n)$, which is $1$ when $j + k >= n$ and $0$ otherwise. The number of $k in {0, 1, ..., n-1}$ with $j + k >= n$ is exactly $j$ (namely $k = n - j, n - j + 1, ..., n - 1$). So the sum is $j = floor(n alpha)$. The left side is $n m + floor(n alpha) = floor(n m + n alpha) = floor(n x)$.
]

#tldr[Hermite splits $floor(n x)$ into $n$ evenly-spaced floor evaluations. Powerful for counting lattice points and divisibility problems.]

#conceptbox(title: "Applications of Hermite's Identity")[
  - *Legendre's formula:* the exponent of prime $p$ in $n!$ is $sum_(k=1)^(infinity) floor(n / p^k)$.
  - *Counting multiples:* the number of multiples of $d$ in ${1, 2, ..., n}$ is $floor(n / d)$.
  - *Special case $n = 2$:* $floor(x) + floor(x + 1/2) = floor(2 x)$.
]

#remark[
  Hermite's identity is the key tool for proving divisibility results about binomial coefficients. For instance, $binom(2 n, n) = (2 n)!/(n!)^2$ is an integer because Legendre's formula shows each prime power in the denominator is at most that in the numerator.
]

== Problems

#drill-header("Floor, Ceiling, and Fractional Part")

#prob(1)[#difficulty(1) Find $floor(sqrt(1)) + floor(sqrt(2)) + floor(sqrt(3)) + dots.c + floor(sqrt(16))$.]
#hint(1)[$floor(sqrt(k)) = m$ when $m^2 <= k < (m+1)^2$.]
#hint(2)[Count how many $k in {1, ..., 16}$ have each floor value: $floor(sqrt(k)) = 1$ for $k = 1, 2, 3$; $= 2$ for $k = 4, ..., 8$; $= 3$ for $k = 9, ..., 15$; $= 4$ for $k = 16$.]
#hint(3)[Sum: $3 dot 1 + 5 dot 2 + 7 dot 3 + 1 dot 4$.]
#solution[$floor(sqrt(k)) = 1$ for $k in {1,2,3}$ (3 terms), $= 2$ for $k in {4,...,8}$ (5 terms), $= 3$ for $k in {9,...,15}$ (7 terms), $= 4$ for $k = 16$ (1 term). Sum $= 3(1) + 5(2) + 7(3) + 1(4) = 3 + 10 + 21 + 4 = bold(38)$.]

#prob(2)[#difficulty(1) Solve $floor(x) + floor(2 x) = 7$ for $x$.]
#hint(1)[Let $x = n + theta$ with $n = floor(x)$ and $0 <= theta < 1$.]
#hint(2)[$floor(2 x) = floor(2 n + 2 theta) = 2 n + floor(2 theta)$. So the equation is $3 n + floor(2 theta) = 7$.]
#hint(3)[$floor(2 theta) in {0, 1}$. If $floor(2 theta) = 0$ then $n = 7/3$ (not integer). If $floor(2 theta) = 1$ then $n = 2$ and $theta in [1/2, 1)$.]
#solution[With $x = n + theta$: $3 n + floor(2 theta) = 7$. Since $floor(2 theta) in {0,1}$: Case 1: $floor(2 theta) = 1$, $n = 2$, $theta in [1/2, 1)$. Case 2: $floor(2 theta) = 0$, $3 n = 7$, impossible ($n in ZZ$). So $bold("x in [5\/2, 3"))$.]

#prob(3)[#difficulty(1) Compute $floor(100 dot 5/7) + floor(100 dot 5/7 + 1/7) + floor(100 dot 5/7 + 2/7) + dots.c + floor(100 dot 5/7 + 6/7)$.]
#hint(1)[This looks like Hermite's identity with $n = 7$ and $x = 500/7$.]
#hint(2)[By Hermite: $sum_(k=0)^(6) floor(500/7 + k/7) = floor(7 dot 500/7) = floor(500) = 500$.]
#hint(3)[Done! Hermite does all the work.]
#solution[By Hermite's identity with $n = 7$ and $x = 500\/7$: $sum_(k=0)^(6) floor(500\/7 + k\/7) = floor(500) = bold(500)$.]

#prob(4)[#difficulty(2) Find the number of positive integers $n <= 1000$ such that $floor(sqrt(n))$ is even.]
#hint(1)[$floor(sqrt(n)) = m$ when $m^2 <= n < (m + 1)^2$. We need $m$ even.]
#hint(2)[The even values of $m$ with $m^2 <= 1000$ are $m = 0, 2, 4, ..., 30$ (since $31^2 = 961 <= 1000$ and $31$ is odd, $30^2 = 900$). Wait, $floor(sqrt(1000)) = 31$. The even values are $m = 2, 4, ..., 30$ (excluding $0$ since $n >= 1$).]
#hint(3)[For even $m$ from $2$ to $30$: each contributes $(m+1)^2 - m^2 = 2 m + 1$ values. For $m = 0$: $n$ from $1$ to $0$ (none, since $n >= 1$ and $0^2 <= n < 1$ means no positive $n$... actually $floor(sqrt(n)) = 0$ requires $0 <= n < 1$, no positive integer). But check $m = 31$: $floor(sqrt(n)) = 31$ (odd) for $n in {961, ..., 1000}$.]
#solution[For $m >= 1$, $floor(sqrt(n)) = m$ for $n in {m^2, m^2+1, ..., (m+1)^2 - 1}$, which is $2 m + 1$ values. For $m = 31$: $n in {961, ..., 1000}$, giving $40$ values. We need even $m$. Even $m$ from $2$ to $30$: $m = 2, 4, 6, ..., 30$ (15 values). Each gives $2 m + 1$ integers. Sum $= sum_(j=1)^(15)(2(2 j) + 1) = sum_(j=1)^(15)(4 j + 1) = 4 dot (15 dot 16)/2 + 15 = 480 + 15 = 495$. Also $m = 0$: no positive $n$. And $m = 31$ is odd. But we must check: does $m = 30$ extend to $(31)^2 - 1 = 960$? Yes, $n in {900, ..., 960}$, that's $61 = 2(30)+1$ values. Total: $bold("495")$.]

#prob(5)[#difficulty(2) Find all real $x$ satisfying $floor(x)^2 = floor(x^2)$ for $x in [0, 3)$.]
#hint(1)[Let $n = floor(x)$, so $x = n + theta$, $0 <= theta < 1$. The condition is $n^2 = floor(n^2 + 2 n theta + theta^2)$.]
#hint(2)[Since $floor(n^2 + 2 n theta + theta^2) = n^2 + floor(2 n theta + theta^2)$, we need $floor(2 n theta + theta^2) = 0$, i.e., $0 <= 2 n theta + theta^2 < 1$.]
#hint(3)[For $n = 0$: $theta^2 < 1$, always true, so $x in [0, 1)$. For $n = 1$: $2 theta + theta^2 < 1$, i.e., $(theta + 1)^2 < 2$, $theta < sqrt(2) - 1 approx 0.414$. For $n = 2$: $4 theta + theta^2 < 1$, $(theta + 2)^2 < 5$, $theta < sqrt(5) - 2 approx 0.236$.]
#solution[Need $2 n theta + theta^2 < 1$ with $0 <= theta < 1$ and $n = floor(x)$. For $n = 0$: $theta^2 < 1$, satisfied for all $theta in [0, 1)$. So $x in [0, 1)$. For $n = 1$: $theta < sqrt(2) - 1$. So $x in [1, sqrt(2))$. For $n = 2$: $theta < sqrt(5) - 2$. So $x in [2, sqrt(5))$. The solution is $bold("x in [0, sqrt(2")) union [2, sqrt(5)))$.]

#prob(6)[#difficulty(2) Prove that $floor(n / 2) + floor((n + 1) / 2) = n$ for every integer $n$.]
#hint(1)[Consider two cases: $n$ even and $n$ odd.]
#hint(2)[If $n = 2 k$: $floor(k) + floor(k + 1/2) = k + k = 2 k = n$.]
#hint(3)[If $n = 2 k + 1$: $floor(k + 1/2) + floor(k + 1) = k + k + 1 = 2 k + 1 = n$.]
#solution[*Case $n = 2 k$:* $floor(2 k\/2) + floor((2 k + 1)\/2) = k + floor(k + 1\/2) = k + k = 2 k$. *Case $n = 2 k + 1$:* $floor((2 k + 1)\/2) + floor((2 k + 2)\/2) = floor(k + 1\/2) + (k + 1) = k + k + 1 = 2 k + 1$. In both cases, the sum equals $n$. #sym.qed

Alternatively: this is Hermite's identity with $n = 2$: $floor(x) + floor(x + 1\/2) = floor(2 x)$. Set $x = n\/2$ where $n$ is an integer: $floor(n\/2) + floor(n\/2 + 1\/2) = floor(n) = n$. And $floor(n\/2 + 1\/2) = floor((n+1)\/2)$.]

#prob(7)[#difficulty(3) For a positive integer $n$, let $f(n) = floor(sqrt(n) + 1/2)$ (nearest integer to $sqrt(n)$, rounding halves up). Find the number of positive integers $n <= 1000$ for which $f(n) = f(n + 1)$.]
#hint(1)[$f(n) = m$ iff $|sqrt(n) - m| < 1/2$, i.e., $(m - 1/2)^2 <= n < (m + 1/2)^2$ (after adjusting for the rounding rule).]
#hint(2)[More precisely: $f(n) = m$ iff $m - 1/2 <= sqrt(n) < m + 1/2$, i.e., $m^2 - m + 1/4 <= n < m^2 + m + 1/4$. Since $n$ is an integer: $m^2 - m + 1 <= n <= m^2 + m$ (using ceiling/floor). That is $2 m$ consecutive integers.]
#hint(3)[$f(n) = f(n+1)$ iff $n$ and $n + 1$ give the same $m$, which happens unless $n$ is the last value in one block and $n + 1$ is the first of the next. The boundary is $n = m^2 + m$ and $n + 1 = m^2 + m + 1 = (m+1)^2 - m$. So $f(n) != f(n + 1)$ exactly when $n = m^2 + m = m(m+1)$ for some $m$.]
#solution[$f(n) = m$ for $n in {m^2 - m + 1, ..., m^2 + m}$ (exactly $2 m$ values). $f(n) != f(n+1)$ iff $n = m(m+1)$ for some positive integer $m$ (the transition points). We need $m(m+1) <= 999$ (so that both $n$ and $n+1$ are $<= 1000$). $m(m+1) <= 999$: $m = 31$ gives $31 dot 32 = 992 <= 999$ #sym.checkmark, $m = 32$ gives $32 dot 33 = 1056 > 999$. Also check $n = 1000$: $f(1000) = floor(sqrt(1000) + 1/2) = floor(31.62 + 0.5) = floor(32.12) = 32$, and $f(1001)$ is outside our range. So there are $31$ values of $n <= 999$ where $f(n) != f(n+1)$. Among $n in {1, ..., 999}$, the count where $f(n) = f(n+1)$ is $999 - 31 = 968$. But we also need $n = 1000$: $f(1000) = 32$ and $f(1001) = floor(sqrt(1001) + 0.5) = floor(32.14) = 32$, so $f(1000) = f(1001)$. But the problem asks for $n <= 1000$ where $f(n) = f(n+1)$ — $n = 1000$ counts too. Total: $bold("969")$.]

#prob(8)[#difficulty(3) Compute the sum $sum_(k=1)^(2025) floor(sqrt(k))$.]
#hint(1)[$floor(sqrt(k)) = m$ for $k = m^2, m^2 + 1, ..., (m+1)^2 - 1$. There are $2 m + 1$ such values.]
#hint(2)[Since $44^2 = 1936$ and $45^2 = 2025$, we have $floor(sqrt(k)) = m$ for $m = 1, ..., 43$ contributing $2 m + 1$ terms each, and $floor(sqrt(k)) = 44$ for $k = 1936, ..., 2025$, which is $90 = 2(44) + 2$ terms (includes $45^2$).]
#hint(3)[Sum $= sum_(m=1)^(43) m(2 m + 1) + 44 dot 90$. The first part is $sum_(m=1)^(43)(2 m^2 + m) = 2 dot (43 dot 44 dot 87)/6 + (43 dot 44)/2$.]
#solution[$floor(sqrt(k)) = m$ for $k in {m^2, ..., (m+1)^2 - 1}$: exactly $2 m + 1$ terms, each contributing $m$. For $m = 44$: $k in {1936, ..., 2025}$, that's $2025 - 1936 + 1 = 90$ terms.

$S = sum_(m=1)^(43) m(2 m + 1) + 44 dot 90 = 2 sum_(m=1)^(43) m^2 + sum_(m=1)^(43) m + 3960$

$sum_(m=1)^(43) m^2 = (43 dot 44 dot 87)/6 = (43 dot 44 dot 87)/6 = 43 dot 22 dot 29 = 27434$

$sum_(m=1)^(43) m = (43 dot 44)/2 = 946$

$S = 2(27434) + 946 + 3960 = 54868 + 946 + 3960 = bold(59774)$.]
