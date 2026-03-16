// ════════════════════════════════════════════════════════════
// Chapter 2 — Algebra Speed Techniques
// ════════════════════════════════════════════════════════════

= Algebra Speed Techniques

Algebra problems are the backbone of NYSMATYC — roughly half the contest. The speed methods here will save you the most cumulative time.

== Solving Equations: Back-Solve First

When answer choices are numbers, *plug them in* before doing any algebra. Start with the middle value (C).

#speedbox[
  *Back-solve protocol:*
  1. Read the equation. Read the five choices.
  2. Plug in choice (C). If it works, done.
  3. If (C) is too big, try (A) or (B). If too small, try (D) or (E).
  4. Average time: 30--45 seconds.
]

#prob(1)[#difficulty(1) If $3 x + 7 = 22$, what is $x$?]
#mcq($3$, $4$, $5$, $6$, $7$)

#speedsolution("~10s")[Plug in (C): $3(5) + 7 = 22$. Yes. *Answer: (C).*]

#prob(2)[#difficulty(2) If $x^2 - 5 x + 6 = 0$, what is the sum of the solutions?]
#mcq($-6$, $-5$, $5$, $6$, $11$)

#speedsolution("~10s")[Vieta's: sum of roots $= -(-5) / 1 = 5$. *Answer: (C).*]

#solution[Factor: $(x - 2)(x - 3) = 0$, so $x = 2$ or $x = 3$. Sum $= 2 + 3 = 5$. Correct but slower.]

== Systems of Equations: Add/Subtract Trick

#speedbox[
  Before substituting, *look at what happens if you add or subtract the equations*. Often the combination directly gives the quantity the problem asks for.
]

#prob(3)[#difficulty(1) If $2 x + 3 y = 13$ and $4 x - 3 y = 5$, what is $x$?]
#mcq($1$, $2$, $3$, $4$, $5$)

#speedsolution("~15s")[Add the equations: $6 x = 18$, so $x = 3$. *Answer: (C).*]

#solution[From equation 1: $y = (13 - 2 x) / 3$. Substitute into equation 2: $4 x - 3 dot (13 - 2 x) / 3 = 5$. Simplify: $4 x - 13 + 2 x = 5$, so $6 x = 18$, $x = 3$. Much slower.]

#prob(4)[#difficulty(2) If $a + b = 10$ and $a b = 21$, what is $a^2 + b^2$?]
#mcq($37$, $42$, $58$, $79$, $100$)

#speedsolution("~15s")[$(a + b)^2 = a^2 + 2 a b + b^2$, so $a^2 + b^2 = (a + b)^2 - 2 a b = 100 - 42 = 58$. *Answer: (C).*]

#trapbox[
  Do *not* solve for $a$ and $b$ individually. The problem gives you $a + b$ and $a b$ — use them directly via the identity. Solving the quadratic wastes 90 seconds.
]

== Quadratics: Discriminant Shortcut

#conceptbox(title: "Discriminant Quick Reference")[
  For $a x^2 + b x + c = 0$: $Delta = b^2 - 4 a c$.\
  $Delta > 0$: two real roots. $Delta = 0$: one repeated root. $Delta < 0$: no real roots.\
  *Number of real roots* questions: compute $Delta$ only. Don't solve.
]

#prob(5)[#difficulty(2) How many real solutions does $2 x^2 - 3 x + 5 = 0$ have?]
#mcq($0$, $1$, $2$, $3$, [cannot determine])

#speedsolution("~15s")[$Delta = 9 - 40 = -31 < 0$. Zero real solutions. *Answer: (A).*]

== Polynomials: Remainder Theorem

#speedbox[
  *To find the remainder when $P(x)$ is divided by $(x - c)$:* just compute $P(c)$. No long division needed.
]

#prob(6)[#difficulty(2) What is the remainder when $x^3 - 2 x^2 + 3 x - 4$ is divided by $(x - 2)$?]
#mcq($-2$, $0$, $2$, $4$, $6$)

#speedsolution("~20s")[Plug in $x = 2$: $8 - 8 + 6 - 4 = 2$. *Answer: (C).*]

#solution[Perform polynomial long division of $x^3 - 2 x^2 + 3 x - 4$ by $(x - 2)$. After three steps you get quotient $x^2 + 3$ with remainder $2$. Same answer, 3x the time.]

== Rational Expressions: Undefined Values

#trickbox[
  "For what value of $x$ is the expression undefined?" means *set the denominator equal to zero* and solve. Ignore the numerator entirely.
]

#prob(7)[#difficulty(1) For what value of $x$ is $display((x + 3) / (x^2 - 9))$ undefined but the numerator is nonzero?]
#mcq($-3$, $0$, $3$, $6$, $9$)

#speedsolution("~15s")[Denominator $= (x - 3)(x + 3) = 0$ gives $x = 3$ or $x = -3$. At $x = -3$ the numerator is $0$ too (removable). At $x = 3$ the numerator is $6 eq.not 0$. *Answer: (C).*]

== Word Problems: Set Up, Then Back-Solve

#speedbox[
  For rate/work/mixture problems: translate the problem into one equation, then *plug answer choices* into that equation instead of solving algebraically.
]

#prob(8)[#difficulty(2) Pipe A fills a tank in 6 hours. Pipe B fills it in 4 hours. Working together, how many hours to fill the tank?]
#mcq($12 / 5$, $5 / 2$, $10 / 3$, $5$, $10$)

#speedsolution("~25s")[Combined rate $= 1 / 6 + 1 / 4 = 2 / 12 + 3 / 12 = 5 / 12$ tanks per hour. Time $= 12 / 5$ hours. *Answer: (A).*]

#prob(9)[#difficulty(3) A train travels from city A to city B at 60 mph, then returns at 40 mph. What is the average speed for the entire round trip?]
#mcq($45$, $48$, $50$, $52$, $55$)

#speedsolution("~20s")[Harmonic mean: $2(60)(40) / (60 + 40) = 4800 / 100 = 48$ mph. *Answer: (B).*]

#trapbox[
  The average speed is *not* $(60 + 40) / 2 = 50$. That's the arithmetic mean of speeds, which only works when you travel *equal times*, not *equal distances*. This trap appears on nearly every NYSMATYC exam.
]

#solution[Let distance $= d$. Time there $= d / 60$. Time back $= d / 40$. Total time $= d / 60 + d / 40 = d(2 + 3) / 120 = 5 d / 120$. Average speed $= 2 d / (5 d / 120) = 240 / 5 = 48$.]

== Speed Drill — Algebra

#drill-header("Algebra Speed Round")

#prob(10)[#difficulty(3) If $f(x) = x^3 - 6 x^2 + 11 x - 6$ and $f(a) = 0$, $f(b) = 0$, $f(c) = 0$ with $a < b < c$, what is $a^2 + b^2 + c^2$?]
#mcq($10$, $14$, $18$, $24$, $36$)

#speedsolution("~25s")[Vieta's: $a + b + c = 6$, $a b + a c + b c = 11$. Then $a^2 + b^2 + c^2 = (a + b + c)^2 - 2(a b + a c + b c) = 36 - 22 = 14$. *Answer: (B).*]

#tldr[Back-solve from choices whenever possible. Use Vieta's for sum/product questions. Add/subtract systems before substituting. Remainder Theorem beats long division every time. For rate problems, use the harmonic mean formula.]
