// ════════════════════════════════════════════════════════════
// Chapter 1 — Contest Strategy & Time Management
// ════════════════════════════════════════════════════════════

= Contest Strategy & Time Management

This is the highest-leverage chapter in this handbook. A perfect strategy on an imperfect skill set beats perfect skills with no strategy. Read this first.

== The Scoring System

The NYSMATYC Math League uses: *+4 correct, --0.5 wrong, 0 blank*. This asymmetry is your weapon.

#conceptbox(title: "Expected Value of a Guess")[
  With 5 choices (A--E), if you guess randomly:\
  $"EV" = (+4)(1 / 5) + (-0.5)(4 / 5) = 0.8 - 0.4 = bold("+0.4")$\
  Wait — random guessing is *slightly positive*? Yes, but barely. Here's the real table:

  #table(
    columns: (auto, auto, auto),
    align: (left, center, center),
    [*Choices eliminated*], [*Prob. correct*], [*Expected value*],
    [0 (random)], [$1 / 5 = 20%$], [$+0.40$],
    [1 eliminated], [$1 / 4 = 25%$], [$+0.625$],
    [2 eliminated], [$1 / 3 = 33%$], [$+1.0$],
    [3 eliminated], [$1 / 2 = 50%$], [$+1.75$],
  )
]

#speedbox[
  *Rule of thumb:* If you can eliminate even _one_ answer choice, guess. If you have zero clue and cannot eliminate anything, still guess — the EV is positive. On NYSMATYC, *never leave a question blank* unless you are truly out of time.
]

#trapbox[
  Many students treat --0.5 as a harsh penalty. It's not. You need to get only 1 out of 5 random guesses right to break even. The real trap is *leaving blanks on problems where you could eliminate choices*.
]

== Time Budget

You have 60 minutes for 20 questions: 3 minutes average. But the questions are arranged roughly by difficulty. Budget unevenly.

#stratbox[
  *The 2-3-5 Budget:*
  - *Q1--Q7 (Quick):* #difficulty(1) — target 1.5--2 min each. $approx 12$ min total.
  - *Q8--Q14 (Medium):* #difficulty(2) — target 3 min each. $approx 21$ min total.
  - *Q15--Q20 (Hard):* #difficulty(3) — target 4--5 min each. $approx 27$ min total.
  - Total: $12 + 21 + 27 = 60$ min exactly.
]

#speedbox[
  *The 4-Minute Rule:* If you've spent 4 minutes on any single problem and have no clear path, *mark it and move on*. Come back at the end if time permits. Burning 7 minutes on one problem costs you two easier problems.
]

#trapbox[
  *Sunk cost fallacy:* "I've already spent 3 minutes on this, I should keep going." No. If you're stuck at 4 minutes, the expected gain from staying is lower than the expected gain from a fresh, easier problem.
]

== The Five Speed Methods

These methods appear throughout this handbook. Every problem should trigger you to ask: _"Which speed method applies here?"_

=== Method 1: Back-Solve

Plug answer choices into the problem. Start with choice (C) — it's often the middle value.

#trickbox[
  Back-solving is fastest when the problem says "find $x$ such that..." and the answer choices are simple numbers. Plugging in is often 3x faster than setting up and solving an equation.
]

=== Method 2: Estimate & Eliminate

Use rough arithmetic to narrow the range, then pick the only choice that fits.

#trickbox[
  If a problem asks for the area of a region bounded by curves, estimate it by bounding above and below with rectangles. Often 3 of the 5 choices are immediately too large or too small.
]

=== Method 3: Pattern Match

Recognize the problem _type_ instantly and apply the memorized shortcut.

#trickbox[
  "Sum of roots of $3 x^2 - 7 x + 2 = 0$?" — don't solve. Vieta's: $-(-7) / 3 = 7 / 3$. Done in 5 seconds.
]

=== Method 4: Strategic Substitution

Plug in easy numbers ($0, 1, -1, 2$) to test general statements or find patterns.

#trickbox[
  "For all $x$, which expression equals $f(x) + f(-x)$?" — just plug $x = 1$ and compute. Often only one choice matches.
]

=== Method 5: Calculator Leverage

Your graphing calculator can solve equations, graph intersections, compute sums, and test conjectures. Know your calculator's capabilities _before_ the contest.

#speedbox[
  *Calculator priorities:* Use it for (1) ugly arithmetic, (2) checking back-solve candidates, (3) graphing to count intersections. Do _not_ use it for simple mental math — the button-pressing overhead is slower.
]

== Answer Sheet Strategy

#stratbox[
  - *First pass (minutes 0--40):* Do Q1--Q14 in order. Mark any skip with a small circle on the answer sheet.
  - *Second pass (minutes 40--55):* Attempt Q15--Q20. Skip if stuck after 4 min.
  - *Third pass (minutes 55--60):* Return to skipped problems. Guess on everything remaining (remember: EV is positive).
  - *Bubble strategy:* Bubble as you go, not at the end. Leaving 20 bubbles for the last 2 minutes invites errors.
]

== Common Traps That Waste Time

#trapbox[
  *Trap 1: Solving for the wrong thing.* The problem asks for $x + y$, not $x$. You solve for $x$, then waste time finding $y$ separately. Read the question twice before starting.
]

#trapbox[
  *Trap 2: Over-computing.* You expand $(a + b)^4$ fully when the question only asks for one coefficient. Use the Binomial Theorem selectively.
]

#trapbox[
  *Trap 3: Not using the answer choices.* You have five choices — they're information! If choices are $2, 4, 6, 8, 10$ and your approach gives something near $6$, you're done. Don't compute to 5 decimal places.
]

#trapbox[
  *Trap 4: Perfectionism on early problems.* Q1--Q7 should each take under 2 minutes. If you're triple-checking an easy problem, you're stealing time from harder ones worth the same 4 points.
]

#tldr[Budget time unevenly (2-3-5 rule). Use the five speed methods on every problem. Never leave a blank — EV is always positive. If stuck for 4 minutes, move on.]
