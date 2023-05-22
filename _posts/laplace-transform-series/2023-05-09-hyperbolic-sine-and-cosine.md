---
layout:     series
title:      "Hyperbolic Sine and Cosine"
date:       2023-05-09
categories: blog laplace-transforms
permalink:  ":categories/:title/"
part:       8
series:     laplace-transforms
tags:       laplace-transform, trig, trigonometry, hyperbolic, sine, cosine
---

The hyperbolic trig functions are even easier than the regular ones because they can be decomposed into two real-valued functions. Thus, I will only provide the general result and all other particular results can be derived when needed.

## Hyperbolic Sine

Given function $f(t)$ with Laplace Transform $F(s)$ and constant $b \in \mathbb{R}$

Recall the identity $$\sinh(t) = \frac{e^{t} - e^{-t}}{2}$$.

$$
\begin{align}
    \mathcal{L}\{ f(t) \sin(bt) \}
    &= \mathcal{L} \left \{ f(t) \cdot \frac{1}{2} (e^{bt} - e^{-bt}) \right \} \\[10pt]
    &= \frac{1}{2} \left ( \mathcal{L}\{ f(t) e^{bt} \} - \mathcal{L}\{ f(t) e^{-bt} \} \right ) \\[10pt]
    &= \frac{F(s-b) - F(s+b)}{2}
\end{align}
$$

## Hyperbolic Cosine

Given function $f(t)$ with Laplace Transform $F(s)$ and constant $b \in \mathbb{R}$

Recall the identity $$\cosh(t) = \frac{e^{t} + e^{-t}}{2}$$.

$$
\begin{align}
    \mathcal{L}\{ f(t) \sin(bt) \}
    &= \mathcal{L} \left \{ f(t) \cdot \frac{1}{2} (e^{bt} + e^{-bt}) \right \} \\[10pt]
    &= \frac{1}{2} \left ( \mathcal{L}\{ f(t) e^{bt} \} + \mathcal{L}\{ f(t) e^{-bt} \} \right ) \\[10pt]
    &= \frac{F(s-b) + F(s+b)}{2}
\end{align}
$$