---
layout:     series
title:      "The Dirac Delta Function"
date:       2023-05-13
categories: blog laplace-transforms
permalink:  ":categories/:title/"
part:       12
series:     laplace-transforms
tags:       laplace-transform, delta-function, dirac-delta-step-function, dirac, unit-impulse-function
---

## Background

The Dirac delta function, also called the unit impulse function, is a bit weird. It's defined by two properties. First, it's value is $0$ everywhere except at the impulse point.

$$
\delta(t) = \begin{cases}
    1   &\quad\text{if } t = 0 \\
    0   &\quad\text{otherwise}
\end{cases}

\qquad\qquad

\delta(t-c) = \begin{cases}
    1   &\quad\text{if } t = c \\
    0   &\quad\text{otherwise}
\end{cases}
$$

Second, So long as the impulse point is within the bounds of integration, the integral will be $1$, otherwise it is $0$. More generally, we write

$$
\int_{a}^{b} \delta(t) f(t) \ dt  = \begin{cases}
    f(0)    &\quad\text{if } a \leq 0 \leq b \text{ and } a \neq b  \\
    -f(0)   &\quad\text{if } b \leq 0 \leq a \text{ and } a \neq b  \\
    0       &\quad\text{otherwise}
\end{cases}

\qquad\qquad

\int_{a}^{b} \delta(t-c) f(t) \ dt = \begin{cases}
    f(c)    &\quad\text{if } a \leq c \leq b \text{ and } a \neq b \\
    -f(c)   &\quad\text{if } b \leq c \leq a \text{ and } a \neq b  \\
    0       &\quad\text{otherwise}
\end{cases}
$$

You can think about this function defining a rectangle with an infinitesimally small width. Thus, the area under $\delta(t-c) f(t)$ will just be the height of the function at $c$.

## The Laplace Transform Proof

Given a function $f(t)$ with Laplace Transform $F(s)$ and any constant $c, d \in \mathbb{R}$.

$$
\mathcal{L}\{ \delta(t-c) f(t-d) \}
= \int_{0}^{\infty} \delta(t-c) f(t-d) e^{-st} \ dt
= \begin{cases}
    e^{-cs} f(c-d)  &\quad\text{if } c \geq 0 \\
    0               &\quad\text{otherwise}
\end{cases}


$$
