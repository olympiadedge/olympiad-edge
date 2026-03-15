// ════════════════════════════════════════════════════════════
// CHAPTER 7: ADVANCED TOPICS
// ════════════════════════════════════════════════════════════

= Advanced Linear Algebra

== Minimal Polynomial

#definition[
  The *minimal polynomial* $m_bold(A)(x)$ of a matrix $bold(A)$ is the monic polynomial of smallest degree such that $m_bold(A)(bold(A)) = bold(0)$. It divides the characteristic polynomial $chi_bold(A)(x)$, and they share the same roots.
]

#tldr[Minimal polynomial = sharpest polynomial that kills $bold(A)$. Same roots as characteristic polynomial, but possibly lower multiplicities.]

#trickbox[
  *"$bold(A)^k = bold(0)$" or "$p(bold(A)) = bold(0)$"?* The minimal polynomial divides $p(x)$. This constrains eigenvalues to be roots of $p$.
]

== Nilpotent Matrices

#conceptbox(title: "Nilpotent Matrices")[
  $bold(N)$ is *nilpotent* if $bold(N)^k = bold(0)$ for some $k$. Equivalently, all eigenvalues are 0. Key facts:
  - $"tr"(bold(N)^j) = 0$ for all $j >= 1$
  - $bold(I) + bold(N)$ is always invertible: $(bold(I) + bold(N))^(-1) = bold(I) - bold(N) + bold(N)^2 - dots.c + (-1)^(k-1) bold(N)^(k-1)$
  - The *nilpotency index* is the smallest $k$ with $bold(N)^k = bold(0)$; satisfies $k <= n$
]

#trapbox[
  $bold(A)^2 = bold(0)$ does NOT mean $bold(A) = bold(0)$. Example: $bold(A) = mat(0, 1; 0, 0)$. Nilpotent matrices can be nonzero!
]

== Jordan Normal Form (Conceptual)

#conceptbox(title: "Jordan Form — What You Need for Putnam")[
  Every matrix over $CC$ is similar to a block-diagonal matrix of *Jordan blocks* $bold(J)_k (lambda) = lambda bold(I)_k + bold(N)_k$ where $bold(N)_k$ has 1's on the superdiagonal. You rarely compute this on Putnam. What matters:
  - A matrix is diagonalizable $arrow.l.r$ all Jordan blocks are $1 times 1$
  - The number of Jordan blocks for $lambda$ = $dim ker(bold(A) - lambda bold(I))$
  - Powers: $bold(J)_k (lambda)^m$ involves binomial coefficients times $lambda^(m-j)$
]

== Trace Tricks

#stratbox[
  *Trace is your best friend on Putnam.* It's the cheapest invariant to compute. Use these:
  - $"tr"(bold(A) bold(B)) = "tr"(bold(B) bold(A))$ (cyclic property)
  - $"tr"(bold(A)) = sum lambda_i$ (sum of eigenvalues)
  - $"tr"(bold(A)^T bold(A)) = sum_(i,j) a_(i j)^2 >= 0$, with equality iff $bold(A) = bold(0)$
  - $"tr"(bold(A)^2) >= 0$ for symmetric $bold(A)$ (eigenvalues are real)
]

#trickbox[
  *"Sum of diagonal entries" or "sum of eigenvalues"?* Think trace. If the problem involves $bold(A) bold(B)$ vs $bold(B) bold(A)$, cyclic trace is usually the key.
]

== Matrices over Finite Fields

#conceptbox(title: "$FF_p$ Linear Algebra")[
  Over $FF_p = ZZ slash p ZZ$, vector spaces and matrices work the same way, but:
  - $FF_p^n$ has exactly $p^n$ vectors
  - $"GL"_n (FF_p)$ has $(p^n - 1)(p^n - p)(p^n - p^2) dots.c (p^n - p^(n-1))$ elements
  - Counting subspaces: the number of $k$-dimensional subspaces of $FF_p^n$ is the *Gaussian binomial* $binom(n, k)_p$
]

== Rank Inequalities

#theorem[
  *Sylvester's rank inequality*: For $bold(A) in RR^(m times n)$, $bold(B) in RR^(n times p)$:
  $ "rank"(bold(A)) + "rank"(bold(B)) - n <= "rank"(bold(A) bold(B)) <= min("rank"(bold(A)), "rank"(bold(B))) $
]

#tldr[Multiplying matrices can only lose rank (right side), but not too much (left side: Sylvester).]

#drill-header("Advanced Topics")

#prob(1)[
  #difficulty(1)
  Let $bold(A)$ be $n times n$ with $bold(A)^3 = bold(A)$. Show all eigenvalues of $bold(A)$ lie in ${-1, 0, 1}$.
]

#prob(2)[
  #difficulty(2)
  Let $bold(A)$ and $bold(B)$ be $n times n$ matrices. Prove $"tr"(bold(A)^T bold(B))^2 <= "tr"(bold(A)^T bold(A)) dot "tr"(bold(B)^T bold(B))$.
]
#hint(1)[Think of $"tr"(bold(A)^T bold(B))$ as an inner product.]
#hint(2)[Define $angle.l bold(A), bold(B) angle.r = "tr"(bold(A)^T bold(B))$ on the space of $n times n$ matrices.]
#hint(3)[Apply Cauchy-Schwarz in this inner product space.]
#solution[
  The map $angle.l bold(A), bold(B) angle.r = "tr"(bold(A)^T bold(B)) = sum_(i,j) a_(i j) b_(i j)$ is an inner product on $RR^(n times n)$ (it is the standard dot product on entries). Cauchy-Schwarz gives the result immediately.
]

#putnam(2003, "A6")[
  #difficulty(3)
  For a set $S$ of nonneg. integers, let $r_S (n) = |{(a, b) in S times S : a + b = n}|$. Show $r_(S) equiv r_(T) $ is impossible if $S != T$ and both $S, T subset.eq NN$.
]

#prob(4)[
  #difficulty(2)
  Prove that if $bold(N)$ is nilpotent and $bold(A)$ commutes with $bold(N)$, then $bold(A)$ and $bold(A) + bold(N)$ have the same eigenvalues (with the same multiplicities).
]
#hint(1)[Compare the characteristic polynomials.]
#hint(2)[$det(bold(A) + bold(N) - lambda bold(I)) = det((bold(A) - lambda bold(I))(bold(I) + (bold(A) - lambda bold(I))^(-1) bold(N)))$ when $lambda$ is not an eigenvalue of $bold(A)$.]
#hint(3)[Since $bold(N)$ commutes with $bold(A)$, it commutes with $bold(A) - lambda bold(I)$. Then $(bold(A) - lambda bold(I))^(-1) bold(N)$ is nilpotent, so its determinant factor is 1.]
#solution[
  Since $bold(A)$ and $bold(N)$ commute, $bold(N)$ commutes with $bold(A) - lambda bold(I)$ for all $lambda$. The characteristic polynomial of $bold(A) + bold(N)$ is $det(bold(A) + bold(N) - lambda bold(I))$. For $lambda$ not an eigenvalue of $bold(A)$, factor as $det(bold(A) - lambda bold(I)) det(bold(I) + (bold(A) - lambda bold(I))^(-1) bold(N))$. Since $(bold(A) - lambda bold(I))^(-1) bold(N)$ is nilpotent (commutativity ensures this), the second determinant equals 1. So $chi_(bold(A)+bold(N))(lambda) = chi_bold(A)(lambda)$ as polynomials (they agree at infinitely many points).
]

#prob(5)[
  #difficulty(2)
  How many invertible $2 times 2$ matrices are there over $FF_3$? Over $FF_p$ in general?
]

#prob(6)[
  #difficulty(3)
  Let $bold(A), bold(B)$ be $n times n$ real matrices with $"rank"(bold(A)) + "rank"(bold(B)) = n$ and $bold(A) bold(B) = bold(0)$. Show that $"im"(bold(B)) = ker(bold(A))$.
]
#hint(1)[Rank-nullity gives $dim ker(bold(A)) = n - "rank"(bold(A)) = "rank"(bold(B))$.]
#hint(2)[$bold(A) bold(B) = bold(0)$ means $"im"(bold(B)) subset.eq ker(bold(A))$.]
#hint(3)[A subspace contained in another subspace of the same dimension must equal it.]
#solution[
  $bold(A) bold(B) = bold(0)$ implies $"im"(bold(B)) subset.eq ker(bold(A))$. By rank-nullity, $dim ker(bold(A)) = n - "rank"(bold(A)) = "rank"(bold(B)) = dim "im"(bold(B))$. A subspace contained in another of equal dimension must be equal: $"im"(bold(B)) = ker(bold(A))$.
]
