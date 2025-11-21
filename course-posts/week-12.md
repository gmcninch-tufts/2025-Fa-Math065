---
title   : Week 12
date    : 2025-11-17
---

This week, we are going to begin our discuss of graphs.

- [lecture notes](/course-content/bridge-to-higher-math.pdf)  (Week 12 material begins on p. 88).

- [ps 12](/course-content/2025-11-24--ps-12.pdf)

  I've removed problem 6 from this homework set, because it asked you
  to prove something that wasn't true. Apologies for this -- I think I
  got in a hurry when preparing the assignment, and forgot to go back
  and check that last problem.
  
  Here is what I should have asked (!) (I'm only writing this for
  explanatory purposes -- this is not part of the assignment!)
  
  > Let $\Gamma = (V,E)$ be a directed graph. Recall that for $a,b \in
  > V$, an edge $[a,b]$ is directed, so that $a \not =  b => [a,b]
  > \not = [b,a]$.

  > A *source vertex* is a vertex $a \in V$ such that any
  > edge $e \in E$ incident to $a$ has the form $[a,x]$ for some $x \in
  > V$.

  > Similarly, a *sink vertex* is a vertex $b \in V$ such
  > that any edge $e \in E$ incident with $b$ has the form $[y,b]$ for some
  > $y \in V$.

  > Suppose that there are $m$ source vertices $V_0$ and $n$ sink
  > vertices $V_1$. 
  
  > Define a subset $E \subseteq V_0 \times V_1$ by
  > $$E = \{ (a.b) \in V_0 \times V_1  | \text{there is path in $\Gamma$ from $a$ to $b$}\}.$$
  
  > Show that $(V_0 \cup V_1,E)$ is a subgraph of 
  >  $K_{m,n}$, the complete bi-partite graph of type $(m,n)$.

