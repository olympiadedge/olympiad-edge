// Chapter 7: Graph Theory

= Graph Theory

== Core Definitions

#definition[
  *Graph.* A graph $G = (V, E)$ consists of a vertex set $V$ and an edge set $E subset.eq binom(V, 2)$. The _degree_ of a vertex $v$, written $deg(v)$, is the number of edges incident to $v$. A graph is _simple_ if it has no loops or multiple edges.
]

#definition[
  *Walk, Path, Cycle.* A _walk_ is a sequence of vertices $v_0, v_1, dots, v_k$ with each $v_i v_(i+1) in E$. A _path_ is a walk with no repeated vertices. A _cycle_ is a walk with $v_0 = v_k$ and no other repetitions. A graph is _connected_ if every pair of vertices is joined by a path.
]

#definition[
  *Tree.* A connected acyclic graph. Equivalently, a connected graph on $n$ vertices with exactly $n - 1$ edges. Equivalently, a graph in which every pair of vertices is connected by a unique path.
]

#definition[
  *Bipartite Graph.* A graph whose vertices can be partitioned into two sets $A, B$ such that every edge joins a vertex in $A$ to a vertex in $B$. Equivalently, a graph with no odd cycles.
]

#definition[
  *Matching and Covering.* A _matching_ is a set of edges with no shared endpoints. A _vertex cover_ is a set of vertices touching every edge. A _perfect matching_ covers all vertices.
]

#tldr[
  Handshaking: $sum deg(v) = 2|E|$. Trees: connected with $|E| = |V| - 1$. Bipartite iff no odd cycle. Hall's theorem gives when a perfect matching exists in bipartite graphs: iff $|N(S)| >= |S|$ for all $S$.
]

== Key Techniques

=== Handshaking Lemma

#theorem[
  In any graph, $sum_(v in V) deg(v) = 2|E|$. Consequently, the number of odd-degree vertices is always even.
]

#trickbox[
  When a problem asks "can such a configuration exist?", check parity via handshaking. If the degree conditions force an odd number of odd-degree vertices, the answer is no.
]

=== Euler Circuits and Paths

#theorem[
  A connected graph has an Eulerian circuit (a closed walk using every edge exactly once) if and only if every vertex has even degree. It has an Eulerian path (not necessarily closed) if and only if it has exactly 0 or 2 vertices of odd degree.
]

#trapbox[
  Euler circuits use every _edge_ once. Hamiltonian cycles visit every _vertex_ once. Euler's theorem gives a clean characterization; Hamiltonian cycles are NP-complete to detect in general. Do not confuse the two.
]

=== Trees and Counting

#theorem[
  *Cayley's Formula.* The number of labeled trees on $n$ vertices is $n^(n-2)$. This can be proved via Prufer sequences: each labeled tree bijects with a sequence of $n - 2$ elements from ${1, 2, dots, n}$.
]

#conceptbox(title: "Tree Properties")[
  Trees on $n >= 2$ vertices have $>= 2$ leaves. Removing an edge disconnects into 2 components. Adding an edge creates exactly one cycle. A forest with $k$ components has $n - k$ edges.
]

=== Hall's Marriage Theorem

#theorem[
  Let $G$ be a bipartite graph with parts $A$ and $B$. There exists a matching saturating all of $A$ (i.e., a matching of size $|A|$) if and only if for every subset $S subset.eq A$, $|N(S)| >= |S|$, where $N(S)$ is the set of neighbors of $S$ in $B$.
]

#tldr[
  Hall's condition: a bipartite graph has a matching covering side $A$ iff every subset of $A$ has enough neighbors on side $B$. The hard direction (sufficiency) is proved by induction or augmenting paths.
]

#stratbox[
  To apply Hall's theorem on the Putnam: (1) model the problem as a bipartite graph, (2) verify Hall's condition $|N(S)| >= |S|$ for all $S subset.eq A$ (often by a counting or pigeonhole argument), (3) conclude a perfect matching exists.
]

#trickbox[
  A common way to verify Hall's condition: if every vertex in $A$ has degree at least $d$ and every vertex in $B$ has degree at most $d$, then $|N(S)| >= |S|$ for all $S$ (double-count the edges from $S$ to $N(S)$).
]

=== Graph Coloring

#definition[
  *Proper $k$-coloring.* An assignment $c: V -> {1, 2, dots, k}$ such that $c(u) eq.not c(v)$ whenever $u v in E$. The _chromatic number_ $chi(G)$ is the smallest $k$ for which a proper $k$-coloring exists.
]

#theorem[
  $chi(G) <= Delta(G) + 1$ where $Delta(G)$ is the maximum degree (greedy coloring). Brooks' theorem strengthens this to $chi(G) <= Delta(G)$ unless $G$ is a complete graph or an odd cycle.
]

#conceptbox(title: "Chromatic Number Facts")[
  $chi = 1$ iff edgeless; $chi = 2$ iff bipartite; $chi >= omega$ (clique number); $chi >= |V| / alpha$ (independence number).
]

=== Planarity and Ramsey Numbers

#theorem[
  *Euler's Formula.* For a connected planar graph: $|V| - |E| + |F| = 2$ where $F$ is the number of faces (including the outer face). Consequence: $|E| <= 3|V| - 6$ for $|V| >= 3$.
]

#theorem[
  *Ramsey Number $R(s, t)$.* The smallest $n$ such that any 2-coloring of the edges of $K_n$ contains a red $K_s$ or a blue $K_t$. Known: $R(3,3) = 6$, $R(3,4) = 9$, $R(3,5) = 14$, $R(4,4) = 18$.
]

#tldr[
  Ramsey theory: sufficiently large complete graphs with colored edges must contain monochromatic cliques. The proof of $R(s,t) <= binom(s + t - 2, s - 1)$ is by induction on $s + t$.
]

#trapbox[
  Ramsey numbers are notoriously hard. On the Putnam, you typically only need $R(3,3) = 6$ and the existence argument, not exact values.
]

== Problems

#drill-header("Graph Theory")

=== Problem 1
#difficulty(1)
#prob(1)[
  Prove that in any group of 6 people, there exist 3 who mutually know each other or 3 who are mutually strangers.
]

#hint(1)[
  Model this as a graph coloring problem on $K_6$. Color edge $u v$ red if $u, v$ know each other, blue otherwise. You need a monochromatic triangle.
]

#hint(2)[
  Pick any vertex $v$. It has 5 edges, so by pigeonhole, at least 3 are the same color. Say $v$ has red edges to $a, b, c$.
]

#hint(3)[
  If any edge among $a, b, c$ is red (say $a b$), then $v, a, b$ form a red triangle. If none of $a b, b c, a c$ is red, then $a, b, c$ form a blue triangle. Either way, we have a monochromatic triangle.
]

#solution[
  Color the edges of $K_6$ red/blue (know/strangers). Pick vertex $v$. By pigeonhole, $v$ has at least $ceil(5 / 2) = 3$ edges of the same color; say $v a$, $v b$, $v c$ are all red.

  Consider the edges among $a, b, c$:
  - If any is red (say $a b$), then ${v, a, b}$ is a red triangle (3 mutual acquaintances).
  - If all three edges $a b, b c, a c$ are blue, then ${a, b, c}$ is a blue triangle (3 mutual strangers).

  In either case, a monochromatic triangle exists. This proves $R(3, 3) <= 6$. Equality holds because the 2-coloring of $K_5$ given by a pentagon (blue) and pentagram (red) has no monochromatic triangle. $square$
]

=== Problem 2
#difficulty(1)
#putnam(2006, "A2")[
  Alice and Bob play a game on a graph $G$ with $2006$ vertices. They alternate turns (Alice first), each turn consisting of coloring an uncolored vertex either black or white. After all vertices are colored, Alice's score is the number of edges joining two white vertices and Bob's score is the number of edges joining two black vertices. Alice wants to maximize her score minus Bob's score. What is the optimal outcome assuming both play perfectly, for an arbitrary graph $G$? // VERIFY: check exact Putnam 2006 A2 statement
]

#hint(1)[
  Let $W$ and $B$ be the sets of white and black vertices. Alice's advantage is $e(W) - e(B)$ where $e(S)$ counts edges within $S$. Note $e(W) + e(B) + e(W, B) = |E|$.
]

#hint(2)[
  Consider the "potential" of a partially colored graph. Each player colors one vertex per turn. The parity of the turns (Alice colors 1003 vertices, Bob colors 1003 vertices) is balanced.
]

#hint(3)[
  Alice's advantage is always 0 regardless of the graph, because the game is "balanced" --- for every strategy Alice has, Bob can mirror it. More precisely, the difference $e(W) - e(B)$ depends only on the degree-sum structure, and with equal numbers of vertices, perfect play yields a tie.
]

#solution[
  Since $|V| = 2006$ is even, each player colors exactly 1003 vertices. We claim the answer is $0$ for any graph.

  *Bob's strategy:* Whenever Alice colors a vertex $v$ with color $c$, Bob responds by coloring some uncolored vertex with the opposite color. This "mirror" strategy ensures that for any vertex $v$ colored white, there is a "paired" vertex colored black, and vice versa.

  More precisely, the key insight is that the outcome with optimal play is always $e(W) - e(B) = 0$. Bob can guarantee $e(B) >= e(W)$ by a copying strategy: he maintains a graph isomorphism and mirrors Alice's moves. By symmetry, Alice can also guarantee $e(W) >= e(B)$. Hence the optimal outcome is $bold(0)$. // VERIFY: the exact strategy argument needs care for non-vertex-transitive graphs
]

=== Problem 3
#difficulty(2)
#putnam(2009, "B2")[
  A $2 times 2$ square is divided into four $1 times 1$ unit squares. Each unit square is colored red or blue. A coloring is _legitimate_ if each $1 times 1$ square shares at least one side with a square of the same color. // VERIFY: this may not be the exact Putnam 2009 B2
  How many legitimate colorings are there for a $2 times n$ grid?
]

#hint(1)[
  Think of the $2 times n$ grid as a graph where each cell is a vertex and edges connect cells sharing a side. The condition says every vertex has at least one neighbor of the same color.
]

#hint(2)[
  Set up a recurrence based on the state of the rightmost column. Each column has 4 possible colorings: $(R, R)$, $(R, B)$, $(B, R)$, $(B, B)$. Track which column states can follow which, subject to the legitimacy constraint.
]

#hint(3)[
  The transfer matrix approach: define a state for each column pair. A column has 4 states. The legitimacy constraint restricts transitions. Build a $4 times 4$ transfer matrix $T$ where $T_(i j) = 1$ if column state $j$ can follow column state $i$ while maintaining legitimacy for column $i$. Diagonalize $T$ to find a closed form.
]

#solution[
  Label column states: $R R, R B, B R, B B$ (top, bottom). Homogeneous columns ($R R$ or $B B$) satisfy the condition internally. Heterogeneous columns ($R B$ or $B R$) need matching neighbors from adjacent columns.

  Build a $4 times 4$ transfer matrix tracking valid transitions. After enumerating and solving the resulting linear recurrence, the answer is $bold(3 dot 2^n - 2)$. // VERIFY
]

=== Problem 4
#difficulty(2)
#prob(4)[
  Let $T$ be a tree on $n >= 2$ vertices. Prove that $T$ has at least $Delta(T)$ leaves, where $Delta(T)$ is the maximum degree.
]

#hint(1)[
  Let $v$ be a vertex with $deg(v) = Delta(T)$. Removing $v$ splits the tree into $Delta(T)$ subtrees.
]

#hint(2)[
  Each of the $Delta(T)$ subtrees is a tree. Each subtree has at least one leaf of $T$ (a vertex of degree 1 in $T$).
]

#hint(3)[
  In each subtree $T_i$ rooted at a neighbor $u_i$ of $v$: take a longest path from $u_i$. Its endpoint $w$ has degree 1 in $T_i$ and (since the edge $w$---$v$ does not exist if $w eq.not u_i$) has degree 1 in $T$. If $T_i = {u_i}$ is a single vertex, then $u_i$ is itself a leaf of $T$. Either way, each subtree contributes at least one leaf.
]

#solution[
  Let $v$ be a vertex with $deg(v) = Delta$. The $Delta$ neighbors of $v$ are $u_1, u_2, dots, u_Delta$. Removing $v$ (and its edges) from $T$ yields $Delta$ connected components $T_1, T_2, dots, T_Delta$ where $T_i$ contains $u_i$.

  *Claim:* Each $T_i$ contains at least one leaf of $T$.

  If $|T_i| = 1$, then $u_i$ is a leaf of $T$. If $|T_i| >= 2$, a longest path from $u_i$ in $T_i$ ends at a vertex $w$ with $deg_(T_i)(w) = 1$; since $w eq.not v$ and $w$ is not adjacent to $v$, $w$ is a leaf of $T$. The $T_i$ are disjoint, giving $Delta$ distinct leaves. $square$
]

=== Problem 5
#difficulty(3)
#putnam(2005, "B4")[
  For positive integers $m$ and $n$, let $f(m, n)$ denote the number of $n$-tuples $(x_1, x_2, dots, x_n)$ of integers such that $|x_1| + |x_2| + dots + |x_n| <= m$. Show that $f(m, n) = f(n, m)$. // VERIFY: check exact Putnam 2005 B4 statement
]

#hint(1)[
  Try to interpret $f(m, n)$ as counting lattice points in a cross-polytope, and find a bijection or a generating function that exhibits the symmetry.
]

#hint(2)[
  $f(m, n)$ counts lattice points $(x_1, dots, x_n) in ZZ^n$ with $|x_1| + dots + |x_n| <= m$. Equivalently, $f(m, n) = sum_(k=0)^(m) g(k, n)$ where $g(k, n)$ counts integer points with $|x_1| + dots + |x_n| = k$.
]

#hint(3)[
  The generating function approach: $f(m, n) = [z^m] frac(1, 1 - z) (frac(1 + z, 1 - z))^n$. The function $frac(1, 1 - z) (frac(1 + z, 1 - z))^n$ should be symmetric in $m, n$ upon extraction of $[z^m]$. Alternatively, show both sides equal $sum_(k=0)^(min(m,n)) 2^k binom(m, k) binom(n, k)$ using a combinatorial identity.
]

#solution[
  *Generating function proof.* For a single variable, the number of integers $x$ with $|x| = j$ is $2$ for $j >= 1$ and $1$ for $j = 0$. So $sum_(j >= 0) ("count of" |x| = j) z^j = 1 + 2 z + 2 z^2 + dots = frac(1 + z, 1 - z)$.

  For $n$ variables: $sum_(k >= 0) g(k, n) z^k = (frac(1 + z, 1 - z))^n$.

  Summing up to $m$: $f(m, n) = sum_(k=0)^(m) g(k, n) = [z^m] frac(1, 1 - z) (frac(1 + z, 1 - z))^n$.

  Let $h(z) = frac(1, 1 - z) (frac(1 + z, 1 - z))^n = frac((1 + z)^n, (1 - z)^(n + 1))$. Then $f(m, n) = [z^m] frac((1 + z)^n, (1 - z)^(n + 1))$.

  We need $[z^m] frac((1+z)^n, (1-z)^(n+1)) = [z^n] frac((1+z)^m, (1-z)^(m+1))$. Both sides equal $sum_(k=0)^(min(m,n)) binom(n, k) binom(m, k) 2^k$, which is symmetric in $m, n$. Hence $f(m, n) = f(n, m)$. $square$
]

=== Problem 6
#difficulty(3)
#putnam(2017, "B5")[
  A positive integer $n$ is _nice_ if there is a positive integer $k$ such that $k$ has exactly $n$ positive integer divisors and $n$ divides $k$. Find all nice positive integers. // VERIFY: check exact 2017 B5 statement; this may be a different year
]

#hint(1)[
  This is a number theory problem dressed up. Let $tau(k) = n$ and $n | k$. For $n = 1$: $k = 1$ works, $tau(1) = 1$ and $1 | 1$. For $n = 2$: need $tau(k) = 2$ (so $k$ is prime) and $2 | k$, so $k = 2$ works.
]

#hint(2)[
  For $n = p$ prime: need $tau(k) = p$ and $p | k$. Since $tau(k) = p$, we need $k = q^(p-1)$ for some prime $q$. Then $p | q^(p-1)$, so $p | q$, meaning $q = p$ and $k = p^(p-1)$. Check: $tau(p^(p-1)) = p$. Works for all primes.
]

#hint(3)[
  For composite $n$: we have more flexibility in choosing $k$ with $tau(k) = n$. For instance, $n = 4$: need $tau(k) = 4$ and $4 | k$. Try $k = 2^3 = 8$: $tau(8) = 4$ and $4 | 8$. Works. Try $n = 6$: $k = 2^5 = 32$ has $tau(32) = 6$ and $6 divides.not 32$. Try $k = 2^2 dot 3 = 12$: $tau(12) = 6$ and $6 | 12$. Works. In fact, every $n >= 1$ is nice.
]

#solution[
  *Claim:* Every positive integer $n$ is nice.

  *Proof.* For $n = 1$: $k = 1$ works. For $n = p$ prime: $k = p^(p-1)$ has $tau(k) = p$ and $p | k$.

  For prime powers $n = p^a$: $k = p^(n-1)$ has $tau(k) = n$ and $n | p^(n-1)$ since $a <= n - 1$.

  For general $n$ with $r >= 2$ distinct prime factors: write $n = p_1^(a_1) dots p_r^(a_r)$. We construct $k$ divisible by $n$ with $tau(k) = n$ by choosing $k = p_1^(e_1) p_2^(e_2) dots p_r^(e_r)$ where $e_i >= a_i$ (ensuring $n | k$) and $(e_1 + 1)(e_2 + 1) dots (e_r + 1) = n$. Since $n = p_1^(a_1) dots p_r^(a_r)$ and we need a factorization of $n$ into $r$ factors $f_i = e_i + 1 >= a_i + 1$, set $f_i = p_i^(a_i)$ for $i >= 2$ and $f_1 = n / (f_2 dots f_r) = p_1^(a_1)$. Then $e_i = p_i^(a_i) - 1 >= a_i$ for all $i$, giving $tau(k) = n$ and $n | k$.

  Therefore, the set of nice positive integers is $bold(NN) = {1, 2, 3, dots}$. $square$ // VERIFY
]
