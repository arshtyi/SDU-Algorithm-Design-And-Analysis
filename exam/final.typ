#import "@preview/ezexam:0.3.1": *
#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node
#import "@preview/algorithmic:1.0.7"
#import algorithmic: algorithm-figure, style-algorithm

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
#show strong: set text(weight: "bold")
#let Title = "山东大学计算机科学与技术学院算法设计与分析期末考试"
#let author = "arshtyi"
#let date = datetime.today()
#set document(title: Title, date: date, author: author)
#title(Title)
#exam-info(info: (
    班级: "24数据·24智能",
    教师: "姜海涛",
    时间: datetime(year: 2026, month: 7, day: 8).display("[year].[month].[day]"),
    源码: link("https://github.com/arshtyi/SDU-Algorithm-Design-And-Analysis", "link"),
))
#show: style-algorithm

= 计算
#question[
    对于下图
    #figure({
        let edge = edge.with("-|>")
        diagram(
            cell-size: 3em,
            node-stroke: 1pt,
            node-shape: circle,
            node((0, 0), $s$),
            edge("d"),
            edge("rd"),
            edge("r"),
            node((0, 1), $w$),
            edge("r"),
            node((1, 0), $u$),
            edge("d"),
            edge("ld"),
            edge("rd"),
            node((1, 1), $x$),
            edge("r"),
            node((2, 0), $v$),
            edge("l"),
            edge("ld"),
            node((2, 1), $y$),
            edge("u"),
        )
    })
    + 从 $s$ 开始，给出广度优先搜索树。
    + 从 $s$ 开始，给出深度优先搜索森林和边的类别。
]
#question[
    Compute *all-pairs shortest paths* on the following weighted directed graph *using the Floyd-Warshall algorithm. Show all distance matrices and the predecessor matrix.*
    #figure({
        let edge = edge.with("-|>")
        diagram(
            node-stroke: 1pt,
            cell-size: 3em,
            node((0, 0), $1$),
            edge("r", $3$, shift: 5pt),
            node((1, 0), $2$),
            edge("l", $2$, label-side: left, shift: 5pt),
            edge("r", $1$, shift: 5pt),
            node((2, 0), $3$),
            edge("l", $-1$, label-side: left, shift: 5pt),
        )
    })
]
#question[
    Compute the *maximum flow* of the flow network. Show all *augmenting paths* and all *residual networks.*
    #figure({
        let edge = edge.with(marks: "-|>")
        diagram(
            node-stroke: 1pt,
            cell-size: 3em,
            node((0, .5), $s$, name: <s>),
            edge(<s>, <a>, $8$),
            edge(<s>, <b>, $5$),
            node((1, 0), $a$, name: <a>),
            edge(<a>, <b>, $4$),
            edge(<a>, <c>, $3$),
            edge(<a>, <d>, $1$, label-pos: .2),
            node((1, 1), $b$, name: <b>),
            edge(<b>, <c>, $2$, label-pos: .2),
            edge(<b>, <d>, $6$),
            node((2, 0), $c$, name: <c>),
            edge(<c>, <d>, $3$),
            edge(<c>, <t>, $7$),
            node((2, 1), $d$, name: <d>),
            edge(<d>, <t>, $6$),
            node((3, .5), $t$, name: <t>),
        )
    })
]
= 证明
#question[
    给定有向加权图 $G=(V,E,w)$。对于每个 $v in V$，给定一个固定值 $h(v)$，并将边权修改为 $w'(u,v)=w(u,v)+h(u)-h(v)$。请证明：对于图中任意环 $C=(v_1, v_2, dots.c, v_k=v_1)$，其修改前后的总权重相同。
]
#question[
    Let $G = (V, E, w)$ be an undirected connected weighted graph. Suppose that *$T$ is a minimum spanning tree* of $G$, and *$T'$ is another spanning tree* of $G$. Let *$e$ and $e'$ be maximum-weight edges* in $T$ and $T'$, respectively. Prove that $w(e) <= w(e')$.
]
= 判断分析
#question[
    给定无向加权连通图 $G=(V,E,w)$，以及其一个割 $(X,Y)$。该割导出的子图 $G[X]$ 与 $G[Y]$ 均连通。考虑命题：$G$ 的任一最小生成树 $T$ 包含且仅包含一条穿越割 $(X,Y)$ 的边。该命题正确吗？证明或给出反例。
]
#question[
    对 $G$ 中顶点的 $d, pi$ 进行初始化后，执行若干次松弛操作：
    #grid(
        columns: (1fr, 1fr),
        gutter: 5pt,
        align: top,
        algorithm-figure(smallcaps[Initialize-Single-Source$(G,s)$], supplement: none, {
            import algorithmic: *
            For($"each vertex" u in V[G]$, {
                Assign[$d[u]$][$infinity$]
                Assign[$pi[u]$][NIL]
            })
            Assign[$d[s]$][$0$]
        }),
        algorithm-figure(smallcaps[Relax$(u,v,w)$], supplement: none, {
            import algorithmic: *
            If($d[v]>d[u]+w(u,v)$, {
                Assign[$d[v]$][$d[u]+w(u,v)$]
                Assign[$pi[v]$][$u$]
            })
        }),
    )
    考虑命题：
    #set enum(numbering: "a.")
    + 对于边 $(x,y)$，刚执行完 #smallcaps[Relax $(x,y,w)$] 的瞬间，有 $d[y]<=d[x]+w(x,y)$。
    + 所有松弛操作结束后，若 $pi[y]=x$，则 $d[y]<=d[x]+w(x,y)$。
    上述命题哪个正确、哪个错误？请给出正确命题的证明和错误命题的反例。
]
= 算法设计
#question[
    编号为 $1$ 至 $n$ 的地点分别有已知数量的珠宝 $w_1,w_2,dots.c,w_n$。不同地点间存在单向通道，且通道一定从编号小的地点通往编号大的地点。现在可以从任一地点进入，并沿通道行进至无出边的地点。求能够获得最多珠宝的路线。
    + 变量定义。
    + 变量间的递推表达式。
    + 求解下面实例。
    #figure({
        let edge = edge.with(marks: "-|>")
        diagram(
            node((0, 0), $1$, name: <1>, stroke: 1pt),
            node((0, 1), $3$),
            node((1, 0), $2$, name: <2>, stroke: 1pt),
            node((1, 1), $5$),
            node((2, 0), $3$, name: <3>, stroke: 1pt),
            node((2, 1), $9$),
            node((3, 0), $4$, name: <4>, stroke: 1pt),
            node((3, 1), $4$),
            node((4, 0), $5$, name: <5>, stroke: 1pt),
            node((4, 1), $6$),
            node((5, 0), $6$, name: <6>, stroke: 1pt),
            node((5, 1), $7$),
            node((6, 0), $7$, name: <7>, stroke: 1pt),
            node((6, 1), $2$),
            edge(<1>, <2>),
            edge(<1>, <4>, bend: 40deg),
            edge(<2>, <5>, bend: 40deg),
            edge(<2>, <4>, bend: -40deg),
            edge(<3>, <4>),
            edge(<3>, <6>, bend: -40deg),
            edge(<4>, <5>),
            edge(<4>, <6>, bend: 40deg),
            edge(<5>, <7>, bend: 40deg),
            edge(<6>, <7>),
        )
    })
]
#question[
    I 国的石油管道网络为 $G=(V,E)$。其中 $V$ 的子集 $W$ 包含多个代表油井的顶点，子集 $P$ 包含多个代表港口的顶点，子集 $V-W-P$ 包含多个代表中继节点的顶点。每条边是一根管道，设管道的单位时间运输容量均为 $c(e)=1$。
    #figure({
        let edge = edge.with(marks: "-|>")
        diagram(
            cell-size: 3em,
            node((0, 0), $w_1$, name: <w1>),
            edge("r"),
            edge("rd"),
            node((0, 1), $w_2$, name: <w2>),
            edge("r"),
            edge("ru"),
            node((0, 2), $w_3$, name: <w3>),
            edge("r"),
            edge("ru"),
            node((1, 0), $u_1$, name: <u1>),
            edge("r"),
            node((1, 1), $u_2$, name: <u2>),
            edge("ru"),
            node((1, 2), $u_3$, name: <u3>),
            edge("r"),
            node((2, 0), $u_4$, name: <u4>),
            edge("r"),
            edge("rd"),
            edge("rdd"),
            node((2, 2), $u_5$, name: <u5>),
            edge("r"),
            edge("ru"),
            node((3, 0), $p_1$, name: <p1>),
            node((3, 1), $p_2$, name: <p2>),
            node((3, 2), $p_3$, name: <p3>),
            node(
                enclose: (<w1>, <w2>, <w3>),
                name: <wgroup>,
                inset: 7pt,
                fill: none,
                stroke: (paint: luma(150), thickness: .7pt, dash: "dashed"),
                snap: false,
            ),
            node(
                enclose: (<u1>, <u2>, <u3>, <u4>, <u5>),
                name: <ugroup>,
                inset: 7pt,
                fill: none,
                stroke: (paint: luma(150), thickness: .7pt, dash: "dashed"),
                snap: false,
            ),
            node(
                enclose: (<p1>, <p2>, <p3>),
                name: <pgroup>,
                inset: 7pt,
                fill: none,
                stroke: (paint: luma(150), thickness: .7pt, dash: "dashed"),
                snap: false,
            ),
            node((rel: (0pt, 10pt), to: <wgroup.north>), $W$, stroke: none, inset: 0pt, snap: false),
            node((rel: (0pt, 10pt), to: <ugroup.north>), $V-W-P$, stroke: none, inset: 0pt, snap: false),
            node((rel: (0pt, 10pt), to: <pgroup.north>), $P$, stroke: none, inset: 0pt, snap: false),
        )
    })
    + 敌国想要轰炸最少的管道，使得 I 国的石油出口量为 $0$。设计算法，找出敌国需要破坏的管道列表。
    + 证明 (1) 算法的正确性。
]
