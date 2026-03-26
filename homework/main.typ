#import "@preview/ezexam:0.2.9": *
#import "@preview/zebraw:0.6.1": *
#import "@preview/subpar:0.2.2"
#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node
#import "@preview/pinit:0.2.2": *

#set page(height: auto)
#set par(justify: true)
#set smartquote(quotes: "\"\"")

#show: zebraw
#show: setup.with(
    mode: EXAM,
    resume: false,
)
#show link: it => {
    set text(fill: blue)
    underline(offset: 2.5pt, it)
}

#title[
    山东大学计算机科学与技术学院 \
    24 数据、智能算法设计与分析课后作业
]

#notice(
    [出于方便使用#link("https://github.com/gbchu/ezexam", "gbchu/ezexam:0.2.9")作模板.],
    [源码:#link("https://github.com/Arshtyi/SDU-Algorithm-Design-And-Analysis").],
    [本课程作业来自#link("https://mitpress.mit.edu/9780262046305/introduction-to-algorithms/", "The Book"). 本书的所有题解都容易找到,作者仅记录题目.],
)
#show strong: it => {
    set text(weight: "bold")
    it
}

#let (ll) = (
    sym.lt.eq.slant
)

= No.1
#question()[
    (_22.2-2_) Show the $d$ and $pi$ values that result from running breadth-first search on the undirected graph of Figure 22.3, using vertex $u$ as the source.
]

#question()[
    (_22.2-8_) The *_diameter_* of a tree $T=(V,E)$ is defined as $max_(u,v in V) delta(u, v)$, that is, the largest of all shortest-path distances in the tree. Give an efficient algorithm to compute the diameter of a tree, and analyze the running time of your algorithm.
]
= No.2
#question()[
    (_22.3-2_) Show how depth-first search works on the graph of Figure 22.6. Assume that the *for* loop of lines $5-7$ of the *DFS* procedure considers the vertices in alphabetical order, and assume that each adjacency list is ordered alphabetically. Show the discovery and finishing times for each vertex, and show the classification of each edge.
]

#question()[
    (_22.3-8_) Give a counterexample to the conjecture that if a directed graph $G$ contains a path from $u$ to $v$, and if $u.d < v.d$ in a depth-first search of $G$, then $v$ is a descendant of $u$ in the depth-first forest produced.
]

#question()[
    (_22.3-9_) Give a counterexample to the conjecture that if a directed graph $G$ contains a path from $u$ to $v$, then any depth-first search must result in $v.d ll u.f$.
]

#question()[
    (_22.3-13_) A directed graph $G = (V, E)$ is *_singly connected_* if $u arrow.r.squiggly v$ implies that $G$ contains at most one simple path from $u$ to $v$ for all vertices $u, v in V$. Give an efficient algorithm to determine whether or not a directed graph is singly connected.
]
= No.3
#question()[
    (_22.4-2_) Give a linear-time algorithm that takes as input a directed acyclic graph $G = (V, E)$ and two vertices $s$ and $t$, and returns the number of simple paths from $s$ to $t$ in $G$. For example, the directed acyclic graph of Figure 22.8 contains exactly four simple paths from vertex $p$ to vertex $v: p o v$, $p o r y v$, $p o s r y v$, and $p s r y v$. (Your algorithm needs only to count the simple paths, not list them.)
]

#question()[
    (_22.5-2_) Show how the procedure _STRONGLY-CONNECTED-COMPONENTS_ works on the graph of Figure 22.6. Specifically, show the finishing times computed in line 1 and the forest produced in line 3. Assume that the loop of lines 5-7 of *DFS* considers vertices in alphabetical order and that the adjacency lists are in alphabetical order.
]

#question()[
    (_22.5-3_) Professor Bacon claims that the algorithm for strongly connected components would be simpler if it used the original (instead of the transpose) graph in the second depth-first search and scanned the vertices in order of _increasing_ finishing times. Does this simpler algorithm always produce correct results?
]

#question()[
    (_22.5-7_) A directed graph $G = (V, E)$ is *_semiconnected_* if, for all pairs of vertices $u, v \in V$, we have $u arrow.r.squiggly v$ or $v arrow.r.squiggly u$. Give an efficient algorithm to determine whether or not $G$ is semiconnected. Prove that your algorithm is correct, and analyze its running time.
]
