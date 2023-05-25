---
layout:     series
title:      "Derivatives"
date:       2023-05-10
categories: blog laplace-transforms
permalink:  ":categories/:title/"
part:       9
series:     laplace-transforms
tags:       laplace-transform, derivatives
---

In keeping with the notation I've been using throughout the series. Suppose we are function $f(t)$ with Laplace Transform $F(s)$.

## Derivatives of f(t)

Let $f^{(n)}(t)$ denote the $n$th derivative of $f(t)$ with respect to $t$. We will prove the following result using induction on $n \geq 0$ where $f^{(0)}(t) = f(t)$.

$$
\mathcal{L}\{ f^{(n)}(t) \} = s^n F(s) - \sum_{k=0}^{n-1} s^{n-k-1} f^{(k)}(0)
$$

First, checking the base-case $n=0$ gives

$$
s^0 F(s) - \sum_{k=0}^{0-1} s^{0-k-1} f^{(k)}(0) = F(s) = \mathcal{L}\{ f(t) \}
$$

Now, we check the induction step by evaluating $$\mathcal{L}\{ f^{(n+1)}(t) \}$$, assuming that the equation above holds for $$\mathcal{L}\{ f^{(n)}(t) \}$$.

$$
\begin{align}
    \mathcal{L}\{ f^{(n+1)}(t) \}
    &= \int_{0}^{\infty} f^{(n+1)}(t) e^{-st} \; dt \qquad \text{(using integration by parts)} \\[10pt]
    &= f^{(n)}(t)e^{-st} \biggr\rvert_{0}^{\infty} - \int_{0}^{\infty} f^{(n)}(t) (-s \cdot e^{-st}) \; dt \\[10pt]
    &= \left( \lim_{t \rightarrow \infty} f^{(n)}(t) e^{-st} \right ) - f^{(n)}(0) + s \int_{0}^{\infty} f^{(n)}(t) \cdot e^{-st} \; dt \\[10pt]
    &\text{assuming } f^{(n)}(t) = o(e^t) \text{ as otherwise the Lapalce Transform would not exist} \\[10pt]
    &= s \cdot \mathcal{L}\{ f^{(n)}(t) \} - f^{(n)}(0) \\[10pt]
    &= s \cdot \left [ s^n F(s) - \sum_{k=0}^{n-1} s^{n-k-1} f^{(k)}(0) \right ] - f^{(n)}(0) \\[10pt]
    &= s^{n+1} F(s) - \sum_{k=0}^{n-1} s^{n-k} f^{(k)}(0) - s^0 f^{(n)}(0) \\[10pt]
    &= s^{n+1} F(s) - \sum_{k=0}^{n} s^{n-k} f^{(k)}(0)
\end{align} 
$$

<br>

## Derivatives of F(s)

Let $F^{(n)}(s)$ denote the $n$th derivative of $F(s)$ with respect to $s$. We will prove the following result using induction on $n \geq 0$ where $F^{(0)}(s) = F(s)$.

$$
\mathcal{L}\{ t^n f(t) \} = (-1)^n F^{(n)}(s)
$$

First, checking the base-case $n=0$ gives

$$
(-1)^0 F^{(0)}(s) = F(s) = \mathcal{L}\{ f(t) \}
$$

Now, we check the induction step by evaluating $$\mathcal{L}\{ t^{n+1} f(t) \}$$, assuming that the equation above holds for $$\mathcal{L}\{ t^n f(t) \}$$.

$$
\begin{align}
    (-1)^{n+1} F^{(n+1)}(s) 
    &= - \frac{d}{ds} \left [ (-1)^{n} F^{(n)}(s) \right ] \\[10pt]
    &= - \frac{d}{ds} \mathcal{L}\{ t^n f(t) \} \\[10pt]
    &= - \frac{d}{ds} \int_{0}^{\infty} t^n f(t) e^{-st} \; dt \\[10pt]
    &= - \int_{0}^{\infty} t^n f(t) \left( \frac{\partial}{\partial s} e^{-st} \right ) \; dt \\[10pt]
    &= - \int_{0}^{\infty} t^n f(t) \left( -t \cdot e^{-st} \right ) \; dt \\[10pt]
    &= \int_{0}^{\infty} t^{n+1} f(t) e^{-st} \; dt \\[10pt]
    &= \mathcal{L}\{ t^{n+1} f(t) \}
\end{align} 
$$

Note that we have to assume that f(t) is continuous in order to interchange the derivative and the integral.
