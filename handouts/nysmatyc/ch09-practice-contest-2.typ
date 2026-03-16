// Chapter 9: Practice Contest 2

= Practice Contest 2

#stratbox[
  *Simulated NYSMATYC Contest — 20 Questions, 60 Minutes*

  Scoring: +4 correct, --0.5 wrong, 0 blank. Calculators allowed.

  *Pacing guide:* Q1--Q7 in 10 min, Q8--Q14 in 20 min, Q15--Q20 in 25 min, 5 min review.

  This contest emphasizes different topic mixes than Practice Contest 1. Focus on trig, sequences, and probability.
]

== Quick Problems (Q1--Q7)

#prob(1)[#difficulty(1) Simplify: $sqrt(48) + sqrt(27) - sqrt(75)$.]

#mcq[$2 sqrt(3)$][$3 sqrt(3)$][$4 sqrt(3)$][$5 sqrt(3)$][$6 sqrt(3)$]

#speedsolution("30 sec")[$sqrt(48) = 4 sqrt(3)$, $sqrt(27) = 3 sqrt(3)$, $sqrt(75) = 5 sqrt(3)$. Sum $= (4 + 3 - 5) sqrt(3) = 2 sqrt(3)$. The answer is **(A)**.]

#prob(2)[#difficulty(1) If $f(x) = 3^x$, what is $f(x + 2) - 9 f(x)$?]

#mcq[$0$][$3^x$][$9$][$3^(x+2)$][$-3^x$]

#speedsolution("15 sec")[$f(x + 2) = 3^(x + 2) = 9 dot 3^x$ and $9 f(x) = 9 dot 3^x$. So $f(x + 2) - 9 f(x) = 0$. The answer is **(A)**.]

#prob(3)[#difficulty(1) A pizza is cut into $8$ equal slices. Three slices are taken. What fraction of the pizza remains?]

#mcq[$3/8$][$5/8$][$1/2$][$3/4$][$1/4$]

#speedsolution("10 sec")[$8 - 3 = 5$ slices remain, so $5/8$. The answer is **(B)**.]

#prob(4)[#difficulty(1) What is the value of $sum_(k=1)^(50) (2 k - 1)$?]

#mcq[$2500$][$2550$][$2450$][$2401$][$2601$]

#speedsolution("20 sec")[The sum of the first $n$ odd numbers is $n^2$. So $sum_(k=1)^(50)(2 k - 1) = 50^2 = 2500$. The answer is **(A)**.]

#prob(5)[#difficulty(1) If $|2 x - 5| = 9$, what is the product of all solutions for $x$?]

#mcq[$-14$][$-7$][$7$][$14$][$-2$]

#speedsolution("25 sec")[$2 x - 5 = 9$ gives $x = 7$. And $2 x - 5 = -9$ gives $x = -2$. Product: $7 times (-2) = -14$. The answer is **(A)**.]

#prob(6)[#difficulty(1) In a standard deck of $52$ cards, what is the probability of drawing a face card (J, Q, K)?]

#mcq[$1/13$][$3/13$][$1/4$][$3/52$][$4/13$]

#speedsolution("15 sec")[There are $12$ face cards in $52$: $P = 12/52 = 3/13$. The answer is **(B)**.]

#prob(7)[#difficulty(1) What is the slope of the line passing through $(3, -1)$ and $(-5, 7)$?]

#mcq[$-1$][$1$][$-3/4$][$3/4$][$-4/3$]

#speedsolution("15 sec")[Slope $= (7 - (-1))/(-5 - 3) = 8/(-8) = -1$. The answer is **(A)**.]

== Medium Problems (Q8--Q14)

#prob(8)[#difficulty(2) Find the value of $sin^2 (15 degree) + sin^2 (75 degree)$.]

#mcq[$1/2$][$1$][$sqrt(3)/2$][$3/2$][$2$]

#hint(1)[$sin(75 degree) = cos(15 degree)$ since $75 + 15 = 90$.]

#speedsolution("20 sec")[$sin(75 degree) = cos(15 degree)$. So $sin^2(15 degree) + sin^2(75 degree) = sin^2(15 degree) + cos^2(15 degree) = 1$. The answer is **(B)**.]

#prob(9)[#difficulty(2) The $5$th and $11$th terms of an arithmetic sequence are $20$ and $38$. Find the $20$th term.]

#mcq[$56$][$59$][$62$][$65$][$68$]

#hint(1)[$a_11 - a_5 = 6 d$, so $d = 18/6 = 3$.]

#speedsolution("45 sec")[$6 d = 38 - 20 = 18$, so $d = 3$. Then $a_5 = a_1 + 4 d$ gives $a_1 = 20 - 12 = 8$. So $a_(20) = 8 + 19 times 3 = 8 + 57 = 65$. The answer is **(D)**.]

#prob(10)[#difficulty(2) If $i = sqrt(-1)$, what is $(1 + i)^8$?]

#mcq[$-16$][$16$][$16 i$][$-16 i$][$256$]

#hint(1)[Compute $(1 + i)^2$ first, then raise to higher powers.]

#speedsolution("30 sec")[$(1 + i)^2 = 1 + 2 i + i^2 = 2 i$. Then $(1 + i)^4 = (2 i)^2 = -4$. And $(1 + i)^8 = (-4)^2 = 16$. The answer is **(B)**.]

#prob(11)[#difficulty(2) Three fair coins are flipped. What is the probability of getting more heads than tails?]

#mcq[$1/4$][$3/8$][$1/2$][$5/8$][$3/4$]

#hint(1)[More heads than tails means $2$ or $3$ heads out of $3$ flips.]

#speedsolution("40 sec")[$P(2 H) = binom(3, 2)/8 = 3/8$. $P(3 H) = 1/8$. Total $= 4/8 = 1/2$. The answer is **(C)**.]

#prob(12)[#difficulty(2) Find the positive value of $x$ satisfying $x^(log_10 x) = 100 x$.]

#mcq[$10$][$100$][$1000$][$10 sqrt(10)$][$10^(3/2)$]

#hint(1)[Take $log_(10)$ of both sides. Let $t = log_(10) x$.]

#speedsolution("75 sec")[Let $t = log_(10) x$. Taking $log_(10)$: $t dot t = 2 + t$, so $t^2 - t - 2 = 0$, $(t - 2)(t + 1) = 0$. Since $x > 0$, both $t = 2$ and $t = -1$ give valid $x$. Positive $x$: $t = 2$ gives $x = 100$, $t = -1$ gives $x = 1/10$. The positive value among choices is $x = 100$. The answer is **(B)**.]

#prob(13)[#difficulty(2) A circle has equation $x^2 + y^2 - 6 x + 8 y - 11 = 0$. What is its radius?]

#mcq[$4$][$5$][$6$][$7$][$8$]

#hint(1)[Complete the square for $x$ and $y$.]

#speedsolution("60 sec")[$(x^2 - 6 x + 9) + (y^2 + 8 y + 16) = 11 + 9 + 16 = 36$. So $(x - 3)^2 + (y + 4)^2 = 36$. Radius $= 6$. The answer is **(C)**.]

#prob(14)[#difficulty(2) If $tan theta = 3/4$ and $theta$ is in the first quadrant, find $sin(2 theta)$.]

#mcq[$12/25$][$24/25$][$7/25$][$3/5$][$4/5$]

#hint(1)[$sin(2 theta) = 2 sin theta cos theta$. From $tan theta = 3/4$, use the $3$-$4$-$5$ right triangle.]

#speedsolution("30 sec")[From $tan theta = 3/4$: $sin theta = 3/5$, $cos theta = 4/5$. So $sin(2 theta) = 2 dot 3/5 dot 4/5 = 24/25$. The answer is **(B)**.]

== Hard Problems (Q15--Q20)

#prob(15)[#difficulty(3) How many solutions does $sin x = x/10$ have for real $x$?]

#mcq[$3$][$5$][$7$][$9$][$11$]

#hint(1)[$sin x$ oscillates between $-1$ and $1$, while $x/10$ is a line through the origin with slope $1/10$.]

#speedsolution("2 min")[The line $y = x/10$ intersects $y = sin x$ when $|x/10| <= 1$, i.e., $|x| <= 10$. Since $10 > 3 pi approx 9.42$, the line crosses through just over $3$ full periods on each side. Sketch or count crossings: $x = 0$ is one. In $(0, pi)$: one crossing (line below sine, then above). In $(pi, 2 pi)$: one crossing (sine is negative, line still positive but crosses). In $(2 pi, 3 pi)$: one crossing. Near $3 pi approx 9.42$ to $10$: the line $x/10 approx 0.94$ to $1.0$ while $sin x$ starts at $0$ and reaches $1$ at... $sin(10) approx -0.54$, so the line is at $1.0$ and sine is at $-0.54$ — no crossing beyond $3 pi$. By symmetry, same count in negative $x$. Total: $1 + 2 times 3 = 7$. The answer is **(C)**.]

#prob(16)[#difficulty(3) Let $S = 1 + 1/2 + 1/3 + dots.c + 1/100$. What is $floor(S)$?]

#mcq[$3$][$4$][$5$][$6$][$7$]

#hint(1)[Use the approximation $H_n approx ln n + gamma$ where $gamma approx 0.5772$.]

#speedsolution("60 sec")[Calculator: $H_(100) = ln(100) + gamma + 1/(2 times 100) - dots.c approx 4.605 + 0.577 = 5.187$. So $floor(H_(100)) = 5$. The answer is **(C)**.]

#prob(17)[#difficulty(3) A $4 times 4$ grid of squares is colored with $2$ colors. How many distinct colorings have an even number of red squares in each row?]

#mcq[$256$][$4096$][$6561$][$65536$][$20736$]

#hint(1)[For each row of $4$ squares, count colorings with an even number of one color.]

#speedsolution("2 min")[In each row of $4$ squares, the number of colorings with an even number of red squares (0, 2, or 4): $binom(4, 0) + binom(4, 2) + binom(4, 4) = 1 + 6 + 1 = 8$. With $4$ independent rows: $8^4 = 4096$. The answer is **(B)**.]

#prob(18)[#difficulty(3) If $alpha$ and $beta$ are roots of $x^2 - 5 x + 3 = 0$, find $alpha^3 + beta^3$.]

#mcq[$80$][$90$][$95$][$100$][$110$]

#hint(1)[Use $alpha^3 + beta^3 = (alpha + beta)^3 - 3 alpha beta (alpha + beta)$.]

#speedsolution("30 sec")[By Vieta's: $alpha + beta = 5$, $alpha beta = 3$. Then $alpha^3 + beta^3 = (alpha + beta)^3 - 3 alpha beta (alpha + beta) = 125 - 45 = 80$. The answer is **(A)**.]

#prob(19)[#difficulty(3) The number $N = 2^4 times 3^3 times 5^2 times 7$ has how many positive divisors that are perfect squares?]

#mcq[$6$][$8$][$10$][$12$][$16$]

#hint(1)[A perfect square divisor $d = 2^a times 3^b times 5^c times 7^e$ requires all exponents even.]

#speedsolution("60 sec")[Even exponents: $a in {0, 2, 4}$ (3 choices), $b in {0, 2}$ (2 choices), $c in {0, 2}$ (2 choices), $e in {0}$ (1 choice). Total $= 3 times 2 times 2 times 1 = 12$. The answer is **(D)**.]

#prob(20)[#difficulty(3) Let $a, b, c$ be positive reals with $a + b + c = 12$ and $a^2 + b^2 + c^2 = 54$. Find the maximum possible value of $a$.]

#mcq[$5$][$6$][$7$][$8$][$9$]

#hint(1)[From the constraints, $b + c = 12 - a$ and $b^2 + c^2 = 54 - a^2$.]

#speedsolution("2.5 min")[We have $b + c = 12 - a$ and $b^2 + c^2 = 54 - a^2$. Now $b^2 + c^2 >= (b + c)^2 / 2$ by QM-AM, so $54 - a^2 >= (12 - a)^2/2$. This gives $108 - 2 a^2 >= 144 - 24 a + a^2$, so $3 a^2 - 24 a + 36 <= 0$, hence $a^2 - 8 a + 12 <= 0$, $(a - 2)(a - 6) <= 0$. So $2 <= a <= 6$. Maximum $a = 6$, achieved when $b = c = 3$. Check: $6 + 3 + 3 = 12$, $36 + 9 + 9 = 54$. The answer is **(B)**.]

#v(12pt)

#stratbox[
  *Scoring Analysis*

  After taking both practice contests, compare your results:
  - *Score $>= 60$:* Excellent — you're competitive at the national level.
  - *Score $50$--$59$:* Strong — focus on reducing careless errors in Q1--Q7.
  - *Score $40$--$49$:* Good foundation — drill the medium-difficulty topics.
  - *Score $< 40$:* Review the formula sheet and chapters 1--7 before retaking.

  *Common patterns in wrong answers:*
  + Arithmetic mistakes under time pressure (use your calculator!)
  + Not reading the question carefully ("product" vs. "sum", "at least" vs. "exactly")
  + Guessing on problems where zero choices were eliminated (costs $0.50$ per guess)
]
