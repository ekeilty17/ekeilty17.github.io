---
layout:     series
title:      "Constant and Identity Functions"
date:       2022-10-03
categories: blog limits-and-continuity
permalink:  ":categories/:title/"
part:       2
series:     limits-and-continuity
tags:       limits, continuity, delta-epsilon, constants, identity
---

## Constant Functions

Starting off with an easy one, we want to prove that for any constants $c \in \mathbb{R}$, we have

$$
\lim_{x \rightarrow a} c = c
$$

Notice that 

$$
\lvert c - c \rvert = 0
$$

Therefore, the statement

$$
\forall \epsilon > 0 \quad \exists \delta > 0 \quad \text{s.t.} \quad 0 < \lvert x - a \rvert < \delta \implies \lvert c - c \rvert < \epsilon
$$

is trivially true. Therefore, constant functions are continuous.


<br>


## Identity Functions

Another simple proof, we want to show that 

$$
\lim_{x \rightarrow a} x = a
$$

Fix any $\epsilon > 0$ and let $\delta = \epsilon$, then

$$
\exists \delta > 0 \quad \text{s.t.} \quad 0 < \lvert x - a \rvert < \delta \implies \lvert x - a \rvert < \epsilon
$$

which proves the result. Therefore, the identity function is continuous.