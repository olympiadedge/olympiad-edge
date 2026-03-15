// Chapter 1: Vector Space Foundations

= Vector Space Foundations

== Core Definitions

#definition[
  A *vector space* over $RR$ is a set $V$ with addition $+: V times V -> V$ and scalar multiplication $dot : RR times V -> V$ satisfying: closure, associativity, commutativity of addition, existence of $bold(0)$, additive inverses, distributivity, and $1 dot bold(v) = bold(v)$.
]

#tldr[A vector space is a set where you can add elements and scale them, and everything "behaves linearly."]

Key non-obvious examples for Putnam: the space $PP_n$ of polynomials of degree $<= n$, the space $C([0,1])$ of continuous functions on $[0,1]$, and the space of $n times n$ symmetric matrices.

#definition[
  A subset $W subset.eq V$ is a *subspace* if (i) $bold(0) in W$, (ii) $bold(u), bold(v) in W => bold(u) + bold(v) in W$, and (iii) $c in RR, bold(v) in W => c bold(v) in W$.
]

#tldr[To check a subspace: verify it contains $bold(0)$ and is closed under addition and scaling.]

#trapbox[
  The set ${(x, y) in RR^2 : x + y = 1}$ is NOT a subspace — it fails the zero vector test. Affine subsets $!=$ subspaces.
]

== Span, Independence, Basis, Dimension

#theorem[
  Let $V$ be a vector space. A set $cal(B) = {bold(v)_1, ..., bold(v)_n}$ is a *basis* if it is linearly independent and $"span"(cal(B)) = V$. Every basis of $V$ has the same number of elements, called $dim V$.
]

#tldr[A basis is a minimal spanning set (or maximal independent set). All bases have the same size.]

#theorem[
  If $dim V = n$, then: (a) any $n$ linearly independent vectors form a basis, (b) any $n$ vectors that span $V$ form a basis, (c) every linearly independent set extends to a basis.
]

#tldr[In an $n$-dimensional space, you only need to check ONE of independence or spanning if you have exactly $n$ vectors.]

#trickbox[
  *"Buy two, get one free"* (Evan Chen, LAMV). For $n$ vectors in an $n$-dimensional space, any two of these three properties imply the third: (1) there are exactly $n$ vectors, (2) they are linearly independent, (3) they span $V$. So you only need to check ONE of independence or spanning — not both. This saves enormous effort on Putnam.
]

#stratbox[
  *Exotic vector spaces on Putnam.* When a problem asks about polynomials, matrices, or functions satisfying linear conditions, think: "Is this a vector space? What's the dimension?" Finding the dimension often cracks the problem.
]

== Problems

#drill-header("Foundations")

#prob(1)[#difficulty(1) Show that the set of $2 times 2$ matrices with trace zero is a subspace of $M_(2 times 2)(RR)$. Find its dimension.]
#hint(1)[Check the three subspace conditions: zero matrix, closure under $+$, closure under scaling.]
#hint(2)[For dimension, find an explicit basis. A general trace-zero matrix is $mat(a, b; c, -a)$.]
#hint(3)[Express $mat(a, b; c, -a) = a mat(1, 0; 0, -1) + b mat(0, 1; 0, 0) + c mat(0, 0; 1, 0)$.]
#solution[The zero matrix has trace $0$. If $"tr"(bold(A)) = 0$ and $"tr"(bold(B)) = 0$, then $"tr"(bold(A) + bold(B)) = 0$ and $"tr"(c bold(A)) = 0$, so it is a subspace. A basis is ${mat(1,0;0,-1), mat(0,1;0,0), mat(0,0;1,0)}$, giving $dim = 3$.]

#prob(2)[#difficulty(1) Prove that $1, x, x^2, ..., x^n$ are linearly independent in $PP_n$.]
#hint(1)[Set up $c_0 + c_1 x + dots.c + c_n x^n = 0$ for all $x in RR$.]
#hint(2)[A nonzero polynomial of degree $<= n$ has at most $n$ roots.]
#hint(3)[Since the equation holds for infinitely many $x$, all coefficients must be zero.]
#solution[If $p(x) = c_0 + c_1 x + dots.c + c_n x^n = 0$ for all $x in RR$, then $p$ has infinitely many roots. But a nonzero polynomial of degree $<= n$ has at most $n$ roots. So $p$ is the zero polynomial, meaning $c_0 = c_1 = dots.c = c_n = 0$.]

#prob(3)[#difficulty(1) Let $V = {bold(v) in RR^4 : x_1 + x_2 + x_3 + x_4 = 0}$. Find $dim V$ and a basis.]
#hint(1)[This is the solution set of a single homogeneous linear equation in 4 unknowns.]
#hint(2)[Parametrize: $x_4 = -x_1 - x_2 - x_3$. Three free variables means $dim = 3$.]
#hint(3)[Set each free variable to $1$ and the others to $0$.]
#solution[$dim V = 3$. A basis is ${(1,0,0,-1), (0,1,0,-1), (0,0,1,-1)}$.]

#prob(4)[#difficulty(2) Prove that any $n + 2$ vectors in $RR^n$ are linearly dependent.]
#hint(1)[Think of the vectors as columns of an $n times (n+2)$ matrix.]
#hint(2)[Row reduce. You have more columns than rows.]
#hint(3)[There must be a free variable in the homogeneous system $bold(A) bold(x) = bold(0)$.]
#solution[Form the matrix $bold(A)$ with the vectors as columns. The system $bold(A) bold(x) = bold(0)$ has $n+2$ unknowns and $n$ equations. Since there are more unknowns than equations, there is a free variable, giving a nontrivial solution — hence linear dependence.]

#prob(5)[#difficulty(2) Let $W_1$ and $W_2$ be subspaces of a finite-dimensional space $V$. Prove $dim(W_1 + W_2) = dim W_1 + dim W_2 - dim(W_1 inter W_2)$.]
#hint(1)[Start with a basis for $W_1 inter W_2$ and extend it to bases of $W_1$ and $W_2$ separately.]
#hint(2)[Show the combined set (basis of $W_1 inter W_2$, extension vectors for $W_1$, extension vectors for $W_2$) spans $W_1 + W_2$.]
#hint(3)[Prove this combined set is linearly independent by showing any dependence relation forces all coefficients to zero.]
#solution[Let ${bold(u)_1, ..., bold(u)_k}$ be a basis for $W_1 inter W_2$. Extend to a basis ${bold(u)_1, ..., bold(u)_k, bold(v)_1, ..., bold(v)_p}$ of $W_1$ and ${bold(u)_1, ..., bold(u)_k, bold(w)_1, ..., bold(w)_q}$ of $W_2$. The set ${bold(u)_i, bold(v)_j, bold(w)_l}$ spans $W_1 + W_2$. For independence: if $sum a_i bold(u)_i + sum b_j bold(v)_j + sum c_l bold(w)_l = bold(0)$, then $sum c_l bold(w)_l = -sum a_i bold(u)_i - sum b_j bold(v)_j in W_1$. But it is also in $W_2$, so it is in $W_1 inter W_2$, forcing all $c_l = 0$. Then independence within $W_1$ forces all $a_i, b_j = 0$. So $dim(W_1 + W_2) = k + p + q = dim W_1 + dim W_2 - dim(W_1 inter W_2)$.]

#putnam(2009, "B4")[Define $f: RR -> RR$ by $f(x) = sum_(k=0)^(9) (x - k)_+^9$ where $(t)_+ = max(t, 0)$. Prove that $f$ is a polynomial of degree exactly 9.]
#hint(1)[Each $(x-k)_+^9$ is piecewise: it is $0$ for $x < k$ and $(x-k)^9$ for $x >= k$. For $x >= 9$, all 10 terms are active.]
#hint(2)[For $x >= 9$, we get $f(x) = sum_(k=0)^(9)(x-k)^9$. Expand each $(x-k)^9$ and collect by powers of $x$.]
#hint(3)[The leading coefficient is $10 x^9$. Show the $x^8$ and lower leading terms cancel by using the identity $sum_(k=0)^(9) k^j$ and properties of finite differences.]
#solution[For $x >= 9$, $f(x) = sum_(k=0)^(9)(x-k)^9$. The coefficient of $x^9$ is $10$. The coefficient of $x^8$ is $-9 sum_(k=0)^(9) k = -9 dot 45 = -405$. The key fact: $f$ is $C^8$ everywhere (each $(x-k)_+^9$ is $C^8$) and equals a polynomial for $x >= 9$ and for $x < 0$ (where $f = 0$). A $C^8$ function that is polynomial on $(9, infinity)$ and zero on $(-infinity, 0)$ — by examining the 9th finite difference, $f$ is a polynomial of degree exactly 9 on all of $RR$.]

#prob(6)[#difficulty(3) Let $V$ be the space of real polynomials of degree $<= 2025$. Let $W$ be the subspace of $p in V$ such that $p(k) = 0$ for $k = 1, 2, ..., 1000$. Find $dim W$.]
#hint(1)[Each condition $p(k) = 0$ is a linear constraint on the coefficients.]
#hint(2)[Are the 1000 constraints independent? Yes — the evaluation map at distinct points gives independent linear functionals.]
#hint(3)[$dim W = dim V - 1000 = 2026 - 1000 = 1026$.]
#solution[$dim V = 2026$ (basis $1, x, ..., x^2025$). Each evaluation $p(k) = 0$ removes one dimension, and the 1000 evaluations at distinct points are independent (a polynomial of degree $<= 2025$ with $1000 <= 2026$ roots can still be nonzero). So $dim W = 2026 - 1000 = 1026$.]
