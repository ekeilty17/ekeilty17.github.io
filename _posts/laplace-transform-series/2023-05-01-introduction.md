---
layout:     series
title:      "Introduction"
date:       2023-05-02
categories: blog laplace-transforms
permalink:  ":categories/:title/"
part:       0
series:     laplace-transforms
tags:       laplace-transform
---

## Purpose of this Series

Laplace transforms have a lot of interesting applications (some of which I may discuss). But as a true mathematician, I am only interested in computing them. I think the proofs are interesting in and of themselves and require some nice integration tricks.

Also, I believe that the tables and proofs of Laplace transforms found online lack clarity and rigour, are not precise in what has been assumed while evaluating the Laplace transform. In this series, I hope to remedy this.

<br>

## Definition of the Laplace Transform

Given a function $f: \mathbb{R} \rightarrow \mathbb{C}$ and a complex number $s$, we wish to compute

$$\mathcal{L}\{ f(t) \} = F(s) = \int_{0}^{\infty} f(t)e^{-st} \; dt$$

This is called the **unilateral Laplace Transform**. There is also a bilateral version where the integral bounds are from $-\infty$ to $\infty$. However, in this series I will focus on the unilateral definition as the bilateral case can be easily derived from it.

Notice we have two different notations to represent the Laplace transform. $$\mathcal{L}\{ \cdot \}$$ is the Laplace transform operator which takes a function as input and produces a function as output. $F: \mathbb{C} \rightarrow \mathbb{C}$ is the resulting Laplace transform function. Throughout the series I will use both notations interchargably because sometimes I will want to represent properties in terms of $t$ and other times in terms of $s$. Also, typically we have to specify a condition on $s$ for which the Laplace transform exists.

<br>

## Integration by Parts

A very common trick will be to use integration by parts. This rule is often written as follows.

$$
\int_{a}^{b} u \ dv = uv \biggr\rvert_{a}^{b} - \int_{a}^{b} v \ du 
$$

In our context, we will almost always set $u = f(t)$ and $dv = e^{-st}$. We do this because integrating exponentials doesn't change anything, but differentiating $f(t)$ will usually simplify things.

In order to shorten later proofs, I will pre-compute the result of applying this rule.

$$
\begin{align}
    \int_{0}^{\infty} f(t)e^{-st} \ dt 
    &= f'(t) \cdot \left ( - \frac{1}{s} e^{-st} \right ) \biggr\rvert_{0}^{\infty} + \frac{1}{s} \int_{0}^{\infty} f'(t)e^{-st} \ dt \\[10pt]
    &= \frac{1}{s} f(0) - \frac{1}{s} \lim_{t \rightarrow \infty} f(t)e^{-st} + \frac{1}{s} \int_{0}^{\infty} f'(t)e^{-st} \ dt
\end{align}
$$
