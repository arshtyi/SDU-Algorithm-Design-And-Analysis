#import "@preview/ezexam:0.3.1": *
#import "@preview/algorithmic:1.0.7"
#import algorithmic: algorithm-figure, style-algorithm
#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node

#show: setup.with(
    mode: EXAM,
    resume: false,
    heading-top: 0em,
    heading-bottom: .4em,
    line-height: .65em,
    par-spacing: .65em,
    enum-spacing: .65em,
    list-spacing: .65em,
)
#set par(justify: true)
#show link: it => text(fill: blue.darken(40%), underline(it))
#show raw: set text(font: ("JetBrains Mono", "Noto Serif CJK SC", "Noto Sans CJK SC"))
#show raw.where(block: false): box.with(
    fill: luma(240),
    inset: (x: .3em, y: 0em),
    outset: (x: 0em, y: .3em),
    radius: .2em,
)
#show raw.where(block: true): block.with(
    fill: luma(248),
    stroke: 0.5pt + rgb("bfbfbf"),
    inset: 0.7em,
    radius: 4pt,
)
#show: style-algorithm

#let Title = "山东大学计算机科学与技术学院算法设计与分析课后作业"
#let author = "arsshtyi"
#let date = datetime.today()
#set document(title: Title, author: author, date: date)
#title(Title)
#exam-info(info: (
    班级: "24智能",
    教师: "姜海涛",
    源码: link("https://github.com/arshtyi/SDU-Algorithm-Design-And-Analysis", "source"),
    课本: link("https://mitpress.mit.edu/9780262046305/introduction-to-algorithms", "The Book"),
))
#let (ll) = (
    sym.lt.eq.slant
)

= No.1
#question[
    (_22.2-2_) Show the $d$ and $pi$ values that result from running breadth-first search on the undirected graph of Figure 22.3(also as follows), using vertex $u$ as the source.
    #figure({
        let vertex(pos, label, name, weight, fill: none, name-dx: 0, name-dy: -0.45, shape: circle) = {
            node(
                pos,
                name: label,
                shape: shape,
                inset: 0pt,
                stroke: 0.7pt,
                fill: fill,
                radius: 1em,
            )[$#weight$]
            node(
                (rel: (name-dx, name-dy), to: label),
                stroke: none,
                inset: 0pt,
            )[$#name$]
        }
        diagram(
            node-stroke: .1em,
            vertex((0, 1), <v>, `v`, $infinity$, name-dy: 0.45),
            vertex((0, 0), <r>, `r`, $infinity$),
            vertex((1, 0), <s>, `s`, $0$, fill: rgb("#dcddde")),
            vertex((1, 1), <w>, `w`, $infinity$, name-dy: 0.45),
            vertex((2, 1), <x>, `x`, $infinity$, name-dy: 0.45),
            vertex((2, 0), <t>, `t`, $infinity$),
            vertex((3, 0), <u>, `u`, $infinity$),
            vertex((3, 1), <y>, `y`, $infinity$, name-dy: 0.45),
            edge(<v>, <r>),
            edge(<r>, <s>),
            edge(<s>, <w>),
            edge(<w>, <x>),
            edge(<w>, <t>),
            edge(<t>, <x>),
            edge(<t>, <u>),
            edge(<x>, <y>),
            edge(<u>, <y>),
            edge(<u>, <x>),
            node((3.7, .5), text(size: 15pt, `Q`), stroke: none),
            vertex((4.2, .5), <Q>, $0$, $s$, name-dy: 0.45, fill: rgb("#dcddde"), shape: rect),
        )
    })<F1>
]
#question[
    (_22.2-8_) The *_diameter_* of a tree $T=(V,E)$ is defined as $max_(u,v in V) delta(u, v)$, that is, the largest of all shortest-path distances in the tree. Give an efficient algorithm to compute the diameter of a tree, and analyze the running time of your algorithm.
]
= No.2
#question[
    (_22.3-2_) Show how depth-first search works on the graph of Figure 22.6(also as follows). Assume that the *for* loop of lines $5-7$ of the *DFS* procedure considers the vertices in alphabetical order, and assume that each adjacency list is ordered alphabetically. Show the discovery and finishing times for each vertex, and show the classification of each edge.
    #figure({
        let node = node.with(radius: 1em)
        let edge = edge.with(marks: "-}>")
        diagram(
            node-shape: circle,
            node-fill: rgb("#dcddde"),
            node-stroke: .1em,
            mark-scale: 200%,
            node((0, 2), `v`, name: <v>),
            node((1, 1), `s`, name: <s>),
            node((2, 2), `w`, name: <w>),
            node((3, 0), `q`, name: <q>),
            node((4, 1), `t`, name: <t>),
            node((4, 2), `x`, name: <x>),
            node((4, 3), `z`, name: <z>),
            node((5, 2), `y`, name: <y>),
            node((6, 0), `r`, name: <r>),
            node((7, 1), `u`, name: <u>),
            edge(<v>, <w>),
            edge(<s>, <v>),
            edge(<w>, <s>),
            edge(<q>, <s>),
            edge(<q>, <w>),
            edge(<q>, <t>),
            edge(<t>, <x>),
            edge(<x>, <z>),
            edge(<z>, <x>, bend: -50deg),
            edge(<t>, <y>),
            edge(<y>, <q>, bend: -50deg),
            edge(<r>, <y>),
            edge(<u>, <y>),
            edge(<r>, <u>),
        )
    })<F2>
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
    (_22.4-2_) Give a linear-time algorithm that takes as input a directed acyclic graph $G = (V, E)$ and two vertices $s$ and $t$, and returns the number of simple paths from $s$ to $t$ in $G$. For example, the directed acyclic graph of Figure 22.8(also as follows) contains exactly four simple paths from vertex $p$ to vertex $v: p o v$, $p o r y v$, $p o s r y v$, and $p s r y v$. (Your algorithm needs only to count the simple paths, not list them.)
    #figure({
        let node = node.with(radius: 1em)
        let edge = edge.with(marks: "-}>")
        let vertices = ("m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z")
        let row-lens = (4, 3, 4, 3)
        let row-starts = (0, 4, 7, 11)
        let get-row(i) = { if i < 4 { 0 } else if i < 7 { 1 } else if i < 11 { 2 } else { 3 } }
        let draw-edge(from, to) = {
            for i in range(to.len()) { edge(label(from), label(to.at(i))) }
        }
        diagram(
            cell-size: 18mm,
            node-shape: circle,
            node-fill: rgb("#d1d2d3"),
            node-stroke: .1em,
            mark-scale: 200%,
            for i in range(vertices.len()) {
                let v = vertices.at(i)
                let row = get-row(i)
                let col = i - row-starts.at(row)
                let n = row-lens.at(row)
                let x = col - (n - 1) / 2
                let y = row
                node((x, y), name: label(v))[$#v$]
            },
            draw-edge("m", ("q", "r", "x")),
            draw-edge("n", ("q", "u", "o")),
            draw-edge("o", ("r", "v", "s")),
            draw-edge("p", ("o", "s", "z")),
            draw-edge("q", "t"),
            draw-edge("r", ("u", "y")),
            draw-edge("s", "r"),
            draw-edge("t", ()),
            draw-edge("u", "t"),
            draw-edge("v", ("x", "w")),
            draw-edge("w", "z"),
            draw-edge("x", ()),
            draw-edge("y", "v"),
            draw-edge("z", ()),
        )
    })<F3>
]

#question[
    (_22.5-2_) Show how the procedure _STRONGLY-CONNECTED-COMPONENTS_ works on the graph of Figure 22.6(also as @F2). Specifically, show the finishing times computed in line 1 and the forest produced in line 3. Assume that the loop of lines 5-7 of *DFS* considers vertices in alphabetical order and that the adjacency lists are in alphabetical order.
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
]
= No.5
#question[
    (_24.1-1_) Run the Bellman-Ford algorithm on the directed graph of Figure 24.4(also as follows), using vertex $z$ as the source. In each pass, relax edges in the same order as in the figure, and show the $d$ and $pi$ values after each pass. Now, change the weight of edge $(z, x)$ to $4$ and run the algorithm again, using $s$ as the source.
    #figure({
        let edge = edge.with(marks: "-}>", label-sep: .1em)
        let vertex(pos, label, name, weight, name-dx: 0, name-dy: -.25, shape: circle) = {
            node(
                pos,
                name: label,
                shape: shape,
                inset: 0pt,
                stroke: 0.7pt,
                fill: rgb("#dcddde"),
                radius: 1em,
            )[$#weight$]
            node(
                (rel: (name-dx, name-dy), to: label),
                stroke: none,
                inset: 0pt,
            )[$#name$]
        }
        diagram(
            cell-size: 18mm,
            node-shape: circle,
            node-stroke: .1em,
            mark-scale: 200%,
            vertex((0, .5), <s>, `s`, $0$, name-dx: -0.25, name-dy: 0),
            vertex((1, 0), <t>, `t`, $infinity$),
            vertex((2, 0), <x>, `x`, $infinity$),
            vertex((1, 1), <y>, `y`, $infinity$, name-dy: 0.25),
            vertex((2, 1), <z>, `z`, $infinity$, name-dy: 0.25),
            edge(<s>, <t>, $6$),
            edge(<s>, <y>, $7$, label-side: right),
            edge(<t>, <x>, $5$, bend: 20deg),
            edge(<t>, <y>, $8$),
            edge(<t>, <z>, $-4$, label-pos: .8),
            edge(<x>, <t>, $-2$, bend: 20deg, label-side: right),
            edge(<y>, <x>, $-3$, label-pos: .8, label-side: right),
            edge(<y>, <z>, $9$, label-side: right),
            edge(<z>, <s>, $2$, label-pos: .2),
            edge(<z>, <x>, $7$, label-side: right),
        )
    })<F4>
]

#question[
    (_24.1-6_) Suppose that a weighted, directed graph $G = (V, E)$ has a negative-weight cycle. Give an efficient algorithm to list the vertices of one such cycle. Prove that your algorithm is correct.
]
= No.6
#question[
    (_24.3-2_) Give a simple example of a directed graph with negative-weight edges for which Dijkstra's algorithm produces incorrect answers. Why doesn't the proof of Theorem 24.6 go through when negative-weight edges are allowed?
]

= No.7
#question[
    (_25.2-5_) Suppose that we modify the way in which equation (25.7) handles equality:
    $
        pi_(i j)^((k))=cases(
            pi_(i j)^((k - 1)) "if" d_(i j)^((k - 1)) < d_(i k)^((k - 1)) + d_(k j)^((k - 1)),
            pi_(k j)^((k - 1)) "if" d_(i j)^((k - 1)) >= d_(i k)^((k - 1)) + d_(k j)^((k - 1))
        )
    $
    Is this alternative definition of the predecessor matrix $product$ correct?
]
