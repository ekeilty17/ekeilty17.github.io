---
layout:     series
title:      "Continuity Invariants"
date:       2022-10-10
categories: blog limits-and-continuity
permalink:  ":categories/:title/"
part:       9
series:     limits-and-continuity
tags:       limits, continuity, delta-epsilon, continuity, addition, subtraction, multiplication, division, reciprocal
---

Using the all of the previous limit laws that we have proved, we can show that continuity is preserved by the standard arithmetic operations. Let $c, r, a, b \in \mathbb{R}$ be any constants with $b > 1$. If $f(x)$ and $g(x)$ are continuous, then the following are also continuous.
* $(f + g)(x)$
* $(f - g)(x)$
* $(c \cdot f)(x)$
* $(f \cdot g)(x)$
* $(1 / f)(x)$
* $(f / g)(x)$
* $(f^r)(x)$
* $(a^f)(x)$
* $(f^g)(x)$
* $(\log_b f)(x)$
* $(f \circ g)(x)$

In particular, since $f(x) = x$ is continuous, this means that all polynomials are continuous. Also, functions of the form $\displaystyle \frac{P(x)}{Q(x)}$ where $P(x)$ and $Q(x)$ are polynomials are continuous. This is an important fact used often in calculus.

<br>

This provides insight as to why continuity is so important. Continuous functions behave in an intuitive way. A _well-behaved_ typically refers to a smooth, continuous function. 