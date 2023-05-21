---
layout:     series
title:      "Exponentials"
date:       2023-05-05
categories: blog laplace-transform
permalink:  ":categories/:title/"
part:       4
series:     laplace-transform
tags:       laplace-transform, exponentials
---

## Translation of Inverse Laplace Transforms

Given function $f(t)$ with Laplace Transform $F(s)$ and constant $b \in \mathbb{R}$

$$
\begin{align}
    \mathcal{L}\{ e^{bt}f(t) \}
    &= \int_{0}^{\infty} e^{bt}f(t) \cdot e^{-st} \; dt \\[10pt]
    &= \int_{0}^{\infty} f(t) e^{-(s-b)t} \; dt \\[10pt]
    &= F(s-b)
\end{align}
$$

This is a really nice property that is extremely useful for inverse Laplace Transforms. This property also effectively solves any function f(t) that involves an exponential. For example, applying this result to polynomials gives us

$$\mathcal{L} \{ e^{bt} \} = \frac{1}{s-b}$$

$$ \mathcal{L} \{ e^{bt}t^n \} = \frac{n!}{(s-b)^{n+1}}$$ 

$$ \mathcal{L} \left \{ e^{bt} \sum_{k=0}^n a_k t^k \right \} = \sum_{k=0}^n \frac{k! \ a_k}{(s-b)^{k+1}}$$


## Translation in the Exponent

Notice that $$e^{bt+c} = e^c \cdot e^{bt}$$, so 

$$\mathcal{L}\{ e^{bt+c}f(t) \} = e^c \cdot F(s-b)$$