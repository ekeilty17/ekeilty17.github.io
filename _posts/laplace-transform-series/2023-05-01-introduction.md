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

## Definition of the Laplace Transform

Given a function $f: \mathbb{R} \rightarrow \mathbb{R}$ and a complex number $s$, we wish to compute

$$\mathcal{L}\{ f(t) \} = F(s) = \int_{0}^{\infty} f(t)e^{-st} \; dt$$

Notice we have two different notations to represent the Laplace Transform. This is because sometimes we want to represent properties in terms of $t$ and sometimes in terms of $s$. Also, typically we have to specify a condition on $s$ for which the Laplace Transform exists.

Laplace Transforms have a lot of interesting applications. But as a true mathematician, I am just interested in computing them because I think the proofs are interesting in and of themselves.

## Integration by Parts

A very common trick will be to use integration by parts to evaluate the integral. Recall this is often written as follows

$$
\int_{a}^{b} u \ dv = uv \biggr\rvert_{a}^{b} - \int_{a}^{b} v \ du 
$$

In our context, we will almost always implement it in the following way, where $u = f(t)$ and $dv = e^{-st}$.

<br>

$$
\begin{align}
    \int_{0}^{\infty} f(t)e^{-st} \ dt 
    &= f'(t) \cdot \left ( - \frac{1}{s} e^{-st} \right ) \biggr\rvert_{0}^{\infty} + \frac{1}{s} \int_{0}^{\infty} f'(t)e^{-st} \ dt \\[10pt]
    &= \frac{1}{s} f(0) - \frac{1}{s} \lim_{t \rightarrow \infty} f(t)e^{-st} + \frac{1}{s} \int_{0}^{\infty} f'(t)e^{-st} \ dt
\end{align}
$$

<br>

We do this because integrating exponentials doesn't change anything, but differentiating $f(t)$ will usually simplify things.