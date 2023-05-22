---
layout:     series
title:      "Properties"
date:       2023-05-02
categories: blog laplace-transforms
permalink:  ":categories/:title/"
part:       1
series:     laplace-transforms
tags:       laplace-transform, properties, constant
---

We are going to prove some quick and dirty properties of Laplace Transforms, which will be helpful later on.

## Linearity

Given function $f(t), g(t)$ and constants $\alpha, \beta \in \mathbb{C}$

$$
\begin{align}
    \mathcal{L}\{ \alpha f(t) \ \pm \ \beta g(t) \} 
    &= \int_{0}^{\infty} (\alpha f(t) \pm \beta g(t)) \cdot e^{-st} \; dt \\[10pt]
    &= \alpha \int_{0}^{\infty} f(t) \cdot e^{-st} \; dt \ \pm \ \beta \int_{0}^{\infty} g(t) \cdot e^{-st} \; dt \\[10pt]
    &= \alpha \mathcal{L}\{ f(t) \}  \ \pm \ \beta \mathcal{L}\{ g(t) \} 
\end{align}
$$



## Scaling

Given function $f(t)$ with Laplace Transform $F(s)$ and constant $b \in \mathbb{R}$ such that $b \neq 0$

$$
\begin{align}
    \mathcal{L}\{ f(bt) \}
    &= \int_{0}^{\infty} f(bt) \cdot e^{-st} \; dt \\[10pt]
    &\text{let } u = bt \implies du = b \cdot dt \\[10pt]
    &= \int_{0}^{\infty} f(u) e^{-su/b} \; \frac{1}{b} du \\[10pt]
    &= \frac{1}{b} F(s/b)
\end{align}
$$

Written another way, we could expression this rule as $$\mathcal{L}\{ f(t/b) \} = bF(bs)$$

## Translation

Unfortunately, there does not seem to be a nice way to simplify $f(t-c)$, but this is the closest that I can get.

Given function $f(t)$ and constant $c \in \mathbb{R}$

$$
\begin{align}
    \mathcal{L}\{ f(t-c) \}
    &= \int_{0}^{\infty} f(t-c) \ e^{-s(t-c)} \; dt \\[10pt]
    &\text{let } u = t-c \implies du = dt \\[10pt]
    &= \int_{-c}^{\infty} f(u) e^{-su} \; du \\[10pt]
    &= \int_{-c}^{0} f(u) e^{-su} \; du + \int_{0}^{\infty} f(u) e^{-su} \; du \\[10pt]
    &= \int_{-c}^{0} f(u) e^{-su} \; du + \mathcal{L}\{ f(t) \}
\end{align}
$$

This is somewhat useful, but not really. There is another version of the translation rule that involves step functions where we do get a nice result, which we will do later. Due to this, we don't really concern ourselves with the Laplace Transforms of translations.