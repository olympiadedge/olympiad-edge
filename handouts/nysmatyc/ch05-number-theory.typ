// ════════════════════════════════════════════════════════════
// Chapter 5 — Number Theory Speed
// ════════════════════════════════════════════════════════════

= Number Theory Speed

#tldr[Number theory on NYSMATYC is about fast mental checks — divisibility rules, last-digit tricks, and modular arithmetic. Rarely do you need heavy machinery.]

== Divisibility Rules (2–11)

These must be instant. No thinking, no hesitation.

#speedbox[
  - *2:* Last digit even.
  - *3:* Digit sum divisible by 3.
  - *4:* Last two digits form a multiple of 4.
  - *5:* Last digit 0 or 5.
  - *6:* Divisible by both 2 and 3.
  - *7:* Double the last digit, subtract from the rest. Repeat. (Slower — use calculator if available.)
  - *8:* Last three digits form a multiple of 8.
  - *9:* Digit sum divisible by 9.
  - *10:* Last digit 0.
  - *11:* Alternating digit sum divisible by 11 (i.e., $d_1 - d_2 + d_3 - d_4 + dots.c$).
]

#trickbox[For divisibility by 11, the alternating sum can be negative — that's fine. $918082$: $9 - 1 + 8 - 0 + 8 - 2 = 22$, which is divisible by 11.]

#trapbox[The rule for 4 uses the *last two* digits, not the digit sum. $124$ is divisible by 4 because $24 / 4 = 6$, even though $1 + 2 + 4 = 7$ is not divisible by 4.]

== Prime Factorization Shortcuts

#speedbox[
  *On a calculator-allowed test, trial division is fast enough.* Divide by 2, 3, 5, 7, 11, 13... up to $sqrt(n)$. For $n < 1000$, you only need primes up to 31.
]

Key factorizations to have memorized:

#conceptbox(title: "Useful Factorizations")[
  $2^10 = 1024 approx 10^3$ #h(2em) $3^5 = 243$ #h(2em) $7 dot 11 dot 13 = 1001$\
  $99 = 9 dot 11$ #h(2em) $999 = 27 dot 37$ #h(2em) $101$ is prime\
  $111 = 3 dot 37$ #h(2em) $1001 = 7 dot 11 dot 13$ #h(2em) $10! = 2^8 dot 3^4 dot 5^2 dot 7$
]

#trickbox[*Factoring near-round numbers.* To factor 997: it's $1000 - 3$. Check if prime by testing divisors up to $sqrt(997) approx 31.6$. None work, so 997 is prime. To factor 1023: $1024 - 1 = 2^10 - 1 = 3 dot 341 = 3 dot 11 dot 31$.]

== GCD and LCM — Fast Methods

#definition("GCD and LCM")[
  $gcd(a, b)$ is the largest positive integer dividing both $a$ and $b$.\
  $"lcm"(a, b)$ is the smallest positive integer that both $a$ and $b$ divide.
]

#speedbox[
  *The identity:* $gcd(a, b) dot "lcm"(a, b) = a dot b$. So $"lcm"(a, b) = (a dot b) / gcd(a, b)$.

  *For GCD:* Use the Euclidean algorithm mentally. Example: $gcd(84, 36)$: $84 = 2 dot 36 + 12$, then $gcd(36, 12) = 12$. Done.

  *For LCM:* $"lcm"(84, 36) = (84 dot 36) / 12 = 252$.
]

#trickbox[*"GCD + LCM" problems.* If a problem gives you $gcd(a, b) = d$ and $"lcm"(a, b) = m$, then $a b = d m$. Write $a = d x$, $b = d y$ where $gcd(x, y) = 1$ and $x y = m / d$. This parameterization handles most NYSMATYC GCD/LCM problems.]

== Modular Arithmetic for Speed

=== Last-Digit Problems

#speedbox[
  The last digit of $n^k$ depends only on the last digit of $n$ and on $k mod "cycle length"$.

  *Cycles of last digits:*
  - Powers of 2: $2, 4, 8, 6, 2, 4, 8, 6, dots$ (cycle 4)
  - Powers of 3: $3, 9, 7, 1, 3, 9, 7, 1, dots$ (cycle 4)
  - Powers of 7: $7, 9, 3, 1, 7, 9, 3, 1, dots$ (cycle 4)
  - Powers of 4: $4, 6, 4, 6, dots$ (cycle 2)
  - Powers ending in 0, 1, 5, 6: last digit never changes.
]

=== Remainders

#conceptbox(title: "Mod Arithmetic Rules")[
  $(a + b) mod n = ((a mod n) + (b mod n)) mod n$\
  $(a dot b) mod n = ((a mod n) dot (b mod n)) mod n$\
  $a^k mod n$: reduce $a mod n$ first, then use repeated squaring or cycle detection.
]

#trickbox[*Remainder when dividing by 9:* it's just the digit sum mod 9. This is called *casting out nines* and is the fastest remainder trick on the test.]

== Digit Problems

#speedbox[
  *A two-digit number* with tens digit $a$ and units digit $b$ equals $10 a + b$.\
  *A three-digit number* $overline(a b c) = 100 a + 10 b + c$.\
  "Reverse the digits" of $overline(a b) = 10 a + b$ gives $10 b + a$. Their difference is $9(a - b)$.
]

#trickbox[*Sum/difference of a number and its reverse.* $overline(a b) + overline(b a) = 11(a + b)$. So the sum is always divisible by 11. $overline(a b) - overline(b a) = 9(a - b)$. So the difference is always divisible by 9.]

== Diophantine Equations

#speedbox[
  *Strategy for integer-solution problems:*
  1. Reduce mod small numbers to eliminate impossible cases.
  2. Factor if possible (e.g., $x y - 2 x + 3 y = 10$ can be rewritten via SFFT).
  3. Bound variables: if $x, y > 0$ and $x + y = 20$, try small values.
  4. On MC tests: *back-solve from the answer choices.* This is almost always fastest.
]

#trickbox[*Simon's Favorite Factoring Trick (SFFT).* Rewrite $x y + a x + b y + c = 0$ as $(x + b)(y + a) = a b - c$. This converts a Diophantine equation into a factoring problem.]

#stratbox[
  *NYSMATYC Number Theory Decision Tree:*
  - Divisibility question → use divisibility rules or mod arithmetic
  - "Last digit" or "units digit" → power cycle mod 10
  - GCD/LCM → Euclidean algorithm + $gcd dot "lcm" = a b$
  - "How many integers satisfy..." → modular constraints to narrow, then count
  - Integer solutions → back-solve from choices or SFFT
]

== Speed Drill — Number Theory

#drill-header[Number Theory]

#prob(1)[#difficulty(1) What is the remainder when $2^{100}$ is divided by 7?]
#mcq[$1$][$2$][$3$][$4$][$6$]

#speedsolution("30s")[Powers of 2 mod 7: $2, 4, 1, 2, 4, 1, dots$ — cycle length 3. Since $100 = 33 dot 3 + 1$, we get $2^100 equiv 2^1 equiv bold(2) mod 7$. Answer: *(B)*.]

#prob(2)[#difficulty(1) What is the units digit of $7^{2025}$?]
#mcq[$1$][$3$][$7$][$9$][$5$]

#speedsolution("15s")[Powers of 7 cycle: $7, 9, 3, 1$ with period 4. $2025 mod 4 = 1$, so last digit is $bold(7)$. Answer: *(C)*.]

#prob(3)[#difficulty(1) If $gcd(a, b) = 12$ and $"lcm"(a, b) = 360$, what is $a b$?]
#mcq[$4320$][$3600$][$2880$][$1440$][$720$]

#speedsolution("10s")[Use $a b = gcd(a, b) dot "lcm"(a, b) = 12 dot 360 = bold(4320)$. Answer: *(A)*.]

#prob(4)[#difficulty(1) A two-digit number is 4 times the sum of its digits. How many such numbers exist?]
#mcq[$0$][$1$][$2$][$3$][$4$]

#speedsolution("45s")[Let the number be $10 a + b$. Then $10 a + b = 4(a + b)$, so $6 a = 3 b$, i.e., $b = 2 a$. With $1 <= a <= 9$ and $0 <= b <= 9$: $a$ can be $1, 2, 3, 4$ giving $12, 24, 36, 48$. That's $bold(4)$ numbers. Answer: *(E)*.]

#prob(5)[#difficulty(2) What is the remainder when $1! + 2! + 3! + dots.c + 100!$ is divided by 15?]
#mcq[$3$][$4$][$8$][$13$][$0$]

#speedsolution("30s")[For $n >= 5$, $n!$ is divisible by 15 (since $n!$ contains factors 3 and 5). So only $1! + 2! + 3! + 4! = 1 + 2 + 6 + 24 = 33$ matters. $33 mod 15 = bold(3)$. Answer: *(A)*.]

#prob(6)[#difficulty(2) How many positive divisors does $2^3 dot 3^2 dot 5$ have?]
#mcq[$12$][$18$][$24$][$30$][$48$]

#speedsolution("10s")[Number of divisors $= (3 + 1)(2 + 1)(1 + 1) = 4 dot 3 dot 2 = bold(24)$. Answer: *(C)*.]

#prob(7)[#difficulty(2) Find the largest prime factor of $99^2 - 1$.]
#mcq[$7$][$11$][$49$][$97$][$101$]

#speedsolution("20s")[Factor: $99^2 - 1 = (99 - 1)(99 + 1) = 98 dot 100 = 2 dot 49 dot 4 dot 25 = 2^3 dot 5^2 dot 7^2$. Largest prime factor is $bold(7)$. Wait — recheck. $98 = 2 dot 7^2$ and $100 = 2^2 dot 5^2$. So $98 dot 100 = 2^3 dot 5^2 dot 7^2$. Largest prime is $bold(7)$. Answer: *(A)*.]

#prob(8)[#difficulty(2) Find the sum of all positive integers $n$ such that $n^2 - 19 n + 99$ is a perfect square.]
#mcq[$19$][$20$][$38$][$10$][$29$]

#speedsolution("60s")[Set $n^2 - 19 n + 99 = k^2$. Complete the square: $(n - 19 / 2)^2 - 361 / 4 + 99 = k^2$, so $(2 n - 19)^2 - 4 k^2 = -35$, i.e., $(2 n - 19 - 2 k)(2 n - 19 + 2 k) = -35$. Factor pairs of $-35$: $(1, -35), (-1, 35), (5, -7), (-5, 7)$ and negatives. Let $u = 2 n - 19$. Then $(u - 2 k)(u + 2 k) = -35$, so $u^2 - 4 k^2 = -35$. Try $u^2 = 4 k^2 - 35$. For $k = 3$: $u^2 = 1$, $u = plus.minus 1$, $n = 10$ or $9$. For $k = 9$: $u^2 = 289$, $u = plus.minus 17$, $n = 18$ or $1$. Check: $P(1) = 81 = 9^2$ ✓, $P(9) = 9$ ✓, $P(10) = 9$ ✓, $P(18) = 81$ ✓. Sum $= 1 + 9 + 10 + 18 = bold(38)$. Answer: *(C)*.]

#prob(9)[#difficulty(3) How many integers between 1 and 1000 are divisible by 3 but not by 5?]
#mcq[$267$][$266$][$333$][$200$][$300$]

#speedsolution("30s")[Divisible by 3: $floor(1000 / 3) = 333$. Divisible by both 3 and 5 (i.e., by 15): $floor(1000 / 15) = 66$. Answer: $333 - 66 = bold(267)$. Answer: *(A)*.]

#prob(10)[#difficulty(3) Find the last two digits of $3^{2025}$.]
#mcq[$43$][$07$][$63$][$83$][$03$]

#speedsolution("60s")[We need $3^2025 mod 100$. By Euler's theorem, $phi(100) = 40$, so $3^40 equiv 1 mod 100$. Now $2025 = 50 dot 40 + 25$, so $3^2025 equiv 3^25 mod 100$. Compute: $3^5 = 243$, so $3^5 equiv 43 mod 100$. $3^10 equiv 43^2 = 1849 equiv 49 mod 100$. $3^20 equiv 49^2 = 2401 equiv 1 mod 100$. $3^25 equiv 1 dot 43 = 43 mod 100$. Last two digits: $bold(43)$. Answer: *(A)*.]
