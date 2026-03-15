// ════════════════════════════════════════════════════════════
// FORMULA SHEET: QUICK REFERENCE
// ════════════════════════════════════════════════════════════

= Formula Sheet — Linear Algebra Quick Reference

#conceptbox(title: "Vector Space Axioms (Brief)")[
  $(V, +, dot)$ over field $FF$: closure under $+$ and scalar $dot$, associativity, commutativity of $+$, additive identity $bold(0)$, additive inverses, distributivity, $1 dot bold(v) = bold(v)$.
  *Subspace test*: $W subset.eq V$ is a subspace $arrow.l.r$ $bold(0) in W$ and $W$ is closed under $+$ and scalar multiplication.
]

#conceptbox(title: "Rank-Nullity Theorem")[
  For $T : V -> W$ linear with $V$ finite-dimensional:
  $ dim V = "rank"(T) + "nullity"(T) = dim "im"(T) + dim ker(T) $
  *Corollary*: $n times n$ matrix $bold(A)$ is invertible $arrow.l.r$ $ker(bold(A)) = {bold(0)}$ $arrow.l.r$ $"rank"(bold(A)) = n$.
]

#stratbox[
  *Dimension counting*: $dim(V + W) = dim V + dim W - dim(V sect W)$. If $dim V + dim W > n$ in $RR^n$, they must intersect nontrivially.
]

#conceptbox(title: "Determinant Properties")[
  #grid(columns: (1fr, 1fr), gutter: 6pt,
    [
      - $det(bold(A) bold(B)) = det(bold(A)) det(bold(B))$
      - $det(bold(A)^T) = det(bold(A))$
      - $det(c bold(A)) = c^n det(bold(A))$
      - $det(bold(A)^(-1)) = 1 / det(bold(A))$
    ],
    [
      - Row swap: $det$ flips sign
      - Row scale by $c$: $det$ scales by $c$
      - Row addition: $det$ unchanged
      - Triangular: $det =$ product of diagonal
    ]
  )
  *Cofactor expansion*: $det(bold(A)) = sum_(j=1)^n (-1)^(i+j) a_(i j) M_(i j)$

  *Matrix det. lemma*: $det(bold(A) + bold(u) bold(v)^T) = det(bold(A))(1 + bold(v)^T bold(A)^(-1) bold(u))$

  *Hadamard's inequality*: $|det(bold(A))| <= product_(i=1)^n norm(bold(r)_i)$ where $bold(r)_i$ are rows.
]

#conceptbox(title: "Eigenvalue Facts")[
  #grid(columns: (1fr, 1fr), gutter: 6pt,
    [
      - $"tr"(bold(A)) = sum lambda_i$
      - $det(bold(A)) = product lambda_i$
      - $lambda(bold(A)^k) = lambda^k$
      - $lambda(bold(A)^(-1)) = 1 / lambda$
    ],
    [
      - $lambda(bold(A) + c bold(I)) = lambda + c$
      - Real matrix: complex $lambda$ come in conjugate pairs
      - Symmetric $arrow.r.double$ all $lambda in RR$
      - Similar matrices share eigenvalues
    ]
  )
]

#conceptbox(title: "Cayley-Hamilton Theorem")[
  Every matrix satisfies its own characteristic polynomial:
  $ chi_bold(A)(bold(A)) = bold(A)^n - ("tr" bold(A)) bold(A)^(n-1) + dots.c + (-1)^n det(bold(A)) bold(I) = bold(0) $
  *Use*: express $bold(A)^(-1)$ in terms of lower powers; reduce high powers of $bold(A)$.
]

#conceptbox(title: "Spectral Theorem")[
  If $bold(A) in RR^(n times n)$ is *symmetric* ($bold(A)^T = bold(A)$):
  - All eigenvalues are real
  - Eigenvectors for distinct eigenvalues are orthogonal
  - $bold(A) = bold(Q) bold(Lambda) bold(Q)^T$ with $bold(Q)$ orthogonal and $bold(Lambda)$ diagonal

  *Consequence*: Symmetric matrices are diagonalizable over $RR$.
]

#conceptbox(title: "Matrix Identities & Decompositions")[
  - *Any matrix*: $bold(A) = bold(S) + bold(K)$ where $bold(S) = (bold(A) + bold(A)^T)/2$ (symmetric), $bold(K) = (bold(A) - bold(A)^T)/2$ (skew)
  - *Rank-1*: $bold(A) = bold(u) bold(v)^T$ $arrow.r.double$ $"tr"(bold(A)) = bold(v)^T bold(u)$, $"rank" <= 1$
  - *Sherman-Morrison*: $(bold(A) + bold(u) bold(v)^T)^(-1) = bold(A)^(-1) - (bold(A)^(-1) bold(u) bold(v)^T bold(A)^(-1))/(1 + bold(v)^T bold(A)^(-1) bold(u))$
  - *Sylvester's rank ineq.*: $"rank"(bold(A)) + "rank"(bold(B)) - n <= "rank"(bold(A) bold(B))$
  - *Trace cycling*: $"tr"(bold(A) bold(B) bold(C)) = "tr"(bold(B) bold(C) bold(A)) = "tr"(bold(C) bold(A) bold(B))$
  - *$"tr"(bold(A)^T bold(A)) = sum a_(i j)^2 >= 0$*, equals 0 iff $bold(A) = bold(0)$
]

#conceptbox(title: "Inner Products & Cauchy-Schwarz")[
  *Cauchy-Schwarz*: $|lr(angle.l bold(u), bold(v) angle.r)|^2 <= lr(angle.l bold(u), bold(u) angle.r) dot lr(angle.l bold(v), bold(v) angle.r)$. Equality $arrow.l.r$ linearly dependent.

  *Discrete*: $(sum a_i b_i)^2 <= (sum a_i^2)(sum b_i^2)$ #h(1em) *Integral*: $(integral f g)^2 <= (integral f^2)(integral g^2)$

  *Gram-Schmidt*: $bold(e)_k = (bold(v)_k - sum_(j<k) lr(angle.l bold(v)_k, bold(e)_j angle.r) bold(e)_j) \/ norm(dot)$

  *Projection onto $W$*: $"proj"_W bold(v) = sum lr(angle.l bold(v), bold(e)_i angle.r) bold(e)_i$ (orthonormal basis of $W$)
]

#trickbox[
  *Putnam pattern cheatsheet*:
  - "integer matrix" $arrow.r$ think $det in ZZ$, eigenvalues are algebraic integers
  - "$bold(A)^k = bold(I)$" $arrow.r$ eigenvalues are $k$-th roots of unity
  - "$bold(A)^k = bold(0)$" $arrow.r$ nilpotent, all eigenvalues 0, $"tr"(bold(A)^j) = 0$
  - "row/col sums equal" $arrow.r$ $bold(A) bold(1) = s bold(1)$, so $s$ is an eigenvalue
  - "commuting matrices" $arrow.r$ simultaneously diagonalizable (if diagonalizable)
  - "rank + nullity" $arrow.r$ dimension counting, apply rank-nullity
  - "preserve norms" $arrow.r$ orthogonal/unitary, $|det| = 1$
]
