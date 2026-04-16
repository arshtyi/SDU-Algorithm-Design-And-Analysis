#import "@preview/ezexam:0.3.1": *
// #import "@preview/lovelace:0.3.1": *
// 如果有一个介于lavelace和algorithmic之间的包就好了(,后者其实更加接近一般的pseudocode样式,但是确实不太适合用于此处(指L95)
#import "@preview/algorithmic:1.0.7"
#import algorithmic: algorithm-figure, style-algorithm

#set page(height: auto)
#set par(justify: true)
#set smartquote(quotes: "\"\"")
#show: setup.with(
    mode: EXAM,
    resume: false,
)
#show link: it => text(fill: blue.darken(20%), underline(it))
#show strong: it => text(weight: "bold", it)
#show: style-algorithm

#title[
    山东大学计算机科学与技术学院 \
    24 数据、智能算法设计与分析课后作业
]
#notice(
    [出于方便使用#link("https://github.com/gbchu/ezexam", "gbchu/ezexam:0.3.1")作模板.],
    [源码:#link("https://github.com/arshtyi/SDU-Algorithm-Design-And-Analysis").],
    [本课程作业来自#link("https://mitpress.mit.edu/9780262046305/introduction-to-algorithms/", "The Book"). 本书的所有题解都容易找到,作者仅按自己的想法记录题目.],
)

#let (ll) = (
    sym.lt.eq.slant
)

= No.1
#question[
    (_22.2-2_) Show the $d$ and $pi$ values that result from running breadth-first search on the undirected graph of Figure 22.3, using vertex $u$ as the source.
]

#question[
    (_22.2-8_) The *_diameter_* of a tree $T=(V,E)$ is defined as $max_(u,v in V) delta(u, v)$, that is, the largest of all shortest-path distances in the tree. Give an efficient algorithm to compute the diameter of a tree, and analyze the running time of your algorithm.
]
= No.2
#question[
    (_22.3-2_) Show how depth-first search works on the graph of Figure 22.6. Assume that the *for* loop of lines $5-7$ of the *DFS* procedure considers the vertices in alphabetical order, and assume that each adjacency list is ordered alphabetically. Show the discovery and finishing times for each vertex, and show the classification of each edge.
]

#question[
    (_22.3-8_) Give a counterexample to the conjecture that if a directed graph $G$ contains a path from $u$ to $v$, and if $u.d < v.d$ in a depth-first search of $G$, then $v$ is a descendant of $u$ in the depth-first forest produced.
]

#question[
    (_22.3-9_) Give a counterexample to the conjecture that if a directed graph $G$ contains a path from $u$ to $v$, then any depth-first search must result in $v.d ll u.f$.
]

#question[
    (_22.3-13_) A directed graph $G = (V, E)$ is *_singly connected_* if $u arrow.r.squiggly v$ implies that $G$ contains at most one simple path from $u$ to $v$ for all vertices $u, v in V$. Give an efficient algorithm to determine whether or not a directed graph is singly connected.
]
= No.3
#question[
    (_22.4-2_) Give a linear-time algorithm that takes as input a directed acyclic graph $G = (V, E)$ and two vertices $s$ and $t$, and returns the number of simple paths from $s$ to $t$ in $G$. For example, the directed acyclic graph of Figure 22.8 contains exactly four simple paths from vertex $p$ to vertex $v: p o v$, $p o r y v$, $p o s r y v$, and $p s r y v$. (Your algorithm needs only to count the simple paths, not list them.)
]

#question[
    (_22.5-2_) Show how the procedure _STRONGLY-CONNECTED-COMPONENTS_ works on the graph of Figure 22.6. Specifically, show the finishing times computed in line 1 and the forest produced in line 3. Assume that the loop of lines 5-7 of *DFS* considers vertices in alphabetical order and that the adjacency lists are in alphabetical order.
]

#question[
    (_22.5-3_) Professor Bacon claims that the algorithm for strongly connected components would be simpler if it used the original (instead of the transpose) graph in the second depth-first search and scanned the vertices in order of _increasing_ finishing times. Does this simpler algorithm always produce correct results?
]

#question[
    (_22.5-7_) A directed graph $G = (V, E)$ is *_semiconnected_* if, for all pairs of vertices $u, v in V$, we have $u arrow.r.squiggly v$ or $v arrow.r.squiggly u$. Give an efficient algorithm to determine whether or not $G$ is semiconnected. Prove that your algorithm is correct, and analyze its running time.
]
= No.4
#question[
    (_23.1-5_) Let $e$ be a maximum-weight edge on some cycle of connected graph $G = (V, E)$. Prove that there is a minimum spanning tree of $G' = (V, E - {e})$ that is also a minimum spanning tree of $G$. That is, there is a minimum spanning tree of $G$ that does not include $e$.
]

#question[
    (_23.2-1_) Kruskal's algorithm can return different spanning trees for the same input graph $G$, depending on how it breaks ties when the edges are sorted into order. Show that for each minimum spanning tree $T$ of $G$, there is a way to sort the edges of $G$ in Kruskal's algorithm so that the algorithm returns $T$.
]

#question[
    (_23.2-8_) Professor Borden proposes a new divide-and-conquer algorithm for computing minimum spanning trees, which goes as follows. Given a graph $G = (V, E)$, partition the set $V$ of vertices into two sets $V_1$ and $V_2$ such that $bar.v V_1 bar.v$ and $bar.v V_2 bar.v$ differ by at most $1$. Let $E_1$ be the set of edges that are incident only on vertices in $V_1$, and let $E_2$ be the set of edges that are incident only on vertices in $V_2$. Recursively solve a minimum-spanning-tree problem on each of the two subgraphs $G_1 = (V_1, E_1)$ and $G_2 = (V_2, E_2)$. Finally, select the minimum-weight edge in $E$ that crosses the cut $(V_1, V_2)$, and use this edge to unite the resulting two minimum spanning trees into a single spanning tree.

    Either argue that the algorithm correctly computes a minimum spanning tree of $G$, or provide an example for which the algorithm fails.
]

#question[
    (_23-4_)  In this problem, we give pseudocode for three different algorithms. Each one takes a connected graph and a weight function as input and returns a set of edges $T$. For each algorithm, either prove that $T$ is a minimum spanning tree or prove that $T$ is not a minimum spanning tree. Also describe the most efficient implementation of each algorithm, whether or not it computes a minimum spanning tree.
    #algorithm-figure(
        "MAYBE-MST-A",
        vstroke: .5pt + luma(200),
        {
            import algorithmic: *
            Procedure("MAYBE-MST-A", ("G", "w"), {
                Comment[sort the edges into nonincreasing order of edge weights $w$]
                Assign[$T$][$E$]
                For($"edge" e ,"taken in nonincreasing order by weight"$, {
                    If($T - {e} "is a connected graph"$, {
                        Assign[$T$][$T - {e}$]
                    })
                })
                Return[$T$]
            })
        },
    )
    #algorithm-figure("MAYBE-MST-B", vstroke: .5pt + luma(200), {
        import algorithmic: *
        Procedure("MAYBE-MST-B", ("G", "w"), {
            Assign[$T$][$nothing$]
            For($"edge" e ,"taken in arbitrary order"$, {
                If($T union {e} "has no cycles"$, {
                    Assign[$T$][$T union {e}$]
                })
            })
            Return[$T$]
        })
    })
    #algorithm-figure("MAYBE-MST-C", vstroke: .5pt + luma(200), {
        import algorithmic: *
        Procedure("MAYBE-MST-C", ("G", "w"), {
            Assign[$T$][$nothing$]
            For($"edge" e ,"taken in arbitrary order"$, {
                Assign[$T$][$T union {e}$]
                If($T "has a cycle" c$, {
                    Assign[$e'$][$"a maximum-weight edge on" c$]
                    Assign[$T$][$T - {e'}$]
                })
            })
            Return[$T$]
        })
    })

    /*
    #set enum(numbering: n => emph(strong(numbering("a.", n))))

    + MAYBE-MST-A(G, w)
        ```
        sort the edges into nonincreasing order of edge weights w
        T = E
        for each edge e, taken in nonincreasing order by weight
            if T - {e} is a connected graph
                T = T - {e}
        return T
        ```
    + MAYBE-MST-B(G, w)
        ```
        T = Ø
        for each edge e, taken in arbitrary order
            if T ∪ {e} has no cycles
                T = T ∪ {e}
        return T
        ```
    + MAYBE-MST-C(G, w)
        ```
        T = Ø
        for each edge e, taken in arbitrary order
            T = T ∪ {e}
            if T has a cycle c
                let e' be a maximum-weight edge on c
                T = T - {e}
        return T
        ```
    */
]
= No.5
#question[
    (_24.1-1_) Run the Bellman-Ford algorithm on the directed graph of Figure 24.4, using vertex $z$ as the source. In each pass, relax edges in the same order as in the figure, and show the $d$ and $pi$ values after each pass. Now, change the weight of edge $(z, x)$ to $4$ and run the algorithm again, using $s$ as the source.
]

#question[
    (_24.1-6_) Suppose that a weighted, directed graph $G = (V, E)$ has a negative-weight cycle. Give an efficient algorithm to list the vertices of one such cycle. Prove that your algorithm is correct.
]
