// ════════════════════════════════════════════════════════════
// CHAPTER 6: INNER PRODUCT SPACES
// ════════════════════════════════════════════════════════════

= Inner Product Spaces

== The Inner Product

#definition[
  An *inner product* on a real vector space $V$ is a function $lr(angle.l dot , dot angle.r) : V times V -> RR$ satisfying:
  + *Symmetry*: $lr(angle.l bold(u), bold(v) angle.r) = lr(angle.l bold(v), bold(u) angle.r)$
  + *Linearity*: $lr(angle.l a bold(u) + b bold(w), bold(v) angle.r) = a lr(angle.l bold(u), bold(v) angle.r) + b lr(angle.l bold(w), bold(v) angle.r)$
  + *Positive definiteness*: $lr(angle.l bold(u), bold(u) angle.r) >= 0$, with equality iff $bold(u) = bold(0)$
]

#trapbox[
  Over $CC$, inner products are *conjugate-linear* in the second argument: $lr(angle.l bold(u), c bold(v) angle.r) = overline(c) lr(angle.l bold(u), bold(v) angle.r)$. Putnam rarely tests complex inner products, but know the distinction.
]

== Cauchy-Schwarz: The Most Important Inequality

#theorem[
  For any $bold(u), bold(v)$ in an inner product space: $ |lr(angle.l bold(u), bold(v) angle.r)|^2 <= lr(angle.l bold(u), bold(u) angle.r) dot lr(angle.l bold(v), bold(v) angle.r) $ Equality holds iff $bold(u)$ and $bold(v)$ are linearly dependent.
]

#tldr[Cauchy-Schwarz: the dot product never exceeds the product of norms. Equality $arrow.l.r$ parallel.]

#trickbox[
  *See an inequality involving sums of products?* Try encoding the sums as inner products of cleverly chosen vectors, then apply Cauchy-Schwarz.
]

#stratbox[
  *Cauchy-Schwarz toolkit*: Set $bold(u) = (a_1, ..., a_n)$, $bold(v) = (b_1, ..., b_n)$. Then $(sum a_i b_i)^2 <= (sum a_i^2)(sum b_i^2)$. For integrals: $(integral f g)^2 <= (integral f^2)(integral g^2)$.
]

== Orthogonality and Gram-Schmidt

#conceptbox(title: "Gram-Schmidt Process")[
  Given linearly independent $bold(v)_1, ..., bold(v)_n$, produce orthonormal $bold(e)_1, ..., bold(e)_n$:
  $ bold(e)_1 = bold(v)_1 / norm(bold(v)_1), quad bold(e)_k = (bold(v)_k - sum_(j=1)^(k-1) lr(angle.l bold(v)_k, bold(e)_j angle.r) bold(e)_j) / norm(dot) $
  *Key property*: $"span"(bold(e)_1, ..., bold(e)_k) = "span"(bold(v)_1, ..., bold(v)_k)$ for every $k$.
]

#conceptbox(title: "Orthogonal Projection")[
  The projection of $bold(v)$ onto subspace $W$ with orthonormal basis ${bold(e)_1, ..., bold(e)_k}$:
  $ "proj"_W (bold(v)) = sum_(i=1)^k lr(angle.l bold(v), bold(e)_i angle.r) bold(e)_i $
  This is the *closest point* in $W$ to $bold(v)$.
]

== Orthogonal and Unitary Matrices

#definition[
  $bold(Q) in RR^(n times n)$ is *orthogonal* if $bold(Q)^T bold(Q) = bold(I)$, equivalently its columns form an orthonormal set. Over $CC$: *unitary* means $bold(Q)^* bold(Q) = bold(I)$.
]

#tldr[Orthogonal matrices preserve lengths and angles. $det(bold(Q)) = plus.minus 1$. Eigenvalues lie on the unit circle.]

#trickbox[
  *"Preserves lengths" or "preserves distances"?* The matrix is orthogonal. Immediately conclude $det = plus.minus 1$ and all eigenvalues have modulus 1.
]

#drill-header("Inner Products & Orthogonality")

#prob(1)[
  #difficulty(1)
  Prove that if $bold(u)$ and $bold(v)$ are orthogonal, then $norm(bold(u) + bold(v))^2 = norm(bold(u))^2 + norm(bold(v))^2$.
]

#prob(2)[
  #difficulty(1)
  Let $bold(A)$ be a real $n times n$ orthogonal matrix. Show that if $n$ is odd, then $det(bold(A)) = 1$ or $det(bold(A)) = -1$, and that $bold(A)$ must have a real eigenvalue.
]

#prob(3)[
  #difficulty(2)
  Prove: $(sum_(i=1)^n a_i b_i)^2 <= (sum_(i=1)^n a_i^2)(sum_(i=1)^n b_i^2)$ by considering vectors in $RR^n$.
]

#putnam(2009, "B2")[
  #difficulty(2)
  A matrix is called *special* if it is real, has integer entries, and its columns are orthogonal. How many $2 times 2$ special matrices are there with entries from ${-1, 0, 1}$?
]

#hint(1)[Orthogonal columns means the dot product of the two columns is zero.]
#hint(2)[Enumerate: columns can be zero vectors or from ${-1, 0, 1}^2$. Check which pairs are orthogonal.]
#hint(3)[Don't forget the zero matrix. Count systematically by the first column.]
#solution[
  Let columns be $bold(c)_1 = vec(a, b)$ and $bold(c)_2 = vec(c, d)$. Need $a c + b d = 0$ with $a, b, c, d in {-1, 0, 1}$. Enumerate by $bold(c)_1$: if $bold(c)_1 = vec(0,0)$, any $bold(c)_2$ works (9 choices). If $bold(c)_1$ has one nonzero entry, say $vec(1,0)$, then $c = 0$ and $d$ is free (3 choices). There are 4 such columns, giving $4 dot 3 = 12$. If $bold(c)_1 = vec(plus.minus 1, plus.minus 1)$, need $c = -d$ or $c = d$ depending on signs; 3 choices each, 4 columns, giving $4 dot 3 = 12$. Total: $9 + 12 + 12 = 33$.
]

#prob(5)[
  #difficulty(2)
  Let $V$ be the space of real polynomials of degree $<= 2$ with inner product $lr(angle.l f, g angle.r) = integral_0^1 f(x) g(x) d x$. Apply Gram-Schmidt to ${1, x, x^2}$ to find an orthonormal basis.
]

#prob(6)[
  #difficulty(3)
  Let $bold(A)$ be a real $n times n$ matrix satisfying $bold(A)^T bold(A) = bold(A)$. Show that $bold(A)$ is symmetric and idempotent ($bold(A)^2 = bold(A)$), so $bold(A)$ is an orthogonal projection.
]

#putnam(2017, "A5")[
  #difficulty(3)
  Let $bold(v)_1, ..., bold(v)_n$ be vectors in $RR^n$ with $norm(bold(v)_i) <= 1$ for all $i$. Show there exist $epsilon_1, ..., epsilon_n in {-1, +1}$ such that $norm(epsilon_1 bold(v)_1 + dots.c + epsilon_n bold(v)_n)^2 <= n$.
]

#hint(1)[Expand $norm(sum epsilon_i bold(v)_i)^2$ and take an expectation over random signs.]
#hint(2)[Cross terms vanish in expectation since $EE[epsilon_i epsilon_j] = 0$ for $i != j$.]
#hint(3)[The expected value is $sum norm(bold(v)_i)^2 <= n$, so some choice achieves $<= n$.]
#solution[
  Choose each $epsilon_i$ independently and uniformly from ${-1,+1}$. Then $EE[norm(sum epsilon_i bold(v)_i)^2] = sum_(i,j) EE[epsilon_i epsilon_j] lr(angle.l bold(v)_i, bold(v)_j angle.r) = sum_i norm(bold(v)_i)^2 <= n$. Since the expectation is $<= n$, some particular choice of signs achieves $norm(sum epsilon_i bold(v)_i)^2 <= n$.
]
