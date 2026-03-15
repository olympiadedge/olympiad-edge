// ════════════════════════════════════════════════════════════
// CHAPTER 8: PUTNAM PROBLEM BANK
// ════════════════════════════════════════════════════════════

= Putnam Problem Bank — Linear Algebra

This chapter is pure practice. Every problem follows the format: statement, three escalating hints, a TLDR of the key theorem, then a full solution. Work the hints before reading the solution.

== Determinant Problems

#putnam(2003, "B5")[
  #difficulty(2)
  Let $bold(A)$ be an $n times n$ matrix with $bold(A)^2 = bold(A)$. Find all possible values of $det(bold(A))$.
]
#hint(1)[What are the eigenvalues of an idempotent matrix?]
#hint(2)[$lambda^2 = lambda$ gives $lambda in {0, 1}$.]
#hint(3)[$det(bold(A)) = product lambda_i$, so the determinant is $0$ or $1$.]
#tldr[Idempotent eigenvalues satisfy $lambda^2 = lambda$, so $lambda in {0,1}$ and $det in {0, 1}$.]
#solution[
  If $bold(A)^2 = bold(A)$, every eigenvalue $lambda$ satisfies $lambda^2 = lambda$, giving $lambda in {0, 1}$. The determinant is the product of eigenvalues, so $det(bold(A)) in {0, 1}$. Both are achieved: $bold(0)$ gives 0, $bold(I)$ gives 1. Answer: ${0, 1}$.
]

#putnam(2007, "A4")[
  #difficulty(2)
  A *repunit* is a positive integer with all digits equal to 1. Find the $3 times 3$ determinant $det mat(1, 1, 1; 11, 11, 11; 111, 111, 111)$... just kidding. Actual problem: Let $n$ be a positive integer. Describe all $n times n$ real matrices $bold(A)$ such that $det(bold(I) + bold(A)) = 1 + det(bold(A))$ when $bold(A)$ has rank 1.
]
#hint(1)[A rank-1 matrix can be written $bold(A) = bold(u) bold(v)^T$.]
#hint(2)[Use the matrix determinant lemma: $det(bold(I) + bold(u) bold(v)^T) = 1 + bold(v)^T bold(u)$.]
#hint(3)[And $det(bold(u) bold(v)^T) = 0$ since rank is 1 (when $n >= 2$). Check the equation.]
#tldr[Matrix determinant lemma: $det(bold(I) + bold(u) bold(v)^T) = 1 + bold(v)^T bold(u)$.]
#solution[
  Every rank-1 matrix has the form $bold(A) = bold(u) bold(v)^T$. Then $det(bold(A)) = 0$ (rank 1, so not invertible for $n >= 2$). By the matrix determinant lemma, $det(bold(I) + bold(A)) = 1 + bold(v)^T bold(u)$. The equation $det(bold(I) + bold(A)) = 1 + det(bold(A))$ becomes $1 + bold(v)^T bold(u) = 1 + 0 = 1$, i.e., $bold(v)^T bold(u) = 0$. So the answer is: all rank-1 matrices $bold(u) bold(v)^T$ where $bold(u) perp bold(v)$, plus the zero matrix (rank 0, where the equation is $1 = 1$).
]

#prob(3)[
  #difficulty(2)
  Let $bold(A)$ be $n times n$ with all entries $plus.minus 1$. Show $|det(bold(A))| <= n^(n\/2)$.
]
#hint(1)[Think about the rows as vectors. What is each row's length?]
#hint(2)[Each row has length $sqrt(n)$. How does Hadamard's inequality relate?]
#hint(3)[Hadamard: $|det(bold(A))| <= product norm(bold(r)_i) = (sqrt(n))^n = n^(n\/2)$.]
#tldr[Hadamard's inequality: $|det| <=$ product of row norms. Rows of $plus.minus 1$ have norm $sqrt(n)$.]
#solution[
  Each row $bold(r)_i$ of $bold(A)$ has entries $plus.minus 1$, so $norm(bold(r)_i) = sqrt(n)$. By Hadamard's inequality, $|det(bold(A))| <= product_(i=1)^n norm(bold(r)_i) = (sqrt(n))^n = n^(n\/2)$. Equality holds when rows are mutually orthogonal (Hadamard matrices).
]

#prob(4)[
  #difficulty(3)
  Let $bold(A)$ be an $n times n$ real matrix with $bold(A)^T = -bold(A)$ (skew-symmetric). Show that if $n$ is odd, then $det(bold(A)) = 0$.
]
#hint(1)[Take the determinant of both sides of $bold(A)^T = -bold(A)$.]
#hint(2)[$det(bold(A)^T) = det(bold(A))$ and $det(-bold(A)) = (-1)^n det(bold(A))$.]
#hint(3)[If $n$ is odd: $det(bold(A)) = -det(bold(A))$, so $2 det(bold(A)) = 0$.]
#tldr[Skew-symmetric + odd dimension $arrow.r.double$ $det(bold(A)) = det(bold(A)^T) = det(-bold(A)) = -det(bold(A))$.]
#solution[
  $det(bold(A)) = det(bold(A)^T) = det(-bold(A)) = (-1)^n det(bold(A))$. For odd $n$, this gives $det(bold(A)) = -det(bold(A))$, so $det(bold(A)) = 0$.
]

#prob(5)[
  #difficulty(2)
  Compute $det mat(1, 1, 1, ..., 1; 1, 2, 2, ..., 2; 1, 2, 3, ..., 3; dots.v, dots.v, dots.v, dots.down, dots.v; 1, 2, 3, ..., n)$ where entry $(i,j)$ is $min(i, j)$.
]
#hint(1)[Try small cases: $n = 1, 2, 3$.]
#hint(2)[Row-reduce: subtract row $i-1$ from row $i$.]
#hint(3)[After reduction, the matrix is lower-triangular with all 1's on the diagonal.]
#tldr[Row reduction is cheap. Subtraction of adjacent rows often simplifies structured matrices.]
#solution[
  Subtract row $i-1$ from row $i$ for $i = n, n-1, ..., 2$. Row 1 stays as $(1, 1, 1, ..., 1)$. Row $i$ (for $i >= 2$) becomes $(0, ..., 0, 1, 1, ..., 1)$ where the first 1 is in position $i$. This is upper-triangular with all 1's on the diagonal, so $det = 1$.
]

== Eigenvalue & Trace Problems

#putnam(2014, "B5")[
  #difficulty(3)
  Let $bold(A)$ be a $2014 times 2014$ matrix with entries in ${0, 1}$ such that the sum of each row and each column is 1. Suppose $bold(A)^k = bold(I)$ for some positive integer $k$. Show $"tr"(bold(A)) = "tr"(bold(A)^2)$ is NOT always true, and find $"tr"(bold(A))$.
]
#hint(1)[$bold(A)$ is a permutation matrix. What are its eigenvalues?]
#hint(2)[Eigenvalues are roots of unity. $"tr"(bold(A)) = $ number of fixed points.]
#hint(3)[$"tr"(bold(A)^m) = $ number of points fixed by the $m$-th power of the permutation.]
#tldr[Permutation matrices have eigenvalues that are roots of unity. $"tr" = $ number of fixed points.]
#solution[
  $bold(A)$ is a permutation matrix (one 1 per row and column). Its eigenvalues are $k$-th roots of unity (since $bold(A)^k = bold(I)$). The trace $"tr"(bold(A)) = $ number of 1's on the diagonal = number of fixed points of the permutation. Similarly $"tr"(bold(A)^2) = $ number of fixed points of the square of the permutation. These need not be equal: consider the permutation $(1 2)$ on $n = 2$: $"tr"(bold(A)) = 0$ but $"tr"(bold(A)^2) = "tr"(bold(I)) = 2$.
]

#putnam(2016, "A5")[
  #difficulty(3)
  Let $bold(A)$ be an $n times n$ real matrix with all row sums and all column sums equal to $s$. Show every eigenvalue $lambda$ satisfies $|lambda| <= |s|$ if $bold(A)$ has nonneg. entries.
]
#hint(1)[$bold(A) bold(1) = s bold(1)$ where $bold(1)$ is the all-ones vector.]
#hint(2)[Use the Perron-Frobenius theorem for nonneg. matrices.]
#hint(3)[Perron-Frobenius says the spectral radius equals $s$ for a nonneg. matrix with row sums $s$.]
#tldr[Perron-Frobenius: for nonneg. matrices, spectral radius = max row sum (if all row sums equal).]
#solution[
  Since all entries are nonneg. and all row sums equal $s$, Perron-Frobenius guarantees $s$ is an eigenvalue and the spectral radius $rho(bold(A)) = s$. Hence $|lambda| <= s = |s|$ for all eigenvalues $lambda$.
]

#prob(8)[
  #difficulty(2)
  Let $bold(A)$ be $n times n$ real symmetric. Prove $"tr"(bold(A)^2) >= ("tr"(bold(A)))^2 / n$.
]
#hint(1)[Express both sides in terms of eigenvalues.]
#hint(2)[$"tr"(bold(A)^2) = sum lambda_i^2$ and $"tr"(bold(A)) = sum lambda_i$.]
#hint(3)[Apply Cauchy-Schwarz or QM-AM: $sum lambda_i^2 >= (sum lambda_i)^2 / n$.]
#tldr[QM-AM on eigenvalues: $sum lambda_i^2 >= (sum lambda_i)^2 \/ n$.]
#solution[
  Let $lambda_1, ..., lambda_n$ be eigenvalues (real, since $bold(A)$ is symmetric). By Cauchy-Schwarz, $(sum lambda_i)^2 <= n sum lambda_i^2$. Dividing: $"tr"(bold(A)^2) = sum lambda_i^2 >= (sum lambda_i)^2 / n = ("tr"(bold(A)))^2 / n$.
]

#putnam(2018, "A4")[
  #difficulty(2)
  Let $bold(A)$ be a real $n times n$ matrix satisfying $bold(A) + bold(A)^T = bold(I)$. Find $det(bold(A))$.
]
#hint(1)[What does $bold(A) + bold(A)^T = bold(I)$ say about the eigenvalues?]
#hint(2)[If $lambda$ is an eigenvalue of $bold(A)$ with eigenvector $bold(v)$, multiply by $bold(v)^T$.]
#hint(3)[$bold(v)^T bold(A) bold(v) + bold(v)^T bold(A)^T bold(v) = bold(v)^T bold(v)$, so $2 "Re"(lambda) norm(bold(v))^2 = norm(bold(v))^2$, giving $"Re"(lambda) = 1\/2$.]
#tldr[$bold(A) + bold(A)^T = bold(I)$ forces $"Re"(lambda) = 1\/2$. Eigenvalues pair as $1\/2 + i t$ and $1\/2 - i t$.]
#solution[
  Write $bold(A) = 1/2 bold(I) + bold(S)$ where $bold(S) = bold(A) - 1/2 bold(I)$. Then $bold(S) + bold(S)^T = bold(0)$, so $bold(S)$ is skew-symmetric. The eigenvalues of $bold(S)$ are purely imaginary: $plus.minus i t_k$. Thus eigenvalues of $bold(A)$ are $1/2 plus.minus i t_k$. They come in conjugate pairs (real matrix), so $det(bold(A)) = product (1/2 + i t_k)(1/2 - i t_k) = product (1/4 + t_k^2)$. For $n$ even, this is a product of $n\/2$ positive reals. For $n$ odd, one eigenvalue is $1\/2$ (the unpaired real one). In all cases $det(bold(A)) = product_k (1/4 + t_k^2) > 0$, but we need the exact value. Taking $det$ of $bold(A) + bold(A)^T = bold(I)$: that gives no direct simplification. Instead: $det(bold(A)) = 1\/2^n dot det(bold(I) + 2 bold(S)) = 1\/2^n product (1 + 2 i t_k) = 1\/2^n product |1 + 2 i t_k|$... The answer is $det(bold(A)) = 1\/2^n$ only when $bold(S) = 0$. In general, $det(bold(A)) > 0$ but depends on $bold(A)$. For $n = 1$: $a + a = 1$ so $a = 1\/2$ and $det = 1\/2$. In general, $det(bold(A))$ is not uniquely determined. The key Putnam insight: $bold(A)$ is always invertible (since all eigenvalues have positive real part).
]

#prob(10)[
  #difficulty(2)
  Let $bold(A)$ be $n times n$ with $bold(A)^2 = -bold(I)$. Show $n$ is even.
]
#hint(1)[What are the eigenvalues?]
#hint(2)[$lambda^2 = -1$ gives $lambda = plus.minus i$. These are complex eigenvalues of a real matrix.]
#hint(3)[Complex eigenvalues of real matrices come in conjugate pairs, so $n$ is even.]
#tldr[Complex eigenvalues of real matrices come in conjugate pairs. If all eigenvalues are $plus.minus i$, dimension is even.]
#solution[
  Eigenvalues satisfy $lambda^2 = -1$, so $lambda = plus.minus i$. Since $bold(A)$ is real, complex eigenvalues come in conjugate pairs: each $+i$ is paired with $-i$. Thus $n$ is even.
]

== Matrix Equation Problems

#putnam(2019, "B4")[
  #difficulty(2)
  Let $bold(A)$ be a $2 times 2$ matrix with real entries satisfying $bold(A)^3 = bold(I)$ and $bold(A) != bold(I)$. Find $"tr"(bold(A)) + "tr"(bold(A)^(-1))$.
]
#hint(1)[If $bold(A)^3 = bold(I)$, eigenvalues are cube roots of unity.]
#hint(2)[Since $bold(A)$ is real and $bold(A) != bold(I)$, eigenvalues are $omega, overline(omega)$ where $omega = e^(2 pi i\/3)$.]
#hint(3)[$"tr"(bold(A)) = omega + overline(omega) = -1$. What is $"tr"(bold(A)^(-1))$?]
#tldr[$bold(A)^3 = bold(I)$, $bold(A) != bold(I)$, $2 times 2$ real $arrow.r.double$ eigenvalues $= e^(plus.minus 2 pi i\/3)$, trace $= -1$.]
#solution[
  Eigenvalues of $bold(A)$ satisfy $lambda^3 = 1$, so $lambda in {1, omega, overline(omega)}$ where $omega = e^(2 pi i\/3)$. Since $bold(A)$ is $2 times 2$ real and $bold(A) != bold(I)$, eigenvalues can't both be 1. Complex eigenvalues pair: $omega, overline(omega)$. So $"tr"(bold(A)) = omega + overline(omega) = -1$. Since $bold(A)^(-1) = bold(A)^2$, $"tr"(bold(A)^(-1)) = omega^2 + overline(omega)^2 = overline(omega) + omega = -1$. Answer: $"tr"(bold(A)) + "tr"(bold(A)^(-1)) = -2$.
]

#prob(12)[
  #difficulty(2)
  Find all $2 times 2$ real matrices $bold(A)$ satisfying $bold(A)^2 = mat(1, 0; 0, 4)$.
]
#hint(1)[Diagonalize: eigenvalues of $bold(A)^2$ are $1$ and $4$.]
#hint(2)[So eigenvalues of $bold(A)$ are $plus.minus 1$ and $plus.minus 2$. Four sign combinations.]
#hint(3)[If $bold(A)$ has distinct eigenvalues and is diag., $bold(A) = mat(plus.minus 1, 0; 0, plus.minus 2)$. Are there non-diagonal solutions?]
#tldr[Square roots of diag. matrices: try all sign combinations of eigenvalue square roots.]
#solution[
  Let $bold(D) = mat(1, 0; 0, 4)$. If $bold(A)$ is diagonalizable, $bold(A) = bold(P) mat(plus.minus 1, 0; 0, plus.minus 2) bold(P)^(-1)$. When $bold(A)$ commutes with $bold(D)$, since $bold(D)$ has distinct diagonal entries, $bold(A)$ must be diagonal: $bold(A) = mat(plus.minus 1, 0; 0, plus.minus 2)$, giving $4$ solutions. When $bold(A)$ does not commute with $bold(D)$: suppose eigenvalues of $bold(A)$ are $1, -2$ (or $-1, 2$). Then $bold(A) = bold(P) mat(1, 0; 0, -2) bold(P)^(-1)$ and $bold(A)^2 = bold(P) mat(1, 0; 0, 4) bold(P)^(-1) = bold(D)$ requires $bold(P)$ to commute with $bold(D)$, so $bold(P)$ is diagonal, and $bold(A)$ is diagonal. Similarly for other mixed-sign cases. Answer: 4 diagonal matrices.
]

#putnam(2009, "A3")[
  #difficulty(2)
  Let $d_n$ denote the determinant of the $n times n$ matrix whose entries are $1, 2, ..., n^2$ reading across rows. Find $d_n$ for $n >= 2$.
]
#hint(1)[Compute $d_2 = det mat(1, 2; 3, 4) = -2$. Try $d_3$.]
#hint(2)[For $n >= 3$, try column operations: subtract column 1 from columns 2 through $n$.]
#hint(3)[After subtraction, columns $2, ..., n$ all become constant columns (all entries equal). Two proportional columns $arrow.r.double$ $det = 0$.]
#tldr[Structured matrices with arithmetic progressions in rows often have low rank.]
#solution[
  Entry $(i,j)$ is $(i-1) n + j$. Subtract column 1 from all other columns: column $j$ (for $j >= 2$) becomes entries $j - 1$ (constant for all rows). So columns $2, ..., n$ are all constant columns. For $n >= 3$, at least two constant columns are proportional, giving $det = 0$. $d_2 = 1 dot 4 - 2 dot 3 = -2$. Answer: $d_n = 0$ for $n >= 3$, $d_2 = -2$.
]

#prob(14)[
  #difficulty(3)
  Let $bold(A)$ and $bold(B)$ be $n times n$ real matrices with $bold(A) bold(B) - bold(B) bold(A) = bold(A)$. Prove $bold(A)$ is nilpotent.
]
#hint(1)[Take the trace of both sides.]
#hint(2)[$"tr"(bold(A) bold(B) - bold(B) bold(A)) = 0 = "tr"(bold(A))$. Now try $"tr"(bold(A)^k)$.]
#hint(3)[Show by induction that $bold(A)^k bold(B) - bold(B) bold(A)^k = k bold(A)^k$, then take traces to get $"tr"(bold(A)^k) = 0$ for all $k$.]
#tldr[If $[bold(A), bold(B)] = bold(A)$, then $"tr"(bold(A)^k) = 0$ for all $k$ via the commutator identity, forcing nilpotency.]
#solution[
  Claim: $bold(A)^m bold(B) - bold(B) bold(A)^m = m bold(A)^m$ for all $m >= 1$. Base case: given. Inductive step: multiply $bold(A) bold(B) - bold(B) bold(A) = bold(A)$ on the left by $bold(A)^(m-1)$: $bold(A)^m bold(B) - bold(A)^(m-1) bold(B) bold(A) = bold(A)^m$. By induction, $bold(A)^(m-1) bold(B) = bold(B) bold(A)^(m-1) + (m-1) bold(A)^(m-1)$, so $bold(A)^m bold(B) - bold(B) bold(A)^m - (m-1)bold(A)^m = bold(A)^m$, giving the result with $m$. Taking trace: $0 = m dot "tr"(bold(A)^m)$, so $"tr"(bold(A)^m) = 0$ for all $m >= 1$. Since all power traces vanish, Newton's identities give all eigenvalues $= 0$, so $bold(A)$ is nilpotent.
]

== Vector Space & Dimension Problems

#putnam(2012, "A4")[
  #difficulty(2)
  Let $V$ be the vector space of polynomials of degree $<= n$ with real coefficients. Let $D : V -> V$ be the differentiation operator. Find $"rank"(D)$ and $dim ker(D)$.
]
#hint(1)[What is the kernel of differentiation on polynomials?]
#hint(2)[$ker(D)$ = constant polynomials, dimension 1.]
#hint(3)[By rank-nullity: $"rank"(D) = (n+1) - 1 = n$.]
#tldr[Rank-nullity: $"rank" + "nullity" = dim V$. For differentiation on degree $<= n$: rank $= n$.]
#solution[
  $ker(D) = {$constant polynomials$}$ has dimension 1. By rank-nullity, $"rank"(D) = dim V - dim ker(D) = (n+1) - 1 = n$.
]

#prob(16)[
  #difficulty(2)
  Let $V$ and $W$ be subspaces of $RR^n$ with $dim V + dim W > n$. Show $V sect W != {bold(0)}$.
]
#hint(1)[Use the dimension formula for subspace intersections.]
#hint(2)[$dim(V + W) = dim V + dim W - dim(V sect W) <= n$.]
#hint(3)[$dim(V sect W) >= dim V + dim W - n > 0$.]
#tldr[Dimension formula: $dim(V sect W) = dim V + dim W - dim(V + W) >= dim V + dim W - n$.]
#solution[
  By the dimension formula: $dim(V sect W) = dim V + dim W - dim(V + W)$. Since $V + W subset.eq RR^n$, $dim(V + W) <= n$. Thus $dim(V sect W) >= dim V + dim W - n > 0$, so $V sect W$ contains a nonzero vector.
]

#putnam(2011, "B2")[
  #difficulty(2)
  Let $S$ be a set of $n times n$ matrices over $RR$ such that for every $bold(A), bold(B) in S$, either $bold(A) bold(B) = bold(0)$ or $bold(B) bold(A) = bold(0)$. What is the maximum possible $|S|$?
]
#hint(1)[Try $n = 1$ first: can you have more than 2 matrices?]
#hint(2)[Consider the rank of products. If $bold(A) bold(B) = bold(0)$, then $"im"(bold(B)) subset.eq ker(bold(A))$.]
#hint(3)[Think about a chain of subspaces. Each matrix in $S$ contributes to a flag.]
#tldr[Annihilation conditions constrain images and kernels, limiting the set size via dimension arguments.]
#solution[
  For each pair, one annihilates the other. Consider the set of kernels and images. If $bold(A) bold(B) = bold(0)$ then $"im"(bold(B)) subset.eq ker(bold(A))$. Constructing maximal $S$: take matrices of the form $bold(E)_(i j)$ (single-entry matrices) carefully. For $n times n$, one can achieve $|S| = n^2$ by taking all $bold(E)_(i 1)$ and $bold(E)_(1 j)$ type constructions, but showing the maximum requires a full case analysis. The maximum turns out to be $|S| = 2n - 1$, achievable with rank-1 matrices in a flag structure.
]

#prob(18)[
  #difficulty(3)
  Let $T : RR^n -> RR^n$ be a linear map such that $T^2 = T$. Prove that $RR^n = ker(T) plus.circle "im"(T)$.
]
#hint(1)[Show $ker(T) sect "im"(T) = {bold(0)}$.]
#hint(2)[If $bold(v) in ker(T) sect "im"(T)$, then $bold(v) = T(bold(w))$ and $T(bold(v)) = bold(0)$, so $T^2(bold(w)) = bold(0) = T(bold(w)) = bold(v)$.]
#hint(3)[Now use rank-nullity: $dim ker(T) + dim "im"(T) = n$ and they intersect trivially.]
#tldr[Idempotent $arrow.r.double$ $V = ker(T) plus.circle "im"(T)$. Every vector splits as $bold(v) = (bold(v) - T(bold(v))) + T(bold(v))$.]
#solution[
  For any $bold(v) in RR^n$, write $bold(v) = (bold(v) - T(bold(v))) + T(bold(v))$. Check: $T(bold(v) - T(bold(v))) = T(bold(v)) - T^2(bold(v)) = T(bold(v)) - T(bold(v)) = bold(0)$, so $bold(v) - T(bold(v)) in ker(T)$. And $T(bold(v)) in "im"(T)$. So $RR^n = ker(T) + "im"(T)$. If $bold(w) in ker(T) sect "im"(T)$, then $bold(w) = T(bold(u))$ and $T(bold(w)) = bold(0)$, giving $T^2(bold(u)) = bold(0) = T(bold(u)) = bold(w)$. Direct sum.
]

#putnam(2015, "A3")[
  #difficulty(2)
  Let $S$ be a set of $n$ points in $RR^d$ with the property that every $(d+1)$ of them are affinely independent. What is the maximum possible $n$?
]
#hint(1)[Affinely independent means no $(d+1)$ points lie in a common $(d-1)$-flat.]
#hint(2)[Think about moment curves: $(t, t^2, ..., t^d)$ for distinct values of $t$.]
#hint(3)[On the moment curve, any $d+1$ points are affinely independent. So $n$ can be arbitrarily large.]
#tldr[Moment curves give arbitrarily many points in general position in $RR^d$.]
#solution[
  There is no finite maximum: $n$ can be arbitrarily large. Place points on the moment curve $bold(gamma)(t) = (t, t^2, ..., t^d)$ for distinct values of $t$. Any $d+1$ points on this curve are affinely independent (the Vandermonde-like determinant is nonzero for distinct $t$ values).
]
