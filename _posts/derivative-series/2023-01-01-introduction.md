---
layout:     series
title:      "Introduction"
date:       2023-01-01
categories: blog derivative-proofs
permalink:  ":categories/:title/"
part:       0
series:     derivative-proofs
tags:       derivatives
---

**TODO**

* need to give the definition of limits
* need to give limit properties, i.e. can distribute across addition, multiplication, etc. Just assert them as fact, and say I will prove them when I do a series on continuity.

## Limit Laws



Let $f$ and $g$ be functions. Let $c \in \mathbb{R}$ be any constant.

$$
\lim_{x \rightarrow a} (c \cdot f(x)) = c \cdot \left ( \lim_{x \rightarrow a} f(x) \right ) \\[10pt]
\lim_{x \rightarrow a} (f(x) + g(x)) = \left ( \lim_{x \rightarrow a} f(x) \right ) + \left ( \lim_{x \rightarrow a} g(x) \right ) \\[10pt]
\lim_{x \rightarrow a} (f(x) - g(x)) = \left ( \lim_{x \rightarrow a} f(x) \right ) - \left ( \lim_{x \rightarrow a} g(x) \right ) \\[10pt]
\lim_{x \rightarrow a} (f(x) \cdot g(x)) = \left ( \lim_{x \rightarrow a} f(x) \right ) \cdot \left ( \lim_{x \rightarrow a} g(x) \right ) \\[10pt]
$$

Suppose $\lim_{x \rightarrow a} g(x) \neq 0$, then

$$
\lim_{x \rightarrow a} \frac{f(x)}{g(x)} = \frac{ \lim_{x \rightarrow a} f(x) }{ \lim_{x \rightarrow a} g(x) } \\[10pt]
$$

Let $n, m \in \mathbb{N}$ such that $m > 0$. If $m$ is even, then assume $\lim_{x \rightarrow a} f(x) > 0$.

$$
\lim_{x \rightarrow a} (f(x))^{n/m} = \left ( \lim_{x \rightarrow a} f(x) \right )^{n/m}
$$

If $f$ is continuous, then 

$$
\lim_{x \rightarrow a} f(x) = f(a) \\[10pt]
\lim_{x \rightarrow a} f(g(x)) = f \left ( \lim_{x \rightarrow a} g(x) \right ) \\[10pt]
$$