// Chapter 8: Practice Contest 1

= Practice Contest 1

#stratbox[
  *Simulated NYSMATYC Contest — 20 Questions, 60 Minutes*

  Scoring: +4 correct, --0.5 wrong, 0 blank. Calculators allowed.

  *Pacing guide:* Q1--Q7 in 10 min, Q8--Q14 in 20 min, Q15--Q20 in 25 min, 5 min review.

  Do NOT guess blindly (EV = --0.30). Guess only if you eliminate $>= 2$ choices.
]

== Quick Problems (Q1--Q7)

#prob(1)[#difficulty(1) If $3 x - 7 = 20$, what is the value of $6 x - 14$?]

#mcq[$34$][$40$][$46$][$54$][$60$]

#speedsolution("15 sec")[Notice $6 x - 14 = 2(3 x - 7) = 2 dot 20 = 40$. No need to solve for $x$. The answer is **(B)**.]

#prob(2)[#difficulty(1) What is the sum of the digits of $10^(2025) - 37$?]

#mcq[$18207$][$18213$][$18216$][$18219$][$18225$]

#speedsolution("45 sec")[$10^(2025)$ is a $1$ followed by $2025$ zeros. Subtracting $37$: the last two digits become $6, 3$ and the preceding $2023$ digits are all $9$. Digit sum $= 9 times 2023 + 6 + 3 = 18207 + 9 = 18216$. The answer is **(C)**.]

#prob(3)[#difficulty(1) A rectangle has perimeter $40$ and area $84$. What is the length of its diagonal?]

#mcq[$2 sqrt(29)$][$2 sqrt(41)$][$2 sqrt(58)$][$4 sqrt(13)$][$2 sqrt(53)$]

#speedsolution("40 sec")[Let sides be $l, w$. Then $l + w = 20$ and $l w = 84$. Diagonal $= sqrt(l^2 + w^2) = sqrt((l + w)^2 - 2 l w) = sqrt(400 - 168) = sqrt(232) = 2 sqrt(58)$. The answer is **(C)**.]

#prob(4)[#difficulty(1) How many three-digit positive integers are divisible by $7$ but not by $3$?]

#mcq[$76$][$85$][$88$][$90$][$128$]

#speedsolution("90 sec")[Three-digit multiples of $7$: from $7 times 15 = 105$ to $7 times 142 = 994$, giving $142 - 15 + 1 = 128$. Three-digit multiples of $21$: from $21 times 5 = 105$ to $21 times 47 = 987$, giving $47 - 5 + 1 = 43$. Divisible by $7$ but not $3$: $128 - 43 = 85$. The answer is **(B)**.]

#prob(5)[#difficulty(1) If $f(x) = 2 x + 1$ and $g(x) = x^2 - 3$, what is $f(g(3))$?]

#mcq[$11$][$13$][$15$][$17$][$19$]

#speedsolution("20 sec")[$g(3) = 9 - 3 = 6$. Then $f(6) = 12 + 1 = 13$. The answer is **(B)**.]

#prob(6)[#difficulty(1) A bag contains $5$ red and $3$ blue marbles. Two marbles are drawn without replacement. What is the probability both are red?]

#mcq[$5/14$][$25/64$][$5/16$][$1/4$][$5/28$]

#speedsolution("30 sec")[$P = 5/8 times 4/7 = 20/56 = 5/14$. The answer is **(A)**.]

#prob(7)[#difficulty(1) What is the remainder when $2^(100)$ is divided by $7$?]

#mcq[$1$][$2$][$3$][$4$][$5$]

#speedsolution("40 sec")[Powers of $2 mod 7$: $2^1 = 2$, $2^2 = 4$, $2^3 = 1$. The cycle length is $3$. Since $100 = 33 times 3 + 1$, we have $2^(100) equiv 2^1 equiv 2 mod 7$. The answer is **(B)**.]

== Medium Problems (Q8--Q14)

#prob(8)[#difficulty(2) If $log_2 x + log_4 x + log_8 x = 11$, find $x$.]

#mcq[$16$][$32$][$64$][$128$][$256$]

#hint(1)[Convert all logs to base $2$ using $log_(2^k) x = (log_2 x) / k$.]

#speedsolution("90 sec")[Let $t = log_2 x$. Then $log_4 x = t/2$ and $log_8 x = t/3$. So $t + t/2 + t/3 = 11$, giving $t(6 + 3 + 2)/6 = 11$, so $11 t / 6 = 11$, $t = 6$. Thus $x = 2^6 = 64$. The answer is **(C)**.]

#prob(9)[#difficulty(2) In triangle $A B C$, $a = 7$, $b = 8$, and $c = 9$. Find $cos A$.]

#mcq[$1/3$][$2/3$][$11/18$][$2/7$][$3/4$]

#hint(1)[Use the law of cosines: $a^2 = b^2 + c^2 - 2 b c cos A$.]

#speedsolution("60 sec")[Law of cosines: $49 = 64 + 81 - 144 cos A$, so $144 cos A = 96$, giving $cos A = 96/144 = 2/3$. The answer is **(B)**.]

#prob(10)[#difficulty(2) How many ways can $5$ distinct books be arranged on a shelf if two specific books must not be adjacent?]

#mcq[$48$][$60$][$72$][$84$][$96$]

#hint(1)[Total arrangements minus arrangements where the two books ARE adjacent.]

#speedsolution("60 sec")[Total: $5! = 120$. Adjacent: treat the two as one unit, so $4!$ arrangements $times 2!$ internal orders $= 48$. Answer: $120 - 48 = 72$. The answer is **(C)**.]

#prob(11)[#difficulty(2) If $sin theta + cos theta = 7/5$ and $0 < theta < pi / 2$, find $sin theta cos theta$.]

#mcq[$7/25$][$12/25$][$24/50$][$24/25$][$7/50$]

#hint(1)[Square both sides of $sin theta + cos theta = 7/5$.]

#speedsolution("45 sec")[$(sin theta + cos theta)^2 = 49/25$. Expand: $1 + 2 sin theta cos theta = 49/25$, so $sin theta cos theta = (49/25 - 1)/2 = (24/25)/2 = 12/25$. The answer is **(B)**.]

#prob(12)[#difficulty(2) What is the sum of all positive integer divisors of $360$?]

#mcq[$1080$][$1170$][$1260$][$1350$][$1440$]

#hint(1)[Use the divisor sum formula: if $n = p_1^(a_1) dots.c p_k^(a_k)$, then $sigma(n) = product (1 + p_i + dots.c + p_i^(a_i))$.]

#speedsolution("90 sec")[$360 = 2^3 times 3^2 times 5$. Divisor sum $= (1 + 2 + 4 + 8)(1 + 3 + 9)(1 + 5) = 15 times 13 times 6 = 1170$. The answer is **(B)**.]

#prob(13)[#difficulty(2) The system $x + y = 5$ and $x y = k$ has two positive real solutions. What is the range of $k$?]

#mcq[$0 < k < 25/4$][$0 < k <= 25/4$][$0 < k < 25$][$k < 25/4$][$0 <= k <= 25/4$]

#hint(1)[$x$ and $y$ are roots of $t^2 - 5 t + k = 0$. Need discriminant $>= 0$ and both roots positive.]

#speedsolution("75 sec")[$x, y$ are roots of $t^2 - 5 t + k = 0$. Discriminant $= 25 - 4 k >= 0$ gives $k <= 25/4$. Both roots positive: sum $= 5 > 0$ (OK) and product $= k > 0$. For two distinct positive reals: $0 < k < 25/4$. At $k = 25/4$ both roots equal $5/2$ (one solution, not two). The answer is **(A)**.]

#prob(14)[#difficulty(2) A geometric sequence has first term $a_1 = 3$ and common ratio $r = -2$. What is $sum_(k=1)^(8) a_k$?]

#mcq[$-127$][$-255$][$127$][$255$][$-510$]

#hint(1)[Use $S_n = a_1(1 - r^n)/(1 - r)$.]

#speedsolution("45 sec")[$S_8 = 3(1 - (-2)^8)/(1 - (-2)) = 3(1 - 256)/3 = -255$. The answer is **(B)**.]

== Hard Problems (Q15--Q20)

#prob(15)[#difficulty(3) Let $P(x) = x^3 - 6 x^2 + 11 x - 5$. If $r, s, t$ are the roots of $P$, compute $r^2 + s^2 + t^2$.]

#mcq[$12$][$14$][$16$][$18$][$20$]

#hint(1)[By Vieta's: $r + s + t = 6$, $r s + r t + s t = 11$.]

#speedsolution("30 sec")[$r^2 + s^2 + t^2 = (r + s + t)^2 - 2(r s + r t + s t) = 36 - 22 = 14$. The answer is **(B)**.]

#prob(16)[#difficulty(3) How many integers $n$ with $1 <= n <= 1000$ satisfy $n^2 equiv 1 mod 24$?]

#mcq[$125$][$166$][$167$][$250$][$333$]

#hint(1)[$n^2 equiv 1 mod 24$ means $24 | (n - 1)(n + 1)$. Factor $24 = 8 times 3$.]

#speedsolution("2 min")[$n$ must be odd (else $n^2 equiv 0$ or $4 mod 8$). For odd $n$, $n^2 equiv 1 mod 8$ always. Need $n^2 equiv 1 mod 3$, so $n equiv.not 0 mod 3$. Odd $n$ in $[1, 1000]$: $500$ values. Remove those divisible by $3$: odd multiples of $3$ in $[1, 1000]$ are $3, 9, 15, ..., 999$, i.e., $3(2 k - 1)$ for $k = 1, ..., 167$. So answer $= 500 - 167 = 333$. The answer is **(E)**.]

#prob(17)[#difficulty(3) In a triangle with sides $a = 5$, $b = 7$, and included angle $C = 60 degree$, find the area.]

#mcq[$(35 sqrt(3))/4$][$35/4$][$35/2$][$35 sqrt(3)$][$35$]

#hint(1)[Area $= 1/2 dot a b sin C$.]

#speedsolution("20 sec")[Area $= 1/2 dot 5 dot 7 dot sin 60 degree = 35/2 dot sqrt(3)/2 = (35 sqrt(3))/4$. The answer is **(A)**.]

#prob(18)[#difficulty(3) The polynomial $x^4 + 4 x^3 + 6 x^2 + 4 x + 1$ can be written as $(x + a)^n$. What is $a + n$?]

#mcq[$3$][$4$][$5$][$6$][$7$]

#hint(1)[Recognize Pascal's triangle: $1, 4, 6, 4, 1$ are the binomial coefficients $binom(4, k)$.]

#speedsolution("20 sec")[The coefficients $1, 4, 6, 4, 1$ match $binom(4, 0), binom(4, 1), ..., binom(4, 4)$. So $x^4 + 4 x^3 + 6 x^2 + 4 x + 1 = (x + 1)^4$. Thus $a = 1$, $n = 4$, and $a + n = 5$. The answer is **(C)**.]

#prob(19)[#difficulty(3) A committee of $5$ people is to be chosen from $6$ men and $4$ women. If the committee must contain at least $2$ women, how many ways can this be done?]

#mcq[$120$][$126$][$186$][$210$][$246$]

#hint(1)[Use complementary counting: total minus (0 women) minus (1 woman).]

#speedsolution("90 sec")[Total: $binom(10, 5) = 252$. Zero women: $binom(6, 5) = 6$. Exactly $1$ woman: $binom(4, 1) binom(6, 4) = 4 times 15 = 60$. At least $2$ women: $252 - 6 - 60 = 186$. The answer is **(C)**.]

#prob(20)[#difficulty(3) Define $f(x) = x^2 - 4 x + 3$. For how many real values of $c$ does $f(f(c)) = 3$?]

#mcq[$2$][$3$][$4$][$5$][$6$]

#hint(1)[First solve $f(t) = 3$, i.e., $t^2 - 4 t = 0$, so $t = 0$ or $t = 4$.]

#speedsolution("2 min")[$f(t) = 3$ gives $t^2 - 4 t + 3 = 3$, so $t^2 - 4 t = 0$, hence $t = 0$ or $t = 4$. Now solve $f(c) = 0$: $c^2 - 4 c + 3 = 0$ gives $c = 1$ or $c = 3$. And $f(c) = 4$: $c^2 - 4 c + 3 = 4$ gives $c^2 - 4 c - 1 = 0$, so $c = 2 plus.minus sqrt(5)$ (two real solutions). Total distinct values: $1, 3, 2 + sqrt(5), 2 - sqrt(5)$ — that's $4$ values. The answer is **(C)**.]

#v(12pt)

#stratbox[
  *After the Contest: Self-Assessment*
  - Count how many Q1--Q7 you answered in under 10 minutes. Target: all 7.
  - Did you skip and return to any problem? Good strategy if so.
  - For each wrong answer: was it a careless error or a knowledge gap?
  - Score yourself: $4 times ("correct") - 0.5 times ("wrong")$. Target: $>= 50$ out of $80$.
]
