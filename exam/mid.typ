#import "@preview/ezexam:0.3.1": *
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
#show strong: it => text(weight: "bold", it)
#set par(justify: true)

#let Title = "山东大学计算机科学与技术学院算法设计与分析期中考试"
#let author = "arshtyi"
#let date = datetime.today()
#set document(title: Title, date: date, author: author)
#title(Title)
#exam-info(info: (
    班级: "24数据·24智能",
    教师: "姜海涛",
    时间: datetime(year: 2026, month: 4, day: 28).display("[year].[month].[day]") + "（W9）",
    源码: link("https://github.com/arshtyi/SDU-Algorithm-Design-And-Analysis", "link"),
))

= 计算

#question[
    给出下图中的强连通分支：
    #figure(diagram(
        node-stroke: 1pt,
        node((0, 0), `s`),
        edge("-|>"),
        node((1, 0), `t`),
        edge("-|>"),
        edge("-|>", "ld"),
        edge("-|>", "d"),
        node((2, 0), `u`),
        edge("-|>", "ld"),
        edge("-|>"),
        edge("-|>", "d"),
        node((3, 0), `v`),
        edge("-|>", "ld"),
        node((0, 1), `w`),
        edge("-|>", "u"),
        edge("-|>"),
        node((1, 1), `x`),
        edge("-|>"),
        node((2, 1), `y`),
        edge("-|>"),
        node((3, 1), `z`),
        edge("-|>", "lu"),
        edge("-|>", "u"),
    ))
]

= 证明

#question[
    Let $G = (V, E, w)$ be an undirected connected weighted graph, *$T$ is a minimum spanning tree* of $G$, and *$T'$ is some other spanning tree* of $G$. Suppose that *$e$ and $e'$ are the maximum weight edges* in $T$ and $T'$ respectively. Prove that: $w(e) <= w(e')$.
]

= 判断分析

#question[
    考虑命题：给定无向加权连通图$G = (V, E, w)$，令$S$为任意节点子集$(0 < lr(bar.v S bar.v) < lr(bar.v V bar.v))$。令边$e = (u, v)$是穿过割$(S, V - S)$的唯一最小权边。则：
    + 任意最小生成树$T$都包含边$e$。
    + 任意最小生成树只包含一条穿过割$(S, V - S)$的边。
    *以上结论是否正确？请证明或反例说明。*
]

= 算法设计

#question[
    给定无向加权树$T = (V, E, w), forall u, v in V$，设$P$为$T$上$u, v$的简单路，定义$u, v$间带宽为$"Bandwidth"(u, v) = min_((x, y) in P) w(x, y)$，设$s$为源点。设计算法求出$s$到任意节点的带宽并分析复杂度。
]
