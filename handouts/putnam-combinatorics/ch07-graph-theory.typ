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
#prob(2)[
  Prove the handshaking lemma: in any graph $G = (V, E)$, the sum of the degrees of all vertices equals twice the number of edges. That is, $sum_(v in V) deg(v) = 2 |E|$. Conclude that the number of vertices of odd degree is always even.
]

#hint(1)[
  Each edge $e = {u, v}$ contributes exactly 1 to $deg(u)$ and 1 to $deg(v)$. What does this say about the total contribution of all edges to the sum of degrees?
]

#hint(2)[
  Count pairs $(v, e)$ where $v$ is a vertex and $e$ is an edge incident to $v$. Count this quantity two ways: by summing over vertices (giving $sum deg(v)$) and by summing over edges (each edge contributes 2 such pairs).
]

#hint(3)[
  For the parity corollary: $sum_(v in V) deg(v) = 2 |E|$ is even. If there were an odd number of odd-degree vertices, the sum of degrees would be odd. Contradiction.
]

#solution[
  *Double counting.* Consider the set of incidence pairs $I = {(v, e) : v in V, e in E, v in e}$. For each vertex $v$, the number of edges incident to $v$ is $deg(v)$, so $|I| = sum_(v in V) deg(v)$. For each edge $e = {u, w}$, there are exactly 2 vertices incident to $e$ (namely $u$ and $w$), so $|I| = 2 |E|$.

  Therefore $sum_(v in V) deg(v) = 2 |E|$.

  *Parity corollary.* The sum $sum_(v in V) deg(v) = 2 |E|$ is even. Write this sum as the sum over odd-degree vertices plus the sum over even-degree vertices. The sum over even-degree vertices is even, so the sum over odd-degree vertices must also be even. A sum of odd numbers is even if and only if there are an even number of terms. $square$
]

=== Problem 3
#difficulty(2)
#prob(3)[
  Prove that every tree on $n$ vertices has exactly $n - 1$ edges.
]

#hint(1)[
  Use induction on $n$. The base case $n = 1$ is a single vertex with $0 = 1 - 1$ edges. For the inductive step, find a vertex you can remove to get a smaller tree.
]

#hint(2)[
  Every tree on $n >= 2$ vertices has at least one leaf (a vertex of degree 1). Why? A longest path in the tree must end at a vertex with no other neighbors along the path, so its endpoint has degree 1.
]

#hint(3)[
  Remove a leaf $v$ and its unique incident edge. The resulting graph is still connected (any path that used $v$ can be shortened since $v$ was an endpoint) and still acyclic (removing a vertex cannot create cycles). So it is a tree on $n - 1$ vertices. Apply the inductive hypothesis.
]

#solution[
  *Proof by induction on $n$.*

  *Base case:* $n = 1$. A single vertex has $0 = 1 - 1$ edges. $checkmark$

  *Inductive step:* Assume every tree on $n - 1$ vertices has $n - 2$ edges. Let $T$ be a tree on $n >= 2$ vertices. We claim $T$ has a leaf (a vertex of degree 1).

  Take a longest path $v_0, v_1, dots, v_k$ in $T$. Then $v_0$ has no neighbor outside the path (otherwise we could extend the path or find a cycle), and $v_0 eq.not v_1$ is its only neighbor, so $deg(v_0) = 1$.

  Remove $v_0$ and its incident edge $v_0 v_1$ to obtain $T' = T - v_0$. The graph $T'$ is connected: any path in $T$ between vertices in $T'$ that passed through $v_0$ would require entering and leaving $v_0$ via the same edge (since $deg(v_0) = 1$), which is impossible in a simple path. So $T'$ is connected. It is also acyclic (a subgraph of an acyclic graph). Hence $T'$ is a tree on $n - 1$ vertices.

  By the inductive hypothesis, $T'$ has $n - 2$ edges. Since $T$ has one more edge than $T'$, $T$ has $n - 1$ edges. $square$
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
  For positive integers $m$ and $n$, let $f(m, n)$ denote the number of $n$-tuples $(x_1, x_2, dots, x_n)$ of integers such that $|x_1| + |x_2| + dots + |x_n| <= m$. Show that $f(m, n) = f(n, m)$.
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
#difficulty(2)
#prob(6)[
  Prove that a graph is bipartite if and only if it contains no odd cycle.
]

#hint(1)[
  One direction is easy: if $G$ is bipartite with parts $A$ and $B$, then any cycle must alternate between $A$ and $B$. What does this say about the cycle's length?
]

#hint(2)[
  For the other direction, assume $G$ is connected with no odd cycle. Pick any vertex $v$ and define $A = {u : d(v, u) "is even"}$ and $B = {u : d(v, u) "is odd"}$ where $d(v, u)$ is the shortest-path distance. Show that no edge has both endpoints in $A$ or both in $B$.
]

#hint(3)[
  Suppose for contradiction that $u, w in A$ (both at even distance from $v$) are joined by an edge. Then $d(v, u) + d(v, w) + 1$ gives the length of a closed walk through $v, u, w$. Since $d(v, u)$ and $d(v, w)$ are both even, this walk has odd length, yielding an odd cycle. This contradicts the hypothesis.
]

#solution[
  *Forward direction ($=>$):* Suppose $G$ is bipartite with parts $A, B$. Every edge goes from $A$ to $B$. A cycle $v_1, v_2, dots, v_k, v_1$ alternates between $A$ and $B$, so $v_1 in A => v_2 in B => v_3 in A => dots$. Since $v_1 in A$ and $v_k$ must be in $B$ (to have an edge back to $v_1 in A$), the cycle visits $A$ and $B$ alternately for $k$ steps, with $v_(k) in B$, so $k$ is even. Hence no odd cycle.

  *Backward direction ($arrow.l.double$):* Assume $G$ has no odd cycle. We may assume $G$ is connected (otherwise bipartition each component separately). Fix a vertex $v$ and define:
  $ A = {u in V : d(v, u) equiv 0 mod 2}, quad B = {u in V : d(v, u) equiv 1 mod 2}. $

  Claim: no edge has both endpoints in $A$ (or both in $B$). Suppose $u, w in A$ with $u w in E$. Let $P_u$ be a shortest path from $v$ to $u$ (length $d(v, u)$, which is even) and $P_w$ a shortest path from $v$ to $w$ (length $d(v, w)$, also even). The walk $P_u$, then the edge $u w$, then $P_w$ reversed, returns to $v$ with total length $d(v, u) + 1 + d(v, w)$, which is odd. This closed walk contains an odd cycle, contradicting our assumption. The case $u, w in B$ is identical.

  Therefore $(A, B)$ is a valid bipartition, and $G$ is bipartite. $square$
]

=== Problem 7
#difficulty(3)
#prob(7)[
  Prove that every regular bipartite graph has a perfect matching. (A bipartite graph is _regular_ if every vertex has the same degree $d >= 1$.)
]

#hint(1)[
  Use Hall's marriage theorem. You need to verify Hall's condition: for every subset $S$ of one part, $|N(S)| >= |S|$.
]

#hint(2)[
  Double-count the edges between $S$ and $N(S)$. Since every vertex in $S$ has degree $d$, there are $d |S|$ edges leaving $S$. Since every vertex in $N(S)$ has degree $d$, there are at most $d |N(S)|$ edges entering $N(S)$.
]

#hint(3)[
  From the double count: $d |S| <= d |N(S)|$, so $|N(S)| >= |S|$. This verifies Hall's condition. Also note that regularity implies $|A| = |B|$ (count edges: $d |A| = d |B|$), so a matching saturating $A$ is a perfect matching.
]

#solution[
  Let $G = (A union B, E)$ be a $d$-regular bipartite graph with $d >= 1$. First, $|A| = |B|$: the total degree from $A$ is $d |A|$ and from $B$ is $d |B|$; both equal $|E|$, so $|A| = |B|$.

  We verify Hall's condition to apply Hall's marriage theorem. Let $S subset.eq A$ be arbitrary. Count the edges between $S$ and $N(S)$:
  - Each vertex in $S$ has degree $d$, contributing $d |S|$ edges from $S$ into $B$. All these edges land in $N(S)$.
  - Each vertex in $N(S)$ has degree $d$, so at most $d |N(S)|$ edges touch $N(S)$.

  Therefore $d |S| <= d |N(S)|$, which gives $|N(S)| >= |S|$. Hall's condition is satisfied.

  By Hall's marriage theorem, there exists a matching saturating all of $A$. Since $|A| = |B|$, this matching covers all vertices and is a perfect matching. $square$
]
