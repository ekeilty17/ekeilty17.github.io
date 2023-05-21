---
layout:     series
title:      "Sine, Cosine, and Any Function"
date:       2023-05-08
categories: blog laplace-transform
permalink:  ":categories/:title/"
part:       7
series:     laplace-transform
tags:       laplace-transform, trig, trigonometry, sine, cosine
---

## General Formula

Given function $f(t)$ with Laplace Transform $F(s)$ and constant $b \in \mathbb{R}$

Recall the identity $$\sin(t) = \frac{e^{it} - e^{-it}}{2i}$$.

$$
\begin{align}
    \mathcal{L}\{ f(t) \sin(bt) \}
    &= \mathcal{L} \left \{ f(t) \cdot \frac{1}{2i} (e^{ibt} - e^{-ibt}) \right \} \\[10pt]
    &= \frac{1}{2i} \left ( \mathcal{L}\{ f(t) e^{ibt} \} - \mathcal{L}\{ f(t) e^{-ibt} \} \right ) \\[10pt]
    &= \frac{F(s-ib) - F(s+ib)}{2i}
\end{align}
$$


Recall the identity $$\cos(t) = \frac{e^{it} + e^{-it}}{2}$$.

$$
\begin{align}
    \mathcal{L}\{ f(t) \cos(bt) \}
    &= \mathcal{L} \left \{ f(t) \cdot \frac{1}{2} (e^{ibt} + e^{-ibt}) \right \} \\[10pt]
    &= \frac{1}{2} \left ( \mathcal{L}\{ f(t) e^{ibt} \} + \mathcal{L}\{ f(t) e^{-ibt} \} \right ) \\[10pt]
    &= \frac{F(s-ib) + F(s+ib)}{2}
\end{align}
$$

## Discussion

Notice that the above result agrees with the special case we proved for $f(t) = t^n$. However, this proof is a bit unrigorous because $$\mathcal{L} \{ \cdot \}$$ is supposed to take a real-valued function as input, yet we decomposed it into two complex-valued functions. 

However, since this derivation holds for any polynomial (proved rigorously in the previous post), then it should also hold for any analytic function, i.e. is equal to its power series representation.