---
layout:     series
title:      "Exponentials"
date:       2023-05-05
categories: blog laplace-transforms
permalink:  ":categories/:title/"
part:       4
series:     laplace-transforms
tags:       laplace-transform, exponentials
---

## Translation of Inverse Laplace Transforms

Given function $f(t)$ with Laplace transform $F(s)$ and constant $\alpha \in \mathbb{C}$

$$
\begin{align}
    \mathcal{L}\{ e^{\alpha t}f(t) \}
    &= \int_{0}^{\infty} e^{\alpha t}f(t) \cdot e^{-st} \; dt \\[10pt]
    &= \int_{0}^{\infty} f(t) e^{-(s-\alpha)t} \; dt \\[10pt]
    &=\text{assme that } \lvert s \rvert > \lvert \alpha \rvert \text{ as otherwise the integral will not converge} \\[10pt]
    &= F(s-\alpha)
\end{align}
$$

This is a really nice property that is extremely useful for inverse Laplace transforms. This property also effectively solves any function f(t) that involves an exponential. For example, applying this result to polynomials gives us

$$\mathcal{L} \{ e^{\alpha t} \} = \frac{1}{s-\alpha}$$

$$ \mathcal{L} \{ e^{\alpha t}t^n \} = \frac{n!}{(s- \alpha)^{n+1}}$$ 

$$ \mathcal{L} \left \{ e^{\alpha t} \sum_{k=0}^n a_k t^k \right \} = \sum_{k=0}^n \frac{k! \ a_k}{(s- \alpha)^{k+1}}$$

<br>

## Translation in the Exponent

Notice that $$e^{\alpha t + \beta} = e^{\beta} \cdot e^{\alpha t}$$, so in general we have

$$\mathcal{L}\{ e^{\alpha t + \beta}f(t) \} = e^{\beta} \cdot F(s-\alpha)$$