---
layout:     series
title:      "Periodic Functions"
date:       2023-05-14
categories: blog laplace-transforms
permalink:  ":categories/:title/"
part:       13
series:     laplace-transforms
tags:       laplace-transform, periodic-functions, periodicity
---

## Background

We say $f(t)$ is $T$-periodic if $f(t+T) = f(t) \quad \forall t \in \mathbb{R}$

An interesting fact is that if $T$ is irrational, then $f$ must be a constant function. Thus, you can restrict $T \in \mathbb{N}$ for all non-trivial cases. However, this will not affect our proof.

## The Laplace Transform Proof

Given a $T$-periodic function $f(t)$

$$
\begin{align}
    \mathcal{L}\{ f(t) \} 
    &= \int_{0}^{\infty} f(t) e^{-st} \ dt \\[10pt]

    &= \int_{0}^{T} f(t) e^{-st} \ dt + \int_{T}^{\infty} f(t) e^{-st} \ dt \\[10pt]

    &\text{let } \tau = t - T \implies dt = d\tau \\[10pt]

    &= \int_{0}^{T} f(t) e^{-st} \ dt + \int_{0}^{\infty} f(\tau+T) e^{-s(\tau+T)} \ d\tau \\[10pt]

    &= \int_{0}^{T} f(t) e^{-st} \ dt + e^{-sT}\int_{0}^{\infty} f(\tau) e^{-s\tau} \ d\tau \\[10pt]

    &= \int_{0}^{T} f(t) e^{-st} \ dt + e^{-sT}\mathcal{L}\{ f(t) \}    
\end{align}
$$

Now, we do a little algebra to isolate $\mathcal{L}\{ f(t) \}$, and we get

$$
\mathcal{L}\{ f(t) \} = \frac{1}{1-e^{-sT}} \int_{0}^{T} f(t) e^{-st} \ dt
$$

