// Chapter 3: Matrices and Invertibility

= Matrices and Invertibility

== Matrix Operations and Row Reduction

#conceptbox(title: "Row reduction is your computational backbone")[
  Every matrix row-reduces to a unique *reduced row echelon form* (RREF). The pivots tell you everything: rank, whether the system is consistent, free variables, and invertibility.
]

#stratbox[
  *RREF on Putnam.* You rarely row-reduce explicitly on Putnam, but the _ideas_ (pivot counting, free variables) appear constantly. Think "how many pivots?" rather than grinding out elimination.
]

== The Big Invertibility Theorem

#theorem[
  For an $n times n$ matrix $bold(A)$, the following are equivalent:
  + $bold(A)$ is invertible.
  + $bold(A) bold(x) = bold(0)$ has only the trivial solution.
  + The RREF of $bold(A)$ is $bold(I)_n$.
  + $"rank"(bold(A)) = n$.
  + $det(bold(A)) != 0$.
  + The columns of $bold(A)$ are linearly independent.
  + The columns of $bold(A)$ span $RR^n$.
  + The rows of $bold(A)$ are linearly independent.
  + $bold(A)^top$ is invertible.
  + $0$ is not an eigenvalue of $bold(A)$.
]

#tldr[For square matrices, invertible = full rank = nonzero determinant = trivial kernel. Check whichever is easiest.]

#trickbox[
  *"Which invertibility criterion is cheapest?"* On Putnam: if the matrix is triangular, read the determinant off the diagonal. If given abstract properties, check the kernel. If the matrix is a product, use $det(bold(A) bold(B)) = det(bold(A)) det(bold(B))$.
]

#trapbox[
  $bold(A) bold(B) = bold(I)$ does NOT imply $bold(B) bold(A) = bold(I)$ for non-square matrices. For square matrices it does (a one-sided inverse is two-sided), but this fails in infinite dimensions.
]

== Change of Basis and Similarity

#definition[
  Matrices $bold(A)$ and $bold(B)$ are *similar* if $bold(B) = bold(P)^(-1) bold(A) bold(P)$ for some invertible $bold(P)$. Similar matrices represent the same linear map in different bases.
]

#tldr[Similar matrices are the same transformation wearing different coordinate costumes. They share trace, determinant, eigenvalues, and rank.]

#conceptbox(title: "What similarity preserves")[
  If $bold(B) = bold(P)^(-1) bold(A) bold(P)$, then $bold(A)$ and $bold(B)$ share: determinant, trace, eigenvalues (with multiplicities), rank, characteristic polynomial, and minimal polynomial. They do NOT necessarily share entries, eigenvectors, or symmetry.
]

== Problems

#drill-header("Matrices & Invertibility")

#prob(1)[#difficulty(1) Let $bold(A) = mat(1, 2, 3; 0, 1, 4; 0, 0, 1)$. Is $bold(A)$ invertible? Find $det(bold(A))$.]
#hint(1)[$bold(A)$ is upper triangular.]
#hint(2)[The determinant of a triangular matrix is the product of diagonal entries.]
#hint(3)[$det(bold(A)) = 1 dot 1 dot 1 = 1 != 0$.]
#solution[$bold(A)$ is upper triangular with diagonal entries $1, 1, 1$. So $det(bold(A)) = 1 != 0$, hence $bold(A)$ is invertible.]

#prob(2)[#difficulty(1) True or false: if $bold(A)^2 = bold(0)$ (nilpotent), then $bold(A) = bold(0)$. Prove or give a counterexample.]
#hint(1)[Try small matrices. Look for a $2 times 2$ matrix with $bold(A)^2 = bold(0)$ but $bold(A) != bold(0)$.]
#hint(2)[Consider $bold(A) = mat(0, 1; 0, 0)$.]
#hint(3)[Compute $bold(A)^2 = mat(0,0;0,0) = bold(0)$, but $bold(A) != bold(0)$.]
#solution[False. $bold(A) = mat(0, 1; 0, 0)$ satisfies $bold(A)^2 = bold(0)$ but $bold(A) != bold(0)$.]

#prob(3)[#difficulty(2) Let $bold(A)$ be $n times n$ with $bold(A)^2 = bold(A)$ (idempotent). Prove that $"rank"(bold(A)) + "rank"(bold(I) - bold(A)) = n$.]
#hint(1)[Note that $"im"(bold(A)) subset.eq ker(bold(I) - bold(A))$ since $(bold(I) - bold(A)) bold(A) bold(x) = bold(A) bold(x) - bold(A)^2 bold(x) = bold(0)$.]
#hint(2)[Similarly, $ker(bold(A)) = "im"(bold(I) - bold(A))$, since $bold(A) bold(x) = bold(0) arrow.r.double bold(x) = (bold(I) - bold(A)) bold(x) in "im"(bold(I) - bold(A))$.]
#hint(3)[Apply rank-nullity to $bold(A)$: $"rank"(bold(A)) + "nullity"(bold(A)) = n$. Since $ker(bold(A)) = "im"(bold(I) - bold(A))$, we get $"nullity"(bold(A)) = "rank"(bold(I) - bold(A))$.]
#solution[Since $bold(A)^2 = bold(A)$, for any $bold(x) in ker(bold(A))$ we have $bold(x) = bold(x) - bold(A) bold(x) = (bold(I) - bold(A)) bold(x) in "im"(bold(I) - bold(A))$. Conversely, $(bold(I) - bold(A)) bold(y) in ker(bold(A))$ since $bold(A)(bold(I) - bold(A)) bold(y) = (bold(A) - bold(A)^2) bold(y) = bold(0)$. So $ker(bold(A)) = "im"(bold(I) - bold(A))$, meaning $"nullity"(bold(A)) = "rank"(bold(I) - bold(A))$. By rank-nullity: $"rank"(bold(A)) + "rank"(bold(I) - bold(A)) = n$.]

#putnam(2017, "B2")[Let $bold(A)$ be a real $2 times 2$ matrix with $det(bold(A)) = 1$ and $"tr"(bold(A)) = 3$. Determine $"tr"(bold(A)^2)$ and $"tr"(bold(A)^(-1))$.]
#hint(1)[For $"tr"(bold(A)^2)$: use $"tr"(bold(A))^2 = "tr"(bold(A)^2) + 2 det(bold(A))$ (from Cayley-Hamilton or direct expansion).]
#hint(2)[$"tr"(bold(A)^2) = "tr"(bold(A))^2 - 2 det(bold(A)) = 9 - 2 = 7$.]
#hint(3)[For $bold(A)^(-1)$: by Cayley-Hamilton, $bold(A)^2 - 3 bold(A) + bold(I) = bold(0)$, so $bold(A)^(-1) = 3 bold(I) - bold(A)$, giving $"tr"(bold(A)^(-1)) = 6 - 3 = 3$.]
#solution[The characteristic polynomial is $lambda^2 - 3 lambda + 1 = 0$ (since $"tr" = 3$, $det = 1$). By Cayley-Hamilton: $bold(A)^2 - 3 bold(A) + bold(I) = bold(0)$. Taking traces: $"tr"(bold(A)^2) - 3 dot 3 + 2 = 0$, so $"tr"(bold(A)^2) = 7$. Multiplying Cayley-Hamilton by $bold(A)^(-1)$: $bold(A) - 3 bold(I) + bold(A)^(-1) = bold(0)$, so $bold(A)^(-1) = 3 bold(I) - bold(A)$ and $"tr"(bold(A)^(-1)) = 6 - 3 = 3$.]

#prob(4)[#difficulty(2) Show that if $bold(A)$ and $bold(B)$ are similar, they have the same characteristic polynomial.]
#hint(1)[$bold(B) = bold(P)^(-1) bold(A) bold(P)$. Compute $det(bold(B) - lambda bold(I))$.]
#hint(2)[$det(bold(P)^(-1) bold(A) bold(P) - lambda bold(I)) = det(bold(P)^(-1)(bold(A) - lambda bold(I)) bold(P))$.]
#hint(3)[Use $det(bold(X) bold(Y)) = det(bold(X)) det(bold(Y))$.]
#solution[$det(bold(B) - lambda bold(I)) = det(bold(P)^(-1) bold(A) bold(P) - lambda bold(P)^(-1) bold(I) bold(P)) = det(bold(P)^(-1)(bold(A) - lambda bold(I)) bold(P)) = det(bold(P)^(-1)) det(bold(A) - lambda bold(I)) det(bold(P)) = det(bold(A) - lambda bold(I))$.]

#prob(5)[#difficulty(2) Let $bold(A)$ be an $n times n$ matrix with $bold(A)^3 = bold(I)$. Prove $"rank"(bold(A) - bold(I)) = "rank"(bold(A)^2 + bold(A) + bold(I)) - n + "rank"(bold(A) - bold(I))$... actually, prove that $ker(bold(A) - bold(I)) plus.o ker(bold(A)^2 + bold(A) + bold(I)) = RR^n$ (direct sum).]
#hint(1)[Factor: $bold(A)^3 - bold(I) = (bold(A) - bold(I))(bold(A)^2 + bold(A) + bold(I)) = bold(0)$.]
#hint(2)[If $bold(v) in ker(bold(A) - bold(I)) inter ker(bold(A)^2 + bold(A) + bold(I))$, then $bold(A) bold(v) = bold(v)$ and $bold(v) + bold(v) + bold(v) = bold(0)$, so $3 bold(v) = bold(0)$, meaning $bold(v) = bold(0)$.]
#hint(3)[For any $bold(v)$, write $3 bold(v) = (2 bold(I) - bold(A) - bold(A)^2) bold(v) + (bold(A)^2 + bold(A) + bold(I)) bold(v) - bold(v) + bold(v)$. More cleanly: $bold(v) = 1/3 (bold(A)^2 + bold(A) + bold(I)) bold(v) + 1/3 (2 bold(I) - bold(A) - bold(A)^2) bold(v)$. Check each piece lands in the right kernel.]
#solution[Since $(bold(A) - bold(I))(bold(A)^2 + bold(A) + bold(I)) = bold(0)$, we have $"im"(bold(A)^2 + bold(A) + bold(I)) subset.eq ker(bold(A) - bold(I))$. The interinterion $ker(bold(A) - bold(I)) inter ker(bold(A)^2 + bold(A) + bold(I))$ is trivial: if $bold(A) bold(v) = bold(v)$ and $bold(A)^2 bold(v) + bold(A) bold(v) + bold(v) = bold(0)$, substituting gives $3 bold(v) = bold(0)$ so $bold(v) = bold(0)$. For the direct sum decomposition, write $bold(v) = bold(u) + bold(w)$ where $bold(u) = 1/3 (bold(A)^2 + bold(A) + bold(I)) bold(v)$ and $bold(w) = bold(v) - bold(u)$. One verifies $(bold(A) - bold(I)) bold(u) = 1/3 (bold(A)^3 - bold(I)) bold(v) = bold(0)$ and $(bold(A)^2 + bold(A) + bold(I)) bold(w) = bold(0)$.]

#putnam(2014, "B5")[Let $bold(A)$ be a real $n times n$ matrix satisfying $bold(A) + bold(A)^top = bold(I)$. Show that $n$ is odd and $det(bold(A)) > 0$.]
#hint(1)[Taking transposes: $bold(A)^top + bold(A) = bold(I)$, consistent. Now compute $det$: $det(bold(A) + bold(A)^top) = det(bold(I)) = 1$.]
#hint(2)[From $bold(A)^top = bold(I) - bold(A)$, take $det$: $det(bold(A)^top) = det(bold(I) - bold(A))$, so $det(bold(A)) = det(bold(I) - bold(A))$.]
#hint(3)[Also $bold(A) + bold(A)^top = bold(I)$ implies $bold(A)$ has eigenvalues with real part $1\/2$. If $lambda$ is an eigenvalue, then $overline(lambda)$ is too, and they appear in conjugate pairs (unless real, forcing $lambda = 1\/2$). For $n$ even, $det(bold(I) - 2 bold(A)) = det(bold(I) - 2 bold(A))^top = det(-bold(I) + 2 bold(A)^top) dots$]
#solution[From $bold(A)^top = bold(I) - bold(A)$: the matrix $bold(S) = bold(A) - 1/2 bold(I)$ satisfies $bold(S)^top = -bold(S)$ (skew-symmetric). So $det(bold(S)) = det(-bold(S)^top) = (-1)^n det(bold(S))$. If $n$ is even, $det(bold(S)) = det(bold(S))$, which is consistent but doesn't force anything. However, $det(bold(A)) = det(1/2 bold(I) + bold(S))$ and $det(bold(A)^top) = det(1/2 bold(I) - bold(S))$. Since $det(bold(A)) = det(bold(A)^top)$, and the characteristic poly of $bold(S)$ has purely imaginary eigenvalues $plus.minus i beta_k$, we get $det(bold(A)) = product (1\/4 + beta_k^2) > 0$. For parity: $"tr"(bold(A) + bold(A)^top) = "tr"(bold(I)) = n$, and $"tr"(bold(A) + bold(A)^top) = 2 "tr"(bold(A))$, so $"tr"(bold(A)) = n\/2$. Since $bold(A)$ is real and its eigenvalues come in conjugate pairs $1\/2 plus.minus i beta$, plus possibly real eigenvalue $1\/2$, the number of real eigenvalues must be odd (so that the total count $n$ has the right parity), forcing $n$ odd.]
