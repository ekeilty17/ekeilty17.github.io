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

To start off, we will prove some easy general properties of Laplace transforms, which will be helpful later on.

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

<br>

## Scaling

Given function $f(t)$ with Laplace transform $F(s)$ and constant $b \in \mathbb{R}$ such that $b > 0$

$$
\begin{align}
    \mathcal{L}\{ f(bt) \}
    &= \int_{0}^{\infty} f(bt) \cdot e^{-st} \; dt \\[10pt]
    &\text{let } u = bt \implies du = b \cdot dt \\[10pt]
    &= \int_{0}^{\infty} f(u) e^{-s(u/b)} \; \left ( \frac{1}{b} du \right ) \\[10pt]
    &= \frac{1}{b} \int_{0}^{\infty} f(u) e^{-(s/b)u} \; du \\[10pt]
    &= \frac{1}{b} F(s/b)
\end{align}
$$

The reason we had to assume $b > 0$ is because we need $(u/b)$ to tend towards infinty in order to be consistent with the definition of Laplace transforms. If $b < 0$ then there would be an implicit negative sign.

<br>

Given function $f(t)$ with Laplace transform $F(s)$ and constant $b \in \mathbb{R}$ such that $b > 0$

$$
\begin{align}
    \mathcal{L}\{ f(-bt) \}
    &= \int_{0}^{\infty} f(-bt) \cdot e^{-st} \; dt \\[10pt]
    &\text{let } u = -bt \implies du = -b \cdot dt \\[10pt]
    &= \int_{0}^{\infty} f(u) e^{-s(u/-b)} \; \left ( -\frac{1}{b} du \right ) \\[10pt]
    &= -\frac{1}{b} \int_{0}^{\infty} f(u) e^{-(-s/b)u} \; du \\[10pt]
    &= -\frac{1}{b} F(-s/b)
\end{align}
$$

<br>

We can summarize the results as the following. Given function $f(t)$ with Laplace transform $F(s)$ and constant $b \in \mathbb{R}$ such that $b \neq 0$.

$$
\mathcal{L}\{ f(bt) \} = \frac{1}{\lvert b \rvert} F(s/b)
$$

Or written another way

$$
\mathcal{L}\{ f(t/b) \} = \lvert b \rvert F(bs)
$$

To take a special case, we also have 

$$
\mathcal{L}\{ f(-t) \} = F(-s)
$$

<br>

## Translation

Given function $f(t)$ and constant $c \in \mathbb{R}$

$$
\begin{align}
    \mathcal{L}\{ f(t-c) \}
    &= \int_{0}^{\infty} f(t-c) \ e^{-st} \; dt \\[10pt]
    &\text{let } u = t-c \implies du = dt \\[10pt]
    &= \int_{-c}^{\infty} f(u) e^{-s(u+c)} \; du \\[10pt]
    &= \int_{-c}^{0} f(u) e^{-s(u+c)} \; du + e^{-cs}\int_{0}^{\infty} f(u) e^{-su} \; du \\[10pt]
    &= \int_{-c}^{0} f(u) e^{-su} \; du + e^{-cs}\mathcal{L}\{ f(t) \}
\end{align}
$$

If we assume that $f(t) = 0 \quad \forall t < 0$, then the left integral goes away, and we get

$$
\mathcal{L}\{ f(t-c) \} = e^{-cs}\mathcal{L}\{ f(t) \}
$$

For functions that do not meet this assumption, we can use the step function. We derive this result in a [later post](/blog/laplace-transforms/the-heaviside-step-function/).

<br>

## Complex Conjugation

Recall that $f(t)$ produces a complex output. Thus, let $f^*(t)$ denote the complex conjugate of the output. Given Given function $f(t)$ with Laplace transform $F(s)$

$$
\begin{align}
    \mathcal{L}\{ f^*(t) \}
    &= \int_{0}^{\infty} f^*(t) \ e^{-st} \; dt \\[10pt]
    &= \int_{0}^{\infty} \left [ f(t) \ e^{-s^*t} \right ]^* \; dt \\[10pt]
    &= \left [ \int_{0}^{\infty} f(t) \ e^{-s^*t} \; dt \right ]^* \\[10pt]
    &= F^* (s^*)
\end{align}
$$