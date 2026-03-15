// ════════════════════════════════════════════════════════════
// CHAPTER 4: DETERMINANTS
// ════════════════════════════════════════════════════════════

= Determinants

== Core Properties

#definition[
  The *determinant* $det : M_(n times n)(FF) -> FF$ is the unique function that is:
  + *Multilinear* in the rows (linear in each row separately),
  + *Alternating* (swapping two rows negates the value),
  + *Normalized* ($det(bold(I)) = 1$).
]

#tldr[Determinant = signed volume scaling factor. It's the _only_ function that's multilinear, alternating, and sends $bold(I) |-> 1$.]

#conceptbox(title: "Properties You Must Know Cold")[
  - $det(bold(A) bold(B)) = det(bold(A)) det(bold(B))$ #h(1fr) _(multiplicative!)_
  - $det(bold(A)^T) = det(bold(A))$ #h(1fr) _(rows $<->$ columns)_
  - $det(c bold(A)) = c^n det(bold(A))$ for $bold(A) in M_(n times n)$ #h(1fr) _(the $c^n$ trap!)_
  - $det(bold(A)^(-1)) = 1 / det(bold(A))$ #h(1fr) _(immediate from multiplicativity)_
  - Row of zeros $=>$ $det = 0$. Two equal rows $=>$ $det = 0$.
]

#trapbox[
  $det(bold(A) + bold(B)) eq.not det(bold(A)) + det(bold(B))$ in general! The determinant is multilinear in _rows_, not linear in the _matrix_. This mistake appears constantly on Putnam.
]

== Row and Column Operations

#conceptbox(title: "Effect on Determinant")[
  - *Swap two rows*: multiply $det$ by $-1$
  - *Multiply a row by $c$*: multiply $det$ by $c$
  - *Add a multiple of one row to another*: $det$ unchanged #h(1fr) _(the workhorse!)_
]

#trickbox[
  When you see a structured matrix on Putnam, the first instinct should be: _can I simplify by row\/column operations that preserve (or predictably change) the determinant?_ Factor out common terms from rows, then reduce.
]

== Cofactor Expansion

#tldr[$det(bold(A)) = sum_(j=1)^n (-1)^(i+j) a_(i j) M_(i j)$ along any row $i$ or column $j$. Pick the row\/column with the most zeros.]

== The Vandermonde Determinant

#theorem[
  For distinct $x_1, x_2, ..., x_n$:
  $ det mat(1, x_1, x_1^2, ..., x_1^(n-1); 1, x_2, x_2^2, ..., x_2^(n-1); dots.v, dots.v, dots.v, dots.down, dots.v; 1, x_n, x_n^2, ..., x_n^(n-1)) = product_(1 <= i < j <= n) (x_j - x_i) $
]

#tldr[Vandermonde $det$ = product of all pairwise differences. Nonzero iff all $x_i$ distinct. Appears whenever you see powers in a matrix.]

#trickbox[
  See $a_i^(j-1)$ or polynomial-evaluation entries in a matrix? That's Vandermonde. The determinant factors _beautifully_ and is nonzero iff entries are distinct.
]

== Block Matrix Determinants

#theorem[
  If $bold(A)$ is $k times k$, $bold(D)$ is $m times m$, then:
  $ det mat(bold(A), bold(B); bold(0), bold(D)) = det(bold(A)) det(bold(D)) $
  More generally, if $bold(A)$ is invertible:
  $ det mat(bold(A), bold(B); bold(C), bold(D)) = det(bold(A)) det(bold(D) - bold(C) bold(A)^(-1) bold(B)) $
  where $bold(D) - bold(C) bold(A)^(-1) bold(B)$ is the *Schur complement*.
]

#tldr[Block upper (or lower) triangular? Determinant = product of diagonal block determinants. Otherwise use the Schur complement.]

== Rank-1 Updates (Matrix Determinant Lemma)

#lemma[
  If $bold(A)$ is invertible and $bold(u), bold(v) in RR^n$:
  $ det(bold(A) + bold(u) bold(v)^T) = (1 + bold(v)^T bold(A)^(-1) bold(u)) det(bold(A)) $
]

#tldr[Adding a rank-1 matrix to $bold(A)$? The determinant changes by factor $(1 + bold(v)^T bold(A)^(-1) bold(u))$.]

#trickbox[
  See $bold(J)$ (all-ones matrix) or $bold(1) bold(1)^T$ added to something diagonal? That's a rank-1 update. Factor as $bold(D) + bold(u) bold(v)^T$ and apply the lemma.
]

== Drill Problems

#drill-header("Determinants")

#prob(1)[#difficulty(1)
  Compute $det mat(1, 2, 3; 4, 5, 6; 7, 8, 9)$.
]
#hint(1)[Try row reduction: $R_2 <- R_2 - R_1$, $R_3 <- R_3 - R_1$.]
#hint(2)[After reduction, you get two rows that are proportional. What does that force?]
#hint(3)[The rows are linearly dependent ($R_1 + R_3 = 2 R_2$), so the determinant is $0$.]
#solution[
  $R_2 - R_1 = (3, 3, 3)$, $R_3 - R_1 = (6, 6, 6) = 2(3, 3, 3)$. Two proportional rows, so $det = 0$.
]

#prob(2)[#difficulty(1)
  Let $bold(A)$ be $5 times 5$ with $det(bold(A)) = 3$. Find $det(2 bold(A))$.
]
#hint(1)[Recall $det(c bold(A)) = c^n det(bold(A))$.]
#hint(2)[Here $c = 2$, $n = 5$.]
#hint(3)[$2^5 dot 3 = 96$.]
#solution[$det(2 bold(A)) = 2^5 det(bold(A)) = 32 dot 3 = 96$.]

#prob(3)[#difficulty(1)
  Compute the $4 times 4$ Vandermonde determinant with $x_1 = 1, x_2 = 2, x_3 = 3, x_4 = 4$.
]
#hint(1)[Apply the formula: product of $(x_j - x_i)$ for $i < j$.]
#hint(2)[List all $binom(4,2) = 6$ pairs.]
#hint(3)[$(2-1)(3-1)(4-1)(3-2)(4-2)(4-3) = 1 dot 2 dot 3 dot 1 dot 2 dot 1 = 12$.]
#solution[By Vandermonde: $product_(i < j)(x_j - x_i) = 1 dot 2 dot 3 dot 1 dot 2 dot 1 = 12$.]

#prob(4)[#difficulty(2)
  Let $bold(J)_n$ be the $n times n$ all-ones matrix. Compute $det(bold(I)_n + bold(J)_n)$.
]
#hint(1)[Write $bold(J)_n = bold(1) bold(1)^T$ where $bold(1) = (1, 1, ..., 1)^T$. Apply the matrix determinant lemma.]
#hint(2)[$bold(A) = bold(I)$, $bold(u) = bold(v) = bold(1)$. Compute $bold(v)^T bold(A)^(-1) bold(u)$.]
#hint(3)[$bold(v)^T bold(I)^(-1) bold(u) = bold(1)^T bold(1) = n$. So $det = (1 + n) dot 1 = n + 1$.]
#solution[
  $bold(J)_n = bold(1) bold(1)^T$. By the matrix determinant lemma: $det(bold(I) + bold(1) bold(1)^T) = (1 + bold(1)^T bold(I)^(-1) bold(1)) det(bold(I)) = 1 + n$.
]

#putnam(2003, "B2")[#difficulty(2)
  Let $n$ be a positive integer. For $1 <= i, j <= n$, define $a_(i j) = gcd(i, j)$. Find $det(a_(i j))$ for $n = 1, 2, 3, 4$ and conjecture a formula.
]
#hint(1)[Compute small cases. $n = 1$: $det = 1$. $n = 2$: $det mat(1, 1; 1, 2) = 1$.]
#hint(2)[For $n = 3$: $det mat(1, 1, 1; 1, 2, 1; 1, 1, 3) = 2$. For $n = 4$: work it out to get $4$. See a pattern?]
#hint(3)[The answer is $det = product_(k=1)^n phi(k)$ where $phi$ is Euler's totient. Use the factorization $gcd(i, j) = sum_(d | gcd(i, j)) phi(d)$ and factor the matrix.]
#solution[
  The determinant equals $product_(k=1)^n phi(k)$. Write $a_(i j) = sum_(d | gcd(i,j)) phi(d)$. This factors the matrix as $bold(A) = bold(F)^T bold(D) bold(F)$ where $bold(D) = "diag"(phi(1), ..., phi(n))$ and $bold(F)$ is the divisibility indicator matrix (which is unit lower triangular after reordering). So $det(bold(A)) = product phi(k)$.
]

#putnam(2018, "A2")[#difficulty(2)
  Let $S_1, S_2, ..., S_(2^n - 1)$ be the nonempty subsets of ${1, 2, ..., n}$. For $i, j in {1, ..., 2^n - 1}$, define $a_(i j) = |S_i inter S_j|$. Determine the value of $det(a_(i j))$.
]
#hint(1)[Write $|S_i inter S_j| = sum_(k=1)^n bold(1)_(k in S_i) bold(1)_(k in S_j)$. This means $bold(A) = bold(M) bold(M)^T$ where $bold(M)$ is the $(2^n - 1) times n$ membership matrix.]
#hint(2)[Since $bold(M)$ is $(2^n - 1) times n$ with $2^n - 1 > n$ for $n >= 2$, we have $"rank"(bold(M)) <= n < 2^n - 1$.]
#hint(3)[So $bold(A) = bold(M) bold(M)^T$ has rank at most $n < 2^n - 1$ for $n >= 2$, hence $det(bold(A)) = 0$. Check $n = 1$: the matrix is $(1)$, so $det = 1$.]
#solution[
  For $n = 1$: $det = 1$. For $n >= 2$: write $a_(i j) = sum_(k=1)^n chi_(S_i)(k) chi_(S_j)(k)$, so $bold(A) = bold(M) bold(M)^T$ where $bold(M)$ is $(2^n - 1) times n$. Since $2^n - 1 > n$, we get $"rank"(bold(A)) <= n < 2^n - 1$, so $det(bold(A)) = 0$.
]

#putnam(2009, "A4")[#difficulty(2)
  Let $S$ be a set of rational numbers such that: (a) $0 in S$, (b) if $x in S$ then $x + 1 in S$ and $x - 1 in S$, and (c) if $x in S$ and $x eq.not 0, 1$, then $1 / (x(x-1)) in S$. Must $S$ contain all rationals?
]
#hint(1)[This isn't a determinant problem per se, but the structure $x(x-1)$ relates to $2 times 2$ determinant tricks. Try generating specific rationals.]
#hint(2)[From $0$, get all integers via (b). From $n eq.not 0, 1$: $1/(n(n-1)) = 1/(n-1) - 1/n$ gives unit fractions.]
#hint(3)[By (c), $S$ contains $1/(n(n-1))$ for all integers $n >= 2$. By partial fractions and (b), $S$ contains $1/n$ for all $n eq.not 0$. Then $p/q in S$ by repeated addition.]
#solution[
  Yes. From $0$ and rule (b), all integers are in $S$. For $n >= 2$, rule (c) gives $1/(n(n-1)) in S$. Since $1/(n(n-1)) = 1/(n-1) - 1/n$, by induction and rule (b): $1/1 in S$ (it's an integer), then $1/2 = 1/1 - 1/(1 dot 2) in S$, then $1/3 in S$, etc. Repeated addition gives all rationals $p\/q$.
]

#prob(5)[#difficulty(2)
  Let $bold(A)$ be $n times n$ with all diagonal entries equal to $d$ and all off-diagonal entries equal to $c$. Compute $det(bold(A))$.
]
#hint(1)[Write $bold(A) = (d - c) bold(I) + c bold(J)$ where $bold(J)$ is the all-ones matrix.]
#hint(2)[Apply the rank-1 update: $det = (d - c)^n det(bold(I) + c/(d-c) bold(J))$.]
#hint(3)[$bold(J) = bold(1) bold(1)^T$. By the matrix determinant lemma: $det = (d - c)^n (1 + (n c)/(d - c)) = (d - c)^(n-1)(d + (n-1)c)$.]
#solution[
  $bold(A) = (d-c) bold(I) + c bold(1) bold(1)^T$. By the matrix determinant lemma:
  $det(bold(A)) = (d - c)^n (1 + c/(d-c) dot bold(1)^T bold(1)) = (d - c)^(n-1)(d + (n-1)c)$.
  Eigenvalue check: $bold(A)$ has eigenvalue $d + (n-1)c$ (eigenvector $bold(1)$) and $d - c$ with multiplicity $n - 1$.
]

#prob(6)[#difficulty(3)
  Let $bold(A)$ be an $n times n$ matrix over $RR$ with $bold(A)^2 = bold(A)$. Prove that $det(bold(A)) in {0, 1}$.
]
#hint(1)[$bold(A)^2 = bold(A)$ means $bold(A)$ is idempotent. Take determinants of both sides.]
#hint(2)[$det(bold(A))^2 = det(bold(A))$, so $det(bold(A))(det(bold(A)) - 1) = 0$.]
#hint(3)[Over $RR$, this gives $det(bold(A)) = 0$ or $det(bold(A)) = 1$. Done!]
#solution[
  Taking $det$ of $bold(A)^2 = bold(A)$: $det(bold(A))^2 = det(bold(A))$. So $det(bold(A)) in {0, 1}$.
]

#stratbox[
  *Putnam Determinant Playbook:*
  + _Structured entries?_ Try row\/column operations to simplify.
  + _Powers or evaluations?_ Think Vandermonde.
  + _All-ones or rank-1 piece?_ Use the matrix determinant lemma.
  + _Block structure?_ Apply block determinant formulas.
  + _Functional equation for the matrix?_ Take $det$ of both sides --- multiplicativity does the work.
  + _Inner-product-style entries $a_(i j) = f(i, j)$?_ Try to factor as $bold(M) bold(M)^T$ and check rank.
]
