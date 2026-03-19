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
= No.1
#question()[
    (_22.2-2_)Show the $d$ and $pi$ values that result from running breadth-first search on the undirected graph of Figure 22.3, using vertex $u$ as the source.
]

#question()[
    (_22.2-8_)The _#text(weight: "bold")[diameter]_ of a tree $T=(V,E)$ is defined as $max_(u,v in V) delta(u, v)$, that is, the largest of all shortest-path distances in the tree. Give an efficient algorithm to compute the diameter of a tree, and analyze the running time of your algorithm.
]
