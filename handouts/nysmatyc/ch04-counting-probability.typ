// ════════════════════════════════════════════════════════════
// Chapter 4 — Counting & Probability Speed
// ════════════════════════════════════════════════════════════

= Counting & Probability Speed

Counting and probability appear on every NYSMATYC exam, usually 2--4 questions. The fastest solvers don't count — they use structure.

== Fundamental Counting Principle

#conceptbox(title: "Multiplication Principle")[
  If task 1 has $a$ outcomes and task 2 has $b$ outcomes (independent), then the combined number of outcomes is $a dot b$. Extends to any number of tasks.
]

#prob(1)[#difficulty(1) A restaurant offers 4 appetizers, 5 entrees, and 3 desserts. How many different three-course meals are possible?]
#mcq($12$, $30$, $60$, $120$, $240$)

#speedsolution("~5s")[$4 dot 5 dot 3 = 60$. *Answer: (C).*]

== Permutations vs. Combinations

#speedbox[
  *The one question to ask:* Does order matter?\
  - *Yes (arrangements, rankings, sequences):* Permutation $P(n, r) = n! / (n - r)!$\
  - *No (groups, teams, subsets):* Combination $C(n, r) = n! / (r!(n - r)!)$\
  If you're not sure, think: "Would swapping two selected items create a _different_ outcome?" If yes, permutation.
]

#prob(2)[#difficulty(1) How many ways can a committee of 3 be chosen from 8 people?]
#mcq($24$, $56$, $112$, $336$, $512$)

#speedsolution("~10s")[Order doesn't matter: $C(8, 3) = (8 dot 7 dot 6) / (3 dot 2 dot 1) = 56$. *Answer: (B).*]

#trickbox[
  *Speed computation for $C(n, r)$:* Write $r$ factors starting from $n$ downward in the numerator, divide by $r!$. Cancel as you multiply to keep numbers small. E.g., $C(8, 3) = 8 / 1 dot 7 / 2 dot 6 / 3 = 8 dot 3.5 dot 2 = 56$. Or: $(8 dot 7) / (2 dot 1) = 28$, then $28 dot 6 / 3 = 56$.
]

#prob(3)[#difficulty(2) How many 4-letter "words" (any arrangement) can be formed from the letters A, B, C, D, E with no repetition?]
#mcq($24$, $60$, $120$, $256$, $625$)

#speedsolution("~10s")[Order matters, no repetition: $P(5, 4) = 5 dot 4 dot 3 dot 2 = 120$. *Answer: (C).*]

== Complementary Counting

#speedbox[
  *The fastest counting technique on contests.* When a problem says "at least one," "not all the same," or any condition that's hard to count directly:\
  $"Count"("desired") = "Count"("total") - "Count"("undesired")$\
  The "total" is usually trivial. The "undesired" is usually much simpler than the "desired."
]

#prob(4)[#difficulty(2) A 4-digit PIN uses digits 0--9 (repetition allowed). How many PINs have at least one repeated digit?]
#mcq($3024$, $4960$, $5040$, $6976$, $7000$)

#speedsolution("~20s")[Total PINs: $10^4 = 10000$. PINs with _no_ repeats: $10 dot 9 dot 8 dot 7 = 5040$. At least one repeat: $10000 - 5040 = 4960$. *Answer: (B).*]

#trapbox[
  Trying to count PINs with "at least one repeat" directly means handling cases: exactly one pair, two pairs, a triple, a quadruple... That's a nightmare. Complement is instant.
]

== Probability Shortcuts

#conceptbox(title: "Key Probability Formulas")[
  - *Independent events:* $P(A and B) = P(A) dot P(B)$
  - *"At least one":* $P("at least one") = 1 - P("none")$
  - *Conditional:* $P(A | B) = P(A and B) / P(B)$
  - *Union:* $P(A or B) = P(A) + P(B) - P(A and B)$
]

#prob(5)[#difficulty(2) A fair die is rolled 3 times. What is the probability of getting at least one 6?]
#mcq($1 / 6$, $1 / 3$, $91 / 216$, $1 / 2$, $125 / 216$)

#speedsolution("~15s")[Complement: $P("no sixes") = (5 / 6)^3 = 125 / 216$. So $P("at least one 6") = 1 - 125 / 216 = 91 / 216$. *Answer: (C).*]

#solution[Direct approach: $P("exactly one") + P("exactly two") + P("exactly three") = C(3,1)(1 / 6)(5 / 6)^2 + C(3,2)(1 / 6)^2 (5 / 6) + (1 / 6)^3 = 75 / 216 + 15 / 216 + 1 / 216 = 91 / 216$. Same answer, triple the work.]

#prob(6)[#difficulty(2) Two cards are drawn without replacement from a standard 52-card deck. What is the probability that both are hearts?]
#mcq($1 / 16$, $1 / 17$, $12 / 204$, $13 / 204$, [$1 / 4$])

#speedsolution("~15s")[$P = 13 / 52 dot 12 / 51 = 156 / 2652 = 12 / 204$. Hmm, simplify: $156 / 2652 = 1 / 17$. *Answer: (B).*]

// VERIFY: 13/52 * 12/51 = (13*12)/(52*51) = 156/2652. GCD(156,2652): 156*17=2652. So 1/17. Confirmed.

== Stars and Bars & Inclusion-Exclusion

#conceptbox(title: "Stars and Bars")[
  The number of ways to distribute $n$ identical objects into $k$ distinct bins (each bin $gt.eq 0$):\
  $C(n + k - 1, k - 1)$\
  If each bin must have $gt.eq 1$: substitute $n' = n - k$ and use $C(n - 1, k - 1)$.
]

#prob(7)[#difficulty(3) How many non-negative integer solutions does $x + y + z = 10$ have?]
#mcq($45$, $55$, $66$, $78$, $100$)

#speedsolution("~10s")[Stars and bars: $C(10 + 3 - 1, 3 - 1) = C(12, 2) = 66$. *Answer: (C).*]

#prob(8)[#difficulty(3) How many integers from 1 to 100 are divisible by 2 or 3?]
#mcq($50$, $60$, $67$, $72$, $83$)

#speedsolution("~20s")[Inclusion-Exclusion: $|A union B| = |A| + |B| - |A inter B|$. Divisible by 2: $floor(100 / 2) = 50$. By 3: $floor(100 / 3) = 33$. By both (i.e., by 6): $floor(100 / 6) = 16$. Answer: $50 + 33 - 16 = 67$. *Answer: (C).*]

== Expected Value

#conceptbox(title: "Expected Value")[
  $E[X] = sum x_i dot P(x_i)$. For decisions under uncertainty: choose the option with the highest expected value.
]

#speedbox[
  *Contest application:* Expected value governs your guessing strategy (see Chapter 1). It also shows up directly in problems.
]

#prob(9)[#difficulty(2) A game costs \$2 to play. You roll a fair die: if you roll a 6, you win \$10; otherwise, you win nothing. What is the expected net gain per game?]
#mcq([$-$\$$4 / 3$], [$-$\$$1 / 3$], [\$$0$], [\$$1 / 3$], [\$$4 / 3$])

#speedsolution("~15s")[$E = 1 / 6 (10) + 5 / 6 (0) - 2 = 10 / 6 - 2 = 5 / 3 - 2 = -1 / 3$. Expected net loss of \$$1 / 3$. *Answer: (B).*]

#prob(10)[#difficulty(3) A bag contains 3 red, 4 blue, and 5 green marbles. Two marbles are drawn without replacement. What is the probability that they are different colors?]
#mcq($47 / 66$, $49 / 66$, $51 / 66$, $53 / 66$, $55 / 66$)

#speedsolution("~25s")[Complement: $P("same color") = (C(3,2) + C(4,2) + C(5,2)) / C(12,2) = (3 + 6 + 10) / 66 = 19 / 66$. So $P("different") = 1 - 19 / 66 = 47 / 66$. *Answer: (A).*]

#solution[Direct: count pairs (R,B) + (R,G) + (B,G) $= 3 dot 4 + 3 dot 5 + 4 dot 5 = 12 + 15 + 20 = 47$ out of $C(12,2) = 66$. Also fast here, but complement is more systematic.]

// VERIFY: C(3,2)+C(4,2)+C(5,2) = 3+6+10 = 19. C(12,2) = 66. 66-19=47. 47/66. Confirmed.

#tldr[Ask "does order matter?" to choose permutation vs. combination. Use complementary counting for "at least one" problems — it's almost always faster. For probability, $P("at least one") = 1 - P("none")$ is your best friend. Stars and bars handles distribution problems. Expected value governs both game theory problems and your own guessing strategy.]
