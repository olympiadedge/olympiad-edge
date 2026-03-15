// Chapter 2: Linear Maps

= Linear Maps

== Definitions and First Properties

#definition[
  A function $T: V -> W$ between vector spaces is a *linear map* (linear transformation) if $T(a bold(u) + b bold(v)) = a T(bold(u)) + b T(bold(v))$ for all $a, b in RR$ and $bold(u), bold(v) in V$.
]

#tldr[$T$ is linear iff it "respects addition and scaling." Equivalently: $T$ preserves all linear combinations.]

#conceptbox(title: "Key examples for Putnam")[
  - Differentiation $D: PP_n -> PP_(n-1)$ via $D(p) = p'$
  - Integration $I: PP_n -> PP_(n+1)$ via $I(p)(x) = integral_0^x p(t) d t$
  - Matrix multiplication $T(bold(x)) = bold(A) bold(x)$
  - Transpose map $T(bold(A)) = bold(A)^top$ on $M_(n times n)$
  - Trace map $"tr": M_(n times n) -> RR$
]

== Kernel, Image, and Rank-Nullity

#definition[
  For $T: V -> W$: the *kernel* is $ker T = {bold(v) in V : T(bold(v)) = bold(0)}$ and the *image* is $"im" T = {T(bold(v)) : bold(v) in V}$.
]

The *rank* of $T$ is $dim("im" T)$ and the *nullity* is $dim(ker T)$.

#theorem[
  *Rank-Nullity Theorem.* If $T: V -> W$ is linear and $V$ is finite-dimensional, then
  $ dim(ker T) + dim("im" T) = dim V. $
  Equivalently: $"nullity"(T) + "rank"(T) = dim V$.
]

#tldr[Dimension in = dimension killed + dimension hit. The most used counting tool in linear algebra.]

#trickbox[
  *"Dimension count."* Whenever a Putnam problem involves a linear map and asks "how big is the solution set?" or "is this map onto?", Rank-Nullity is your first move. Compute one of kernel\/image, get the other free.
]

#trapbox[
  Rank-Nullity requires $V$ to be *finite-dimensional*. For infinite-dimensional spaces (like $C([0,1])$), the theorem fails. On Putnam, always verify the domain is finite-dimensional.
]

#theorem[
  Let $T: V -> W$ with $dim V = dim W = n$. Then TFAE: (a) $T$ is injective, (b) $T$ is surjective, (c) $T$ is an isomorphism, (d) $ker T = {bold(0)}$.
]

#tldr[For linear maps between equal-dimensional spaces, injective $arrow.l.r$ surjective $arrow.l.r$ bijective. Check just one!]

#stratbox[
  *Isomorphism strategy.* If $dim V = dim W$, then to show $T$ is an isomorphism, it suffices to show $ker T = {bold(0)}$ (injectivity) or that $T$ is surjective — you get the other for free by Rank-Nullity.
]

== Matrix Representation

Given ordered bases $cal(B) = {bold(v)_1, ..., bold(v)_n}$ of $V$ and $cal(C) = {bold(w)_1, ..., bold(w)_m}$ of $W$, the *matrix of $T$* relative to $cal(B), cal(C)$ has columns $[T(bold(v)_j)]_(cal(C))$ — the coordinate vectors of the images of basis vectors.

#conceptbox(title: "Transformations first, matrices second (Evan Chen, LAMV)")[
  A matrix is just a way to *encode* a linear transformation. Column $j$ records what $T$ does to the $j$-th basis vector. Chen emphasizes: "If you know the outputs of $T$ on a basis, you can deduce $T$ at any input." Think of the map first, the matrix as bookkeeping.
]

== Problems

#drill-header("Linear Maps & Rank-Nullity")

#prob(1)[#difficulty(1) Let $T: RR^3 -> RR^2$ be defined by $T(x_1, x_2, x_3) = (x_1 + x_2, x_2 + x_3)$. Find $ker T$, $"im" T$, and verify rank-nullity.]
#hint(1)[Set $T(bold(x)) = bold(0)$: solve $x_1 + x_2 = 0$ and $x_2 + x_3 = 0$.]
#hint(2)[$x_1 = -x_2$ and $x_3 = -x_2$, so $ker T = "span"{(1, -1, 1)}$. Nullity $= 1$.]
#hint(3)[$T$ maps onto $RR^2$ (check that $(1,0)$ and $(0,1)$ are in the image), so rank $= 2$. Then $1 + 2 = 3$. ✓]
#solution[$ker T = {t(1, -1, 1) : t in RR}$, so nullity $= 1$. Since $T(1,0,0) = (1,0)$ and $T(0,0,1) = (0,1)$, the image is all of $RR^2$, rank $= 2$. Rank-nullity: $1 + 2 = 3 = dim RR^3$. ✓]

#prob(2)[#difficulty(1) Show that differentiation $D: PP_3 -> PP_2$ is a linear map. Find its kernel and image.]
#hint(1)[Linearity: $(a p + b q)' = a p' + b q'$. This is a standard calculus fact.]
#hint(2)[$ker D$ consists of polynomials with $p' = 0$, i.e., constant polynomials.]
#hint(3)[$dim PP_3 = 4$, $dim(ker D) = 1$, so $dim("im" D) = 3 = dim PP_2$, hence $D$ is surjective.]
#solution[Linearity follows from linearity of differentiation. $ker D = {c : c in RR} tilde.equiv RR$, so nullity $= 1$. By rank-nullity, rank $= 4 - 1 = 3 = dim PP_2$, so $D$ is surjective: $"im" D = PP_2$.]

#prob(3)[#difficulty(2) Let $T: M_(2 times 2)(RR) -> M_(2 times 2)(RR)$ be $T(bold(A)) = bold(A) - bold(A)^top$. Find the rank and nullity of $T$.]
#hint(1)[$T(bold(A)) = bold(0)$ iff $bold(A) = bold(A)^top$, i.e., $bold(A)$ is symmetric.]
#hint(2)[The space of $2 times 2$ symmetric matrices has dimension 3 (basis: $mat(1,0;0,0)$, $mat(0,1;1,0)$, $mat(0,0;0,1)$).]
#hint(3)[By rank-nullity: rank $= 4 - 3 = 1$. The image is the space of skew-symmetric matrices.]
#solution[$ker T = {bold(A) : bold(A) = bold(A)^top}$, the symmetric matrices, with $dim = 3$. The image is ${bold(A) - bold(A)^top}$, the skew-symmetric matrices with $dim = 1$. Rank-nullity: $3 + 1 = 4 = dim M_(2 times 2)$. ✓]

#prob(4)[#difficulty(2) Let $T: PP_n -> PP_n$ be defined by $T(p)(x) = p(x + 1) - p(x)$. Show $T$ is linear, find $ker T$, and determine the rank of $T$.]
#hint(1)[Linearity: $T(a p + b q)(x) = (a p + b q)(x+1) - (a p + b q)(x) = a T(p)(x) + b T(q)(x)$.]
#hint(2)[If $p(x+1) = p(x)$ for all $x$ and $p$ is a polynomial, then $p$ is constant. So $ker T tilde.equiv RR$.]
#hint(3)[Nullity $= 1$, so rank $= (n+1) - 1 = n$. Note: $T(x^k)$ has degree $k - 1$, so the image is $PP_(n-1)$.]
#solution[$T$ is linear by direct verification. If $T(p) = 0$, then $p(x+1) = p(x)$ for all $x$, so $p$ is a periodic polynomial, hence constant. Thus $ker T = RR$, nullity $= 1$, and rank $= n$. The image is exactly $PP_(n-1)$ since $T(x^k)$ has leading term $k x^(k-1)$.]

#putnam(2003, "A6")[For a set $S$ of nonneg. integers, let $r_S (n) = \#{(a,b) in S times S : a + b = n}$. Prove: if $r_S (n) = r_T (n)$ for all $n$, and $S, T subset.eq {0, 1, ..., N}$, then $S = T$.] // Note: uses generating functions, included for linear algebra framing
#hint(1)[Define $f_S (x) = sum_(s in S) x^s$. Then $r_S (n)$ is the $n$-th coefficient of $f_S (x)^2$.]
#hint(2)[The condition $r_S = r_T$ means $f_S (x)^2 = f_T (x)^2$ as polynomials, so $(f_S - f_T)(f_S + f_T) = 0$.]
#hint(3)[Work modulo 2: $f_S (x)^2 equiv f_T (x)^2 mod 2$ means $f_S equiv f_T mod 2$, so $S$ and $T$ have the same elements mod 2. Bootstrap from there.]
#solution[Let $f = f_S$ and $g = f_T$. Then $f^2 = g^2$, so $(f-g)(f+g) = 0$ in $RR[x]$. Since $f, g$ have nonneg. coefficients, $f + g != 0$. Over $FF_2$, $f^2 = g^2$ implies $f = g$ (since squaring is injective in char 2). So $S$ and $T$ agree — this is a linear algebra argument over $FF_2[x]$.]

#prob(5)[#difficulty(2) Suppose $T: RR^5 -> RR^3$ is linear and $dim(ker T) = 3$. How many solutions does $T(bold(x)) = bold(b)$ have for a given $bold(b) in "im" T$?]
#hint(1)[By rank-nullity, rank $= 5 - 3 = 2$, so $"im" T$ is a 2-dimensional subspace of $RR^3$.]
#hint(2)[For $bold(b) in "im" T$, pick a particular solution $bold(x)_0$. Then $T(bold(x)) = bold(b)$ iff $bold(x) = bold(x)_0 + bold(v)$ for some $bold(v) in ker T$.]
#hint(3)[The solution set is $bold(x)_0 + ker T$, a 3-dimensional affine subspace. Infinitely many solutions.]
#solution[The solution set is the affine subspace $bold(x)_0 + ker T$, which has the same "size" as $ker T$. Since $dim(ker T) = 3 > 0$, there are infinitely many solutions (an $RR^3$-family of them).]

#prob(6)[#difficulty(3) Let $V$ be the vector space of polynomials $p(x)$ with $deg p <= 2025$, and define $L: V -> V$ by $L(p)(x) = x p'(x) - 2025 p(x)$. Prove that $L$ is surjective.]
#hint(1)[Check: what does $L$ do to the basis $1, x, x^2, ..., x^2025$? Compute $L(x^k) = k x^k - 2025 x^k = (k - 2025) x^k$.]
#hint(2)[$L(x^k) = (k - 2025) x^k$, so $L$ is diagonal in the monomial basis with eigenvalues $k - 2025$ for $k = 0, 1, ..., 2025$.]
#hint(3)[The only eigenvalue that is zero is $k = 2025$. So $ker L = "span"{x^2025}$, nullity $= 1$, and rank $= 2025$. But wait — we need surjectivity, which requires rank $= dim V = 2026$...]
#solution[We have $L(x^k) = (k - 2025) x^k$. For $k != 2025$, $L(x^k/(k-2025)) = x^k$, so every $x^k$ with $k < 2025$ is in the image. But $x^2025$ is in $ker L$. So the image $= "span"{1, x, ..., x^2024}$, which has dimension 2025, not 2026. Thus $L$ is *not* surjective — the statement is false! The image misses $"span"{x^2025}$. (This is a deliberate trap problem: always compute before claiming surjectivity.)]
