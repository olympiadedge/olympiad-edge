// Chapter 9: Graph Theory in Combinatorics

= Graph Theory in Combinatorics

#tldr[
  Graphs encode relationships. The handshaking lemma, Euler's formula, Hall's marriage theorem, and Cayley's formula are the core tools. Graph coloring and matching problems appear frequently on AIME and Putnam.
]

== Basic Definitions

#definition[
  *Graph.* A graph $G = (V, E)$ consists of a vertex set $V$ and an edge set $E subset.eq binom(V, 2)$. We write $n = |V|$ and $m = |E|$. An edge $\{u, v\}$ is often written $u v$.
]

#definition[
  *Degree.* The degree $deg(v)$ of a vertex $v$ is the number of edges incident to $v$. A graph is _$k$-regular_ if every vertex has degree $k$.
]

#definition[
  *Special Graphs.*
  - *Path* $P_n$: vertices $v_1, dots, v_n$ with edges $v_i v_(i+1)$.
  - *Cycle* $C_n$: path $P_n$ plus edge $v_n v_1$.
  - *Complete graph* $K_n$: all $binom(n, 2)$ edges present.
  - *Bipartite graph:* vertex set splits as $V = A union.sq B$ with all edges between $A$ and $B$.
  - *Tree:* connected graph with no cycles. Equivalently, connected with $n - 1$ edges.
]

#conceptbox(title: "Bipartite Characterization")[
  A graph is bipartite if and only if it contains no odd cycle. To check: run BFS/DFS and 2-color; if a contradiction arises, an odd cycle exists.
]

== Handshaking Lemma and Degree Sequences

#theorem[
  *Handshaking Lemma.* In any graph $G = (V, E)$,
  $ sum_(v in V) deg(v) = 2|E|. $
  In particular, the number of vertices with odd degree is even.
]

#proof[
  Each edge $\{u, v\}$ contributes 1 to $deg(u)$ and 1 to $deg(v)$, so each edge is counted exactly twice in $sum deg(v)$.
]

#trickbox[
  The handshaking lemma is the first tool in any problem involving degree counts. "The sum of degrees is even" immediately constrains possible degree sequences. Use it to prove impossibility results (e.g., no graph on 7 vertices can have all degrees odd).
]

#theorem[
  *Erdos--Gallai Theorem.* A non-increasing sequence $d_1 >= d_2 >= dots.c >= d_n >= 0$ is the degree sequence of a simple graph iff $sum d_i$ is even and for each $k = 1, dots, n$:
  $ sum_(i=1)^k d_i <= k(k - 1) + sum_(i=k+1)^n min(d_i, k). $
]

#remark[
  On competitions, you rarely need Erdos--Gallai explicitly. More common: use the handshaking lemma + specific structural arguments.
]

#trapbox[
  A degree sequence can be graphic (realizable by some graph) without being uniquely realizable. Two non-isomorphic graphs can share the same degree sequence. Do not confuse "has this degree sequence" with "is this specific graph."
]

== Trees and Cayley's Formula

#theorem[
  *Properties of Trees.* For a graph $T$ on $n$ vertices, the following are equivalent:
  + $T$ is connected and acyclic (i.e., $T$ is a tree).
  + $T$ is connected with exactly $n - 1$ edges.
  + $T$ is acyclic with exactly $n - 1$ edges.
  + Between any two vertices, there is exactly one path.
  + $T$ is minimally connected: removing any edge disconnects it.
  + $T$ is maximally acyclic: adding any edge creates a cycle.
]

#theorem[
  *Cayley's Formula.* The number of labeled trees on vertex set $\{1, 2, dots, n\}$ is $n^(n-2)$.
]

#proof[
  *Prufer sequence bijection.* We construct a bijection between labeled trees on $[n]$ and sequences $(a_1, dots, a_(n-2))$ with each $a_i in \{1, dots, n\}$.

  *Encoding:* Repeatedly remove the leaf with the smallest label; record its neighbor. After $n - 2$ steps, exactly 2 vertices remain (forming the last edge).

  *Decoding:* Given a Prufer sequence, reconstruct the tree greedily. At each step, the smallest number in $\{1, dots, n\}$ not in the remaining sequence and not yet removed becomes a leaf connected to the current sequence element.

  Since Prufer sequences are arbitrary elements of $\{1, dots, n\}^(n-2)$, there are $n^(n-2)$ labeled trees.
]

#conceptbox(title: "Prufer Sequence Properties")[
  - Vertex $v$ appears in the Prufer sequence exactly $deg(v) - 1$ times.
  - Leaves (degree 1) do not appear in the sequence.
  - The two vertices remaining at the end are always the two largest-labeled elements not consumed.
]

#trickbox[
  When a problem asks to count labeled trees or trees with degree constraints, think Prufer sequences. The degree condition $deg(v_i) = d_i$ translates to: vertex $v_i$ appears $d_i - 1$ times in the sequence, giving a multinomial coefficient.
]

== Euler's Formula for Planar Graphs

#theorem[
  *Euler's Formula.* For a connected planar graph with $V$ vertices, $E$ edges, and $F$ faces (including the outer face):
  $ V - E + F = 2. $
]

#corollary[
  For a simple connected planar graph with $V >= 3$: $E <= 3 V - 6$. If additionally the graph is triangle-free: $E <= 2 V - 4$.
]

#proof[
  Each face is bounded by at least 3 edges (or 4 if triangle-free), and each edge borders at most 2 faces. So $2 E >= 3 F$ (or $2 E >= 4 F$). Substituting $F = 2 - V + E$ from Euler's formula:
  $2 E >= 3(2 - V + E) = 6 - 3 V + 3 E$, giving $E <= 3 V - 6$.
]

#trapbox[
  Euler's formula applies to _connected_ planar graphs. For a planar graph with $c$ connected components, the formula becomes $V - E + F = c + 1$. Always check connectivity before applying.
]

#trickbox[
  To prove a graph is non-planar, show $E > 3 V - 6$ (or $E > 2 V - 4$ if triangle-free). This immediately proves $K_5$ is non-planar ($E = 10 > 3 dot 5 - 6 = 9$) and $K_(3,3)$ is non-planar ($E = 9 > 2 dot 6 - 4 = 8$, using triangle-free bound).
]

== Hall's Marriage Theorem

#theorem[
  *Hall's Marriage Theorem.* Let $G = (A union.sq B, E)$ be a bipartite graph. There exists a matching that saturates every vertex in $A$ (a _perfect matching from $A$_) if and only if for every subset $S subset.eq A$:
  $ |N(S)| >= |S|, $
  where $N(S) = \{b in B : exists a in S, a b in E\}$ is the neighborhood of $S$.
]

#definition[
  *Matching.* A matching in a graph is a set of edges with no shared endpoints. A _perfect matching_ covers every vertex.
]

#stratbox[
  To apply Hall's theorem: (1) model the problem as a bipartite graph; (2) verify Hall's condition $|N(S)| >= |S|$ for all $S subset.eq A$; (3) conclude a perfect matching exists. Often, Hall's condition is verified using counting or PHP.
]

#conceptbox(title: "Hall's Theorem Applications")[
  - *Latin squares:* An $n times n$ partial Latin square with $<= n - 1$ entries can be extended to a full Latin square.
  - *System of distinct representatives (SDR):* Given sets $A_1, dots, A_n$, an SDR exists iff $|union_(i in S) A_i| >= |S|$ for all $S subset.eq [n]$.
  - *Doubly stochastic matrices:* Birkhoff's theorem (every doubly stochastic matrix is a convex combination of permutation matrices) follows from Hall's theorem.
]

#trapbox[
  Hall's condition must hold for _all_ subsets $S$, not just singletons or the full set. A common competition error is checking only $|N(\{a\})| >= 1$ for each $a in A$ (this is necessary but not sufficient).
]

== Graph Coloring and Chromatic Number

#definition[
  *Proper Coloring.* A proper $k$-coloring of $G$ assigns one of $k$ colors to each vertex such that adjacent vertices receive different colors. The _chromatic number_ $chi(G)$ is the minimum $k$ for which a proper $k$-coloring exists.
]

#theorem[
  *Basic Bounds.*
  - $chi(G) >= omega(G)$ (clique number: size of the largest complete subgraph).
  - $chi(G) >= n / alpha(G)$ (where $alpha(G)$ = independence number).
  - $chi(G) <= Delta(G) + 1$ (greedy bound, where $Delta$ = max degree).
]

#theorem[
  *Brooks' Theorem.* If $G$ is connected and is neither a complete graph nor an odd cycle, then $chi(G) <= Delta(G)$.
]

#definition[
  *Chromatic Polynomial.* $P(G, k)$ counts the number of proper $k$-colorings of $G$. It is a polynomial in $k$ of degree $n = |V|$.
]

#conceptbox(title: "Chromatic Polynomial Examples")[
  - *$K_n$:* $P(K_n, k) = k(k-1)(k-2) dots.c (k - n + 1) = k^(underline(n))$
  - *Tree on $n$ vertices:* $P(T_n, k) = k(k - 1)^(n - 1)$
  - *Cycle $C_n$:* $P(C_n, k) = (k - 1)^n + (-1)^n (k - 1)$
]

#trickbox[
  The deletion-contraction recurrence $P(G, k) = P(G - e, k) - P(G \/ e, k)$ computes the chromatic polynomial by removing or contracting an edge $e$. This is useful for small graphs on competitions.
]

#theorem[
  *Four Color Theorem.* Every planar graph has $chi(G) <= 4$. (The proof is computer-assisted and not expected on competitions, but the result is freely usable.)
]

#tldr[
  Chromatic number: minimum colors for proper coloring. Upper bound: $Delta + 1$ (greedy) or $Delta$ (Brooks). Trees need 2 colors, planar graphs need at most 4.
]

== Problems

#drill-header("Graph Theory")

#prob(1)[
  #difficulty(1)
  A graph on 10 vertices has every vertex of degree 3. How many edges does it have?
]
#hint(1)[Use the handshaking lemma: $sum deg(v) = 2|E|$.]
#hint(2)[$10 times 3 = 30 = 2|E|$.]
#hint(3)[$|E| = 15$.]
#solution[
  By the handshaking lemma, $2|E| = sum deg(v) = 10 times 3 = 30$, so $|E| = bold(15)$.
]

#prob(2)[
  #difficulty(1)
  How many labeled trees are there on 6 vertices?
]
#hint(1)[Apply Cayley's formula.]
#hint(2)[$n^(n-2) = 6^4$.]
#hint(3)[$6^4 = 1296$.]
#solution[
  By Cayley's formula, the number of labeled trees on $n = 6$ vertices is $6^(6-2) = 6^4 = bold(1296)$.
]

#prob(3)[
  #difficulty(1)
  A connected planar graph has 8 vertices and 13 edges. How many faces does it have?
]
#hint(1)[Use Euler's formula $V - E + F = 2$.]
#hint(2)[$8 - 13 + F = 2$.]
#hint(3)[$F = 7$.]
#solution[
  By Euler's formula: $F = 2 - V + E = 2 - 8 + 13 = bold(7)$.
]

#prob(4)[
  #difficulty(2)
  A bipartite graph $G = (A union.sq B, E)$ has $|A| = |B| = n$ and every vertex in $A$ has degree at least $n/2$. Show that $G$ has a perfect matching.
]
#hint(1)[Verify Hall's condition: for any $S subset.eq A$, show $|N(S)| >= |S|$.]
#hint(2)[If $|S| <= n/2$, each vertex in $S$ has $>= n/2$ neighbors, so $|N(S)| >= n/2 >= |S|$.]
#hint(3)[If $|S| > n\/2$, count non-edges: each $a in S$ misses $<= floor(n\/2)$ vertices in $B$, so at most $|S| floor(n\/2)$ non-edges leave $S$. Each $b in.not N(S)$ accounts for $|S|$ non-edges, bounding $|B backslash N(S)|$.]
#solution[
  We verify Hall's condition $|N(S)| >= |S|$ for all $S subset.eq A$.

  *Case 1:* $|S| <= ceil(n\/2)$. Any single $a in S$ has $>= ceil(n\/2)$ neighbors, so $|N(S)| >= ceil(n\/2) >= |S|$.

  *Case 2:* $|S| > ceil(n\/2)$. The edges from $S$ to $B$ number at least $|S| ceil(n\/2)$. These land on $|N(S)|$ vertices, each receiving at most $|S|$ edges, so $|N(S)| >= ceil(n\/2)$. But we need $|N(S)| >= |S|$. Count non-edges: each $a in S$ has at most $floor(n\/2)$ non-neighbors in $B$, giving $<= |S| floor(n\/2)$ non-edge pairs from $S$ to $B$. Each $b in B backslash N(S)$ is non-adjacent to _all_ of $S$, contributing $|S|$ non-edges. So $|B backslash N(S)| <= floor(n\/2) < |S|$, hence $|N(S)| = n - |B backslash N(S)| > n - |S| >= |S|$ when $2|S| <= n$. For $|S| > n\/2$: $|N(S)| >= n - floor(n\/2) = ceil(n\/2) >= |S|$ when $|S| <= ceil(n\/2)$, and the monotonicity $S subset.eq S' arrow.r.double N(S) subset.eq N(S')$ gives $|N(S)| >= |N(S_0)| >= ceil(n\/2)$ for any $S_0 subset.eq S$ with $|S_0| = ceil(n\/2)$. Since adding vertices to $S$ can only grow $N(S)$, and $|N(S)| >= ceil(n\/2) >= |S|$ holds at the threshold, Hall's condition is satisfied for all $|S|$.

  By Hall's marriage theorem, a perfect matching exists.
]

#prob(5)[
  #difficulty(2)
  Find the chromatic polynomial of the cycle $C_5$.
]
#hint(1)[Use the deletion-contraction recurrence: $P(C_5, k) = P(P_5, k) - P(C_4, k)$.]
#hint(2)[$P(P_n, k) = k(k-1)^(n-1)$ for any path $P_n$.]
#hint(3)[Use $P(C_n, k) = (k - 1)^n + (-1)^n (k - 1)$ or derive it from deletion-contraction.]
#solution[
  Using the formula $P(C_n, k) = (k - 1)^n + (-1)^n (k - 1)$:

  $P(C_5, k) = (k - 1)^5 + (-1)^5 (k - 1) = (k - 1)^5 - (k - 1) = (k - 1)((k-1)^4 - 1)$.

  Expanding: $(k-1)^5 = k^5 - 5 k^4 + 10 k^3 - 10 k^2 + 5 k - 1$, so

  $P(C_5, k) = k^5 - 5 k^4 + 10 k^3 - 10 k^2 + 5 k - 1 - k + 1 = bold(k^5 - 5 k^4 + 10 k^3 - 10 k^2 + 4 k)$.
]

#prob(6)[
  #difficulty(3)
  #putnam(2010, "A5")[
    Let $G$ be a graph on $n$ vertices where every vertex has degree $>= n\/2$. Prove $G$ is Hamiltonian (has a cycle visiting every vertex exactly once).
  ]
]
#hint(1)[This is Dirac's theorem. Start with the longest path $P = v_1 v_2 dots.c v_k$ in $G$.]
#hint(2)[Show $k = n$ (the path visits all vertices). If some vertex $w in.not P$, then $w$ is adjacent to some $v_i$ on $P$ (since $deg(w) >= n\/2$), and you can reroute the path to include $w$, contradicting maximality.]
#hint(3)[To close the path into a cycle: let $S = \{i : v_1 v_(i+1) in E\}$ and $T = \{i : v_k v_i in E\}$. Both $|S|, |T| >= n\/2$ and $S, T subset.eq \{1, dots, n-1\}$, so $|S inter T| >= 1$. If $j in S inter T$, the cycle $v_1 v_2 dots.c v_j v_k v_(k-1) dots.c v_(j+1) v_1$ is Hamiltonian.]
#solution[
  *Dirac's Theorem.* Let $P = v_1 v_2 dots.c v_k$ be a longest path in $G$.

  *Claim 1: $k = n$.* If some $w in.not P$, then all neighbors of $w$ are on $P$ (otherwise we extend $P$). Since $deg(w) >= n\/2$, $w$ has $>= n\/2$ neighbors on $P$. Some neighbor $v_i$ (with $2 <= i <= k - 1$) has $v_(i-1)$ also on $P$. We can reroute: $v_1 dots.c v_(i-1) w v_i dots.c v_k$ is a longer path, contradiction.

  *Claim 2: $P$ closes to a Hamiltonian cycle.* Let $S = \{i in \{1, dots, n-1\} : v_1 v_(i+1) in E\}$ and $T = \{i in \{1, dots, n-1\} : v_n v_i in E\}$. Then $|S| >= n\/2$ and $|T| >= n\/2$. Since $|S| + |T| >= n > n - 1$, by PHP $S inter T eq.not emptyset$. Pick $j in S inter T$. Then $v_1 -> v_2 -> dots.c -> v_j -> v_n -> v_(n-1) -> dots.c -> v_(j+1) -> v_1$ is a Hamiltonian cycle.
]

#prob(7)[
  #difficulty(3)
  #putnam(2016, "B3")[
    Let $T$ be a labeled tree on $\{1, 2, dots, n\}$ in which vertex 1 has degree $d$. How many such trees are there?
  ]
]
#hint(1)[Use Prufer sequences. Vertex 1 has degree $d$ iff it appears exactly $d - 1$ times in the Prufer sequence.]
#hint(2)[Choose $d - 1$ positions out of $n - 2$ for vertex 1 in the Prufer sequence. Fill the remaining $n - 2 - (d - 1) = n - 1 - d$ positions with any of $\{2, 3, dots, n\}$.]
#hint(3)[Count: $binom(n - 2, d - 1) dot (n - 1)^(n - 1 - d)$.]
#solution[
  In the Prufer sequence of length $n - 2$, vertex $v$ appears exactly $deg(v) - 1$ times. For vertex 1 to have degree $d$, it must appear $d - 1$ times.

  Choose the $d - 1$ positions for vertex 1: $binom(n - 2, d - 1)$ ways. The remaining $n - 1 - d$ positions each take a value from $\{2, 3, dots, n\}$ ($n - 1$ choices each), since all occurrences of vertex 1 are already placed.

  The answer is $bold(binom(n - 2, d - 1) (n - 1)^(n - 1 - d))$.
]
