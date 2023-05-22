---
layout:     series
title:      "The Heaviside Step Function"
date:       2023-05-12
categories: blog laplace-transforms
permalink:  ":categories/:title/"
part:       11
series:     laplace-transforms
tags:       laplace-transform, step-function, heaviside-step-function, heaviside, unit-step-function
---

## Background

The Heaviside step function, also called the unit step function, is defined as follows

$$
\theta(t) = \begin{cases}
    1   &\quad\text{if } t > 0 \\
    0   &\quad\text{if } t \leq 0
\end{cases}

\qquad\qquad

\theta(t-c) = \begin{cases}
    1   &\quad\text{if } t > c \\
    0   &\quad\text{if } t \leq c
\end{cases}
$$

## The Laplace Transform Proof

Given a function $f(t)$ with Laplace Transform $F(s)$ and any constant $c \in \mathbb{R}$

$$
\begin{align}
    \mathcal{L}\{ \theta(t-c) f(t-c) \}
    &= \int_{0}^{\infty} \theta(t-c) f(t-c) e^{-st} \ dt \\[10pt]

    &= \int_{0}^{c} 0 \cdot f(t-c) e^{-st} \ dt + \int_{c}^{\infty} f(t-c) e^{-st} \ dt \\[10pt]

    &= \int_{c}^{\infty} f(t-c) e^{-st} \ dt \\[10pt]

    &\text{let } u = t-c \implies du = dt \\[10pt]

    &= \int_{0}^{\infty} f(u) e^{-s(u+c)} \ du \\[10pt]

    &= e^{-cs} \int_{0}^{\infty} f(u) e^{-su} \ du \\[10pt]

    &= e^{-cs} F(s)
\end{align}
$$

This turns out to be very useful because so long as we don't care about the negative values of $f(t)$, translation is very simple. Since in applications, $t$ represents time, this is not an outlandist assumption.