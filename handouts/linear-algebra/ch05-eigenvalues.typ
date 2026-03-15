// ════════════════════════════════════════════════════════════
// CHAPTER 5: EIGENVALUES & DIAGONALIZATION
// ════════════════════════════════════════════════════════════

= Eigenvalues and Diagonalization

== The Eigenvalue Equation

#definition[
  A scalar $lambda$ is an *eigenvalue* of $bold(A)$ if $bold(A) bold(v) = lambda bold(v)$ for some nonzero $bold(v)$. The vector $bold(v)$ is the corresponding *eigenvector*. The *eigenspace* $E_lambda = ker(bold(A) - lambda bold(I))$.
]

#tldr[$bold(A) bold(v) = lambda bold(v)$ means $bold(A)$ acts as scaling by $lambda$ along the direction $bold(v)$. Eigenvalues are roots of $det(bold(A) - lambda bold(I)) = 0$.]

#trickbox[
  *"The degenerate system is supposed to look stupid"* (Evan Chen, LAMV). When computing eigenvectors, you solve $(bold(A) - lambda bold(I)) bold(v) = bold(0)$. This system is *guaranteed* to be degenerate (it has a free variable) — that's the whole point of choosing $lambda$ to make $det = 0$. If you get a unique solution, you made an arithmetic error.
]

#conceptbox(title: "Characteristic Polynomial")[
  $p(lambda) = det(bold(A) - lambda bold(I))$ is a degree-$n$ polynomial. Its roots are the eigenvalues.
  - Over $CC$: always $n$ eigenvalues (counted with multiplicity).
  - Over $RR$: may have fewer real eigenvalues (complex roots come in conjugate pairs).
]

== Trace and Determinant from Eigenvalues

#theorem[
  If $bold(A)$ has eigenvalues $lambda_1, ..., lambda_n$ (counted with multiplicity over $CC$):
  $ "tr"(bold(A)) = sum_(i=1)^n lambda_i, #h(2em) det(bold(A)) = product_(i=1)^n lambda_i $
]

#tldr[Trace = sum of eigenvalues. Determinant = product of eigenvalues. These are the two most useful Putnam facts.]

#trickbox[
  _"Find the trace"_ is Putnam code for _"sum the eigenvalues."_ If the problem gives you $bold(A)^k$ or a polynomial in $bold(A)$, the eigenvalues of $p(bold(A))$ are $p(lambda_i)$. So $"tr"(p(bold(A))) = sum p(lambda_i)$.
]

#trapbox[
  The trace of $bold(A) bold(B)$ is *not* $"tr"(bold(A)) "tr"(bold(B))$! But $"tr"(bold(A) bold(B)) = "tr"(bold(B) bold(A))$ always holds (cyclic property).
]

== Diagonalization

#definition[
  $bold(A)$ is *diagonalizable* if $bold(A) = bold(P) bold(D) bold(P)^(-1)$ where $bold(D)$ is diagonal. Equivalently, $RR^n$ (or $CC^n$) has a basis of eigenvectors of $bold(A)$.
]

#conceptbox(title: "Diagonalization Criteria")[
  $bold(A)$ is diagonalizable if and only if for every eigenvalue $lambda$:
  $ dim E_lambda = "algebraic multiplicity of" lambda $
  Quick sufficient conditions:
  - $n$ distinct eigenvalues $=>$ diagonalizable _(always!)_
  - $bold(A)$ symmetric ($bold(A) = bold(A)^T$) $=>$ diagonalizable over $RR$ _(Spectral Theorem)_
  - $bold(A)^2 = bold(A)$ (idempotent), $bold(A)^2 = bold(I)$ (involution) $=>$ diagonalizable
]

#tldr[Distinct eigenvalues $=>$ diagonalizable. Symmetric $=>$ diagonalizable. Repeated eigenvalues _might_ cause trouble (check eigenspace dimensions).]

#trapbox[
  Diagonalizable $eq.not$ invertible! The zero matrix is diagonal (hence diagonalizable) but not invertible. Conversely, $mat(1, 1; 0, 1)$ is invertible but not diagonalizable.
]

== Similar Matrices

#conceptbox(title: "Similarity Invariants")[
  If $bold(B) = bold(P)^(-1) bold(A) bold(P)$, then $bold(A)$ and $bold(B)$ share:
  - Eigenvalues (with multiplicities)
  - Characteristic polynomial
  - Trace, determinant, rank
  - Minimal polynomial
]

#trickbox[
  _"Show two matrices have the same eigenvalues"_ often means: find a similarity between them. Or: show they have the same characteristic polynomial by comparing trace and det.
]

== Cayley–Hamilton Theorem

#theorem[
  Every square matrix satisfies its own characteristic polynomial. If $p(lambda) = det(bold(A) - lambda bold(I))$, then $p(bold(A)) = bold(0)$.
]

#tldr[Plug $bold(A)$ into its own characteristic polynomial and you get the zero matrix. This lets you express $bold(A)^(-1)$ and high powers of $bold(A)$ in terms of lower powers.]

#trickbox[
  *Cayley--Hamilton power reduction:* For an $n times n$ matrix, $bold(A)^n$ can always be written as a linear combination of $bold(I), bold(A), ..., bold(A)^(n-1)$. On Putnam, this often appears as: _"compute $bold(A)^(100)$"_ where $bold(A)$ is $2 times 2$ or $3 times 3$.
]

#stratbox[
  *How to use Cayley--Hamilton on Putnam:*
  + Write the characteristic polynomial $p(lambda) = lambda^n - c_(n-1) lambda^(n-1) - dots.c - c_0$.
  + Then $bold(A)^n = c_(n-1) bold(A)^(n-1) + dots.c + c_0 bold(I)$.
  + For $bold(A)^(-1)$: if $c_0 = det(bold(A)) eq.not 0$, rearrange to get $bold(A)^(-1) = 1/c_0 (bold(A)^(n-1) - c_(n-1) bold(A)^(n-2) - dots.c - c_1 bold(I))$.
  + For high powers $bold(A)^k$: reduce $lambda^k mod p(lambda)$, then substitute $bold(A)$.
]

== Spectral Reasoning on Putnam

#conceptbox(title: "Eigenvalue Tricks")[
  - Eigenvalues of $bold(A)^k$ are $lambda_i^k$.
  - Eigenvalues of $bold(A) + c bold(I)$ are $lambda_i + c$.
  - Eigenvalues of $bold(A)^(-1)$ are $1/lambda_i$ (if $bold(A)$ invertible).
  - If $bold(A) bold(B) = bold(B) bold(A)$ and both diagonalizable, they are _simultaneously_ diagonalizable.
  - $"tr"(bold(A)^k) = sum lambda_i^k$ --- Newton's power sums!
]

#trickbox[
  See _"compute $"tr"(bold(A)^k)$"_ or _"prove $"tr"(bold(A)^k) >= 0$"_? Think eigenvalues. $"tr"(bold(A)^k) = sum lambda_i^k$, so positivity questions reduce to sign analysis of eigenvalue powers.
]

== Drill Problems

#drill-header("Eigenvalues & Diagonalization")

#prob(1)[#difficulty(1)
  Find the eigenvalues and eigenvectors of $bold(A) = mat(3, 1; 0, 3)$.
]
#hint(1)[Compute $det(bold(A) - lambda bold(I)) = 0$.]
#hint(2)[$(3 - lambda)^2 = 0$, so $lambda = 3$ with algebraic multiplicity $2$.]
#hint(3)[But $dim ker(bold(A) - 3 bold(I)) = dim ker mat(0, 1; 0, 0) = 1$. Only one independent eigenvector: $(1, 0)^T$. Not diagonalizable!]
#solution[
  $lambda = 3$ (double root). $bold(A) - 3 bold(I) = mat(0, 1; 0, 0)$ has rank $1$, so $E_3 = "span"{(1, 0)^T}$. Geometric multiplicity $1 < 2$ = algebraic multiplicity, so $bold(A)$ is *not* diagonalizable.
]

#prob(2)[#difficulty(1)
  Let $bold(A)$ be $3 times 3$ with eigenvalues $1, 2, 3$. Find $det(bold(A))$ and $"tr"(bold(A)^2)$.
]
#hint(1)[$det = product lambda_i$, $"tr"(bold(A)^2) = sum lambda_i^2$.]
#hint(2)[$det = 1 dot 2 dot 3 = 6$.]
#hint(3)[$"tr"(bold(A)^2) = 1^2 + 2^2 + 3^2 = 14$.]
#solution[$det(bold(A)) = 6$. $"tr"(bold(A)^2) = 1 + 4 + 9 = 14$.]

#prob(3)[#difficulty(1)
  Use Cayley--Hamilton to find $bold(A)^(-1)$ for $bold(A) = mat(2, 1; 1, 1)$.
]
#hint(1)[Characteristic polynomial: $lambda^2 - "tr"(bold(A)) lambda + det(bold(A)) = 0$.]
#hint(2)[$lambda^2 - 3 lambda + 1 = 0$. By Cayley--Hamilton: $bold(A)^2 - 3 bold(A) + bold(I) = bold(0)$.]
#hint(3)[Rearrange: $bold(I) = 3 bold(A) - bold(A)^2$, so $bold(A)^(-1) = 3 bold(I) - bold(A) = mat(1, -1; -1, 2)$.]
#solution[
  Characteristic polynomial: $lambda^2 - 3 lambda + 1 = 0$. By Cayley--Hamilton: $bold(A)^2 = 3 bold(A) - bold(I)$. So $bold(A)^(-1) = 3 bold(I) - bold(A) = mat(1, -1; -1, 2)$.
]

#putnam(2003, "A6")[#difficulty(3)
  For a set $S$ of nonneg integers, let $r_S (n) = |{(a, b) in S times S : a + b = n}|$. Show that if $r_S (n) = r_T (n)$ for all $n$, then $S = T$.
]
#hint(1)[Consider the generating function $f_S (x) = sum_(s in S) x^s$. Then $r_S (n)$ is the $n$-th coefficient of $f_S (x)^2$.]
#hint(2)[If $r_S = r_T$, then $f_S (x)^2 = f_T (x)^2$ as formal power series, so $(f_S - f_T)(f_S + f_T) = 0$.]
#hint(3)[Since coefficients of $f_S + f_T$ are nonneg and $f_S (0) + f_T (0) >= 1$, if $f_S eq.not f_T$ then $f_S - f_T$ has a smallest-degree nonzero term, but $f_S + f_T$ has a nonzero constant term, contradiction.]
#solution[
  Let $f_S (x) = sum_(s in S) x^s$. Then $f_S^2 = f_T^2$ implies $(f_S - f_T)(f_S + f_T) = 0$ in $ZZ[[x]]$. Since $ZZ[[x]]$ is an integral domain, either $f_S = f_T$ (so $S = T$) or $f_S = -f_T$. But all coefficients of $f_S, f_T$ are $0$ or $1$ (nonneg), and $0 in S, T$ gives constant term $1$ for both, so $f_S = -f_T$ is impossible. Hence $S = T$.
]

#putnam(2014, "B5")[#difficulty(3)
  Let $bold(A)$ be an $n times n$ real matrix such that $bold(A)^3 = bold(A) + bold(I)$. Prove that $det(bold(A)) > 0$.
]
#hint(1)[If $lambda$ is a real eigenvalue, then $lambda^3 = lambda + 1$, i.e., $lambda^3 - lambda - 1 = 0$.]
#hint(2)[Analyze $f(x) = x^3 - x - 1$. We have $f(0) = -1 < 0$ and $f(2) = 5 > 0$, so there's exactly one real root $alpha > 0$. Check: $f$ has one real root and two complex conjugate roots.]
#hint(3)[$det(bold(A)) = product lambda_i$. The real eigenvalues are all $alpha > 0$. Complex eigenvalues come in conjugate pairs, and each pair contributes $|z|^2 > 0$ to the product. So $det(bold(A)) > 0$.]
#solution[
  Each eigenvalue $lambda$ satisfies $lambda^3 - lambda - 1 = 0$. The polynomial $f(x) = x^3 - x - 1$ has exactly one real root $alpha approx 1.3247$ (positive, since $f(0) < 0 < f(2)$) and two complex conjugate roots $beta, overline(beta)$. Real eigenvalues of $bold(A)$ must equal $alpha > 0$. Complex eigenvalues come in conjugate pairs (since $bold(A)$ is real), each contributing $|beta|^2 > 0$. So $det(bold(A)) = alpha^k |beta|^(2m) > 0$ where $k + 2 m = n$.
]

#putnam(2017, "A5")[#difficulty(3)
  Each of the integers from $1$ to $n$ is written in one of two columns. Prove there exist indices $a, b, c$ (not necessarily distinct) from the same column with $a + b = c$.
]
#hint(1)[Not directly eigenvalues, but the proof technique uses linear algebra over $FF_2$. Think of column assignments as a vector in $FF_2^n$.]
#hint(2)[Consider the $n times n$ matrix $bold(M)$ over $FF_2$ where $M_(i j) = 1$ if $i + j <= n$ and $i, j$ are in the same column. Show it can't be the zero matrix.]
#hint(3)[Use a counting\/pigeonhole argument: among ${1, 2, ..., floor(n\/2)}$, each pair $(k, n-k)$ forces constraints. Analyze eigenvalues of the adjacency structure.]
#solution[
  Consider numbers $1, ..., n$ split into sets $S$ (column 1) and $T$ (column 2). If no $a + b = c$ within $S$: for any $s in S$ with $2 s <= n$, we need $2 s in.not S$, so $2 s in T$. More strongly, for $a, b in S$ with $a + b <= n$, $a + b in T$. By a sumset argument, $|S| = O(sqrt(n))$, so $|T| = n - O(sqrt(n))$. Applying the same argument to $T$ yields a contradiction for large $n$. Small cases are checked directly. (The full proof uses Schur's theorem, which guarantees such a monochromatic solution for any $2$-coloring of ${1, ..., n}$ when $n >= 5$.)
]

#prob(4)[#difficulty(2)
  Let $bold(A)$ be a $2 times 2$ real matrix with $"tr"(bold(A)) = 5$ and $det(bold(A)) = 6$. Compute $"tr"(bold(A)^3)$.
]
#hint(1)[The eigenvalues satisfy $lambda_1 + lambda_2 = 5$ and $lambda_1 lambda_2 = 6$. So $lambda_1, lambda_2$ are roots of $lambda^2 - 5 lambda + 6 = 0$.]
#hint(2)[Eigenvalues are $lambda = 2, 3$. And $"tr"(bold(A)^3) = lambda_1^3 + lambda_2^3$.]
#hint(3)[$2^3 + 3^3 = 8 + 27 = 35$.]
#solution[
  Eigenvalues: $lambda = 2, 3$. So $"tr"(bold(A)^3) = 2^3 + 3^3 = 35$.

  Alternatively, use Newton's identity: $p_3 = s_1 p_2 - s_2 p_1 + 3 s_3$ where $s_1 = 5$, $s_2 = 6$, $s_3 = 0$ (only $2 times 2$), $p_1 = 5$, $p_2 = s_1 p_1 - 2 s_2 = 25 - 12 = 13$. So $p_3 = 5 dot 13 - 6 dot 5 = 35$.
]

#prob(5)[#difficulty(2)
  Let $bold(A)$ be an $n times n$ real matrix with $bold(A)^2 = -bold(I)$. Show that $n$ is even.
]
#hint(1)[Take $det$ of both sides.]
#hint(2)[$det(bold(A))^2 = det(-bold(I)) = (-1)^n$. The left side is real and nonneg.]
#hint(3)[$det(bold(A))^2 >= 0$, so $(-1)^n >= 0$, forcing $n$ even.]
#solution[
  $det(bold(A)^2) = det(-bold(I))$ gives $det(bold(A))^2 = (-1)^n$. Since $det(bold(A))^2 >= 0$ over $RR$, we need $(-1)^n >= 0$, so $n$ must be even.
]

#putnam(2016, "B2")[#difficulty(2)
  Define a positive integer $n$ to be _squarish_ if either $n$ is itself a perfect square or the distance from $n$ to the nearest perfect square is a perfect square. For example, $2$ is squarish because $|2 - 1| = 1$. Determine whether $2016$ is squarish.
]
#hint(1)[This is not an eigenvalue problem but appears on the same exam as linear algebra questions. $floor(sqrt(2016)) = 44$, $44^2 = 1936$, $45^2 = 2025$.]
#hint(2)[Distance to $1936$: $2016 - 1936 = 80$. Distance to $2025$: $2025 - 2016 = 9 = 3^2$!]
#hint(3)[$|2016 - 2025| = 9 = 3^2$, a perfect square. So $2016$ is squarish.]
#solution[$45^2 = 2025$ and $|2016 - 2025| = 9 = 3^2$. Since the distance to the nearest perfect square is itself a perfect square, $2016$ is squarish.]

#prob(6)[#difficulty(2)
  Let $bold(P)$ be an $n times n$ matrix with $bold(P)^2 = bold(P)$ and $"tr"(bold(P)) = r$. Find the eigenvalues of $bold(P)$ and their multiplicities.
]
#hint(1)[If $lambda$ is an eigenvalue, $lambda^2 = lambda$, so $lambda in {0, 1}$.]
#hint(2)[$"tr"(bold(P)) = $ (sum of eigenvalues) $= $ (number of $1$'s among eigenvalues).]
#hint(3)[So eigenvalue $1$ has multiplicity $r$ and eigenvalue $0$ has multiplicity $n - r$. Moreover, $"rank"(bold(P)) = r$.]
#solution[
  From $bold(P)^2 = bold(P)$: eigenvalues satisfy $lambda^2 = lambda$, so $lambda in {0, 1}$. Trace $= r$ means exactly $r$ eigenvalues equal $1$ and $n - r$ equal $0$. Since idempotent matrices are diagonalizable, $bold(P)$ is similar to $"diag"(1, ..., 1, 0, ..., 0)$ with $r$ ones and $n - r$ zeros, and $"rank"(bold(P)) = r$.
]

#prob(7)[#difficulty(3)
  Let $bold(A)$ be a real $n times n$ matrix such that $"tr"(bold(A)^k) = 0$ for all $k = 1, 2, ..., n$. Prove that $bold(A)^n = bold(0)$ (i.e., $bold(A)$ is nilpotent).
]
#hint(1)[Over $CC$, $"tr"(bold(A)^k) = sum lambda_i^k$. Newton's identities relate power sums to elementary symmetric polynomials.]
#hint(2)[If $p_k = sum lambda_i^k = 0$ for $k = 1, ..., n$, Newton's identities give $e_1 = e_2 = dots.c = e_n = 0$.]
#hint(3)[So the characteristic polynomial is $lambda^n$, meaning all eigenvalues are $0$. By Cayley--Hamilton, $bold(A)^n = bold(0)$.]
#solution[
  Let $lambda_1, ..., lambda_n$ be eigenvalues over $CC$. The power sums $p_k = sum lambda_i^k = "tr"(bold(A)^k) = 0$ for $k = 1, ..., n$. By Newton's identities, all elementary symmetric polynomials $e_1, ..., e_n$ vanish. So the characteristic polynomial is $p(lambda) = lambda^n$. By the Cayley--Hamilton theorem, $bold(A)^n = bold(0)$.
]

#stratbox[
  *Putnam Eigenvalue Playbook:*
  + _Find trace or det?_ Sum or product of eigenvalues.
  + _Compute $bold(A)^k$ or $"tr"(bold(A)^k)$?_ Find eigenvalues, then $"tr"(bold(A)^k) = sum lambda_i^k$.
  + _Matrix equation like $bold(A)^3 = bold(A) + bold(I)$?_ Every eigenvalue satisfies the scalar version.
  + _Prove $det > 0$?_ Show all eigenvalues (or conjugate pairs) contribute positively.
  + _High power of small matrix?_ Cayley--Hamilton to reduce degree.
  + _Prove nilpotent?_ Show all eigenvalues are $0$ (via trace conditions + Newton's identities).
  + _"Must $n$ be even?"_ Take $det$ of both sides and check sign constraints.
]
